object FLIQREP06CD: TFLIQREP06CD
  Left = 238
  Top = 151
  Width = 1102
  Height = 422
  Caption = 'Resumen de Ventas por Combustible'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 8
    Top = 8
    Width = 1123
    Height = 794
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
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
      Width = 1047
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
        2770.187500000000000000)
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
        Left = 926
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
          2450.041666666667000000
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
        Left = 940
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
          2487.083333333333000000
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
        Left = 904
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
          2391.833333333333000000
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
    object ChBEnca2: TQRChildBand
      Left = 38
      Top = 106
      Width = 1047
      Height = 18
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
        47.625000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      object QRLEti1: TQRLabel
        Left = 25
        Top = 3
        Width = 315
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          66.145833333333330000
          7.937500000000000000
          833.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'GASOLINA MAGNA'
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
      object QRLEti2: TQRLabel
        Left = 349
        Top = 3
        Width = 315
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          923.395833333333300000
          7.937500000000000000
          833.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'GASOLINA PREMIUM'
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
      object QRLabel4: TQRLabel
        Left = 673
        Top = 3
        Width = 315
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1780.645833333333000000
          7.937500000000000000
          833.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'T O T A L'
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
    end
    object ChBEnca: TQRChildBand
      Left = 38
      Top = 124
      Width = 1047
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChBEnca2
    end
    object BndDt: TQRStringsBand
      Left = 38
      Top = 142
      Width = 1047
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
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        39.687500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
    end
    object QRChildBand1: TQRChildBand
      Left = 38
      Top = 157
      Width = 1047
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRChildBand1BeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = BndDt
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 179
      Width = 1047
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
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLFechaHora: TQRLabel
        Left = 913
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
          2415.645833333333000000
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
  end
  object QL_Dliqc: TQuery
    OnCalcFields = QL_DliqcCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select Fecha,Combustible,Sum(Cantidad) as Litros,Sum(Importe) as' +
        ' Total, Sum(Importe_IEPS) as ImpIeps'
      '  from DGASDLIQC'
      'Where Estacion=:pestacion '
      'And Combustible <= 2'
      'Group by Fecha,Combustible'
      'Having Fecha>=:pfechaini and Fecha<=:pfechafin'
      'Order by Fecha,Combustible')
    Left = 120
    Top = 16
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
    object QL_DliqcFECHA: TDateTimeField
      FieldName = 'FECHA'
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
    object QL_DliqcSubtotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Subtotal'
      Calculated = True
    end
    object QL_DliqcIva: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Iva'
      Calculated = True
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
    object QL_DliqcIMPIEPS: TFloatField
      FieldName = 'IMPIEPS'
    end
  end
  object QL_Tcmb: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Nombre from DGASTCMB'
      'Order by Clave')
    Left = 168
    Top = 16
    object QL_TcmbNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 30
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 312
    Top = 24
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 344
    Top = 24
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 376
    Top = 24
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 416
    Top = 24
  end
  object QL_Auxi: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select sum(Diferencia) as Real1, Combustible from DGASAJUD2'
      'Group by Combustible')
    Left = 560
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
    Left = 632
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
  object TL_Ajud2: TTable
    DatabaseName = 'DBGASOL1'
    TableName = 'DGASAJUD2'
    Left = 224
    Top = 64
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
  object QL_Desc: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select'
      '     fecha,'
      '     combustible,'
      '     sum(descuento) as Descuento'
      'from'
      '     dgasdescd'
      'where'
      '     estacion=:pestacion'
      '     and Fecha>=:pfechaini'
      '     and Fecha<=:pfechafin'
      '     and descuento>0'
      'group by '
      '     fecha, '
      '     combustible')
    Left = 104
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pfechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pfechafin'
        ParamType = ptUnknown
      end>
    object QL_DescFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DescCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object QL_DescDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
  end
end
