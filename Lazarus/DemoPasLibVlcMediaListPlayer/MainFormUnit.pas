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
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, PasLibVlcPlayerUnit, ExtCtrls, ComCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    EventsMemo: TMemo;
    LeftPanel: TPanel;
    InfoPanel: TPanel;
    PauseBtn: TButton;
    TimePanel: TPanel;
    RightPanel: TPanel;
    PlayModeDefaultBtn: TButton;
    PasLibVlcMediaList1: TPasLibVlcMediaList;
    PlayListBox: TListBox;
    BottomPanel: TPanel;
    Player: TPasLibVlcPlayer;
    PlayBtn: TButton;
    PlayModeLoopBtn: TButton;
    PlayModeRepeatBtn: TButton;
    PrevBtn: TButton;
    NextBtn: TButton;
    StopBtn: TButton;
    ClearBtn: TButton;
    InfoTrackBar: TTrackBar;
    procedure ClearBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InfoTrackBarChange(Sender: TObject);
    procedure PasLibVlcMediaList1MediaListItemAdded(Sender: TObject;
      mrl: WideString; item: Pointer; index: Integer);
    procedure PauseBtnClick(Sender: TObject);
    procedure PlayerMediaPlayerEndReached(Sender: TObject);
    procedure PlayerMediaPlayerLengthChanged(Sender: TObject; time: Int64);
    procedure PlayerMediaPlayerMediaChanged(Sender: TObject; mrl: string);
    procedure PlayerMediaPlayerPositionChanged(Sender: TObject; position: Single
      );
    procedure PlayerMediaPlayerTimeChanged(Sender: TObject; time: Int64);
    procedure PlayListBoxClick(Sender: TObject);
    procedure PasLibVlcMediaList1NextItemSet(Sender: TObject; mrl: WideString;
      item: Pointer; index: Integer);
    procedure PasLibVlcMediaList1ItemAdded(Sender: TObject; mrl: WideString;
      item: Pointer; index: Integer);
    procedure PasLibVlcMediaList1ItemDeleted(Sender: TObject; mrl: WideString;
      item: Pointer; index: Integer);
    procedure PlayerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PlayBtnClick(Sender: TObject);
    procedure PlayModeDefaultBtnClick(Sender: TObject);
    procedure PlayModeLoopBtnClick(Sender: TObject);
    procedure PlayModeRepeatBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}
uses
  PasLibVlcUnit;

procedure TMainForm.FormCreate(Sender: TObject);
begin

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

  PasLibVlcMediaList1.Add('https://www.youtube.com/watch?v=8JnfIa84TnU');
  //
  PasLibVlcMediaList1.Add('..'+PathDelim+'..'+PathDelim+'_testFiles'+PathDelim+'Maximize.mp4');
  PasLibVlcMediaList1.Add('..'+PathDelim+'..'+PathDelim+'_testFiles'+PathDelim+'test.ts');
  PasLibVlcMediaList1.Add('http://www.miastomuzyki.pl/odbior/rmf_aacp.pls');
  PasLibVlcMediaList1.Add('http://www.radio-canada.ca/util/endirect/premiere.asx');
end;

procedure TMainForm.ClearBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Clear();
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  EventsMemo.Lines.Add('From MouseDown at ' + IntToStr(x) + ',' + IntToStr(y));
end;

procedure TMainForm.InfoTrackBarChange(Sender: TObject);
begin
  if Player.CanSeek() then
  begin
    Player.SetVideoPosInMs(InfoTrackBar.Position);
    TimePanel.Caption := time2str(InfoTrackBar.Position) + '/' + time2str(InfoTrackBar.Max);
  end;
end;

procedure TMainForm.PlayListBoxClick(Sender: TObject);
var
  idx: Integer;
  item: TObject;
