object FrmVisual: TFrmVisual
  Left = 339
  Top = 224
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmVisual'
  ClientHeight = 325
  ClientWidth = 296
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
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 281
    Height = 209
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1050#1072#1085#1074#1072
      object GroupBox3: TGroupBox
        Left = 2
        Top = 0
        Width = 141
        Height = 73
        Caption = '  '#1064#1072#1075' '#1089#1077#1090#1082#1080' '#1087#1086' '#1086#1089#1103#1084'  '
        TabOrder = 0
        object Label18: TLabel
          Left = 55
          Top = 25
          Width = 78
          Height = 13
          Caption = #1087#1086' '#1086#1089#1080' '#1072#1073#1089#1094#1080#1089#1089
        end
        object Label19: TLabel
          Left = 55
          Top = 50
          Width = 77
          Height = 13
          Caption = #1087#1086' '#1086#1089#1080' '#1086#1088#1076#1080#1085#1072#1090
        end
        object Edit8: TEdit
          Left = 8
          Top = 22
          Width = 43
          Height = 21
          TabOrder = 0
          Text = '5'
        end
        object Edit11: TEdit
          Left = 8
          Top = 47
          Width = 43
          Height = 21
          TabOrder = 1
          Text = '5'
        end
      end
      object GroupBox2: TGroupBox
        Left = 2
        Top = 80
        Width = 142
        Height = 97
        Caption = ' '#1044#1080#1072#1087#1086#1079#1086#1085' '#1079#1085#1072#1095#1077#1085#1080#1081'  '
        TabOrder = 1
        object Label5: TLabel
          Left = 55
          Top = 25
          Width = 53
          Height = 13
          Caption = #1084#1072#1082#1089#1080#1084#1091#1084
        end
        object Label9: TLabel
          Left = 55
          Top = 50
          Width = 47
          Height = 13
          Caption = #1084#1080#1085#1080#1084#1091#1084
        end
        object Edit2: TEdit
          Left = 8
          Top = 22
          Width = 43
          Height = 20
          AutoSize = False
          TabOrder = 0
          Text = '30'
        end
        object Edit3: TEdit
          Left = 8
          Top = 47
          Width = 43
          Height = 20
          AutoSize = False
          TabOrder = 1
          Text = '-30'
        end
      end
      object Margins: TGroupBox
        Left = 152
        Top = 0
        Width = 113
        Height = 177
        Caption = ' Margins '
        TabOrder = 2
        object Label1: TLabel
          Left = 60
          Top = 50
          Width = 24
          Height = 13
          Caption = #1042#1077#1088#1090
        end
        object Label2: TLabel
          Left = 59
          Top = 25
          Width = 30
          Height = 13
          Caption = #1043#1086#1088#1080#1079
        end
        object Edit1: TEdit
          Left = 8
          Top = 22
          Width = 43
          Height = 21
          TabOrder = 0
          Text = '30'
        end
        object Edit4: TEdit
          Left = 8
          Top = 47
          Width = 43
          Height = 21
          TabOrder = 1
          Text = '25'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1043#1088#1072#1092#1080#1082#1080
      ImageIndex = 1
      object CheckBox9: TCheckBox
        Left = 6
        Top = 5
        Width = 173
        Height = 17
        Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1090#1086#1095#1082#1072#1084#1080' /'#1083#1080#1085#1080#1103#1084#1080
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1062#1074#1077#1090
      ImageIndex = 2
      object GroupBox6: TGroupBox
        Left = 2
        Top = 2
        Width = 271
        Height = 127
        Caption = '  '#1055#1086#1089#1090#1086#1103#1085#1085#1099#1081' '#1094#1074#1077#1090'  '
        TabOrder = 0
        object Label33: TLabel
          Left = 16
          Top = 20
          Width = 37
          Height = 13
          Caption = #1057#1077#1088#1080#1080' :'
        end
        object Label41: TLabel
          Left = 16
          Top = 48
          Width = 36
          Height = 13
          Caption = #1057#1077#1090#1082#1072' :'
        end
        object Label3: TLabel
          Left = 16
          Top = 100
          Width = 36
          Height = 13
          Caption = #1058#1077#1082#1089#1090' :'
        end
        object Label4: TLabel
          Left = 16
          Top = 76
          Width = 29
          Height = 13
          Caption = #1060#1086#1085' :'
        end
        object StaticText4: TStaticText
          Left = 104
          Top = 96
          Width = 41
          Height = 20
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clBlack
          ParentColor = False
          TabOrder = 0
          OnClick = StaticText4Click
        end
        object StaticText3: TStaticText
          Left = 104
          Top = 72
          Width = 41
          Height = 20
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clWhite
          ParentColor = False
          TabOrder = 1
          OnClick = StaticText3Click
        end
        object StaticText1: TStaticText
          Left = 104
          Top = 24
          Width = 41
          Height = 20
          AutoSize = False
          BorderStyle = sbsSunken
          Color = clTeal
          ParentColor = False
          TabOrder = 2
          OnClick = StaticText1Click
        end
        object StaticText2: TStaticText
          Left = 104
          Top = 48
          Width = 41
          Height = 20
          AutoSize = False
          BorderStyle = sbsSunken
          Caption = '  '
          Color = clSilver
          ParentColor = False
          TabOrder = 3
          OnClick = StaticText2Click
        end
      end
      object CheckBox6: TCheckBox
        Left = 12
        Top = 135
        Width = 135
        Height = 17
        Caption = #1057#1083#1091#1095#1072#1081#1085#1099#1081' '#1094#1074#1077#1090' '#1089#1077#1088#1080#1081
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
  end
  object BtnInput: TButton
    Left = 8
    Top = 264
    Width = 65
    Height = 25
    Caption = 'BtnInput'
    TabOrder = 1
    OnClick = BtnInputClick
  end
  object BtnClear: TButton
    Left = 8
    Top = 296
    Width = 65
    Height = 25
    Caption = 'BtnClear'
    TabOrder = 2
    OnClick = BtnClearClick
  end
  object BtnGrid: TButton
    Left = 80
    Top = 296
    Width = 65
    Height = 25
    Caption = 'BtnGrid'
    TabOrder = 3
    OnClick = BtnGridClick
  end
  object BtnSeries: TButton
    Left = 152
    Top = 296
    Width = 137
    Height = 25
    Caption = 'BtnSeries'
    TabOrder = 4
    OnClick = BtnSeriesClick
  end
  object EditProcFirst: TEdit
    Left = 152
    Top = 264
    Width = 65
    Height = 21
    TabOrder = 5
    Text = '1'
  end
  object EditProcLast: TEdit
    Left = 224
    Top = 264
    Width = 65
    Height = 21
    TabOrder = 6
    Text = '25'
  end
  object Panel2: TPanel
    Left = 8
    Top = 226
    Width = 281
    Height = 26
    Align = alCustom
    TabOrder = 7
    object GaugeCurrent: TGauge
      Left = 8
      Top = 3
      Width = 33
      Height = 17
      BackColor = clBtnFace
      BorderStyle = bsNone
      ForeColor = clBtnFace
      Progress = 0
      Visible = False
    end
    object GaugeGlob: TGauge
      Left = 240
      Top = 3
      Width = 33
      Height = 17
      BackColor = clBtnFace
      BorderStyle = bsNone
      ForeColor = clBtnFace
      Progress = 0
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 48
      Top = 5
      Width = 185
      Height = 16
      TabOrder = 0
      Visible = False
    end
  end
  object ColorDialog1: TColorDialog
    Left = 222
    Top = 185
  end
end
