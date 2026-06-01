object FLIQREP07PDF: TFLIQREP07PDF
  Left = 214
  Top = 160
  Width = 544
  Height = 376
  VertScrollBar.Position = 8
  Caption = 'Reporte de Vales de Cr'#233'dito'
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
    Left = 16
    Top = 16
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
      Height = 67
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
        177.270833333333300000
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
        Left = 636
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
          1682.750000000000000000
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
      object QRLGrupo: TQRLabel
        Left = 651
        Top = 32
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1722.437500000000000000
          84.666666666666670000
          156.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLGrupo'
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
      Top = 138
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
        Left = 647
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
          1711.854166666667000000
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
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 105
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
      object QRLabel1: TQRLabel
        Left = 17
        Top = 3
        Width = 31
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          44.979166666666670000
          7.937500000000000000
          82.020833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CLAVE'
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
      object QRLabel2: TQRLabel
        Left = 68
        Top = 3
        Width = 109
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          179.916666666666700000
          7.937500000000000000
          288.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOMBRE/COMBUSTIBLE'
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
      object QRLabel6: TQRLabel
        Left = 409
        Top = 3
        Width = 49
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1082.145833333333000000
          7.937500000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CANTIDAD'
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
      object QRLabel7: TQRLabel
        Left = 483
        Top = 3
        Width = 48
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1277.937500000000000000
          7.937500000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SUBTOTAL'
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
      object QRShape1: TQRShape
        Left = 64
        Top = 0
        Width = 1
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          169.333333333333000000
          0.000000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 468
        Top = 0
        Width = 1
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1238.250000000000000000
          0.000000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 550
        Top = 0
        Width = 1
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1455.208333333330000000
          0.000000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 396
        Top = 0
        Width = 1
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1047.750000000000000000
          0.000000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 575
        Top = 3
        Width = 25
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1521.354166666667000000
          7.937500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'I.V.A.'
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
        Left = 656
        Top = 3
        Width = 41
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1735.666666666667000000
          7.937500000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
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
      object QRShape2: TQRShape
        Left = 626
        Top = 0
        Width = 1
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1656.291666666670000000
          0.000000000000000000
          2.645833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object BndDt: TQRStringsBand
      Left = 38
      Top = 123
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
      object QRLabel11: TQRLabel
        Left = 6
        Top = 0
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          0.000000000000000000
          142.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 68
        Top = 0
        Width = 321
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          179.916666666667000000
          0.000000000000000000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 397
        Top = 0
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1050.395833333330000000
          0.000000000000000000
          177.270833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 476
        Top = 0
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1259.416666666670000000
          0.000000000000000000
          193.145833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 557
        Top = 0
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1473.729166666670000000
          0.000000000000000000
          177.270833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel15'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 632
        Top = 0
        Width = 82
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1672.166666666670000000
          0.000000000000000000
          216.958333333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel16'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object QL_Pval: TQuery
    OnCalcFields = QL_PvalCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select Cliente,Sum(Cantidad) as Cantidad,Sum(Total) as Total fro' +
        'm DGASPVAL'
      'Where Estacion=:pestacion and'
      '            Caja=:pcaja and'
      '            Fecha>=:pfechaini and Fecha<=:pfechafin and'
      '            Facturado='#39'No'#39
      'Group by Cliente'
      'Order by Cliente')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pcaja'
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
    object QL_PvalCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QL_PvalCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object QL_PvalSubtotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Subtotal'
      Calculated = True
    end
    object QL_PvalIva: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Iva'
      Calculated = True
    end
    object QL_PvalNombreCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCliente'
      LookupDataSet = DMGEN_VTAS.T_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'CLIENTE'
      Size = 60
      Lookup = True
    end
    object QL_PvalTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QL_PvalGrupo: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Grupo'
      LookupDataSet = DMGEN_VTAS.T_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CLASIFICA'
      KeyFields = 'CLIENTE'
      Lookup = True
    end
  end
  object QL_Dval: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select Producto,Subclave,Sum(Importe) as Total, Count(*) as cant' +
        'idad'
      '  from DGASDVAL'
      'Where Estacion=:pestacion and Caja=:pcaja and'
      '              Fecha>=:pfechaini and Fecha<=:pfechafin and '
      '              Facturado=:pfacturado and'
      '             Cliente=:pcliente'
      'Group by Producto,Subclave'
      'Order by Producto,Subclave')
    Left = 64
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pcaja'
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
        DataType = ftString
        Name = 'pfacturado'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pcliente'
        ParamType = ptUnknown
      end>
    object QL_DvalPRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
    end
    object QL_DvalTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QL_DvalNombreProducto: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreProducto'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'PRODUCTO'
      Size = 30
      Lookup = True
    end
    object QL_DvalCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object QL_DvalSUBCLAVE: TIntegerField
      FieldName = 'SUBCLAVE'
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 112
    Top = 24
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 144
    Top = 24
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 176
    Top = 24
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 216
    Top = 24
  end
  object QL_Pval2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASPVAL'
      'Where fecha>=:pfechaini and fecha<=:pfechafin and facturado='#39'No'#39
      'Order by fecha')
    Left = 223
    Top = 64
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
    object QL_Pval2ESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASPVAL.ESTACION'
    end
    object QL_Pval2CAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASPVAL.CAJA'
    end
    object QL_Pval2FECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASPVAL.FECHA'
    end
    object QL_Pval2TURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASPVAL.TURNO'
    end
    object QL_Pval2INDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASPVAL.INDICE'
    end
    object QL_Pval2CLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASPVAL.CLIENTE'
    end
    object QL_Pval2CANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'DBGASOL1.DGASPVAL.CANTIDAD'
    end
    object QL_Pval2TOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'DBGASOL1.DGASPVAL.TOTAL'
    end
    object QL_Pval2FACTURADO: TStringField
      FieldName = 'FACTURADO'
      Origin = 'DBGASOL1.DGASPVAL.FACTURADO'
      Size = 2
    end
    object QL_Pval2ESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
      Origin = 'DBGASOL1.DGASPVAL.ESTACIONFAC'
    end
    object QL_Pval2SERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASPVAL.SERIEFAC'
      Size = 2
    end
    object QL_Pval2FOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASPVAL.FOLIOFAC'
    end
    object QL_Pval2INDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
      Origin = 'DBGASOL1.DGASPVAL.INDICEVALE'
    end
  end
  object DSQL_Pval: TDataSource
    DataSet = QL_Pval2
    Left = 424
    Top = 16
  end
  object QL_Vale2: TQuery
    DatabaseName = 'DBGASOL1'
    DataSource = DSQL_Pval
    SQL.Strings = (
      'Select * from DGASVALE'
      'where estacion=:estacion and'
      'caja=:caja and'
      'fecha=:fecha and'
      'turno=:turno and'
      'indice=:indice')
    Left = 255
    Top = 64
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
    object QL_Vale2ESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASVALE.ESTACION'
    end
    object QL_Vale2CAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASVALE.CAJA'
    end
    object QL_Vale2FECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASVALE.FECHA'
    end
    object QL_Vale2TURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASVALE.TURNO'
    end
    object QL_Vale2INDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASVALE.INDICE'
    end
    object QL_Vale2INDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
      Origin = 'DBGASOL1.DGASVALE.INDICEVALE'
    end
    object QL_Vale2IMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBGASOL1.DGASVALE.IMPORTE'
    end
    object QL_Vale2FACTURADO: TStringField
      FieldName = 'FACTURADO'
      Origin = 'DBGASOL1.DGASVALE.FACTURADO'
      Size = 2
    end
    object QL_Vale2ESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
      Origin = 'DBGASOL1.DGASVALE.ESTACIONFAC'
    end
    object QL_Vale2SERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASVALE.SERIEFAC'
      Size = 2
    end
    object QL_Vale2FOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASVALE.FOLIOFAC'
    end
    object QL_Vale2CLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASVALE.CLIENTE'
    end
  end
  object DSQL_Vale: TDataSource
    DataSet = QL_Vale2
    Left = 456
    Top = 16
  end
  object QL_Dval2: TQuery
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
    Left = 287
    Top = 64
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
    object QL_Dval2NombreProducto: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreProducto'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'PRODUCTO'
      Lookup = True
    end
    object QL_Dval2ESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASDVAL.ESTACION'
    end
    object QL_Dval2CAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASDVAL.CAJA'
    end
    object QL_Dval2FECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASDVAL.FECHA'
    end
    object QL_Dval2TURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASDVAL.TURNO'
    end
    object QL_Dval2INDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASDVAL.INDICE'
    end
    object QL_Dval2INDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
      Origin = 'DBGASOL1.DGASDVAL.INDICEVALE'
    end
    object QL_Dval2PRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
      Origin = 'DBGASOL1.DGASDVAL.PRODUCTO'
    end
    object QL_Dval2IMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBGASOL1.DGASDVAL.IMPORTE'
    end
    object QL_Dval2FACTURADO: TStringField
      FieldName = 'FACTURADO'
      Origin = 'DBGASOL1.DGASDVAL.FACTURADO'
      Size = 2
    end
    object QL_Dval2ESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
      Origin = 'DBGASOL1.DGASDVAL.ESTACIONFAC'
    end
    object QL_Dval2SERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASDVAL.SERIEFAC'
      Size = 2
    end
    object QL_Dval2FOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASDVAL.FOLIOFAC'
    end
    object QL_Dval2CLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASDVAL.CLIENTE'
    end
  end
  object TT_Auxi: TRxMemoryData
    FieldDefs = <>
    Left = 256
    Top = 16
    object TT_AuxiCombustible: TIntegerField
      FieldName = 'Combustible'
    end
    object TT_AuxiNombre: TStringField
      FieldName = 'Nombre'
      Size = 30
    end
    object TT_AuxiSubtotal: TFloatField
      FieldName = 'Subtotal'
    end
    object TT_AuxiIva: TFloatField
      FieldName = 'Iva'
    end
    object TT_AuxiTotal: TFloatField
      FieldName = 'Total'
    end
    object TT_AuxiCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
  end
  object TM_Pval: TRxMemoryData
    FieldDefs = <>
    Left = 216
    Top = 200
    object TM_PvalCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TM_PvalCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object TM_PvalSubtotal: TFloatField
      FieldName = 'Subtotal'
    end
    object TM_PvalIva: TFloatField
      FieldName = 'Iva'
    end
    object TM_PvalNombreCliente: TStringField
      FieldName = 'NombreCliente'
      Size = 60
    end
    object TM_PvalTotal: TFloatField
      FieldName = 'Total'
    end
    object TM_PvalGrupo: TIntegerField
      FieldName = 'Grupo'
    end
  end
end
