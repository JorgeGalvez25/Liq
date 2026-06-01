object FLIQTURCJT: TFLIQTURCJT
  Left = 378
  Top = 257
  Width = 320
  Height = 221
  BorderIcons = [biSystemMenu]
  Caption = 'Modificar Jede de Turno'
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
    Width = 312
    Height = 152
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 5
      Width = 41
      Height = 13
      Caption = 'Estaci'#243'n'
    end
    object DBText1: TDBText
      Left = 14
      Top = 20
      Width = 284
      Height = 17
      Color = clInfoBk
      DataField = 'Descripcion'
      DataSource = DMGASQ.DSQ_Ests
      ParentColor = False
    end
    object Label3: TLabel
      Left = 12
      Top = 46
      Width = 28
      Height = 13
      Caption = 'Turno'
    end
    object DBText4: TDBText
      Left = 14
      Top = 59
      Width = 65
      Height = 17
      Color = clInfoBk
      DataField = 'TURNO'
      DataSource = DMGAS.DS_Turc
      ParentColor = False
    end
    object Label2: TLabel
      Left = 86
      Top = 47
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label8: TLabel
      Left = 15
      Top = 85
      Width = 83
      Height = 16
      Caption = 'Jefe de Turno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 86
      Top = 59
      Width = 83
      Height = 17
      Color = clInfoBk
      DataField = 'FECHA'
      DataSource = DMGAS.DS_Turc
      ParentColor = False
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 14
      Top = 100
      Width = 283
      Height = 24
      Color = clInfoBk
      DataField = 'JEFE_TURNO'
      DataSource = DMGAS.DS_Turc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'CLAVE'
      ListField = 'NOMBRE'
      ListSource = DSQL_Desp
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 152
    Width = 312
    Height = 42
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object QL_Desp: TQuery
    DatabaseName = 'DBGASOL1'
    Filtered = True
    SQL.Strings = (
      'Select * from DGASDESP'
      'where estacion=:pEstacion'
      'Order by Nombre')
    Left = 180
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pEstacion'
        ParamType = ptUnknown
      end>
    object QL_DespCLAVE: TIntegerField
      FieldName = 'CLAVE'
    end
    object QL_DespNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 40
    end
    object QL_DespCTACNT: TStringField
      FieldName = 'CTACNT'
      Origin = 'DBGASOL1.DGASDESP.CTACNT'
      Size = 16
    end
    object QL_DespESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASDESP.ESTACION'
    end
  end
  object DSQL_Desp: TDataSource
    DataSet = QL_Desp
    Left = 172
    Top = 9
  end
end
