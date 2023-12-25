(*
 *******************************************************************************
 *
 * Copyright (c) 2020 Robert Jędrzejczyk
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 *******************************************************************************
 *)

{$I ..\..\source\compiler.inc}

unit MainFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PasLibVlcUnit;

const
  PIPE_BUFF_SIZE = 1024;
  
type
  TPipeServer = class(TThread)
  private
    FOverlapped : Boolean;
    FStream     : TStream;
    FPipeName   : string;
    hEvent      : THandle;
    hPipe       : THandle;
    oOverlap    : TOverlapped;
    fPendingIO  : BOOL;
    dwState     : DWORD;
    cbToWrite   : DWORD;
    cbWritten   : DWORD;
    fSuccess    : BOOL;
    dwWait      : DWORD;
    chBuff      : packed array[0..PIPE_BUFF_SIZE-1] of byte;
    procedure Execute_non_overlapped();
    procedure Execute_overlapped();
  protected
    procedure Execute(); override;
  public
    constructor Create(AStream : TStream; pipeName : string; AOverlapped : Boolean = TRUE);
    destructor Destroy; override;
  end;
  
type
  TMainForm = class(TForm)
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    pname : string;
    stream : TFileStream;
    server : TPipeServer;
    p_li : libvlc_instance_t_ptr;
    p_mi : libvlc_media_player_t_ptr;
  public
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

constructor TPipeServer.Create(AStream : TStream; pipeName : string; AOverlapped : Boolean = TRUE);
var
  dwPipeMode : DWORD;
begin
  inherited Create(TRUE);
  FStream   := AStream;
  FPipeName := pipeName;

  FOverlapped := AOverlapped;

  dwPipeMode := PIPE_ACCESS_OUTBOUND;
  
  if FOverlapped then
  begin
    FillChar(oOverlap, sizeof(oOverlap), 0);
    hEvent := CreateEvent(NIL, TRUE, TRUE, NIL);
    oOverlap.hEvent := hEvent;
    dwPipeMode := dwPipeMode or FILE_FLAG_OVERLAPPED;
  end;

  hPipe := CreateNamedPipe(
    PChar(FPipeName),
    dwPipeMode,
    PIPE_TYPE_MESSAGE or
    PIPE_WAIT,
    1,
    PIPE_BUFF_SIZE,
    PIPE_BUFF_SIZE,
    50,
    NIL);
end;

destructor TPipeServer.Destroy;
begin
  CloseHandle(hPipe);
  if (FOverlapped) then
  begin
    CloseHandle(hEvent);
  end;
  
  inherited Destroy;
end;

procedure TPipeServer.Execute_non_overlapped;
var
  bConn : Bool;
begin
  bConn := FALSE; 

  while not Terminated do
  begin
    bConn := ConnectNamedPipe(hPipe, NIL);
    if bConn then break;
    if (GetLastError() = ERROR_PIPE_CONNECTED) then
    begin
      bConn := TRUE;
      break;
    end;
  end;

  if bConn then
  begin
    while not Terminated do
    begin
      cbToWrite := FStream.Read(chBuff, PIPE_BUFF_SIZE);
      if (cbToWrite < 1) then break;
      fSuccess := WriteFile(
         hPipe,
         chBuff,
         cbToWrite,
         cbWritten,
         NIL);
       if (not fSuccess) then break;
       if (cbToWrite <> cbWritten) then break;
    end;
  end;
end;

procedure TPipeServer.Execute_overlapped;
begin
  if (ConnectNamedPipe(hPipe, @oOverlap)) then exit;

  cbToWrite := 0;
  fPendingIO := FALSE;

  case GetLastError() of
    ERROR_IO_PENDING     : fPendingIO := TRUE;
    ERROR_PIPE_CONNECTED : if (not SetEvent(oOverlap.hEvent)) then exit;
  end;

  if (fPendingIO) then dwState := 0 else dwState := 1;
  
  while not Terminated do
  begin
    dwWait := WaitForSingleObject(hEvent, 50);
    if (dwWait = WAIT_TIMEOUT) then continue;
    if (dwWait <> WAIT_OBJECT_0) then break;

    if (fPendingIO) then
    begin
      fSuccess := GetOverlappedResult(hPipe, oOverlap, cbWritten, FALSE);

      if not fSuccess then break;

      if (dwState = 1) then
      begin
        if (cbWritten <> cbToWrite) then break;
      end;
      
      if (dwState = 0) then
      begin
        dwState := 1;
      end;
    end;

    if (dwState = 1) then
    begin
      cbToWrite := FStream.Read(chBuff, PIPE_BUFF_SIZE);

      if (cbToWrite < 1) then break;

      fSuccess := WriteFile(
        hPipe,
        chBuff,
        cbToWrite,
        cbWritten,
        @oOverlap);

      if (fSuccess and (cbWritten = cbToWrite)) then
      begin
        fPendingIO := FALSE;
        continue;
      end;

      if ((not fSuccess) and (GetLastError() = ERROR_IO_PENDING)) then
      begin
        fPendingIO := TRUE;
        continue;
      end;

      break;
    end;
  end;
end;

procedure TPipeServer.Execute();
begin
  if (FOverlapped) then Execute_overlapped() else Execute_non_overlapped();
end;

// =============================================================================

procedure TMainForm.FormCreate(Sender: TObject);
var
  p_md : libvlc_media_t_ptr;
begin
  pname  := '\\.\pipe\vlcpipe' + IntToStr(Round(Now() * SecsPerDay));

  stream := TFileStream.Create('..\..\_testFiles\test.ts', fmOpenRead);
  server := TPipeServer.Create(stream, pname, TRUE);

  libvlc_dynamic_dll_init();

  if (libvlc_dynamic_dll_error <> '') then
  begin
    MessageDlg(libvlc_dynamic_dll_error, mtError, [mbOK], 0);
    exit;
  end;

  with TArgcArgs.Create([
    libvlc_dynamic_dll_path,
    '--intf=dummy',
    '--ignore-config',
    '--quiet',
    '--no-video-title-show',
    '--no-video-on-top'
    // '--vout=vdummy',
    // '--aout=adummy'
  ]) do
  begin
    p_li := libvlc_new(ARGC, ARGS);
    Free;
  end;

  p_mi := NIL;

  p_md := libvlc_media_new_location(p_li, PAnsiChar('stream://\' + pname));
  
  if (p_md <> NIL) then
  begin
    p_mi := libvlc_media_player_new_from_media(p_md);
    if (p_mi <> NIL) then
    begin
      libvlc_media_player_set_display_window(p_mi, SELF.Handle);
    end;
    libvlc_media_player_play(p_mi);
    libvlc_media_release(p_md);
  end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  OnActivate := NIL;

  Sleep(50);
  
  server.Resume;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  server.Terminate;
  server.WaitFor;
  server.Free;
  
  if (p_mi <> NIL) then
  begin
    libvlc_media_player_stop(p_mi);
    libvlc_media_player_release(p_mi);
    p_mi := NIL;
  end;
  if (p_li <> NIL) then
  begin
    libvlc_release(p_li);
    p_li := NIL;
  end;

  stream.Free;
end;

end.
