object FLIQREP04: TFLIQREP04
  Left = 214
  Top = 160
  Width = 544
  Height = 375
  HorzScrollBar.Position = 48
  Caption = 'Verificador de Cupones Vendidos / Contabilidad'
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
    Left = -16
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
      100
      2794
      100
      2159
      80
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand1: TQRBand
      Left = 30
      Top = 38
      Width = 748
      Height = 68
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        179.916666666667
        1979.08333333333)
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
          52.9166666666667
          0
          18.5208333333333
          132.291666666667)
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
          42.3333333333333
          0
          55.5625
          108.479166666667)
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
          42.3333333333333
          0
          95.25
          124.354166666667)
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
          42.3333333333333
          0
          132.291666666667
          140.229166666667)
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
        Left = 676
        Top = 6
        Width = 29
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1788.58333333333
          15.875
          76.7291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Página'
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
        Left = 703
        Top = 6
        Width = 33
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          1860.02083333333
          15.875
          87.3125)
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
    end
    object QRBand2: TQRBand
      Left = 30
      Top = 135
      Width = 748
      Height = 20
      Frame.Color = clGray
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.9166666666667
        1979.08333333333)
      BandType = rbPageFooter
      object QRLFechaHora: TQRLabel
        Left = 666
        Top = 3
        Width = 63
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.0416666666667
          1762.125
          7.9375
          166.6875)
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
          37.0416666666667
          5.29166666666667
          7.9375
          134.9375)
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
      Left = 30
      Top = 121
      Width = 748
      Height = 14
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = BndDtBeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        37.0416666666667
        1979.08333333333)
      Master = QuickRep1
      PrintBefore = False
      object QRLabel11: TQRLabel
        Left = 86
        Top = 1
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          227.541666666667
          2.64583333333333
          142.875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel11'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 322
        Top = 1
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          851.958333333333
          2.64583333333333
          142.875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel13'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape22: TQRShape
        Left = 283
        Top = 0
        Width = 95
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          5.29166666666667
          748.770833333333
          0
          251.354166666667)
        Shape = qrsHorLine
      end
      object QRLabel12: TQRLabel
        Left = 208
        Top = 1
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          550.333333333333
          2.64583333333333
          142.875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel12'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 17
        Top = 1
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          44.9791666666667
          2.64583333333333
          142.875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel10'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape21: TQRShape
        Left = 170
        Top = 0
        Width = 95
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          5.29166666666667
          449.791666666667
          0
          251.354166666667)
        Shape = qrsHorLine
      end
      object QRShape23: TQRShape
        Left = 388
        Top = 0
        Width = 81
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          1026.58333333333
          0
          214.3125)
        Shape = qrsHorLine
      end
      object QRLabel14: TQRLabel
        Left = 411
        Top = 1
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1087.4375
          2.64583333333333
          142.875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel14'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object ChildBand2: TQRChildBand
      Left = 30
      Top = 106
      Width = 748
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        39.6875
        1979.08333333333)
      ParentBand = QRBand1
      object QRLabel1: TQRLabel
        Left = 177
        Top = 1
        Width = 68
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          468.3125
          2.64583333333333
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'V e n d i d o s'
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
        Left = 283
        Top = 0
        Width = 83
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          748.770833333333
          0
          219.604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'F a c t u r a d o s'
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
      object QRLabel6: TQRLabel
        Left = 401
        Top = 0
        Width = 50
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1060.97916666667
          0
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Diferencia'
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
      object QRShape1: TQRShape
        Left = 156
        Top = 0
        Width = 1
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          412.75
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape3: TQRShape
        Left = 266
        Top = 0
        Width = 1
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          703.791666666667
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape12: TQRShape
        Left = 76
        Top = 0
        Width = 1
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          201.083333333333
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRLabel9: TQRLabel
        Left = 18
        Top = 1
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          47.625
          2.64583333333333
          113.770833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'F e c h a'
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
      object QRShape9: TQRShape
        Left = 380
        Top = 0
        Width = 1
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1005.41666666667
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRShape2: TQRShape
        Left = 468
        Top = 0
        Width = 1
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1238.25
          0
          2.64583333333333)
        Shape = qrsVertLine
      end
      object QRLabel2: TQRLabel
        Left = 97
        Top = 1
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          256.645833333333
          2.64583333333333
          100.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Factura'
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
    end
  end
  object QL_Cupo: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Sum(importe) as CupVendidos from DGASCUPO'
      'where Estacion=:pestacion and Caja=:pcaja and'
      '           FechaVenta=:pfecha and (estatus='#39'V'#39' or estatus='#39'R'#39')')
    Left = 56
    Top = 24
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
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_CupoCUPVENDIDOS: TFloatField
      FieldName = 'CUPVENDIDOS'
    end
  end
  object QL_Facc: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select sum(total) as CupFacturados from DGASFACC'
      'where estacion=:pestacion and caja=:pcaja and'
      '          fecha=:pfecha')
    Left = 88
    Top = 24
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
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_FaccCUPFACTURADOS: TFloatField
      FieldName = 'CUPFACTURADOS'
    end
  end
  object TT_Auxi: TTable
    OnFilterRecord = TT_AuxiFilterRecord
    Left = 140
    Top = 27
    object TT_AuxiNoReg: TIntegerField
      FieldName = 'NoReg'
    end
    object TT_AuxiTipoFac: TStringField
      FieldName = 'TipoFac'
      Size = 2
    end
    object TT_AuxiFolioFac: TIntegerField
      FieldName = 'FolioFac'
    end
    object TT_AuxiImporteVendido: TFloatField
      FieldName = 'ImporteVendido'
    end
    object TT_AuxiImporteFacturado: TFloatField
      FieldName = 'ImporteFacturado'
    end
  end
  object QL_Cupo2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select seriefac,foliofac,sum(importe) as total from DGASCUPO'
      'group by seriefac,foliofac'
      
        'having estacion=:pestacion and caja=:pcaja and fechaventa=:pfech' +
        'a and'
      '           (estatus='#39'V'#39' or estatus='#39'R'#39')'
      'order by foliofac')
    Left = 184
    Top = 24
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
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_Cupo2SERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Size = 2
    end
    object QL_Cupo2FOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
    end
    object QL_Cupo2TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object QL_Facc2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select tipofac,folio,total from dgasfacc'
      'where estacion=:pestacion and caja=:pcaja and fecha=:pfecha'
      'order by folio')
    Left = 216
    Top = 24
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
        Name = 'pfecha'
        ParamType = ptUnknown
      end>
    object QL_Facc2TIPOFAC: TStringField
      FieldName = 'TIPOFAC'
      Size = 2
    end
    object QL_Facc2FOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_Facc2TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
