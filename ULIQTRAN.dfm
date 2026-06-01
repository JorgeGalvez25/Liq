object FLIQTRAN: TFLIQTRAN
  Left = 343
  Top = 139
  BorderStyle = bsDialog
  Caption = 'Transacciones de Tarjetas'
  ClientHeight = 440
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 702
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 194
      Top = 10
      Width = 28
      Height = 13
      Caption = 'Filtrar '
    end
    object Label2: TLabel
      Left = 561
      Top = 13
      Width = 25
      Height = 13
      Caption = 'Filtrar'
    end
    object StaticText1: TStaticText
      Left = 5
      Top = 8
      Width = 153
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Transacciones del Turno Actual'
      Color = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
    end
    object StaticText2: TStaticText
      Left = 375
      Top = 8
      Width = 162
      Height = 17
      BorderStyle = sbsSunken
      Caption = 'Transacciones del d'#237'a sin Liquidar'
      Color = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
    end
    object ComboBox2: TComboBox
      Left = 227
      Top = 4
      Width = 102
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox2Change
    end
    object ComboBox1: TComboBox
      Left = 590
      Top = 6
      Width = 100
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = ComboBox2Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 256
    Width = 702
    Height = 184
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 702
      Height = 5
      Align = alTop
      BevelOuter = bvLowered
      Color = clSilver
      TabOrder = 0
    end
    object Panel6: TPanel
      Left = 0
      Top = 5
      Width = 702
      Height = 134
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object ListView1: TListView
        Left = 1
        Top = 1
        Width = 328
        Height = 132
        Align = alLeft
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
        Items.Data = {1D0000000100000000000000FFFFFFFFFFFFFFFF000000000000000000}
        ReadOnly = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
      end
      object ListView2: TListView
        Left = 376
        Top = 1
        Width = 325
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
        TabOrder = 2
        ViewStyle = vsReport
      end
      object Panel7: TPanel
        Left = 329
        Top = 1
        Width = 47
        Height = 132
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 139
      Width = 702
      Height = 45
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 2
      object BitBtn1: TBitBtn
        Left = 615
        Top = 10
        Width = 75
        Height = 25
        Caption = '&Salir'
        TabOrder = 0
        OnClick = BitBtn1Click
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
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 329
    Height = 223
    Align = alLeft
    Color = clInfoBk
    DataSource = DSL_Tran2
    PopupMenu = PopupMenu2
    TabOrder = 1
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
  object Panel3: TPanel
    Left = 329
    Top = 33
    Width = 44
    Height = 223
    Align = alLeft
    BevelOuter = bvLowered
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 12
      Top = 103
      Width = 23
      Height = 22
      Hint = 'Transacci'#243'n Actual'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEAC4A7C56E27F8E7D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECBD9ED46B04FFA200D47616F9E1
        CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5
        B293CB6202F89200FC9600FA9400D48842FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE0A889C45C01E98300EB8500E78100D28037FCF5
        EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDB9B7EBE5601D9
        7300DB7500D77100CC7F3FFEF7F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD39072B64D01CC6600CD6700C96200CA7F48FFFAF6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCD8A6BBB601FC15F0BBC5500BA
        5400C67F51FDFBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD19277BB6732C3743AB8590FB44C00C37643FCF7F4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7997FB45D2DC07440B9
        5C15BA5400C9783CFDF6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFDEA48AB55E2AC77D47C2681CC35D00CC7B36FDF4EDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4AF94BC
        6228D28A4ECF7521D06903D17B30FDF3EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAB89DC26924DD9954DC872ADE7B0AD482
        36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEEC1A6C66E22E8A659D1731AF7DCC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDC9AFC7742FF8E7D9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = AgregaraTurnoActual1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 12
      Top = 142
      Width = 23
      Height = 22
      Hint = 'Transacci'#243'n Actual'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E4D4C46D26ECC3A7FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF5D7BBD27C26FBC87ED07726EBBB9DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD37F36EDB36CF5B86CF9B85ACD
        6F1BE5AF92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBF4ECD27C34E69D4BEFA648F6A737CD6C10DEA487FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF6F0CD7D3CDF8D30ED
        9728F59716CD6703D6987CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEF7F4C87C43D97C17E98609F18B00CF6801D28B70FEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F7C2
        7A4BCF6A02E68000F28C00D66E00CA8767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFCF9F7C37A4CCA6501E07900EB8500D36A00CB88
        6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF8F3CA7A42CB
        6F15D87407DD7700C45C01D29074FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDF5EFCE7A39CC782ED27A26D67714BD5602D99D80FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF2E9D07C30CE854BCF8544D2
        8135BA590EE3AB8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD4863DD0966DD0946AD08E57BD5D17E8B698FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E3CFCF792BD39C79C16620EE
        C0A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9E9DDC8742FEEC8AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = QuitarTransaccindeesteTurno1Click
    end
    object SpeedButton5: TSpeedButton
      Left = 12
      Top = 180
      Width = 23
      Height = 22
      Hint = 'Todas las Transacciones'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECBE9AD39059FEFDFDFFFFFFFFFFFFFF
        FEFED29E64E1A275FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2C9A6
        DE8C3BE7A452DD9F74FFFFFFFFFFFFE5AB6FE6A95CDD8D3CEAB698FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFCD7521F6C37FF9BA63D67D25E0B197FDF0E6D6
        7A21F8C37DFABB5FCA6B1AEDCAB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7DEC9
        D17725F2AE53F7AA3BBF6011E1C4B7EDCBADD17C2AF1AB4FF7A837BD5B13F3DC
        D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4CCACCF721DEF9B2EF59716B1500EE9
        D6D0E2B28BD37E25EE9829F29210B2541DF8EBE5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEAB089D37315EC8808F18A00A84F1DF3E8E4D29566D67915EB8705EA84
        00AF5A32FBF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD59065CF6A01EA8400EC
        8600AD5B31FAF5F2C17746D77000EC8600E37E00B8704EFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD9986EC86301E37D00E68000AD592EF9F2EEBF703DD36D00E57F
        00D87300BA7A5BFFFFFFFFFFFFFFFFFFFFFFFFEEB790C6650FD87506DD7700A5
        4B1AF2E6E1CF8C59CB6E15D97304D67000B2633DFCF9F8FFFFFFFFFFFFFFFFFF
        F5CFB0C6671AD37E2BD67711AD4B0CE9D5CDDEA87AC77026D37C25D1720CB259
        26F9EFECFFFFFFFFFFFFFFFFFFF6DECACB6F21D08A4FD28237B45610E0C0B3EA
        C19CC8752FD0884BD07F33B65818F5E4DBFFFFFFFFFFFFFFFFFFFFFFFFD17B27
        D39E7BD08F5EC46A24E0B094FDF5EDD2771FD29E7BD18F5BBC6019F2D5C4FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF4CFAFD1803ECB8551DE9F71FFFFFFFFFFFFF6
        BE8FD38A51C67133EFC4A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        EDBE9AD39155FEFDFDFFFFFFFFFFFFFFFFFFE8AB7BE5B089FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = TraspasarTodas1Click
    end
    object SpeedButton6: TSpeedButton
      Left = 12
      Top = 65
      Width = 23
      Height = 22
      Hint = 'Todas las Transacciones'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3AE87D2
        8A53FEFDFCFFFFFFFFFFFFFDFAF8CB8148F0CCAFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEDC2A5D66D02F48D00D89E60FFFEFEFFFEFEC68A58F18B
        00D77308F5D8BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D1BFC15D07F99300FF
        9D00D47304F6E8D5C79875D37200FC9600FF9B00D17F32FFFFFFFFFFFFFFFFFF
        FFFFFFF4DED4B65511E88200ED8700D87201E7BD95D4A995C15C01EC8600EF89
        00CF6E11F8E5D4FFFFFFFFFFFFFFFFFFF8ECE6B0531FD67000DB7500D26C00DA
        A576DCBEB1B04D04DB7500E07A00C96307F7D7BFFFFFFFFFFFFFFFFFFFFAF4F2
        AE5A31C45E00CB6500C86200CE8C5AE7D1C8A6420BCB6500D06A00C25A02F0C5
        A6FFFFFFFFFFFFFFFFFFFFFFFFB86E4BBF651FBC5700BC5500C27540F0E1DAA7
        501FC26311BD5600B75100E0AC89FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE7C5C
        C0713EBC6424B54F00BC672DEDDAD1AA5326C57941B85911B24A00E1A883FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFCFAF9B66840BD7345BB6322B85400CB8044E5
        CCC3A85022C17543B95B10B85101F2C4A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FBF2EFB35F31C57E4CC46B23C15C01D9975FDDBCB0AF5927C77B43C46311C35C
        07F7D8BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E8E0B65D25D18C52CF7822CA
        6500E4AF7FD3A693BB6B35D08541CF7011CB6911F8E5D5FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4DCCDBE6325DE9B56E08926D36D03F9E2CBD19774CD8243DD91
        42DE8115D07C2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CDB6CA722BDD
        9240EBA666FEFEFEFEFDFDCF8A56DE9A56D3761CF3D0AFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEABC9BD89B63FEFDFDFFFFFFFFFFFFFCF9F7CC80
        44EFC7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphBottom
      ParentShowHint = False
      ShowHint = True
      OnClick = TraspasarTodas2Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 373
    Top = 33
    Width = 329
    Height = 223
    Align = alClient
    Color = clInfoBk
    DataSource = DSL_Tran
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    PopupMenu = PopupMenu1
    TabOrder = 3
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
  object QL_Tran: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select * from DGASTRAN'
      'where estacion=:pestacion and fecha=:pfecha '
      '  and (turnoliq=0 or turnoliq is null)'
      '  and estatus='#39'A'#39' '
      '  and tipoventa<>'#39'CO'#39
      'order by hora')
    Left = 480
    Top = 160
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
    object QL_TranISLA: TIntegerField
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
    object QL_TranBOMBA: TIntegerField
      FieldName = 'BOMBA'
      Origin = 'DBGASOL1.DGASTRAN.BOMBA'
    end
    object QL_TranFECHA: TDateTimeField
      FieldName = 'FECHA'
      Origin = 'DBGASOL1.DGASTRAN.FECHA'
    end
    object QL_TranTURNO: TIntegerField
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
    object QL_TranHORA: TDateTimeField
      FieldName = 'HORA'
      Origin = 'DBGASOL1.DGASTRAN.HORA'
      DisplayFormat = 'hh:mm'
      EditMask = '!99/99/0000;1;_'
      AttributeSet = 'Fecha'
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
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
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
  end
  object DSL_Tran: TDataSource
    DataSet = QL_Tran
    Left = 448
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 512
    Top = 152
    object AgregaraTurnoActual1: TMenuItem
      Caption = '&Traspasar'
      OnClick = AgregaraTurnoActual1Click
    end
    object AgregarlasdelMismoTurno1: TMenuItem
      Caption = 'Traspasar las del &Mismo Turno'
      OnClick = AgregarlasdelMismoTurno1Click
    end
    object TraspasarTodas2: TMenuItem
      Caption = 'Traspasar Todas'
      OnClick = TraspasarTodas2Click
    end
  end
  object QL_Tran2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'select * from DGASTRAN'
      'where estacion=:pestacion and fecha=:pfecha and turnoliq=:pturno'
      '  and estatus='#39'A'
      '  and tipoventa<>'#39'CO'#39
      'order by hora'
      '')
    Left = 96
    Top = 128
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
  object DSL_Tran2: TDataSource
    DataSet = QL_Tran2
    Left = 96
    Top = 176
  end
  object PopupMenu2: TPopupMenu
    Left = 176
    Top = 184
    object QuitarTransaccindeesteTurno1: TMenuItem
      Caption = 'Traspasar'
      OnClick = QuitarTransaccindeesteTurno1Click
    end
    object TraspasarTodas1: TMenuItem
      Caption = 'Traspasar Todas'
      OnClick = TraspasarTodas1Click
    end
  end
  object QL_Isla2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select Isla,Count(*) as Cantidad,Sum(Total) as Importe from DGAS' +
        'TRAN'
      'where estacion=:pestacion and fecha=:pfecha and turnoliq=:pturno'
      '  and estatus='#39'A'#39' '
      '  and Despachador<>0'
      '  and tipoventa<>'#39'CO'#39
      'Group By Isla'
      'Order by Isla')
    Left = 16
    Top = 192
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
  object QL_Isla: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'select Isla,Count(*) as Cantidad,Sum(Total) as Importe from DGAS' +
        'TRAN'
      'where estacion=:pestacion and fecha=:pfecha '
      '   and (turnoliq=0 or turnoliq is null)'
      '  and estatus='#39'A'#39
      '  and Despachador<>0'
      '  and tipoventa<>'#39'CO'#39
      'Group By Isla'
      'Order by Isla'
      '')
    Left = 432
    Top = 144
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
    object QL_IslaIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object QL_IslaCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
  end
  object QL_Islas: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Isla from DGASISLA'
      'where Estacion=:pEstacion'
      'Order by Isla')
    Left = 632
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pEstacion'
        ParamType = ptUnknown
      end>
    object QL_IslasISLA: TIntegerField
      FieldName = 'ISLA'
    end
  end
end
