object FLIQTRAN2: TFLIQTRAN2
  Left = 430
  Top = 142
  BorderStyle = bsDialog
  Caption = 'Reclasificaci'#243'n de Transacciones Pendientes de Liquidar'
  ClientHeight = 471
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 201
      Top = 13
      Width = 28
      Height = 13
      Caption = 'Filtrar '
    end
    object Label2: TLabel
      Left = 569
      Top = 13
      Width = 25
      Height = 13
      Caption = 'Filtrar'
    end
    object Label3: TLabel
      Left = 3
      Top = 13
      Width = 109
      Height = 13
      Caption = 'Pendientes a la Fecha:'
    end
    object Label4: TLabel
      Left = 378
      Top = 13
      Width = 111
      Height = 13
      Caption = 'Reclasificar a la Fecha:'
    end
    object Label5: TLabel
      Left = 446
      Top = 36
      Width = 43
      Height = 13
      Caption = 'Al Turno:'
    end
    object ComboBox2: TComboBox
      Left = 230
      Top = 7
      Width = 99
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'Todas las Islas'
      OnChange = ComboBox2Change
    end
    object ComboBox1: TComboBox
      Left = 598
      Top = 7
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'Todas las Islas'
      OnChange = ComboBox2Change
    end
    object MaskEdit3: TMaskEdit
      Left = 117
      Top = 7
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object MaskEdit4: TMaskEdit
      Left = 492
      Top = 7
      Width = 68
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object Edit1: TEdit
      Left = 492
      Top = 31
      Width = 30
      Height = 21
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 287
    Width = 730
    Height = 184
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 730
      Height = 5
      Align = alTop
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 0
    end
    object Panel6: TPanel
      Left = 0
      Top = 5
      Width = 730
      Height = 134
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object ListView1: TListView
        Left = 1
        Top = 1
        Width = 368
        Height = 132
        Align = alLeft
        Color = clInfoBk
        Columns = <
          item
            Caption = 'Resumen'
            Width = 120
          end
          item
            Alignment = taCenter
            Caption = 'Isla'
            Width = 56
          end
          item
            Alignment = taRightJustify
            Caption = 'Cantidad'
            Width = 60
          end
          item
            Alignment = taRightJustify
            Caption = 'Importe'
            MaxWidth = 120
            Width = 100
          end>
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLines = True
        Items.Data = {1D0000000100000000000000FFFFFFFFFFFFFFFF000000000000000000}
        ReadOnly = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
      object ListView2: TListView
        Left = 416
        Top = 1
        Width = 313
        Height = 132
        Align = alRight
        Color = clInfoBk
        Columns = <
          item
            Caption = 'Resumen'
            Width = 75
          end
          item
            Alignment = taCenter
            Caption = 'Isla'
          end
          item
            Alignment = taRightJustify
            Caption = 'Cantidad'
            Width = 60
          end
          item
            Alignment = taRightJustify
            Caption = 'Importe'
            MaxWidth = 120
            Width = 100
          end>
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        ParentFont = False
        TabOrder = 1
        ViewStyle = vsReport
      end
      object Panel7: TPanel
        Left = 369
        Top = 1
        Width = 47
        Height = 132
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 2
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 139
      Width = 730
      Height = 45
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 608
        Top = 13
        Width = 75
        Height = 25
        Caption = '&Salir'
        TabOrder = 0
        Kind = bkClose
      end
      object BbCalcular: TBitBtn
        Left = 511
        Top = 13
        Width = 75
        Height = 25
        Caption = '&Calcular'
        Default = True
        TabOrder = 1
        OnClick = BbCalcularClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888888888888888888800888888888888888888888888888888A708888888
          88888888888888888888887A708888888888888888888888888888A7A7088888
          88888888888888888888887A7A7088888888888888888888888888A7A7A70888
          88888888888888888888887A7A7A70888888888888888888888888A7A7A7A788
          88888888888888888888887A7A7A78888888888888888888888888A7A7A78888
          88888888888888888888887A7A7888888888888888888888888888A7A7888888
          88888888888888888888887A788888888888888888888888888888A788888888
          8888888888888888888888888888888888888888888888888888}
        NumGlyphs = 2
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 369
    Height = 222
    Align = alLeft
    Color = clInfoBk
    DataSource = DSQL_Tran
    PopupMenu = PopupMenu2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPOVENTA'
        Title.Caption = 'TM'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOLIO'
        Title.Caption = 'Folio'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Title.Caption = 'Fecha'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA'
        Title.Caption = 'Hora'
        Width = 36
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ISLA'
        Title.Alignment = taCenter
        Title.Caption = 'Isla'
        Width = 26
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TURNO'
        Title.Alignment = taCenter
        Title.Caption = 'Turno'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Importe'
        Width = 71
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 369
    Top = 65
    Width = 44
    Height = 222
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 3
    object PasaUna: TSpeedButton
      Left = 12
      Top = 91
      Width = 23
      Height = 22
      Hint = 'Transacci'#243'n Actual'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777777777777777777777777077777777777777700777
        7777777777706077777777700000660777777770666666607777777066666666
        0777777066666660777777700000660777777777777060777777777777700777
        7777777777707777777777777777777777777777777777777777}
      ParentShowHint = False
      ShowHint = True
      OnClick = PasaUnaClick
    end
    object PasaTodas: TSpeedButton
      Left = 12
      Top = 60
      Width = 23
      Height = 22
      Hint = 'Todas las Transacciones'
      Caption = '>>'
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = PasaTodasClick
    end
  end
  object DBGrid2: TDBGrid
    Left = 413
    Top = 65
    Width = 317
    Height = 222
    Align = alClient
    Color = clInfoBk
    DataSource = DSQL_Tran2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopupMenu1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPOVENTA'
        Title.Caption = 'TM'
        Width = 21
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOLIO'
        Title.Caption = 'Folio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORA'
        Title.Caption = 'Hora'
        Width = 49
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ISLA'
        Title.Alignment = taCenter
        Title.Caption = 'Isla'
        Width = 26
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TURNO'
        Title.Alignment = taCenter
        Title.Caption = 'Turno'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taRightJustify
        Title.Caption = 'Importe'
        Width = 80
        Visible = True
      end>
  end
  object QL_Tran2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select * from DGASTRAN'
      'where estacion=:pestacion and fecha=:pfecha '
      '  and (turnoliq=0 or turnoliq is null)'
      '  and estatus='#39'A'#39' '
      '  and tipoventa<>'#39'CO'#39
      'order by hora')
    Left = 552
    Top = 216
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
      end>
    object QL_Tran2TIPOVENTA: TStringField
      FieldName = 'TIPOVENTA'
      Origin = 'DBGASOL1.DGASTRAN.TIPOVENTA'
      Size = 2
    end
    object QL_Tran2ESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASTRAN.ESTACION'
    end
    object QL_Tran2FOLIO: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'FOLIO'
      Origin = 'DBGASOL1.DGASTRAN.FOLIO'
      Required = True
      DisplayFormat = '000000'
      EditFormat = '000000'
      AttributeSet = 'Folio6'
    end
    object QL_Tran2ISLA: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'ISLA'
      Origin = 'DBGASOL1.DGASTRAN.ISLA'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
      AttributeSet = 'Folio2'
    end
    object QL_Tran2BOMBA: TIntegerField
      FieldName = 'BOMBA'
      Origin = 'DBGASOL1.DGASTRAN.BOMBA'
    end
    object QL_Tran2FECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASTRAN.FECHA'
    end
    object QL_Tran2TURNO: TIntegerField
      Alignment = taLeftJustify
      CustomConstraint = 'value>=0'
      ConstraintErrorMessage = 'El valor debe ser positivo'
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASTRAN.TURNO'
      Required = True
      DisplayFormat = '00'
      EditFormat = '00'
      AttributeSet = 'Folio2'
    end
    object QL_Tran2HORA: TDateTimeField
      FieldName = 'HORA'
      Origin = 'DBGASOL1.DGASTRAN.HORA'
      DisplayFormat = 'hh:mm'
      EditMask = '!99/99/0000;1;_'
      AttributeSet = 'Fecha'
    end
    object QL_Tran2CLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASTRAN.CLIENTE'
    end
    object QL_Tran2VEHICULO: TIntegerField
      FieldName = 'VEHICULO'
      Origin = 'DBGASOL1.DGASTRAN.VEHICULO'
    end
    object QL_Tran2COMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
      Origin = 'DBGASOL1.DGASTRAN.COMBUSTIBLE'
    end
    object QL_Tran2PRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'DBGASOL1.DGASTRAN.PRECIO'
    end
    object QL_Tran2LITROS: TFloatField
      FieldName = 'LITROS'
      Origin = 'DBGASOL1.DGASTRAN.LITROS'
    end
    object QL_Tran2IMPORTECMB: TFloatField
      FieldName = 'IMPORTECMB'
      Origin = 'DBGASOL1.DGASTRAN.IMPORTECMB'
    end
    object QL_Tran2IMPORTEOTR: TFloatField
      FieldName = 'IMPORTEOTR'
      Origin = 'DBGASOL1.DGASTRAN.IMPORTEOTR'
    end
    object QL_Tran2TOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'DBGASOL1.DGASTRAN.TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object QL_Tran2ESTATUS: TStringField
      FieldName = 'ESTATUS'
      Origin = 'DBGASOL1.DGASTRAN.ESTATUS'
      Size = 1
    end
    object QL_Tran2DESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
      Origin = 'DBGASOL1.DGASTRAN.DESPACHADOR'
    end
    object QL_Tran2INDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASTRAN.INDICE'
    end
    object QL_Tran2KILOMETRAJE: TIntegerField
      FieldName = 'KILOMETRAJE'
      Origin = 'DBGASOL1.DGASTRAN.KILOMETRAJE'
    end
    object QL_Tran2POSCARGA: TIntegerField
      FieldName = 'POSCARGA'
      Origin = 'DBGASOL1.DGASTRAN.POSCARGA'
    end
    object QL_Tran2TASAIVA: TFloatField
      FieldName = 'TASAIVA'
      Origin = 'DBGASOL1.DGASTRAN.TASAIVA'
    end
    object QL_Tran2TURNOLIQ: TIntegerField
      FieldName = 'TURNOLIQ'
      Origin = 'DBGASOL1.DGASTRAN.TURNOLIQ'
    end
  end
  object DSQL_Tran2: TDataSource
    DataSet = QL_Tran2
    Left = 448
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 512
    Top = 152
    object AgregaraTurnoActual1: TMenuItem
      Caption = '&Traspasar'
    end
    object AgregarlasdelMismoTurno1: TMenuItem
      Caption = 'Traspasar las del &Mismo Turno'
    end
    object TraspasarTodas2: TMenuItem
      Caption = 'Traspasar Todas'
    end
  end
  object QL_Tran: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select * from DGASTRAN'
      'where estacion=:pestacion and fecha<=:pfecha'
      '  and estatus='#39'A'#39' '
      '  and tipoventa<>'#39'CO'#39
      'order by hora')
    Left = 16
    Top = 168
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
      end>
    object QL_TranTIPOVENTA: TStringField
      FieldName = 'TIPOVENTA'
      Origin = 'DBGASOL1.DGASTRAN.TIPOVENTA'
      Size = 2
    end
    object QL_TranESTACION: TIntegerField
      FieldName = 'ESTACION'
      Origin = 'DBGASOL1.DGASTRAN.ESTACION'
    end
    object QL_TranFOLIO: TIntegerField
      FieldName = 'FOLIO'
      Origin = 'DBGASOL1.DGASTRAN.FOLIO'
      DisplayFormat = '000000'
    end
    object QL_TranISLA: TIntegerField
      FieldName = 'ISLA'
      Origin = 'DBGASOL1.DGASTRAN.ISLA'
      DisplayFormat = '00'
    end
    object QL_TranBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Origin = 'DBGASOL1.DGASTRAN.BOMBA'
    end
    object QL_TranFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASTRAN.FECHA'
      DisplayFormat = 'dd/mmm/yyyy'
    end
    object QL_TranTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASTRAN.TURNO'
      DisplayFormat = '00'
    end
    object QL_TranHORA: TDateTimeField
      FieldName = 'HORA'
      Origin = 'DBGASOL1.DGASTRAN.HORA'
      DisplayFormat = 'hh:mm'
    end
    object QL_TranCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASTRAN.CLIENTE'
    end
    object QL_TranVEHICULO: TIntegerField
      FieldName = 'VEHICULO'
      Origin = 'DBGASOL1.DGASTRAN.VEHICULO'
    end
    object QL_TranCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
      Origin = 'DBGASOL1.DGASTRAN.COMBUSTIBLE'
    end
    object QL_TranPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'DBGASOL1.DGASTRAN.PRECIO'
    end
    object QL_TranLITROS: TFloatField
      FieldName = 'LITROS'
      Origin = 'DBGASOL1.DGASTRAN.LITROS'
    end
    object QL_TranIMPORTECMB: TFloatField
      FieldName = 'IMPORTECMB'
      Origin = 'DBGASOL1.DGASTRAN.IMPORTECMB'
    end
    object QL_TranIMPORTEOTR: TFloatField
      FieldName = 'IMPORTEOTR'
      Origin = 'DBGASOL1.DGASTRAN.IMPORTEOTR'
    end
    object QL_TranTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = 'DBGASOL1.DGASTRAN.TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object QL_TranESTATUS: TStringField
      FieldName = 'ESTATUS'
      Origin = 'DBGASOL1.DGASTRAN.ESTATUS'
      Size = 1
    end
    object QL_TranDESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
      Origin = 'DBGASOL1.DGASTRAN.DESPACHADOR'
    end
    object QL_TranINDICE: TIntegerField
      FieldName = 'INDICE'
      Origin = 'DBGASOL1.DGASTRAN.INDICE'
    end
    object QL_TranKILOMETRAJE: TIntegerField
      FieldName = 'KILOMETRAJE'
      Origin = 'DBGASOL1.DGASTRAN.KILOMETRAJE'
    end
    object QL_TranPOSCARGA: TIntegerField
      FieldName = 'POSCARGA'
      Origin = 'DBGASOL1.DGASTRAN.POSCARGA'
    end
    object QL_TranTASAIVA: TFloatField
      FieldName = 'TASAIVA'
      Origin = 'DBGASOL1.DGASTRAN.TASAIVA'
    end
    object QL_TranTURNOLIQ: TIntegerField
      FieldName = 'TURNOLIQ'
      Origin = 'DBGASOL1.DGASTRAN.TURNOLIQ'
    end
    object QL_TranFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Origin = 'DBGASOL1.DGASTRAN.FACTURADO'
      Size = 2
    end
    object QL_TranESTACIONFAC: TIntegerField
      FieldName = 'ESTACIONFAC'
      Origin = 'DBGASOL1.DGASTRAN.ESTACIONFAC'
    end
    object QL_TranSERIEFAC: TStringField
      FieldName = 'SERIEFAC'
      Origin = 'DBGASOL1.DGASTRAN.SERIEFAC'
      Size = 2
    end
    object QL_TranFOLIOFAC: TIntegerField
      FieldName = 'FOLIOFAC'
      Origin = 'DBGASOL1.DGASTRAN.FOLIOFAC'
    end
    object QL_TranENLINEA: TStringField
      FieldName = 'ENLINEA'
      Origin = 'DBGASOL1.DGASTRAN.ENLINEA'
      Size = 2
    end
    object QL_TranFOLIOFUERALINEA: TIntegerField
      FieldName = 'FOLIOFUERALINEA'
      Origin = 'DBGASOL1.DGASTRAN.FOLIOFUERALINEA'
    end
    object QL_TranMODOCARGA: TStringField
      FieldName = 'MODOCARGA'
      Origin = 'DBGASOL1.DGASTRAN.MODOCARGA'
      Size = 1
    end
    object QL_TranFECHAFACTURA: TDateTimeField
      FieldName = 'FECHAFACTURA'
      Origin = 'DBGASOL1.DGASTRAN.FECHAFACTURA'
    end
    object QL_TranSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
      Origin = 'DBGASOL1.DGASTRAN.SUBCODIGO'
    end
  end
  object DSQL_Tran: TDataSource
    DataSet = QL_Tran
    Left = 64
    Top = 200
  end
  object PopupMenu2: TPopupMenu
    Left = 176
    Top = 184
    object QuitarTransaccindeesteTurno1: TMenuItem
      Caption = 'Traspasar'
    end
    object TraspasarTodas1: TMenuItem
      Caption = 'Traspasar Todas'
    end
  end
  object QL_Isla: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select Isla,Count(*) as Cantidad,Sum(Total) as Importe from DGAS' +
        'TRAN'
      'where estacion=:pestacion and fecha<=:pfecha '
      '   and (turnoliq=0 or turnoliq is null)'
      '  and estatus='#39'A'#39
      '  and tipoventa<>'#39'CO'#39
      'Group By Isla'
      'Order by Isla')
    Left = 16
    Top = 120
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
      end>
    object QL_IslaISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object QL_IslaCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object QL_IslaIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
  end
  object QL_Isla2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select Isla,Count(*) as Cantidad,Sum(Total) as Importe from DGAS' +
        'TRAN'
      'where estacion=:pestacion and fecha=:pfecha '
      '   and (turnoliq=0 or turnoliq is null)'
      '  and estatus='#39'A'#39
      '  and tipoventa<>'#39'CO'#39
      'Group By Isla'
      'Order by Isla'
      '')
    Left = 496
    Top = 216
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
      end>
    object QL_Isla2ISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object QL_Isla2IMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_Isla2CANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
  end
  object QL_Islas: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Isla from DGASISLA'
      'Order by Isla')
    Left = 632
    Top = 152
    object QL_IslasISLA: TIntegerField
      FieldName = 'ISLA'
    end
  end
end
