object FrmGauge: TFrmGauge
  Left = 204
  Top = 392
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 48
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GaugeGlob: TGauge
    Left = 496
    Top = 13
    Width = 33
    Height = 17
    BackColor = clBtnFace
    BorderStyle = bsNone
    ForeColor = clBtnFace
    Progress = 0
  end
  object GaugeCurrent: TGauge
    Left = 8
    Top = 13
    Width = 33
    Height = 17
    BackColor = clBtnFace
    BorderStyle = bsNone
    ForeColor = clBtnFace
    Progress = 0
  end
  object ProgressBar: TProgressBar
    Left = 48
    Top = 17
    Width = 441
    Height = 14
    TabOrder = 0
  end
end
