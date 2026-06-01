object FLIQTURCcpol: TFLIQTURCcpol
  Left = 586
  Top = 271
  BorderStyle = bsDialog
  Caption = 'C'#225'lculo de P'#243'liza de Liquidaciones'
  ClientHeight = 139
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 11
    Width = 31
    Height = 13
    Caption = 'P'#243'liza:'
  end
  object BitBtn1: TBitBtn
    Left = 152
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Calcular'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF49A44918911AA4
      D4A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF39A63913AC2715B32B089410A5D7A5FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3CAC3C16AE2E17B23114AD2A13
      B12908920DA8D9A8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      3EB13E19B2331CB63A18B33434BC4D17B03013B02A09910EACDBACFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF53BD5A1FB73E20BA421FB84011A82415961562
      C77119B23213B12B0A920FB0DDB0FF00FFFF00FFFF00FFFF00FFFF00FF39B747
      42C8651FBB4615B32C65C665FF00FF37A93761C87119B13113B22C0B9110B4DE
      B4FF00FFFF00FFFF00FFFF00FF9EE1A643C25636BC4E62CC66FF00FFFF00FFFF
      00FF32A63263CA7217B13114B12C0C920FB6E1B6FF00FFFF00FFFF00FFFF00FF
      D3F5D5B3E9BAFF00FFFF00FFFF00FFFF00FFFF00FF2EA52E63CA7217B13114B3
      2D0D9210BADFBAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF2AA42A64CB7515B13116B330179219FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF26A52966CD
      782ABC462B9C2CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF33A83330A431CFE6CFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object BitBtn2: TBitBtn
    Left = 258
    Top = 86
    Width = 75
    Height = 25
    Caption = '&Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn2Click
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B06667C66667B3
      6667693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      9A6666AF6869C0696ACE6869CD6768B366676933349A66669A66669A66669A66
      669A66669A6666FF00FFFF00FFFF00FF9A6666D87273D77172D56F70D46E6FB6
      696A69333433CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FF
      9A6666DB7576DA7475D87273D77172B86B6B69333433CB6733CB6733CB6733CB
      67F9C5C69A6666FF00FFFF00FFFF00FF9A6666E27C7DE17B7CDF797ADE7879BB
      6E6F69333433CB6733CB6733CB6733CB67F9C5C69A6666FF00FFFF00FFFF00FF
      9A6666E57F80E47E7FE27C7DE17B7CBD707069333433CB6733CB6733CB6733CB
      67F9C5C69A6666FF00FFFF00FFFF00FF9A6666EC8687EB8586F2B9BAFF00FFC0
      7374693334C7F0BC79DD9060D68160D681F9C5C69A6666FF00FFFF00FFFF00FF
      9A6666EF898AEE8889F5BBBCFF00FFC27575693334FFFFDDFFFFDDFFFFDDE2F8
      CCF9C5C69A6666FF00FFFF00FFFF00FF9A6666F69091F58F90F38D8EF28C8DC5
      7878693334FFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FF
      9A6666F99394F89293F69091F58F90C77A7A693334FFFFDDFFFFDDFFFFDDFFFF
      DDF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF999AFE9899FD9798FC9697CA
      7D7D693334FFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FF
      9A6666FF999AFF999AFF999AFE9899CC7F7F693334FFFFDDFFFFDDFFFFDDFFFF
      DDF9C5C69A6666FF00FFFF00FFFF00FF9A6666C0797ADF898AFF999AFF999ACD
      8080693334FFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FF00FFFF00FFFF00FF
      FF00FF9A66669A6666C67C7DF29394CD80806933349A66669A66669A66669A66
      669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A
      6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
  end
  object ProgressBar1: TProgressBar
    Left = 12
    Top = 53
    Width = 321
    Height = 17
    TabOrder = 2
    Visible = False
  end
  object StaticText3: TStaticText
    Left = 288
    Top = 35
    Width = 40
    Height = 17
    Alignment = taRightJustify
    Caption = 'Avance'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 40
    Top = 7
    Width = 273
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'CLAVE'
    ListField = 'TipoDescripcion'
    ListSource = DMCFG.DSQ_Cpold
    ParentFont = False
    TabOrder = 0
  end
  object StaticText1: TStaticText
    Left = 3
    Top = 115
    Width = 70
    Height = 17
    Caption = 'StaticText1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object QL_Dliqc: TQuery
    OnCalcFields = QL_DliqcCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select estacion,combustible,fecha,turno,sum(cantidad) as Cantida' +
        'dprev,'
      '          sum(importe) as importeprev from DGASDLIQC'
      'where estacion=:pestacion and fecha=:pfecha '
      '   and turno=:pturno'
      'group by estacion,combustible,fecha,turno')
    Left = 8
    Top = 65534
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
    object QL_DliqcCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object QL_DliqcFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqcTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DliqcProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_DliqcSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_DliqcIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_DliqcFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_DliqcCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_DliqcImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_DliqcSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_DliqcIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_DliqcCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_DliqcIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_DliqcClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_DliqcImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_DliqcImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_DliqcCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_DliqcNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_DliqcCANTIDADPREV: TFloatField
      FieldName = 'CANTIDADPREV'
    end
    object QL_DliqcIMPORTEPREV: TFloatField
      FieldName = 'IMPORTEPREV'
    end
    object QL_DliqcCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_DliqcImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_DliqcCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_DliqcNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_DliqcCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object QL_DliqcImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object QL_DliqcLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_DliqcNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_DliqcImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_DliqcTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_DliqcImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_DliqcImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_DliqcCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_DliqcCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_DliqcProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_DliqcCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object QL_DliqcGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object QL_DliqcImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_DliqcSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_DliqcIEPSCOMB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCOMB'
      Calculated = True
    end
    object QL_DliqcCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_DliqcCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_DliqcIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_DliqcSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_DliqcIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_DliqcSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_DliqcCuentaClienteAux: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Calculated = True
    end
    object QL_DliqcIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_DliqcSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_DliqcIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_DliqcSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_DliqcSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Size = 0
      Calculated = True
    end
    object QL_DliqcImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object QL_DliqcIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_DliqcSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object QL_DliqcIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_DliqcSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_DliqcSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object QL_DliqcFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_DliqcFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_DliqcImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_DliqcSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_DliqcClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_DliqcDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_DliqcImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_DliqcPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_DliqcIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_DliqcIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_DliqcNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object QL_DliqcFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object QL_DliqcTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object QL_DliqcTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_DliqcIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_DliqcCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_DliqcCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_DliqcDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_DliqcTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_DliqcIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_DliqcSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_Dliqa: TQuery
    OnCalcFields = QL_DliqaCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select estacion,producto,fecha,turno,sum(venta) as Cantidad,'
      '          sum(importe) as importeprod from DGASDLIQA'
      'where estacion=:pestacion and fecha=:pfecha and Venta>0'
      'and turno=:pturno'
      'group by estacion,producto,fecha,turno')
    Left = 7
    Top = 31
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
    object QL_DliqaCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_DliqaNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_DliqaImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object QL_DliqaESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_DliqaPRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
    end
    object QL_DliqaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqaTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DliqaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object QL_DliqaIMPORTEPROD: TFloatField
      FieldName = 'IMPORTEPROD'
    end
    object QL_DliqaSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_DliqaIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_DliqaCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_DliqaCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_DliqaCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_DliqaImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_DliqaCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_DliqaSubTotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubTotalComb'
      Calculated = True
    end
    object QL_DliqaIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_DliqaIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_DliqaClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_DliqaImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_DliqaImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_DliqaNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_DliqaCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_DliqaNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_DliqaCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object QL_DliqaFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_DliqaImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_DliqaTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_DliqaImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_DliqaImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_DliqaCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_DliqaProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_DliqaCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object QL_DliqaGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object QL_DliqaImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_DliqaLineaAceites: TIntegerField
      FieldKind = fkLookup
      FieldName = 'LineaAceites'
      LookupDataSet = DMGAS.T_Prod
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'LINEA'
      KeyFields = 'PRODUCTO'
      Lookup = True
    end
    object QL_DliqaSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_DliqaIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object QL_DliqaCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_DliqaCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_DliqaIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_DliqaSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_DliqaIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_DliqaSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_DliqaCuentaClienteAux: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Calculated = True
    end
    object QL_DliqaIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_DliqaSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_DliqaIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_DliqaSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_DliqaSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Calculated = True
    end
    object QL_DliqaImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object QL_DliqaIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_DliqaSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object QL_DliqaIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_DliqaSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_DliqaSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object QL_DliqaFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_DliqaFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_DliqaImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_DliqaSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_DliqaClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_DliqaDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_DliqaImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_DliqaPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_DliqaIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_DliqaIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_DliqaTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object QL_DliqaFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object QL_DliqaNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object QL_DliqaTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_DliqaIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_DliqaCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_DliqaCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_DliqaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_DliqaTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_DliqaIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_DliqaSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_Dliqp: TQuery
    OnCalcFields = QL_DliqpCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select estacion,folio, clave_pago as clavepago, fecha, turno,'
      '          sum(importe) as importeprev from DGASDLIQP'
      'where estacion=:pestacion and fecha=:pfecha '
      '    and turno=:pturno'
      'group by estacion,folio,clave_pago,fecha,turno')
    Left = 10
    Top = 77
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
    object QL_DliqpCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_DliqpNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_DliqpImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
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
    object QL_DliqpCLAVEPAGO: TStringField
      FieldName = 'CLAVEPAGO'
      Size = 2
    end
    object QL_DliqpCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_DliqpProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_DliqpImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_DliqpImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_DliqpSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_DliqpSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_DliqpIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_DliqpIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_DliqpFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_DliqpCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_DliqpCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_DliqpCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_DliqpImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_DliqpCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_DliqpNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_DliqpIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_DliqpIMPORTEPREV: TFloatField
      FieldName = 'IMPORTEPREV'
    end
    object QL_DliqpImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_DliqpFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_DliqpDespachador: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Despachador'
      Calculated = True
    end
    object QL_DliqpNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_DliqpCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object QL_DliqpCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_DliqpImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_DliqpTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_DliqpImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_DliqpImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_DliqpCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_DliqpProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_DliqpCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object QL_DliqpGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object QL_DliqpImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_DliqpLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_DliqpSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_DliqpIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object QL_DliqpCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_DliqpCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_DliqpIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_DliqpSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_DliqpIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_DliqpSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_DliqpCuentaClienteAux: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Calculated = True
    end
    object QL_DliqpIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_DliqpSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_DliqpIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_DliqpSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_DliqpSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Calculated = True
    end
    object QL_DliqpImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object QL_DliqpIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_DliqpSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object QL_DliqpIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_DliqpSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_DliqpSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object QL_DliqpFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_DliqpFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_DliqpImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_DliqpSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_DliqpClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_DliqpDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_DliqpImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_DliqpPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_DliqpIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_DliqpIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_DliqpTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object QL_DliqpFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object QL_DliqpNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object QL_DliqpTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_DliqpIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_DliqpCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_DliqpCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_DliqpDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_DliqpTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_DliqpIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_DliqpSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_Rcup: TQuery
    OnCalcFields = QL_RcupCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select r.estacion, r.fecha, r.turno, r.importe as importecupon,c' +
        '.combustible as CombustibleCupon,'
      
        'c.nocliente as NoClienteCupon, c.Serie as SerieCupon  from DGASR' +
        'CUP R, DGASCUPO C'
      'where r.estacion=:pestacion and r.fecha=:pfecha '
      '    and r.turno=:pturno'
      '    and r.serie=c.serie and r.cupon=c.folio')
    Left = 138
    Top = 39
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
    object QL_RcupCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_RcupImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object QL_RcupCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_RcupESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_RcupFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_RcupTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_RcupIMPORTECUPON: TFloatField
      FieldName = 'IMPORTECUPON'
    end
    object QL_RcupNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_RcupCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_RcupProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_RcupImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_RcupImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_RcupSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_RcupSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_RcupIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_RcupIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_RcupFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_RcupCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_RcupImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_RcupCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_RcupCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_RcupIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_RcupClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_RcupNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_RcupNOCLIENTECUPON: TIntegerField
      FieldName = 'NOCLIENTECUPON'
    end
    object QL_RcupImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_RcupTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_RcupImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_RcupImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_RcupImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_RcupCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_RcupProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_RcupCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object QL_RcupLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_RcupGrupoCliente: TIntegerField
      FieldKind = fkLookup
      FieldName = 'GrupoCliente'
      LookupDataSet = DMGEN_VTAS.TV_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CLASIFICA'
      KeyFields = 'NOCLIENTECUPON'
      Lookup = True
    end
    object QL_RcupCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object QL_RcupSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_RcupIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object QL_RcupCOMBUSTIBLECUPON: TIntegerField
      FieldName = 'COMBUSTIBLECUPON'
    end
    object QL_RcupCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_RcupIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_RcupSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_RcupIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_RcupSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_RcupCuentaClienteAux: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Size = 16
      Calculated = True
    end
    object QL_RcupIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_RcupSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_RcupIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_RcupSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_RcupSERIECUPON: TIntegerField
      FieldName = 'SERIECUPON'
    end
    object QL_RcupImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object QL_RcupIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_RcupSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object QL_RcupIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_RcupSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_RcupSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object QL_RcupFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_RcupFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_RcupImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_RcupSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_RcupClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_RcupDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_RcupImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_RcupPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_RcupIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_RcupIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_RcupTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object QL_RcupFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object QL_RcupNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object QL_RcupCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_RcupTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_RcupIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_RcupCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_RcupCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_RcupDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_RcupTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_RcupIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_RcupSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_Pval: TQuery
    OnCalcFields = QL_PvalCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select d.estacion, d.caja, d.fecha, d.turno, d.importe as import' +
        'evale, d.cliente as noclientevale, (select tipo from dgastcmb wh' +
        'ere clave=d.producto) as TIPO,'
      
        'd.Producto as CombustibleVale, d.subclave as ProductoVale, d.Can' +
        'tidad as CantidadVale from DGASDVAL d'
      'where d.estacion=:pestacion and d.fecha=:pfecha '
      '    and d.turno=:pturno ')
    Left = 303
    Top = 30
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
    object QL_PvalNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_PvalESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_PvalFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_PvalTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_PvalCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object QL_PvalIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_PvalCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_PvalIMPORTEVALE: TFloatField
      FieldName = 'IMPORTEVALE'
    end
    object QL_PvalClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_PvalCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_PvalImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_PvalCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_PvalFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_PvalIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_PvalIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_PvalSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_PvalSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_PvalImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_PvalImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_PvalProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_PvalCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_PvalCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_PvalImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_PvalNOCLIENTEVALE: TIntegerField
      FieldName = 'NOCLIENTEVALE'
    end
    object QL_PvalCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_PvalNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_PvalImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_PvalLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_PvalTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_PvalImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_PvalImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_PvalCOMBUSTIBLEVALE: TIntegerField
      FieldName = 'COMBUSTIBLEVALE'
    end
    object QL_PvalPRODUCTOVALE: TIntegerField
      FieldName = 'PRODUCTOVALE'
    end
    object QL_PvalCANTIDADVALE: TFloatField
      FieldName = 'CANTIDADVALE'
    end
    object QL_PvalGrupoCliente: TIntegerField
      FieldKind = fkLookup
      FieldName = 'GrupoCliente'
      LookupDataSet = DMGEN_VTAS.TV_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CLASIFICA'
      KeyFields = 'NOCLIENTEVALE'
      Lookup = True
    end
    object QL_PvalImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_PvalSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_PvalIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object QL_PvalCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_PvalCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_PvalIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_PvalSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_PvalIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_PvalSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_PvalCuentaClienteAux: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Size = 16
      Calculated = True
    end
    object QL_PvalIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_PvalSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_PvalIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_PvalSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_PvalTIPO: TStringField
      FieldName = 'TIPO'
      Size = 12
    end
    object QL_PvalSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Calculated = True
    end
    object QL_PvalImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object QL_PvalIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_PvalSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object QL_PvalIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_PvalSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_PvalSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object QL_PvalFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_PvalFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_PvalImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_PvalSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_PvalClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_PvalDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_PvalImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_PvalPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_PvalIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_PvalIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_PvalTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object QL_PvalFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object QL_PvalNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object QL_PvalCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object QL_PvalTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_PvalIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_PvalCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_PvalCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_PvalCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_PvalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_PvalTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_PvalIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_PvalSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_Tran: TQuery
    OnCalcFields = QL_TranCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select estacion, fecha, turnoliq as turno,total as ImporteTarjet' +
        'a, cliente as noclientetarjeta , Combustible, ImporteCmb'
      '    from DGASTRAN'
      'where estacion=:pestacion and fecha=:pfecha '
      '    and turnoliq=:pturno ')
    Left = 73
    Top = 37
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
    object QL_TranESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_TranFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_TranTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_TranNOCLIENTETARJETA: TIntegerField
      FieldName = 'NOCLIENTETARJETA'
    end
    object QL_TranNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_TranClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_TranCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_TranImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_TranCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_TranFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_TranIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_TranIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_TranSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_TranSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_TranImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_TranImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_TranProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_TranCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_TranIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_TranCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_TranNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_TranImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_TranLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_TranIMPORTETARJETA: TFloatField
      FieldName = 'IMPORTETARJETA'
    end
    object QL_TranImporteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object QL_TranCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object QL_TranImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_TranCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_TranProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_TranCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object QL_TranImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_TranGrupoCliente: TIntegerField
      FieldKind = fkLookup
      FieldName = 'GrupoCliente'
      LookupDataSet = DMGEN_VTAS.TV_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CLASIFICA'
      KeyFields = 'NOCLIENTETARJETA'
      Lookup = True
    end
    object QL_TranCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CUENTAVALES'
      KeyFields = 'NOCLIENTECUPON'
      Size = 16
      Calculated = True
    end
    object QL_TranImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_TranSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_TranIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object QL_TranCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_TranCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_TranIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_TranSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_TranIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_TranSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_TranCuentaClienteAux: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Size = 16
      Calculated = True
    end
    object QL_TranIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_TranSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_TranIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_TranSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_TranSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Calculated = True
    end
    object QL_TranIMPORTECMB: TFloatField
      FieldName = 'IMPORTECMB'
    end
    object QL_TranIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_TranSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object QL_TranIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_TranSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_TranSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object QL_TranFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_TranFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_TranImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_TranSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_TranClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_TranDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_TranImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_TranPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_TranIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_TranIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_TranTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object QL_TranFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object QL_TranNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object QL_TranCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_TranTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_TranIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_TranCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_TranCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_TranTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_TranCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_TranDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_TranTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_TranIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_TranSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_Cupo: TQuery
    OnCalcFields = QL_CupoCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select Serie as SerieCFeria, Folio as FolioCFeria, FechaVenta as' +
        ' Fecha, FechaRecup as FechaRecupCFeria, Importe as ImporteCFeria' +
        ', turno_kiosco as turno, nocliente as noclienteCupon, Estacion'
      '    from DGASCUPO'
      'where estacion=:pestacion and  FECHA_KIOSCO=:pfecha'
      '  and Turno_Kiosco=:Pturno'
      '  and Estatus<>'#39'C'#39
      '  and Tipo='#39'F'#39)
    Left = 189
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
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
        Name = 'Pturno'
        ParamType = ptUnknown
      end>
    object QL_CupoCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_CupoImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object QL_CupoCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_CupoESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_CupoTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_CupoFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_CupoImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_CupoNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_CupoCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_CupoProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_CupoImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_CupoImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_CupoSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_CupoSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_CupoIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_CupoIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_CupoFechaAlfa: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Calculated = True
    end
    object QL_CupoCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_CupoImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_CupoCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_CupoCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_CupoIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_CupoClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_CupoNoCLienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoCLienteVale'
      Calculated = True
    end
    object QL_CupoNOCLIENTECUPON: TIntegerField
      FieldName = 'NOCLIENTECUPON'
    end
    object QL_CupoImporteTarjeta: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_CupoTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_CupoImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_CupoImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_CupoImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_CupoCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_CupoProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_CupoCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object QL_CupoLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_CupoGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object QL_CupoCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object QL_CupoSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_CupoIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object QL_CupoCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_CupoCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_CupoIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_CupoSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_CupoIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_CupoSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_CupoCuentaClienteAux: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Size = 16
      Calculated = True
    end
    object QL_CupoIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_CupoSubTotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubTotValeAntIEPS'
      Calculated = True
    end
    object QL_CupoIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_CupoSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_CupoSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Size = 2
      Calculated = True
    end
    object QL_CupoImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object QL_CupoIEPSTaj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_CupoSubTotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubTotTarjAntIEPS'
      Calculated = True
    end
    object QL_CupoIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_CupoSubTotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubTotalTarj'
      Calculated = True
    end
    object QL_CupoSERIECFERIA: TIntegerField
      FieldName = 'SERIECFERIA'
    end
    object QL_CupoFOLIOCFERIA: TIntegerField
      FieldName = 'FOLIOCFERIA'
    end
    object QL_CupoFECHARECUPCFERIA: TDateTimeField
      FieldName = 'FECHARECUPCFERIA'
    end
    object QL_CupoIMPORTECFERIA: TFloatField
      FieldName = 'IMPORTECFERIA'
    end
    object QL_CupoSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_CupoClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_CupoDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_CupoImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_CupoPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_CupoIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_CupoIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_CupoTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object QL_CupoFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object QL_CupoNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object QL_CupoTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_CupoIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_CupoCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_CupoCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_CupoCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_CupoDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_CupoTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_CupoIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_CupoSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object TM_Tpag: TRxMemoryData
    FieldDefs = <>
    Left = 106
    Top = 92
    object TM_TpagCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Calculated = True
    end
    object TM_TpagNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object TM_TpagImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object TM_TpagEstacion: TIntegerField
      FieldName = 'Estacion'
    end
    object TM_TpagFecha: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Fecha'
      Calculated = True
    end
    object TM_TpagTurno: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Turno'
      Calculated = True
    end
    object TM_TpagClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object TM_TpagCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object TM_TpagProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object TM_TpagImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object TM_TpagImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object TM_TpagSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object TM_TpagSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object TM_TpagIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object TM_TpagIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object TM_TpagFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object TM_TpagCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object TM_TpagCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object TM_TpagCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object TM_TpagImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object TM_TpagCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object TM_TpagNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object TM_TpagIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object TM_TpagImportePrev: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePrev'
      Calculated = True
    end
    object TM_TpagImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object TM_TpagFolio: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio'
      Calculated = True
    end
    object TM_TpagDespachador: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Despachador'
      Calculated = True
    end
    object TM_TpagNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object TM_TpagCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object TM_TpagCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object TM_TpagImporteTarjeta: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object TM_TpagTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object TM_TpagImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object TM_TpagImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object TM_TpagCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object TM_TpagProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object TM_TpagCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object TM_TpagGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object TM_TpagImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object TM_TpagLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object TM_TpagSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object TM_TpagIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object TM_TpagCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object TM_TpagCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object TM_TpagIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object TM_TpagSubTotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubTotCupAntIEPS'
      Calculated = True
    end
    object TM_TpagIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object TM_TpagSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object TM_TpagCuentaClienteAux: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Size = 16
      Calculated = True
    end
    object TM_TpagIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object TM_TpagSubTotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubTotValeAntIEPS'
      Calculated = True
    end
    object TM_TpagIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object TM_TpagSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object TM_TpagSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Calculated = True
    end
    object TM_TpagImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object TM_TpagIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object TM_TpagSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object TM_TpagIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object TM_TpagSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object TM_TpagSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object TM_TpagFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object TM_TpagFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object TM_TpagImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object TM_TpagSubTotalTpag: TFloatField
      FieldName = 'SubTotalTpag'
    end
    object TM_TpagClave: TIntegerField
      FieldName = 'Clave'
    end
    object TM_TpagDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TM_TpagImporte: TFloatField
      FieldName = 'Importe'
    end
    object TM_TpagPorcentaje: TFloatField
      FieldName = 'Porcentaje'
    end
    object TM_TpagIvaTpag: TFloatField
      FieldName = 'IvaTpag'
    end
    object TM_TpagIEPSTpag: TFloatField
      FieldName = 'IEPSTpag'
    end
    object TM_TpagNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object TM_TpagFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object TM_TpagTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object TM_TpagTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object TM_TpagIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object TM_TpagCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object TM_TpagCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object TM_TpagDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object TM_TpagTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object TM_TpagIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object TM_TpagSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_FDep: TQuery
    OnCalcFields = QL_FDepCalcFields
    DatabaseName = 'DBGASOL2'
    SQL.Strings = (
      'select estacion,fecha,turno,noficha,folio_ficha,total_ficha'
      'from dgasturcf'
      'where estacion=:pestacion and fecha=:pfecha '
      '    and turno=:pturno')
    Left = 55
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pestacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pfecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pturno'
        ParamType = ptUnknown
      end>
    object QL_FDepCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_FDepNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_FDepImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object QL_FDepESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_FDepFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_FDepTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_FDepNOFICHA: TIntegerField
      FieldName = 'NOFICHA'
    end
    object QL_FDepFOLIO_FICHA: TIntegerField
      FieldName = 'FOLIO_FICHA'
    end
    object QL_FDepTOTAL_FICHA: TFloatField
      FieldName = 'TOTAL_FICHA'
    end
    object QL_FDepClavePago: TStringField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Size = 2
      Calculated = True
    end
    object QL_FDepCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_FDepProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_FDepImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_FDepImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_FDepSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_FDepSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_FDepIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_FDepIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_FDepFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_FDepCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_FDepCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_FDepCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_FDepImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_FDepCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_FDepNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_FDepIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_FDepImportePrev: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePrev'
      Calculated = True
    end
    object QL_FDepImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_FDepFolio: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio'
      Calculated = True
    end
    object QL_FDepDespachador: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Despachador'
      Calculated = True
    end
    object QL_FDepNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_FDepCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object QL_FDepCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      LookupDataSet = DMGAS.T_Desp
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'CTACNT'
      KeyFields = 'Despachador'
      Size = 16
      Calculated = True
    end
    object QL_FDepImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_FDepTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_FDepImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_FDepImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_FDepCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_FDepProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_FDepCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object QL_FDepGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object QL_FDepImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_FDepLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_FDepSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_FDepIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object QL_FDepCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_FDepCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_FDepIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_FDepSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_FDepIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_FDepSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_FDepCuentaClienteAux: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Calculated = True
    end
    object QL_FDepIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_FDepSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_FDepIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_FDepSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_FDepSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Calculated = True
    end
    object QL_FDepImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object QL_FDepIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_FDepSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object QL_FDepIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_FDepSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_FDepSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object QL_FDepFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_FDepFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_FDepImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_FDepSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_FDepClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_FDepDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_FDepImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_FDepPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_FDepIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_FDepIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_FDepTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_FDepIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_FDepCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_FDepCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_FDepDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_FDepTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_FDepIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_FDepSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_Abon: TQuery
    OnCalcFields = QL_AbonCalcFields
    DatabaseName = 'DBVentas1'
    SQL.Strings = (
      
        'select a.IMPORTEMN, r.cuentacnt, r.noclie, a.suclcar,a.tipocar a' +
        's SerieCargo, a.foliocar as FolioCargo,'
      
        'a.Indicecar as IndiceCargo, cl.cuentacnt as CuentaCliente, ca.su' +
        'btotal as SubtotalCargo, ca2.iva as IvaCargo, ca2.reteniva as Re' +
        'tIvaCargo'
      'from DCXCABON A join  DCXCRCAJ R'
      'on r.sucursal=a.sucursal'
      '  and r.serie=a.tipomov'
      '  and r.folio=a.folio'
      '  join DGENCLIE CL on CL.noclie=A.noclie'
      
        '  join DCXCCARG CA on CA.sucursal=A.suclcar and CA.tipomov=A.tip' +
        'ocar and CA.folio=A.foliocar and CA.indice=a.indicecar'
      
        '  join DCXCCARG CA2 on CA2.sucursal=A.suclcar and CA2.tipomov=A.' +
        'tipocar and CA2.folio=A.foliocar'
      '  where r.fecha=:pfecha'
      '  and r.sucursal=:psucursal'
      '  and r.caja in (select caja from DGENCAJA'
      '                 where Tipo="Cobranza")'
      '  and r.estatus='#39'A'#39
      '  and r.anticipo='#39'No'#39
      '  and a.Complemento='#39'No'#39)
    Left = 249
    Top = 28
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pfecha'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'psucursal'
        ParamType = ptUnknown
      end>
    object QL_AbonCUENTACNT: TStringField
      FieldName = 'CUENTACNT'
      Size = 16
    end
    object QL_AbonNOCLIE: TIntegerField
      FieldName = 'NOCLIE'
    end
    object QL_AbonCUENTACLIENTE: TStringField
      FieldName = 'CUENTACLIENTE'
      Size = 16
    end
    object QL_AbonSUBTOTALCARGO: TFloatField
      FieldName = 'SUBTOTALCARGO'
    end
    object QL_AbonIVACARGO: TFloatField
      FieldName = 'IVACARGO'
    end
    object QL_AbonIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_AbonTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_AbonSubTotalMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubTotalMn'
      Calculated = True
    end
    object QL_AbonIMPORTEMN: TFloatField
      FieldName = 'IMPORTEMN'
    end
    object QL_AbonRETIVACARGO: TFloatField
      FieldName = 'RETIVACARGO'
    end
    object QL_AbonSUCLCAR: TIntegerField
      FieldName = 'SUCLCAR'
    end
    object QL_AbonSERIECARGO: TStringField
      FieldName = 'SERIECARGO'
      Size = 2
    end
    object QL_AbonFOLIOCARGO: TIntegerField
      FieldName = 'FOLIOCARGO'
    end
    object QL_AbonINDICECARGO: TIntegerField
      FieldName = 'INDICECARGO'
    end
    object QL_AbonEstacion: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Estacion'
      Calculated = True
    end
    object QL_AbonCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_AbonProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_AbonFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Calculated = True
    end
    object QL_AbonFecha: TStringField
      FieldKind = fkCalculated
      FieldName = 'Fecha'
      Calculated = True
    end
    object QL_AbonCantidad: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_AbonTurno: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Turno'
      Calculated = True
    end
    object QL_AbonImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_AbonSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_AbonIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_AbonImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_AbonSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_AbonIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_AbonCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_AbonCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_AbonIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_AbonClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_AbonImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_AbonNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_AbonImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_AbonCuentaCntCupones: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Calculated = True
    end
    object QL_AbonCuentaDespachador: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Calculated = True
    end
    object QL_AbonNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_AbonCuentaCntVales: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Calculated = True
    end
    object QL_AbonImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object QL_AbonCombustibleVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_AbonProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_AbonGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object QL_AbonLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_AbonNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_AbonImporteTarjeta: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_AbonCuentaCntTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Calculated = True
    end
    object QL_AbonTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Calculated = True
    end
    object QL_AbonImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_AbonImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_AbonImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_AbonSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_AbonIEPSComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSComb'
      Calculated = True
    end
    object QL_AbonCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_AbonCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_AbonIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_AbonSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_AbonIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_AbonSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_AbonCuentaClienteAux: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Calculated = True
    end
    object QL_AbonIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_AbonSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_AbonIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_AbonIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_AbonSubtotTarjANTIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjANTIEPS'
      Calculated = True
    end
    object QL_AbonIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_AbonSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_AbonSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Calculated = True
    end
    object QL_AbonSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 0
      Calculated = True
    end
    object QL_AbonFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_AbonFechaRecupCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_AbonImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_AbonIEPSTpag: TDateField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_AbonSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_AbonClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_AbonIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_AbonSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_AbonDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Descuento'
      Calculated = True
    end
    object QL_AbonTotalConDescto: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalConDescto'
      Calculated = True
    end
    object QL_AbonIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_AbonSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
  object QL_Desc: TQuery
    OnCalcFields = QL_DescCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select estacion,combustible,fecha,turno,sum(descuento) as descue' +
        'nto,'
      '          sum(total) as totalcondescto from DGASDESCD'
      'where estacion=:pestacion and fecha=:pfecha '
      '   and turno=:pturno'
      'group by estacion,combustible,fecha,turno')
    Left = 320
    Top = 65534
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
    object QL_DescESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_DescCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object QL_DescFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DescTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DescProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_DescSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_DescIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_DescFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_DescCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_DescImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_DescSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_DescIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_DescCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_DescIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_DescClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_DescImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_DescImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_DescCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_DescNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_DescDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object QL_DescTOTALCONDESCTO: TFloatField
      FieldName = 'TOTALCONDESCTO'
    end
    object QL_DescCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_DescImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_DescCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_DescNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_DescCuentaCntVales: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntVales'
      Size = 16
      Calculated = True
    end
    object QL_DescImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
      Calculated = True
    end
    object QL_DescLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_DescNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_DescImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_DescTipoTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoTarjeta'
      Size = 2
      Calculated = True
    end
    object QL_DescImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_DescImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
      Calculated = True
    end
    object QL_DescCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
      Calculated = True
    end
    object QL_DescCombustibleVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleVale'
      Calculated = True
    end
    object QL_DescProductoVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ProductoVale'
      Calculated = True
    end
    object QL_DescCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
      Calculated = True
    end
    object QL_DescGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object QL_DescImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
    end
    object QL_DescSubtotCombAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCombAntIEPS'
      Calculated = True
    end
    object QL_DescIEPSCOMB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCOMB'
      Calculated = True
    end
    object QL_DescCombustibleCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CombustibleCupon'
      Calculated = True
    end
    object QL_DescCantidadCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadCupon'
      Calculated = True
    end
    object QL_DescIEPSCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSCupon'
      Calculated = True
    end
    object QL_DescSubtotCupAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotCupAntIEPS'
      Calculated = True
    end
    object QL_DescIvaCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCupon'
      Calculated = True
    end
    object QL_DescSubtotalCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalCupon'
      Calculated = True
    end
    object QL_DescCuentaClienteAux: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaClienteAux'
      Calculated = True
    end
    object QL_DescIEPSVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSVale'
      Calculated = True
    end
    object QL_DescSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_DescIvaVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaVale'
      Calculated = True
    end
    object QL_DescSubtotalVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalVale'
      Calculated = True
    end
    object QL_DescSerieCupon: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCupon'
      Size = 0
      Calculated = True
    end
    object QL_DescImporteCmb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCmb'
      Calculated = True
    end
    object QL_DescIEPSTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTarj'
      Calculated = True
    end
    object QL_DescSubtotTarjAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotTarjAntIEPS'
      Calculated = True
    end
    object QL_DescIvaTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTarj'
      Calculated = True
    end
    object QL_DescSubtotalTarj: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTarj'
      Calculated = True
    end
    object QL_DescSerieCFeria: TStringField
      FieldKind = fkCalculated
      FieldName = 'SerieCFeria'
      Size = 2
      Calculated = True
    end
    object QL_DescFolioCFeria: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FolioCFeria'
      Calculated = True
    end
    object QL_DescFechaRecupCFeria: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'FechaRecupCFeria'
      Calculated = True
    end
    object QL_DescImporteCFeria: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCFeria'
      Calculated = True
    end
    object QL_DescSubtotalTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalTpag'
      Calculated = True
    end
    object QL_DescClave: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Clave'
      Calculated = True
    end
    object QL_DescDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Calculated = True
    end
    object QL_DescImporte: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe'
      Calculated = True
    end
    object QL_DescPorcentaje: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Porcentaje'
      Calculated = True
    end
    object QL_DescIvaTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaTpag'
      Calculated = True
    end
    object QL_DescIEPSTpag: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSTpag'
      Calculated = True
    end
    object QL_DescNoFicha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoFicha'
      Calculated = True
    end
    object QL_DescFolio_Ficha: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Folio_Ficha'
      Calculated = True
    end
    object QL_DescTotal_Ficha: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Ficha'
      Calculated = True
    end
    object QL_DescTotalAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalAbonoMn'
      Calculated = True
    end
    object QL_DescIvaAbonoMn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaAbonoMn'
      Calculated = True
    end
    object QL_DescCuentaCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCliente'
      Calculated = True
    end
    object QL_DescCuentaCnt: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CuentaCnt'
      Calculated = True
    end
    object QL_DescIvaDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaDescuento'
      Calculated = True
    end
    object QL_DescSubtotalDescuento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalDescuento'
      Calculated = True
    end
  end
end
