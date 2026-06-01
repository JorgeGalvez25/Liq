object FLIQDESGLO: TFLIQDESGLO
  Left = 324
  Top = 156
  Width = 448
  Height = 291
  Caption = 'Desglose de Liquidaci'#243'n'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 211
      Top = 17
      Width = 51
      Height = 13
      Caption = 'A la Fecha'
    end
    object Label3: TLabel
      Left = 9
      Top = 18
      Width = 58
      Height = 13
      Caption = 'De la Fecha'
    end
    object StaticText1: TStaticText
      Left = 268
      Top = 14
      Width = 91
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
    end
    object StaticText4: TStaticText
      Left = 76
      Top = 14
      Width = 91
      Height = 17
      Alignment = taRightJustify
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 440
    Height = 138
    Align = alClient
    DataSource = DS_Auxi
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nombre'
        ReadOnly = True
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Litros'
        Title.Alignment = taRightJustify
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Importe'
        ReadOnly = True
        Title.Alignment = taRightJustify
        Width = 108
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 179
    Width = 440
    Height = 78
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 440
      Height = 28
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 192
        Top = 8
        Width = 27
        Height = 13
        Caption = 'Total '
      end
      object StaticText3: TStaticText
        Left = 222
        Top = 5
        Width = 81
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '       '
        Color = clHighlightText
        ParentColor = False
        TabOrder = 0
      end
      object StaticText2: TStaticText
        Left = 306
        Top = 5
        Width = 111
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '       '
        Color = clHighlightText
        ParentColor = False
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 28
      Width = 440
      Height = 50
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object BitBtn1: TBitBtn
        Left = 344
        Top = 12
        Width = 75
        Height = 25
        Caption = 'Aceptar'
        TabOrder = 0
        Kind = bkOK
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 14
        Width = 225
        Height = 17
        Caption = 'Activar Desglose de Liquidaci'#243'n'
        TabOrder = 1
      end
    end
  end
  object DS_Auxi: TDataSource
    DataSet = FLIQREP05P.TT_Auxi
    Left = 8
    Top = 120
  end
end
