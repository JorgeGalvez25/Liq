object FLIQREP05: TFLIQREP05
  Left = 273
  Top = 211
  Width = 640
  Height = 376
  VertScrollBar.Position = 37
  Caption = 'Resumen de Ventas de Gasolina'
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
    Top = -29
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
          1725.083333333334000000
          15.875000000000000000
          76.729166666666680000)
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
          34.395833333333340000
          1796.520833333334000000
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
      Top = 147
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
      Height = 8
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
        21.166666666666670000
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
      'Order by Combustible')
    Left = 24
    Top = 8
    object QL_DliqcCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
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
  end
  object QL_Dliqa: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select distinct a.Producto from DGASDLIQA a'
      ''
      'Order by Producto'
      '')
    Left = 64
    Top = 8
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
      'Select distinct p.Clave_Pago from DGASDLIQP p'
      'Order by p.Clave_Pago'
      '')
    Left = 96
    Top = 8
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
    object QL_DliqpClasePago: TStringField
      FieldKind = fkLookup
      FieldName = 'ClasePago'
      LookupDataSet = DMGAS.T_Tpag
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'CLASE'
      KeyFields = 'CLAVE_PAGO'
      Lookup = True
    end
  end
  object QL_Tpag: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Clave from DGASTPAG'
      'Where Clase='#39'Efectivo'#39
      'Order by clave')
    Left = 136
    Top = 8
    object QL_TpagCLAVE: TStringField
      FieldName = 'CLAVE'
      Size = 2
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 216
    Top = 16
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 248
    Top = 16
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 280
    Top = 16
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 320
    Top = 16
  end
  object QL_Dliqa2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select a.isla,sum(a.sald_ini) as saldoinicial from dgasdliqa a'
      
        'where a.fecha=(select min(z.fecha) from dgasdliqa z where z.fech' +
        'a>=:pfechaini and z.fecha<=:pfechafin)'
      '  and a.producto=:pproducto'
      
        '  and turno=(Select min(y.turno) from dgasdliqa y where y.estaci' +
        'on=:pestacion and y.isla=a.isla and y.fecha=a.fecha)'
      '  and a.estacion=:pestacion'
      
        '  and exists(select m.* from dgasliqg m where m.estacion=a.estac' +
        'ion and m.folio=a.folio and m.aplicado='#39'Si'#39')'
      'group by a.isla')
    Left = 368
    Top = 16
    ParamData = <
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
        Name = 'pproducto'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end>
    object QL_Dliqa2ISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object QL_Dliqa2SALDOINICIAL: TFloatField
      FieldName = 'SALDOINICIAL'
    end
  end
  object QL_Clas: TQuery
    DatabaseName = 'DBIMAGEN'
    SQL.Strings = (
      'Select ClaveClasif,Descripcion from DGENCLAS'
      'Where ClaveCata='#39'PROG'#39
      'Order by ClaveClasif')
    Left = 230
    Top = 70
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
    Left = 464
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
      
        'where exists(select m.* from dgasliqg m where m.estacion=l.estac' +
        'ion and m.folio=l.folio and m.aplicado='#39'Si'#39')'
      'group by l.combustible')
    Left = 536
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
  object QL_Tanq: TQuery
    DatabaseName = 'DBGASCONSOLA'
    SQL.Strings = (
      
        'SELECT distinct tanque, combustible FROM DPVGCVOLT WHERE FECHA='#39 +
        '10/01/2012'#39)
    Left = 459
    Top = 203
    object QL_TanqTANQUE: TIntegerField
      FieldName = 'TANQUE'
    end
    object QL_TanqCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
  end
  object TM_Auxi: TRxMemoryData
    FieldDefs = <>
    Left = 191
    Top = 239
    object TM_AuxiCombustible: TStringField
      FieldName = 'Combustible'
      Size = 50
    end
    object TM_AuxiCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object TM_AuxiSubtotal: TFloatField
      FieldName = 'Subtotal'
    end
    object TM_AuxiIva: TFloatField
      FieldName = 'Iva'
    end
    object TM_AuxiTotal: TFloatField
      FieldName = 'Total'
    end
    object TM_AuxiComb: TIntegerField
      FieldName = 'Comb'
    end
  end
  object TM_IEPS: TRxMemoryData
    FieldDefs = <>
    Left = 322
    Top = 174
    object TM_IEPSLitros: TFloatField
      FieldName = 'Litros'
    end
    object TM_IEPSCombustible: TIntegerField
      FieldName = 'Combustible'
    end
    object TM_IEPSDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 30
    end
    object TM_IEPSIVA: TFloatField
      FieldName = 'IVA'
    end
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = False
    Left = 542
    Top = 17
  end
  object TM_VtasCons: TRxMemoryData
    FieldDefs = <>
    Left = 176
    Top = 179
    object TM_VtasConsNombreCmb: TStringField
      FieldName = 'NombreCmb'
      Size = 30
    end
    object TM_VtasConsVolumen: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'Importe'
    end
  end
end
