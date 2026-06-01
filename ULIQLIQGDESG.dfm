object FLIQLIQGDESG: TFLIQLIQGDESG
  Left = 204
  Top = 119
  Width = 732
  Height = 401
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Desglose de Pagos en Liquidaciones'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    OnEnter = Panel1Enter
    object Label3: TLabel
      Left = 483
      Top = 11
      Width = 44
      Height = 13
      Caption = 'Estaci'#243'n '
    end
    object DBText1: TDBText
      Left = 530
      Top = 7
      Width = 155
      Height = 17
      Color = clHighlightText
      DataField = 'NOMBRE'
      DataSource = DMGAS.DS_Ests
      ParentColor = False
    end
    object Label4: TLabel
      Left = 16
      Top = 10
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object Sp1: TSpeedButton
      Left = 114
      Top = 6
      Width = 23
      Height = 22
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
      OnClick = Sp1Click
    end
    object MaskEdit3: TMaskEdit
      Left = 50
      Top = 6
      Width = 65
      Height = 21
      EditMask = '!99/99/0000;0;_'
      MaxLength = 10
      TabOrder = 0
      OnExit = MaskEdit3Exit
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 296
    Width = 724
    Height = 71
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 724
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 610
        Top = 8
        Width = 15
        Height = 13
        Caption = '$   '
      end
      object SpeedButton1: TSpeedButton
        Left = 695
        Top = 4
        Width = 24
        Height = 20
        Hint = 'Totaliza Desglose'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00770000000000
          0007770FFFFFFFFFFF07770FFFFF2FFFFF07770FFFF22FFFFF07770FFF22222F
          FF07770FFFF22FF2FF07770FFFFF2FF2FF07770FF2FFFFF2FF07770FF2FF2FFF
          FF07770FF2FF22FFFF07770FFF22222FFF07770FFFFF22FFFF07770FFFFF2FF0
          0007770FFFFFFFF0F077770FFFFFFFF007777700000000007777}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton1Click
      end
      object Label5: TLabel
        Left = 251
        Top = 6
        Width = 86
        Height = 13
        Caption = '[F2] Cuadrar Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object StaticText2: TStaticText
        Left = 618
        Top = 5
        Width = 76
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '       '
        Color = clHighlightText
        ParentColor = False
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 25
      Width = 724
      Height = 46
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object SpeedButton2: TSpeedButton
        Left = 144
        Top = 5
        Width = 35
        Height = 37
        Hint = 'Refrescar'
        Flat = True
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
          4100424242004343430044444400454545004646460047474700484848004D4C
          4B0052504F00575453005C585600615B5900655F5C0069625E006D6461007067
          630073696500766C6700796E69007B706B007E716C0080736E0082746F008376
          700087766F008A786F008C796F008D796E008F796D0091796C0092786B009377
          670094756200957662009677630096786500967A6800977C6D00978073009984
          78009C897F009D8D84009E918A00A0959000A29A9500A59E9900A8A19C00ACA5
          A000ADA8A600AFACAB00B1AFAE00B2B1B000B4B2B200B6B4B300B8B5B400B8B4
          B300B8B5B300BAB5B300BCB7B500BDB7B500BCB8B500BCB8B500BBB7B600BAB7
          B600B9B7B700B8B8B800B8B8B900B9B9B900BAB9B800BAB9B800BAB9B700BBB9
          B600BDB9B500C1BCB800C4BFBA00C6C1BC00C9C3BE00CBC5BF00CBC6C100CBC7
          C200CCC9C500CECCC900D0CFCD00D1D1D000D3D3D200D5D5D500D6D6D600D7D7
          D700D8D8D800D8D9D800DADAD900DDDCDB00DFDDDC00E1E0DF00E4E3E200E5E4
          E400E9E7E600EBEAE900ECECEB00EDEDED00EFEFEE00F0F0EF00F1F1F000F2F2
          F100F3F3F200F4F4F300F4F4F400F4F5F500F4F5F600F5F6F700F6F7F800F7F8
          F800F9FAFA00FAFBFB00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
          FC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FDFCFC00FCFAF800FBF6F100F9EF
          E400F8E7D400F7E1C800F6DBBC00F6D7B600F5D6B200F5D4AF00F4D2AB00F4D0
          A800F4CFA600F5CFA500F4CCA200F3CA9F00F4C89C00F6C79800F6C69500F6C4
          9200F6C39000F5C28F00F4C18D00F4C08A00F5BF8700F7BE8400F6BD8100F6BB
          7F00F5B97C00F5B87A00F3B77900F1B67800EEB47700EBB37800E8B17900E4B1
          7C00E1B07E00E0B07E00DFB07F00DFB07F00DFB07F00DEB07F00DEAF7D00DCAC
          7A00DCAA7700D9A67200E0A66A00E6A66200ECA65B00EEA55700F0A55400F2A5
          5100F3A44E00F3A24B00F2A14900EE9D4700EA994400E7953F00DD914100D78C
          3D00D1883B00CB833900C27E3800BC7B3700B97A3900B7763500BEBEBEBEBEBE
          A08B8598AEBEBEBEBEBEBEBEBEBEA771FEFFFF626E9FBEBEBEBEAE9FA5A7EBF8
          F4F5F7F7FF6AA1BEBEBEE9646EEBF7EFF3FAEBE2FAFF76BEBEBEF6DEFFEEDBF1
          FA8FBEBEAEEB7FB2BEBEECD1DBD7D7F88CBEBEBEBEBEC0BEBEBEDFD0CBCFDCFF
          70A1BEB2A7A3A09FAEBED3CCC4CFD5EFFF73996E6B66626283BEC8D5CCD6DDED
          EE8FFAEEE0D0C7EB69AEC0C8CFC8C6C4C1C0ECEDD1CBC7D562A5BEBEBEBEBEBE
          BEBEBEEBDECFCBD6629ABEBEAA98A7BEBEBE8FF8D7D6DED7648BBEBEC3FE6E91
          9A8BFAF1DBF8FEEDFE90BEBEC0EEFFFEFEFAF4F1F7EBA1E7CDB1BEBEBEC1F0F7
          F5F3F3F6EBA4BEBEBEBEBEBEBEBEC1DFF7F8F8E7AEBEBEBEBEBE}
        ParentShowHint = False
        ShowHint = True
      end
      object DBNavigator1: TDBNavigator
        Left = 4
        Top = 5
        Width = 140
        Height = 37
        DataSource = DSL_Liqg
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 614
        Top = 8
        Width = 75
        Height = 29
        Caption = '&Salir'
        TabOrder = 1
        OnClick = Salir1Click
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000400000800000
          8040008040008040008040008040008040008040000000004000008000008000
          00800000800000400000800000FF0000FF4000FF8000FF8000FF8000FF8000FF
          8000FF8000808000A0A000BF0000FF0000FF0000FF0000800000800000FF0000
          FF0000FF4000FF8000FF8000FF8000FF8000FF8000808000C0C000606000BF00
          00FF0000FF0000800000400000800000800000800000804000804000FFBF00FF
          BF00FFBF00808000C0C000808000606000800000800000400000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7F7F7FFFFF00FFFF00FFFF00808000C0C0008080008080
          00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF7F7F7F40404040
          4040404040808000C0C000808000808000404040FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF202000404040808080808080808080808000C0C0008080008080
          00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60600060600060606080
          8080808080808000A0A000202020808000404040FFFFFFFFFFFF7F7F7F7F7F7F
          7F7F7F7F7F7F808000DFDF00606000606060808080808000A0A0004040408080
          00404040FFFFFFFFFFFF606000C0C000C0C000C0C000DFDF00FFFF00DFDF0060
          6000606060808000C0C000808000808000404040FFFFFFFFFFFF808000FFFF40
          FFFF80FFFF80FFFF80FFFFBFFFFF40808000606060808000C0C0008080008080
          00404040FFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7F808000FFFF4080800060
          6060808080808000C0C000808000808000404040FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF808000808000606060808080808080808040C0C0008080008080
          00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20200040404080808080
          8080808080606060BFBF80A0A000808000404040FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7F7F7F808080808080808080808080606060BFBF80A0A0
          00404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F40404040
          4040404040404040404040202020808040606060FFFFFFFFFFFF}
      end
      object BbPrever: TBitBtn
        Left = 421
        Top = 10
        Width = 82
        Height = 29
        Caption = 'Prever'
        TabOrder = 2
        OnClick = BbPreverClick
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
      object BbImprimir: TBitBtn
        Left = 520
        Top = 9
        Width = 78
        Height = 29
        Caption = '&Imprimir'
        TabOrder = 3
        OnClick = BbPreverClick
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
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 33
    Width = 724
    Height = 105
    Align = alTop
    Color = clInfoBk
    DataSource = DSL_Liqg
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = DBGrid1Enter
    Columns = <
      item
        Expanded = False
        FieldName = 'FechaPaq'
        Title.Caption = 'Fecha'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FOLIO'
        Title.Caption = 'Folio'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ISLA'
        Title.Caption = 'Isla'
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NombreDespachador'
        Title.Caption = 'Despachador'
        Width = 268
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTGAS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total Gasolina'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALMA'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total Almac'#233'n'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTPAGO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total Pagado'
        Width = 80
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 138
    Width = 724
    Height = 158
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 724
      Height = 17
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 248
        Top = 4
        Width = 438
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Caption = 'Desglose de Pagos'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Copperplate Gothic Light'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object Panel7: TPanel
      Left = 0
      Top = 17
      Width = 724
      Height = 141
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 248
        Height = 139
        Align = alLeft
        Color = clInfoBk
        DataSource = DSL_Dliqp
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGrid1Enter
        Columns = <
          item
            Expanded = False
            FieldName = 'DescripcionPago'
            Title.Caption = 'Tipo de Pago'
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ImporteDesp'
            Title.Alignment = taRightJustify
            Title.Caption = 'Importe'
            Width = 67
            Visible = True
          end>
      end
      object DBGrid3: TDBGrid
        Left = 249
        Top = 1
        Width = 474
        Height = 139
        Align = alClient
        Color = clInfoBk
        DataSource = DSL_Dtpag
        PopupMenu = PopupMenu1
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGrid3DblClick
        OnEnter = DBGrid1Enter
        OnExit = DBGrid3Exit
        OnKeyDown = DBGrid3KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Title.Caption = 'Cliente'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Title.Caption = 'Nombre'
            Width = 227
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Caption = 'Referencia'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Importe'
            Width = 77
            Visible = True
          end>
      end
    end
  end
  object ActionList1: TActionList
    Images = DMGEN.ImgListDocu1
    Left = 216
    Top = 335
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = '&Guardar'
      Hint = 'Post'
      ImageIndex = 18
      DataSource = DSL_Dtpag
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      DataSource = DSL_Dtpag
    end
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insertar '
      Hint = 'Insert'
      ImageIndex = 16
      DataSource = DSL_Dtpag
    end
    object DataSetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Eliminar'
      Hint = 'Delete'
      ImageIndex = 17
      DataSource = DSL_Dtpag
    end
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Inicio'
      Hint = 'First'
      DataSource = DSL_Dtpag
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Fin'
      Hint = 'Last'
      DataSource = DSL_Dtpag
    end
  end
  object QL_Liqg: TQuery
    OnCalcFields = QL_LiqgCalcFields
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select *  from DGASLIQG'
      'where Estacion=:pEstacion and'
      '                 Caja=:pCaja and'
      '                 Fecha=:pFecha'
      'order by Fecha,Folio')
    Left = 8
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pEstacion'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCaja'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pFecha'
        ParamType = ptUnknown
      end>
    object QL_LiqgESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object QL_LiqgISLA: TIntegerField
      FieldName = 'ISLA'
      DisplayFormat = '000'
      EditFormat = '000'
      AttributeSet = 'Folio3NR'
    end
    object QL_LiqgFOLIO: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'FOLIO'
      DisplayFormat = '000000'
      EditFormat = '000000'
      AttributeSet = 'Folio6NR'
    end
    object QL_LiqgFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QL_LiqgDESPACHADOR: TIntegerField
      FieldName = 'DESPACHADOR'
    end
    object QL_LiqgNombreDespachador: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreDespachador'
      LookupDataSet = QL_Desp
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'DESPACHADOR'
      Size = 30
      Lookup = True
    end
    object QL_LiqgFechaPaq: TStringField
      FieldKind = fkCalculated
      FieldName = 'FechaPaq'
      Size = 12
      Calculated = True
    end
    object QL_LiqgTOTPAGO: TFloatField
      FieldName = 'TOTPAGO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object QL_LiqgTOTGAS: TFloatField
      FieldName = 'TOTGAS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object QL_LiqgTOTALMA: TFloatField
      FieldName = 'TOTALMA'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object QL_LiqgTOTGRAL: TFloatField
      FieldName = 'TOTGRAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object QL_LiqgCAJA: TIntegerField
      FieldName = 'CAJA'
      Origin = 'DBGASOL1.DGASLIQG.CAJA'
    end
    object QL_LiqgTURNO: TIntegerField
      FieldName = 'TURNO'
      Origin = 'DBGASOL1.DGASLIQG.TURNO'
    end
    object QL_LiqgAPLICADO: TStringField
      FieldName = 'APLICADO'
      Origin = 'DBGASOL1.DGASLIQG.APLICADO'
      Size = 2
    end
    object QL_LiqgCAMBIA_SALDOINI: TStringField
      FieldName = 'CAMBIA_SALDOINI'
      Origin = 'DBGASOL1.DGASLIQG.CAMBIA_SALDOINI'
      Size = 2
    end
  end
  object DSL_Liqg: TDataSource
    DataSet = QL_Liqg
    Left = 40
    Top = 261
  end
  object QL_Desp: TQuery
    DatabaseName = 'DBGASOL1'
    SQL.Strings = (
      'Select Clave,Nombre from DGASDESP'
      'Where Estacion=:pestacion'
      'Order by Clave')
    Left = 72
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pestacion'
        ParamType = ptUnknown
      end>
    object QL_DespCLAVE: TIntegerField
      FieldName = 'CLAVE'
    end
    object QL_DespNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 40
    end
  end
  object DSL_Dliqp: TDataSource
    DataSet = TL_Dliqp
    Left = 136
    Top = 264
  end
  object TL_Dtpag: TTable
    BeforeInsert = TL_DtpagBeforeInsert
    AfterInsert = TL_DtpagAfterInsert
    BeforeEdit = TL_DtpagBeforeInsert
    AfterPost = TL_DtpagAfterPost
    DatabaseName = 'DBGASOL2'
    IndexFieldNames = 'ESTACION;FOLIO;CLAVE_PAGO;INDICE'
    MasterFields = 'ESTACION;FOLIO;CLAVE_PAGO'
    MasterSource = DSL_Dliqp
    TableName = 'DGASDTPAG'
    Left = 384
    Top = 261
    object TL_DtpagESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object TL_DtpagFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object TL_DtpagCLAVE_PAGO: TStringField
      FieldName = 'CLAVE_PAGO'
      Size = 2
    end
    object TL_DtpagINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object TL_DtpagCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      OnChange = TL_DtpagCLIENTEChange
      DisplayFormat = '00000'
      EditFormat = '00000'
      AttributeSet = 'Folio5NR'
    end
    object TL_DtpagNOMBRE: TStringField
      FieldName = 'NOMBRE'
      Size = 50
    end
    object TL_DtpagREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 16
    end
    object TL_DtpagIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
  end
  object DSL_Dtpag: TDataSource
    DataSet = TL_Dtpag
    Left = 352
    Top = 261
  end
  object PopupMenu1: TPopupMenu
    Left = 272
    Top = 336
    object Insertar1: TMenuItem
      Action = DataSetInsert1
    end
    object Eliminar1: TMenuItem
      Action = DataSetDelete1
    end
    object Modificar1: TMenuItem
      Caption = 'Modificar'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Guardar1: TMenuItem
      Action = DataSetPost1
    end
    object Cancelar1: TMenuItem
      Action = DataSetCancel1
    end
  end
  object TL_Dliqp: TTable
    BeforePost = TL_DliqpBeforePost
    OnCalcFields = TL_DliqpCalcFields
    DatabaseName = 'DBGASOL1'
    IndexFieldNames = 'ESTACION;FOLIO'
    MasterFields = 'ESTACION;FOLIO'
    MasterSource = DSL_Liqg
    TableName = 'DGASDLIQP'
    Left = 104
    Top = 263
    object TL_DliqpDescripcionPago: TStringField
      FieldKind = fkLookup
      FieldName = 'DescripcionPago'
      LookupDataSet = DMGAS.T_Tpag
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'DESCRIPCION'
      KeyFields = 'CLAVE_PAGO'
      Lookup = True
    end
    object TL_DliqpDesglosa: TStringField
      FieldKind = fkLookup
      FieldName = 'Desglosa'
      LookupDataSet = DMGAS.T_Tpag
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'DESGLOSA'
      KeyFields = 'CLAVE_PAGO'
      Size = 2
      Lookup = True
    end
    object TL_DliqpESTACION: TIntegerField
      FieldName = 'ESTACION'
    end
    object TL_DliqpFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object TL_DliqpCLAVE_PAGO: TStringField
      FieldName = 'CLAVE_PAGO'
      Size = 2
    end
    object TL_DliqpFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object TL_DliqpTURNO: TIntegerField
      FieldName = 'TURNO'
    end
    object TL_DliqpIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
    end
    object TL_DliqpAPLICADO: TStringField
      FieldName = 'APLICADO'
      Size = 2
    end
    object TL_DliqpINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object TL_DliqpImporteDesp: TFloatField
      FieldKind = fkCalculated
      FieldName = 'ImporteDesp'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '########0.00'
      AttributeSet = 'ImpMoneda'
      Calculated = True
    end
  end
end
