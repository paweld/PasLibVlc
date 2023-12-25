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

unit FullScreenFormUnit;

interface

uses
  {$IFDEF UNIX}Unix,{$ENDIF}
  {$IFDEF FPC}
  LCLIntf, LCLType, LMessages,
  {$ELSE}
  Messages,
  {$ENDIF}
  SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs;

type
  TFullScreenForm = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullScreenForm: TFullScreenForm;

implementation

{$R *.lfm}

procedure TFullScreenForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  Close;
end;

procedure TFullScreenForm.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
end;

end.
