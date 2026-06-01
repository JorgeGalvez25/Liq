object FLIQSALI: TFLIQSALI
  Left = 250
  Top = 130
  Width = 660
  Height = 513
  BorderIcons = [biSystemMenu]
  Caption = 'Generación de Salida del Turno'
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 113
    Align = alTop
    BevelOuter = bvNone
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
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 257
      Height = 113
      Align = alLeft
      Caption = 'Salida '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = GroupBox1Enter
      OnExit = GroupBox1Exit
      object Label1: TLabel
        Left = 172
        Top = 21
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
        Left = 4
        Top = 61
        Width = 68
        Height = 13
        Caption = 'Tipo de Salida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 172
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
      object Label4: TLabel
        Left = 5
        Top = 21
        Width = 41
        Height = 13
        Caption = 'Almacén'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit3: TDBEdit
        Left = 172
        Top = 34
        Width = 74
        Height = 21
        DataField = 'FECHA'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnEnter = DBEdit3Enter
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 5
        Top = 74
        Width = 160
        Height = 21
        DataField = 'TIPOSAL'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CLAVEDOC'
        ListField = 'ClaveDescripcion'
        ListSource = DMGEN.DSQ_Docu
        ParentFont = False
        TabOrder = 2
        OnEnter = DBLookupComboBox1Enter
      end
      object DBEdit2: TDBEdit
        Left = 172
        Top = 74
        Width = 74
        Height = 21
        DataField = 'FOLIO'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 3
        OnDblClick = DBEdit2DblClick
        OnEnter = DBEdit2Enter
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 5
        Top = 34
        Width = 160
        Height = 21
        DataField = 'ALMACEN'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyField = 'CLAVE'
        ListField = 'DescNombre'
        ListSource = DMGEN_VTAS.DSQ_Alma
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 257
      Top = 0
      Width = 395
      Height = 113
      Align = alClient
      Caption = 'Otros Datos '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label7: TLabel
        Left = 4
        Top = 26
        Width = 61
        Height = 13
        Caption = 'Centro Costo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 53
        Width = 55
        Height = 13
        Caption = 'Requisición'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 69
        Top = 49
        Width = 63
        Height = 21
        DataField = 'REQUISICION'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = DBEdit1Exit
      end
      object DBEdit8: TDBEdit
        Left = 69
        Top = 22
        Width = 63
        Height = 21
        DataField = 'CENTROCOSTO'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnDblClick = DBEdit8DblClick
      end
      object DBEdit9: TDBEdit
        Left = 136
        Top = 25
        Width = 252
        Height = 15
        BorderStyle = bsNone
        Color = clMenu
        DataField = 'NombreCentroCosto'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnEnter = DBEdit9Enter
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 422
    Width = 652
    Height = 45
    Align = alBottom
    TabOrder = 3
    object BbGuardar: TBitBtn
      Left = 368
      Top = 10
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
      Left = 462
      Top = 10
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
      OnClick = BbCancelarClick
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
      Left = 556
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Salir1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object DBNavigator1: TDBNavigator
      Left = 10
      Top = 10
      Width = 112
      Height = 25
      DataSource = DMINV.DS_Movs
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Hints.Strings = (
        'Inicio'
        'Anterior'
        'Siguiente'
        'Fin')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 306
    Width = 652
    Height = 116
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 652
      Height = 36
      Align = alTop
      TabOrder = 0
      object Label6: TLabel
        Left = 373
        Top = 11
        Width = 47
        Height = 13
        Caption = 'Totales...:'
      end
      object DBEdit10: TDBEdit
        Left = 512
        Top = 8
        Width = 109
        Height = 19
        BorderStyle = bsNone
        DataField = 'TOTAL'
        DataSource = DMINV.DS_Sali
        TabOrder = 0
      end
      object DBEdit11: TDBEdit
        Left = 425
        Top = 8
        Width = 85
        Height = 19
        BorderStyle = bsNone
        DataField = 'TotalUnidades'
        DataSource = DMINV.DS_Sali
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 36
      Width = 652
      Height = 80
      Align = alClient
      TabOrder = 1
      object Label10: TLabel
        Left = 21
        Top = 9
        Width = 37
        Height = 13
        Caption = 'Entregó'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 7
        Top = 34
        Width = 51
        Height = 13
        Caption = 'Conceptos'
      end
      object Label9: TLabel
        Left = 223
        Top = 9
        Width = 36
        Height = 13
        Caption = 'Recibió'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit6: TDBEdit
        Left = 67
        Top = 5
        Width = 150
        Height = 21
        DataField = 'ENTREGO'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnDblClick = DBEdit4DblClick
        OnExit = DBEdit4Exit
      end
      object DBEdit4: TDBEdit
        Left = 67
        Top = 30
        Width = 350
        Height = 21
        DataField = 'CONCEPTO1'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnDblClick = DBEdit4DblClick
        OnExit = DBEdit4Exit
      end
      object DBEdit5: TDBEdit
        Left = 67
        Top = 54
        Width = 350
        Height = 21
        DataField = 'CONCEPTO2'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnDblClick = DBEdit5DblClick
        OnExit = DBEdit5Exit
      end
      object DBEdit7: TDBEdit
        Left = 267
        Top = 5
        Width = 150
        Height = 21
        DataField = 'RECIBIO'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnDblClick = DBEdit4DblClick
        OnExit = DBEdit4Exit
      end
      object BbCalcular: TBitBtn
        Left = 556
        Top = 44
        Width = 75
        Height = 25
        Caption = 'Calcular'
        Default = True
        TabOrder = 4
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
    Top = 113
    Width = 652
    Height = 193
    TabStop = False
    Align = alClient
    DataSource = DMINV.DS_Movs
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = DBGrid1Enter
    Columns = <
      item
        Expanded = False
        FieldName = 'PRODUCTO'
        Title.Caption = 'Producto'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescripcionProducto'
        Title.Caption = 'Descripción'
        Width = 306
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Alignment = taRightJustify
        Title.Caption = 'Cantidad'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTEMN'
        ReadOnly = False
        Title.Alignment = taRightJustify
        Title.Caption = 'Importe'
        Width = 111
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Images = DMGEN.ImgListDocu1
    Left = 40
    Top = 168
    object Editar1: TMenuItem
      Caption = '&Documento'
      object Guardar1: TMenuItem
        Caption = '&Guardar'
        Hint = 'Guardar'
        ImageIndex = 18
        ShortCut = 16455
        OnClick = Guardar1Click
      end
      object Cancelar1: TMenuItem
        Caption = '&Cancelar'
        Hint = 'Cancelar'
        ImageIndex = 15
        OnClick = BbCancelarClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Salir2: TMenuItem
        Bitmap.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFF0000000000000000CCCC080FFFFF0CCCCCCC0880FFFF0CCCCCCC08880FFF
          0CCCCCCC08880FFF0CCCCCCC08880FFF0CCCCCCC08880FFF0CCCCCCC08880FFF
          0CCCCCCC08800FFF0CCCCCCC08880FFF0CCCCCCC08880FFF0CCCCCCC08880FFF
          0CCCCCCC08880FFF0CCCCCCC000000000CCCCCCCCCCCCCCCCCCC}
        Caption = '&Salir'
        OnClick = Salir1Click
      end
    end
    object Detalle1: TMenuItem
      Caption = '&Editar'
      object InsertaRengln1: TMenuItem
        Caption = '&Insertar Renglón'
        Hint = 'Insertar Renglón'
        ImageIndex = 16
      end
      object BorraRenglon: TMenuItem
        Caption = '&Eliminar Renglón'
        Hint = 'Eliminar Renglón'
        ImageIndex = 15
      end
      object CancelaCambios1: TMenuItem
        Caption = '&Cancelar Cambios'
        Hint = 'Cancelar'
        ImageIndex = 17
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Inicio1: TMenuItem
        Caption = '&Inicio'
        Hint = 'First'
        ImageIndex = 7
      end
      object Fin1: TMenuItem
        Caption = '&Fin'
        Hint = 'Last'
        ImageIndex = 8
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DMGEN.ImgListDocu1
    Left = 72
    Top = 168
    object InsertarRengln1: TMenuItem
      Caption = '&Insertar Renglón'
      Hint = 'Insertar Renglón'
      ImageIndex = 16
    end
    object BorrarRengln1: TMenuItem
      Caption = '&Eliminar Renglón'
      Hint = 'Eliminar Renglón'
      ImageIndex = 15
    end
    object CancelarCambios1: TMenuItem
      Caption = '&Cancelar Cambios'
      Hint = 'Cancelar'
      ImageIndex = 17
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Inicio2: TMenuItem
      Caption = '&Inicio'
      Hint = 'First'
      ImageIndex = 7
    end
    object Fin2: TMenuItem
      Caption = '&Fin'
      Hint = 'Last'
      ImageIndex = 8
    end
  end
end
