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
  {$IFDEF MSWINDOWS}Windows,{$ENDIF}
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, PasLibVlcPlayerUnit;

type
  TMainForm = class(TForm)
    mrlEdit: TEdit;
    player: TPasLibVlcPlayer;
    playButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure playerMediaPlayerTimeChanged(Sender: TObject;
      time: Int64);
    procedure playButtonClick(Sender: TObject);
  private
    needStop : Boolean;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  needStop := TRUE;
  mrlEdit.Text := '..'+PathDelim+'..'+PathDelim+'_testFiles'+PathDelim+'test.ts';
  player.Play(mrlEdit.Text);
end;

procedure TMainForm.playButtonClick(Sender: TObject);
begin
  player.Resume();
end;

procedure TMainForm.playerMediaPlayerTimeChanged(Sender: TObject;
  time: Int64);
begin
  if (needStop) and (time > 100) then
  begin
    needStop := FALSE;
    player.Pause();
  end;
end;

end.
