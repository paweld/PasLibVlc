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
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FmxPasLibVlcPlayerUnit, FMX.StdCtrls, FMX.Controls.Presentation;

type
  TMainForm = class(TForm)
    OpenButton: TButton;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    FmxPasLibVlcPlayer1: TFmxPasLibVlcPlayer;
    procedure OpenButtonClick(Sender: TObject);
    procedure FmxPasLibVlcPlayer1MediaPlayerVideoSizeChanged(Sender: TObject;
      width, height, video_w_a32, video_h_a32: Cardinal);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}
{$R *.Macintosh.fmx _MACOS}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.Surface.fmx MSWINDOWS}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.iPhone47in.fmx IOS}
{$R *.iPad.fmx IOS}
{$R *.Windows.fmx MSWINDOWS}

procedure TMainForm.FmxPasLibVlcPlayer1MediaPlayerVideoSizeChanged(
  Sender: TObject; width, height, video_w_a32, video_h_a32: Cardinal);
begin
  Caption := IntToStr(width) + 'x' + IntToStr(height);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FmxPasLibVlcPlayer1.Stop();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Caption := Caption + ' - ' + {$IFDEF CPUX64}'64'{$ELSE}'32'{$ENDIF} + ' bit';
end;

procedure TMainForm.OpenButtonClick(Sender: TObject);
begin
  if (OpenDialog.Execute) then
  begin
    FmxPasLibVlcPlayer1.Play(OpenDialog.FileName);
  end;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  FmxPasLibVlcPlayer1.InvalidateRect(FmxPasLibVlcPlayer1.BoundsRect);
end;

end.
