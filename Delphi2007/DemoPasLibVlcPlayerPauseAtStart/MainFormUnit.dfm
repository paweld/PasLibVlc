object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'DemoPasLivVlcPlayerPauseAtStart'
  ClientHeight = 339
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mrlEdit: TEdit
    Left = 12
    Top = 12
    Width = 391
    Height = 21
    TabOrder = 0
  end
  object player: TPasLibVlcPlayer
    Left = 12
    Top = 44
    Width = 391
    SnapShotFmt = 'png'
    OnMediaPlayerTimeChanged = playerMediaPlayerTimeChanged
  end
  object playButton: TButton
    Left = 164
    Top = 300
    Width = 75
    Height = 25
    Caption = 'Play'
    TabOrder = 2
    OnClick = playButtonClick
  end
end
