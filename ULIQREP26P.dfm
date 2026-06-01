object FLIQREP26P: TFLIQREP26P
  Left = 233
  Top = 199
  BorderStyle = bsDialog
  Caption = 'Verificador de Vales de Cr'#233'dito'
  ClientHeight = 201
  ClientWidth = 480
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
    Top = 149
    Width = 480
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BPrever: TButton
      Left = 48
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Prever'
      Default = True
      TabOrder = 0
      OnClick = BImprimirClick
    end
    object BImprimir: TButton
      Left = 151
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BImprimirClick
    end
    object BOpciones: TButton
      Left = 254
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Opciones'
      TabOrder = 2
      OnClick = BOpcionesClick
    end
    object BCancelar: TButton
      Left = 357
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
    Width = 201
    Height = 77
    Align = alLeft
    Caption = 'Estaci'#243'n '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 9
      Top = 20
      Width = 180
      Height = 21
      KeyField = 'CLAVE'
      ListField = 'Descripcion'
      ListSource = DMGAS.DS_Ests
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 9
      Top = 48
      Width = 168
      Height = 17
      Caption = 'Todos los Clientes en CXC'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 201
    Top = 0
    Width = 157
    Height = 77
    Align = alClient
    Caption = 'Per'#237'odo '
    TabOrder = 2
    object Label2: TLabel
      Left = 14
      Top = 24
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'A la fecha:'
    end
    object MaskEdit4: TMaskEdit
      Left = 73
      Top = 20
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 77
    Width = 480
    Height = 72
    Align = alBottom
    Caption = 'Impresora  '
    TabOrder = 3
    object ComboBox1: TComboBox
      Left = 94
      Top = 25
      Width = 291
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
  end
  object GroupBox4: TGroupBox
    Left = 358
    Top = 0
    Width = 122
    Height = 77
    Align = alRight
    Caption = 'Orden '
    TabOrder = 4
    object ComboBox2: TComboBox
      Left = 11
      Top = 24
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Num'#233'rico'
      Items.Strings = (
        'Num'#233'rico'
        'Alfab'#233'tico')
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 320
    Top = 232
  end
end
