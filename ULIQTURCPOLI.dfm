object FLIQTURCPOLI: TFLIQTURCPOLI
  Left = 203
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'P'#243'liza de Liquidaci'#243'n del Turno'
  ClientHeight = 392
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 373
    Width = 644
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 110
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TLabel
      Left = 24
      Top = 51
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object GroupBox2: TGroupBox
      Left = 266
      Top = 1
      Width = 377
      Height = 108
      Align = alClient
      Caption = ' Concepto '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = GroupBox2Enter
      object DBEdit4: TDBEdit
        Left = 11
        Top = 32
        Width = 304
        Height = 21
        DataField = 'Concepto1'
        DataSource = DMCNT.DS_Poli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit5: TDBEdit
        Left = 11
        Top = 72
        Width = 304
        Height = 21
        DataField = 'Concepto2'
        DataSource = DMCNT.DS_Poli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnExit = DBEdit5Exit
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 265
      Height = 108
      Align = alLeft
      Caption = ' P'#243'liza '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = GroupBox1Enter
      object Label1: TLabel
        Left = 16
        Top = 19
        Width = 30
        Height = 13
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 61
        Width = 67
        Height = 13
        Caption = 'Tipo de P'#243'liza'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 189
        Top = 61
        Width = 22
        Height = 13
        Caption = 'Folio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 32
        Width = 64
        Height = 21
        DataField = 'Fecha'
        DataSource = DMCNT.DS_Poli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 75
        Width = 153
        Height = 21
        DataField = 'TipoPoliza'
        DataSource = DMCNT.DS_Poli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'ClaveDoc'
        ListField = 'Descripcion'
        ListSource = DMGEN.DSQ_Docu
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnEnter = DBLookupComboBox1Enter
      end
      object DBEdit2: TDBEdit
        Left = 188
        Top = 75
        Width = 53
        Height = 21
        DataField = 'NoPoliza'
        DataSource = DMCNT.DS_Poli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 2
        OnDblClick = DBEdit2DblClick
        OnEnter = DBEdit2Enter
        OnExit = DBEdit2Exit
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 336
    Width = 644
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object BbGuardar: TBitBtn
      Left = 331
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Guardar'
      Caption = '&Guardar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Guardar1Click
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
    object BbCancelar: TBitBtn
      Left = 431
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Cancelar'
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Cancelar1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BbSalir: TBitBtn
      Left = 531
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Kind = bkClose
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 285
    Width = 644
    Height = 51
    Align = alBottom
    TabOrder = 3
    OnEnter = GroupBox2Enter
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Formul'#243
      FocusControl = DBEdit6
    end
    object Label6: TLabel
      Left = 112
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Revis'#243
      FocusControl = DBEdit7
    end
    object Label7: TLabel
      Left = 216
      Top = 8
      Width = 38
      Height = 13
      Caption = 'Autoriz'#243
      FocusControl = DBEdit8
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 24
      Width = 94
      Height = 21
      DataField = 'Formulo'
      DataSource = DMCNT.DS_Poli
      TabOrder = 1
      OnEnter = DBEdit6Enter
    end
    object DBEdit7: TDBEdit
      Left = 112
      Top = 24
      Width = 94
      Height = 21
      DataField = 'Reviso'
      DataSource = DMCNT.DS_Poli
      TabOrder = 2
    end
    object DBEdit8: TDBEdit
      Left = 216
      Top = 24
      Width = 94
      Height = 21
      DataField = 'Autorizo'
      DataSource = DMCNT.DS_Poli
      TabOrder = 3
    end
    object BitBtn1: TBitBtn
      Left = 529
      Top = 14
      Width = 75
      Height = 25
      Caption = 'Ca&lcular'
      TabOrder = 0
      OnClick = BitBtn1Click
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
  object Panel4: TPanel
    Left = 0
    Top = 110
    Width = 644
    Height = 141
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 642
      Height = 139
      TabStop = False
      Align = alClient
      DataSource = DMCNT.DS_Dpol
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnEditButtonClick = DBGrid1EditButtonClick
      OnEnter = DBGrid1Enter
      OnExit = DBGrid1Exit
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'Cuenta'
          ReadOnly = True
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CentroCosto'
          ReadOnly = True
          Title.Caption = 'C.Costo'
          Width = 41
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'CONCEPTO1'
          Title.Caption = 'Concepto'
          Width = 243
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ImpCargo'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Cargos'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ImpAbono'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Abonos'
          Width = 96
          Visible = True
        end>
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 251
    Width = 644
    Height = 34
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object DBText1: TDBText
      Left = 72
      Top = 8
      Width = 333
      Height = 17
      Color = clHighlightText
      DataField = 'NomCuenta'
      DataSource = DMCNT.DS_Dpol
      ParentColor = False
    end
    object DBText2: TDBText
      Left = 414
      Top = 8
      Width = 97
      Height = 17
      Alignment = taRightJustify
      Color = clHighlightText
      DataField = 'TotalCargos'
      DataSource = DMCNT.DS_Poli
      ParentColor = False
    end
    object DBText3: TDBText
      Left = 518
      Top = 8
      Width = 97
      Height = 17
      Alignment = taRightJustify
      Color = clHighlightText
      DataField = 'TotalAbonos'
      DataSource = DMCNT.DS_Poli
      ParentColor = False
    end
    object DBText4: TDBText
      Left = 8
      Top = 8
      Width = 57
      Height = 17
      Alignment = taCenter
      Color = clHighlightText
      DataField = 'NOREG'
      DataSource = DMCNT.DS_Poli
      ParentColor = False
    end
  end
  object MainMenu1: TMainMenu
    Images = DMGEN.ImgListDocu2
    Left = 40
    Top = 168
    object Editar1: TMenuItem
      Caption = '&Documento'
      object Guardar1: TMenuItem
        Caption = '&Guardar'
        Hint = 'Guardar'
        ImageIndex = 0
        ShortCut = 16455
        OnClick = Guardar1Click
      end
      object Cancelar1: TMenuItem
        Caption = '&Cancelar'
        Hint = 'Cancelar'
        OnClick = Cancelar1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Salir2: TMenuItem
        Caption = '&Salir'
      end
    end
  end
  object ActionList1: TActionList
    Left = 104
    Top = 166
    object InsertarRenglon: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insertar Rengl'#243'n'
      Hint = 'Insertar Rengl'#243'n'
      DataSource = DMCNT.DS_Dpol
    end
    object EliminarRenglon: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Eliminar Rengl'#243'n'
      Hint = 'Eliminar Rengl'#243'n'
      DataSource = DMCNT.DS_Dpol
    end
    object CancelarCambios: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar Cambios'
      Hint = 'Cancelar'
      DataSource = DMCNT.DS_Dpol
    end
    object InicioDpol: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Inicio'
      Hint = 'Inicio'
      DataSource = DMCNT.DS_Dpol
    end
    object FinDpol: TDataSetLast
      Category = 'Dataset'
      Caption = '&Fin'
      Hint = 'Fin'
      DataSource = DMCNT.DS_Dpol
    end
  end
  object TT_Auxi: TTable
    AfterInsert = TT_AuxiAfterInsert
    Left = 176
    Top = 187
    object TT_AuxiCarAbo: TStringField
      FieldName = 'CarAbo'
      Size = 1
    end
    object TT_AuxiCuenta: TStringField
      FieldName = 'Cuenta'
      Size = 16
    end
    object TT_AuxiCcosto: TIntegerField
      FieldName = 'Ccosto'
    end
    object TT_AuxiIndice: TIntegerField
      FieldName = 'Indice'
    end
    object TT_AuxiImporte: TFloatField
      FieldName = 'Importe'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 150
    object DesglocedeDepsitos1: TMenuItem
      Caption = 'Desgloce de Dep'#243'sito'
      OnClick = DesglocedeDepsitos1Click
    end
  end
  object QL_Tcmb: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Clave,Nombre, CuentaCnt, CuentaCntIva  from DGASTCMB'
      'where Clave in (Select distinct Combustible from DGASDLIQC'
      
        '                         Where Estacion=:pestacion and Fecha=:pf' +
        'echa )'
      'order by clave')
    Left = 16
    Top = 206
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
    object QL_TcmbCLAVE: TIntegerField
      FieldName = 'CLAVE'
    end
    object QL_TcmbCUENTACNT: TStringField
      FieldName = 'CUENTACNT'
      Size = 16
    end
    object QL_TcmbCUENTACNTIVA: TStringField
      FieldName = 'CUENTACNTIVA'
      Size = 16
    end
    object QL_TcmbNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 30
    end
  end
  object QL_Tpag: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Clave, Descripcion,Clase,CuentaCnt  from DGASTPAG'
      'where Clave in (Select distinct Clave_Pago from DGASDLIQP'
      
        '                         Where Estacion=:pestacion and Fecha=:pf' +
        'echa)'
      'order by clave')
    Left = 48
    Top = 206
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
    object QL_TpagCLAVE: TStringField
      FieldName = 'CLAVE'
      Size = 2
    end
    object QL_TpagDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
    object QL_TpagCUENTACNT: TStringField
      FieldName = 'CUENTACNT'
      Size = 16
    end
    object QL_TpagCLASE: TStringField
      FieldName = 'CLASE'
      Size = 15
    end
  end
end
