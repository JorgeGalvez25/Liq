object FLIQVALE: TFLIQVALE
  Left = 193
  Top = 122
  Width = 650
  Height = 435
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Vales de Crédito'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 642
    Height = 31
    Align = alTop
    TabOrder = 0
    object Bevel1: TBevel
      Left = 272
      Top = 6
      Width = 215
      Height = 20
    end
    object DBText1: TDBText
      Left = 277
      Top = 10
      Width = 42
      Height = 13
      AutoSize = True
      DataField = 'DescripTurno'
      DataSource = DMGASQ.DSQ_Turca
    end
    object StaticText1: TStaticText
      Left = 496
      Top = 4
      Width = 127
      Height = 24
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSunken
      Caption = 'V a l e s'
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 337
    Width = 642
    Height = 71
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 642
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 204
        Height = 13
        Caption = '[M-Magna, P-Premium, D-Diesel, A-Aceites]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 25
      Width = 642
      Height = 46
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object SpeedButton2: TSpeedButton
        Left = 120
        Top = 10
        Width = 27
        Height = 25
        Hint = 'Refrescar'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000004000
          000080000000FF000000002000004020000080200000FF200000004000004040
          000080400000FF400000006000004060000080600000FF600000008000004080
          000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
          000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
          200080002000FF002000002020004020200080202000FF202000004020004040
          200080402000FF402000006020004060200080602000FF602000008020004080
          200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
          200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
          400080004000FF004000002040004020400080204000FF204000004040004040
          400080404000FF404000006040004060400080604000FF604000008040004080
          400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
          400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
          600080006000FF006000002060004020600080206000FF206000004060004040
          600080406000FF406000006060004060600080606000FF606000008060004080
          600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
          600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
          800080008000FF008000002080004020800080208000FF208000004080004040
          800080408000FF408000006080004060800080608000FF608000008080004080
          800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
          800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
          A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
          A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
          A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
          A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
          C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
          C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
          C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
          C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
          FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
          FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
          FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
          FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00929292929292
          9292929292929292929292929292929292929292929292929292929292929292
          9292929292929292929292929292929292929292929292929292929292929292
          9292929292929292929292929292929292929292929201929292929201010101
          0192929292920192929292920101010192929292929292019292929201010192
          9292929292929201929292920101920192929292929292019292929201929292
          0101929292920192929292929292929292920101010192929292929292929292
          9292929292929292929292929292929292929292929292929292929292929292
          9292929292929292929292929292929292929292929292929292}
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton2Click
      end
      object DBNavigator1: TDBNavigator
        Left = 13
        Top = 10
        Width = 108
        Height = 25
        DataSource = DMLIQ.DS_Pval
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 547
        Top = 11
        Width = 75
        Height = 25
        Caption = '&Salir'
        TabOrder = 1
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
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 31
    Width = 642
    Height = 306
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 497
      Height = 306
      Align = alLeft
      DataSource = DMLIQ.DS_Pval
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Title.Caption = 'Clave'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NombreCliente'
          Title.Caption = 'Cliente'
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Title.Alignment = taRightJustify
          Title.Caption = 'Cantidad'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Importe'
          Width = 72
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 497
      Top = 0
      Width = 145
      Height = 306
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel7: TPanel
        Left = 0
        Top = 144
        Width = 145
        Height = 162
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 145
        Height = 144
        Align = alClient
        DataSource = DMLIQ.DS_Vale
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'INDICEVALE'
            ReadOnly = True
            Title.Caption = 'No.'
            Width = 31
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE'
            Title.Alignment = taRightJustify
            Title.Caption = 'Importe'
            Width = 78
            Visible = True
          end>
      end
    end
  end
end
