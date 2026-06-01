object FLIQREP46: TFLIQREP46
  Left = 212
  Top = 176
  Width = 876
  Height = 376
  VertScrollBar.Position = 8
  Caption = 'Resumen de Ventas de Gasolina / Costo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 16
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
      150.000000000000000000
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
      Width = 722
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
        1910.291666666667000000)
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
        Left = 652
        Top = 6
        Width = 29
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          15.875000000000000000
          76.729166666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P'#225'gina'
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
        Left = 679
        Top = 6
        Width = 33
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333330000
          1796.520833333333000000
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
        Left = 641
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
          1695.979166666667000000
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
      Top = 161
      Width = 722
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
        1910.291666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLFechaHora: TQRLabel
        Left = 649
        Top = 3
        Width = 63
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1717.145833333333000000
          7.937500000000000000
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
    object ChBEnca: TQRChildBand
      Left = 38
      Top = 106
      Width = 722
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
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
        47.625000000000000000
        1910.291666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
    end
    object BndDt: TQRStringsBand
      Left = 38
      Top = 124
      Width = 722
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
        1910.291666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 139
      Width = 722
      Height = 22
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
        58.208333333333330000
        1910.291666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = BndDt
    end
  end
  object QL_Dliqc: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select distinct Combustible  from DGASDLIQC'
      'Where Estacion=:pestacion and '
      '            Fecha>=:pfechaini and Fecha<=:pfechafin'
      'Order by Combustible')
    Left = 56
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
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
    object QL_DliqcNombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
    object QL_DliqcCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
  end
  object QL_Dliqa: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select distinct Producto from DGASDLIQA'
      'Where Estacion=:pestacion and '
      '            Fecha>=:pfechaini and Fecha<=:pfechafin and'
      
        '            producto in (Select Clave from dgasprod where linea=' +
        ':plinea)'
      'Order by Producto'
      '')
    Left = 88
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
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
      end
      item
        DataType = ftInteger
        Name = 'plinea'
        ParamType = ptUnknown
      end>
    object QL_DliqaNombreProducto: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreProducto'
      LookupDataSet = DMGAS.T_Prod
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'PRODUCTO'
      Size = 30
      Lookup = True
    end
    object QL_DliqaPRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
    end
  end
  object QL_Dliqp: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select distinct Clave_Pago from DGASDLIQP'
      'Where Estacion=:pestacion and '
      '            Fecha>=:pfechaini and Fecha<=:pfechafin'
      'Order by Clave_Pago'
      '')
    Left = 120
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
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
    object QL_DliqpClasePago: TStringField
      FieldKind = fkLookup
      FieldName = 'ClasePago'
      LookupDataSet = DMGAS.T_Tpag
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'CLASE'
      KeyFields = 'CLAVE_PAGO'
      Lookup = True
    end
    object QL_DliqpCLAVE_PAGO: TStringField
      FieldName = 'CLAVE_PAGO'
      Size = 2
    end
    object QL_DliqpDescripcionPago: TStringField
      FieldKind = fkLookup
      FieldName = 'DescripcionPago'
      LookupDataSet = DMGAS.T_Tpag
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'CLAVE_PAGO'
      Size = 40
      Lookup = True
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 216
    Top = 8
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 248
    Top = 8
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 280
    Top = 8
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 320
    Top = 8
  end
  object QL_Dliqc2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Estacion,Fecha,Folio,Importe,'
      
        '       (Select Despachador from DGASLIQG where Estacion=DGASDLIQ' +
        'C.Estacion and Folio=DGASDLIQC.folio) as Desp'
      '  from dgasdliqc'
      
        'Where Estacion=:pestacion and Fecha>=:pfechaini and Fecha<=:pfec' +
        'hafin'
      '  Order by Estacion,Folio,Fecha')
    Left = 425
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
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
    object QL_Dliqc2ESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_Dliqc2FECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_Dliqc2FOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_Dliqc2IMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_Dliqc2DESP: TIntegerField
      FieldName = 'DESP'
    end
  end
  object TT_Auxi: TTable
    OnCalcFields = TT_AuxiCalcFields
    Left = 387
    Top = 11
    object TT_AuxiDespachador: TIntegerField
      FieldName = 'Despachador'
    end
    object TT_AuxiNombreDespachador: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreDespachador'
      LookupDataSet = DMGASQ.QT_Desp
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'Despachador'
      Size = 30
      Lookup = True
    end
    object TT_AuxiTotalCmb: TFloatField
      FieldName = 'TotalCmb'
    end
    object TT_AuxiTotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
    object TT_AuxiTotalProd: TFloatField
      FieldName = 'TotalProd'
    end
  end
  object QL_Dliqa2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Estacion,Fecha,Folio,Importe,'
      
        '       (Select Despachador from DGASLIQG where Estacion=DGASDLIQ' +
        'A.Estacion and Folio=DGASDLIQA.folio) as Desp'
      '  from dgasdliqa'
      
        'Where Estacion=:pestacion and Fecha>=:pfechaini and Fecha<=:pfec' +
        'hafin'
      '  Order by Estacion,Folio,Fecha')
    Left = 457
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
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
    object QL_Dliqa2ESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_Dliqa2FECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_Dliqa2FOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_Dliqa2IMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_Dliqa2DESP: TIntegerField
      FieldName = 'DESP'
    end
  end
  object QL_Tpag: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Clave from DGASTPAG'
      'Where Clase='#39'Efectivo'#39
      'Order by clave')
    Left = 152
    Top = 8
    object QL_TpagCLAVE: TStringField
      FieldName = 'CLAVE'
      Size = 2
    end
  end
  object QL_Clas: TQuery
    DatabaseName = 'DBIMAGEN'
    SQL.Strings = (
      'Select ClaveClasif,Descripcion from DGENCLAS'
      'Where ClaveCata='#39'PROG'#39
      'Order by ClaveClasif')
    Left = 126
    Top = 54
    object QL_ClasCLAVECLASIF: TIntegerField
      FieldName = 'CLAVECLASIF'
    end
    object QL_ClasDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 30
    end
  end
  object QL_Auxi: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select sum(Diferencia) as Real1, Combustible from DGASAJUD2'
      'Group by Combustible')
    Left = 552
    Top = 24
    object QL_AuxiREAL1: TFloatField
      FieldName = 'REAL1'
    end
    object QL_AuxiCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
  end
  object QL_Ieps: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select l.combustible as Entero1,'
      
        '         (Select Nombre from dgastcmb where clave=l.combustible)' +
        ' as Str50,'
      
        '         sum(l.cantidad) as Real2,sum(l.importe_ieps) as Real3 f' +
        'rom dgasdliqc l'
      'group by l.combustible')
    Left = 624
    Top = 48
    object QL_IepsENTERO1: TIntegerField
      FieldName = 'ENTERO1'
    end
    object QL_IepsSTR50: TStringField
      FieldName = 'STR50'
      Size = 30
    end
    object QL_IepsREAL2: TFloatField
      FieldName = 'REAL2'
    end
    object QL_IepsREAL3: TFloatField
      FieldName = 'REAL3'
    end
  end
end
