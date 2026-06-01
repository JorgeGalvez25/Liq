object FLIQTURCVP: TFLIQTURCVP
  Left = 229
  Top = 179
  BorderStyle = bsDialog
  Caption = 'Resumen de Vales de Crédito del Turno'
  ClientHeight = 193
  ClientWidth = 388
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
    Top = 143
    Width = 388
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BPrever: TButton
      Left = 16
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
      Left = 203
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Opciones'
      TabOrder = 2
      OnClick = BOpcionesClick
    end
    object BCancelar: TButton
      Left = 296
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
    Top = 69
    Width = 388
    Height = 74
    Align = alBottom
    Caption = 'Impresora '
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 54
      Top = 26
      Width = 280
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 0
    Width = 388
    Height = 69
    Align = alClient
    Caption = 'Opciones '
    TabOrder = 2
    object RadioButton1: TRadioButton
      Left = 65
      Top = 18
      Width = 113
      Height = 17
      Caption = 'Resumido'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Left = 65
      Top = 39
      Width = 113
      Height = 17
      Caption = 'Detallado'
      TabOrder = 1
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 336
    Top = 150
  end
end
