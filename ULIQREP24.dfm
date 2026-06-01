object FLIQREP24: TFLIQREP24
  Left = 393
  Top = 185
  Width = 544
  Height = 370
  VertScrollBar.Position = 8
  Caption = 'Relaci'#243'n de Cupones Recuperados por Cliente'
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
        Left = 698
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
          1846.791666666667000000
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
        Left = 657
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
          1738.312500000000000000
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
      Top = 143
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
        Left = 667
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
          1764.770833333333000000
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
      Height = 7
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
        18.520833333333330000
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
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 384
    Top = 8
  end
  object QL_Rcup: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select Estacion,Fecha,Turno,serie,cupon,importe,'
      
        '(select nocliente from dgascupo where folio=r.cupon and serie=r.' +
        'serie) as cliente'
      ' from dgasrcup r'
      'where fecha=:pfecha and'
      '          estacion=:pestacion and'
      '          turno=:pturno'
      'order by serie,cupon')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pturno'
        ParamType = ptUnknown
      end>
    object QL_RcupESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_RcupFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_RcupTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_RcupSERIE: TIntegerField
      FieldName = 'SERIE'
    end
    object QL_RcupIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_RcupCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QL_RcupCUPON: TFloatField
      FieldName = 'CUPON'
    end
    object QL_RcupTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object TT_Auxi: TRxMemoryData
    FieldDefs = <>
    Left = 80
    Top = 16
    object TT_AuxiCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TT_AuxiSerie: TIntegerField
      FieldName = 'Serie'
    end
    object TT_AuxiImporte: TFloatField
      FieldName = 'Importe'
    end
    object TT_AuxiNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
    object TT_AuxiCupon: TFloatField
      FieldName = 'Cupon'
    end
  end
  object QL_CupoFeria: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select c.*'
      ' from dgascupo c'
      'where c.fecha_kiosco=:pfecha and'
      '          c.estacion=:pestacion and'
      '          c.turno_kiosco=:pturno and'
      '          c.nocliente=:pNoCliente'
      'order by c.serie,c.folio')
    Left = 160
    Top = 16
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pturno'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pNoCliente'
        ParamType = ptUnknown
      end>
    object QL_CupoFeriaSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DBGASOL1.DGASCUPO.SERIE'
    end
    object QL_CupoFeriaNOBLOCK: TIntegerField
      FieldName = 'NOBLOCK'
      Origin = 'DBGASOL1.DGASCUPO.NOBLOCK'
    end
    object QL_CupoFeriaFOLIO: TIntegerField
      FieldName = 'FOLIO'
      Origin = 'DBGASOL1.DGASCUPO.FOLIO'
    end
    object QL_CupoFeriaFECHAVENTA: TDateTimeField
      FieldName = 'FECHAVENTA'
      Origin = 'DBGASOL1.DGASCUPO.FECHAVENTA'
    end
    object QL_CupoFeriaFECHARECUP: TDateTimeField
      FieldName = 'FECHARECUP'
      Origin = 'DBGASOL1.DGASCUPO.FECHARECUP'
    end
    object QL_CupoFeriaIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      Origin = 'DBGASOL1.DGASCUPO.IMPORTE'
    end
    object QL_CupoFeriaESTATUS: TStringField
      FieldName = 'ESTATUS'
      Origin = 'DBGASOL1.DGASCUPO.ESTATUS'
      Size = 1
    end
    object QL_CupoFeriaSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASCUPO.SERIEFAC'
      Size = 2
    end
    object QL_CupoFeriaFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASCUPO.FOLIOFAC'
    end
    object QL_CupoFeriaESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASCUPO.ESTACION'
    end
    object QL_CupoFeriaCAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASCUPO.CAJA'
    end
    object QL_CupoFeriaTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASCUPO.TURNO'
    end
    object QL_CupoFeriaFECHAEMISION: TDateTimeField
      FieldName = 'FECHAEMISION'
      Origin = 'DBGASOL1.DGASCUPO.FECHAEMISION'
    end
    object QL_CupoFeriaTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'DBGASOL1.DGASCUPO.TIPO'
      Size = 1
    end
    object QL_CupoFeriaINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASCUPO.INDICE'
    end
    object QL_CupoFeriaESTACIONRECUP: TIntegerField
      FieldName = 'ESTACIONRECUP'
      Origin = 'DBGASOL1.DGASCUPO.ESTACIONRECUP'
    end
    object QL_CupoFeriaNOCLIENTE: TIntegerField
      FieldName = 'NOCLIENTE'
      Origin = 'DBGASOL1.DGASCUPO.NOCLIENTE'
    end
    object QL_CupoFeriaIMPRESO: TStringField
      FieldName = 'IMPRESO'
      Origin = 'DBGASOL1.DGASCUPO.IMPRESO'
      Size = 2
    end
    object QL_CupoFeriaKIOSCO: TIntegerField
      FieldName = 'KIOSCO'
      Origin = 'DBGASOL1.DGASCUPO.KIOSCO'
    end
    object QL_CupoFeriaTURNO_KIOSCO: TIntegerField
      FieldName = 'TURNO_KIOSCO'
      Origin = 'DBGASOL1.DGASCUPO.TURNO_KIOSCO'
    end
    object QL_CupoFeriaFECHA_KIOSCO: TDateTimeField
      FieldName = 'FECHA_KIOSCO'
      Origin = 'DBGASOL1.DGASCUPO.FECHA_KIOSCO'
    end
  end
end
