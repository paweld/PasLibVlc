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

unit VideoAdjustFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TVideoAdjustForm = class(TForm)
    chkVideoAdjustEnable: TCheckBox;
    tbVideoAdjustContrast: TTrackBar;
    labVideoAdjustContrast: TLabel;
    tbVideoAdjustBrightness: TTrackBar;
    labVideoAdjustBrightness: TLabel;
    tbVideoAdjustHue: TTrackBar;
    labVideoAdjustHue: TLabel;
    tbVideoAdjustSaturation: TTrackBar;
    labVideoAdjustSaturation: TLabel;
    tbVideoAdjustGamma: TTrackBar;
    labVideoAdjustGamma: TLabel;
    procedure chkVideoAdjustEnableClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbVideoAdjustContrastChange(Sender: TObject);
    procedure tbVideoAdjustBrightnessChange(Sender: TObject);
    procedure tbVideoAdjustHueChange(Sender: TObject);
    procedure tbVideoAdjustSaturationChange(Sender: TObject);
    procedure tbVideoAdjustGammaChange(Sender: TObject);
  private
    FHandleChanges : Boolean;
  public
    
  end;

var
  VideoAdjustForm: TVideoAdjustForm;

implementation

{$R *.dfm}

uses
  MainFormUnit;

procedure TVideoAdjustForm.chkVideoAdjustEnableClick(Sender: TObject);
begin
  MainForm.PasLibVlcPlayer1.SetVideoAdjustEnable(chkVideoAdjustEnable.Checked);

  tbVideoAdjustContrast.Enabled    := chkVideoAdjustEnable.Checked;
  labVideoAdjustContrast.Enabled   := chkVideoAdjustEnable.Checked;
  tbVideoAdjustBrightness.Enabled  := chkVideoAdjustEnable.Checked;
  labVideoAdjustBrightness.Enabled := chkVideoAdjustEnable.Checked;
  tbVideoAdjustHue.Enabled         := chkVideoAdjustEnable.Checked;
  labVideoAdjustHue.Enabled        := chkVideoAdjustEnable.Checked;
  tbVideoAdjustSaturation.Enabled  := chkVideoAdjustEnable.Checked;
  labVideoAdjustSaturation.Enabled := chkVideoAdjustEnable.Checked;
  tbVideoAdjustGamma.Enabled       := chkVideoAdjustEnable.Checked;
  labVideoAdjustGamma.Enabled      := chkVideoAdjustEnable.Checked;
end;

procedure TVideoAdjustForm.FormShow(Sender: TObject);
begin
  FHandleChanges := FALSE;

//  chkVideoAdjustEnable.Checked := MainForm.PasLibVlcPlayer1.GetVideoAdjustEnable();
  chkVideoAdjustEnableClick(SELF);

  with MainForm.PasLibVlcPlayer1 do
  begin
    tbVideoAdjustContrast.Position   := Round(100 * GetVideoAdjustContrast());
    tbVideoAdjustBrightness.Position := Round(100 * GetVideoAdjustBrightness());
    tbVideoAdjustHue.Position        := Round(GetVideoAdjustHue());
    tbVideoAdjustSaturation.Position := Round(100 * GetVideoAdjustSaturation());
    tbVideoAdjustGamma.Position      := Round(100 * GetVideoAdjustGamma());
  end;

  FHandleChanges := TRUE;
end;

procedure TVideoAdjustForm.tbVideoAdjustBrightnessChange(Sender: TObject);
begin
  if FHandleChanges then
  begin
    with MainForm.PasLibVlcPlayer1 do
    begin
      SetVideoAdjustBrightness(tbVideoAdjustBrightness.Position / 100);
    end;
  end;
end;

procedure TVideoAdjustForm.tbVideoAdjustContrastChange(Sender: TObject);
begin
  if FHandleChanges then
  begin
    with MainForm.PasLibVlcPlayer1 do
    begin
      SetVideoAdjustContrast(tbVideoAdjustContrast.Position / 100);
    end;
  end;
end;

procedure TVideoAdjustForm.tbVideoAdjustGammaChange(Sender: TObject);
begin
  if FHandleChanges then
  begin
    with MainForm.PasLibVlcPlayer1 do
    begin
      SetVideoAdjustGamma(tbVideoAdjustGamma.Position / 100);
    end;
  end;
end;

procedure TVideoAdjustForm.tbVideoAdjustHueChange(Sender: TObject);
begin
  if FHandleChanges then
  begin
    with MainForm.PasLibVlcPlayer1 do
    begin
      SetVideoAdjustHue(tbVideoAdjustHue.Position);
    end;
  end;
end;

procedure TVideoAdjustForm.tbVideoAdjustSaturationChange(Sender: TObject);
begin
  if FHandleChanges then
  begin
    with MainForm.PasLibVlcPlayer1 do
    begin
      SetVideoAdjustSaturation(tbVideoAdjustSaturation.Position);
    end;
  end;
end;

end.
