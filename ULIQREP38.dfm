object FLIQREP38: TFLIQREP38
  Left = 293
  Top = 44
  Width = 1164
  Height = 587
  VertScrollBar.Position = 8
  Caption = 'Comparativo Tanques contra Liquidaciones'
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
    Top = 24
    Width = 1056
    Height = 816
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
    Page.PaperSize = Letter
    Page.Values = (
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      60.000000000000000000
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
      Width = 996
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
        2635.250000000000000000)
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
    object QRBand2: TQRBand
      Left = 38
      Top = 182
      Width = 996
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
        2635.250000000000000000)
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
    object BndDt: TQRStringsBand
      Left = 38
      Top = 142
      Width = 996
      Height = 18
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
        47.625000000000000000
        2635.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 160
      Width = 996
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
        2635.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = BndDt
    end
    object ChBEnca: TQRChildBand
      Left = 38
      Top = 124
      Width = 996
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
        2635.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChBEnca2
    end
    object ChBEnca2: TQRChildBand
      Left = 38
      Top = 106
      Width = 996
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
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
        2635.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      object QRLEti1: TQRLabel
        Left = 77
        Top = 3
        Width = 456
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          39.687500000000000000
          203.729166666666700000
          7.937500000000000000
          1206.500000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'VOLUM'#201'TRICOS (LECT. TANQUES)'
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
        Left = 534
        Top = 3
        Width = 229
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          39.687500000000000000
          1412.875000000000000000
          7.937500000000000000
          605.895833333333400000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LIQUIDACIONES (RESUMEN LIQUIDACIONES)'
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
      object QRLEti3: TQRLabel
        Left = 764
        Top = 3
        Width = 231
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          39.687500000000000000
          2021.416666666667000000
          7.937500000000000000
          611.187500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DIFERENCIA'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 7
      end
    end
  end
  object Q_Volumetricos: TQuery
    DatabaseName = 'DBGASCONSOLA'
    SQL.Strings = (
      'select Fecha, Turno, Tanque, Combustible, Volumen'
      'From DPVGTURNT'
      'Where'
      '   Fecha >= ((:PFechaIni) - 1)'
      '   and fecha <= :PFechaFin'
      'Order by fecha, turno, tanque, combustible')
    Left = 232
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFechaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFechaFin'
        ParamType = ptUnknown
      end>
    object Q_VolumetricosFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object Q_VolumetricosTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object Q_VolumetricosTANQUE: TIntegerField
      FieldName = 'TANQUE'
    end
    object Q_VolumetricosCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object Q_VolumetricosVOLUMEN: TFloatField
      FieldName = 'VOLUMEN'
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 288
    Top = 32
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 320
    Top = 32
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 352
    Top = 32
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 392
    Top = 32
  end
  object Q_Entradas: TQuery
    DatabaseName = 'DBGASCONSOLA'
    SQL.Strings = (
      'select fecha, turno, tanque, combustible, volumenrecepcion'
      'from dpvgetan'
      'where'
      '   Fecha >= ((:PFechaIni) - 1)'
      '   and fecha <= :PFechaFin')
    Left = 328
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFechaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFechaFin'
        ParamType = ptUnknown
      end>
    object Q_EntradasFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object Q_EntradasTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object Q_EntradasTANQUE: TIntegerField
      FieldName = 'TANQUE'
    end
    object Q_EntradasCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object Q_EntradasVOLUMENRECEPCION: TFloatField
      FieldName = 'VOLUMENRECEPCION'
    end
  end
  object Q_PreciosVol: TQuery
    DatabaseName = 'DBGASCONSOLA'
    SQL.Strings = (
      'select avg(precio) as Precio'
      'from dpvgprec'
      'where'
      '    Fechahora >= :PFechaIni'
      '    and fechahora <= :PFechaFin'
      '    and combustible = :PCombus'
      '    and aplicado = '#39'Si'#39
      '    and en_edicion = '#39'No'#39
      '    and error = '#39'No'#39)
    Left = 408
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFechaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFechaFin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCombus'
        ParamType = ptUnknown
      end>
    object Q_PreciosVolPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
  end
  object Q_Liquidaciones: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select sum(c.Cantidad) as Combus, sum(c.Importe) as Importe'
      'from DGASDLIQC c'
      'Where'
      '  c.estacion = :PEst'
      '  and c.Combustible=:PCombus'
      '  and c.Fecha>=:PFechaIni'
      '  and c.Fecha<=:PFechaFin'
      
        '  and exists(select m.* from dgasliqg m where m.estacion=c.estac' +
        'ion and m.folio=c.folio and m.aplicado='#39'Si'#39')')
    Left = 232
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PEst'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCombus'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFechaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFechaFin'
        ParamType = ptUnknown
      end>
    object Q_LiquidacionesCOMBUS: TFloatField
      FieldName = 'COMBUS'
    end
    object Q_LiquidacionesIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
  end
  object Q_PreciosLiq: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select avg(precio) as Precio'
      'from dgasprec'
      'where'
      '    Fecha >= :PFechaIni'
      '    and fecha <= :PFechaFin'
      '    and combustible = :PCombus'
      '--    and aplicado = '#39'No'#39)
    Left = 408
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFechaIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFechaFin'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCombus'
        ParamType = ptUnknown
      end>
    object Q_PreciosLiqPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
  end
  object QRPDFFilter1: TQRPDFFilter
    CompressionOn = False
    Left = 479
    Top = 48
  end
end
