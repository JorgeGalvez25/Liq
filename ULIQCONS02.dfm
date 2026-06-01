object FLIQCONS02: TFLIQCONS02
  Left = 294
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Consulta de Transacciones de Tarjetas'
  ClientHeight = 509
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 846
    Height = 60
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    OnEnter = Panel1Enter
    object Label2: TLabel
      Left = 11
      Top = 6
      Width = 59
      Height = 13
      Caption = 'Seleccionar '
    end
    object Label1: TLabel
      Left = 244
      Top = 6
      Width = 121
      Height = 13
      Caption = 'Transacciones de Tarjeta'
    end
    object Label7: TLabel
      Left = 687
      Top = 6
      Width = 60
      Height = 13
      Caption = 'Fecha Inicial'
    end
    object Label8: TLabel
      Left = 772
      Top = 6
      Width = 55
      Height = 13
      Caption = 'Fecha Final'
    end
    object Label10: TLabel
      Left = 412
      Top = 6
      Width = 72
      Height = 13
      Caption = 'Tipo de Tarjeta'
    end
    object Label11: TLabel
      Left = 550
      Top = 6
      Width = 67
      Height = 13
      Caption = 'Tipo de Carga'
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 11
      Top = 19
      Width = 214
      Height = 21
      Color = clInfoBk
      KeyField = 'CLAVE'
      ListField = 'Descripcion'
      ListSource = DMGAS.DS_Ests
      TabOrder = 0
      OnEnter = DBLookupComboBox2Enter
    end
    object ComboBox2: TComboBox
      Left = 243
      Top = 19
      Width = 150
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      ItemHeight = 13
      TabOrder = 1
      Text = 'Pendientes Facturar'
      Items.Strings = (
        'Pendientes Facturar'
        'Facturados'
        'Todos')
    end
    object MaskEdit1: TMaskEdit
      Left = 687
      Top = 19
      Width = 65
      Height = 21
      Color = clInfoBk
      EditMask = '!99/99/0000;0;_'
      MaxLength = 10
      TabOrder = 4
      OnExit = MaskEdit1Exit
    end
    object MaskEdit2: TMaskEdit
      Left = 772
      Top = 19
      Width = 65
      Height = 21
      Color = clInfoBk
      EditMask = '!99/99/0000;0;_'
      MaxLength = 10
      TabOrder = 5
    end
    object ComboBox5: TComboBox
      Left = 412
      Top = 19
      Width = 120
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      ItemHeight = 13
      TabOrder = 2
      Text = 'Todas'
      Items.Strings = (
        'Todas'
        'Credito'
        'Prepago')
    end
    object ComboBox3: TComboBox
      Left = 550
      Top = 19
      Width = 120
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        'Todas'
        'Manual'
        'Normal')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 456
    Width = 846
    Height = 53
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object Label9: TLabel
      Left = 315
      Top = 6
      Width = 38
      Height = 13
      Caption = 'Ordenar'
    end
    object BbSalir: TBitBtn
      Left = 727
      Top = 13
      Width = 75
      Height = 28
      Caption = '&Salir'
      TabOrder = 5
      OnClick = BbSalirClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000100000400000
        4000004030004020004010004030004020004010004030004020004010004030
        0020000000000010000040000040000040000040000040000040000040000010
        0000400000FF0000FF0000FF7F00FF8000FF8000FF7F00FF8000FF8000FF7F00
        FF8000FF8000FF7F00804000606000806000BF0000FF0000FF0000FF0000FF00
        00FF0000FF0000400000400000FF0000FF0000FF1000FF7F00FF6000FF9F00FF
        8000FF6000FF9F00FF8000FF6000FF9F00802000BFBF00D7D700503000CF0000
        FF0000FF0000FF0000FF0000FF0000400000400000FF0000FF0000FF0000FF00
        00FF8F00FF6000FF8000FF9F00FF6000FF8000FF9F00FF6000806000BFBF00DF
        DF00808000383800CF0000FF0000FF0000FF0000FF0000400000400000FF0000
        FF0000FF0000FF0000FF0000FF7F00FF8000FF8000FF7F00FF8000FF8000FF7F
        00804000BFBF00DFDF00808000808000503000BF0000FF0000FF0000FF000040
        0000100000400000400000400000400000400000401000402000403000FFCF00
        FFDF00FFEF00FFCF00808000BFBF00DFDF008080008080007878005030004000
        00400000400000100000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF404040FFFF00FFFF00FFFF00FFFF00808000BFBF00DFDF00808000808000
        808000404000606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF4040407F7F007F7F007F7F007F7F00404000BFBF00DF
        DF00808000808000808000404000606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF707070FFFFFF4040406060606060606060606060
        60303030BFBF00DFDF00808000808000808000404000606060FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF080800707060303030808080
        808080808080808080404040BFBF00DFDF008080008080008080004040006060
        60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20200060
        6000101000808080808080808080808080404040BFBF00DFDF00606000404000
        808000404000606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF383800B0B000686800383838808080808080808080404040BFBF00C7
        C700404030181818808000404000606060FFFFFFFFFFFFFFFFFFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFBF404000FFFF00B8B8006868004040307878788080
        80404040BFBF00C7C700707060303030808000404000606060FFFFFFFFFFFFFF
        FFFF101000404000404000404000404000404000707000FFFF00FFFF00B0B000
        606000404030808080404040BFBF00DFDF006060004040008080004040006060
        60FFFFFFFFFFFFFFFFFF383800DFDF00DFDF00DFDF00DFDF00DFDF00E7E700FF
        FF00FFFF00F7F700B0B000686800383838404040BFBF00DFDF00808000808000
        808000404000606060FFFFFFFFFFFFFFFFFF404000FFFF00FFFF8FFFFFBFFFFF
        BFFFFFBFFFFFBFFFFFBFFFFFEFFFFF8FEFEF00808000383838404040BFBF00DF
        DF00808000808000808000404000606060FFFFFFFFFFFFFFFFFF2020007F7F00
        7F7F007F7F007F7F007F7F009F9F00FFFF40FFFF7FEFEF008080004040308080
        80404040BFBF00DFDF00808000808000808000404000606060FFFFFFFFFFFFFF
        FFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF404000FFFF20FFFF10808000
        404030787878808080404040BFBF00DFDF008080008080008080004040006060
        60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404000EF
        EF00808000383838808080808080808080404040BFBF30DFDF00808000808000
        808000404000606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF303000808000101000808080808080808080808080606060707070EF
        EF60A0A000808000808000404000606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF0808007070603030308080808080808080808080
        80808080686868707060EFEF60989800808000404000606060FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF404040808080
        808080808080808080808080808080686868707070EFEF609898004040006060
        60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF404040808080808080808080808080808080808080808080606060707070
        EFEF60606000606060FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF40404020202020202020202020202020202020202020
        2020202020080808404030202000A7A7A7FFFFFFFFFFFFFFFFFF}
    end
    object BbCalcular: TBitBtn
      Left = 479
      Top = 13
      Width = 75
      Height = 28
      Caption = '&Calcular'
      Default = True
      TabOrder = 2
      OnClick = BbCalcularClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00058607FF9DCD9DFFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0048DB79FF008E00FF017A01FFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF003FD770FF0C9B0EFF008D00FF008900FF158115FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0045DE75FF66F999FF008C00FF008A00FF008800FF0082
        00FF48A048FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF004AE37AFF57ED89FF23BC41FF22BC43FF22BC45FF26C1
        4FFF159E2AFF85C085FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF004EE780FF4FD869FF13AC28FF19B234FF16AB2FFF3A9F
        3AFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0054EF88FF09A418FF14AD2AFF0E8C0EFFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0047D463FF029303FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008ED08EFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BbImprimir: TBitBtn
      Left = 644
      Top = 13
      Width = 75
      Height = 28
      Caption = '&Imprimir'
      TabOrder = 4
      OnClick = BbImprimirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000890B0000890B00000001000000010000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003B3C3C003C3D3D003D3D3E003E3E3E003E3F3F003F40
        4000414141004142420042424300434343004445450046464600484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        51005252520053535300545454005555550057575700595959005B5B5B005D5C
        5C005E5E5E00605F5F0061616100606060005F5F5F005E5E5F005C5D5E005B5C
        5D005A5B5C00595A5B0058595B0057595A0057585A0056585900565759005657
        59005657590056585A0057585A0057595B00585A5B005A5B5C005B5C5E005D5E
        5F005F6061006162630064646500676768006B6B6B006E6E6F00737272007474
        7400757474007575750076767600777676007877770078787700787777007877
        7700787776007777760077767600777676007776760077777700777777007777
        7700787878007879790079797900797A7A00797A7B007B7B7C007C7C7D007D7E
        7E007F80810082828300848485008586870087888900898A8B008B8D8E008E8F
        90008F919200919395009395970096989A00989B9C00999C9D009B9D9E009D9F
        A0009FA0A100A2A3A300A6A6A600A7A9AA00A8ABAD00ABADAD00AFAEAE00B1B0
        AF00B3B2B100B3B4B400B6B6B400B7B6B300B9B5B000BBB3A900BEB1A000C0AF
        9900C3AD9000C5AA8800C7A77E00CBA47300CFA26A00D4A16200D9A15C00DCA0
        5800DEA15600E0A15300E1A35700E2A55B00E3A75D00E5AA6200E6AD6700E6B0
        6C00E5B27100E5B37500E4B57A00E3B77F00E2B98400E0BB8B00E1C09400E3C3
        9800E6C79E00E7CBA600E9CEAB00E9D2B200E9D5B900E8D7C000E8D9C400E8DA
        C700E8DBCA00E8DCCC00E9DDCE00E9DFD100EBE3D700EEE7DD00F0EBE300F2EE
        E700F4F0EA00F5F2EC00F6F3EE00F8F4ED00F9F5ED00F9F6EF00FAF7F000FAF8
        F200FCFAF800FDFCFB00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFD
        FD00FCFCFC00FAFAFA00F9F9F900F7F7F700F2F2F200EDEEEE00E8E9E900E4E4
        E500E2E2E300E1E1E100DFDFDF00DDDDDC00DCDCDB00DAD9D800D9D8D600D7D6
        D300D4D3D000D1CFCD00CECDCA00CDCBC800CAC8C400C9C6C000E5E5E5EDE5E5
        E5E5E5E5E5E5E5EDE5E5E5E5E5E5E5F5ACFAEDE5E5E5E5E5E5E5E5E5E5F5AC9A
        94919AACF2E5E5E5E5E5E5EFAC9F9A969477769196A4FAEDE5E5F2A89D9FA2FF
        A8913E4663768B99FDE5ACA2ACFDF5FAACA89773453E466392F2ACF5F2F2F5FA
        ACACB2B5B59572778BACFDEFF2F2F2FAFEAFBBBBBBB9ACAC97FEFDF2EFF2F2FD
        FEB5C0BFBBBBA6AB99F2F5F2EDF0F2F8C8C1C1BFBBB9A6A2A4E5EDF5F5F5F8CE
        C4C4C1C0BBC8FDA4F2E5E5E5FFD2C9C5C4C1C0BEB6FFACF5E5E5E5EDFFDED9CF
        CCCAB5C8F2F2EDE5E5E5E5F2F8E0DEE0E0D99DF1E5E5E5E5EDE5E5F5FAF5F7F7
        D1FFACEDE5E5E5E5E5E5E5EDF2F5F5FAFAFDEFE5E5E5E5E5E5E5}
    end
    object DBNavigator1: TDBNavigator
      Left = 11
      Top = 11
      Width = 120
      Height = 25
      DataSource = DSQL_Tran
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
    object BbPrever: TBitBtn
      Left = 562
      Top = 13
      Width = 75
      Height = 28
      Caption = 'Prever'
      TabOrder = 3
      OnClick = BbImprimirClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000890B0000890B00000001000000010000000000000101
        0100020202000303030004040400050505000606060007070700080808000909
        09000A0A0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F00101010001111
        1100121212001313130014141400151515001616160017171700181818001919
        19001A1A1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F00202020002121
        2100222222002323230024242400252525002626260027272700282828002929
        29002A2A2A002B2B2B002C2C2C002D2D2D002E2E2E002F2F2F00303030003131
        3100323232003333330034343400353535003636360037373700383838003939
        39003A3A3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F00404040004141
        4100424242004343430044444400454545004646460047474700484848004949
        49004A4A4A004B4B4B004C4C4C004D4D4D004E4E4E004F4F4F00505050005151
        5100525252005353530054545400555555005656560057575700585858005959
        59005A5A5A005B5B5B005C5C5C005F5E5E006361600066646200696664006D69
        6700716C6900746E6B0077706C0079726E007B736F007C7470007E7570007F76
        71008076720081777200827872008378730083797500837A7600827B7800817B
        7A00807C7C007E7D7F007D7F82007C8086007A828A0079848F00768694007A8E
        A3007D95B000819DBD0084A4C80087A8CE0087ACD4008EB2D8009CBBD900AAC5
        DF00B6CEE400C8D8E600D6E0E900DCE3E900E1E6EA00E4E8EA00E8E9EB00EAEA
        EB00EBEBEB00ECECEB00EDECEB00EFEDEA00F0EDE900F1EDE800F4EEE600F5EE
        E500F6EFE500F6EFE500F7EFE500F8F0E400F8F1E600F9F2E700FAF3E900FBF5
        EA00FBF6EF00FCF8F200FCF9F400FCFBF700FDFCFB00FDFDFD00FDFDFD00FDFD
        FD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFD00FDFDFC00FDFDFC00FDFD
        FC00FCFCFA00FBFAF700FAF8F500F9F7F200F8F5F000F7F5F000F7F3EE00F5F1
        EA00F3EFE700F2EDE400F0EAE100EEE8DE00EBE5DC00EAE3DB00E7E1D800E5DF
        D600E4DDD500E4DDD400E2DBD200E1DACF00E0D8CD00DED7CD00DDD5CA00DDD3
        C800DED3C600DFD3C400E0D2C100E0D1BF00DFCFBD00DDCCB900E1CEB400E0CC
        AF00E0CAAA00DFC8A500E0C8A100E0C79D00DCC49B00DBC29A00DAC09900D9C0
        9C00D7C09F00D5BFA200D4BEA400D1BDA800D0BCAC00CFBCAD00CEBCAE00CCBB
        B000C9BAB000C8B9AF00C5B9AF00C3B8AF00C0B8B100BEB7B000BBB6B100B8B5
        B200B5B3B100B3B2B000B1B1B000AFAFAE00AEAEAC00AAACAE00A7ABAF00A2A9
        B1009DA7B50095A4BA008CA1C000839DC6007E9CCB007B9BCE00799ACF007A99
        CD007A98CA007B97C6007D97C3008096BD008395B6008993A9008F919E009290
        9900979095009B919100A1928C00A1908800A18F8400A08F8600A4ABDEE7E5E7
        E7E5E7E7E7E5E2DE89A4A4C7FEFEFEFEFEFEFEFEFEFCF870E8A4A4DEBB9B9898
        98989198957E7FE9E9AFA4D9B99CB1989C989B91EF7E7EF3B9A4A4D9B99B98B1
        C0C2C1E2F07EF0F9B1A4A4D9B9A48DDDD0D0D0FCE77FC26F8CA4A4D9B7A4D9D0
        CDCDCDCFE798C66F8CA4A4D8B6A4DCC9C8C9CDCDD58EC46F8CA4A4D9B6A4D995
        97B5C9CDD589C56F8DA4A4D8B6A4C0B99C99C8CDDE9CC26F89A4A4D9B6A4AFC0
        C3C5D4DEB1A4C26F8DA4A4D8B6A4A4ACB9C0C0BFBDC2FCE6ABA4A4D8B6A4A4A4
        A4A4AFDDD0FEFC8DA4A4A4D8B6A4A4A4AFA4AFD5D0DFAFA4A4A4A4C7B6A4A4A4
        A4A4AFFCE68CA4A4A4A4A4C7DDD9DBDBDBDBDDE689A4A4A4A4A4}
    end
    object ComboBox1: TComboBox
      Left = 315
      Top = 19
      Width = 106
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      ItemHeight = 13
      TabOrder = 7
      Text = 'Fecha'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Fecha'
        'Cliente'
        'Factura'
        'Folio Volum'#233'trico')
    end
    object CheckBox1: TCheckBox
      Left = 148
      Top = 3
      Width = 149
      Height = 17
      Caption = 'Filtrar Cliente Seleccionado'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      OnClick = FiltrarClienteClick
    end
    object CheckBox2: TCheckBox
      Left = 148
      Top = 19
      Width = 133
      Height = 17
      Caption = 'Filtrar Fecha Selecciada'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 6
      OnClick = FiltrarFechaClick
    end
    object CheckBox3: TCheckBox
      Left = 148
      Top = 34
      Width = 144
      Height = 17
      Caption = 'Filtrar Factura Selecciada'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 8
      OnClick = FiltrarFacturaClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 300
    Width = 846
    Height = 156
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 846
      Height = 156
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 108
        Width = 844
        Height = 47
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object DBText2: TDBText
          Left = 46
          Top = 7
          Width = 257
          Height = 15
          Color = clInfoBk
          DataField = 'NombreCliente'
          DataSource = DSQL_Tran
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 340
          Top = 6
          Width = 39
          Height = 17
          Alignment = taCenter
          Color = clInfoBk
          DataField = 'Referencia'
          DataSource = DSQL_Tran
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 426
          Top = 5
          Width = 68
          Height = 13
          Caption = 'Buscar Cliente'
          Enabled = False
        end
        object DBText1: TDBText
          Left = 46
          Top = 26
          Width = 257
          Height = 15
          Color = clInfoBk
          DataField = 'NombreDespachador'
          DataSource = DSQL_Tran
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 35
          Height = 13
          Caption = 'Cliente:'
        end
        object Label5: TLabel
          Left = 15
          Top = 26
          Width = 28
          Height = 13
          Caption = 'Desp.'
        end
        object Label6: TLabel
          Left = 312
          Top = 8
          Width = 20
          Height = 13
          Caption = 'Ref.'
        end
        object sbbuscar: TSpeedButton
          Left = 736
          Top = 17
          Width = 23
          Height = 22
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777747777777777777774477777474747444
            4447777777777777447777777777777747777777777777777777000777000777
            7777000777000777777708007080077777770700707007777777000000000777
            7777708000807777777777007007777777777700700777777777}
          OnClick = SBBuscarClick
        end
        object Edit1: TEdit
          Left = 426
          Top = 18
          Width = 311
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 0
          OnDblClick = SBBuscarClick
          OnEnter = Edit1Enter
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 844
        Height = 107
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object ListView2: TListView
          Left = 423
          Top = 1
          Width = 420
          Height = 105
          Align = alClient
          Color = clInfoBk
          Columns = <
            item
              Caption = 'Resumen'
              Width = 60
            end
            item
              Alignment = taCenter
              Caption = 'Isla'
            end
            item
              Alignment = taRightJustify
              Caption = 'Litros'
              Width = 68
            end
            item
              Alignment = taRightJustify
              Caption = 'Imp.Comb.'
              Width = 72
            end
            item
              Alignment = taRightJustify
              Caption = 'Imp.Otros'
              Width = 65
            end
            item
              Alignment = taRightJustify
              Caption = 'Total'
              Width = 72
            end>
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLines = True
          ParentFont = False
          TabOrder = 1
          ViewStyle = vsReport
        end
        object ListView1: TListView
          Left = 1
          Top = 1
          Width = 422
          Height = 105
          Align = alLeft
          Color = clInfoBk
          Columns = <
            item
              Caption = 'Resumen'
              Width = 57
            end
            item
              Alignment = taCenter
              Caption = 'Combustible'
              Width = 70
            end
            item
              Alignment = taRightJustify
              Caption = 'Litros'
              Width = 70
            end
            item
              Alignment = taRightJustify
              Caption = 'Imp.Comb.'
              MaxWidth = 120
              Width = 75
            end
            item
              Alignment = taRightJustify
              Caption = 'Imp.Otros'
              Width = 70
            end
            item
              Alignment = taRightJustify
              Caption = 'Total'
              Width = 75
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
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 60
    Width = 846
    Height = 240
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    LookAndFeel.Kind = lfStandard
    object cxGrid1DBTableView1: TcxGridDBTableView
      PopupMenu = PopupMenu1
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DSQL_Tran
      DataController.Filter.OnChanged = cxGrid1DBTableView1DataControllerFilterChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,##0.00'
          Kind = skSum
          FieldName = 'IMPORTECMB'
          Column = cxGrid1DBTableView1IMPORTECMB
        end
        item
          Format = '#,##0.00'
          Kind = skSum
          FieldName = 'IMPORTEOTR'
          Column = cxGrid1DBTableView1IMPORTEOTR
        end
        item
          Format = '#,##0.00'
          Kind = skSum
          FieldName = 'TOTAL'
          Column = cxGrid1DBTableView1TOTAL
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.Footer = True
      OptionsView.GridLines = glVertical
      OptionsView.GroupByBox = False
      Styles.ContentEven = DMGEN.cxStyle1
      Styles.ContentOdd = DMGEN.cxStyle2
      Styles.Header = DMGEN.cxStyle3
      object cxGrid1DBTableView1FolioTran: TcxGridDBColumn
        Caption = 'Folio'
        DataBinding.FieldName = 'FolioTran'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 66
      end
      object cxGrid1DBTableView1FOLIOVOLUMETRICO: TcxGridDBColumn
        Caption = 'Folio Volum.'
        DataBinding.FieldName = 'FOLIOVOLUMETRICO'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 80
      end
      object cxGrid1DBTableView1FechaPaq: TcxGridDBColumn
        Caption = 'Fecha'
        DataBinding.FieldName = 'FechaPaq'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 67
      end
      object cxGrid1DBTableView1TURNO: TcxGridDBColumn
        Caption = 'Turno'
        DataBinding.FieldName = 'TURNO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Options.Filtering = False
        Width = 36
      end
      object cxGrid1DBTableView1ClientePaq: TcxGridDBColumn
        Caption = 'Cliente'
        DataBinding.FieldName = 'ClientePaq'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Width = 55
      end
      object cxGrid1DBTableView1Factura: TcxGridDBColumn
        DataBinding.FieldName = 'Factura'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 73
      end
      object cxGrid1DBTableView1FechaFacPaq: TcxGridDBColumn
        Caption = 'Fecha.Fact.'
        DataBinding.FieldName = 'FechaFacPaq'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 80
      end
      object cxGrid1DBTableView1ISLA: TcxGridDBColumn
        Caption = 'Isla'
        DataBinding.FieldName = 'ISLA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 29
      end
      object cxGrid1DBTableView1DESPACHADOR: TcxGridDBColumn
        Caption = 'Desp.'
        DataBinding.FieldName = 'DESPACHADOR'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 39
      end
      object cxGrid1DBTableView1NombreCombustible: TcxGridDBColumn
        Caption = 'Comb.'
        DataBinding.FieldName = 'NombreCombustible'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 43
      end
      object cxGrid1DBTableView1LITROS: TcxGridDBColumn
        Caption = 'Litros'
        DataBinding.FieldName = 'LITROS'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taRightJustify
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 56
      end
      object cxGrid1DBTableView1IMPORTECMB: TcxGridDBColumn
        Caption = 'Imp. Comb.'
        DataBinding.FieldName = 'IMPORTECMB'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taRightJustify
        Options.Filtering = False
        Width = 66
      end
      object cxGrid1DBTableView1IMPORTEOTR: TcxGridDBColumn
        Caption = 'Otros'
        DataBinding.FieldName = 'IMPORTEOTR'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taRightJustify
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object cxGrid1DBTableView1TOTAL: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'TOTAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taRightJustify
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object QL_Tran: TQuery
    OnCalcFields = QL_TranCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select * from DGASTRAN'
      'Where fecha>=:pfechaini and fecha<=:pfechafin'
      'and facturado='#39'No'#39' and tipoventa=:ptipoventa '
      'Order by cliente,Fecha')
    Left = 24
    Top = 176
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pfechaini'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pfechafin'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ptipoventa'
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
    end
    object QL_TranTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASTRAN.TURNO'
      DisplayFormat = '00'
    end
    object QL_TranHORA: TDateTimeField
      FieldName = 'HORA'
      Origin = 'DBGASOL1.DGASTRAN.HORA'
    end
    object QL_TranCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = 'DBGASOL1.DGASTRAN.CLIENTE'
      DisplayFormat = '00000'
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
      DisplayFormat = '###,###,##0.00'
    end
    object QL_TranIMPORTECMB: TFloatField
      FieldName = 'IMPORTECMB'
      Origin = 'DBGASOL1.DGASTRAN.IMPORTECMB'
      DisplayFormat = '###,###,##0.00'
    end
    object QL_TranIMPORTEOTR: TFloatField
      FieldName = 'IMPORTEOTR'
      Origin = 'DBGASOL1.DGASTRAN.IMPORTEOTR'
      DisplayFormat = '###,###,##0.00'
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
      DisplayFormat = '000'
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
    object QL_TranFechaPaq: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaPaq'
      Size = 12
      Calculated = True
    end
    object QL_TranClientePaq: TStringField
      FieldKind = fkCalculated
      FieldName = 'ClientePaq'
      Size = 8
      Calculated = True
    end
    object QL_TranFactura: TStringField
      FieldKind = fkCalculated
      FieldName = 'Factura'
      Size = 12
      Calculated = True
    end
    object QL_TranFechaFacPaq: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaFacPaq'
      Size = 12
      Calculated = True
    end
    object QL_TranReferencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'Referencia'
      Size = 3
      Calculated = True
    end
    object QL_TranFolioTran: TStringField
      FieldKind = fkCalculated
      FieldName = 'FolioTran'
      Size = 10
      Calculated = True
    end
    object QL_TranNombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'ABREVIA'
      KeyFields = 'COMBUSTIBLE'
      Size = 6
      Lookup = True
    end
    object QL_TranNombreCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCliente'
      LookupDataSet = DMGEN_VTAS.T_Clie
      LookupKeyFields = 'NOCLIE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'CLIENTE'
      Size = 40
      Lookup = True
    end
    object QL_TranNombreDespachador: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreDespachador'
      LookupDataSet = DMGAS.T_Desp
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'DESPACHADOR'
      Size = 30
      Lookup = True
    end
    object QL_TranFOLIOVOLUMETRICO: TIntegerField
      FieldName = 'FOLIOVOLUMETRICO'
      Origin = 'DBGASOL1.DGASTRAN.FOLIOVOLUMETRICO'
      DisplayFormat = '00000000'
    end
  end
  object DSQL_Tran: TDataSource
    DataSet = QL_Tran
    Left = 80
    Top = 184
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 371
    Top = 334
    object FiltrarCliente: TMenuItem
      Caption = 'Filtrar Cliente'
      OnClick = FiltrarClienteClick
    end
    object FiltrarFecha: TMenuItem
      Caption = 'Filtrar Fecha'
      OnClick = FiltrarFechaClick
    end
    object FiltrarFactura: TMenuItem
      Caption = 'Filtrar Factura'
      OnClick = FiltrarFacturaClick
    end
    object VerFotografias: TMenuItem
      Caption = '&Ver fotograf'#237'as'
      OnClick = VerFotografiasClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
  object QL_Tran2: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select Combustible,Sum(Litros) as Cantidad, Sum(ImporteCmb) as I' +
        'mporteCmb,'
      
        '                               Sum(ImporteOtr) as ImporteOtros, ' +
        'Sum(Total) as Total'
      '  from DGASTRAN'
      'Group by combustible'
      'order by combustible'
      ' ')
    Left = 24
    Top = 208
    object QL_Tran2COMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object QL_Tran2CANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object QL_Tran2IMPORTECMB: TFloatField
      FieldName = 'IMPORTECMB'
    end
    object QL_Tran2IMPORTEOTROS: TFloatField
      FieldName = 'IMPORTEOTROS'
    end
    object QL_Tran2TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object QL_Tran2NombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGAS.T_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Lookup = True
    end
  end
  object QL_Tran3: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      
        'Select Isla,Sum(Litros) as Cantidad, Sum(ImporteCmb) as ImporteC' +
        'mb,'
      
        '                               Sum(ImporteOtr) as ImporteOtros, ' +
        'Sum(Total) as Total'
      '  from DGASTRAN'
      'Group by Isla'
      'order by Isla'
      ' ')
    Left = 56
    Top = 224
    object QL_Tran3ISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object QL_Tran3CANTIDAD: TFloatField
      FieldName = 'CANTIDAD'
    end
    object QL_Tran3IMPORTECMB: TFloatField
      FieldName = 'IMPORTECMB'
    end
    object QL_Tran3IMPORTEOTROS: TFloatField
      FieldName = 'IMPORTEOTROS'
    end
    object QL_Tran3TOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
