object FLIQLIQGIR: TFLIQLIQGIR
  Left = 214
  Top = 160
  Width = 544
  Height = 376
  VertScrollBar.Position = 8
  Caption = 'Resumen del Turno'
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
    Left = 24
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
          1725.083333333330000000
          15.875000000000000000
          76.729166666666700000)
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
          34.395833333333300000
          1796.520833333330000000
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
      object QRLEstatus: TQRLabel
        Left = 647
        Top = 48
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1711.854166666670000000
          127.000000000000000000
          179.916666666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLEstatus'
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
          37.041666666666700000
          1717.145833333330000000
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
  object QL_Prec: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASPREC'
      'where Combustible=:pclavecmb and'
      '           Fecha<=:pfecha'
      'Order by Fecha desc')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pclavecmb'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_PrecCOSTO: TFloatField
      FieldName = 'COSTO'
    end
    object QL_PrecTASAIVA: TFloatField
      FieldName = 'TASAIVA'
    end
    object QL_PrecFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASPREC.FECHA'
    end
    object QL_PrecCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
      Origin = 'DBGASOL1.DGASPREC.COMBUSTIBLE'
    end
    object QL_PrecPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'DBGASOL1.DGASPREC.PRECIO'
    end
    object QL_PrecIEPS: TFloatField
      FieldName = 'IEPS'
      Origin = 'DBGASOL1.DGASPREC.IEPS'
    end
  end
  object QL_Dliqc: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select estacion,fecha,turno,combustible,sum(Cantidad) as Cantida' +
        'd,sum(Devolucion) as Devolucion,sum(importe) as Importe from dga' +
        'sdliqc'
      'group by estacion,fecha,turno,combustible'
      'having estacion=:pestacion and fecha=:pfecha and turno=:pturno'
      'order by combustible')
    Left = 68
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pturno'
        ParamType = ptUnknown
      end>
    object QL_DliqcESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_DliqcFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqcTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DliqcCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object QL_DliqcCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object QL_DliqcIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_DliqcDescCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'DescCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
    object QL_DliqcDEVOLUCION: TFloatField
      FieldName = 'DEVOLUCION'
    end
  end
  object QL_Dliqa: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select estacion,fecha,turno,producto,sum(sald_ini) as SaldoIni,s' +
        'um(Entradas) as Entradas,'
      
        '            sum(Devol) as Devol,sum(Sald_Fin) as SaldoFin, sum(V' +
        'enta) as Venta,sum(Importe) as Importe '
      '            from dgasdliqa'
      'group by estacion,fecha,turno,producto'
      'having estacion=:pestacion and fecha=:pfecha and turno=:pturno'
      'order by producto')
    Left = 108
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pturno'
        ParamType = ptUnknown
      end>
    object QL_DliqaESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_DliqaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqaTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DliqaPRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
    end
    object QL_DliqaSALDOINI: TFloatField
      FieldName = 'SALDOINI'
    end
    object QL_DliqaENTRADAS: TFloatField
      FieldName = 'ENTRADAS'
    end
    object QL_DliqaDEVOL: TFloatField
      FieldName = 'DEVOL'
    end
    object QL_DliqaSALDOFIN: TFloatField
      FieldName = 'SALDOFIN'
    end
    object QL_DliqaVENTA: TFloatField
      FieldName = 'VENTA'
    end
    object QL_DliqaIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
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
    object QL_DliqaPrecio_Civa: TFloatField
      FieldKind = fkLookup
      FieldName = 'Precio_Civa'
      LookupDataSet = DMGAS.T_Prod
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'PRECIO_CIVA'
      KeyFields = 'PRODUCTO'
      Lookup = True
    end
  end
  object QL_Dliqp: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select estacion,fecha,turno,clave_pago,sum(importe) as Importe f' +
        'rom dgasdliqp'
      'group by estacion,fecha,turno,clave_pago'
      'having estacion=:pestacion and fecha=:pfecha and turno=:pturno'
      'order by clave_pago')
    Left = 152
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pturno'
        ParamType = ptUnknown
      end>
    object QL_DliqpDescripcionPago: TStringField
      FieldKind = fkLookup
      FieldName = 'DescripcionPago'
      LookupDataSet = DMGAS.T_Tpag
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'CLAVE_PAGO'
      Lookup = True
    end
    object QL_DliqpESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_DliqpFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqpTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DliqpCLAVE_PAGO: TStringField
      FieldName = 'CLAVE_PAGO'
      Size = 2
    end
    object QL_DliqpIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 240
    Top = 16
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 272
    Top = 16
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 304
    Top = 16
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 344
    Top = 16
  end
end
