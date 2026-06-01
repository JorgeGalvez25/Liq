object FLIQREP02P: TFLIQREP02P
  Left = 229
  Top = 179
  BorderStyle = bsDialog
  Caption = 'Reporte de Cupones Recuperados'
  ClientHeight = 230
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 178
    Width = 380
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object BPrever: TButton
      Left = 21
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Prever'
      Default = True
      TabOrder = 0
      OnClick = BImprimirClick
    end
    object BImprimir: TButton
      Left = 109
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BImprimirClick
    end
    object BOpciones: TButton
      Left = 197
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Opciones'
      TabOrder = 2
      OnClick = BOpcionesClick
    end
    object BCancelar: TButton
      Left = 285
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Salir'
      ModalResult = 2
      TabOrder = 3
      OnClick = BCancelarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 104
    Width = 380
    Height = 74
    Align = alBottom
    Caption = 'Impresora '
    TabOrder = 1
    object ComboBox1: TComboBox
      Left = 51
      Top = 26
      Width = 261
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 177
    Height = 104
    Align = alLeft
    Caption = 'Per'#237'odo '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 31
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'De la fecha:'
    end
    object Label2: TLabel
      Left = 28
      Top = 58
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'A la fecha:'
    end
    object MaskEdit3: TMaskEdit
      Left = 88
      Top = 25
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = MaskEdit3Exit
    end
    object MaskEdit4: TMaskEdit
      Left = 88
      Top = 54
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object GroupBox3: TGroupBox
    Left = 177
    Top = 0
    Width = 203
    Height = 104
    Align = alClient
    Caption = 'Seleccionar '
    TabOrder = 3
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 11
      Top = 26
      Width = 179
      Height = 21
      KeyField = 'CLAVE'
      ListField = 'Descripcion'
      ListSource = DMGAS.DS_Ests
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 14
      Top = 56
      Width = 123
      Height = 17
      Caption = 'Todas las estaciones '
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 336
    Top = 150
  end
  object DSL_Caja: TDataSource
    Left = 336
    Top = 120
  end
end
