object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'PasLibVlcPlayerDemo'
  ClientHeight = 548
  ClientWidth = 519
  Color = clBtnFace
  Constraints.MinHeight = 455
  Constraints.MinWidth = 435
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseDown = FormMouseDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object MrlLab: TLabel
    Left = 8
    Top = 4
    Width = 60
    Height = 13
    Caption = 'MRL to play:'
    FocusControl = MrlEdit
  end
  object PR: TPanel
    Left = 340
    Top = 0
    Width = 179
    Height = 548
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object PlayBtn: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Play'
      TabOrder = 0
      OnClick = PlayClick
    end
    object PauseBtn: TButton
      Left = 8
      Top = 41
      Width = 75
      Height = 25
      Caption = 'Pause'
      TabOrder = 1
      OnClick = PauseClick
    end
    object GetWidthBtn: TButton
      Left = 8
      Top = 99
      Width = 75
      Height = 25
      Caption = 'Get width'
      TabOrder = 2
      OnClick = GetWidthClick
    end
    object GetHeightBtn: TButton
      Left = 8
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Get height'
      TabOrder = 3
      OnClick = GetHeightBtnClick
    end
    object GetStateBtn: TButton
      Left = 8
      Top = 157
      Width = 75
      Height = 25
      Caption = 'Get state'
      TabOrder = 4
      OnClick = GetStateClick
    end
    object ResumeBtn: TButton
      Left = 8
      Top = 70
      Width = 75
      Height = 25
      Caption = 'Resume'
      TabOrder = 5
      OnClick = ResumeClick
    end
    object GetPosLenBtn: TButton
      Left = 8
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Get pos, len'
      TabOrder = 6
      OnClick = GetPosLenClick
    end
    object Scale10Btn: TButton
      Left = 8
      Top = 215
      Width = 75
      Height = 25
      Caption = 'Scale -10%'
      TabOrder = 7
      OnClick = Scale10Click
    end
    object ScaleFitBtn: TButton
      Left = 8
      Top = 244
      Width = 75
      Height = 25
      Caption = 'ScaleFit'
      TabOrder = 8
      OnClick = ScaleFitClick
    end
    object SnapShotBtn: TButton
      Left = 8
      Top = 273
      Width = 75
      Height = 25
      Caption = 'SnapShot'
      TabOrder = 9
      OnClick = SnapShotClick
    end
    object NextFrameBtn: TButton
      Left = 8
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Next Frame'
      TabOrder = 10
      OnClick = NextFrameClick
    end
    object GetASpectRatioBtn: TButton
      Left = 96
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Get Aspect'
      TabOrder = 11
      OnClick = GetASpectRatioClick
    end
    object SetAsp11Btn: TButton
      Left = 96
      Top = 41
      Width = 75
      Height = 25
      Caption = 'Set asp 1:1'
      TabOrder = 12
      OnClick = SetAsp11Click
    end
    object SetAsp43Btn: TButton
      Left = 96
      Top = 70
      Width = 75
      Height = 25
      Caption = 'Set asp 4:3'
      TabOrder = 13
      OnClick = SetAsp43Click
    end
    object GetVolume: TButton
      Left = 96
      Top = 99
      Width = 75
      Height = 25
      Caption = 'Get Volume'
      TabOrder = 14
      OnClick = GetVolumeClick
    end
    object SetVolumeUp10: TButton
      Left = 96
      Top = 128
      Width = 75
      Height = 25
      Caption = 'Volume +10'
      TabOrder = 15
      OnClick = SetVolumeUp10Click
    end
    object SetVolumeDo10: TButton
      Left = 96
      Top = 157
      Width = 75
      Height = 25
      Caption = 'Volume -10'
      TabOrder = 16
      OnClick = SetVolumeDo10Click
    end
    object GetPlayRateBtn: TButton
      Left = 96
      Top = 186
      Width = 75
      Height = 25
      Caption = 'Get Play Rate'
      TabOrder = 17
      OnClick = GetPlayRateBtnClick
    end
    object SetPlayRate2xBtn: TButton
      Left = 96
      Top = 215
      Width = 75
      Height = 25
      Caption = 'Play Rate 2x'
      TabOrder = 18
      OnClick = SetPlayRate2xBtnClick
    end
    object SetPlayRateHalfBtn: TButton
      Left = 96
      Top = 244
      Width = 75
      Height = 25
      Caption = 'Play Rate 1/2'
      TabOrder = 19
      OnClick = SetPlayRateHalfBtnClick
    end
    object FullScreenYesBtn: TButton
      Left = 96
      Top = 273
      Width = 75
      Height = 25
      Caption = 'FullScreen'
      TabOrder = 20
      OnClick = FullScreenYesBtnClick
    end
    object DeInterlaceBtn: TButton
      Left = 8
      Top = 335
      Width = 75
      Height = 25
      Caption = 'DeInterlace'
      TabOrder = 21
      OnClick = DeInterlaceBtnClick
    end
    object GetAudioChannel: TButton
      Left = 96
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Get Audio Ch'
      TabOrder = 22
      OnClick = GetAudioChannelClick
    end
    object SetAudioChannelLeft: TButton
      Left = 96
      Top = 335
      Width = 75
      Height = 25
      Caption = 'Set Audio C L'
      TabOrder = 23
      OnClick = SetAudioChannelLeftClick
    end
    object SetAudioChannelRight: TButton
      Left = 96
      Top = 366
      Width = 75
      Height = 25
      Caption = 'Set Audio C R'
      TabOrder = 24
      OnClick = SetAudioChannelRightClick
    end
    object SetAudioChannelStereo: TButton
      Left = 96
      Top = 397
      Width = 75
      Height = 25
      Caption = 'Set Audio C S'
      TabOrder = 26
      OnClick = SetAudioChannelStereoClick
    end
    object GetAudioOutListBtn: TButton
      Left = 8
      Top = 366
      Width = 75
      Height = 25
      Caption = 'AudioOutList'
      TabOrder = 25
      OnClick = GetAudioOutListBtnClick
    end
    object GetAudioOutDevEnumBtn: TButton
      Left = 8
      Top = 397
      Width = 75
      Height = 25
      Caption = 'AOutDevEnum'
      TabOrder = 27
      OnClick = GetAudioOutDevEnumBtnClick
    end
    object SetEqualizerBtn: TButton
      Left = 96
      Top = 428
      Width = 75
      Height = 25
      Caption = 'Set Equalizer'
      TabOrder = 28
      OnClick = SetEqualizerBtnClick
    end
    object GetEqPreListBtn: TButton
      Left = 96
      Top = 459
      Width = 75
      Height = 25
      Caption = 'EqalizerPreList'
      TabOrder = 29
      OnClick = GetEqPreListBtnClick
    end
    object ChAudioOut: TButton
      Left = 8
      Top = 428
      Width = 75
      Height = 25
      Caption = 'Ch Audio Out'
      TabOrder = 30
      OnClick = ChAudioOutClick
    end
    object GetAudioTrackListBtn: TButton
      Left = 8
      Top = 459
      Width = 75
      Height = 25
      Caption = 'AudioTrackList'
      TabOrder = 31
      OnClick = GetAudioTrackListBtnClick
    end
    object GetAudioFilterListBtn: TButton
      Left = 8
      Top = 490
      Width = 75
      Height = 25
      Caption = 'AudioFilterList'
      TabOrder = 32
      OnClick = GetAudioFilterListBtnClick
    end
    object GetVideoFilterListBtn: TButton
      Left = 96
      Top = 490
      Width = 75
      Height = 25
      Caption = 'VideoFilterList'
      TabOrder = 33
      OnClick = GetVideoFilterListBtnClick
    end
    object VideoAdjustBtn: TButton
      Left = 8
      Top = 521
      Width = 75
      Height = 25
      Caption = 'Video Adjust'
      TabOrder = 34
      OnClick = VideoAdjustBtnClick
    end
  end
  object LB: TListBox
    AlignWithMargins = True
    Left = 9
    Top = 309
    Width = 320
    Height = 176
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    ItemHeight = 13
    PopupMenu = LbPopupMenu
    TabOrder = 1
  end
  object MrlEdit: TEdit
    Left = 8
    Top = 20
    Width = 320
    Height = 21
    TabOrder = 2
    Text = '..\..\_testFiles\Maximize.mp4'
  end
  object PasLibVlcPlayer1: TPasLibVlcPlayer
    Left = 8
    Top = 45
    Height = 202
    OnClick = PasLibVlcPlayer1Click
    OnDblClick = PasLibVlcPlayer1DblClick
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
    Left = 8
    Top = 252
    Width = 320
    Height = 46
    TabOrder = 4
    object ProgLabel1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 28
      Width = 44
      Height = 14
      Align = alLeft
      Caption = '00:00:00'
      ExplicitHeight = 13
    end
    object ProgLabel2: TLabel
      AlignWithMargins = True
      Left = 272
      Top = 28
      Width = 44
      Height = 14
      Align = alRight
      Caption = '00:00:00'
      ExplicitHeight = 13
    end
    object ProgBar: TTrackBar
      Left = 1
      Top = 1
      Width = 318
      Height = 24
      Align = alTop
      PositionToolTip = ptBottom
      TabOrder = 0
      ThumbLength = 15
      TickStyle = tsNone
      OnChange = ProgBarChange
    end
  end
  object BtnSelect: TButton
    Left = 280
    Top = 21
    Width = 46
    Height = 19
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
    Top = 56
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
