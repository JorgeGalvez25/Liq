object FLIQREP25P: TFLIQREP25P
  Left = 238
  Top = 229
  BorderStyle = bsDialog
  Caption = 'Relaci'#243'n de Vales de Cr'#233'dito por Combustible'
  ClientHeight = 223
  ClientWidth = 505
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
    Top = 173
    Width = 505
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BPrever: TButton
      Left = 47
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Prever'
      Default = True
      TabOrder = 0
      OnClick = BImprimirClick
    end
    object BImprimir: TButton
      Left = 159
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BImprimirClick
    end
    object BOpciones: TButton
      Left = 271
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Opciones'
      TabOrder = 2
      OnClick = BOpcionesClick
    end
    object BCancelar: TButton
      Left = 383
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
    Width = 505
    Height = 69
    Align = alBottom
    Caption = 'Impresora '
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 94
      Top = 15
      Width = 317
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
    object CheckBox1: TCheckBox
      Left = 94
      Top = 38
      Width = 161
      Height = 17
      Caption = 'Saltar P'#225'gina en Cliente'
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 104
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 201
      Top = 0
      Width = 151
      Height = 104
      Align = alClient
      Caption = 'Per'#237'odo '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 6
        Top = 28
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'De la fecha:'
      end
      object Label2: TLabel
        Left = 13
        Top = 57
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'A la fecha:'
      end
      object MaskEdit3: TMaskEdit
        Left = 73
        Top = 22
        Width = 68
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = MaskEdit3Exit
      end
      object MaskEdit4: TMaskEdit
        Left = 73
        Top = 53
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
      Width = 201
      Height = 104
      Align = alLeft
      Caption = 'Seleccionar '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 10
        Top = 18
        Width = 180
        Height = 21
        KeyField = 'CLAVE'
        ListField = 'Descripcion'
        ListSource = DMGAS.DS_Ests
        TabOrder = 0
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 10
        Top = 50
        Width = 180
        Height = 21
        Enabled = False
        KeyField = 'CLAVECLASIF'
        ListField = 'DESCRIPCION'
        ListSource = DSQL_Clas
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 10
        Top = 73
        Width = 111
        Height = 17
        Caption = 'Todos los Clientes'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox3Click
      end
    end
    object GroupBox4: TGroupBox
      Left = 352
      Top = 0
      Width = 153
      Height = 104
      Align = alRight
      Caption = 'Opciones '
      TabOrder = 2
      object ComboBox2: TComboBox
        Left = 16
        Top = 20
        Width = 97
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'Detallado'
        Items.Strings = (
          'Detallado'
          'Resumido')
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 48
        Width = 121
        Height = 17
        Caption = 'Solo Cargos Directos'
        TabOrder = 1
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 336
    Top = 150
  end
  object QL_Clas: TQuery
    DatabaseName = 'DBIMAGEN'
    SQL.Strings = (
      'Select ClaveClasif,Descripcion from DGENCLAS'
      'where ClaveCata='#39'CLIE'#39
      'Order by ClaveClasif')
    Left = 16
    Top = 131
    object QL_ClasCLAVECLASIF: TIntegerField
      FieldName = 'CLAVECLASIF'
    end
    object QL_ClasDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object DSQL_Clas: TDataSource
    DataSet = QL_Clas
    Left = 48
    Top = 131
  end
end
