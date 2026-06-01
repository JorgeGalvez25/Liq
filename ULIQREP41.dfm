object FLIQREP41: TFLIQREP41
  Left = 312
  Top = 232
  Width = 852
  Height = 469
  VertScrollBar.Position = 8
  Caption = 'Reporte de documentos y vales pendientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 8
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
    Font.Height = -11
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
    object BndDt: TQRStringsBand
      Left = 38
      Top = 123
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
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        39.687500000000000000
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
      object QRLabel21: TQRLabel
        Left = 7
        Top = 1
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          2.645833333333333000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel21'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 90
        Top = 2
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          238.125000000000000000
          5.291666666666667000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel22'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Tag = 151
        Left = 158
        Top = 2
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          418.041666666666700000
          5.291666666666667000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel23'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Tag = 217
        Left = 225
        Top = 2
        Width = 209
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          595.312500000000000000
          5.291666666666667000
          552.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel24'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 456
        Top = 2
        Width = 64
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          5.291666666666667000
          169.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel25'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 526
        Top = 2
        Width = 64
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1391.708333333333000000
          5.291666666666667000
          169.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel26'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 597
        Top = 2
        Width = 64
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1579.562500000000000000
          5.291666666666667000
          169.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel27'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 674
        Top = 2
        Width = 62
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1783.291666666667000000
          5.291666666666667000
          164.041666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel28'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 436
        Top = 1
        Width = 16
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1153.583333333333000000
          2.645833333333333000
          42.333333333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel29'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand7: TQRBand
      Left = 38
      Top = 144
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
        Left = 672
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
          1778.000000000000000000
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
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
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
      object QRPag: TQRLabel
        Left = 695
        Top = 4
        Width = 20
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1838.854166666667000000
          10.583333333333330000
          52.916666666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'P'#225'g.'
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
        Left = 701
        Top = 4
        Width = 33
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333330000
          1854.729166666667000000
          10.583333333333330000
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
      object QRLRango: TQRLabel
        Left = 0
        Top = 50
        Width = 61
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
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLRango'
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
      object QRLMoneda: TQRLabel
        Left = 666
        Top = 50
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1762.125000000000000000
          132.291666666666700000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLMoneda'
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
      object QRLFechaHoraEnc: TQRLabel
        Left = 657
        Top = 17
        Width = 79
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1738.312500000000000000
          44.979166666666670000
          209.020833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLFechaHoraEnc'
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
    end
    object ChildBand2: TQRChildBand
      Left = 38
      Top = 138
      Width = 740
      Height = 6
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ChildBand2BeforePrint
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
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 105
      Width = 740
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
        1957.916666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      object QRLabel33: TQRLabel
        Left = 10
        Top = 2
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          5.291666666666667000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Documento'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 105
        Top = 2
        Width = 31
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          277.812500000000000000
          5.291666666666667000
          82.020833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fecha'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 170
        Top = 2
        Width = 33
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          449.791666666666700000
          5.291666666666667000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vence'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 225
        Top = 2
        Width = 47
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          595.312500000000000000
          5.291666666666667000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Concepto'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape55: TQRShape
        Left = 520
        Top = 0
        Width = 2
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1375.833333333333000000
          0.000000000000000000
          5.291666666666667000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 592
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
          1566.333333333333000000
          0.000000000000000000
          2.645833333333333000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 480
        Top = 2
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          5.291666666666667000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'T o t a l'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape8: TQRShape
        Left = 89
        Top = 0
        Width = 2
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          235.479166666666700000
          0.000000000000000000
          5.291666666666667000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 156
        Top = 0
        Width = 2
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          412.750000000000100000
          0.000000000000000000
          5.291666666666667000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 220
        Top = 0
        Width = 2
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          582.083333333333400000
          0.000000000000000000
          5.291666666666667000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 454
        Top = 0
        Width = 2
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1201.208333333333000000
          0.000000000000000000
          5.291666666666667000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 554
        Top = 2
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1465.791666666667000000
          5.291666666666667000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pagos '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 629
        Top = 2
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1664.229166666667000000
          5.291666666666667000
          74.083333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Saldo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 671
        Top = 2
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1775.354166666667000000
          5.291666666666667000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Iva Pendiente'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRLabel4Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 662
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
          1751.541666666667000000
          0.000000000000000000
          2.645833333333333000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
  end
  object QL_Carg: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      'select tipomov,folio,indice,fecha,fecvence,iva,'
      
        '          importe,totalpagos,concepto,moneda,Paridad from DCXCCA' +
        'RG'
      'where noclie=:pnoclie and'
      '           fecha<=:pfecha and'
      '          saldado='#39'No'#39' and Aplicado='#39'Si'#39' and moneda=:pmoneda'
      'order by fecha,tipomov,folio,indice')
    UniDirectional = True
    Left = 215
    Top = 27
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
      end
      item
        DataType = ftString
        Name = 'pmoneda'
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
    object QL_CargCONCEPTO: TStringField
      FieldName = 'CONCEPTO'
      Size = 40
    end
    object QL_CargIVA: TFloatField
      FieldName = 'IVA'
    end
    object QL_CargMONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 2
    end
    object QL_CargINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object QL_CargPARIDAD: TFloatField
      FieldName = 'PARIDAD'
    end
  end
  object TT_Auxi: TTable
    OnCalcFields = TT_AuxiCalcFields
    StoreDefs = True
    Left = 184
    Top = 27
    object TT_AuxiReg: TIntegerField
      FieldName = 'Reg'
    end
    object TT_AuxiGrupo: TIntegerField
      FieldName = 'Grupo'
    end
    object TT_AuxiNombreGrupo: TStringField
      FieldName = 'NombreGrupo'
      Size = 30
    end
    object TT_AuxiNoClie: TIntegerField
      FieldName = 'NoClie'
    end
    object TT_AuxiNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
    object TT_AuxiTipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 2
    end
    object TT_AuxiFolio: TIntegerField
      FieldName = 'Folio'
    end
    object TT_AuxiFecVence: TDateTimeField
      FieldName = 'FecVence'
    end
    object TT_AuxiConcepto: TStringField
      FieldName = 'Concepto'
      Size = 50
    end
    object TT_AuxiFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object TT_AuxiTotal: TFloatField
      FieldName = 'Total'
    end
    object TT_AuxiPagos: TFloatField
      FieldName = 'Pagos'
    end
    object TT_AuxiSaldo: TFloatField
      FieldName = 'Saldo'
    end
    object TT_AuxiIvaPendiente: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaPendiente'
      Calculated = True
    end
    object TT_AuxiIva: TFloatField
      FieldName = 'Iva'
    end
    object TT_AuxiMoneda: TStringField
      FieldName = 'Moneda'
      Size = 2
    end
    object TT_AuxiIndice: TIntegerField
      FieldName = 'Indice'
    end
    object TT_AuxiTelefono: TStringField
      FieldName = 'Telefono'
    end
    object TT_AuxiParidad: TFloatField
      FieldName = 'Paridad'
    end
    object TT_AuxiSaldoMN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SaldoMN'
      Calculated = True
    end
    object TT_AuxiPagosMN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PagosMN'
      Calculated = True
    end
    object TT_AuxiTotalMN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalMN'
      Calculated = True
    end
    object TT_AuxiIvaMN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaMN'
      Calculated = True
    end
    object TT_AuxiIvaPendienteMN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaPendienteMN'
      Calculated = True
    end
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 338
    Top = 24
  end
  object QL_Clie: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      'select noclie,nombre,clasifica,telefono from DGENCLIE'
      'where noclie in'
      '          (Select NoClie from DCXCSCXC)'
      'order by NoClie')
    Left = 73
    Top = 24
    object QL_ClieNOCLIE: TIntegerField
      FieldName = 'NOCLIE'
    end
    object QL_ClieNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 80
    end
    object QL_ClieCLASIFICA: TIntegerField
      FieldName = 'CLASIFICA'
    end
    object QL_ClieNombreClasif: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreClasif'
      LookupDataSet = FLIQREP41P.QL_Clas
      LookupKeyFields = 'CLAVECLASIF'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'CLASIFICA'
      Size = 30
      Lookup = True
    end
    object QL_ClieTELEFONO: TStringField
      FieldName = 'TELEFONO'
      Size = 30
    end
  end
  object QL_Abon: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'select SuclCar,TipoCar,FolioCar,IndiceCar,Importe,moneda,paridad' +
        ' from DCXCABON'
      
        'where noclie=:pnoclie and fecha>:pfecha and aplicado='#39'Si'#39'  and m' +
        'oneda=:pmoneda'
      'Order by fecha')
    Left = 246
    Top = 27
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
      end
      item
        DataType = ftString
        Name = 'pmoneda'
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
    object QL_AbonPARIDAD: TFloatField
      FieldName = 'PARIDAD'
    end
  end
  object QL_Carg2: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'Select TipoMov,Folio,Indice,Fecha,FecVence,Importe,Concepto,Tota' +
        'lPagos,iva,moneda,Paridad from DCXCCARG'
      
        'where Sucursal=:psucursal and TipoMov=:ptipomov and Folio=:pfoli' +
        'o '
      '    and Indice=:pindice and moneda=:pmoneda')
    Left = 135
    Top = 30
    ParamData = <
      item
        DataType = ftInteger
        Name = 'psucursal'
        ParamType = ptUnknown
      end
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
        Name = 'pindice'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pmoneda'
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
    object QL_Carg2CONCEPTO: TStringField
      FieldName = 'CONCEPTO'
      Size = 40
    end
    object QL_Carg2IVA: TFloatField
      FieldName = 'IVA'
    end
    object QL_Carg2MONEDA: TStringField
      FieldName = 'MONEDA'
      Size = 2
    end
    object QL_Carg2INDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object QL_Carg2PARIDAD: TFloatField
      FieldName = 'PARIDAD'
    end
  end
  object QL_Mone: TQuery
    DatabaseName = 'DBIMAGEN'
    SQL.Strings = (
      'Select Clave from DGENMONE'
      'Order by Clave')
    Left = 280
    Top = 24
    object QL_MoneCLAVE: TStringField
      FieldName = 'CLAVE'
      Size = 2
    end
  end
  object QL_Vale: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select * from DGASPVAL'
      'where Cantidad>0')
    Left = 464
    Top = 48
    object QL_ValeESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASPVAL.ESTACION'
    end
    object QL_ValeCAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASPVAL.CAJA'
    end
    object QL_ValeFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASPVAL.FECHA'
    end
    object QL_ValeTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASPVAL.TURNO'
    end
    object QL_ValeINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASPVAL.INDICE'
    end
    object QL_ValeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASPVAL.CLIENTE'
    end
    object QL_ValeSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
      Origin = 'DBGASOL1.DGASPVAL.SUBCODIGO'
    end
    object QL_ValeCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      Origin = 'DBGASOL1.DGASPVAL.CANTIDAD'
    end
    object QL_ValeTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'DBGASOL1.DGASPVAL.TOTAL'
    end
    object QL_ValeFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Origin = 'DBGASOL1.DGASPVAL.FACTURADO'
      Size = 2
    end
    object QL_ValeESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
      Origin = 'DBGASOL1.DGASPVAL.ESTACIONFAC'
    end
    object QL_ValeSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASPVAL.SERIEFAC'
      Size = 2
    end
    object QL_ValeFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASPVAL.FOLIOFAC'
    end
    object QL_ValeINDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
      Origin = 'DBGASOL1.DGASPVAL.INDICEVALE'
    end
    object QL_ValeFECHAFACTURA: TDateTimeField
      FieldName = 'FECHAFACTURA'
      Origin = 'DBGASOL1.DGASPVAL.FECHAFACTURA'
    end
  end
end
