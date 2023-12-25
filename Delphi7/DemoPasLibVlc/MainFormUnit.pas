(*
 *******************************************************************************
 *
 * Copyright (c) 2020 Robert Jêdrzejczyk
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
  Windows,
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ActiveX,
  PasLibVlcUnit;

type
  TMainForm = class(TForm)
    OpenDialog: TOpenDialog;
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    MenuFileOpen: TMenuItem;
    MenuFileQuit: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuFileOpenClick(Sender: TObject);
    procedure MenuFileQuitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

{$R *.dfm}

procedure TMainForm.PlayerInit();
begin
//  libvlc_dynamic_dll_init_with_path('C:\Program Files\VideoLAN\VLC');
  libvlc_dynamic_dll_init();

  if (libvlc_dynamic_dll_error <> '') then
  begin
    MessageDlg(libvlc_dynamic_dll_error, mtError, [mbOK], 0);
    Application.Terminate();
    exit;
  end;

  with TArgcArgs.Create([
    libvlc_dynamic_dll_path,
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
begin
  if (p_li <> NIL) then
  begin
    p_md := libvlc_media_new_path(p_li, PAnsiChar(UTF8Encode(fileName)));
    if (p_md <> NIL) then
    begin
      if (p_mi <> NIL) then
      begin
        // libvlc_video_set_key_input(p_mi, 1);
        // libvlc_video_set_mouse_input(p_mi, 1);
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
    if (libvlc_media_player_is_playing(p_mi) = 1) then
    begin
      libvlc_media_player_stop(p_mi);
      Sleep(50);
      while (libvlc_media_player_is_playing(p_mi) = 1) do
      begin
        Sleep(50);
      end;
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

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PlayerDestroy();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  p_li := NIL;
  p_mi := NIL;
  PlayerInit();
  if (libvlc_dynamic_dll_error = '') then
  begin
    Caption := Caption + ', libvlc: ' + libvlc_dynamic_dll_vlc_version_str;
    if (ParamStr(1) <> '') then
    begin
      PlayerPlay(ParamStr(1));
    end;
  end;
end;

procedure TMainForm.MenuFileOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute() then
  begin
    PlayerPlay(OpenDialog.FileName);
  end;
end;

procedure TMainForm.MenuFileQuitClick(Sender: TObject);
begin
  Close();
end;

end.

