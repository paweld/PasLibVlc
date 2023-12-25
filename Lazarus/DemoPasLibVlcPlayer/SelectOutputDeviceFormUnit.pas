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
 
{$I ../../source/compiler.inc}

unit SelectOutputDeviceFormUnit;

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, types;

type

  { TSelectOutputDeviceForm }

  TSelectOutputDeviceForm = class(TForm)
    CancelBtn: TButton;
    OutputDevicesLabel: TLabel;
    OkBtn: TButton;
    OutputDevicesLB: TListBox;
    procedure OkBtnClick(Sender: TObject);
    procedure OutputDevicesLBDblClick(Sender: TObject);
    procedure OutputDevicesLBDrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SelectOutputDeviceForm: TSelectOutputDeviceForm;

implementation

{$R *.lfm}

{ TSelectOutputDeviceForm }

procedure TSelectOutputDeviceForm.OkBtnClick(Sender: TObject);
begin
  if (OutputDevicesLB.ItemIndex < 0) then
  begin
    ModalResult := mrCancel;
  end
  else
  begin
    ModalResult := mrOK;
  end;
end;

procedure TSelectOutputDeviceForm.OutputDevicesLBDblClick(Sender: TObject);
begin
  if (OutputDevicesLB.ItemIndex > -1) then
  begin
    ModalResult := mrOK;
  end;
end;

procedure TSelectOutputDeviceForm.OutputDevicesLBDrawItem(Control: TWinControl;
  Index: Integer; ARect: TRect; State: TOwnerDrawState);
var
  str : string;
begin
  with (Control as TListBox).Canvas do
  begin
    FillRect(ARect);
    str := (Control as TListBox).Items[Index];
    TextOut(ARect.Left + 2, ARect.Top + 1, Copy(str, Pos('|', str) + 1, MaxInt));
  end;
end;

end.

