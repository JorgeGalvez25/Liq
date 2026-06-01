object FLIQREP34: TFLIQREP34
  Left = 413
  Top = 174
  Width = 887
  Height = 370
  VertScrollBar.Position = 8
  Caption = 'Reporte Directivo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 15
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
      180.000000000000000000
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
      Width = 710
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
        1878.541666666667000000)
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
        Left = 654
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
          1730.375000000000000000
          15.875000000000000000
          60.854166666666670000)
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
        Left = 668
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
          1767.416666666667000000
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
        Left = 625
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
          1653.645833333333000000
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
      Width = 710
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
        1878.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLFechaHora: TQRLabel
        Left = 639
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
          1690.687500000000000000
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
      Top = 122
      Width = 710
      Height = 20
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
        52.916666666666670000
        1878.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
      object QRShape1: TQRShape
        Left = 78
        Top = 1
        Width = 283
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          206.375000000000000000
          2.645833333333333000
          748.770833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 78
        Top = 17
        Width = 283
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          206.375000000000000000
          44.979166666666670000
          748.770833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object ChBEnca: TQRChildBand
      Left = 38
      Top = 106
      Width = 710
      Height = 16
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
        42.333333333333330000
        1878.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 136
    Top = 8
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 192
    Top = 16
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 232
    Top = 16
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 272
    Top = 16
  end
  object TM_AuxiVentas: TRxMemoryData
    FieldDefs = <>
    Left = 24
    Top = 196
    object TM_AuxiVentasUnidad: TStringField
      FieldName = 'Unidad'
    end
    object TM_AuxiVentasLitrosDia: TFloatField
      FieldName = 'LitrosDia'
    end
    object TM_AuxiVentasImporteDia: TFloatField
      FieldName = 'ImporteDia'
    end
    object TM_AuxiVentasLitrosAcum: TFloatField
      FieldName = 'LitrosAcum'
    end
    object TM_AuxiVentasImporteAcum: TFloatField
      FieldName = 'ImporteAcum'
    end
    object TM_AuxiVentasCombustible: TIntegerField
      FieldName = 'Combustible'
    end
    object TM_AuxiVentasNombreCombustible: TStringField
      FieldName = 'NombreCombustible'
    end
  end
  object TM_AuxiCredito: TRxMemoryData
    FieldDefs = <>
    Left = 135
    Top = 183
    object TM_AuxiCreditoConcepto: TStringField
      FieldName = 'Concepto'
    end
    object TM_AuxiCreditoPlazo1: TFloatField
      FieldName = 'Plazo1'
    end
    object TM_AuxiCreditoPlazo2: TFloatField
      FieldName = 'Plazo2'
    end
    object TM_AuxiCreditoPlazo3: TFloatField
      FieldName = 'Plazo3'
    end
    object TM_AuxiCreditoPlazo4: TFloatField
      FieldName = 'Plazo4'
    end
    object TM_AuxiCreditoPlazo5: TFloatField
      FieldName = 'Plazo5'
    end
    object TM_AuxiCreditoPlazo1Porc: TFloatField
      FieldName = 'Plazo1Porc'
    end
    object TM_AuxiCreditoPlazo2Porc: TFloatField
      FieldName = 'Plazo2Porc'
    end
    object TM_AuxiCreditoPlazo3Porc: TFloatField
      FieldName = 'Plazo3Porc'
    end
    object TM_AuxiCreditoPlazo4Porc: TFloatField
      FieldName = 'Plazo4Porc'
    end
    object TM_AuxiCreditoPlazo5Porc: TFloatField
      FieldName = 'Plazo5Porc'
    end
  end
  object TM_AuxiInv: TRxMemoryData
    FieldDefs = <>
    Left = 356
    Top = 182
    object TM_AuxiInvNombreProducto: TStringField
      FieldName = 'NombreProducto'
      Size = 80
    end
    object TM_AuxiInvCosto: TFloatField
      FieldName = 'Costo'
    end
    object TM_AuxiInvUnidades: TFloatField
      FieldName = 'Unidades'
    end
    object TM_AuxiInvTotal: TFloatField
      FieldName = 'Total'
    end
    object TM_AuxiInvClave: TIntegerField
      FieldName = 'Clave'
    end
  end
  object TM_AuxiUtil: TRxMemoryData
    FieldDefs = <>
    Left = 611
    Top = 212
    object TM_AuxiUtilProducto: TStringField
      FieldName = 'Producto'
      Size = 16
    end
    object TM_AuxiUtilNombreProducto: TStringField
      FieldName = 'NombreProducto'
      Size = 80
    end
    object TM_AuxiUtilVenta: TFloatField
      FieldName = 'Venta'
    end
    object TM_AuxiUtilLitro: TFloatField
      FieldName = 'Litro'
    end
    object TM_AuxiUtilUltimoCosto: TFloatField
      FieldName = 'UltimoCosto'
    end
    object TM_AuxiUtilImpCosto: TFloatField
      FieldName = 'ImpCosto'
    end
    object TM_AuxiUtilUtilidad: TFloatField
      FieldName = 'Utilidad'
    end
  end
  object QL_Dliqc: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Combustible,Sum(Cantidad) as Litros,Sum(Importe) as Total'
      '  from DGASDLIQC'
      'Where Estacion=:pestacion '
      '  and Fecha>=:pfechaini and Fecha<=:pfechafin'
      'Group by Combustible'
      'Order by Combustible')
    Left = 25
    Top = 251
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
    object QL_DliqcLITROS: TFloatField
      FieldName = 'LITROS'
    end
    object QL_DliqcTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QL_DliqcNombreComb: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreComb'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 50
      Lookup = True
    end
  end
  object QL_Clie: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      'select noclie,nombre,nombrecomercial,clasifica from DGENCLIE'
      'where noclie in'
      '          (Select NoClie from DCXCSCXC)'
      'order by NoClie')
    Left = 97
    Top = 230
    object QL_ClieNOCLIE: TIntegerField
      FieldName = 'NOCLIE'
    end
    object QL_ClieNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object QL_ClieNombreClasif: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreClasif'
      LookupDataSet = QL_Clas
      LookupKeyFields = 'CLAVECLASIF'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'CLASIFICA'
      Size = 30
      Lookup = True
    end
    object QL_ClieNOMBRECOMERCIAL: TStringField
      FieldName = 'NOMBRECOMERCIAL'
      Size = 50
    end
    object QL_ClieCLASIFICA: TIntegerField
      FieldName = 'CLASIFICA'
    end
  end
  object TT_Auxi: TRxMemoryData
    FieldDefs = <>
    Left = 147
    Top = 232
    object TT_AuxiReg: TIntegerField
      FieldName = 'Reg'
    end
    object TT_AuxiNoClie: TIntegerField
      FieldName = 'NoClie'
    end
    object TT_AuxiTipoMov: TStringField
      FieldName = 'TipoMov'
    end
    object TT_AuxiFolio: TIntegerField
      FieldName = 'Folio'
    end
    object TT_AuxiIndice: TIntegerField
      FieldName = 'Indice'
    end
    object TT_AuxiFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object TT_AuxiFecVence: TDateTimeField
      FieldName = 'FecVence'
    end
    object TT_AuxiSaldo: TFloatField
      FieldName = 'Saldo'
    end
  end
  object QL_Carg: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'select tipomov,folio,Indice,fecha,fecvence,importe,totalpagos,mo' +
        'neda,Referencia from DCXCCARG'
      'where noclie=:pnoclie and'
      '           fecha<=:pfecha and'
      '          saldado='#39'No'#39' and Aplicado='#39'Si'#39' '
      'order by fecha,tipomov,folio,indice')
    UniDirectional = True
    Left = 97
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pnoclie'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_CargTIPOMOV: TStringField
      FieldName = 'TIPOMOV'
      Size = 2
    end
    object QL_CargFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_CargFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_CargFECVENCE: TDateTimeField
      FieldName = 'FECVENCE'
    end
    object QL_CargIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_CargTOTALPAGOS: TFloatField
      FieldName = 'TOTALPAGOS'
    end
    object QL_CargMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 2
    end
    object QL_CargINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object QL_CargREFERENCIA: TIntegerField
      FieldName = 'REFERENCIA'
    end
  end
  object QL_Abon: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'select SuclCar,TipoCar,FolioCar,IndiceCar,Importe,moneda from DC' +
        'XCABON'
      'where noclie=:pnoclie and fecha>:pfecha and aplicado='#39'Si'#39' '
      'Order by fecha')
    Left = 155
    Top = 278
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pnoclie'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_AbonIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_AbonSUCLCAR: TIntegerField
      FieldName = 'SUCLCAR'
    end
    object QL_AbonTIPOCAR: TStringField
      FieldName = 'TIPOCAR'
      Size = 2
    end
    object QL_AbonFOLIOCAR: TIntegerField
      FieldName = 'FOLIOCAR'
    end
    object QL_AbonMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 2
    end
    object QL_AbonINDICECAR: TIntegerField
      FieldName = 'INDICECAR'
    end
  end
  object QL_Carg2: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'Select TipoMov,Folio,Indice,Fecha,FecVence,Importe,TotalPagos,mo' +
        'neda,Referencia from DCXCCARG'
      
        'where TipoMov=:ptipomov and Folio=:pfolio and Sucursal=:psucursa' +
        'l'
      'and Indice=:pindice'
      'and Fecha<=:pfecha')
    Left = 196
    Top = 231
    ParamData = <
      item
        DataType = ftString
        Name = 'ptipomov'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pfolio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'psucursal'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pindice'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_Carg2TIPOMOV: TStringField
      FieldName = 'TIPOMOV'
      Size = 2
    end
    object QL_Carg2FOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_Carg2FECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_Carg2FECVENCE: TDateTimeField
      FieldName = 'FECVENCE'
    end
    object QL_Carg2IMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_Carg2TOTALPAGOS: TFloatField
      FieldName = 'TOTALPAGOS'
    end
    object QL_Carg2MONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 2
    end
    object QL_Carg2INDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object QL_Carg2REFERENCIA: TIntegerField
      FieldName = 'REFERENCIA'
    end
  end
  object QL_Prod: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      'Select p.clave,p.descripcion,p.unidad,'
      'p.linea,l.Descripcion as NombreLinea,l.Activo as LineaActiva,'
      
        'p.sublinea,s.Descripcion as NombreSubLinea, s.Activo as Sublinea' +
        'Activa '
      'from DGENPROD p'
      'inner join DINVLINE l on p.linea=l.linea'
      
        'inner join DINVSLIN s on p.linea=s.linea and p.sublinea=s.sublin' +
        'ea'
      'where l.Activo='#39'Si'#39
      '  and s.Activo='#39'Si'#39
      'order by p.Linea,p.Sublinea,p.Clave')
    Left = 353
    Top = 229
    object QL_ProdCLAVE: TStringField
      FieldName = 'CLAVE'
      Size = 15
    end
    object QL_ProdDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object QL_ProdUNIDAD: TStringField
      FieldName = 'UNIDAD'
      Size = 15
    end
    object QL_ProdLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object QL_ProdNOMBRELINEA: TStringField
      FieldName = 'NOMBRELINEA'
      Size = 40
    end
    object QL_ProdLINEAACTIVA: TStringField
      FieldName = 'LINEAACTIVA'
      Size = 2
    end
    object QL_ProdSUBLINEA: TIntegerField
      FieldName = 'SUBLINEA'
    end
    object QL_ProdNOMBRESUBLINEA: TStringField
      FieldName = 'NOMBRESUBLINEA'
      Size = 40
    end
    object QL_ProdSUBLINEAACTIVA: TStringField
      FieldName = 'SUBLINEAACTIVA'
      Size = 2
    end
  end
  object QL_Dliqc2: TQuery
    OnCalcFields = QL_Dliqc2CalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select Fecha,Combustible,Sum(Cantidad) as Litros,Sum(Importe) as' +
        ' Total, Sum(Importe_IEPS) as ImpIeps'
      '  from DGASDLIQC'
      'Where Estacion=:pestacion '
      'Group by Fecha,Combustible'
      'Having Fecha>=:pfechaini and Fecha<=:pfechafin'
      'Order by Fecha,Combustible')
    Left = 614
    Top = 261
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
    object QL_Dliqc2NombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
    object StringField2: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreComb'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 50
      Lookup = True
    end
    object QL_Dliqc2LITROS: TFloatField
      FieldName = 'LITROS'
    end
    object QL_Dliqc2Subtotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Subtotal'
      Calculated = True
    end
    object QL_Dliqc2Iva: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Iva'
      Calculated = True
    end
    object QL_Dliqc2TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QL_Dliqc2IMPIEPS: TFloatField
      FieldName = 'IMPIEPS'
    end
    object QL_Dliqc2FECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_Dliqc2COMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
  end
  object QL_Tcmb: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Clave,Nombre,Codigo from DGASTCMB'
      'Order by Clave')
    Left = 673
    Top = 269
    object QL_TcmbNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 30
    end
    object QL_TcmbCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 15
    end
    object QL_TcmbCLAVE: TIntegerField
      FieldName = 'CLAVE'
    end
  end
  object TL_Ajud2: TTable
    DatabaseName = 'DBGASOL1'
    TableName = 'DGASAJUD2'
    Left = 667
    Top = 213
    object TL_Ajud2ESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object TL_Ajud2FECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object TL_Ajud2COMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object TL_Ajud2VOLUMEN: TFloatField
      FieldName = 'VOLUMEN'
    end
    object TL_Ajud2VENTA: TFloatField
      FieldName = 'VENTA'
    end
    object TL_Ajud2DIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
    end
    object TL_Ajud2PRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object TL_Ajud2TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object QL_Dliqa: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select l.Estacion,l.Fecha,l.Folio,(select p.codigo from DGASPROD' +
        ' p where p.clave=l.producto)as Producto,l.Venta,l.Precio_Civa,l.' +
        'Importe,'
      
        '       (Select Despachador from DGASLIQG where Estacion=l.Estaci' +
        'on and Folio=l.folio) as Desp,'
      
        '       (select p.descripcion from DGASPROD p where p.clave=l.pro' +
        'ducto)as Descripcion'
      '  from DGASDLIQA l'
      'Order by l.Estacion,l.Folio,l.Fecha')
    Left = 552
    Top = 215
    object QL_DliqaESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_DliqaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqaFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_DliqaPRODUCTO: TStringField
      FieldName = 'PRODUCTO'
      Size = 15
    end
    object QL_DliqaVENTA: TFloatField
      FieldName = 'VENTA'
    end
    object QL_DliqaPRECIO_CIVA: TFloatField
      FieldName = 'PRECIO_CIVA'
    end
    object QL_DliqaIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_DliqaDESP: TIntegerField
      FieldName = 'DESP'
    end
    object QL_DliqaDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object TM_AuxiUtilAce: TRxMemoryData
    FieldDefs = <>
    Left = 554
    Top = 262
    object TM_AuxiUtilAceCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object TM_AuxiUtilAceDescripcion: TStringField
      FieldKind = fkLookup
      FieldName = 'Descripcion'
      LookupDataSet = DMGAS.T_Prod
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'Producto'
      Size = 40
      Lookup = True
    end
    object TM_AuxiUtilAceImporte: TFloatField
      FieldName = 'Importe'
    end
    object TM_AuxiUtilAceProducto: TStringField
      FieldName = 'Producto'
      Size = 15
    end
  end
  object QL_Clas: TQuery
    DatabaseName = 'DBIMAGEN'
    SQL.Strings = (
      'select * from DGENCLAS'
      'where clavecata='#39'CLIE'#39)
    Left = 201
    Top = 188
    object QL_ClasCLAVECATA: TStringField
      FieldName = 'CLAVECATA'
      Origin = 'DGENCLAS.CLAVECATA'
      Size = 4
    end
    object QL_ClasCLAVECLASIF: TIntegerField
      FieldName = 'CLAVECLASIF'
      Origin = 'DGENCLAS.CLAVECLASIF'
    end
    object QL_ClasDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DGENCLAS.DESCRIPCION'
      Size = 30
    end
    object QL_ClasOBSERVACION: TStringField
      FieldName = 'OBSERVACION'
      Origin = 'DGENCLAS.OBSERVACION'
      Size = 30
    end
  end
end
