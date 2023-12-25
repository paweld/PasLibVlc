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
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  PasLibVlcUnit, PasLibVlcClassUnit, PasLibVlcPlayerUnit;

type
  TMainForm = class(TForm)
    Player: TPasLibVlcPlayer;
    PasLibVlcMediaList1: TPasLibVlcMediaList;
    PlayListBox: TListBox;
    BottomPanel: TPanel;
    PlayBtn: TButton;
    PrevBtn: TButton;
    NextBtn: TButton;
    StopBtn: TButton;
    ClearBtn: TButton;
    PlayModeNormalBtn: TButton;
    PlayModeLoopBtn: TButton;
    PlayModeRepeatBtn: TButton;
    RightPanel: TPanel;
    EventsMemo: TMemo;
    LeftPanel: TPanel;
    InfoPanel: TPanel;
    TimePanel: TPanel;
    TrackBar: TTrackBar;
    PauseBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure PlayListBoxClick(Sender: TObject);
    procedure PasLibVlcMediaList1NextItemSet(Sender: TObject; mrl: WideString;
      item: Pointer; index: Integer);
    procedure PasLibVlcMediaList1ItemAdded(Sender: TObject; mrl: WideString;
      item: Pointer; index: Integer);
    procedure PasLibVlcMediaList1ItemDeleted(Sender: TObject; mrl: WideString;
      item: Pointer; index: Integer);
    procedure PlayBtnClick(Sender: TObject);
    procedure PrevBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure PlayModeNormalBtnClick(Sender: TObject);
    procedure PlayModeLoopBtnClick(Sender: TObject);
    procedure PlayModeRepeatBtnClick(Sender: TObject);
    procedure PlayerMediaPlayerEndReached(Sender: TObject);
    procedure PlayerMediaPlayerPositionChanged(Sender: TObject;
      position: Single);
    procedure PlayerMediaPlayerLengthChanged(Sender: TObject; time: Int64);
    procedure PlayerMediaPlayerTimeChanged(Sender: TObject; time: Int64);
    procedure PauseBtnClick(Sender: TObject);
    procedure TrackBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.PlayModeLoopBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.SetPlayModeLoop();
end;

procedure TMainForm.PlayModeNormalBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.SetPlayModeNormal();
end;

procedure TMainForm.PlayModeRepeatBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.SetPlayModeRepeat();
end;

procedure TMainForm.ClearBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Clear();
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  // set custom path to libvlc
  // Player.VLC.Path := 'C:\Program Files\VideoLAN\VLC';
  // connect Player to MediaList
  PasLibVlcMediaList1.Player := Player;
  // not work in wersion 1.1.11
  PasLibVlcMediaList1.Add('http://www.youtube.com/watch?v=Bh_sV058aLU');
  PasLibVlcMediaList1.Add('http://www.youtube.com/watch?v=GJbo6ynoxEk');
  PasLibVlcMediaList1.Add('..'+PathDelim+'..'+PathDelim+'_testFiles'+PathDelim+'Maximize.mp4');
  PasLibVlcMediaList1.Add('..'+PathDelim+'..'+PathDelim+'_testFiles'+PathDelim+'test.ts');
  PasLibVlcMediaList1.Add('http://www.miastomuzyki.pl/odbior/rmf_aacp.pls');
  PasLibVlcMediaList1.Add('http://www.radio-canada.ca/util/endirect/premiere.asx');
  PasLibVlcMediaList1.Add('https://youtu.be/FS31XSBUhlM');
//  PasLibVlcMediaList1.Add('http://79.252.173.254:16453/1:0:1:7034:41B:1:C00000:0:0:0:');
  Caption := Caption + ' - ' + {$IFDEF CPUX64}'64'{$ELSE}'32'{$ENDIF} + ' bit';
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
  PlayListBox.Items.AddObject(mrl, item);
end;

procedure TMainForm.PasLibVlcMediaList1ItemDeleted(Sender: TObject;
  mrl: WideString; item: Pointer; index: Integer);
begin
  PlayListBox.Items.Delete(index);
end;

procedure TMainForm.PasLibVlcMediaList1NextItemSet(Sender: TObject;
  mrl: WideString; item: Pointer; index: Integer);
begin
  if (index < PlayListBox.Count) then
  begin
    PlayListBox.ItemIndex := index;
  end;

  EventsMemo.Lines.Add('Play ' + mrl);
end;

procedure TMainForm.PauseBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Pause();
  if (PauseBtn.Caption = 'Pause') then PauseBtn.Caption := 'Resume'
  else PauseBtn.Caption := 'Pause';
  TrackBar.OnChange := TrackBarChange;
end;

procedure TMainForm.PlayBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Play();
  TrackBar.OnChange := NIL;
end;

procedure TMainForm.PlayerMediaPlayerEndReached(Sender: TObject);
begin
  TrackBar.Position := 0;
  TimePanel.Caption := '';
end;

procedure TMainForm.PlayerMediaPlayerLengthChanged(Sender: TObject;
  time: Int64);
begin
//  TrackBar.Max := MaxInt;
  TrackBar.Max := time;
  TimePanel.Caption := time2str(TrackBar.Position) + ' / ' + time2str(TrackBar.Max);
end;

procedure TMainForm.PlayerMediaPlayerPositionChanged(Sender: TObject;
  position: Single);
begin
//  TrackBar.Position := Round(MaxInt * position);
end;

procedure TMainForm.PlayerMediaPlayerTimeChanged(Sender: TObject; time: Int64);
begin
  TrackBar.Position := time;
  TimePanel.Caption := time2str(TrackBar.Position) + ' / ' + time2str(TrackBar.Max);
end;

procedure TMainForm.PrevBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Prev();
end;

procedure TMainForm.StopBtnClick(Sender: TObject);
begin
  PasLibVlcMediaList1.Stop();
end;

procedure TMainForm.TrackBarChange(Sender: TObject);
begin
  if Player.CanSeek() then
  begin
    Player.SetVideoPosInMs(TrackBar.Position);
    PlayerMediaPlayerTimeChanged(SELF, TrackBar.Position);
  end;
end;

end.


