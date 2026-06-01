object FLIQCCAJAP: TFLIQCCAJAP
  Left = 247
  Top = 162
  Width = 378
  Height = 164
  Caption = 'Liquidaciones: Impresión de Corte de Caja'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
    Top = 92
    Width = 370
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BPrever: TButton
      Left = 16
      Top = 11
      Width = 75
      Height = 22
      Caption = '&Prever'
      Default = True
      TabOrder = 0
      OnClick = BPreverClick
    end
    object BImprimir: TButton
      Left = 104
      Top = 11
      Width = 75
      Height = 22
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BPreverClick
    end
    object BOpciones: TButton
      Left = 192
      Top = 11
      Width = 75
      Height = 22
      Caption = '&Opciones'
      TabOrder = 2
      OnClick = BOpcionesClick
    end
    object BCancelar: TButton
      Left = 280
      Top = 11
      Width = 75
      Height = 22
      Caption = '&Salir'
      ModalResult = 2
      TabOrder = 3
      OnClick = BCancelarClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 113
    Height = 92
    Align = alLeft
    Caption = 'Formato '
    TabOrder = 1
    object RbResumido: TRadioButton
      Left = 16
      Top = 58
      Width = 90
      Height = 17
      Caption = 'Resumido'
      TabOrder = 0
    end
    object RbDetallado: TRadioButton
      Left = 16
      Top = 25
      Width = 90
      Height = 17
      Caption = 'Detallado '
      Checked = True
      TabOrder = 1
      TabStop = True
    end
  end
  object GroupBox2: TGroupBox
    Left = 113
    Top = 0
    Width = 257
    Height = 92
    Align = alClient
    Caption = 'Impresora  '
    TabOrder = 2
    object ComboBox1: TComboBox
      Left = 13
      Top = 37
      Width = 233
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 8
    Top = 264
  end
end
