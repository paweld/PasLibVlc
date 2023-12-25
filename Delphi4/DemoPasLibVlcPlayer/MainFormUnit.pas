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
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, PasLibVlcUnit, PasLibVlcPlayerUnit;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    MenuFileOpen: TMenuItem;
    MenuFileQuit: TMenuItem;
    OpenDialog: TOpenDialog;
    PasLibVlcPlayer: TPasLibVlcPlayer;
    procedure MenuFileQuitClick(Sender: TObject);
    procedure MenuFileOpenClick(Sender: TObject);
    procedure PasLibVlcPlayerMediaPlayerMediaChanged(Sender: TObject;
      mrl: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.MenuFileQuitClick(Sender: TObject);
begin
  Close();
end;

procedure TMainForm.MenuFileOpenClick(Sender: TObject);
var
  logo_file_1 : string;
  logo_file_2 : string;
begin
  if OpenDialog.Execute() then
  begin
    PasLibVlcPlayer.Play(OpenDialog.FileName);

    logo_file_1 := ExtractFilePath(Application.ExeName) + 'logo1.png';
    logo_file_2 := ExtractFilePath(Application.ExeName) + 'logo2.png';
    if (FileExists(logo_file_1) and FileExists(logo_file_2)) then
    begin
      PasLibVlcPlayer.LogoShowFiles([logo_file_1, logo_file_2], libvlc_position_top);
    end;
    PasLibVlcPlayer.MarqueeShowText('marquee test %H:%M:%S', libvlc_position_bottom);
  end;
end;

procedure TMainForm.PasLibVlcPlayerMediaPlayerMediaChanged(Sender: TObject;
  mrl: String);
begin
  Caption := mrl;
end;

end.
