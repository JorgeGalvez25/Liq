object FLIQREP04P: TFLIQREP04P
  Left = 229
  Top = 179
  BorderStyle = bsDialog
  Caption = 'Verificador de Cupones Vendidos / Facturados'
  ClientHeight = 269
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
    Top = 217
    Width = 380
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BPrever: TButton
      Left = 22
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Prever'
      Default = True
      TabOrder = 0
      OnClick = BImprimirClick
    end
    object BImprimir: TButton
      Left = 110
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 1
      OnClick = BImprimirClick
    end
    object BOpciones: TButton
      Left = 198
      Top = 13
      Width = 75
      Height = 25
      Caption = '&Opciones'
      TabOrder = 2
      OnClick = BOpcionesClick
    end
    object BCancelar: TButton
      Left = 286
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
    Width = 177
    Height = 88
    Align = alLeft
    Caption = 'Período '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 28
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
      Top = 22
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object MaskEdit4: TMaskEdit
      Left = 88
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
    Left = 177
    Top = 0
    Width = 203
    Height = 88
    Align = alClient
    Caption = 'Seleccionar '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 11
      Top = 18
      Width = 180
      Height = 21
      KeyField = 'CLAVE'
      ListField = 'Descripcion'
      ListSource = DMGAS.DS_Ests
      TabOrder = 0
      OnClick = DBLookupComboBox2Click
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 11
      Top = 47
      Width = 180
      Height = 21
      KeyField = 'CAJA'
      ListField = 'DESCRIPCION'
      ListSource = DSL_Caja
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 88
    Width = 380
    Height = 129
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object GroupBox2: TGroupBox
      Left = 0
      Top = 65
      Width = 380
      Height = 64
      Align = alBottom
      Caption = 'Impresora '
      TabOrder = 0
      object ComboBox1: TComboBox
        Left = 61
        Top = 22
        Width = 261
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
      Width = 177
      Height = 65
      Align = alLeft
      Caption = 'Formato '
      TabOrder = 1
      object ComboBox2: TComboBox
        Left = 23
        Top = 20
        Width = 100
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'Resumido'
        Items.Strings = (
          'Resumido'
          'Detallado')
      end
    end
    object GroupBox5: TGroupBox
      Left = 177
      Top = 0
      Width = 203
      Height = 65
      Align = alClient
      Caption = 'Opciones '
      TabOrder = 2
      object ComboBox3: TComboBox
        Left = 13
        Top = 21
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'Solo Diferencias'
        Items.Strings = (
          'Solo Diferencias'
          'Todos')
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 176
    Top = 214
  end
  object QL_Caja: TQuery
    DatabaseName = 'DBGASOL2'
    SQL.Strings = (
      'Select Caja,Descripcion,VarIni from DGASCAJA'
      'Where Tipo='#39'Facturacion'#39' and Estacion=:pestacion'
      'Order By Caja')
    Left = 112
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end>
    object QL_CajaCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object QL_CajaDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
    object QL_CajaVARINI: TMemoField
      FieldName = 'VARINI'
      BlobType = ftMemo
      Size = 1
    end
  end
  object DSL_Caja: TDataSource
    DataSet = QL_Caja
    Left = 144
    Top = 208
  end
end
