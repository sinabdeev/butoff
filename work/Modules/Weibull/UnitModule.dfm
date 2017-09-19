object Form1: TForm1
  Left = 263
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Module'
  ClientHeight = 320
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 144
    Top = 267
    Width = 15
    Height = 13
    Caption = 'b ='
  end
  object Label2: TLabel
    Left = 144
    Top = 291
    Width = 18
    Height = 13
    Caption = 'c = '
  end
  object Chart1: TChart
    Left = 8
    Top = 8
    Width = 400
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Color = clWhite
    Gradient.EndColor = clWhite
    Gradient.Visible = True
    LeftWall.Color = clWhite
    Title.Color = clWhite
    Title.Text.Strings = (
      'TChart')
    BackColor = clWhite
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.ExactDateTime = False
    LeftAxis.Increment = 0.100000000000000000
    LeftAxis.Maximum = 1.100000000000000000
    LeftAxis.Minimum = -0.100000000000000000
    Legend.Visible = False
    TopAxis.ExactDateTime = False
    TopAxis.Increment = 1.000000000000000000
    View3D = False
    View3DWalls = False
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'funras'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'plotnst'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object Memo1: TMemo
    Left = 416
    Top = 8
    Width = 89
    Height = 249
    PopupMenu = PopupMenu1
    TabOrder = 1
  end
  object Weibull: TButton
    Left = 248
    Top = 264
    Width = 89
    Height = 49
    Caption = 'Weibull'
    TabOrder = 2
    OnClick = WeibullClick
  end
  object Close: TButton
    Left = 416
    Top = 264
    Width = 89
    Height = 49
    Caption = 'Close'
    TabOrder = 3
    OnClick = CloseClick
  end
  object par_b: TEdit
    Left = 168
    Top = 264
    Width = 65
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object par_c: TEdit
    Left = 168
    Top = 288
    Width = 65
    Height = 21
    TabOrder = 5
    Text = '0'
  end
  object Button1: TButton
    Left = 8
    Top = 264
    Width = 89
    Height = 49
    Caption = 'Clear'
    TabOrder = 6
    OnClick = Clear
  end
  object PopupMenu1: TPopupMenu
    Left = 448
    Top = 104
    object N1: TMenuItem
      Caption = #1060#1091#1085#1082#1094#1080#1103' '#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1103
      OnClick = fun_distr
    end
    object N3: TMenuItem
      Caption = #1055#1083#1086#1090#1085#1086#1089#1090#1100
      OnClick = N3Click
    end
    object N2: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N2Click
    end
  end
end
