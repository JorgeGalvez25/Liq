object FLIQREP27: TFLIQREP27
  Left = 212
  Top = 176
  Width = 544
  Height = 370
  HorzScrollBar.Position = 313
  VertScrollBar.Position = 8
  Caption = 'Relaci'#243'n de Vales por Despachador'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = -297
    Top = 8
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickRep1BeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'BNDDT')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 68
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        179.916666666666700000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLEmp: TQRLabel
        Left = 0
        Top = 7
        Width = 50
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          18.520833333333330000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLEmp'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLDir: TQRLabel
        Left = 0
        Top = 21
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          55.562500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLDir'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLRep: TQRLabel
        Left = 0
        Top = 36
        Width = 47
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          95.250000000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLRep'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLEnca: TQRLabel
        Left = 0
        Top = 50
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          132.291666666666700000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLEnca'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRPag: TQRLabel
        Left = 684
        Top = 6
        Width = 23
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1809.750000000000000000
          15.875000000000000000
          60.854166666666680000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P'#225'g. '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRSPag: TQRSysData
        Left = 704
        Top = 6
        Width = 33
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333340000
          1862.666666666667000000
          15.875000000000000000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 7
      end
      object QRLEstacion: TQRLabel
        Left = 663
        Top = 48
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1754.187500000000000000
          127.000000000000000000
          195.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLEstacion'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 142
      Width = 740
      Height = 20
      Frame.Color = clGray
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLFechaHora: TQRLabel
        Left = 673
        Top = 2
        Width = 63
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1780.645833333333000000
          5.291666666666667000
          166.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLFechaHora'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
      object QRLSistema: TQRLabel
        Left = 2
        Top = 3
        Width = 51
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          5.291666666666667000
          7.937500000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLSistema'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object BndDt: TQRStringsBand
      Left = 38
      Top = 121
      Width = 740
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = BndDtBeforePrint
      Color = clWhite
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        39.687500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 136
      Width = 740
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        15.875000000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = BndDt
    end
    object ChBEnca: TQRChildBand
      Left = 38
      Top = 106
      Width = 740
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        39.687500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 288
    Top = 8
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 320
    Top = 8
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 352
    Top = 8
  end
  object QL_Vale: TQuery
    OnCalcFields = QL_ValeCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASVALE'
      'where Despachador=:pdespachador'
      'and Fecha>=:pfechaini and Fecha<=:pfechafin'
      'Order by Estacion,Caja,fecha,turno,indice,indicevale')
    Left = 56
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pdespachador'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfechafin'
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
    object QL_ValeDESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
      Origin = 'DBGASOL1.DGASVALE.DESPACHADOR'
    end
    object QL_ValeSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
      Origin = 'DBGASOL1.DGASVALE.SUBCODIGO'
    end
    object QL_ValeFOLIOVOLUMETRICO: TIntegerField
      FieldName = 'FOLIOVOLUMETRICO'
      Origin = 'DBGASOL1.DGASVALE.FOLIOVOLUMETRICO'
    end
    object QL_ValeISLA: TIntegerField
      FieldName = 'ISLA'
      Origin = 'DBGASOL1.DGASVALE.ISLA'
    end
    object QL_ValeIslaStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'IslaStr'
      Size = 2
      Calculated = True
    end
    object QL_ValeFolioVolStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'FolioVolStr'
      Size = 8
      Calculated = True
    end
    object QL_ValeFactura: TStringField
      FieldKind = fkCalculated
      FieldName = 'Factura'
      Size = 12
      Calculated = True
    end
  end
  object QL_Dval: TQuery
    OnCalcFields = QL_DvalCalcFields
    DatabaseName = 'DBGASOL1'
    DataSource = DSQL_Vale
    SQL.Strings = (
      'Select * from DGASDVAL'
      'where Estacion=:estacion and Caja=:caja and'
      'fecha=:fecha and turno=:turno and'
      'indice=:indice and indicevale=:indicevale'
      'Order by Producto')
    Left = 88
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ESTACION'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'CAJA'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftDateTime
        Name = 'FECHA'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftInteger
        Name = 'TURNO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'INDICE'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'INDICEVALE'
        ParamType = ptUnknown
        Size = 4
      end>
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
    object QL_DvalSUBCLAVE: TIntegerField
      FieldName = 'SUBCLAVE'
      Origin = 'DBGASOL1.DGASDVAL.SUBCLAVE'
    end
    object QL_DvalIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBGASOL1.DGASDVAL.IMPORTE'
    end
    object QL_DvalCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'DBGASOL1.DGASDVAL.CANTIDAD'
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
    object QL_DvalSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
      Origin = 'DBGASOL1.DGASDVAL.SUBCODIGO'
    end
    object QL_DvalNombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'PRODUCTO'
      Lookup = True
    end
    object QL_DvalPrecioPromedio: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PrecioPromedio'
      Calculated = True
    end
    object QL_DvalLitros: TStringField
      FieldKind = fkCalculated
      FieldName = 'Litros'
      Calculated = True
    end
  end
  object DSQL_Vale: TDataSource
    DataSet = QL_Vale
    Left = 24
    Top = 8
  end
  object QL_Desp: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Clave,Nombre from DGASDESP'
      'Where Estacion=:pestacion and Clave=:pclave'
      'Order by Clave')
    Left = 120
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pclave'
        ParamType = ptUnknown
      end>
    object QL_DespCLAVE: TIntegerField
      FieldName = 'CLAVE'
    end
    object QL_DespNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 40
    end
  end
  object TT_Auxi: TRxMemoryData
    FieldDefs = <>
    Left = 176
    Top = 8
    object TT_AuxiCombustible: TIntegerField
      FieldName = 'Combustible'
    end
    object TT_AuxiImporte: TFloatField
      FieldName = 'Importe'
    end
    object TT_AuxiNombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'Combustible'
      Lookup = True
    end
    object TT_AuxiCantidad: TFloatField
      FieldName = 'Cantidad'
    end
  end
  object TT_Auxi2: TRxMemoryData
    FieldDefs = <>
    Left = 216
    Top = 8
    object TT_Auxi2Combustible: TIntegerField
      FieldName = 'Combustible'
    end
    object TT_Auxi2Importe: TFloatField
      FieldName = 'Importe'
    end
    object TT_Auxi2NombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'Combustible'
      Lookup = True
    end
    object TT_Auxi2Cantidad: TFloatField
      FieldName = 'Cantidad'
    end
  end
end
