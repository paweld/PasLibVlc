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
  {$IFDEF UNIX}Unix,{$ENDIF}
  {$IFDEF MSWINDOWS}{$IFNDEF FPC}Windows,{$ENDIF}{$ENDIF}
  {$IFDEF LCLGTK2}Gtk2, {$IFDEF UNIX}Gdk2x,{$ENDIF}{$ENDIF}
  {$IFDEF LCLQT}Qt4, QtWidgets, {$ENDIF}
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, {$IFNDEF FPC}StdCtrls,{$ENDIF} PasLibVlcUnit;

type

  { TMainForm }

  TMainForm = class(TForm)
    FileMenuItem: TMenuItem;
    OpenDialog: TOpenDialog;
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    MenuFileOpen: TMenuItem;
    MenuFileQuit: TMenuItem;
    OpenMenuItem: TMenuItem;
    QuitMenuItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuFileOpenClick(Sender: TObject);
    procedure MenuFileQuitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    p_li : libvlc_instance_t_ptr;
    p_mi : libvlc_media_player_t_ptr;
    procedure PlayerInit();
    procedure PlayerPlay(fileName: WideString);
    procedure PlayerStop();
    procedure PlayerDestroy();
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.PlayerInit();
begin
  libvlc_dynamic_dll_init();

  if (libvlc_dynamic_dll_error <> '') then
  begin
    MessageDlg(libvlc_dynamic_dll_error, mtError, [mbOK], 0);
    Application.Terminate();
    exit;
  end;

  with TArgcArgs.Create([
    WideString(libvlc_dynamic_dll_path),
    '--intf=dummy',
    '--ignore-config',
    '--quiet',
    '--no-video-title-show',
    '--no-video-on-top'
  ]) do
  begin
    p_li := libvlc_new(ARGC, ARGS);
    Free;
  end;

  if (p_li <> NIL) then
  begin
    p_mi := libvlc_media_player_new(p_li);
  end;
end;

procedure TMainForm.PlayerPlay(fileName: WideString);
var
  p_md : libvlc_media_t_ptr;
  a_st : AnsiString;
  p_st : PAnsiChar;
begin
  a_st := UTF8Encode(fileName);
  p_st := PAnsiChar(@a_st[1]);

  if (p_li <> NIL) then
  begin
    p_md := libvlc_media_new_path(p_li, p_st);
    if (p_md <> NIL) then
    begin
      if (p_mi <> NIL) then
      begin
        //libvlc_video_set_key_input(p_mi, 1);
        //libvlc_video_set_mouse_input(p_mi, 1);
        libvlc_media_player_set_display_window(p_mi, SELF.Handle);
        libvlc_media_player_set_media(p_mi, p_md);
        libvlc_media_player_play(p_mi);
      end;
      libvlc_media_release(p_md);
    end;
  end;
end;

procedure TMainForm.PlayerStop();
begin
  if (p_mi <> NIL) then
  begin
    libvlc_media_player_stop(p_mi);
    Sleep(50);
    while (libvlc_media_player_is_playing(p_mi) <> 0) do
    begin
      Sleep(50);
    end;
    libvlc_media_player_release(p_mi);
    p_mi := NIL;
    Sleep(50);
  end;
end;

procedure TMainForm.PlayerDestroy();
begin
  if (p_li <> NIL) then
  begin
    PlayerStop();
    libvlc_release(p_li);
    p_li := NIL;
  end;
  libvlc_dynamic_dll_done();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  p_li := NIL;
  p_mi := NIL;
  {$IFDEF LCLGTK2}
    Caption := Caption + ' LCL GTK2';
  {$ELSE}
    {$IFDEF LCLQT}
      Caption := Caption + ' LCL QT';
    {$ELSE}
      Caption := Caption + ' LCL WIN';
    {$ENDIF}
  {$ENDIF}
  Caption := Caption + ' x' + {$IFDEF CPUX32}'32'{$ELSE}'64'{$ENDIF};
  PlayerInit();
  if (libvlc_dynamic_dll_vlc_version_str <> '') then
  begin
    Caption := Caption + ', libvlc: ' + libvlc_dynamic_dll_vlc_version_str;
    if (ParamStr(1) <> '') then
    begin
      PlayerPlay(ParamStr(1));
    end;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  PlayerDestroy();
end;

procedure TMainForm.MenuFileOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute() then
  begin
    {$IFDEF MSWINDOWS}
      PlayerPlay(WideString(StringReplace(OpenDialog.FileName, '/', '\', [rfReplaceAll])));
    {$ELSE}
      PlayerPlay(OpenDialog.FileName);
    {$ENDIF}
  end;
end;

procedure TMainForm.MenuFileQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;


end.

