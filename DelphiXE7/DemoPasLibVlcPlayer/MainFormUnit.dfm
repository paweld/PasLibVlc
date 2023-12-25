object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'PasLibVlcPlayerDemo'
  ClientHeight = 801
  ClientWidth = 838
  Color = clBtnFace
  Constraints.MinHeight = 735
  Constraints.MinWidth = 703
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnResize = FormResize
  PixelsPerInch = 144
  TextHeight = 21
  object MrlLab: TLabel
    Left = 13
    Top = 6
    Width = 93
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'MRL to play:'
    FocusControl = MrlEdit
  end
  object PR: TPanel
    Left = 549
    Top = 0
    Width = 289
    Height = 801
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object PlayBtn: TButton
      Left = 13
      Top = 16
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Play'
      TabOrder = 0
      OnClick = PlayClick
    end
    object PauseBtn: TButton
      Left = 13
      Top = 66
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Pause'
      TabOrder = 1
      OnClick = PauseClick
    end
    object GetWidthBtn: TButton
      Left = 13
      Top = 160
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Get width'
      TabOrder = 2
      OnClick = GetWidthClick
    end
    object GetHeightBtn: TButton
      Left = 13
      Top = 207
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Get height'
      TabOrder = 3
      OnClick = GetHeightBtnClick
    end
    object GetStateBtn: TButton
      Left = 13
      Top = 254
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Get state'
      TabOrder = 4
      OnClick = GetStateClick
    end
    object ResumeBtn: TButton
      Left = 13
      Top = 113
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Resume'
      TabOrder = 5
      OnClick = ResumeClick
    end
    object GetPosLenBtn: TButton
      Left = 13
      Top = 297
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Get pos, len'
      TabOrder = 6
      OnClick = GetPosLenClick
    end
    object Scale10Btn: TButton
      Left = 13
      Top = 347
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Scale -10%'
      TabOrder = 7
      OnClick = Scale10Click
    end
    object ScaleFitBtn: TButton
      Left = 13
      Top = 394
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'ScaleFit'
      TabOrder = 8
      OnClick = ScaleFitClick
    end
    object SnapShotBtn: TButton
      Left = 13
      Top = 441
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'SnapShot'
      TabOrder = 9
      OnClick = SnapShotClick
    end
    object NextFrameBtn: TButton
      Left = 13
      Top = 491
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Next Frame'
      TabOrder = 10
      OnClick = NextFrameClick
    end
    object GetASpectRatioBtn: TButton
      Left = 155
      Top = 16
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Get Aspect'
      TabOrder = 11
      OnClick = GetASpectRatioClick
    end
    object SetAsp11Btn: TButton
      Left = 155
      Top = 66
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Set asp 1:1'
      TabOrder = 12
      OnClick = SetAsp11Click
    end
    object SetAsp43Btn: TButton
      Left = 155
      Top = 113
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Set asp 4:3'
      TabOrder = 13
      OnClick = SetAsp43Click
    end
    object GetVolume: TButton
      Left = 155
      Top = 160
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Get Volume'
      TabOrder = 14
      OnClick = GetVolumeClick
    end
    object SetVolumeUp10: TButton
      Left = 155
      Top = 207
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Volume +10'
      TabOrder = 15
      OnClick = SetVolumeUp10Click
    end
    object SetVolumeDo10: TButton
      Left = 155
      Top = 254
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Volume -10'
      TabOrder = 16
      OnClick = SetVolumeDo10Click
    end
    object GetPlayRateBtn: TButton
      Left = 155
      Top = 300
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Get Play Rate'
      TabOrder = 17
      OnClick = GetPlayRateBtnClick
    end
    object SetPlayRate2xBtn: TButton
      Left = 155
      Top = 347
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Play Rate 2x'
      TabOrder = 18
      OnClick = SetPlayRate2xBtnClick
    end
    object SetPlayRateHalfBtn: TButton
      Left = 155
      Top = 394
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Play Rate 1/2'
      TabOrder = 19
      OnClick = SetPlayRateHalfBtnClick
    end
    object FullScreenYesBtn: TButton
      Left = 155
      Top = 441
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'FullScreen'
      TabOrder = 20
      OnClick = FullScreenYesBtnClick
    end
    object DeInterlaceBtn: TButton
      Left = 13
      Top = 541
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'DeInterlace'
      TabOrder = 21
      OnClick = DeInterlaceBtnClick
    end
    object GetAudioChannel: TButton
      Left = 155
      Top = 491
      Width = 121
      Height = 40
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Get Audio Ch'
      TabOrder = 22
      OnClick = GetAudioChannelClick
    end
    object SetAudioChannelLeft: TButton
      Left = 155
      Top = 541
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Set Audio C L'
      TabOrder = 23
      OnClick = SetAudioChannelLeftClick
    end
    object SetAudioChannelRight: TButton
      Left = 155
      Top = 591
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Set Audio C R'
      TabOrder = 24
      OnClick = SetAudioChannelRightClick
    end
    object SetAudioChannelStereo: TButton
      Left = 155
      Top = 641
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Set Audio C S'
      TabOrder = 26
      OnClick = SetAudioChannelStereoClick
    end
    object GetAudioOutListBtn: TButton
      Left = 13
      Top = 591
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'AudioOutList'
      TabOrder = 25
      OnClick = GetAudioOutListBtnClick
    end
    object GetAudioOutDevEnumBtn: TButton
      Left = 13
      Top = 641
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'AOutDevEnum'
      TabOrder = 27
      OnClick = GetAudioOutDevEnumBtnClick
    end
    object GetEqPreListBtn: TButton
      Left = 155
      Top = 741
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'EqalizerPreList'
      TabOrder = 28
      OnClick = GetEqPreListBtnClick
    end
    object SetEqualizerBtn: TButton
      Left = 155
      Top = 691
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Set Equalizer'
      TabOrder = 29
      OnClick = SetEqualizerBtnClick
    end
    object ChAudioOut: TButton
      Left = 13
      Top = 691
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Ch Audio Out'
      TabOrder = 30
      OnClick = ChAudioOutClick
    end
    object GetAudioTrackList: TButton
      Left = 13
      Top = 741
      Width = 121
      Height = 41
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'AudioTrackList'
      TabOrder = 31
      OnClick = GetAudioTrackListClick
    end
  end
  object LB: TListBox
    AlignWithMargins = True
    Left = 15
    Top = 499
    Width = 516
    Height = 284
    Margins.Left = 13
    Margins.Top = 13
    Margins.Right = 13
    Margins.Bottom = 13
    ItemHeight = 21
    PopupMenu = LbPopupMenu
    TabOrder = 1
  end
  object MrlEdit: TEdit
    Left = 13
    Top = 32
    Width = 517
    Height = 29
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 2
  end
  object PasLibVlcPlayer1: TPasLibVlcPlayer
    Left = 13
    Top = 73
    Width = 517
    Height = 326
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    OnClick = PasLibVlcPlayer1Click
    OnDblClick = PasLibVlcPlayer1DblClick
    OnMouseActivate = PasLibVlcPlayer1MouseActivate
    OnMouseDown = PasLibVlcPlayer1MouseDown
    OnMouseEnter = PasLibVlcPlayer1MouseEnter
    OnMouseLeave = PasLibVlcPlayer1MouseLeave
    OnMouseMove = PasLibVlcPlayer1MouseMove
    OnMouseUp = PasLibVlcPlayer1MouseUp
    AudioOutput = aoWaveOut
    SnapShotFmt = 'png'
    OnMediaPlayerMediaChanged = PasLibVlcPlayer1MediaPlayerMediaChanged
    OnMediaPlayerNothingSpecial = PasLibVlcPlayer1MediaPlayerNothingSpecial
    OnMediaPlayerOpening = PasLibVlcPlayer1MediaPlayerOpening
    OnMediaPlayerBuffering = PasLibVlcPlayer1MediaPlayerBuffering
    OnMediaPlayerPlaying = PasLibVlcPlayer1MediaPlayerPlaying
    OnMediaPlayerPaused = PasLibVlcPlayer1MediaPlayerPaused
    OnMediaPlayerStopped = PasLibVlcPlayer1MediaPlayerStopped
    OnMediaPlayerForward = PasLibVlcPlayer1MediaPlayerForward
    OnMediaPlayerBackward = PasLibVlcPlayer1MediaPlayerBackward
    OnMediaPlayerEndReached = PasLibVlcPlayer1MediaPlayerEndReached
    OnMediaPlayerEncounteredError = PasLibVlcPlayer1MediaPlayerEncounteredError
    OnMediaPlayerTimeChanged = PasLibVlcPlayer1MediaPlayerTimeChanged
    OnMediaPlayerPositionChanged = PasLibVlcPlayer1MediaPlayerPositionChanged
    OnMediaPlayerSeekableChanged = PasLibVlcPlayer1MediaPlayerSeekableChanged
    OnMediaPlayerPausableChanged = PasLibVlcPlayer1MediaPlayerPausableChanged
    OnMediaPlayerTitleChanged = PasLibVlcPlayer1MediaPlayerTitleChanged
    OnMediaPlayerSnapshotTaken = PasLibVlcPlayer1MediaPlayerSnapshotTaken
    OnMediaPlayerLengthChanged = PasLibVlcPlayer1MediaPlayerLengthChanged
    OnMediaPlayerVideoOutChanged = PasLibVlcPlayer1MediaPlayerVideoOutChanged
    OnMediaPlayerScrambledChanged = PasLibVlcPlayer1MediaPlayerScrambledChanged
    OnMediaPlayerCorked = PasLibVlcPlayer1MediaPlayerCorked
    OnMediaPlayerUnCorked = PasLibVlcPlayer1MediaPlayerUnCorked
    OnMediaPlayerMuted = PasLibVlcPlayer1MediaPlayerMuted
    OnMediaPlayerUnMuted = PasLibVlcPlayer1MediaPlayerUnMuted
    OnMediaPlayerAudioVolumeChanged = PasLibVlcPlayer1MediaPlayerAudioVolumeChanged
    OnMediaPlayerEsAdded = PasLibVlcPlayer1MediaPlayerEsAdded
    OnMediaPlayerEsDeleted = PasLibVlcPlayer1MediaPlayerEsDeleted
    OnMediaPlayerEsSelected = PasLibVlcPlayer1MediaPlayerEsSelected
    OnMediaPlayerAudioDevice = PasLibVlcPlayer1MediaPlayerAudioDevice
    OnMediaPlayerChapterChanged = PasLibVlcPlayer1MediaPlayerChapterChanged
    OnRendererDiscoveredItemAdded = PasLibVlcPlayer1RendererDiscoveredItemAdded
    OnRendererDiscoveredItemDeleted = PasLibVlcPlayer1RendererDiscoveredItemDeleted
    MouseEventsHandler = mehComponent
  end
  object ProgPanel: TPanel
    Left = 13
    Top = 407
    Width = 517
    Height = 74
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 4
    object ProgLabel1: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 44
      Width = 66
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = '00:00:00'
      ExplicitHeight = 21
    end
    object ProgLabel2: TLabel
      AlignWithMargins = True
      Left = 445
      Top = 44
      Width = 66
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = '00:00:00'
      ExplicitHeight = 21
    end
    object ProgBar: TTrackBar
      Left = 1
      Top = 1
      Width = 515
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      PositionToolTip = ptBottom
      TabOrder = 0
      ThumbLength = 15
      TickStyle = tsNone
      OnChange = ProgBarChange
    end
  end
  object BtnSelect: TButton
    Left = 452
    Top = 34
    Width = 75
    Height = 31
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Select'
    TabOrder = 5
    OnClick = BtnSelectClick
  end
  object PopupMenu: TPopupMenu
    Left = 16
    Top = 56
    object a1: TMenuItem
      Caption = 'a'
    end
    object b1: TMenuItem
      Caption = 'b'
    end
    object c1: TMenuItem
      Caption = 'c'
    end
    object d1: TMenuItem
      Caption = 'd'
    end
  end
  object OpenDialog: TOpenDialog
    Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 288
    Top = 60
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    FileName = 'PasLibVlcDemo.txt'
    Left = 20
    Top = 316
  end
  object LbPopupMenu: TPopupMenu
    Left = 56
    Top = 316
    object LbPmClear: TMenuItem
      Caption = 'Clear'
      OnClick = LbPmClearClick
    end
    object LnPmSaveAs: TMenuItem
      Caption = 'Save as'
      OnClick = LnPmSaveAsClick
    end
  end
end
