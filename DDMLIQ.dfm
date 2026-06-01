object DMLIQ: TDMLIQ
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 401
  Top = 180
  Height = 409
  Width = 616
  object T_Tran: TTable
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FECHA;TURNOLIQ'
    TableName = 'DGASTRAN'
    Left = 11
    Top = 16
    object T_TranTIPOVENTA: TStringField
      FieldName = 'TIPOVENTA'
      Size = 2
    end
    object T_TranESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_TranFOLIO: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'FOLIO'
      Required = True
      DisplayFormat = '000000'
      EditFormat = '000000'
      AttributeSet = 'Folio6'
    end
    object T_TranISLA: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'ISLA'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
      AttributeSet = 'Folio2'
    end
    object T_TranBOMBA: TIntegerField
      FieldName = 'BOMBA'
    end
    object T_TranFECHA: TDateTimeField
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
      AttributeSet = 'Fecha'
    end
    object T_TranTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_TranHORA: TDateTimeField
      FieldName = 'HORA'
    end
    object T_TranCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object T_TranVEHICULO: TIntegerField
      FieldName = 'VEHICULO'
    end
    object T_TranCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object T_TranPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object T_TranLITROS: TFloatField
      FieldName = 'LITROS'
    end
    object T_TranIMPORTECMB: TFloatField
      FieldName = 'IMPORTECMB'
    end
    object T_TranIMPORTEOTR: TFloatField
      FieldName = 'IMPORTEOTR'
    end
    object T_TranTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_TranESTATUS: TStringField
      FieldName = 'ESTATUS'
      Size = 1
    end
    object T_TranDESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
    end
    object T_TranINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object T_TranKILOMETRAJE: TIntegerField
      FieldName = 'KILOMETRAJE'
    end
    object T_TranPOSCARGA: TIntegerField
      FieldName = 'POSCARGA'
    end
    object T_TranTASAIVA: TFloatField
      FieldName = 'TASAIVA'
    end
    object T_TranTURNOLIQ: TIntegerField
      FieldName = 'TURNOLIQ'
    end
  end
  object DS_Tran: TDataSource
    DataSet = T_Tran
    Left = 16
    Top = 88
  end
  object T_Liqg: TTable
    AfterInsert = T_LiqgAfterInsert
    OnCalcFields = T_LiqgCalcFields
    DatabaseName = 'DBGASOL2'
    TableName = 'DGASLIQG'
    Left = 73
    Top = 16
    object T_LiqgESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_LiqgFOLIO: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'FOLIO'
      Required = True
      DisplayFormat = '000000'
      EditFormat = '000000'
      AttributeSet = 'Folio6'
    end
    object T_LiqgCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object T_LiqgISLA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ISLA'
      OnChange = T_LiqgISLAChange
      DisplayFormat = '00'
      EditFormat = '00'
      AttributeSet = 'Folio2NR'
    end
    object T_LiqgFECHA: TDateTimeField
      FieldName = 'FECHA'
      OnChange = T_LiqgFECHAChange
    end
    object T_LiqgTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_LiqgDESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
    end
    object T_LiqgTOTGAS: TFloatField
      FieldName = 'TOTGAS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_LiqgTOTALMA: TFloatField
      FieldName = 'TOTALMA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_LiqgTOTGRAL: TFloatField
      FieldName = 'TOTGRAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_LiqgAPLICADO: TStringField
      FieldName = 'APLICADO'
      Size = 2
    end
    object T_LiqgCAMBIA_SALDOINI: TStringField
      FieldName = 'CAMBIA_SALDOINI'
      Size = 2
    end
    object T_LiqgTOTPAGO: TFloatField
      FieldName = 'TOTPAGO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_LiqgFechaPaq: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaPaq'
      Size = 12
      Calculated = True
    end
    object T_LiqgTotalGasAlma: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalGasAlma'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
      Calculated = True
    end
    object T_LiqgCALC: TStringField
      FieldName = 'CALC'
      Size = 2
    end
    object T_LiqgNombreDespachador: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreDespachador'
      LookupDataSet = TL_Desp
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'DESPACHADOR'
      Size = 30
      Lookup = True
    end
    object T_LiqgLiquidacionStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'LiquidacionStr'
      Size = 12
      Calculated = True
    end
    object T_LiqgRECOLECCION_PARCIAL: TFloatField
      FieldName = 'RECOLECCION_PARCIAL'
    end
    object T_LiqgLIQUIDAGLOBAL: TStringField
      FieldName = 'LIQUIDAGLOBAL'
      Size = 2
    end
    object T_LiqgTOTAL_IEPS: TFloatField
      FieldName = 'TOTAL_IEPS'
    end
    object T_LiqgBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Size = 2
    end
    object T_LiqgTOTPAGOALMA: TFloatField
      FieldName = 'TOTPAGOALMA'
    end
    object T_LiqgTOTDESCT: TFloatField
      FieldName = 'TOTDESCT'
    end
  end
  object DS_Liqg: TDataSource
    DataSet = T_Liqg
    Left = 78
    Top = 88
  end
  object T_Dliqc: TTable
    AfterInsert = T_DliqcAfterInsert
    BeforePost = T_DliqcBeforePost
    AfterPost = T_DliqcAfterPost
    OnCalcFields = T_DliqcCalcFields
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FOLIO;BOMBA'
    MasterFields = 'ESTACION;FOLIO'
    MasterSource = DS_Liqg
    TableName = 'DGASDLIQC'
    Left = 135
    Top = 15
    object T_DliqcESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_DliqcFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object T_DliqcBOMBA: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'BOMBA'
      Required = True
      DisplayFormat = '000'
      EditFormat = '000'
      AttributeSet = 'Folio3'
    end
    object T_DliqcISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object T_DliqcCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object T_DliqcFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object T_DliqcTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_DliqcLEC_ANT: TFloatField
      FieldName = 'LEC_ANT'
      ReadOnly = True
      DisplayFormat = '###,###,##0.000'
      EditFormat = '########0.000'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqcLEC_ACT: TFloatField
      FieldName = 'LEC_ACT'
      OnChange = T_DliqcLEC_ACTChange
      DisplayFormat = '###,###,##0.000'
      EditFormat = '########0.000'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqcCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '########0.000'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqcPRECIO_CIVA: TFloatField
      FieldName = 'PRECIO_CIVA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqcIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqcAPLICADO: TStringField
      FieldName = 'APLICADO'
      Size = 2
    end
    object T_DliqcDescCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'DescCombustible'
      LookupDataSet = DMGASQ.QT_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
    object T_DliqcDEVOLUCION: TFloatField
      FieldName = 'DEVOLUCION'
      OnChange = T_DliqcDEVOLUCIONChange
      DisplayFormat = '###,###,##0.000'
      EditFormat = '########0.000'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqcDevolucionCalc: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'DevolucionCalc'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
      Calculated = True
    end
    object T_DliqcPosCarga: TIntegerField
      Alignment = taLeftJustify
      FieldKind = fkCalculated
      FieldName = 'PosCarga'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
      AttributeSet = 'Folio2NR'
      Calculated = True
    end
    object T_DliqcIEPS_POR_LITRO: TFloatField
      FieldName = 'IEPS_POR_LITRO'
      OnGetText = T_DliqcIEPS_POR_LITROGetText
      DisplayFormat = '#,##0.0000'
    end
    object T_DliqcIMPORTE_IEPS: TFloatField
      FieldName = 'IMPORTE_IEPS'
      DisplayFormat = '#,##0.0000'
    end
    object T_DliqcImp_IEPS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Imp_IEPS'
      OnGetText = T_DliqcImp_IEPSGetText
      DisplayFormat = '#,##0.0000'
      Calculated = True
    end
    object T_DliqcIMPORTE_SP: TFloatField
      FieldName = 'IMPORTE_SP'
    end
    object T_DliqcImporte_Final: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Importe_Final'
      Calculated = True
    end
    object T_DliqcCONSIGNACION: TFloatField
      FieldName = 'CONSIGNACION'
      DisplayFormat = '###,###,##0.0000'
      EditFormat = '########0.000'
    end
    object T_DliqcDIFLECTURAS: TFloatField
      FieldName = 'DIFLECTURAS'
      DisplayFormat = '###,###,##0.0000'
      EditFormat = '###,###,##0.0000'
    end
  end
  object DS_Dliqc: TDataSource
    DataSet = T_Dliqc
    Left = 140
    Top = 88
  end
  object T_Dliqa: TTable
    AfterInsert = T_DliqaAfterInsert
    BeforePost = T_DliqaBeforePost
    AfterPost = T_DliqaAfterPost
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FOLIO;PRODUCTO'
    MasterFields = 'ESTACION;FOLIO'
    MasterSource = DS_Liqg
    TableName = 'DGASDLIQA'
    Left = 188
    Top = 16
    object T_DliqaESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_DliqaFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object T_DliqaPRODUCTO: TIntegerField
      Alignment = taLeftJustify
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'PRODUCTO'
      Required = True
      OnValidate = T_DliqaPRODUCTOValidate
      DisplayFormat = '0000'
      EditFormat = '0000'
      AttributeSet = 'Folio4'
    end
    object T_DliqaISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object T_DliqaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object T_DliqaTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_DliqaSALD_INI: TFloatField
      FieldName = 'SALD_INI'
      DisplayFormat = '###,###,##0.00'
      AttributeSet = 'CantEntera'
    end
    object T_DliqaENTRADAS: TFloatField
      FieldName = 'ENTRADAS'
      OnChange = T_DliqaENTRADASChange
      DisplayFormat = '###,###,##0.00'
      AttributeSet = 'CantEntera'
    end
    object T_DliqaDEVOL: TFloatField
      FieldName = 'DEVOL'
      DisplayFormat = '###,###,##0.00'
      AttributeSet = 'CantEntera'
    end
    object T_DliqaVENTA: TFloatField
      FieldName = 'VENTA'
      DisplayFormat = '###,###,##0.00'
      AttributeSet = 'CantEntera'
    end
    object T_DliqaPRECIO_CIVA: TFloatField
      FieldName = 'PRECIO_CIVA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqaIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqaNombreProducto: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreProducto'
      LookupDataSet = DMGAS.T_Prod
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'PRODUCTO'
      Size = 30
      Lookup = True
    end
    object T_DliqaSALD_FIN: TFloatField
      FieldName = 'SALD_FIN'
      OnChange = T_DliqaSALD_FINChange
      OnValidate = T_DliqaSALD_FINValidate
      DisplayFormat = '###,###,##0.00'
      AttributeSet = 'CantEntera'
    end
    object T_DliqaAPLICADO: TStringField
      FieldName = 'APLICADO'
      Size = 2
    end
    object T_DliqaCALCULADO: TStringField
      FieldName = 'CALCULADO'
      Size = 2
    end
  end
  object DS_Dliqa: TDataSource
    DataSet = T_Dliqa
    Left = 202
    Top = 88
  end
  object T_Dliqp: TTable
    AfterInsert = T_DliqpAfterInsert
    BeforePost = T_DliqpBeforePost
    AfterPost = T_DliqpAfterPost
    AfterScroll = T_DliqpAfterScroll
    OnCalcFields = T_DliqpCalcFields
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FOLIO;CLAVE_PAGO_ENTERO'
    MasterFields = 'ESTACION;FOLIO'
    MasterSource = DS_Liqg
    TableName = 'DGASDLIQP'
    Left = 251
    Top = 16
    object T_DliqpESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_DliqpFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object T_DliqpCLAVE_PAGO: TStringField
      FieldName = 'CLAVE_PAGO'
      Size = 2
    end
    object T_DliqpIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_DliqpDescripcionPago: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripcionPago'
      Calculated = True
    end
    object T_DliqpFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object T_DliqpTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_DliqpAPLICADO: TStringField
      FieldName = 'APLICADO'
      Size = 2
    end
    object T_DliqpDesglosa: TStringField
      FieldKind = fkCalculated
      FieldName = 'Desglosa'
      Size = 2
      Calculated = True
    end
    object T_DliqpINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object T_DliqpClasePago: TStringField
      FieldKind = fkCalculated
      FieldName = 'ClasePago'
      Size = 30
      Calculated = True
    end
    object T_DliqpTP_KIOSKO: TIntegerField
      FieldName = 'TP_KIOSKO'
    end
    object T_DliqpCLAVE_PAGO_ENTERO: TIntegerField
      FieldName = 'CLAVE_PAGO_ENTERO'
    end
  end
  object DS_Dliqp: TDataSource
    DataSet = T_Dliqp
    Left = 264
    Top = 88
  end
  object T_Pval: TTable
    BeforeInsert = T_PvalBeforeInsert
    BeforeEdit = T_PvalBeforeEdit
    BeforePost = T_PvalBeforePost
    AfterPost = T_PvalAfterPost
    AfterDelete = T_PvalAfterDelete
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;CAJA;FECHA;TURNO;INDICE'
    MasterFields = 'ESTACION;CAJA;FECHA;TURNO'
    MasterSource = DMGAS.DS_Turc
    TableName = 'DGASPVAL'
    Left = 15
    Top = 160
    object T_PvalESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_PvalCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object T_PvalFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object T_PvalTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_PvalINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object T_PvalCLIENTE: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'CLIENTE'
      Required = True
      OnValidate = T_PvalCLIENTEValidate
      DisplayFormat = '00000'
      EditFormat = '00000'
      AttributeSet = 'Folio5'
    end
    object T_PvalCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
      DisplayFormat = '###,###,##0'
      AttributeSet = 'CantEntera'
    end
    object T_PvalTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_PvalFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Size = 2
    end
    object T_PvalESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
    end
    object T_PvalSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Size = 2
    end
    object T_PvalFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
    end
    object T_PvalINDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
    end
    object T_PvalSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
      Required = True
      DisplayFormat = '000'
      EditFormat = '000'
      AttributeSet = 'Folio3'
    end
    object T_PvalNombreCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCliente'
      LookupDataSet = DMGEN_VTAS.TV_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'CLIENTE'
      Size = 40
      Lookup = True
    end
    object T_PvalFECHAFACTURA: TDateTimeField
      FieldName = 'FECHAFACTURA'
    end
  end
  object DS_Pval: TDataSource
    DataSet = T_Pval
    Left = 16
    Top = 216
  end
  object T_Vale: TTable
    BeforeInsert = T_ValeBeforeInsert
    AfterInsert = T_ValeAfterInsert
    BeforeEdit = T_ValeBeforeEdit
    BeforePost = T_ValeBeforePost
    AfterPost = T_ValeAfterPost
    BeforeDelete = T_ValeBeforeDelete
    AfterDelete = T_ValeAfterDelete
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;CAJA;FECHA;TURNO;INDICE;INDICEVALE'
    MasterFields = 'ESTACION;CAJA;FECHA;TURNO;INDICE'
    MasterSource = DS_Pval
    TableName = 'DGASVALE'
    Left = 72
    Top = 159
    object T_ValeESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_ValeCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object T_ValeFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object T_ValeTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_ValeINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object T_ValeINDICEVALE: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'INDICEVALE'
      DisplayFormat = '00'
      EditFormat = '00'
      AttributeSet = 'Folio2'
    end
    object T_ValeIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_ValeFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Size = 2
    end
    object T_ValeESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
    end
    object T_ValeSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Size = 2
    end
    object T_ValeFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
    end
    object T_ValeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object T_ValeDESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object T_ValeSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
    end
    object T_ValeNombreDesp: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreDesp'
      LookupDataSet = TL_Desp
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'DESPACHADOR'
      Size = 30
      Lookup = True
    end
    object T_ValeFOLIOVOLUMETRICO: TIntegerField
      FieldName = 'FOLIOVOLUMETRICO'
      OnSetText = T_ValeFOLIOVOLUMETRICOSetText
      DisplayFormat = '00000000'
      EditFormat = '00000000'
    end
    object T_ValeISLA: TIntegerField
      FieldName = 'ISLA'
      OnChange = T_ValeISLAChange
      OnValidate = T_ValeISLAValidate
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object T_ValePRECIO: TFloatField
      FieldName = 'PRECIO'
    end
  end
  object DS_Vale: TDataSource
    DataSet = T_Vale
    Left = 76
    Top = 216
  end
  object T_Dval: TTable
    BeforeInsert = T_DvalBeforeInsert
    BeforeEdit = T_DvalBeforeEdit
    BeforePost = T_DvalBeforePost
    AfterPost = T_DvalAfterPost
    BeforeDelete = T_DvalBeforeDelete
    AfterDelete = T_DvalAfterDelete
    OnCalcFields = T_DvalCalcFields
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;CAJA;FECHA;TURNO;INDICE;INDICEVALE'
    MasterFields = 'ESTACION;CAJA;FECHA;TURNO;INDICE;INDICEVALE'
    MasterSource = DS_Vale
    TableName = 'DGASDVAL'
    Left = 135
    Top = 160
    object T_DvalESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_DvalCAJA: TIntegerField
      FieldName = 'CAJA'
    end
    object T_DvalFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object T_DvalTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_DvalINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object T_DvalINDICEVALE: TIntegerField
      FieldName = 'INDICEVALE'
    end
    object T_DvalPRODUCTO: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'PRODUCTO'
      Required = True
      OnChange = T_DvalPRODUCTOChange
      DisplayFormat = '0000'
      EditFormat = '0000'
      AttributeSet = 'Folio4'
    end
    object T_DvalIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      OnChange = T_DvalIMPORTEChange
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_DvalFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Size = 2
    end
    object T_DvalESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
    end
    object T_DvalSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Size = 2
    end
    object T_DvalFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
    end
    object T_DvalSUBCLAVE: TIntegerField
      FieldName = 'SUBCLAVE'
      OnValidate = T_DvalSUBCLAVEValidate
      DisplayFormat = '000'
      EditFormat = '000'
      AttributeSet = 'Folio3NR'
    end
    object T_DvalCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object T_DvalDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descripcion'
      Size = 30
      Calculated = True
    end
    object T_DvalTipo: TStringField
      FieldKind = fkLookup
      FieldName = 'Tipo'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'TIPO'
      KeyFields = 'PRODUCTO'
      Size = 12
      Lookup = True
    end
    object T_DvalCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      OnChange = T_DvalCANTIDADChange
      DisplayFormat = '###,###,##0.000'
      EditFormat = '########0.000'
      AttributeSet = 'ImpMoneda'
    end
    object T_DvalSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
    end
    object T_DvalPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
  end
  object DS_Dval: TDataSource
    DataSet = T_Dval
    Left = 136
    Top = 216
  end
  object QB_Liqg: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASLIQG'
      'Where Estacion=:pestacion and'
      '            Fecha=:pfecha and'
      '           Turno=:pturno')
    Left = 24
    Top = 280
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
    object QB_LiqgESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASLIQG.ESTACION'
    end
    object QB_LiqgFOLIO: TIntegerField
      FieldName = 'FOLIO'
      Origin = 'DBGASOL1.DGASLIQG.FOLIO'
    end
    object QB_LiqgISLA: TIntegerField
      FieldName = 'ISLA'
      Origin = 'DBGASOL1.DGASLIQG.ISLA'
    end
    object QB_LiqgCAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASLIQG.CAJA'
    end
    object QB_LiqgFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASLIQG.FECHA'
    end
    object QB_LiqgTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASLIQG.TURNO'
    end
    object QB_LiqgDESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
      Origin = 'DBGASOL1.DGASLIQG.DESPACHADOR'
    end
    object QB_LiqgTOTGAS: TFloatField
      FieldName = 'TOTGAS'
      Origin = 'DBGASOL1.DGASLIQG.TOTGAS'
    end
    object QB_LiqgTOTALMA: TFloatField
      FieldName = 'TOTALMA'
      Origin = 'DBGASOL1.DGASLIQG.TOTALMA'
    end
    object QB_LiqgTOTGRAL: TFloatField
      FieldName = 'TOTGRAL'
      Origin = 'DBGASOL1.DGASLIQG.TOTGRAL'
    end
    object QB_LiqgAPLICADO: TStringField
      FieldName = 'APLICADO'
      Origin = 'DBGASOL1.DGASLIQG.APLICADO'
      Size = 2
    end
    object QB_LiqgCAMBIA_SALDOINI: TStringField
      FieldName = 'CAMBIA_SALDOINI'
      Origin = 'DBGASOL1.DGASLIQG.CAMBIA_SALDOINI'
      Size = 2
    end
    object QB_LiqgTOTPAGO: TFloatField
      FieldName = 'TOTPAGO'
      Origin = 'DBGASOL1.DGASLIQG.TOTPAGO'
    end
  end
  object T_Lect: TTable
    AfterInsert = T_LectAfterInsert
    BeforePost = T_LectBeforePost
    OnCalcFields = T_LectCalcFields
    DatabaseName = 'DBGASOL2'
    TableName = 'DGASLECT'
    Left = 192
    Top = 160
    object T_LectESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_LectFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object T_LectTURNO: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'TURNO'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
      AttributeSet = 'Folio2'
    end
    object T_LectUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object T_LectDescripTurno: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripTurno'
      Size = 50
      Calculated = True
    end
  end
  object DS_Lect: TDataSource
    DataSet = T_Lect
    Left = 192
    Top = 216
  end
  object T_Dlec: TTable
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FECHA;TURNO;MANGUERA'
    MasterFields = 'ESTACION;FECHA;TURNO'
    MasterSource = DS_Lect
    TableName = 'DGASDLEC'
    Left = 240
    Top = 160
    object T_DlecESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_DlecFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object T_DlecTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object T_DlecMANGUERA: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'MANGUERA'
      Required = True
      OnValidate = T_DlecMANGUERAValidate
      DisplayFormat = '000'
      EditFormat = '000'
      AttributeSet = 'Folio3'
    end
    object T_DlecLECTURAINIC: TFloatField
      FieldName = 'LECTURAINIC'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_DlecDEVOLUCION: TFloatField
      FieldName = 'DEVOLUCION'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object T_DlecPOSCARGA: TIntegerField
      FieldName = 'POSCARGA'
      DisplayFormat = '00'
      EditFormat = '00'
    end
    object T_DlecCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object T_DlecNombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
  end
  object DS_Dlec: TDataSource
    DataSet = T_Dlec
    Left = 248
    Top = 216
  end
  object T_Dtpag: TTable
    AfterInsert = T_DtpagAfterInsert
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FOLIO;CLAVE_PAGO;INDICE'
    MasterFields = 'ESTACION;FOLIO;CLAVE_PAGO'
    MasterSource = DS_Dliqp
    TableName = 'DGASDTPAG'
    Left = 320
    Top = 16
    object T_DtpagESTACION: TIntegerField
      FieldName = 'ESTACION'
      Required = True
    end
    object T_DtpagFOLIO: TIntegerField
      FieldName = 'FOLIO'
      Required = True
    end
    object T_DtpagCLAVE_PAGO: TStringField
      FieldName = 'CLAVE_PAGO'
      Required = True
      Size = 2
    end
    object T_DtpagINDICE: TIntegerField
      FieldName = 'INDICE'
      Required = True
    end
    object T_DtpagCLIENTE: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'CLIENTE'
      Required = True
      OnChange = T_DtpagCLIENTEChange
      DisplayFormat = '00000'
      EditFormat = '00000'
      AttributeSet = 'Folio5'
    end
    object T_DtpagNOMBRE: TStringField
      FieldName = 'NOMBRE'
      LookupResultField = 'NOMBRE'
      Size = 50
    end
    object T_DtpagREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 16
    end
    object T_DtpagIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
  end
  object DS_Dtpag: TDataSource
    DataSet = T_Dtpag
    Left = 320
    Top = 88
  end
  object Memo1: TMemo
    Left = 176
    Top = 0
    Width = 154
    Height = 153
    Align = alRight
    BorderStyle = bsNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object TL_Desp: TTable
    DatabaseName = 'DBGASOL1'
    TableName = 'DGASDESP'
    Left = 320
    Top = 152
    object TL_DespCLAVE: TIntegerField
      FieldName = 'CLAVE'
    end
    object TL_DespNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 40
    end
  end
  object DSTL_Desp: TDataSource
    DataSet = TL_Desp
    Left = 320
    Top = 200
  end
  object TM_Dliqc: TRxMemoryData
    FieldDefs = <>
    Left = 104
    Top = 280
    object TM_DliqcCombustible: TIntegerField
      FieldName = 'Combustible'
    end
    object TM_DliqcImporte: TFloatField
      FieldName = 'Importe'
      DisplayFormat = '###,###,##0.00'
    end
    object TM_DliqcNombre: TStringField
      FieldKind = fkLookup
      FieldName = 'Nombre'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'Combustible'
      Lookup = True
    end
  end
  object DSTM_Dliqc: TDataSource
    DataSet = TM_Dliqc
    Left = 168
    Top = 280
  end
  object T_Dliqe: TTable
    BeforeInsert = T_DliqeBeforeInsert
    AfterInsert = T_DliqeAfterInsert
    AfterPost = T_DliqeAfterPost
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FOLIO;CLAVE_PAGO;INDICE'
    MasterFields = 'ESTACION;FOLIO;CLAVE_PAGO'
    MasterSource = DS_Dliqp
    TableName = 'DGASDLIQE'
    Left = 384
    Top = 16
    object T_DliqeESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_DliqeFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object T_DliqeCLAVE_PAGO: TStringField
      FieldName = 'CLAVE_PAGO'
      Size = 2
    end
    object T_DliqeINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object T_DliqeDENOMINACION: TFloatField
      FieldName = 'DENOMINACION'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DliqeCANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
      OnChange = T_DliqeCANTIDADChange
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DliqeIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
  end
  object DS_Dliqe: TDataSource
    DataSet = T_Dliqe
    Left = 384
    Top = 88
  end
  object T_DliqPc: TTable
    AfterInsert = T_DliqPcAfterInsert
    DatabaseName = 'DBGASOL1'
    IndexFieldNames = 'ESTACION;FOLIO;CLAVE_PAGO'
    MasterFields = 'ESTACION;FOLIO;CLAVE_PAGO'
    MasterSource = DS_Dliqp
    TableName = 'DGASDLIQPC'
    Left = 455
    Top = 18
    object T_DliqPcESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object T_DliqPcFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object T_DliqPcCLAVE_PAGO: TStringField
      FieldName = 'CLAVE_PAGO'
      Size = 2
    end
    object T_DliqPcINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object T_DliqPcNOCLIENTE: TIntegerField
      FieldName = 'NOCLIENTE'
    end
    object T_DliqPcIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '#,###,###0.00'
    end
    object T_DliqPcNombreCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCliente'
      LookupDataSet = DMGEN_VTAS.T_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'NOCLIENTE'
      Size = 80
      Lookup = True
    end
  end
  object DS_DliqPc: TDataSource
    DataSet = T_DliqPc
    Left = 453
    Top = 83
  end
  object T_Dliqcd: TTable
    OnCalcFields = T_DliqcdCalcFields
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FOLIO;BOMBA;COMBUSTIBLE;PRECIO'
    MasterFields = 'ESTACION;FOLIO;BOMBA'
    MasterSource = DS_Dliqc
    TableName = 'DGASDLIQCD'
    Left = 383
    Top = 155
    object T_DliqcdESTACION: TIntegerField
      FieldName = 'ESTACION'
      Required = True
    end
    object T_DliqcdFOLIO: TIntegerField
      FieldName = 'FOLIO'
      Required = True
    end
    object T_DliqcdBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Required = True
    end
    object T_DliqcdCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
      Required = True
    end
    object T_DliqcdNombreComb: TStringField
      FieldKind = fkCalculated
      FieldName = 'NombreComb'
      Size = 7
      Calculated = True
    end
    object T_DliqcdPRECIO: TFloatField
      FieldName = 'PRECIO'
      Required = True
    end
    object T_DliqcdIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
  end
  object DS_Dliqcd: TDataSource
    DataSet = T_Dliqcd
    Left = 384
    Top = 201
  end
  object T_DliqCp: TTable
    DatabaseName = 'DBGASOL1'
    MasterFields = 'ESTACION;TURNO;POSCARGA;COMBUSTIBLE'
    MasterSource = DS_Dliqc
    TableName = 'DGASDLIQCP'
    Left = 448
    Top = 152
    object T_DliqCpESTACION: TIntegerField
      FieldName = 'ESTACION'
      Required = True
    end
    object T_DliqCpTURNO: TIntegerField
      FieldName = 'TURNO'
      Required = True
    end
    object T_DliqCpPOSCARGA: TIntegerField
      FieldName = 'POSCARGA'
      Required = True
    end
    object T_DliqCpCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
      Required = True
    end
    object T_DliqCpFECHAHORA: TDateTimeField
      FieldName = 'FECHAHORA'
      Required = True
      DisplayFormat = 'hh:nn am/pm'
    end
    object T_DliqCpPRECIO: TFloatField
      FieldName = 'PRECIO'
      DisplayFormat = '###,###,##0.00'
    end
    object T_DliqCpLITROS: TFloatField
      FieldName = 'LITROS'
      DisplayFormat = '###,###,##0.00'
    end
    object T_DliqCpIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
    end
  end
  object DS_DliqCp: TDataSource
    DataSet = T_DliqCp
    Left = 448
    Top = 200
  end
  object T_Desc: TTable
    DatabaseName = 'DBGASOL1'
    TableName = 'DGASDESC'
    Left = 238
    Top = 280
    object T_DescESTACION: TIntegerField
      FieldName = 'ESTACION'
      Required = True
    end
    object T_DescFECHA: TDateTimeField
      FieldName = 'FECHA'
      Required = True
    end
    object T_DescTURNO: TIntegerField
      FieldName = 'TURNO'
      Required = True
    end
    object T_DescTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescContabilizado: TStringField
      FieldKind = fkCalculated
      FieldName = 'Contabilizado'
      Size = 2
      Calculated = True
    end
  end
  object Ds_Desc: TDataSource
    DataSet = T_Desc
    Left = 240
    Top = 321
  end
  object T_Descd: TTable
    DatabaseName = 'DBGASOL1'
    IndexFieldNames = 'ESTACION;FECHA;TURNO'
    MasterFields = 'ESTACION;FECHA;TURNO'
    MasterSource = Ds_Desc
    TableName = 'DGASDESCD'
    Left = 318
    Top = 283
    object T_DescdESTACION: TIntegerField
      FieldName = 'ESTACION'
      Required = True
    end
    object T_DescdFECHA: TDateTimeField
      FieldName = 'FECHA'
      Required = True
    end
    object T_DescdTURNO: TIntegerField
      FieldName = 'TURNO'
      Required = True
    end
    object T_DescdISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object T_DescdCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
      Required = True
    end
    object T_DescdNombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGASQ.QT_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
    object T_DescdLITROS: TFloatField
      FieldName = 'LITROS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescdPRECIO: TFloatField
      FieldName = 'PRECIO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescdIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescdDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescdTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
  end
end
