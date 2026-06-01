object FLIQDESC: TFLIQDESC
  Left = 241
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Proceso Descuentos'
  ClientHeight = 442
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 809
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 685
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
      Width = 286
      Height = 13
      Caption = 'Especifique aqu'#237' el turno al que se va a aplicar el descuento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object MesBox1: TComboBox
      Left = 714
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
        Hint = 'Aplicar Descuento'
        Caption = '&Aplicar Descuento'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 33
        Top = 2
        Hint = 'Desaplicar Descuento'
        Caption = '&Desaplicar Descuento'
        ImageIndex = 17
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton1Click
      end
      object ToolButton4: TToolButton
        Left = 66
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object TBAjusta: TToolButton
        Left = 74
        Top = 2
        Hint = 'Salir'
        Caption = 'Salir'
        ImageIndex = 22
        OnClick = TBAjustaClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 404
    Width = 809
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      809
      38)
    object Bitsalir: TBitBtn
      Left = 673
      Top = 4
      Width = 98
      Height = 30
      Anchors = [akTop, akRight]
      Caption = '&Salir'
      TabOrder = 0
      OnClick = TBAjustaClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A66666933
        34FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A66669A6666
        A36666A76666693334FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A66669A6666A0
        6666B06667C66667CC6667B36667693334FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A66669A66
        66AF6869C0696ACF696ACE6869CD6768CD6768B36667693334AE66669A66669A
        66669A66669A66669A66669A66669A66669A6666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9A6666D26F70D56F70D46E6FD36D6ED26C6DD16B6CD06A6BB467686933
        34FEA2A3FDA8A9FCAFB0FBB6B7FABCBDF9C2C2F9C5C6F9C5C69A6666FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9A6666D97374D87273D77172D67071D56F70D46E6F
        D36D6EB6696A69333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666DC7677DB7576DA7475D9
        7374D87273D77172D67071B86B6B69333459B26733CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666DF79
        7ADF797ADE7879DD7778DC7677DB7576DA7475B96C6D69333459B26733CB6733
        CB6733CB6733CB6733CB6733CB67F9C5C69A6666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9A6666E37D7EE27C7DE17B7CE07A7BDF797ADE7879DD7778BB6E6F6933
        3459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5C69A6666FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9A6666E68081E57F80E47E7FE37D7EE27C7DE17B7C
        E07A7BBD707069333459B26733CB6733CB6733CB6733CB6733CB6733CB67F9C5
        C69A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666E98384E88283E78182E6
        8081E78788ECA6A7E47E7FBE717269333473B87633CB6733CB6733CB6733CB67
        33CB6733CB67F9C5C69A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666ED87
        88EC8687EB8586EA8485F2B9BAFFFFFFF0B0B0C07374693334F2D9C0C7F0BC79
        DD9079DD9060D68160D68160D681F9C5C69A6666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9A6666F08A8BEF898AEE8889ED8788F5BBBCFFFFFFF0AAABC275756933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDE2F8CCE2F8CCF9C5C69A6666FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9A6666F38D8EF28C8DF18B8CF08A8BEF898AF3A6A7
        ED8788C37677693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666F69091F69091F58F90F4
        8E8FF38D8EF28C8DF18B8CC57878693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666FA94
        95F99394F89293F79192F69091F58F90F48E8FC77A7A693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9A6666FD9798FC9697FB9596FA9495F99394F89293F79192C87B7C6933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9A6666FF999AFF999AFE9899FD9798FD9798FC9697
        FB9596CA7D7D693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5
        C69A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666FF999AFF999AFF999AFF
        999AFF999AFE9899FE9899CC7F7F693334F2D9C0FFFFDDFFFFDDFFFFDDFFFFDD
        FFFFDDFFFFDDF9C5C69A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666F996
        97FF999AFF999AFF999AFF999AFF999AFF999ACD8080693334F2D9C0FFFFDDFF
        FFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9A66669A6666C0797ADF898AFF999AFF999AFF999AFF999ACD80806933
        34F2D9C0FFFFDDFFFFDDFFFFDDFFFFDDFFFFDDFFFFDDF9C5C69A6666FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A66669A6666A76C6DC67C7DF29394
        FF999ACD8080693334A766669A66669A66669A66669A66669A66669A66669A66
        669A6666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9A66669A6666AD7070B37373693334FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A6666693334FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 55
    Width = 269
    Height = 349
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 269
      Height = 308
      Align = alClient
      DataSource = Ds_Desc
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ESTACION'
          Title.Caption = 'Estaci'#243'n'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Title.Caption = 'Fecha'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TURNO'
          ReadOnly = True
          Title.Caption = 'Turno'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          ReadOnly = True
          Title.Caption = 'Descuento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          ReadOnly = True
          Title.Caption = 'Total'
          Visible = True
        end>
    end
    object Panel6: TPanel
      Left = 0
      Top = 308
      Width = 269
      Height = 41
      Align = alBottom
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 5
        Top = 8
        Width = 108
        Height = 25
        DataSource = Ds_Desc
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
    Left = 269
    Top = 55
    Width = 540
    Height = 349
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel5: TPanel
      Left = 0
      Top = 308
      Width = 540
      Height = 41
      Align = alBottom
      TabOrder = 1
      object DBNavigator2: TDBNavigator
        Left = 21
        Top = 8
        Width = 108
        Height = 25
        DataSource = DsQ_DescD
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 540
      Height = 308
      Align = alClient
      DataSource = DsQ_DescD
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NombreCombustible'
          ReadOnly = True
          Title.Caption = 'Combustible'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTACION'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TURNO'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COMBUSTIBLE'
          ReadOnly = True
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LITROS'
          ReadOnly = True
          Title.Caption = 'Litros'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          ReadOnly = True
          Title.Caption = 'Precio'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          ReadOnly = True
          Title.Caption = 'Importe'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          ReadOnly = True
          Title.Caption = 'Descuento'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          ReadOnly = True
          Title.Caption = 'Total'
          Width = 72
          Visible = True
        end>
    end
  end
  object T_Desc: TTable
    AfterScroll = T_DescAfterScroll
    OnCalcFields = T_DescCalcFields
    DatabaseName = 'DBGASOL1'
    TableName = 'DGASDESC'
    Left = 78
    Top = 136
    object T_DescESTACION: TIntegerField
      FieldName = 'ESTACION'
      Required = True
    end
    object T_DescFECHA: TDateTimeField
      FieldName = 'FECHA'
      Required = True
    end
    object T_DescTURNO: TIntegerField
      FieldName = 'TURNO'
      Required = True
    end
    object T_DescTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescContabilizado: TStringField
      FieldKind = fkCalculated
      FieldName = 'Contabilizado'
      Size = 2
      Calculated = True
    end
  end
  object T_Descd: TTable
    DatabaseName = 'DBGASOL1'
    IndexFieldNames = 'ESTACION;FECHA;TURNO'
    MasterFields = 'ESTACION;FECHA;TURNO'
    MasterSource = Ds_Desc
    TableName = 'DGASDESCD'
    Left = 366
    Top = 115
    object T_DescdESTACION: TIntegerField
      FieldName = 'ESTACION'
      Required = True
    end
    object T_DescdFECHA: TDateTimeField
      FieldName = 'FECHA'
      Required = True
    end
    object T_DescdTURNO: TIntegerField
      FieldName = 'TURNO'
      Required = True
    end
    object T_DescdISLA: TIntegerField
      FieldName = 'ISLA'
    end
    object T_DescdCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
      Required = True
    end
    object T_DescdNombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGASQ.QT_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
    object T_DescdLITROS: TFloatField
      FieldName = 'LITROS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescdPRECIO: TFloatField
      FieldName = 'PRECIO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescdIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescdDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object T_DescdTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
  end
  object Ds_Desc: TDataSource
    DataSet = T_Desc
    Left = 88
    Top = 209
  end
  object Ds_Descd: TDataSource
    DataSet = T_Descd
    Left = 356
    Top = 183
  end
  object Q_DescD: TQuery
    DatabaseName = 'DBGASOL1'
    DataSource = Ds_Desc
    SQL.Strings = (
      
        'SELECT COMBUSTIBLE,PRECIO,SUM(LITROS) AS LITROS, SUM(IMPORTE) AS' +
        ' IMPORTE,'
      'SUM(DESCUENTO) AS DESCUENTO, SUM(TOTAL) AS TOTAL FROM DGASDESCD'
      
        'WHERE ESTACION=:ESTACION AND FECHA=:FECHA AND TURNO=:TURNO AND P' +
        'RECIO>0'
      'GROUP BY COMBUSTIBLE, PRECIO')
    Left = 549
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTACION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TURNO'
        ParamType = ptUnknown
      end>
    object Q_DescDCOMBUSTIBLE: TIntegerField
      FieldName = 'COMBUSTIBLE'
    end
    object Q_DescDNombreCombustible: TStringField
      FieldKind = fkLookup
      FieldName = 'NombreCombustible'
      LookupDataSet = DMGASQ.QT_Tcmb
      LookupKeyFields = 'CLAVE'
      LookupResultField = 'NOMBRE'
      KeyFields = 'COMBUSTIBLE'
      Size = 30
      Lookup = True
    end
    object Q_DescDLITROS: TFloatField
      FieldName = 'LITROS'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object Q_DescDPRECIO: TFloatField
      FieldName = 'PRECIO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object Q_DescDIMPORTE: TFloatField
      FieldName = 'IMPORTE'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object Q_DescDDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
    object Q_DescDTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '###,###,##0.00'
      EditFormat = '###,###,##0.00'
    end
  end
  object DsQ_DescD: TDataSource
    DataSet = Q_DescD
    Left = 546
    Top = 243
  end
end
