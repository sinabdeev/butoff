object FrmData: TFrmData
  Left = 638
  Top = 434
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmData'
  ClientHeight = 236
  ClientWidth = 205
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxSave: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 105
    Caption = 'GroupBoxSave'
    TabOrder = 0
    object Label1: TLabel
      Left = 104
      Top = 40
      Width = 45
      Height = 13
      Caption = #1090#1086#1095#1085#1086#1089#1090#1100
    end
    object B_Save: TButton
      Left = 40
      Top = 64
      Width = 121
      Height = 25
      Caption = 'Save'
      TabOrder = 0
      OnClick = B_SaveClick
    end
    object LevelEdit: TSpinEdit
      Left = 56
      Top = 32
      Width = 41
      Height = 26
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxValue = 8
      MinValue = 1
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Value = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 120
    Width = 185
    Height = 105
    Caption = 'GroupBoxLoad'
    TabOrder = 1
    object BtnLoad: TButton
      Left = 40
      Top = 64
      Width = 121
      Height = 25
      Caption = 'BtnLoad'
      TabOrder = 0
      OnClick = BtnLoadClick
    end
  end
end
