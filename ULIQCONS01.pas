unit ULIQCONS01;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids, Db, DBTables,
  Menus, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RxMemDS, Variants;

type
  TFLIQCONS01 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BbSalir: TBitBtn;
    BbCalcular: TBitBtn;
    BbImprimir: TBitBtn;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    BbPrever: TBitBtn;
    Label9: TLabel;
    ComboBox1: TComboBox;
    DBText1: TDBText;
    QL_Pval: TQuery;
    DSQL_Pval: TDataSource;
    QL_Vale: TQuery;
    QL_PvalESTACION: TIntegerField;
    QL_PvalCAJA: TIntegerField;
    QL_PvalFECHA: TDateTimeField;
    QL_PvalTURNO: TIntegerField;
    QL_PvalINDICE: TIntegerField;
    QL_PvalCANTIDAD: TIntegerField;
    QL_PvalTOTAL: TFloatField;
    QL_PvalFACTURADO: TStringField;
    QL_PvalESTACIONFAC: TIntegerField;
    QL_PvalSERIEFAC: TStringField;
    QL_PvalFOLIOFAC: TIntegerField;
    QL_PvalINDICEVALE: TIntegerField;
    DSQL_Vale: TDataSource;
    QL_Dval: TQuery;
    Panel3: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DSQL_Dval: TDataSource;
    QL_PvalNombreCliente: TStringField;
    QL_PvalFechaPaq: TStringField;
    QL_PvalFechaFacPaq: TStringField;
    QL_Facr: TQuery;
    QL_PvalFactura: TStringField;
    QL_FacrFECHA: TDateTimeField;
    QL_ValeESTACION: TIntegerField;
    QL_ValeCAJA: TIntegerField;
    QL_ValeFECHA: TDateTimeField;
    QL_ValeTURNO: TIntegerField;
    QL_ValeINDICE: TIntegerField;
    QL_ValeINDICEVALE: TIntegerField;
    QL_ValeIMPORTE: TFloatField;
    QL_ValeFACTURADO: TStringField;
    QL_ValeESTACIONFAC: TIntegerField;
    QL_ValeSERIEFAC: TStringField;
    QL_ValeFOLIOFAC: TIntegerField;
    QL_ValeCLIENTE: TIntegerField;
    QL_DvalPRODUCTO: TIntegerField;
    QL_DvalIMPORTE: TFloatField;
    PopupMenu1: TPopupMenu;
    FiltrarCliente: TMenuItem;
    FiltrarFecha: TMenuItem;
    QL_DvalNombreProducto: TStringField;
    GroupBox1: TGroupBox;
    QL_Dval2: TQuery;
    QL_Dval2PRODUCTO: TIntegerField;
    QL_Dval2TOTAL: TFloatField;
    QL_Dval2NombreProducto: TStringField;
    DSQL_Dval2: TDataSource;
    QL_Dval2PrecioPromedio: TFloatField;
    QL_Dval2Litros: TFloatField;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label3: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Label8: TLabel;
    MaskEdit2: TMaskEdit;
    QL_DvalINDICEVALE: TIntegerField;
    QL_PvalSUBCODIGO: TIntegerField;
    QL_PvalFECHAFACTURA: TDateTimeField;
    QL_ValeDESPACHADOR: TIntegerField;
    QL_ValeSUBCODIGO: TIntegerField;
    N1: TMenuItem;
    Panel6: TPanel;
    DBText2: TDBText;
    Label4: TLabel;
    Edit1: TEdit;
    DBText3: TDBText;
    QL_PvalReferencia: TStringField;
    SbBuscar: TSpeedButton;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalClientePaq: TStringField;
    BuscarFolioFactura1: TMenuItem;
    BuscarClaveCliente1: TMenuItem;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1TURNO: TcxGridDBColumn;
    cxGrid1DBTableView1CANTIDAD: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1FechaPaq: TcxGridDBColumn;
    cxGrid1DBTableView1FechaFacPaq: TcxGridDBColumn;
    cxGrid1DBTableView1Factura: TcxGridDBColumn;
    cxGrid1DBTableView1ClientePaq: TcxGridDBColumn;
    QL_DvalCANTIDAD: TFloatField;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    TT_Auxi: TRxMemoryData;
    TT_AuxiProducto: TIntegerField;
    TT_AuxiTotal: TFloatField;
    TT_AuxiNombreProducto: TStringField;
    TT_AuxiPrecioPromedio: TFloatField;
    TT_AuxiLitros: TFloatField;
    DBGrid5: TDBGrid;
    DS_TAuxi: TDataSource;
    CheckBox3: TCheckBox;
    btnInconsistencias: TSpeedButton;
    QL_ValeFOLIOVOLUMETRICO: TIntegerField;
    CheckBox4: TCheckBox;
    MaskEdit3: TMaskEdit;
    StaticText5: TStaticText;
    QL_DvalCLIENTE: TIntegerField;
    CBFiltrarFct: TCheckBox;
    FiltrarporFactura1: TMenuItem;
    procedure BbCalcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BbSalirClick(Sender: TObject);
    procedure BbImprimirClick(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QL_PvalCalcFields(DataSet: TDataSet);
    procedure ComboBox2Change(Sender: TObject);
    procedure FiltrarClienteClick(Sender: TObject);
    procedure FiltrarFechaClick(Sender: TObject);
    procedure QL_Dval2CalcFields(DataSet: TDataSet);
    procedure SBBuscarClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BuscarFolioFactura1Click(Sender: TObject);
    procedure BuscarClaveCliente1Click(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerFilterChanged(
      Sender: TObject);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox3Click(Sender: TObject);
    procedure btnInconsistenciasClick(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
    procedure MaskEdit3DblClick(Sender: TObject);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure FiltrarporFactura1Click(Sender: TObject);
    procedure CheckBox3Enter(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
    
  public
    { Public declarations }
    procedure RefrescaTabla;
    procedure CalculaTotal;
    procedure CalculaResumen;
  end;

var
  FLIQCONS01: TFLIQCONS01;
  pCliente:Integer;
  pEstacion:Integer;
  pTipoFac:string;
  pFolio:Integer;
  pFecha:TDateTime;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMGENQ, DDMGEN_VTAS, DDMGAS,
  DDMCUP, UGENCLIEB, ULIQCONS01I,ULIQVALVER, DDMLIQ;


{$R *.DFM}

procedure TFLIQCONS01.RefrescaTabla;
begin
  with DMGEN,DMGAS do begin
    QL_Pval.Close;
    QL_Pval.SQL.Clear;
    QL_Pval.SQL.Add('Select * from DGASPVAL');
    if CheckBox3.Checked then
      QL_Pval.SQL.Add(' Where Estacion>0')
    else
      QL_Pval.SQL.Add(' Where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    QL_Pval.SQL.Add('    and Cantidad>0 ');
    Case ComboBox2.ItemIndex of
      0:begin
          //pendientes
          QL_Pval.SQL.Add('    and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
          QL_Pval.SQL.Add('    and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
          QL_Pval.SQL.Add('    and (Facturado="No"  or (Facturado="Si"');
          QL_Pval.SQL.Add('    and FechaFactura>"'+FechaToStrSQL(VgFechaFin)+'"'+'))');
      end;
      1:begin
          //facturados
          QL_Pval.SQL.Add('    and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
          QL_Pval.SQL.Add('    and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
          QL_Pval.SQL.Add('    and FechaFactura>="'+FechaToStrSQL(VgFechaIni)+'"');
          QL_Pval.SQL.Add('    and FechaFactura<="'+FechaToStrSQL(VgFechaFin)+'"');
          QL_Pval.SQL.Add(' and Facturado="Si" ');
      end;
      2:begin
          //todos
          QL_Pval.SQL.Add('    and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
          QL_Pval.SQL.Add('    and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
      end;
    end;
    if (FiltrarCliente.Checked)or(not CheckBox4.Checked) then
      QL_Pval.SQL.Add(' and Cliente='+InttoStr(pCliente));
    if FiltrarFecha.Checked then
      QL_Pval.SQL.Add(' and Fecha="'+FechaToStrSQL(pFecha)+'"');
    if FiltrarporFactura1.Checked then begin
      QL_Pval.SQL.Add(' and EstacionFac='+IntToStr(pEstacion));
      QL_Pval.SQL.Add(' and SerieFac='+QuotedStr(pTipoFac));
      QL_Pval.SQL.Add(' and FolioFac='+IntToStr(pFolio));  
    end;
    Case ComboBox1.ItemIndex of
      0:QL_Pval.SQL.Add('Order by Fecha,Cliente');
      1:QL_Pval.SQL.Add('Order by Cliente,Fecha');
      2:QL_Pval.SQL.Add('Order by SerieFac,FolioFac');
    end;
    QL_Pval.Prepare;
    QL_Pval.Open;
    QL_Vale.Open;
    QL_Dval.Open;
    CalculaTotal;
    CalculaResumen;
  end;
end;


procedure TFLIQCONS01.CalculaTotal;
begin
  with DMGEN,DMGAS do begin
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_AuxiReal2.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Sum(Cantidad) as Entero1,Sum(Total) as Real2 from DGASPVAL');
    Q_Auxi.SQL.Add(' Where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    Q_Auxi.SQL.Add('    and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    Q_Auxi.SQL.Add('    and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    Case ComboBox2.ItemIndex of
      0:Q_Auxi.SQL.Add(' and Facturado="No" ');
      1:Q_Auxi.SQL.Add(' and Facturado="Si" ');
    end;
    if (FiltrarCliente.Checked)or(not CheckBox4.Checked) then
      Q_Auxi.SQL.Add(' and Cliente='+InttoStr(pCliente));
    if FiltrarFecha.Checked then
      Q_Auxi.SQL.Add(' and Fecha="'+FechaToStrSQL(pFecha)+'"');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    StaticText1.Caption:=FormatFloat('###,##0',Q_AuxiEntero1.AsInteger);
    StaticText2.Caption:=FormatoMoneda(Q_AuxiReal2.AsFloat);
    StaticText1.Refresh;
    StaticText2.Refresh;
  end;
end;


procedure TFLIQCONS01.CalculaResumen;
var xtotlitros,
    xtotimporte:double;
    x2totlitros,
    x2totimporte:double;
begin
  with DMGEN,DMGAS do begin
    QL_Dval2.Close;
    QL_Dval2.SQL.Clear;
    QL_Dval2.SQL.Add('Select d.Producto,Sum(d.Importe) as Total from DGASDVAL d');
    QL_Dval2.SQL.Add(' Where d.Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    QL_Dval2.SQL.Add('    and d.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Dval2.SQL.Add('    and d.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    Case ComboBox2.ItemIndex of
      0:begin
          QL_Dval2.SQL.Add(' and ((d.Facturado="No") or exists (select m.* from DGASPVAL m where d.estacion=m.estacion and d.caja=m.caja and d.fecha=m.fecha');
          QL_Dval2.SQL.Add('       and d.turno=m.turno and d.indice=m.indice and m.FechaFactura>"'+FechaToStrSQL(VgFechaFin)+'" and m.Facturado='+QuotedStr('Si')+'))');
        end;
      1:QL_Dval2.SQL.Add(' and d.Facturado="Si" ');
    end;
    if (FiltrarCliente.Checked)or(not CheckBox4.Checked) then
      QL_Dval2.SQL.Add(' and d.Cliente='+InttoStr(pCliente));
    if FiltrarFecha.Checked then
      QL_Dval2.SQL.Add(' and d.Fecha="'+FechaToStrSQL(pFecha)+'"');
    if FiltrarporFactura1.Checked then begin
      QL_Dval2.SQL.Add(' and d.EstacionFac='+IntToStr(pEstacion));
      QL_Dval2.SQL.Add(' and d.SerieFac='+QuotedStr(pTipoFac));
      QL_Dval2.SQL.Add(' and d.FolioFac='+IntToStr(pFolio));
    end;
    QL_Dval2.SQL.Add('Group by d.Producto');
    QL_Dval2.SQL.Add('Order by d.Producto');
    QL_Dval2.Prepare;
    QL_Dval2.Open;
    try
      QL_Dval2.DisableControls;
      xtotlitros:=0; xtotimporte:=0;
      while not QL_Dval2.Eof do begin
        xtotlitros:=xtotlitros+QL_Dval2Litros.AsFloat;
        xtotimporte:=xtotimporte+QL_Dval2Total.AsFloat;
        QL_Dval2.Next;
      end;

  {     // resumen alterno
      TT_Auxi.Active:=TRUE;
      TT_Auxi.DisableControls;
      QL_Pval.DisableControls;
      QL_Pval.First;
      while not QL_Pval.Eof do begin
        QL_vale.DisableControls;
        QL_Vale.Close;
        QL_Vale.Open;
        QL_Vale.First;
        while not QL_vale.Eof do begin
          QL_Dval.Close;
          QL_Dval.Open;
          if TT_Auxi.Locate('Producto',QL_DvalPRODUCTO.AsInteger,[loPartialKey]) then begin
            TT_Auxi.Edit;
            TT_AuxiTotal.AsFloat:=TT_AuxiTotal.AsFloat+QL_DvalIMPORTE.AsFloat;
            TT_AuxiLitros.AsFloat:=TT_AuxiLitros.AsFloat+QL_DvalCANTIDAD.AsFloat;
          end
          else begin
            TT_Auxi.Insert;
            TT_AuxiProducto.AsInteger:=QL_DvalPRODUCTO.AsInteger;
            TT_AuxiTotal.AsFloat:=QL_DvalIMPORTE.AsFloat;
            TT_AuxiLitros.AsFloat:=QL_DvalCANTIDAD.AsFloat;
          end;
          TT_Auxi.Post;
          QL_vale.Next;
        end;
        QL_vale.EnableControls;
        QL_Pval.Next;
      end;
      TT_Auxi.DisableControls;
      TT_Auxi.First;
      x2totlitros:=0; x2totimporte:=0;
      while not TT_Auxi.Eof do begin
        x2totlitros:=x2totlitros+TT_AuxiLitros.AsFloat;
        x2totimporte:=x2totimporte+TT_AuxiTotal.AsFloat;
        TT_Auxi.Next;
      end;
      QL_Pval.EnableControls;
      TT_Auxi.EnableControls;

       // resumen alterno
      TT_Auxi.Active:=TRUE;
      TT_Auxi.DisableControls;
      QL_Pval.DisableControls;
      QL_Pval.First;
      while not QL_Pval.Eof do begin
        QL_vale.DisableControls;
        QL_Vale.Close;
        QL_Vale.Open;
        QL_Vale.First;
        while not QL_vale.Eof do begin
          QL_Dval.Close;
          QL_Dval.Open;
          if TT_Auxi.Locate('Producto',QL_DvalPRODUCTO.AsInteger,[loPartialKey]) then begin
            TT_Auxi.Edit;
            TT_AuxiTotal.AsFloat:=TT_AuxiTotal.AsFloat+QL_DvalIMPORTE.AsFloat;
            TT_AuxiLitros.AsFloat:=TT_AuxiLitros.AsFloat+QL_DvalCANTIDAD.AsFloat;
          end
          else begin
            TT_Auxi.Insert;
            TT_AuxiProducto.AsInteger:=QL_DvalPRODUCTO.AsInteger;
            TT_AuxiTotal.AsFloat:=QL_DvalIMPORTE.AsFloat;
            TT_AuxiLitros.AsFloat:=QL_DvalCANTIDAD.AsFloat;
          end;
          TT_Auxi.Post;
          QL_vale.Next;
        end;
        QL_vale.EnableControls;
        QL_Pval.Next;
      end;
      TT_Auxi.DisableControls;
      TT_Auxi.First;
      x2totlitros:=0; x2totimporte:=0;
      while not TT_Auxi.Eof do begin
        x2totlitros:=x2totlitros+TT_AuxiLitros.AsFloat;
        x2totimporte:=x2totimporte+TT_AuxiTotal.AsFloat;
        TT_Auxi.Next;
      end;
      QL_Pval.EnableControls;
      TT_Auxi.EnableControls;  }
    finally
      StaticText3.Caption:=FormatoMoneda(xtotlitros);
      StaticText4.Caption:=FormatoMoneda(xtotimporte);
      StaticText3.Refresh;
      StaticText4.Refresh;
//      StaticText5.Caption:=FormatoMoneda(x2totlitros);
//      StaticText6.Caption:=FormatoMoneda(x2totimporte);
//      StaticText5.Refresh;
//      StaticText6.Refresh;
      TT_Auxi.EnableControls;
      TT_Auxi.SortOnFields('Producto',true,false);
      QL_Dval2.EnableControls;
    end;
  end;
end;

procedure TFLIQCONS01.BbCalcularClick(Sender: TObject);
begin
  with DMGENQ,DMGEN,DMGEN_VTAS,DMGAS do begin
    try
      if (not CheckBox4.Checked)and(MaskEdit3.Text='') then
        raise Exception.Create('No se Indicó el Cliente.');
      BbCalcular.SetFocus;
      BbSalir.Enabled:=false;
      VgFechaIni:=StrToDate(MaskEdit1.text);
      VgFechaFin:=StrToDate(MaskEdit2.text);
      if not FechaEnEjercicio(VgFechaIni,idGas) then
        raise Exception.Create('Fecha inicial no es del Ejercicio');
      if not FechaEnEjercicio(VgFechaFin,idGas) then
        raise Exception.Create('Fecha final no es del Ejercicio');
      if VgFechaIni>VgFechaFin then
        raise Exception.Create('Periodo Inválido');
      RefrescaTabla;
      btnInconsistencias.Enabled:=TRUE;
    finally
      Label4.Enabled:=true;
      Edit1.Enabled:=true;
      SBbuscar.Enabled:=true;
      BbCalcular.Enabled:=false;
      BbSalir.Enabled:=true;
      BbSalir.SetFocus;
    end;
  end;
end;

procedure TFLIQCONS01.FormShow(Sender: TObject);
begin
  with DMGAS do begin
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue:=EstacionActual;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
    MaskEdit1.EditMask:=MaskFecha2;
    MaskEdit2.EditMask:=MaskFecha2;
    MaskEdit1.Text:=FechaToFormato(VgFechaIni);
    MaskEdit2.Text:=FechaToFormato(VgFechaFin);
    (*
    if (IdSist=idGas)or(IdSist=idCup)or(IdSist=idLiq)or(IdSist=idPvg) then begin
      cxGrid1DBTableView1.Styles.ContentEven.Color:=Color1GridViewIgas;
      cxGrid1DBTableView1.Styles.ContentOdd.Color:=Color2GridViewIgas;
      cxGrid1DBTableView1.Styles.Header.Color:=ColorEncabezadoGridViewIgas;
    end;
    *)
    MaskEdit1.SetFocus;
    ComboBox1.ItemIndex:=0;
    ComboBox2.ItemIndex:=0;
  end;
end;


procedure TFLIQCONS01.BbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQCONS01.BbImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQCONS01I,FLIQCONS01I);
  try
    QL_Pval.DisableControls;
    QL_Vale.DisableControls;
    QL_Dval.DisableControls;
    QL_Dval2.DisableControls;
    FLIQCONS01I.PreparaReporte;
    if Sender = BbPrever then
      FLIQCONS01I.QuickRep1.Preview
    else
      FLIQCONS01I.QuickRep1.Print;
  finally
    FLIQCONS01I.Free;
    QL_Pval.EnableControls;
    QL_Vale.EnableControls;
    QL_Dval.EnableControls;
    QL_Dval2.EnableControls;    
  end;
end;

procedure TFLIQCONS01.Panel1Enter(Sender: TObject);
begin
  BbCalcular.Enabled:=true;
  QL_Pval.Close;
  QL_Vale.Close;
  QL_Dval.Close;
  QL_Dval2.Close;
  StaticText1.Caption:='';
  StaticText2.Caption:='';
  StaticText3.Caption:='';
  StaticText4.Caption:='';
  Edit1.Text:='';
  Label4.Enabled:=false;
  Edit1.Enabled:=false;
  SBbuscar.Enabled:=false;
  TT_Auxi.Active:=TRUE;
  TT_Auxi.EmptyTable;
  TT_Auxi.Active:=FALSE;
  btnInconsistencias.Enabled:=False;
end;

procedure TFLIQCONS01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN do begin
    QL_Pval.Close;
    QL_Vale.Close;
    QL_Dval.Close;
    QL_Dval2.Close;    
  end;
end;

procedure TFLIQCONS01.QL_PvalCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_PvalFechaPaq.AsString:=FechaPaq(QL_PvalFecha.AsDateTime);
    QL_PvalClientePaq.AsString:=InttoClaveNum(QL_PvalCliente.AsInteger,6);
    QL_PvalFactura.AsString:='';
    QL_PvalFechaFacPaq.Asstring:='';
    QL_PvalReferencia.AsString:='';
    if QL_PvalSubCodigo.AsInteger>0 then
      QL_PvalReferencia.AsString:=IntToClaveNum(QL_PvalSubCodigo.AsInteger,3);
    if QL_PvalFacturado.AsString='Si' then begin
      QL_PvalFactura.AsString:=QL_PvalSerieFac.AsString+'-'+IntToClaveNum(QL_PvalFolioFac.AsInteger,6);
      QL_PvalFechaFacPaq.AsString:=FechaPaq(QL_PvalFechaFactura.AsDateTime);
    end;
  end;
end;

procedure TFLIQCONS01.ComboBox2Change(Sender: TObject);
begin
//  RefrescaTabla;
//  BbCalcular.Enabled:=false;
end;

procedure TFLIQCONS01.FiltrarClienteClick(Sender: TObject);
begin
  if Sender=CheckBox1 then begin
    FiltrarCliente.Checked:=CheckBox1.Checked;
  end
  else begin
    FiltrarCliente.Checked:=not FiltrarCliente.Checked;
    CheckBox1.Checked:=FiltrarCliente.Checked;
  end;
  if not FiltrarCliente.Checked then begin
    CBFiltrarFct.Checked:=FiltrarCliente.Checked;
  end;
  pCliente:=QL_PvalCliente.AsInteger;
  RefrescaTabla;
  cxGrid1DBTableView1ClientePaq.Filtered:=CheckBox1.Checked;
end;

procedure TFLIQCONS01.FiltrarFechaClick(Sender: TObject);
begin
  if Sender=CheckBox2 then begin
    FiltrarFecha.Checked:=CheckBox2.Checked;
  end
  else begin
    FiltrarFecha.Checked:=not FiltrarFecha.Checked;
    CheckBox2.Checked:=FiltrarFecha.Checked;
  end;
  pFecha:=QL_PvalFecha.AsDateTime;
  RefrescaTabla;
  cxGrid1DBTableView1FechaPaq.Filtered:=CheckBox2.Checked;
end;

procedure TFLIQCONS01.QL_Dval2CalcFields(DataSet: TDataSet);
var xprecio1,
    xprecio2,
    xtasa:real;
begin
  with DMGAS,DMCUP do begin
    DamePrecioFecha(QL_Dval2Producto.AsInteger,VgFechaIni,xprecio1,xtasa);
    DamePrecioFecha(QL_Dval2Producto.AsInteger,VgFechaFin,xprecio2,xtasa);
    QL_Dval2PrecioPromedio.AsFloat:=AjustaFloat(DivideFloat(xprecio1+xprecio2,2),2);
    QL_Dval2Litros.AsFloat:=AjustaFloat(DivideFloat(QL_Dval2Total.AsFloat,QL_Dval2PrecioPromedio.AsFloat),2);
  end;
end;

procedure TFLIQCONS01.SBBuscarClick(Sender: TObject);
begin
  with DMGEN,DMGEN_VTAS do begin
    if TV_Clie.Locate('Nombre',Edit1.Text,[loCaseInsensitive, loPartialKey]) then begin
      if QL_Pval.Locate('Cliente',TV_ClieNoClie.AsInteger,[]) then begin
        FiltrarCliente.Checked:=true;
        CheckBox1.Checked:=true;
        RefrescaTabla;
      end;
    end
    else begin
      if QL_Pval.Locate('Cliente',Edit1.Text,[]) then begin
        FiltrarCliente.Checked:=true;
        CheckBox1.Checked:=true;
        RefrescaTabla;
      end;
    end;
  end;
end;

procedure TFLIQCONS01.Edit1Enter(Sender: TObject);
begin
  BbCalcular.Enabled:=true;
  if CheckBox1.Checked then begin
    CheckBox1.Checked:=false;
    RefrescaTabla;
  end;
end;

procedure TFLIQCONS01.MaskEdit1Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit1.text);
  MaskEdit2.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

procedure TFLIQCONS01.BuscarFolioFactura1Click(Sender: TObject);
var ss:string;
    ii:integer;
begin
  with DMGAS do begin
    ss:=InputBox('Búsqueda de Factura','Teclee el Folio: ',' ');
    try
      ii:=StrToInt(ss);
      if not QL_Pval.Locate('FolioFac',ii,[]) then
        MensajeInfo('Folio de Factura no encontrado...');
    except
      Mensajeerr('Folio debe ser Numérico');
      Abort;
    end;
  end;
end;

procedure TFLIQCONS01.BuscarClaveCliente1Click(Sender: TObject);
var ss:string;
    ii:integer;
begin
  with DMGAS do begin
    ss:=InputBox('Búsqueda de Claves','Teclee Clave Cliente: ',' ');
    try
      ii:=StrToInt(ss);
      if not QL_Pval.Locate('Cliente',ii,[]) then
        MensajeInfo('Clave de Cliente no encontrada...');
    except
      Mensajeerr('Clave debe ser Numérico');
      Abort;
    end;
  end;
end;

procedure TFLIQCONS01.cxGrid1DBTableView1DataControllerFilterChanged(
  Sender: TObject);
begin
  if  cxGrid1DBTableView1ClientePaq.Filtered then
    CheckBox1.Checked:=TRUE
  else
    CheckBox1.Checked:=FALSE;
  if  cxGrid1DBTableView1FechaPaq.Filtered then
    CheckBox2.Checked:=TRUE
  else
    CheckBox2.Checked:=FALSE;
end;

procedure TFLIQCONS01.TT_AuxiCalcFields(DataSet: TDataSet);
var xprecio1,
    xprecio2,
    xtasa:real;
begin
  with DMGAS,DMCUP do begin
    //DamePrecioFecha(TT_AuxiProducto.AsInteger,VgFechaIni,xprecio1,xtasa);
    //DamePrecioFecha(TT_AuxiProducto.AsInteger,VgFechaFin,xprecio2,xtasa);
    TT_AuxiPrecioPromedio.AsFloat:=AjustaFloat(DivideFloat(TT_AuxiTotal.AsFloat,TT_AuxiLitros.AsFloat),2);
//    TT_AuxiPrecioPromedio.AsFloat:=AjustaFloat(DivideFloat(xprecio1+xprecio2,2),2);
//    TT_AuxiLitros.AsFloat:=AjustaFloat(DivideFloat(TT_AuxiTotal.AsFloat,TT_AuxiPrecioPromedio.AsFloat),2);
  end;
end;

procedure TFLIQCONS01.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF5 then begin
    //SBBuscarClick(Sender);
    FGENCLIEB.PreparaForma(Edit1.Text);
    if FGENCLIEB.ShowModal=mrOk then begin
      pcliente:=FGENCLIEB.ClaveClie;
      Edit1.Text:=FGENCLIEB.NombreClie;
    end;
  end;
  if Key=13 then
    SBBuscarClick(Sender);
end;

procedure TFLIQCONS01.CheckBox3Click(Sender: TObject);
begin
  DBLookupComboBox2.Enabled:=not CheckBox3.Checked;
end;

procedure TFLIQCONS01.btnInconsistenciasClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFLIQVALVER,FLIQVALVER);
    FLIQVALVER.ShowModal;
  finally
    FLIQVALVER.Free;
    BbCalcular.Click;
  end;  

end;

procedure TFLIQCONS01.Edit1DblClick(Sender: TObject);
begin
  FGENCLIEB.PreparaForma(Edit1.Text);
  if FGENCLIEB.ShowModal=mrOk then begin
    pcliente:=FGENCLIEB.ClaveClie;
    Edit1.Text:=FGENCLIEB.NombreClie;
  end;
end;

procedure TFLIQCONS01.MaskEdit3DblClick(Sender: TObject);
begin
  if FGENCLIEB.ShowModal=mrOK then with DMGEN do begin
    MaskEdit3.Text:=InttoClaveCata(FGENCLIEB.ClaveClie,idClie);
    MaskEdit3Exit(Sender);
  end;
end;

procedure TFLIQCONS01.MaskEdit3Enter(Sender: TObject);
begin
  MaskEdit3.Text:='';
end;

procedure TFLIQCONS01.MaskEdit3Exit(Sender: TObject);
begin
  with DMGENQ,DMGEN_VTAS do begin
    if MaskEdit3.Text='' then
      exit;
    try
      if not BuscaQuery(QB_Clie,'pNoClie',StrtoInt(MaskEdit3.text)) then
        raise Exception.Create('No existe Cliente');
      MaskEdit3.Text:=DMGEN.IntToClaveCata(StrToInt(MaskEdit3.Text),idClie);
      StaticText5.Caption:=QB_ClieNombre.AsString;
      pCliente:=QB_ClieNOCLIE.AsInteger;
    except
      MaskEdit3.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQCONS01.CheckBox4Click(Sender: TObject);
begin
  MaskEdit3.Enabled:= not CheckBox4.Checked;
  if CheckBox4.Checked then begin
    MaskEdit3.Text:='';
    StaticText5.Caption:='';
    CheckBox1.Checked:=False;
    CheckBox2.Checked:=False;
  end;
end;

procedure TFLIQCONS01.FiltrarporFactura1Click(Sender: TObject);
begin
  pCliente:=QL_PvalCliente.AsInteger;
  pEstacion:=QL_PvalESTACIONFAC.AsInteger;
  pTipoFac:=QL_PvalSERIEFAC.AsString;
  pFolio:=QL_PvalFOLIOFAC.AsInteger;
  if Sender=CBFiltrarFct then begin
    CheckBox1.Checked:=CBFiltrarFct.Checked;
    FiltrarCliente.Checked:=CBFiltrarFct.Checked;
    FiltrarporFactura1.Checked:=CBFiltrarFct.Checked;
  end
  else begin
    FiltrarCliente.Checked:=not FiltrarCliente.Checked;
    CheckBox1.Checked:=FiltrarCliente.Checked;
    CBFiltrarFct.Checked:=CheckBox1.Checked;
    FiltrarporFactura1.Checked:=CBFiltrarFct.Checked;
  end;
  RefrescaTabla;
  cxGrid1DBTableView1ClientePaq.Filtered:=CheckBox1.Checked;
  cxGrid1DBTableView1Factura.Filtered:=CBFiltrarFct.Checked;
end;

procedure TFLIQCONS01.CheckBox3Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      ComboBox2.SetFocus;
  end;
end;

procedure TFLIQCONS01.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      ComboBox2.SetFocus;
  end;
end;

end.
