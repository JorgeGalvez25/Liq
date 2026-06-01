object FLIQTURCSALI: TFLIQTURCSALI
  Left = 251
  Top = 131
  Width = 660
  Height = 507
  BorderIcons = [biSystemMenu]
  Caption = 'Generaci'#243'n de Salida del Turno'
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 644
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
      Width = 644
      Height = 57
      Align = alTop
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
        Left = 464
        Top = 12
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
        Left = 189
        Top = 12
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
        Left = 377
        Top = 12
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
        Top = 12
        Width = 41
        Height = 13
        Caption = 'Almac'#233'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit3: TDBEdit
        Left = 464
        Top = 25
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
        ReadOnly = True
        TabOrder = 3
        OnEnter = DBEdit3Enter
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 190
        Top = 25
        Width = 173
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
        TabOrder = 1
        OnEnter = DBLookupComboBox1Enter
      end
      object DBEdit2: TDBEdit
        Left = 377
        Top = 25
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
        TabOrder = 2
        OnDblClick = DBEdit2DblClick
        OnEnter = DBEdit2Enter
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 5
        Top = 25
        Width = 172
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
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 57
      Width = 644
      Height = 56
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label7: TLabel
        Left = 9
        Top = 10
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
        Left = 377
        Top = 10
        Width = 55
        Height = 13
        Caption = 'Requisici'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 77
        Top = 24
        Width = 285
        Height = 19
        Color = clHighlightText
        DataField = 'NombreCentroCosto'
        DataSource = DMINV.DS_Sali
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 377
        Top = 23
        Width = 72
        Height = 21
        DataField = 'REQUISICION'
        DataSource = DMINV.DS_Sali
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnExit = DBEdit1Exit
      end
      object DBEdit8: TDBEdit
        Left = 10
        Top = 23
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
      object ChbCmb: TCheckBox
        Left = 496
        Top = 13
        Width = 120
        Height = 17
        Caption = 'Salida Combustibles'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
      end
      object ChbProd: TCheckBox
        Left = 496
        Top = 31
        Width = 97
        Height = 17
        Caption = 'Salida Aceites'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 3
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 398
    Width = 644
    Height = 50
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object BbGuardar: TBitBtn
      Left = 368
      Top = 12
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
      TabOrder = 1
      OnClick = Guardar1Click
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
    object BbCancelar: TBitBtn
      Left = 462
      Top = 12
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
      TabOrder = 2
      OnClick = BbCancelarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF3537BE1F25B68383D2FF00FFFF00FFFF
        00FFFF00FFFF00FF7979CF7373C6D4D4EFFF00FFFF00FFFF00FFFF00FF7171CD
        1844F6194DF81031D22E2FB8DADAF3FF00FFFF00FF6B6BD00928D7092ED70313
        B36F6FCEFF00FFFF00FFFF00FF2E2FBF2451F91F52FF1D4FFF1744E8151CB4C4
        C4EB6767CC0D2EDD1142F90D3DF50B3BF0041ABCA1A1DCFF00FFFF00FFBCBCE8
        1832DB285BFF2456FF2253FF1B4BF1070FB00F30DD164AFE1344F91041F60E3E
        F60A3CF03F3FB5FF00FFFF00FFADADE81F37DD3A6FFF2C5EFF295AFF2657FF20
        52FC1C4FFF194AFD1646FA1445FA0F3DF21820B6BBBBE6FF00FFFF00FFFF00FF
        9898E71E29C93D6AFB3567FF2C5DFF2859FF2253FF1D4EFF1A4DFF123DED3335
        BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4444C82E4EE73668FF2E
        5EFF2859FF2254FF163DEA4040BCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFB1B1EA253FDF3B6DFF3464FF2E5EFF2759FF1B46EA2F2FBAFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3F3FD34B7CFF4170FF3B
        6BFF396CFF2D5EFF2558FF1336D76B6BD3FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFD2D2F6253BD95080FF4575FF3662FA0C13C13C6DFF2A5BFF2053FD0B1D
        C2B7B7EBFF00FFFF00FFFF00FFFF00FFFF00FF7373E1527CFA5081FF4B7DFF1E
        25CBBCBCEB2128CA386AFF2456FF1A4AF21C21B9FF00FFFF00FFFF00FFFF00FF
        FF00FF2E36DF6A9CFF5788FF2B46E7A2A2EBFF00FFCCCCF31A25CB3065FF1F51
        FF1439DD6262CDFF00FFFF00FFFF00FFFF00FF6D6DEA3951E25782FB3C3CD9FF
        00FFFF00FFFF00FFB7B7EF1729D4265AFF0F2EE32F30C3FF00FFFF00FFFF00FF
        FF00FFFF00FFC2C2F25A5AD4CECEF4FF00FFFF00FFFF00FFFF00FF9B9BE64242
        C9B5B5E8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object BbSalir: TBitBtn
      Left = 556
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Salir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Salir1Click
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
    object DBNavigator1: TDBNavigator
      Left = 18
      Top = 12
      Width = 120
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
      TabOrder = 0
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 291
    Width = 644
    Height = 107
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 644
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label6: TLabel
        Left = 366
        Top = 6
        Width = 47
        Height = 13
        Caption = 'Totales...:'
      end
      object DBEdit10: TDBEdit
        Left = 512
        Top = 3
        Width = 109
        Height = 18
        BorderStyle = bsNone
        DataField = 'TOTAL'
        DataSource = DMINV.DS_Sali
        TabOrder = 1
      end
      object DBEdit11: TDBEdit
        Left = 425
        Top = 3
        Width = 85
        Height = 18
        BorderStyle = bsNone
        DataField = 'TotalUnidades'
        DataSource = DMINV.DS_Sali
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 25
      Width = 644
      Height = 82
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Label10: TLabel
        Left = 21
        Top = 11
        Width = 37
        Height = 13
        Caption = 'Entreg'#243
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 12
        Top = 36
        Width = 46
        Height = 13
        Caption = 'Concepto'
      end
      object Label9: TLabel
        Left = 224
        Top = 11
        Width = 36
        Height = 13
        Caption = 'Recibi'#243
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit6: TDBEdit
        Left = 62
        Top = 6
        Width = 152
        Height = 21
        DataField = 'ENTREGO'
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
      object DBEdit4: TDBEdit
        Left = 62
        Top = 31
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
        Left = 62
        Top = 55
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
        TabOrder = 4
        OnDblClick = DBEdit5DblClick
        OnExit = DBEdit5Exit
      end
      object DBEdit7: TDBEdit
        Left = 267
        Top = 5
        Width = 145
        Height = 21
        DataField = 'RECIBIO'
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
      object BbCalcular: TBitBtn
        Left = 556
        Top = 44
        Width = 75
        Height = 25
        Caption = 'Calcular'
        Default = True
        TabOrder = 3
        OnClick = BbCalcularClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF9ECF9E29A02D3AA53ACAE7CAFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          1E942092E5B36CDA931EA62D6CBD6CFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF17901C7AD89A5BD0814FD98132C85D1C
          9B21A8DBA8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          158A1971D49050CB763ECC6D38D26C43DF7C21B53C47AB47DCF1DCFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF17891B6CD08B4BC67037C76433CC6639
          D36D43DD7A41DA73169F2283C483FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          18841B69CC8749C16B34C16030C66034CE6838D26C3FD87448E4812FC2542899
          28CEE7CEFF00FFFF00FFFF00FFFF00FF18811A6CC9864ABE6936BC5D2BBF592F
          C76133CC6636D06A3AD46E3FD97443DF7D2B942AFF00FFFF00FFFF00FFFF00FF
          177E1A70C8884FBB6A3BB95D29B9522BBE582EC35D30C96332CD6737D36D3BD8
          7529932BFF00FFFF00FFFF00FFFF00FF187B1979C78C57BA6E44B76133B55626
          B54E29BA542CC15B33CA6523B046278F27CCE5CCFF00FFFF00FFFF00FFFF00FF
          1A781C85CA9462BA7550B66840B35C31B2532AB65127B44E10871980BA80FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF1D781D94CEA070BC7E5FB87154B76B4B
          BA671C912D439743D9EBD9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          1F791FA6D4AD84C38E7CC48A54AC631D7D1FA2CCA2FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF237B22CDE7D29FCFA72D883064A164FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          90B890308431328232C3DAC3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 113
    Width = 644
    Height = 178
    TabStop = False
    Align = alClient
    Color = clInfoBk
    DataSource = DMINV.DS_Movs
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
        Title.Caption = 'Descripci'#243'n'
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
    Left = 64
    Top = 248
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
        Caption = '&Insertar Rengl'#243'n'
        Hint = 'Insertar Rengl'#243'n'
        ImageIndex = 16
      end
      object BorraRenglon: TMenuItem
        Caption = '&Eliminar Rengl'#243'n'
        Hint = 'Eliminar Rengl'#243'n'
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
    Left = 112
    Top = 272
    object InsertarRengln1: TMenuItem
      Caption = '&Insertar Rengl'#243'n'
      Hint = 'Insertar Rengl'#243'n'
      ImageIndex = 16
    end
    object BorrarRengln1: TMenuItem
      Caption = '&Eliminar Rengl'#243'n'
      Hint = 'Eliminar Rengl'#243'n'
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
  object QL_Tcmb: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASTCMB'
      'Where Tipo='#39'Combustible'#39
      'Order by Clave')
    Left = 24
    Top = 264
    object QL_TcmbCLAVE: TIntegerField
      FieldName = 'CLAVE'
      Origin = 'DBGASOL1.DGASTCMB.CLAVE'
    end
    object QL_TcmbNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Origin = 'DBGASOL1.DGASTCMB.NOMBRE'
      Size = 30
    end
    object QL_TcmbTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'DBGASOL1.DGASTCMB.TIPO'
      Size = 12
    end
    object QL_TcmbABREVIA: TStringField
      FieldName = 'ABREVIA'
      Origin = 'DBGASOL1.DGASTCMB.ABREVIA'
      Size = 6
    end
    object QL_TcmbUNIDAD: TStringField
      FieldName = 'UNIDAD'
      Origin = 'DBGASOL1.DGASTCMB.UNIDAD'
      Size = 10
    end
    object QL_TcmbTECLARAPIDA: TStringField
      FieldName = 'TECLARAPIDA'
      Origin = 'DBGASOL1.DGASTCMB.TECLARAPIDA'
      Size = 1
    end
    object QL_TcmbCUENTACNT: TStringField
      FieldName = 'CUENTACNT'
      Origin = 'DBGASOL1.DGASTCMB.CUENTACNT'
      Size = 16
    end
    object QL_TcmbCUENTACNTIVA: TStringField
      FieldName = 'CUENTACNTIVA'
      Origin = 'DBGASOL1.DGASTCMB.CUENTACNTIVA'
      Size = 16
    end
    object QL_TcmbCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBGASOL1.DGASTCMB.CODIGO'
      Size = 15
    end
  end
  object QL_Prod: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASPROD'
      'order by Clave')
    Left = 16
    Top = 216
    object QL_ProdCLAVE: TIntegerField
      FieldName = 'CLAVE'
      Origin = 'DBGASOL1.DGASPROD.CLAVE'
    end
    object QL_ProdDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DBGASOL1.DGASPROD.DESCRIPCION'
      Size = 40
    end
    object QL_ProdUNIDAD: TStringField
      FieldName = 'UNIDAD'
      Origin = 'DBGASOL1.DGASPROD.UNIDAD'
      Size = 16
    end
    object QL_ProdPRECIO: TFloatField
      FieldName = 'PRECIO'
      Origin = 'DBGASOL1.DGASPROD.PRECIO'
    end
    object QL_ProdCLAVEIVA: TIntegerField
      FieldName = 'CLAVEIVA'
      Origin = 'DBGASOL1.DGASPROD.CLAVEIVA'
    end
    object QL_ProdPRECIO_CIVA: TFloatField
      FieldName = 'PRECIO_CIVA'
      Origin = 'DBGASOL1.DGASPROD.PRECIO_CIVA'
    end
    object QL_ProdCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBGASOL1.DGASPROD.CODIGO'
      Size = 15
    end
  end
end