begin
  if (PlayListBox.ItemIndex < 0) then exit;
  if (PlayListBox.ItemIndex >= PlayListBox.Count) then exit;

  // check for item stil exists in play list
  item := PlayListBox.Items.Objects[PlayListBox.ItemIndex];
  idx := PasLibVlcMediaList1.IndexOfItem(item);

  // if exists then play it
  if (idx > -1) then
  begin
    PasLibVlcMediaList1.PlayItem(item);
  end;
end;

procedure TMainForm.NextBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Next();
end;

procedure TMainForm.PasLibVlcMediaList1ItemAdded(Sender: TObject;
  mrl: WideString; item: Pointer; index: Integer);
begin
  PlayListBox.Items.AddObject(string(mrl), item);
end;

procedure TMainForm.PasLibVlcMediaList1ItemDeleted(Sender: TObject;
  mrl: WideString; item: Pointer; index: Integer);
begin
  PlayListBox.Items.Delete(index);
end;

procedure TMainForm.PlayerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  EventsMemo.Lines.Add('Player MouseDown at ' + IntToStr(x) + ',' + IntToStr(y));
end;

procedure TMainForm.PasLibVlcMediaList1MediaListItemAdded(Sender: TObject;
  mrl: WideString; item: Pointer; index: Integer);
begin
  PlayListBox.Items.AddObject(string(mrl), item);
end;

procedure TMainForm.PauseBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Pause();
  if (PauseBtn.Caption = 'Pause') then PauseBtn.Caption := 'Resume'
  else PauseBtn.Caption := 'Pause';
  InfoTrackBar.OnChange := InfoTrackBarChange;
end;

procedure TMainForm.PlayerMediaPlayerEndReached(Sender: TObject);
begin
  TimePanel.Caption := '';
  InfoTrackBar.Position := 0;
end;

procedure TMainForm.PlayerMediaPlayerLengthChanged(Sender: TObject; time: Int64
  );
var
  oldOnChange : TNotifyEvent;
begin
  TimePanel.Caption := time2str(InfoTrackBar.Position) + '/' + time2str(InfoTrackBar.Max);
  oldOnChange := InfoTrackBar.OnChange;
  InfoTrackBar.OnChange := NIL;
  InfoTrackBar.Max := time;
  InfoTrackBar.OnChange := oldOnChange;
end;

procedure TMainForm.PlayerMediaPlayerMediaChanged(Sender: TObject; mrl: string);
begin
  Caption := mrl;
end;

procedure TMainForm.PlayerMediaPlayerPositionChanged(Sender: TObject;
  position: Single);
begin
  //InfoTrackBar.Position := Round(MaxInt * position);
end;

procedure TMainForm.PlayerMediaPlayerTimeChanged(Sender: TObject; time: Int64);
var
  oldOnChange : TNotifyEvent;
begin
  TimePanel.Caption := time2str(InfoTrackBar.Position) + '/' + time2str(InfoTrackBar.Max);
  oldOnChange := InfoTrackBar.OnChange;
  InfoTrackBar.OnChange := NIL;
  InfoTrackBar.Position := time;
  InfoTrackBar.OnChange := oldOnChange;
end;

procedure TMainForm.PasLibVlcMediaList1NextItemSet(Sender: TObject;
  mrl: WideString; item: Pointer; index: Integer);
begin
  if (index < PlayListBox.Count) then
  begin
    PlayListBox.ItemIndex := index;
  end;
  EventsMemo.Lines.Add('Play ' + string(mrl));
end;

procedure TMainForm.PlayBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Play();
  InfoTrackBar.OnChange := NIL;
  PauseBtn.Caption := 'Pause';
end;

procedure TMainForm.PlayModeDefaultBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.SetPlayModeNormal();
end;

procedure TMainForm.PlayModeLoopBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.SetPlayModeLoop();
end;

procedure TMainForm.PlayModeRepeatBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.SetPlayModeRepeat();
end;

procedure TMainForm.PrevBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Prev();
end;

procedure TMainForm.StopBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Stop();
end;

end.


