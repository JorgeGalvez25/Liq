object FLIQREP03P: TFLIQREP03P
  Left = 343
  Top = 218
  BorderStyle = bsDialog
  Caption = 'Reporte de Cupones Pendientes de Recuperar'
  ClientHeight = 275
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 234
    Width = 460
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BPrever: TButton
      Left = 12
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Prever'
      Default = True
      TabOrder = 0
      OnClick = BImprimirClick
    end
    object BImprimir: TButton
      Left = 127
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BImprimirClick
    end
    object BOpciones: TButton
      Left = 241
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Opciones'
      TabOrder = 2
      OnClick = BOpcionesClick
    end
    object BCancelar: TButton
      Left = 356
      Top = 8
      Width = 85
      Height = 25
      Caption = '&Salir'
      ModalResult = 2
      TabOrder = 3
      OnClick = BCancelarClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 295
    Top = 0
    Width = 165
    Height = 91
    Align = alRight
    Caption = 'Per'#237'odo de Venta '
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 29
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'De la fecha:'
    end
    object Label2: TLabel
      Left = 20
      Top = 56
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'A la fecha:'
    end
    object MaskEdit3: TMaskEdit
      Left = 81
      Top = 23
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MaskEdit4: TMaskEdit
      Left = 81
      Top = 52
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
    Top = 0
    Width = 295
    Height = 91
    Align = alClient
    Caption = 'Estaci'#243'n de Venta '
    TabOrder = 2
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 11
      Top = 26
      Width = 206
      Height = 21
      KeyField = 'CLAVE'
      ListField = 'Descripcion'
      ListSource = DMGAS.DS_Ests
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 11
      Top = 54
      Width = 123
      Height = 17
      Caption = 'Todas las estaciones '
      TabOrder = 1
      OnClick = CheckBox1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 91
    Width = 460
    Height = 143
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 0
      Top = 79
      Width = 460
      Height = 64
      Align = alBottom
      Caption = 'Impresora '
      TabOrder = 1
      object ComboBox1: TComboBox
        Left = 12
        Top = 22
        Width = 429
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
      Width = 169
      Height = 79
      Align = alLeft
      Caption = 'Serie '
      TabOrder = 2
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 12
        Top = 22
        Width = 141
        Height = 21
        KeyField = 'CLAVE'
        ListField = 'DESCRIPCION'
        ListSource = DMCUP.DS_Serc
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 12
        Top = 49
        Width = 123
        Height = 17
        Caption = 'Todas las Series'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox2Click
      end
    end
    object GroupBox5: TGroupBox
      Left = 169
      Top = 0
      Width = 126
      Height = 79
      Align = alClient
      Caption = 'Formato '
      TabOrder = 3
      object ComboBox2: TComboBox
        Left = 10
        Top = 29
        Width = 99
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'Detallado'
        Items.Strings = (
          'Detallado'
          'Resumido')
      end
    end
    object GroupBox6: TGroupBox
      Left = 295
      Top = 0
      Width = 165
      Height = 79
      Align = alRight
      Caption = 'Fecha de Recuperaci'#243'n '
      TabOrder = 0
      object Label3: TLabel
        Left = 18
        Top = 33
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'A la fecha:'
      end
      object MaskEdit1: TMaskEdit
        Left = 79
        Top = 29
        Width = 68
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 398
    Top = 190
  end
  object DSL_Caja: TDataSource
    Left = 353
    Top = 192
  end
end
