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

unit SetEqualizerPresetFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, PasLibVlcClassUnit;

type
  TSetEqualizerPresetForm = class(TForm)
    PresetListLB: TListBox;
    OkBtn: TButton;
    CancelBtn: TButton;
    PresetListLabel: TLabel;
    BandInfoLB: TListBox;
    BandInfoLabel: TLabel;
    procedure PresetListLBClick(Sender: TObject);
  private
    { Private declarations }
  public
    FVLC : TPasLibVlc;
  end;

var
  SetEqualizerPresetForm: TSetEqualizerPresetForm;

implementation

{$R *.dfm}

procedure TSetEqualizerPresetForm.PresetListLBClick(Sender: TObject);
var
  equalizer : TPasLibVlcEqualizer;
  index : Integer;
begin
  BandInfoLB.Clear;
  if (PresetListLB.ItemIndex > -1) then
  begin
    equalizer := TPasLibVlcEqualizer.Create(
      FVLC,
      Word(PresetListLB.Items.Objects[PresetListLB.ItemIndex])
    );
    BandInfoLB.AddItem(
      'PreAmp: ' +  IntToStr(Round(equalizer.GetPreAmp())),
      NIL
    );
    for index := 0 to equalizer.GetBandCount() - 1 do
    begin
      BandInfoLB.AddItem(
        'Band no: ' + IntToStr(index+1) +
        ', freq.: ' + IntToStr(Round(equalizer.GetBandFrequency(index))) +
        'Hz, amp.:' + IntToStr(Round(equalizer.GetAmp(index))),
        NIL
      );
    end;
    equalizer.Free;
  end;
end;

end.
