object FLIQVERIVAL: TFLIQVERIVAL
  Left = 272
  Top = 216
  Width = 323
  Height = 201
  Caption = 'Verificador de Vales de Crédito'
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 155
    Width = 315
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 104
    Width = 315
    Height = 51
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object BbCalcular: TBitBtn
      Left = 118
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Ejecutar'
      TabOrder = 0
      OnClick = BbCalcularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888888888888888888800888888888888888888888888888888A708888888
        88888888888888888888887A708888888888888888888888888888A7A7088888
        88888888888888888888887A7A7088888888888888888888888888A7A7A70888
        88888888888888888888887A7A7A70888888888888888888888888A7A7A7A788
        88888888888888888888887A7A7A78888888888888888888888888A7A7A78888
        88888888888888888888887A7A7888888888888888888888888888A7A7888888
        88888888888888888888887A788888888888888888888888888888A788888888
        8888888888888888888888888888888888888888888888888888}
      NumGlyphs = 2
    end
    object BbSalir: TBitBtn
      Left = 206
      Top = 14
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 1
      OnClick = BbSalirClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 315
    Height = 104
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 82
      Top = 31
      Width = 61
      Height = 13
      Caption = 'De la Fecha:'
    end
    object Label2: TLabel
      Left = 89
      Top = 60
      Width = 54
      Height = 13
      Caption = 'A la Fecha:'
    end
    object MaskEdit1: TMaskEdit
      Left = 149
      Top = 24
      Width = 65
      Height = 21
      EditMask = '!99/99/0000;0; _'
      MaxLength = 12
      TabOrder = 0
      Text = '  /  /    ;_'
    end
    object MaskEdit2: TMaskEdit
      Left = 149
      Top = 55
      Width = 65
      Height = 21
      EditMask = '!99/99/0000;0;_'
      MaxLength = 10
      TabOrder = 1
    end
  end
  object QL_Pval: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASPVAL'
      'Where fecha>=:pfechaini and fecha<=:pfechafin and facturado='#39'No'#39
      'Order by fecha')
    Left = 16
    Top = 16
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pfechaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfechafin'
        ParamType = ptUnknown
      end>
    object QL_PvalESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASPVAL.ESTACION'
    end
    object QL_PvalCAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASPVAL.CAJA'
    end
    object QL_PvalFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASPVAL.FECHA'
    end
    object QL_PvalTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASPVAL.TURNO'
    end
    object QL_PvalINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASPVAL.INDICE'
    end
    object QL_PvalCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASPVAL.CLIENTE'
    end
    object QL_PvalCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'DBGASOL1.DGASPVAL.CANTIDAD'
    end
    object QL_PvalTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'DBGASOL1.DGASPVAL.TOTAL'
    end
    object QL_PvalFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Origin = 'DBGASOL1.DGASPVAL.FACTURADO'
      Size = 2
    end
    object QL_PvalESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
      Origin = 'DBGASOL1.DGASPVAL.ESTACIONFAC'
    end
    object QL_PvalSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASPVAL.SERIEFAC'
      Size = 2
    end
    object QL_PvalFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASPVAL.FOLIOFAC'
    end
    object QL_PvalINDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
      Origin = 'DBGASOL1.DGASPVAL.INDICEVALE'
    end
  end
  object DSQL_Pval: TDataSource
    DataSet = QL_Pval
    Left = 8
    Top = 72
  end
  object QL_Vale: TQuery
    DatabaseName = 'DBGASOL1'
    DataSource = DSQL_Pval
    SQL.Strings = (
      'Select * from DGASVALE'
      'where estacion=:estacion and'
      'caja=:caja and'
      'fecha=:fecha and'
      'turno=:turno and'
      'indice=:indice')
    Left = 48
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ESTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CAJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TURNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'indice'
        ParamType = ptUnknown
      end>
    object QL_ValeESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASVALE.ESTACION'
    end
    object QL_ValeCAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASVALE.CAJA'
    end
    object QL_ValeFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASVALE.FECHA'
    end
    object QL_ValeTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASVALE.TURNO'
    end
    object QL_ValeINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASVALE.INDICE'
    end
    object QL_ValeINDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
      Origin = 'DBGASOL1.DGASVALE.INDICEVALE'
    end
    object QL_ValeIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBGASOL1.DGASVALE.IMPORTE'
    end
    object QL_ValeFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Origin = 'DBGASOL1.DGASVALE.FACTURADO'
      Size = 2
    end
    object QL_ValeESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
      Origin = 'DBGASOL1.DGASVALE.ESTACIONFAC'
    end
    object QL_ValeSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASVALE.SERIEFAC'
      Size = 2
    end
    object QL_ValeFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASVALE.FOLIOFAC'
    end
    object QL_ValeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASVALE.CLIENTE'
    end
  end
  object DSQL_Vale: TDataSource
    DataSet = QL_Vale
    Left = 80
    Top = 80
  end
  object QL_Dval: TQuery
    DatabaseName = 'DBGASOL1'
    DataSource = DSQL_Vale
    SQL.Strings = (
      'Select * from DGASDVAL'
      'Where estacion=:estacion and'
      'caja=:caja and'
      'fecha=:fecha and'
      'turno=:turno and'
      'indice=:indice and'
      'indicevale=:indicevale ')
    Left = 120
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ESTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CAJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TURNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'indice'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INDICEVALE'
        ParamType = ptUnknown
      end>
    object QL_DvalNombreProducto: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreProducto'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'PRODUCTO'
      Lookup = True
    end
    object QL_DvalESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASDVAL.ESTACION'
    end
    object QL_DvalCAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASDVAL.CAJA'
    end
    object QL_DvalFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASDVAL.FECHA'
    end
    object QL_DvalTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASDVAL.TURNO'
    end
    object QL_DvalINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASDVAL.INDICE'
    end
    object QL_DvalINDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
      Origin = 'DBGASOL1.DGASDVAL.INDICEVALE'
    end
    object QL_DvalPRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
      Origin = 'DBGASOL1.DGASDVAL.PRODUCTO'
    end
    object QL_DvalIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBGASOL1.DGASDVAL.IMPORTE'
    end
    object QL_DvalFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Origin = 'DBGASOL1.DGASDVAL.FACTURADO'
      Size = 2
    end
    object QL_DvalESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
      Origin = 'DBGASOL1.DGASDVAL.ESTACIONFAC'
    end
    object QL_DvalSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASDVAL.SERIEFAC'
      Size = 2
    end
    object QL_DvalFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASDVAL.FOLIOFAC'
    end
    object QL_DvalCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASDVAL.CLIENTE'
    end
  end
  object DSQL_Dval: TDataSource
    DataSet = QL_Dval
    Left = 40
    Top = 376
  end
end
