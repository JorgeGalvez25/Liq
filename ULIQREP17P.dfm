object FLIQREP17P: TFLIQREP17P
  Left = 233
  Top = 199
  BorderStyle = bsDialog
  Caption = 'Resumen de Ventas de Productos por Despachador'
  ClientHeight = 208
  ClientWidth = 382
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
    Top = 156
    Width = 382
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object BPrever: TButton
      Left = 14
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Prever'
      Default = True
      TabOrder = 0
      OnClick = BImprimirClick
    end
    object BImprimir: TButton
      Left = 106
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BImprimirClick
    end
    object BOpciones: TButton
      Left = 199
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Opciones'
      TabOrder = 2
      OnClick = BOpcionesClick
    end
    object BCancelar: TButton
      Left = 291
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Salir'
      ModalResult = 2
      TabOrder = 3
      OnClick = BCancelarClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 217
    Height = 84
    Align = alLeft
    Caption = 'Estación '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 8
      Top = 25
      Width = 200
      Height = 21
      KeyField = 'CLAVE'
      ListField = 'Descripcion'
      ListSource = DMGAS.DS_Ests
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 217
    Top = 0
    Width = 165
    Height = 84
    Align = alClient
    Caption = 'Período '
    TabOrder = 1
    object Label1: TLabel
      Left = 14
      Top = 25
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'De la fecha:'
    end
    object Label2: TLabel
      Left = 21
      Top = 52
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'A la fecha:'
    end
    object MaskEdit3: TMaskEdit
      Left = 81
      Top = 19
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = MaskEdit3Exit
    end
    object MaskEdit4: TMaskEdit
      Left = 81
      Top = 48
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 84
    Width = 382
    Height = 72
    Align = alBottom
    Caption = 'Impresora  '
    TabOrder = 2
    object ComboBox1: TComboBox
      Left = 74
      Top = 25
      Width = 233
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 320
    Top = 232
  end
end
