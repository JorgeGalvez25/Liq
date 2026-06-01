object FLIQAJUD: TFLIQAJUD
  Left = 268
  Top = 135
  BorderStyle = bsDialog
  Caption = 'Proceso Diario'
  ClientHeight = 500
  ClientWidth = 885
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
    Width = 885
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 741
      Top = 12
      Width = 20
      Height = 13
      Caption = 'Mes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 39
      Width = 300
      Height = 13
      Caption = 
        'Especifique aqu'#237' el turno al que se va a aplicar el ajuste del d' +
        #237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object MesBox1: TComboBox
      Left = 770
      Top = 9
      Width = 86
      Height = 21
      Style = csDropDownList
      DropDownCount = 13
      ItemHeight = 13
      TabOrder = 1
      OnChange = MesBox1Change
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 225
      Height = 35
      Align = alNone
      ButtonHeight = 31
      ButtonWidth = 33
      Caption = 'ToolBar1'
      EdgeOuter = esRaised
      Images = DMGEN.ImgListCat1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 2
        Hint = 'Insertar'
        Caption = '&Insertar'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 33
        Top = 2
        Hint = 'Eliminar'
        Caption = '&Delete'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton2Click
      end
      object ToolButton4: TToolButton
        Left = 66
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 74
        Top = 2
        Hint = 'Imprimir Reporte de Ajuste'
        Caption = 'ToolButton3'
        ImageIndex = 6
        OnClick = ToolButton3Click
      end
      object ToolButton5: TToolButton
        Left = 107
        Top = 2
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 115
        Top = 2
        Hint = 'Bloquear Fecha'
        Caption = 'ToolButton6'
        ImageIndex = 20
        OnClick = ToolButton6Click
      end
      object ToolButton7: TToolButton
        Left = 148
        Top = 2
        Hint = 'Desbloquear Fecha'
        Caption = 'ToolButton7'
        ImageIndex = 21
        OnClick = ToolButton7Click
      end
      object TBAjusta: TToolButton
        Left = 181
        Top = 2
        Caption = 'TBAjusta'
        ImageIndex = 22
        OnClick = TBAjustaClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 463
    Width = 885
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 793
      Top = 7
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 0
      Kind = bkClose
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 55
    Width = 309
    Height = 408
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 309
      Height = 367
      Align = alClient
      DataSource = DSL_Ajud
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGrid1ColEnter
      OnColExit = DBGrid1ColExit
      OnExit = DBGrid1Exit
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          Title.Caption = 'Fecha'
          Width = 89
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TURNO'
          Title.Caption = 'Turno'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Importe Total'
          Width = 89
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          FieldName = 'BLOQUEADO'
          ReadOnly = True
          Title.Caption = 'Bloqueado'
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 0
      Top = 367
      Width = 309
      Height = 41
      Align = alBottom
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 5
        Top = 8
        Width = 108
        Height = 25
        DataSource = DSL_Ajud
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object StaticText2: TStaticText
        Left = 143
        Top = 11
        Width = 93
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '       '
        Color = clHighlightText
        ParentColor = False
        TabOrder = 1
      end
    end
  end
  object Panel4: TPanel
    Left = 309
    Top = 55
    Width = 576
    Height = 408
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel5: TPanel
      Left = 0
      Top = 367
      Width = 576
      Height = 41
      Align = alBottom
      TabOrder = 1
      object DBNavigator2: TDBNavigator
        Left = 21
        Top = 8
        Width = 108
        Height = 25
        DataSource = DSL_Ajud2
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 576
      Height = 367
      Align = alClient
      DataSource = DSL_Ajud2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEnter = DBGrid2Enter
      Columns = <
        item
          Expanded = False
          FieldName = 'NombreCombustible'
          Title.Caption = 'Combustible'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VOLUMEN'
          Title.Alignment = taRightJustify
          Title.Caption = 'Lts. F'#237'sico'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENTA'
          Title.Alignment = taRightJustify
          Title.Caption = 'Lts. Vendido'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIFERENCIA'
          Title.Caption = 'Lts. Diferencia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Precio / Litro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'T o t a l'
          Width = 91
          Visible = True
        end>
    end
  end
  object TL_Ajud: TTable
    AfterInsert = TL_AjudAfterInsert
    AfterEdit = TL_AjudAfterEdit
    AfterPost = TL_AjudAfterPost
    AfterDelete = TL_AjudAfterDelete
    DatabaseName = 'DBGASOL1'
    TableName = 'DGASAJUD'
    Left = 51
    Top = 153
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
      OnValidate = TL_AjudFECHAValidate
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
    object TL_AjudBLOQUEADO: TStringField
      FieldName = 'BLOQUEADO'
      Size = 2
    end
  end
  object DSL_Ajud: TDataSource
    DataSet = TL_Ajud
    Left = 48
    Top = 241
  end
  object TL_Ajud2: TTable
    AfterInsert = TL_Ajud2AfterInsert
    AfterPost = TL_Ajud2AfterPost
    DatabaseName = 'DBGASOL1'
    IndexFieldNames = 'ESTACION;FECHA;TURNO'
    MasterFields = 'ESTACION;FECHA;TURNO'
    MasterSource = DSL_Ajud
    TableName = 'DGASAJUD2'
    Left = 377
    Top = 217
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
    Left = 385
    Top = 257
  end
end
