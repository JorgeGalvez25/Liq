object FLIQREP22: TFLIQREP22
  Left = 212
  Top = 176
  Width = 544
  Height = 376
  VertScrollBar.Position = 8
  Caption = 'Resumen de Lecturas de Combustible'
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
    Left = 8
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
          42.333333333333340000
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
          42.333333333333340000
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
          42.333333333333340000
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
          44.979166666666700000
          1695.979166666670000000
          127.000000000000000000
          195.791666666667000000)
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
        52.916666666666660000
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
        58.208333333333340000
        1910.291666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = BndDt
    end
  end
  object QL_Dliqc: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASDLIQC'
      'Where Estacion=:pestacion'
      '     and Fecha=:pfecha '
      '     and Bomba=:pbomba '
      '     and Turno=:pturno'
      '')
    Left = 48
    Top = 8
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
        Name = 'pbomba'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pturno'
        ParamType = ptUnknown
      end>
    object QL_DliqcESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASDLIQC.ESTACION'
    end
    object QL_DliqcFOLIO: TIntegerField
      FieldName = 'FOLIO'
      Origin = 'DBGASOL1.DGASDLIQC.FOLIO'
    end
    object QL_DliqcBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Origin = 'DBGASOL1.DGASDLIQC.BOMBA'
    end
    object QL_DliqcISLA: TIntegerField
      FieldName = 'ISLA'
      Origin = 'DBGASOL1.DGASDLIQC.ISLA'
    end
    object QL_DliqcCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
      Origin = 'DBGASOL1.DGASDLIQC.COMBUSTIBLE'
    end
    object QL_DliqcPOSCARGA: TIntegerField
      FieldName = 'POSCARGA'
      Origin = 'DBGASOL1.DGASDLIQC.POSCARGA'
    end
    object QL_DliqcFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASDLIQC.FECHA'
    end
    object QL_DliqcTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASDLIQC.TURNO'
    end
    object QL_DliqcLEC_ANT: TFloatField
      FieldName = 'LEC_ANT'
      Origin = 'DBGASOL1.DGASDLIQC.LEC_ANT'
    end
    object QL_DliqcLEC_ACT: TFloatField
      FieldName = 'LEC_ACT'
      Origin = 'DBGASOL1.DGASDLIQC.LEC_ACT'
    end
    object QL_DliqcDEVOLUCION: TFloatField
      FieldName = 'DEVOLUCION'
      Origin = 'DBGASOL1.DGASDLIQC.DEVOLUCION'
    end
    object QL_DliqcCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      Origin = 'DBGASOL1.DGASDLIQC.CANTIDAD'
    end
    object QL_DliqcPRECIO_CIVA: TFloatField
      FieldName = 'PRECIO_CIVA'
      Origin = 'DBGASOL1.DGASDLIQC.PRECIO_CIVA'
    end
    object QL_DliqcIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBGASOL1.DGASDLIQC.IMPORTE'
    end
    object QL_DliqcAPLICADO: TStringField
      FieldName = 'APLICADO'
      Origin = 'DBGASOL1.DGASDLIQC.APLICADO'
      Size = 2
    end
    object QL_DliqcCALC: TStringField
      FieldName = 'CALC'
      Origin = 'DBGASOL1.DGASDLIQC.CALC'
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
  object QL_Bomb: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Manguera from DGASBOMB'
      'where Estacion=:pestacion'
      'Order by Manguera')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end>
    object QL_BombMANGUERA: TIntegerField
      FieldName = 'MANGUERA'
    end
  end
  object TT_Auxi: TRxMemoryData
    FieldDefs = <>
    Left = 112
    Top = 16
    object TT_AuxiNoReg: TIntegerField
      FieldName = 'NoReg'
    end
    object TT_AuxiFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object TT_AuxiIsla: TIntegerField
      FieldName = 'Isla'
    end
    object TT_AuxiManguera: TIntegerField
      FieldName = 'Manguera'
    end
    object TT_AuxiCombustible: TIntegerField
      FieldName = 'Combustible'
    end
    object TT_AuxiLecturaInicial: TFloatField
      FieldName = 'LecturaInicial'
    end
    object TT_AuxiLecturaFinal: TFloatField
      FieldName = 'LecturaFinal'
    end
    object TT_AuxiDevoluciones: TFloatField
      FieldName = 'Devoluciones'
    end
    object TT_AuxiCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object TT_AuxiNombre: TStringField
      FieldKind = fkLookup
      FieldName = 'Nombre'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'Combustible'
      Lookup = True
    end
  end
end
