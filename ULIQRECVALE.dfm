object FLIQRECVALE: TFLIQRECVALE
  Left = 455
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Recepci'#243'n de Vales'
  ClientHeight = 388
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pFecha: TPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 83
      Height = 16
      Caption = 'Montos del d'#237'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnMontos: TcxButton
      Left = 216
      Top = 11
      Width = 187
      Height = 25
      Caption = 'Realizar busqueda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnMontosClick
      LookAndFeel.NativeStyle = True
    end
    object dtFecha: TDateTimePicker
      Left = 112
      Top = 12
      Width = 97
      Height = 24
      CalColors.TextColor = clHotLight
      CalColors.TitleBackColor = 5355519
      Date = 43224.000000000000000000
      Format = 'dd/MM/yyyy'
      Time = 43224.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object pMonotos: TPanel
    Left = 0
    Top = 49
    Width = 414
    Height = 56
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 103
      Height = 13
      Caption = 'Efectivo (Base a inv.)'
    end
    object Label2: TLabel
      Left = 144
      Top = 8
      Width = 81
      Height = 13
      Caption = 'Vales pendientes'
    end
    object Label3: TLabel
      Left = 282
      Top = 8
      Width = 105
      Height = 13
      Caption = 'Cupones recuperados'
    end
    object txtEfectivo: TcxCurrencyEdit
      Left = 8
      Top = 24
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.EditFormat = '$,0.00;-$,0.00'
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextColor = 40704
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 121
    end
    object txtValesPendientes: TcxCurrencyEdit
      Left = 145
      Top = 24
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.EditFormat = '$,0.00;-$,0.00'
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextColor = 40704
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 121
    end
    object txtCuponesRecuperados: TcxCurrencyEdit
      Left = 282
      Top = 24
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.EditFormat = '$,0.00;-$,0.00'
      Properties.ReadOnly = True
      Properties.UseLeftAlignmentOnEditing = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGreen
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextColor = 40704
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Width = 121
    end
  end
  object Contenedor: TcxPageControl
    Left = 0
    Top = 105
    Width = 414
    Height = 242
    ActivePage = pValesPendientes
    Align = alClient
    LookAndFeel.NativeStyle = True
    TabOrder = 2
    ClientRectBottom = 238
    ClientRectLeft = 4
    ClientRectRight = 410
    ClientRectTop = 24
    object pValesPendientes: TcxTabSheet
      Caption = 'Vales pendientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      ParentFont = False
      object Label5: TLabel
        Left = 16
        Top = 8
        Width = 345
        Height = 26
        Caption = 
          'Capture la cantidad de efectivo que desea transferir a Vales Pen' +
          'dientes de descarga y presione el bot'#243'n Transferir.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label6: TLabel
        Left = 16
        Top = 48
        Width = 43
        Height = 13
        Caption = 'Efectivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object txtEfectivoATrans: TcxCurrencyEdit
        Left = 16
        Top = 64
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = '$,0.00'
        Properties.EditFormat = '$,0.00'
        Properties.MaxLength = 20
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnValidate = txtEfectivoATransPropertiesValidate
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clHotLight
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        OnKeyDown = txtEfectivoATransKeyDown
        Width = 121
      end
      object btnTransferirAVal: TcxButton
        Left = 144
        Top = 63
        Width = 121
        Height = 25
        Caption = 'Transferir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnTransferirAValClick
        LookAndFeel.NativeStyle = True
      end
    end
    object pRecuperarCupon: TcxTabSheet
      Caption = 'Recuperar cupones'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      object Label7: TLabel
        Left = 16
        Top = 8
        Width = 330
        Height = 26
        Caption = 
          'Seleccione el tipo de pago, capture el folio de los cupones que ' +
          'ser'#225'n recuperados y presione el bot'#243'n Transferir.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object Label9: TLabel
        Left = 16
        Top = 96
        Width = 73
        Height = 13
        Caption = 'Folio de cup'#243'n:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object imgAyudaCupo: TImage
        Left = 145
        Top = 96
        Width = 16
        Height = 16
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          000010000000010018000000000000030000D70D0000D70D0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E6CDE7BB7CDFA54CDB9835DFA54CE7BC7B
          F5E5CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFBE8C185DFA4
          4BF1D6AEFBF3E9FFFFFFFBF3E9EFD4ABDFA34BE9C287FDFDFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFEAC489E5B26AFDF9F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCF8F2E4B269EBC48BFFFFFFFFFFFFFFFFFFFFFFFFF7E7CFDFA54FFDFAF5FFFF
          FFFFFFFFFFFFFFDB9834FFFFFFFFFFFFFFFFFFFDF9F3DFA54CF6E7D2FFFFFFFF
          FFFFFFFFFFE7BA77F1D6AEFFFFFFFFFFFFFFFFFFFFFFFFDB9834FFFFFFFFFFFF
          FFFFFFFFFFFFF0D5ABE8BB7AFFFFFFFFFFFFFFFFFFDFA247FAF3EAFFFFFFFFFF
          FFFFFFFFFFFFFFDB9834FFFFFFFFFFFFFFFFFFFFFFFFFBF3E7DEA248FFFFFFFF
          FFFFFFFFFFDB9A38FEFDFBFFFFFFFFFFFFFFFFFFFFFFFFDB9834FFFFFFFFFFFF
          FFFFFFFFFFFFFEFCF8DB9A39FFFFFFFFFFFFFFFFFFDFA247FAF3EAFFFFFFFFFF
          FFFFFFFFFFFFFFDB9834FFFFFFFFFFFFFFFFFFFFFFFFFBF3E7DEA248FFFFFFFF
          FFFFFFFFFFE7BA77F1D6AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF0D5ABE8BB7AFFFFFFFFFFFFFFFFFFF6E6CDDFA54EFDFAF5FFFF
          FFFFFFFFFFFFFFDB9834FFFFFFFFFFFFFFFFFFFDF9F3DFA44BF7E7CFFFFFFFFF
          FFFFFFFFFFFFFFFFE9BF84E4B46BFDFAF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFAF5E3B369EAC285FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFBE8C185E0A7
          52F1D5AEFAF3EAFDF8F1FAF3EAF1D6AEE0A650E9C287FDFDFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E6CDE6BA76DDA043DD9E42DDA043E6B976
          F5E5CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
      end
      object Label8: TLabel
        Left = 16
        Top = 48
        Width = 66
        Height = 13
        Caption = 'Tipo de Pago:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object TablaCupon: TcxGrid
        Left = 178
        Top = 45
        Width = 215
        Height = 140
        TabOrder = 2
        LookAndFeel.NativeStyle = True
        object DatosTablaCupon: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DS_Cupones
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Kind = skSum
              Position = spFooter
              Column = DatosTablaCuponColumn3
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#0.00'
              Kind = skSum
              FieldName = 'Importe'
              Column = DatosTablaCuponColumn3
              DisplayText = '#0.00'
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.FooterAutoHeight = True
          OptionsView.GroupByBox = False
          object DatosTablaCuponColumn5: TcxGridDBColumn
            Caption = 'TP'
            DataBinding.FieldName = 'TipoPago'
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 16
          end
          object DatosTablaCuponColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'Serie'
            HeaderAlignmentHorz = taCenter
            MinWidth = 30
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 30
          end
          object DatosTablaCuponColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'Folio'
            HeaderAlignmentHorz = taCenter
            MinWidth = 60
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 60
          end
          object DatosTablaCuponColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'Importe'
            HeaderAlignmentHorz = taRightJustify
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.Moving = False
            Options.Sorting = False
            Width = 95
          end
          object DatosTablaCuponColumn4: TcxGridDBColumn
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Glyph.Data = {
                  76010000424D760100000000000036000000280000000A0000000A0000000100
                  18000000000040010000000400000004000000000000000000004451F43643F4
                  3643F43643F43643F43643F43643F43643F43643F44551F4F4FF3643F43643F4
                  3643F43643F43643F43643F43643F43643F43643F43643F4F4FF3643F43643F4
                  9195F97179F83643F43643F46771F7868BF93643F43643F4F9FF3643F43643F4
                  7B82F8E7E5FF6B73F76169F7E5E2FE868BF93643F43643F4F9FF3643F43643F4
                  3643F48087F8E9E6FFE7E5FF868BF93643F43643F43643F4F4FF3643F43643F4
                  3643F46169F7E8E5FFEBE8FF6B74F73643F43643F43643F4F4FF3643F43643F4
                  6069F6E4E2FE868CF98288F9E9E6FF6C74F73643F43643F4F7FF3643F43643F4
                  949AFA8188F83643F43643F47981F8838AF93643F43643F4F9FF3643F43643F4
                  3643F43643F43643F43643F43643F43643F43643F43643F4F4FF4450F43643F4
                  3643F43643F43643F43643F43643F43643F43643F44451F4F4FF}
                Kind = bkGlyph
              end>
            Properties.ClickKey = 46
            Properties.HideSelection = False
            Properties.OnButtonClick = DatosTablaCuponColumn4PropertiesButtonClick
            Options.Filtering = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.ShowEditButtons = isebAlways
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.ShowCaption = False
            Width = 20
          end
        end
        object TablaCuponLevel1: TcxGridLevel
          GridView = DatosTablaCupon
        end
      end
      object txtFolioCupon: TcxButtonEdit
        Left = 16
        Top = 112
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Glyph.Data = {
              9E020000424D9E0200000000000036000000280000000E0000000E0000000100
              18000000000068020000D70D0000D70D00000000000000000000FFFFFFECC791
              DB9937DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB99
              37EBC89334FFFFFFFFDB9A38DB9834DB9834DB9834DB9834DB9834DB9834DB98
              34DB9834DB9834DB9834DB9834DB9A3934FFFFFFFFDB9834DB9834DB9834DB98
              34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB983434FFFFFF
              FFDB9834DB9834DB9834DB9834DB9834DB9834FFFFFFDB9834DB9834DB9834DB
              9834DB9834DB983434FFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834FF
              FFFFDB9834DB9834DB9834DB9834DB9834DB983434FFFFFFFFDB9834DB9834DB
              9834DB9834DB9834DB9834FFFFFFDB9834DB9834DB9834DB9834DB9834DB9834
              34FFFFFFFFDB9834DB9834DB9834FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFDB9834DB9834DB9834FFFFFFFFFFDB9834DB9834DB9834DB9834DB9834
              DB9834FFFFFFDB9834DB9834DB9834DB9834DB9834DB983434FFFFFFFFDB9834
              DB9834DB9834DB9834DB9834DB9834FFFFFFDB9834DB9834DB9834DB9834DB98
              34DB983434FFFFFFFFDB9834DB9834DB9834DB9834DB9834DB9834FFFFFFDB98
              34DB9834DB9834DB9834DB9834DB983434FFFFFFFFDB9834DB9834DB9834DB98
              34DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB983434FFFFFF
              FFDB9A38DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB
              9834DB9834DB9A3934FFFFFFFFECC791DC9B3ADB9834DB9834DB9834DB9834DB
              9834DB9834DB9834DB9834DB9834DC9B3AEBC89334FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF}
            Kind = bkGlyph
          end>
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '[0-9]{1,10}'
        Properties.MaxLength = 0
        Properties.OnButtonClick = txtFolioCuponPropertiesButtonClick
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clHotLight
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        OnKeyDown = txtFolioCuponKeyDown
        Width = 145
      end
      object btnTransferirACupon: TcxButton
        Left = 18
        Top = 160
        Width = 145
        Height = 25
        Caption = 'Transferir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnTransferirACuponClick
        LookAndFeel.NativeStyle = True
      end
      object txtTipoPago: TcxLookupComboBox
        Left = 16
        Top = 64
        Properties.ButtonGlyph.Data = {
          9E020000424D9E0200000000000036000000280000000E0000000E0000000100
          18000000000068020000D70D0000D70D00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD3A7F0D2A7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E2C4DB9937DB
          9937F4E2C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF8EBD7DC9C3DDB9834DB9834DD9E3FF8EDDBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFBF3E9DFA34BDB9834DB9834DB9834DB9834DFA34B
          FAF5EBFFFFFFFFFFFFFFFFFFEBFFFFFFFFFFFFFFFDFAF5E1AB5ADB9834DB9834
          DB9834DB9834DB9834DB9834E2AD5EFEFBF7FFFFFFFFFFFF5EFFFFFFFFFFFEFD
          E6B772DB9834DB9834DB9834DB9834DB9834DB9834DB9834DB9834E6B772FFFE
          FDFFFFFF34FFFFFFFFE8C185DB9834DB9834DB9834DB9834DB9834DB9834DB98
          34DB9834DB9834DB9834E8C185FFFFFF34FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF}
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'CLAVE'
        Properties.ListColumns = <
          item
            Caption = 'Id'
            MinWidth = 2
            FieldName = 'CLAVE'
          end
          item
            Caption = 'Descripci'#243'n'
            FieldName = 'DESCRIPCION'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListSource = DS_TipoPagoCup
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Width = 145
      end
    end
    object pDatos: TcxTabSheet
      Caption = 'Datos'
      ImageIndex = 3
      object cxGrid2: TcxGrid
        Left = 23
        Top = 16
        Width = 362
        Height = 169
        TabOrder = 0
        LookAndFeel.NativeStyle = True
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Insert.Enabled = False
          NavigatorButtons.Append.Enabled = False
          NavigatorButtons.Delete.Enabled = False
          DataController.DataSource = DS_Detallado
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'Turno'
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'Folio'
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'Pago'
          end
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'Importe'
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
  end
  object pBotones: TPanel
    Left = 0
    Top = 347
    Width = 414
    Height = 41
    Align = alBottom
    TabOrder = 3
    object cxButton1: TcxButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 0
      OnClick = cxButton1Click
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
      LookAndFeel.NativeStyle = True
    end
    object btnGuardar: TcxButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Guardar'
      TabOrder = 1
      OnClick = btnGuardarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000EF0A0000EF0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDD39372B1501990644CADB1B1BFB8B1CF
        CEC9D0D0D2B4B4B499A2A88A3F15AC4F1CAD552AD1A590FFFFFFFFFFFFDB9563
        BE6317CD79279E8770B98759CE700DDCAF7AFEFFFFFAFAFAD9E2EAAD7024DD94
        35ECBE75A84912FFFFFFFFFFFFC9680DC07028C36C1EA7876BAE7C5ABA5809C6
        9A6CD9DFE5F8F8F8F8FFFFA3631DD5872DE5AF69A5460AFFFFFFFFFFFFCB690C
        BB6823BF6619B4906EB37C60AF4900B5875EBFC6CDDEE0E2FFFFFFA5641FD484
        2DE4B06CA44409FFFFFFFFFFFFC9690AB8631FBC6219B07F55C1BFBDB0ACA898
        918B9A8E84A3978AAEA79F90581FA76723DA9542A6450DFFFFFFFFFFFFC9670A
        B55D1BB65D17B85B0FBA5808BE5D0AC2620EC56710C86913C96E16CE7824D07F
        2AD38932A5450EFFFFFFFFFFFFC86809B05514B16933AF7142AE703FAF7341B1
        7340B07642B27741B47A43B47D46BD8041D1842DA6460EFFFFFFFFFFFFC76508
        AC4B09B59C89E6F2FBE4EDF3E6EEF5E6EDF4E1E9EFDDE5ECD5DEE4D1DCE6AD9A
        8AD07F26A4450EFFFFFFFFFFFFC86509A84303B89984F4F9FCD5D4D2BEBDBCC0
        BFBEC1C0BFC2C0BFCBCAC9DFE3E6B19B85CF7C22A4440DFFFFFFFFFFFFC76508
        A23C00BA9B85FAFFFFF1F1F1ECECECEBEBEBE8E8E8E4E4E4E1E1E1E2E5E9B29B
        88CD7920A5440DFFFFFFFFFFFFC662079E3700BC9C8AFFFFFFDDDCDBC2C1C0C4
        C3C2C4C3C2C2C1C0CECDCCE4E7EBB39D89CD771FA4440EFFFFFFFFFFFFC56206
        9A3100BF9D8AFFFFFFFBFBFBEEEEEEEFEFEFE9E9E9E4E4E4E4E4E4E6EAEDB5A0
        89C2701DA9480DFFFFFFFFFFFFC5630A932800BE9D8DFFFFFFE5E4E3D0CFCED1
        D0CFCFCECDCDCCCBD4D3D2E9EDF1B9A38C8A4F14B35313FFFFFFFFFFFFE7B47F
        C35704C8A483D5D7D7D6D3D0D6D3D0D1CFCCCCCAC8C7C5C3C1BEBBBDBDBDB194
        7BC35B04D8A580FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.NativeStyle = True
    end
    object btnCancelar: TcxButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000EB0A0000EB0A00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFDD29371B050198F644CD1D3D34752CB08
        18C00812B9080FB3080EAD0706A208069E08079D3F3AA9FFFFFFFFFFFFDA9563
        BE6317CD79279E8770E2CDBA2F46D9001DE84266F1274BEC000ED42A4BE2617B
        EC0002B606059CFFFFFFFFFFFFC9680DC07028C36C1EA7876BDDC9BA334EE331
        56F2F4EFDEEBECEB3A5EF3F8FCFCFFFFFF627EEF06059CFFFFFFFFFFFFCB690C
        BB6823BF6619B4906EDFC9BD3F5BEA1A49F8E7E5E1F1F0EAFFFDF3FFFFFEFFFF
        FF3B5AE90605A2FFFFFFFFFFFFC9690AB8631FBC6219B07F55E5E4E44C6BEE00
        3FFF2952F3F7F5EBF4F4F4FFFFFF4064F5000DD3060DABFFFFFFFFFFFFC9670A
        B55D1BB65D17B85B0FE2BA985778F01149EED4D4DFF2F0EAFFFCF3FFFFFDFBFE
        FF1D43EB060DB1FFFFFFFFFFFFC86809B05514B16933AF7142DDC4AF5E82F546
        62D3F8F2DEE8E6E6395EF2FDFBF7FFFFFF6181FC060FBAFFFFFFFFFFFFC76508
        AC4B09B59C89E6F2FBF4F8FA7192FA0F70FF4F69D41F4FEA003EFF1F4BF95373
        F80019E60616C0FFFFFFFFFFFFC86509A84303B89984F4F9FCE7E7E56383F369
        8FFA567DF74E74F6476AF23A5CF02F4CE72D47DD494EBFFFFFFFFFFFFFC76508
        A23C00BA9B85FAFFFFF1F1F1F4F4F4F6F6F6F5F5F5F3F3F3F2F2F2F2F4F6DED4
        CCE9C59FCB9474FFFFFFFFFFFFC662079E3700BC9C8AFFFFFFDDDCDBC2C1C0C4
        C3C2C4C3C2C2C1C0CECDCCE4E7EBB39D89CD771FA4440EFFFFFFFFFFFFC56206
        9A3100BF9D8AFFFFFFFBFBFBEEEEEEEFEFEFE9E9E9E4E4E4E4E4E4E6EAEDB5A0
        89C2701DA9480DFFFFFFFFFFFFC56309932800BE9D8DFFFFFFE5E4E3D0CFCED1
        D0CFCFCECDCDCCCBD4D3D2E9EDF1B9A38C8A4F14B25312FFFFFFFFFFFFE6B47F
        C25604C8A483D5D7D7D6D3D0D6D3D0D1CFCCCCCAC8C7C5C3C1BEBBBDBDBDB194
        7BC25A04D7A47FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.NativeStyle = True
    end
    object btnBitacora: TcxButton
      Left = 8
      Top = 8
      Width = 153
      Height = 25
      Caption = 'Bit'#225'cora de movimientos'
      TabOrder = 3
      OnClick = btnBitacoraClick
      LookAndFeel.NativeStyle = True
    end
  end
  object TM_Cupones: TRxMemoryData
    FieldDefs = <>
    Left = 172
    Top = 289
    object TM_CuponesSerie: TStringField
      Alignment = taCenter
      FieldName = 'Serie'
      Size = 9
    end
    object TM_CuponesFolio: TStringField
      Alignment = taCenter
      FieldName = 'Folio'
      Size = 9
    end
    object TM_CuponesImporte: TFloatField
      FieldName = 'Importe'
      DisplayFormat = '#0.00'
    end
    object TM_CuponesTipoPago: TIntegerField
      Alignment = taCenter
      FieldName = 'TipoPago'
    end
    object TM_CuponesSerieFolio: TStringField
      FieldName = 'SerieFolio'
      Size = 10
    end
    object TM_CuponesImporteOriginal: TFloatField
      FieldName = 'ImporteOriginal'
    end
  end
  object DS_Cupones: TDataSource
    DataSet = TM_Cupones
    Left = 172
    Top = 233
  end
  object Q_TipoPagoCup: TQuery
    DatabaseName = 'DBGASOL2'
    SQL.Strings = (
      'SELECT CLAVE, DESCRIPCION FROM DGASTPAG'
      'WHERE ACTIVO = '#39'Si'#39
      'AND CLASE = '#39'Cup'#243'n'#39)
    Left = 240
    Top = 289
    object Q_TipoPagoCupCLAVE: TStringField
      FieldName = 'CLAVE'
      Size = 2
    end
    object Q_TipoPagoCupDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
  end
  object DS_TipoPagoCup: TDataSource
    DataSet = Q_TipoPagoCup
    Left = 236
    Top = 233
  end
  object TM_Detallado: TRxMemoryData
    FieldDefs = <>
    Left = 36
    Top = 289
    object TM_DetalladoFolio: TIntegerField
      FieldName = 'Folio'
    end
    object TM_DetalladoPago: TStringField
      DisplayWidth = 2
      FieldName = 'Pago'
      Size = 2
    end
    object TM_DetalladoTurno: TIntegerField
      FieldName = 'Turno'
    end
    object TM_DetalladoImporte: TFloatField
      FieldName = 'Importe'
    end
    object TM_DetalladoDisponible: TBooleanField
      FieldName = 'Disponible'
    end
  end
  object DS_Detallado: TDataSource
    DataSet = TM_Detallado
    Left = 40
    Top = 240
  end
  object TM_Ajuste: TRxMemoryData
    FieldDefs = <>
    Left = 108
    Top = 289
    object TM_AjusteTurno: TIntegerField
      FieldName = 'Turno'
    end
    object TM_AjusteImporte: TFloatField
      FieldName = 'Importe'
    end
    object TM_AjusteEfectivo: TFloatField
      FieldName = 'Efectivo'
    end
  end
  object TM_Rcupon: TRxMemoryData
    FieldDefs = <>
    Left = 108
    Top = 241
    object TM_RcuponTurnoLiq: TIntegerField
      FieldName = 'TurnoLiq'
    end
    object TM_RcuponFolioLiq: TIntegerField
      FieldName = 'FolioLiq'
    end
    object TM_RcuponSerie: TIntegerField
      FieldName = 'Serie'
    end
    object TM_RcuponFolio: TIntegerField
      FieldName = 'Folio'
    end
    object TM_RcuponImporte: TFloatField
      FieldName = 'Importe'
    end
    object TM_RcuponSerieFolio: TStringField
      FieldName = 'SerieFolio'
      Size = 10
    end
  end
end
