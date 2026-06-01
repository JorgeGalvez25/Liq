object FLIQDTPAG: TFLIQDTPAG
  Left = 284
  Top = 159
  Width = 585
  Height = 292
  Caption = 'Desglose de Tipos de Pago'
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
    Width = 577
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 14
      Width = 67
      Height = 13
      Caption = 'Tipo de Pago:'
    end
    object DBText1: TDBText
      Left = 82
      Top = 11
      Width = 121
      Height = 16
      Color = clHighlightText
      DataField = 'DescripcionPago'
      DataSource = DMLIQ.DS_Dliqp
      ParentColor = False
    end
    object Label3: TLabel
      Left = 374
      Top = 16
      Width = 97
      Height = 13
      Caption = 'Importe a Desglosar:'
    end
    object DBText2: TDBText
      Left = 475
      Top = 14
      Width = 71
      Height = 16
      Alignment = taRightJustify
      Color = clHighlightText
      DataField = 'IMPORTE'
      DataSource = DMLIQ.DS_Dliqp
      ParentColor = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 577
    Height = 146
    Align = alClient
    Color = clInfoBk
    DataSource = DMLIQ.DS_Dtpag
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnExit = DBGrid1Exit
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE'
        Title.Caption = 'Nombre'
        Width = 284
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Caption = 'Referencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPORTE'
        Title.Alignment = taRightJustify
        Title.Caption = 'Importe'
        Width = 81
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 187
    Width = 577
    Height = 78
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 577
      Height = 28
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 411
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Total...'
      end
      object StaticText2: TStaticText
        Left = 461
        Top = 5
        Width = 91
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
    object Panel4: TPanel
      Left = 0
      Top = 28
      Width = 577
      Height = 50
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 11
        Top = 13
        Width = 162
        Height = 26
        DataSource = DMLIQ.DS_Dtpag
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbCancel]
        Hints.Strings = (
          'Inicio'
          'Siguiente'
          'Anterior'
          'Fin'
          'Eliminar Renglón'
          'Cancelar Cambios')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 388
        Top = 14
        Width = 75
        Height = 26
        Caption = 'Acepta'
        TabOrder = 1
        Kind = bkOK
      end
      object BitBtn2: TBitBtn
        Left = 474
        Top = 15
        Width = 75
        Height = 25
        Caption = '&Salir'
        TabOrder = 2
        Kind = bkClose
      end
    end
  end
end
