object FLIQDLIQE: TFLIQDLIQE
  Left = 454
  Top = 303
  Width = 337
  Height = 421
  BorderIcons = [biSystemMenu]
  Caption = 'Desglose de Efectivo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 8
      Width = 67
      Height = 13
      Caption = 'Tipo de Pago:'
    end
    object DBText1: TDBText
      Left = 9
      Top = 24
      Width = 121
      Height = 16
      Color = clHighlightText
      DataField = 'DescripcionPago'
      DataSource = DMLIQ.DS_Dliqp
      ParentColor = False
    end
    object Label3: TLabel
      Left = 206
      Top = 8
      Width = 97
      Height = 13
      Caption = 'Importe a Desglosar:'
      Visible = False
    end
    object DBText2: TDBText
      Left = 230
      Top = 24
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Color = clHighlightText
      DataField = 'IMPORTE'
      DataSource = DMLIQ.DS_Dliqp
      ParentColor = False
      Visible = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 342
    Width = 329
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel4: TPanel
      Left = 0
      Top = 2
      Width = 329
      Height = 50
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object DBNavigator1: TDBNavigator
        Left = 8
        Top = 14
        Width = 120
        Height = 23
        DataSource = DMLIQ.DS_Dliqe
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbCancel]
        Hints.Strings = (
          'Inicio'
          'Siguiente'
          'Anterior'
          'Fin'
          'Eliminar Rengl'#243'n'
          'Cancelar Cambios')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 156
        Top = 14
        Width = 75
        Height = 26
        Caption = 'Acepta'
        TabOrder = 1
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 242
        Top = 15
        Width = 75
        Height = 25
        Caption = '&Salir'
        TabOrder = 2
        Kind = bkClose
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 49
    Width = 329
    Height = 293
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfStandard
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnKeyDown = cxGrid1DBTableView1KeyDown
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DMLIQ.DS_Dliqe
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,###,##0.00'
          Kind = skSum
          FieldName = 'IMPORTE'
          Column = cxGrid1DBTableView1IMPORTE
          DisplayText = 'Total:'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Styles.ContentEven = DMGEN.cxStyle1
      Styles.ContentOdd = DMGEN.cxStyle2
      Styles.Header = DMGEN.cxStyle3
      object cxGrid1DBTableView1DENOMINACION: TcxGridDBColumn
        Caption = 'Denominaci'#243'n'
        DataBinding.FieldName = 'DENOMINACION'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        Options.Filtering = False
        Width = 106
      end
      object cxGrid1DBTableView1CANTIDAD: TcxGridDBColumn
        Caption = 'Cantidad'
        DataBinding.FieldName = 'CANTIDAD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taRightJustify
        Options.Filtering = False
        Width = 101
      end
      object cxGrid1DBTableView1IMPORTE: TcxGridDBColumn
        Caption = 'Importe'
        DataBinding.FieldName = 'IMPORTE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taRightJustify
        Options.Filtering = False
        Width = 90
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
