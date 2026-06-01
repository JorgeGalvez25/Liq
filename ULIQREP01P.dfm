object FLIQREP01P: TFLIQREP01P
  Left = 229
  Top = 179
  BorderStyle = bsDialog
  Caption = 'Reporte de Cupones Recuperados / Contabilidad'
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
      Left = 60
      Top = 20
      Width = 261
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
      OnChange = ComboBox1Change
    end
    object CheckBox1: TCheckBox
      Left = 61
      Top = 45
      Width = 142
      Height = 17
      Caption = 'Imprimir con IVA inclu'#237'do'
      TabOrder = 1
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
      Left = 15
      Top = 26
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'De la fecha:'
    end
    object Label2: TLabel
      Left = 22
      Top = 53
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'A la fecha:'
    end
    object MaskEdit3: TMaskEdit
      Left = 82
      Top = 20
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      OnExit = MaskEdit3Exit
    end
    object MaskEdit4: TMaskEdit
      Left = 82
      Top = 49
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 11
      Top = 25
      Width = 180
      Height = 21
      KeyField = 'CLAVE'
      ListField = 'Descripcion'
      ListSource = DMGAS.DS_Ests
      TabOrder = 0
      OnClick = DBLookupComboBox2Click
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 12
      Top = 58
      Width = 180
      Height = 21
      KeyField = 'CAJA'
      ListField = 'DESCRIPCION'
      ListSource = DSL_Caja
      TabOrder = 1
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 336
    Top = 150
  end
  object QL_Caja: TQuery
    DatabaseName = 'DBGASOL2'
    SQL.Strings = (
      'Select Caja,Descripcion,VarIni from DGASCAJA'
      'Where Tipo='#39'Liquidacion'#39' and Estacion=:pestacion'
      'Order By Caja')
    Left = 8
    Top = 128
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
    Left = 336
    Top = 120
  end
end
