object FLIQREP32: TFLIQREP32
  Left = 212
  Top = 176
  Width = 544
  Height = 370
  VertScrollBar.Position = 8
  Caption = 'Resumen de Ventas de Productos por Despachador'
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
          60.854166666666700000)
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
          34.395833333333300000
          1767.416666666670000000
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
          44.979166666666700000
          1653.645833333330000000
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
      Top = 153
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
          37.041666666666700000
          1690.687500000000000000
          5.291666666666670000
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
      Top = 137
      Width = 710
      Height = 16
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
        42.333333333333330000
        1878.541666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = BndDt
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
  object QL_Dliqa: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select d.estacion,d.fecha,d.folio,d.producto,d.venta,d.precio_ci' +
        'va,d.importe,'
      
        '  (select descripcion from DGASPROD where clave=d.producto) as D' +
        'escripcion,'
      
        '  (select Despachador from DGASLIQG where estacion=d.estacion an' +
        'd folio=d.folio) as Desp,'
      
        '  (select nombre from DGASDESP where clave=(select Despachador f' +
        'rom DGASLIQG where estacion=d.estacion and folio=d.folio)) as No' +
        'mbreDespachador,'
      '  d.isla, d.turno,(select jefe_turno from DGASTURC '
      
        '  where estacion=m.estacion and caja=m.caja and fecha=m.fecha an' +
        'd turno=m.turno)as jefe_turno'
      
        '  ,(select NOMBRE FROM DGASDESP where clave=(select jefe_turno f' +
        'rom DGASTURC '
      
        '  where estacion=m.estacion and caja=m.caja and fecha=m.fecha an' +
        'd turno=m.turno))as Nombre_jefe_turno'
      'from DGASDLIQA d, DGASLIQG m'
      'where d.estacion=m.estacion'
      ' and d.folio=m.folio'
      ' and d.fecha>='#39'04/01/2007'#39' and d.fecha<='#39'04/10/2007'#39
      ' and d. venta>0.001'
      'order by d.estacion,d.folio,d.fecha')
    Left = 24
    Top = 8
    object QL_DliqaESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_DliqaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqaFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_DliqaPRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
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
    object QL_DliqaISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object QL_DliqaTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DliqaJEFE_TURNO: TIntegerField
      FieldName = 'JEFE_TURNO'
    end
    object QL_DliqaNOMBRE_JEFE_TURNO: TStringField
      FieldName = 'NOMBRE_JEFE_TURNO'
      Size = 40
    end
    object QL_DliqaNOMBREDESPACHADOR: TStringField
      FieldName = 'NOMBREDESPACHADOR'
      Size = 40
    end
    object QL_DliqaDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object TT_Auxi: TTable
    Left = 67
    Top = 11
    object TT_AuxiDespachador: TIntegerField
      FieldName = 'Despachador'
    end
    object TT_AuxiProducto: TIntegerField
      FieldName = 'Producto'
    end
    object TT_AuxiNombreDespachador: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreDespachador'
      LookupDataSet = DMGASQ.QT_Desp
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'Despachador'
      Size = 30
      Lookup = True
    end
    object TT_AuxiCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object TT_AuxiImporte: TFloatField
      FieldName = 'Importe'
    end
    object TT_AuxiDescripcion: TStringField
      FieldKind = fkLookup
      FieldName = 'Descripcion'
      LookupDataSet = DMGAS.T_Prod
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'Producto'
      Size = 40
      Lookup = True
    end
    object TT_AuxiJefeTurno: TIntegerField
      FieldName = 'JefeTurno'
    end
    object TT_AuxiNombreJefeTurno: TStringField
      FieldName = 'NombreJefeTurno'
      Size = 50
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
  object TM_Auxi: TRxMemoryData
    FieldDefs = <>
    Left = 176
    Top = 208
    object TM_AuxiDespachador: TIntegerField
      FieldName = 'Despachador'
    end
    object TM_AuxiProducto: TIntegerField
      FieldName = 'Producto'
    end
    object TM_AuxiCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object TM_AuxiNombreDespachador: TStringField
      FieldName = 'NombreDespachador'
      Size = 50
    end
    object TM_AuxiImporte: TFloatField
      FieldName = 'Importe'
    end
    object TM_AuxiJefeTurno: TIntegerField
      FieldName = 'JefeTurno'
    end
    object TM_AuxiDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TM_AuxiNombreJefeTurno: TStringField
      FieldName = 'NombreJefeTurno'
      Size = 50
    end
  end
  object TM_Auxi2: TRxMemoryData
    FieldDefs = <>
    Left = 232
    Top = 208
    object TM_Auxi2Despachador: TIntegerField
      FieldName = 'Despachador'
    end
    object TM_Auxi2Producto: TIntegerField
      FieldName = 'Producto'
    end
    object TM_Auxi2Cantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object TM_Auxi2NombreDespachador: TStringField
      FieldName = 'NombreDespachador'
      Size = 50
    end
    object TM_Auxi2Importe: TFloatField
      FieldName = 'Importe'
    end
    object TM_Auxi2JefeTurno: TIntegerField
      FieldName = 'JefeTurno'
    end
    object TM_Auxi2Descripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TM_Auxi2NombreJefeTurno: TStringField
      FieldName = 'NombreJefeTurno'
      Size = 50
    end
  end
end
