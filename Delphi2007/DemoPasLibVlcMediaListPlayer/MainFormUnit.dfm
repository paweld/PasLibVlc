object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 525
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 472
    Width = 764
    Height = 53
    Align = alBottom
    TabOrder = 0
    object PlayBtn: TButton
      Left = 12
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Play'
      TabOrder = 0
      OnClick = PlayBtnClick
    end
    object PrevBtn: TButton
      Left = 140
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Prev'
      TabOrder = 1
      OnClick = PrevBtnClick
    end
    object NextBtn: TButton
      Left = 196
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Next'
      TabOrder = 2
      OnClick = NextBtnClick
    end
    object StopBtn: TButton
      Left = 260
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Stop'
      TabOrder = 3
      OnClick = StopBtnClick
    end
    object ClearBtn: TButton
      Left = 420
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Clear'
      TabOrder = 4
      OnClick = ClearBtnClick
    end
    object PlayModeNormalBtn: TButton
      Left = 492
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Play Normal'
      TabOrder = 5
      OnClick = PlayModeNormalBtnClick
    end
    object PlayModeLoopBtn: TButton
      Left = 580
      Top = 16
      Width = 75
      Height = 25
      Caption = 'PlayLoop'
      TabOrder = 6
      OnClick = PlayModeLoopBtnClick
    end
    object PlayModeRepeatBtn: TButton
      Left = 669
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Play Repeat'
      TabOrder = 7
      OnClick = PlayModeRepeatBtnClick
    end
    object PauseBtn: TButton
      Left = 76
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Pause'
      TabOrder = 8
      OnClick = PauseBtnClick
    end
  end
  object RightPanel: TPanel
    Left = 415
    Top = 0
    Width = 349
    Height = 472
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object PlayListBox: TListBox
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 333
      Height = 145
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alTop
      ItemHeight = 13
      TabOrder = 0
      OnClick = PlayListBoxClick
    end
    object EventsMemo: TMemo
      AlignWithMargins = True
      Left = 8
      Top = 161
      Width = 333
      Height = 303
      Margins.Left = 8
      Margins.Top = 0
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ScrollBars = ssBoth
      TabOrder = 1
      WordWrap = False
    end
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 415
    Height = 472
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Player: TPasLibVlcPlayer
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 407
      Height = 396
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alClient
      VideoOnTop = True
      UseOverlay = True
      SnapShotFmt = 'png'
      OnMediaPlayerEndReached = PlayerMediaPlayerEndReached
      OnMediaPlayerTimeChanged = PlayerMediaPlayerTimeChanged
      OnMediaPlayerPositionChanged = PlayerMediaPlayerPositionChanged
      OnMediaPlayerLengthChanged = PlayerMediaPlayerLengthChanged
    end
    object InfoPanel: TPanel
      Left = 0
      Top = 412
      Width = 415
      Height = 60
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object TimePanel: TPanel
        Left = 0
        Top = 0
        Width = 415
        Height = 17
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object TrackBar: TTrackBar
        Left = 0
        Top = 17
        Width = 415
        Height = 43
        Align = alClient
        Max = 100
        PageSize = 10
        Frequency = 5
        TabOrder = 1
        OnChange = TrackBarChange
      end
    end
  end
  object PasLibVlcMediaList1: TPasLibVlcMediaList
    OnItemAdded = PasLibVlcMediaList1ItemAdded
    OnItemDeleted = PasLibVlcMediaList1ItemDeleted
    OnNextItemSet = PasLibVlcMediaList1NextItemSet
    Left = 428
    Top = 16
  end
end
