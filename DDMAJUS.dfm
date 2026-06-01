object DMAJUS: TDMAJUS
  OldCreateOrder = False
  Left = 281
  Top = 268
  Height = 252
  Width = 374
  object DBAJUS1: TDatabase
    AliasName = 'Ajustador'
    DatabaseName = 'DBAJUSTA1'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SYSDBA'
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
  object TL_Ajud: TTable
    AfterEdit = TL_AjudAfterEdit
    AfterDelete = TL_AjudAfterDelete
    DatabaseName = 'DBGASOL1'
    TableName = 'DGASAJUD'
    Left = 192
    Top = 17
    object TL_AjudEstacion: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'ESTACION'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
      AttributeSet = 'Folio2'
    end
    object TL_AjudFECHA: TDateTimeField
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
      AttributeSet = 'Fecha'
    end
    object TL_AjudAPLICADO: TStringField
      FieldName = 'APLICADO'
      Size = 2
    end
    object TL_AjudTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object TL_AjudTURNO: TIntegerField
      FieldName = 'TURNO'
    end
  end
  object DSL_Ajud: TDataSource
    DataSet = TL_Ajud
    Left = 192
    Top = 65
  end
  object TL_Ajud2: TTable
    AfterInsert = TL_Ajud2AfterInsert
    DatabaseName = 'DBGASOL1'
    IndexFieldNames = 'ESTACION;FECHA;TURNO;COMBUSTIBLE'
    MasterFields = 'ESTACION;FECHA;TURNO'
    MasterSource = DSL_Ajud
    TableName = 'DGASAJUD2'
    Left = 257
    Top = 17
    object TL_Ajud2ESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object TL_Ajud2FECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object TL_Ajud2COMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object TL_Ajud2VOLUMEN: TFloatField
      FieldName = 'VOLUMEN'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object TL_Ajud2VENTA: TFloatField
      FieldName = 'VENTA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object TL_Ajud2DIFERENCIA: TFloatField
      FieldName = 'DIFERENCIA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object TL_Ajud2PRECIO: TFloatField
      FieldName = 'PRECIO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object TL_Ajud2TOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object TL_Ajud2NombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGASQ.QT_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
    object TL_Ajud2TURNO: TIntegerField
      FieldName = 'TURNO'
    end
  end
  object DSL_Ajud2: TDataSource
    DataSet = TL_Ajud2
    Left = 257
    Top = 65
  end
  object Q_AuxiAjus: TQuery
    AfterClose = Q_AuxiAjusAfterClose
    DatabaseName = 'DBAJUSTA1'
    Left = 32
    Top = 80
    object Q_AuxiAjusEntero1: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Entero1'
      Calculated = True
    end
    object Q_AuxiAjusEntero2: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Entero2'
      Calculated = True
    end
    object Q_AuxiAjusReal1: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Real1'
      Calculated = True
    end
  end
end
