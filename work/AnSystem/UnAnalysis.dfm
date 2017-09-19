object FrmAnalysis: TFrmAnalysis
  Left = 595
  Top = 306
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmAnalysis'
  ClientHeight = 240
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 297
    Height = 225
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = ' Process'
      object mean: TButton
        Left = 8
        Top = 20
        Width = 75
        Height = 25
        Caption = 'Mean'
        TabOrder = 0
        OnClick = meanClick
      end
      object Disp: TButton
        Left = 8
        Top = 52
        Width = 75
        Height = 25
        Caption = 'Variance'
        TabOrder = 1
        OnClick = DispClick
      end
      object Dif_proc: TButton
        Left = 8
        Top = 84
        Width = 75
        Height = 25
        Caption = 'Diff'
        TabOrder = 2
        OnClick = Dif_procClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = ' Sequence'
      ImageIndex = 1
      object Uload_sort: TButton
        Left = 8
        Top = 72
        Width = 65
        Height = 22
        Caption = 'Sort'
        TabOrder = 0
        OnClick = Uload_sortClick
      end
      object StringGrid1: TStringGrid
        Left = 84
        Top = 8
        Width = 101
        Height = 181
        ColCount = 1
        DefaultColWidth = 81
        FixedCols = 0
        RowCount = 11
        GridLineWidth = 0
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Memo1: TMemo
        Left = 191
        Top = 8
        Width = 94
        Height = 181
        TabOrder = 2
      end
      object Edit_Value: TEdit
        Left = 8
        Top = 8
        Width = 65
        Height = 21
        TabOrder = 3
        Text = '120'
        OnChange = FormShow
      end
      object Button_posled: TButton
        Left = 8
        Top = 40
        Width = 65
        Height = 22
        Caption = 'Sequence'
        TabOrder = 4
        OnClick = posled_click
      end
    end
    object TabSheet3: TTabSheet
      Caption = ' Options'
      ImageIndex = 2
      object Label1: TLabel
        Left = 56
        Top = 12
        Width = 29
        Height = 13
        Caption = 'fidelity'
      end
      object LevelEdit: TSpinEdit
        Left = 8
        Top = 8
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
        TabOrder = 0
        Value = 5
      end
    end
  end
end
