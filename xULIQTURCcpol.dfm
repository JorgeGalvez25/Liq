object FLIQTURCcpol: TFLIQTURCcpol
  Left = 343
  Top = 312
  BorderStyle = bsDialog
  Caption = 'C'#225'lculo de P'#243'liza de Liquidaciones'
  ClientHeight = 133
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
    Left = 153
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Calcular'
    Default = True
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 258
    Top = 86
    Width = 75
    Height = 25
    Caption = '&Salir'
    TabOrder = 4
    Kind = bkClose
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
    Width = 41
    Height = 17
    Alignment = taRightJustify
    Caption = 'Avance'
    TabOrder = 1
    Visible = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 40
    Top = 7
    Width = 273
    Height = 21
    KeyField = 'CLAVE'
    ListField = 'TipoDescripcion'
    ListSource = DMCFG.DSQ_Cpold
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
      
        'select estacion,folio,combustible,fecha,turno,sum(cantidad) as C' +
        'antidadprev,'
      '          sum(importe) as importeprev from DGASDLIQC'
      'where estacion=:pestacion and fecha=:pfecha '
      '   and turno=:pturno'
      'group by estacion,folio,combustible,fecha,turno')
    Left = 8
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
    object QL_DliqcProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_DliqcFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqcFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_DliqcTURNO: TIntegerField
      FieldName = 'TURNO'
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
    object QL_DliqcCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
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
    object QL_DliqcNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
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
    object QL_DliqcGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
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
    object QL_DliqcCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
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
    object QL_DliqcCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
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
    object QL_DliqcDespachador: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Despachador'
      LookupDataSet = DMLIQ.T_Liqg
      LookupKeyFields = 'ESTACION;FOLIO'
      LookupResultField = 'DESPACHADOR'
      KeyFields = 'ESTACION;FOLIO'
      Lookup = True
    end
    object QL_DliqcCANTIDADPREV: TFloatField
      FieldName = 'CANTIDADPREV'
    end
    object QL_DliqcIMPORTEPREV: TFloatField
      FieldName = 'IMPORTEPREV'
    end
    object QL_DliqcIEPSValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSValeComb'
      Calculated = True
    end
    object QL_DliqcSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_DliqcIvaValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaValeComb'
      Calculated = True
    end
    object QL_DliqcSubtotalValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalValeComb'
      Calculated = True
    end
    object QL_DliqcFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
  end
  object QL_Dliqa: TQuery
    OnCalcFields = QL_DliqaCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select estacion,folio,producto,fecha,turno,sum(venta) as Cantida' +
        'd,'
      '          sum(importe) as importeprod from DGASDLIQA'
      'where estacion=:pestacion and fecha=:pfecha and Venta>0'
      'and turno=:pturno'
      'group by estacion,folio,producto,fecha,turno')
    Left = 8
    Top = 32
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
    object QL_DliqaCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_DliqaPRODUCTO: TIntegerField
      FieldName = 'PRODUCTO'
    end
    object QL_DliqaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqaFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_DliqaTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DliqaCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object QL_DliqaImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
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
    object QL_DliqaCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
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
    object QL_DliqaNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
      Calculated = True
    end
    object QL_DliqaImporteCupon: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteCupon'
      Calculated = True
    end
    object QL_DliqaCuentaCntCupones: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntCupones'
      Size = 16
      Calculated = True
    end
    object QL_DliqaCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
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
    object QL_DliqaImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
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
    object QL_DliqaGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
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
    object QL_DliqaNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_DliqaImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_DliqaCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
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
    object QL_DliqaImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
      Calculated = True
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
    object QL_DliqaCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
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
    object QL_DliqaDespachador: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Despachador'
      LookupDataSet = DMLIQ.T_Liqg
      LookupKeyFields = 'ESTACION;FOLIO'
      LookupResultField = 'DESPACHADOR'
      KeyFields = 'ESTACION;FOLIO'
      Lookup = True
    end
    object QL_DliqaIEPSValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSValeComb'
      Calculated = True
    end
    object QL_DliqaSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_DliqaIvaValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaValeComb'
      Calculated = True
    end
    object QL_DliqaSubtotalValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalValeComb'
      Calculated = True
    end
    object QL_DliqaFOLIO: TIntegerField
      FieldName = 'FOLIO'
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
    Left = 8
    Top = 64
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
    object QL_DliqpESTACION: TIntegerField
      FieldName = 'ESTACION'
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
    object QL_DliqpFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_DliqpFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_DliqpTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_DliqpCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_DliqpImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_DliqpSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_DliqpIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_DliqpImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_DliqpSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_DliqpIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
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
    object QL_DliqpIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_DliqpCLAVEPAGO: TStringField
      FieldName = 'CLAVEPAGO'
      Size = 2
    end
    object QL_DliqpImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_DliqpNoClienteCupon: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteCupon'
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
    object QL_DliqpCuentaDespachador: TStringField
      FieldKind = fkLookup
      FieldName = 'CuentaDespachador'
      LookupDataSet = DMGAS.T_Desp
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'CTACNT'
      KeyFields = 'Despachador'
      Size = 16
      Lookup = True
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
    object QL_DliqpImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
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
    object QL_DliqpGrupoCliente: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'GrupoCliente'
      Calculated = True
    end
    object QL_DliqpLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_DliqpNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_DliqpImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_DliqpCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
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
    object QL_DliqpImporteTarjetaME: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaME'
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
    object QL_DliqpCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
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
    object QL_DliqpDespachador: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Despachador'
      LookupDataSet = DMLIQ.T_Liqg
      LookupKeyFields = 'ESTACION;FOLIO'
      LookupResultField = 'DESPACHADOR'
      KeyFields = 'ESTACION;FOLIO'
      Lookup = True
    end
    object QL_DliqpIMPORTEPREV: TFloatField
      FieldName = 'IMPORTEPREV'
    end
    object QL_DliqpFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QL_DliqpIEPSValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSValeComb'
      Calculated = True
    end
    object QL_DliqpSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_DliqpIvaValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaValeComb'
      Calculated = True
    end
    object QL_DliqpSubtotalValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalValeComb'
      Calculated = True
    end
  end
  object QL_Rcup: TQuery
    OnCalcFields = QL_RcupCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select r.estacion, r.fecha, r.turno, r.importe as importecupon,'
      '(select tipocomb from dgasfacc f'
      'where f.estacion=c.estacion'
      '  and f.tipofac=c.seriefac'
      '  and f.folio=c.foliofac ) as CombustibleCupon,'
      'c.nocliente as NoClienteCupon  from DGASRCUP R, DGASCUPO C'
      'where r.estacion=:pestacion and r.fecha=:pfecha '
      '    and r.turno=:pturno'
      '    and r.serie=c.serie and r.cupon=c.folio')
    Left = 136
    Top = 40
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
    object QL_RcupESTACION: TIntegerField
      FieldName = 'ESTACION'
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
    object QL_RcupFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_RcupFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_RcupTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_RcupCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_RcupImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_RcupSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_RcupIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_RcupImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_RcupSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_RcupIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
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
    object QL_RcupImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
      Calculated = True
    end
    object QL_RcupNOCLIENTECUPON: TIntegerField
      FieldName = 'NOCLIENTECUPON'
    end
    object QL_RcupIMPORTECUPON: TFloatField
      FieldName = 'IMPORTECUPON'
    end
    object QL_RcupCuentaCntCupones: TStringField
      FieldKind = fkLookup
      FieldName = 'CuentaCntCupones'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CUENTACUPONES'
      KeyFields = 'NOCLIENTECUPON'
      Size = 16
      Lookup = True
    end
    object QL_RcupCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_RcupNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_RcupCuentaCntVales: TStringField
      FieldKind = fkLookup
      FieldName = 'CuentaCntVales'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CUENTAVALES'
      KeyFields = 'NOCLIENTECUPON'
      Size = 16
      Lookup = True
    end
    object QL_RcupImporteVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
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
    object QL_RcupGrupoCliente: TIntegerField
      FieldKind = fkLookup
      FieldName = 'GrupoCliente'
      LookupDataSet = DMGEN_VTAS.TV_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CLASIFICA'
      KeyFields = 'NOCLIENTECUPON'
      Lookup = True
    end
    object QL_RcupLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_RcupNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_RcupImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_RcupCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
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
    object QL_RcupCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
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
    object QL_RcupDespachador: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Despachador'
      Calculated = True
    end
    object QL_RcupIEPSValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSValeComb'
      Calculated = True
    end
    object QL_RcupSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_RcupIvaValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaValeComb'
      Calculated = True
    end
    object QL_RcupSubtotalValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalValeComb'
      Calculated = True
    end
  end
  object QL_Pval: TQuery
    OnCalcFields = QL_PvalCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select estacion, caja, fecha, turno, importe as importevale, cli' +
        'ente as noclientevale, '
      
        'Producto as CombustibleVale, subclave as ProductoVale, Cantidad ' +
        'as CantidadVale from DGASDVAL'
      'where estacion=:pestacion and fecha=:pfecha '
      '    and turno=:pturno ')
    Left = 312
    Top = 48
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
    object QL_PvalESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_PvalCombustible: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Combustible'
      Calculated = True
    end
    object QL_PvalProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_PvalFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_PvalFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_PvalTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_PvalCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_PvalImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_PvalSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_PvalIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_PvalImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_PvalSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_PvalIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_PvalCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_PvalCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_PvalIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_PvalClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_PvalImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
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
    object QL_PvalCuentaCntCupones: TStringField
      FieldKind = fkLookup
      FieldName = 'CuentaCntCupones'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CUENTACUPONES'
      KeyFields = 'NOCLIENTEVALE'
      Size = 16
      Lookup = True
    end
    object QL_PvalCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_PvalNOCLIENTEVALE: TIntegerField
      FieldName = 'NOCLIENTEVALE'
    end
    object QL_PvalCuentaCntVales: TStringField
      FieldKind = fkLookup
      FieldName = 'CuentaCntVales'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CUENTAVALES'
      KeyFields = 'NOCLIENTEVALE'
      Size = 16
      Lookup = True
    end
    object QL_PvalIMPORTEVALE: TFloatField
      FieldName = 'IMPORTEVALE'
    end
    object QL_PvalCOMBUSTIBLEVALE: TIntegerField
      FieldName = 'COMBUSTIBLEVALE'
    end
    object QL_PvalPRODUCTOVALE: TIntegerField
      FieldName = 'PRODUCTOVALE'
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
    object QL_PvalLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_PvalNoClienteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteTarjeta'
      Calculated = True
    end
    object QL_PvalImporteTarjeta: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjeta'
      Calculated = True
    end
    object QL_PvalCuentaCntTarjeta: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaCntTarjeta'
      Size = 16
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
    object QL_PvalCANTIDADVALE: TFloatField
      FieldName = 'CANTIDADVALE'
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
    object QL_PvalDespachador: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Despachador'
      Calculated = True
    end
    object QL_PvalCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object QL_PvalIEPSValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSValeComb'
      Calculated = True
    end
    object QL_PvalSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_PvalIvaValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaValeComb'
      Calculated = True
    end
    object QL_PvalSubtotalValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalValeComb'
      Calculated = True
    end
  end
  object QL_Tran: TQuery
    OnCalcFields = QL_TranCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select estacion, fecha, turnoliq as turno,total as ImporteTarjet' +
        'a, cliente as noclientetarjeta , Combustible, Despachador'
      '    from DGASTRAN'
      'where estacion=:pestacion and fecha=:pfecha '
      '    and turnoliq=:pturno ')
    Left = 72
    Top = 40
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
    object QL_TranCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object QL_TranProducto: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Producto'
      Calculated = True
    end
    object QL_TranFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_TranFechaAlfa: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaAlfa'
      Size = 30
      Calculated = True
    end
    object QL_TranTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object QL_TranCantidad: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Cantidad'
      Calculated = True
    end
    object QL_TranImporteComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteComb'
      Calculated = True
    end
    object QL_TranSubtotalComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalComb'
      Calculated = True
    end
    object QL_TranIvaComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaComb'
      Calculated = True
    end
    object QL_TranImporteProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteProd'
      Calculated = True
    end
    object QL_TranSubtotalProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalProd'
      Calculated = True
    end
    object QL_TranIvaProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaProd'
      Calculated = True
    end
    object QL_TranCostoComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoComb'
      Calculated = True
    end
    object QL_TranCostoProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CostoProd'
      Calculated = True
    end
    object QL_TranIvaCombProd: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaCombProd'
      Calculated = True
    end
    object QL_TranClavePago: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ClavePago'
      Calculated = True
    end
    object QL_TranImportePago: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImportePago'
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
    object QL_TranCuentaCntCupones: TStringField
      FieldKind = fkLookup
      FieldName = 'CuentaCntCupones'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CUENTACUPONES'
      KeyFields = 'NOCLIENTECUPON'
      Size = 16
      Lookup = True
    end
    object QL_TranCuentaDespachador: TStringField
      FieldKind = fkCalculated
      FieldName = 'CuentaDespachador'
      Size = 16
      Calculated = True
    end
    object QL_TranNoClienteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoClienteVale'
      Calculated = True
    end
    object QL_TranCuentaCntVales: TStringField
      FieldKind = fkLookup
      FieldName = 'CuentaCntVales'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CUENTAVALES'
      KeyFields = 'NOCLIENTECUPON'
      Size = 16
      Lookup = True
    end
    object QL_TranImporteVale: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ImporteVale'
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
    object QL_TranGrupoCliente: TIntegerField
      FieldKind = fkLookup
      FieldName = 'GrupoCliente'
      LookupDataSet = DMGEN_VTAS.TV_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CLASIFICA'
      KeyFields = 'NOCLIENTETARJETA'
      Lookup = True
    end
    object QL_TranLineaAceites: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'LineaAceites'
      Calculated = True
    end
    object QL_TranNOCLIENTETARJETA: TIntegerField
      FieldName = 'NOCLIENTETARJETA'
    end
    object QL_TranIMPORTETARJETA: TFloatField
      FieldName = 'IMPORTETARJETA'
    end
    object QL_TranCuentaCntTarjeta: TStringField
      FieldKind = fkLookup
      FieldName = 'CuentaCntTarjeta'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'CUENTAVALES'
      KeyFields = 'NOCLIENTETARJETA'
      Size = 16
      Lookup = True
    end
    object QL_TranTipoTarjeta: TStringField
      FieldKind = fkLookup
      FieldName = 'TipoTarjeta'
      LookupDataSet = DMGAS.T_Sald
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'TIPOTARJETA'
      KeyFields = 'NOCLIENTETARJETA'
      Size = 2
      Lookup = True
    end
    object QL_TranImporteTarjetaCR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaCR'
      Calculated = True
    end
    object QL_TranImporteTarjetaPP: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteTarjetaPP'
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
    object QL_TranCantidadVale: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CantidadVale'
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
    object QL_TranDESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
    end
    object QL_TranIEPSValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IEPSValeComb'
      Calculated = True
    end
    object QL_TranSubtotValeAntIEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotValeAntIEPS'
      Calculated = True
    end
    object QL_TranIvaValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'IvaValeComb'
      Calculated = True
    end
    object QL_TranSubtotalValeComb: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SubtotalValeComb'
      Calculated = True
    end
  end
end
