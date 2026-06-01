object FLIQREP29: TFLIQREP29
  Left = 212
  Top = 176
  Width = 754
  Height = 370
  VertScrollBar.Position = 8
  Caption = 'Reporte de Antig'#252'edad de Saldos Resumido'
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
        Left = 658
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
          1740.958333333333000000
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
        Left = 672
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
          1778.000000000000000000
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
        Left = 631
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
          1669.520833333333000000
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
      Top = 145
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
        52.916666666666660000
        1878.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLFechaHora: TQRLabel
        Left = 641
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
          1695.979166666667000000
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
      Width = 710
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
        1878.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintBefore = False
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 136
      Width = 710
      Height = 9
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
        23.812500000000000000
        1878.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = BndDt
    end
    object ChbEnca: TQRChildBand
      Left = 38
      Top = 106
      Width = 710
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
        1878.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 200
    Top = 16
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 232
    Top = 16
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 264
    Top = 16
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 296
    Top = 16
  end
  object TT_Auxi: TRxMemoryData
    FieldDefs = <>
    AfterInsert = TT_AuxiAfterInsert
    OnCalcFields = TT_AuxiCalcFields
    Left = 336
    Top = 16
    object TT_AuxiCliente: TIntegerField
      FieldName = 'Cliente'
      OnChange = TT_AuxiClienteChange
    end
    object TT_AuxiTipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 2
    end
    object TT_AuxiFolio: TIntegerField
      FieldName = 'Folio'
    end
    object TT_AuxiFecha: TDateTimeField
      FieldName = 'Fecha'
    end
    object TT_AuxiSaldo: TFloatField
      FieldName = 'Saldo'
    end
    object TT_AuxiSucursal: TIntegerField
      FieldName = 'Sucursal'
    end
    object TT_AuxiFolioStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'FolioStr'
      Size = 12
      Calculated = True
    end
    object TT_AuxiNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
  end
  object QL_Abon: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'select NoClie as Cliente,SuclCar,TipoCar,FolioCar,IndiceCar,Impo' +
        'rteMN as Total from DCXCABON'
      'where fecha>:pfecha and aplicado='#39'Si'#39' '
      'Order by NoClie,fecha')
    Left = 466
    Top = 11
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_AbonCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
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
    object QL_AbonINDICECAR: TIntegerField
      FieldName = 'INDICECAR'
    end
    object QL_AbonTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object QL_Carg: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'select NoClie as Cliente,sucursal,tipomov,folio,fecha,(importe-T' +
        'otalPagos) as Total from DCXCCARG'
      'where  fecha<=:pfecha and'
      '          saldado='#39'No'#39' and Aplicado='#39'Si'#39' '
      'order by NoClie,fecha,tipomov,folio')
    UniDirectional = True
    Left = 435
    Top = 11
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_CargCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
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
    object QL_CargTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QL_CargSUCURSAL: TIntegerField
      FieldName = 'SUCURSAL'
    end
  end
  object QL_Carg2: TQuery
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'Select Sucursal,TipoMov,Folio,NoClie as Cliente,Fecha,(Importe-T' +
        'otalPagos) as Total from DCXCCARG'
      
        'where TipoMov=:ptipomov and Folio=:pfolio and Sucursal=:psucursa' +
        'l')
    Left = 494
    Top = 14
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
      end>
    object QL_Carg2SUCURSAL: TIntegerField
      FieldName = 'SUCURSAL'
    end
    object QL_Carg2TIPOMOV: TStringField
      FieldName = 'TIPOMOV'
      Size = 2
    end
    object QL_Carg2FOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_Carg2CLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QL_Carg2FECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_Carg2TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
