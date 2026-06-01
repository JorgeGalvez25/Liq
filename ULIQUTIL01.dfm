object FLIQUTIL01: TFLIQUTIL01
  Left = 194
  Top = 113
  Width = 769
  Height = 401
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Reclasificación de Vales Pendientes por Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 81
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 7
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label3: TLabel
      Left = 80
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object MaskEdit3: TMaskEdit
      Left = 16
      Top = 20
      Width = 57
      Height = 21
      TabOrder = 0
      OnDblClick = MaskEdit3DblClick
      OnEnter = MaskEdit3Enter
      OnExit = MaskEdit3Exit
    end
    object StaticText5: TStaticText
      Left = 80
      Top = 20
      Width = 377
      Height = 19
      AutoSize = False
      BorderStyle = sbsSunken
      Color = clHighlightText
      ParentColor = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 303
    Width = 761
    Height = 71
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 761
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object DBText2: TDBText
        Left = 308
        Top = 4
        Width = 68
        Height = 17
        Alignment = taRightJustify
        Color = clInfoBk
        DataField = 'TOTALVALES'
        DataSource = DMGAS.DS_Turc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 291
        Top = 7
        Width = 15
        Height = 13
        Caption = '$   '
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 25
      Width = 761
      Height = 46
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object SpeedButton2: TSpeedButton
        Left = 116
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
        Left = 9
        Top = 10
        Width = 108
        Height = 25
        DataSource = DMLIQ.DS_Pval
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 666
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
    Top = 81
    Width = 761
    Height = 222
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 401
      Height = 222
      Align = alLeft
      Color = clInfoBk
      DataSource = DSTL_Pval
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColExit = DBGrid1ColExit
      OnDblClick = DBGrid1DblClick
      OnExit = DBGrid1Exit
      Columns = <
        item
          Expanded = False
          FieldName = 'SUBCODIGO'
          Title.Caption = 'Refer'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Cant'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Importe'
          Width = 59
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 401
      Top = 0
      Width = 360
      Height = 222
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 360
        Height = 222
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 1
          Height = 220
          Align = alLeft
          BevelOuter = bvNone
          Color = clBackground
          TabOrder = 0
        end
        object Panel9: TPanel
          Left = 2
          Top = 1
          Width = 357
          Height = 220
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label4: TLabel
            Left = 8
            Top = 168
            Width = 3
            Height = 13
          end
          object DBGrid3: TDBGrid
            Left = 0
            Top = 101
            Width = 357
            Height = 119
            Align = alBottom
            Color = clInfoBk
            DataSource = DMLIQ.DS_Dval
            PopupMenu = PopupMenu3
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnColEnter = DBGrid3ColEnter
            OnDblClick = DBGrid3DblClick
            OnExit = DBGrid3Exit
            OnKeyDown = DBGrid3KeyDown
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'PRODUCTO'
                Title.Alignment = taCenter
                Title.Caption = 'Clave'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUBCLAVE'
                Title.Alignment = taCenter
                Title.Caption = 'Prod.'
                Width = 39
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descripcion'
                Width = 132
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANTIDAD'
                Title.Alignment = taRightJustify
                Title.Caption = 'Cant'
                Width = 43
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMPORTE'
                Title.Alignment = taRightJustify
                Title.Caption = 'Importe'
                Width = 65
                Visible = True
              end>
          end
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 357
            Height = 101
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Panel11: TPanel
              Left = 0
              Top = 99
              Width = 357
              Height = 2
              Align = alBottom
              BevelOuter = bvNone
              Color = clBackground
              TabOrder = 0
            end
            object DBGrid2: TDBGrid
              Left = 0
              Top = 0
              Width = 97
              Height = 99
              Align = alLeft
              Color = clInfoBk
              DataSource = DSTL_Vale
              PopupMenu = PopupMenu2
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnKeyDown = DBGrid2KeyDown
              OnKeyPress = DBGrid2KeyPress
              Columns = <
                item
                  Expanded = False
                  FieldName = 'IMPORTE'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'V a l e'
                  Width = 56
                  Visible = True
                end>
            end
            object Memo1: TMemo
              Left = 97
              Top = 0
              Width = 260
              Height = 99
              Align = alClient
              BorderStyle = bsNone
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
        end
      end
    end
  end
  object ActionList1: TActionList
    Images = DMGEN.ImgListDocu1
    Left = 480
    Top = 343
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = '&Guardar'
      Hint = 'Post'
      ImageIndex = 18
      DataSource = DMLIQ.DS_Pval
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      DataSource = DMLIQ.DS_Pval
    end
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insertar '
      Hint = 'Insert'
      ImageIndex = 16
      DataSource = DMLIQ.DS_Pval
    end
    object DataSetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Eliminar'
      Hint = 'Delete'
      ImageIndex = 17
      DataSource = DMLIQ.DS_Pval
    end
    object DataSetFirst1: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Inicio'
      Hint = 'First'
      DataSource = DMLIQ.DS_Pval
    end
    object DataSetLast1: TDataSetLast
      Category = 'Dataset'
      Caption = '&Fin'
      Hint = 'Last'
      DataSource = DMLIQ.DS_Pval
    end
    object DataSetPost2: TDataSetPost
      Category = 'Dataset'
      Caption = '&Guardar'
      Hint = 'Post'
      ImageIndex = 18
      DataSource = DMLIQ.DS_Vale
    end
    object DataSetCancel2: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      DataSource = DMLIQ.DS_Vale
    end
    object DataSetInsert2: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insertar '
      Hint = 'Insert'
      ImageIndex = 16
      DataSource = DMLIQ.DS_Vale
    end
    object DataSetDelete2: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Eliminar'
      Hint = 'Delete'
      ImageIndex = 17
      DataSource = DMLIQ.DS_Vale
    end
    object DataSetFirst2: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Inicio'
      Hint = 'First'
      DataSource = DMLIQ.DS_Vale
    end
    object DataSetLast2: TDataSetLast
      Category = 'Dataset'
      Caption = '&Fin'
      Hint = 'Last'
      DataSource = DMLIQ.DS_Vale
    end
    object DataSetPost3: TDataSetPost
      Category = 'Dataset'
      Caption = '&Guardar'
      Hint = 'Post'
      ImageIndex = 18
      DataSource = DMLIQ.DS_Dval
    end
    object DataSetCancel3: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancelar'
      Hint = 'Cancel'
      DataSource = DMLIQ.DS_Dval
    end
    object DataSetInsert3: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insertar '
      Hint = 'Insert'
      ImageIndex = 16
      DataSource = DMLIQ.DS_Dval
    end
    object DataSetDelete3: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Eliminar'
      Hint = 'Delete'
      ImageIndex = 17
      DataSource = DMLIQ.DS_Dval
    end
    object DataSetFirst3: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Inicio'
      Hint = 'First'
      DataSource = DMLIQ.DS_Dval
    end
    object DataSetLast3: TDataSetLast
      Category = 'Dataset'
      Caption = '&Fin'
      Hint = 'Last'
      DataSource = DMLIQ.DS_Dval
    end
    object DataSetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Editar'
      Hint = 'Edit'
      ImageIndex = 26
      DataSource = DMLIQ.DS_Pval
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DMGEN.ImgListCat1
    Left = 520
    Top = 343
    object Guardar1: TMenuItem
      Action = DataSetPost1
      ImageIndex = 3
    end
    object Cancelar1: TMenuItem
      Action = DataSetCancel1
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Insertar1: TMenuItem
      Action = DataSetInsert1
      ImageIndex = 0
    end
    object Eliminar1: TMenuItem
      Action = DataSetDelete1
      ImageIndex = 1
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Inicio1: TMenuItem
      Action = DataSetFirst1
    end
    object Fin1: TMenuItem
      Action = DataSetLast1
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object ImportardeOtrafecha1: TMenuItem
      Caption = 'Importar de Otra fecha'
    end
  end
  object PopupMenu2: TPopupMenu
    Images = DMGEN.ImgListDocu1
    Left = 552
    Top = 343
    object MenuItem1: TMenuItem
      Action = DataSetPost2
    end
    object MenuItem2: TMenuItem
      Action = DataSetCancel2
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object MenuItem4: TMenuItem
      Action = DataSetInsert2
    end
    object MenuItem5: TMenuItem
      Action = DataSetDelete2
    end
    object MenuItem6: TMenuItem
      Caption = '-'
    end
    object MenuItem7: TMenuItem
      Action = DataSetFirst2
    end
    object MenuItem8: TMenuItem
      Action = DataSetLast2
    end
  end
  object PopupMenu3: TPopupMenu
    Images = DMGEN.ImgListDocu1
    Left = 584
    Top = 343
    object MenuItem9: TMenuItem
      Action = DataSetPost3
    end
    object MenuItem10: TMenuItem
      Action = DataSetCancel3
    end
    object MenuItem11: TMenuItem
      Caption = '-'
    end
    object MenuItem12: TMenuItem
      Action = DataSetInsert3
    end
    object MenuItem13: TMenuItem
      Action = DataSetDelete3
    end
    object MenuItem14: TMenuItem
      Caption = '-'
    end
    object MenuItem15: TMenuItem
      Action = DataSetFirst3
    end
    object MenuItem16: TMenuItem
      Action = DataSetLast3
    end
  end
  object TL_Pval: TTable
    DatabaseName = 'DBGASOL1'
    Filtered = True
    OnFilterRecord = TL_PvalFilterRecord
    TableName = 'DGASPVAL'
    Left = 176
    Top = 336
    object TL_PvalSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
    end
    object TL_PvalCANTIDAD: TIntegerField
      FieldName = 'CANTIDAD'
    end
    object TL_PvalTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object TL_PvalFACTURADO: TStringField
      FieldName = 'FACTURADO'
      Size = 2
    end
    object TL_PvalCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
  end
  object TL_Vale: TTable
    DatabaseName = 'DBGASOL1'
    IndexFieldNames = 'CLIENTE;SUBCODIGO'
    MasterFields = 'CLIENTE;SUBCODIGO'
    MasterSource = DSTL_Pval
    TableName = 'DGASVALE'
    Left = 208
    Top = 336
    object TL_ValeIMPORTE: TFloatField
      FieldName = 'IMPORTE'
    end
    object TL_ValeCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object TL_ValeSUBCODIGO: TIntegerField
      FieldName = 'SUBCODIGO'
    end
  end
  object Table3: TTable
    DatabaseName = 'DBGASOL1'
    Left = 240
    Top = 336
  end
  object DSTL_Pval: TDataSource
    DataSet = TL_Pval
    Left = 288
    Top = 336
  end
  object DSTL_Vale: TDataSource
    DataSet = TL_Vale
    Left = 320
    Top = 336
  end
  object DataSource3: TDataSource
    Left = 352
    Top = 336
  end
end
