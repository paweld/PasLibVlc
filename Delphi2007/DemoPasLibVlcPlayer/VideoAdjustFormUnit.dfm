object VideoAdjustForm: TVideoAdjustForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Video Adjust'
  ClientHeight = 509
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labVideoAdjustContrast: TLabel
    Left = 20
    Top = 52
    Width = 76
    Height = 13
    Caption = 'Adjust Contrast'
    FocusControl = tbVideoAdjustContrast
  end
  object labVideoAdjustBrightness: TLabel
    Left = 20
    Top = 140
    Width = 84
    Height = 13
    Caption = 'Adjust Brightness'
    FocusControl = tbVideoAdjustBrightness
  end
  object labVideoAdjustHue: TLabel
    Left = 20
    Top = 228
    Width = 53
    Height = 13
    Caption = 'Adjust Hue'
    FocusControl = tbVideoAdjustHue
  end
  object labVideoAdjustSaturation: TLabel
    Left = 20
    Top = 316
    Width = 84
    Height = 13
    Caption = 'Adjust Saturation'
    FocusControl = tbVideoAdjustSaturation
  end
  object labVideoAdjustGamma: TLabel
    Left = 20
    Top = 408
    Width = 66
    Height = 13
    Caption = 'AdjustGamma'
    FocusControl = tbVideoAdjustGamma
  end
  object chkVideoAdjustEnable: TCheckBox
    Left = 20
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Video Adjust Enable'
    TabOrder = 0
    OnClick = chkVideoAdjustEnableClick
  end
  object tbVideoAdjustContrast: TTrackBar
    Left = 20
    Top = 76
    Width = 293
    Height = 45
    Max = 200
    PageSize = 0
    Frequency = 10
    Position = 100
    TabOrder = 1
    OnChange = tbVideoAdjustContrastChange
  end
  object tbVideoAdjustBrightness: TTrackBar
    Left = 20
    Top = 164
    Width = 293
    Height = 45
    Max = 200
    PageSize = 0
    Frequency = 10
    Position = 100
    TabOrder = 2
    OnChange = tbVideoAdjustBrightnessChange
  end
  object tbVideoAdjustHue: TTrackBar
    Left = 20
    Top = 252
    Width = 293
    Height = 45
    Max = 360
    PageSize = 0
    Frequency = 10
    TabOrder = 3
    OnChange = tbVideoAdjustHueChange
  end
  object tbVideoAdjustSaturation: TTrackBar
    Left = 20
    Top = 340
    Width = 293
    Height = 45
    Max = 300
    PageSize = 0
    Frequency = 10
    Position = 100
    TabOrder = 4
    OnChange = tbVideoAdjustSaturationChange
  end
  object tbVideoAdjustGamma: TTrackBar
    Left = 20
    Top = 432
    Width = 293
    Height = 45
    Max = 1000
    PageSize = 0
    Frequency = 50
    Position = 100
    TabOrder = 5
    OnChange = tbVideoAdjustGammaChange
  end
end
