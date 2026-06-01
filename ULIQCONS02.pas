unit ULIQCONS02;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids, Db, DBTables,
  Menus, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TFLIQCONS02 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BbSalir: TBitBtn;
    BbCalcular: TBitBtn;
    BbImprimir: TBitBtn;
    DBNavigator1: TDBNavigator;
    BbPrever: TBitBtn;
    Label9: TLabel;
    ComboBox1: TComboBox;
    QL_Tran: TQuery;
    DSQL_Tran: TDataSource;
    PopupMenu1: TPopupMenu;
    FiltrarCliente: TMenuItem;
    FiltrarFecha: TMenuItem;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Label8: TLabel;
    MaskEdit2: TMaskEdit;
    N1: TMenuItem;
    Panel3: TPanel;
    QL_TranTIPOVENTA: TStringField;
    QL_TranESTACION: TIntegerField;
    QL_TranFOLIO: TIntegerField;
    QL_TranISLA: TIntegerField;
    QL_TranBOMBA: TIntegerField;
    QL_TranFECHA: TDateTimeField;
    QL_TranTURNO: TIntegerField;
    QL_TranHORA: TDateTimeField;
    QL_TranCLIENTE: TIntegerField;
    QL_TranVEHICULO: TIntegerField;
    QL_TranCOMBUSTIBLE: TIntegerField;
    QL_TranPRECIO: TFloatField;
    QL_TranLITROS: TFloatField;
    QL_TranIMPORTECMB: TFloatField;
    QL_TranIMPORTEOTR: TFloatField;
    QL_TranTOTAL: TFloatField;
    QL_TranESTATUS: TStringField;
    QL_TranDESPACHADOR: TIntegerField;
    QL_TranINDICE: TIntegerField;
    QL_TranKILOMETRAJE: TIntegerField;
    QL_TranPOSCARGA: TIntegerField;
    QL_TranTASAIVA: TFloatField;
    QL_TranTURNOLIQ: TIntegerField;
    QL_TranFACTURADO: TStringField;
    QL_TranESTACIONFAC: TIntegerField;
    QL_TranSERIEFAC: TStringField;
    QL_TranFOLIOFAC: TIntegerField;
    QL_TranENLINEA: TStringField;
    QL_TranFOLIOFUERALINEA: TIntegerField;
    QL_TranMODOCARGA: TStringField;
    QL_TranFECHAFACTURA: TDateTimeField;
    QL_TranSUBCODIGO: TIntegerField;
    QL_TranFechaPaq: TStringField;
    QL_TranClientePaq: TStringField;
    QL_TranFactura: TStringField;
    QL_TranFechaFacPaq: TStringField;
    QL_TranReferencia: TStringField;
    QL_TranFolioTran: TStringField;
    Panel6: TPanel;
    QL_TranNombreCombustible: TStringField;
    QL_TranNombreCliente: TStringField;
    QL_TranNombreDespachador: TStringField;
    Panel4: TPanel;
    Panel5: TPanel;
    DBText2: TDBText;
    DBText3: TDBText;
    Label4: TLabel;
    Edit1: TEdit;
    ListView2: TListView;
    QL_Tran2: TQuery;
    QL_Tran2COMBUSTIBLE: TIntegerField;
    QL_Tran2CANTIDAD: TFloatField;
    QL_Tran2IMPORTECMB: TFloatField;
    QL_Tran2IMPORTEOTROS: TFloatField;
    QL_Tran2TOTAL: TFloatField;
    QL_Tran2NombreCombustible: TStringField;
    ListView1: TListView;
    QL_Tran3: TQuery;
    QL_Tran3ISLA: TIntegerField;
    QL_Tran3CANTIDAD: TFloatField;
    QL_Tran3IMPORTECMB: TFloatField;
    QL_Tran3IMPORTEOTROS: TFloatField;
    QL_Tran3TOTAL: TFloatField;
    DBText1: TDBText;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    ComboBox5: TComboBox;
    QL_TranFOLIOVOLUMETRICO: TIntegerField;
    sbbuscar: TSpeedButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ISLA: TcxGridDBColumn;
    cxGrid1DBTableView1TURNO: TcxGridDBColumn;
    cxGrid1DBTableView1LITROS: TcxGridDBColumn;
    cxGrid1DBTableView1IMPORTECMB: TcxGridDBColumn;
    cxGrid1DBTableView1IMPORTEOTR: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1DESPACHADOR: TcxGridDBColumn;
    cxGrid1DBTableView1FechaPaq: TcxGridDBColumn;
    cxGrid1DBTableView1ClientePaq: TcxGridDBColumn;
    cxGrid1DBTableView1Factura: TcxGridDBColumn;
    cxGrid1DBTableView1FechaFacPaq: TcxGridDBColumn;
    cxGrid1DBTableView1FolioTran: TcxGridDBColumn;
    cxGrid1DBTableView1NombreCombustible: TcxGridDBColumn;
    cxGrid1DBTableView1FOLIOVOLUMETRICO: TcxGridDBColumn;
    CheckBox3: TCheckBox;
    FiltrarFactura: TMenuItem;
    Label11: TLabel;
    ComboBox3: TComboBox;
    VerFotografias: TMenuItem;
    procedure BbCalcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BbSalirClick(Sender: TObject);
    procedure BbImprimirClick(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QL_TranCalcFields(DataSet: TDataSet);
    procedure FiltrarClienteClick(Sender: TObject);
    procedure FiltrarFechaClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure cxGrid1DBTableView1DataControllerFilterChanged(
      Sender: TObject);
    procedure FiltrarFacturaClick(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure VerFotografiasClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefrescaTabla;
    procedure CalculaResumen;
  end;

var
  FLIQCONS02: TFLIQCONS02;
  pCliente:Integer;
  pFecha:TDateTime;
  pEstacionFac:Integer;
  pSerieFac:string[2];
  pFolioFac:Integer;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMGENQ, DDMGEN_VTAS, DDMGAS,
  DDMCUP, UGENCLIEB, ULIQCONS01I, ULIQCONS02I, DDMLIQ, UGASTRANFOTOS;


{$R *.DFM}

procedure TFLIQCONS02.RefrescaTabla;
begin
  with DMGEN,DMGAS do begin
    QL_Tran.Close;
    QL_Tran.SQL.Clear;
    QL_Tran.SQL.Add('Select * from DGASTRAN');
    QL_Tran.SQL.Add(' Where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    QL_Tran.SQL.Add('    and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Tran.SQL.Add('    and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    QL_Tran.SQL.Add('    and Total>0.001 ');
    QL_Tran.SQL.Add('    and Estatus="A" ');
    QL_Tran.SQL.Add('    and Isla>0 ');
    Case ComboBox2.ItemIndex of
      0:QL_Tran.SQL.Add(' and Facturado="No" ');
      1:QL_Tran.SQL.Add(' and Facturado="Si" ');
    end;
    Case ComboBox5.ItemIndex of
      1:QL_Tran.SQL.Add(' and TipoVenta="CR" ');
      2:QL_Tran.SQL.Add(' and TipoVenta="PP" ');
    end;
    Case ComboBox3.ItemIndex of
      1:QL_Tran.SQL.Add(' and TipoCarga="M" ');
      2:QL_Tran.SQL.Add(' and TipoCarga="N" ');
    end;
    if FiltrarCliente.Checked then
      QL_Tran.SQL.Add(' and Cliente='+InttoStr(pCliente));
    if FiltrarFecha.Checked then
      QL_Tran.SQL.Add(' and Fecha="'+FechaToStrSQL(pFecha)+'"');
    if FiltrarFactura.Checked then begin
      QL_Tran.SQL.Add(' and EstacionFac='+IntToStr(pEstacionFac));
      QL_Tran.SQL.Add(' and SerieFac='+QuotedStr(pSerieFac));
      QL_Tran.SQL.Add(' and FolioFac='+IntToStr(pFolioFac));
    end;
    Case ComboBox1.ItemIndex of
      0:QL_Tran.SQL.Add('Order by Fecha,Cliente');
      1:QL_Tran.SQL.Add('Order by Cliente,Fecha');
      2:QL_Tran.SQL.Add('Order by SerieFac,FolioFac');
      3:QL_Tran.SQL.Add('Order by FolioVolumetrico');
    end;
    QL_Tran.Prepare;
    QL_Tran.Open;
    CalculaResumen;
  end;
end;


procedure TFLIQCONS02.CalculaResumen;
var tot:array[1..4] of double;
    li:Tlistitem;
    i:word;
begin
  with DMGEN,DMGAS do begin
    QL_Tran2.Close;
    QL_Tran2.SQL.Clear;
    QL_Tran2.SQL.Add('Select Combustible,Sum(Litros) as Cantidad, Sum(ImporteCmb) as ImporteCmb, ');
    QL_Tran2.SQL.Add('  Sum(ImporteOtr) as ImporteOtros, Sum(Total) as Total');
    QL_Tran2.SQL.Add('from DGASTRAN');
    QL_Tran2.SQL.Add(' Where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    QL_Tran2.SQL.Add('    and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Tran2.SQL.Add('    and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    QL_Tran2.SQL.Add('    and Isla>0');
    Case ComboBox2.ItemIndex of
      0:QL_Tran2.SQL.Add(' and Facturado="No" ');
      1:QL_Tran2.SQL.Add(' and Facturado="Si" ');
    end;
    Case ComboBox5.ItemIndex of
      1:QL_Tran2.SQL.Add(' and TipoVenta="CR" ');
      2:QL_Tran2.SQL.Add(' and TipoVenta="PP" ');
    end;
    Case ComboBox3.ItemIndex of
      1:QL_Tran2.SQL.Add(' and TipoCarga="M" ');
      2:QL_Tran2.SQL.Add(' and TipoCarga="N" ');
    end;    
    if FiltrarCliente.Checked then
      QL_Tran2.SQL.Add(' and Cliente='+InttoStr(pCliente));
    if FiltrarFecha.Checked then
      QL_Tran2.SQL.Add(' and Fecha="'+FechaToStrSQL(pFecha)+'"');
    if FiltrarFactura.Checked then begin
      QL_Tran2.SQL.Add(' and EstacionFac='+IntToStr(pEstacionFac));
      QL_Tran2.SQL.Add(' and SerieFac='+QuotedStr(pSerieFac));
      QL_Tran2.SQL.Add(' and FolioFac='+IntToStr(pFolioFac));
    end;
    QL_Tran2.SQL.Add('Group by Combustible');
    QL_Tran2.SQL.Add('Order by Combustible');
    QL_Tran2.Prepare;
    QL_Tran2.Open;
    for i:=1 to 4 do
      tot[i]:=0;
    ListView1.Items.Clear;
    QL_Tran2.DisableControls;
    with ListView1 do begin
      while not QL_Tran2.Eof do begin
        li:=Items.Add;
        li.Caption:='';
        li.SubItems.Add(QL_Tran2NombreCombustible.AsString);
        li.SubItems.Add(FormatoMoneda(QL_Tran2Cantidad.AsFloat));
        Li.SubItems.Add(FormatoMoneda(QL_Tran2ImporteCmb.AsFloat));
        Li.SubItems.Add(SetEspacios(QL_Tran2ImporteOtros.AsFloat));
        Li.SubItems.Add(FormatoMoneda(QL_Tran2Total.AsFloat));
        tot[1]:=tot[1]+QL_Tran2Cantidad.AsFloat;
        tot[2]:=tot[2]+QL_Tran2ImporteCmb.AsFloat;
        tot[3]:=tot[3]+QL_Tran2ImporteOtros.AsFloat;
        tot[4]:=tot[4]+QL_Tran2Total.AsFloat;
        QL_Tran2.Next;
      end;
      li:=Items.Add;
      li:=Items.Add;
      li.Caption:='';
      li.SubItems.Add('Total');
      for i:=1 to 4 do begin
        li.SubItems.Add(FormatoMoneda(tot[i]));
      end;
    end;
// RESUMEN POR ISLAS
    QL_Tran3.Close;
    QL_Tran3.SQL.Clear;
    QL_Tran3.SQL.Add('Select Isla,Sum(Litros) as Cantidad, Sum(ImporteCmb) as ImporteCmb, ');
    QL_Tran3.SQL.Add('  Sum(ImporteOtr) as ImporteOtros, Sum(Total) as Total');
    QL_Tran3.SQL.Add('from DGASTRAN');
    QL_Tran3.SQL.Add(' Where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    QL_Tran3.SQL.Add('    and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Tran3.SQL.Add('    and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    QL_Tran3.SQL.Add('    and Isla>0');
    Case ComboBox2.ItemIndex of
      0:QL_Tran3.SQL.Add(' and Facturado="No" ');
      1:QL_Tran3.SQL.Add(' and Facturado="Si" ');
    end;
    Case ComboBox5.ItemIndex of
      1:QL_Tran3.SQL.Add(' and TipoVenta="CR" ');
      2:QL_Tran3.SQL.Add(' and TipoVenta="PP" ');
    end;
    Case ComboBox3.ItemIndex of
      1:QL_Tran3.SQL.Add(' and TipoCarga="M" ');
      2:QL_Tran3.SQL.Add(' and TipoCarga="N" ');
    end;   
    if FiltrarCliente.Checked then
      QL_Tran3.SQL.Add(' and Cliente='+InttoStr(pCliente));
    if FiltrarFecha.Checked then
      QL_Tran3.SQL.Add(' and Fecha="'+FechaToStrSQL(pFecha)+'"');
    if FiltrarFactura.Checked then begin
      QL_Tran3.SQL.Add(' and EstacionFac='+IntToStr(pEstacionFac));
      QL_Tran3.SQL.Add(' and SerieFac='+QuotedStr(pSerieFac));
      QL_Tran3.SQL.Add(' and FolioFac='+IntToStr(pFolioFac));
    end;
    QL_Tran3.SQL.Add(' and Total>0.001');
    QL_Tran3.SQL.Add('Group by Isla');
    QL_Tran3.SQL.Add('Order by Isla');
    QL_Tran3.Prepare;
    QL_Tran3.Open;
    for i:=1 to 4 do
      tot[i]:=0;
    ListView2.Items.Clear;
    QL_Tran3.DisableControls;
    with ListView2 do begin
      while not QL_Tran3.Eof do begin
        li:=Items.Add;
        li.Caption:='';
        li.SubItems.Add(IntToClaveNum(QL_Tran3Isla.AsInteger,2));
        li.SubItems.Add(FormatoMoneda(QL_Tran3Cantidad.AsFloat));
        Li.SubItems.Add(FormatoMoneda(QL_Tran3ImporteCmb.AsFloat));
        Li.SubItems.Add(SetEspacios(QL_Tran3ImporteOtros.AsFloat));
        Li.SubItems.Add(FormatoMoneda(QL_Tran3Total.AsFloat));
        tot[1]:=tot[1]+QL_Tran3Cantidad.AsFloat;
        tot[2]:=tot[2]+QL_Tran3ImporteCmb.AsFloat;
        tot[3]:=tot[3]+QL_Tran3ImporteOtros.AsFloat;
        tot[4]:=tot[4]+QL_Tran3Total.AsFloat;
        QL_Tran3.Next;
      end;
      li:=Items.Add;
      li:=Items.Add;
      li.Caption:='';
      li.SubItems.Add('Total');
      for i:=1 to 4 do begin
        li.SubItems.Add(FormatoMoneda(tot[i]));
      end;
    end;
  end;
end;

procedure TFLIQCONS02.BbCalcularClick(Sender: TObject);
begin
  with DMGENQ,DMGEN,DMGEN_VTAS,DMGAS do begin
    try
      BbCalcular.SetFocus;
      BbSalir.Enabled:=false;
      VgFechaIni:=StrToDate(MaskEdit1.text);
      VgFechaFin:=StrToDate(MaskEdit2.text);
      if VgFechaIni>VgFechaFin then
        raise Exception.Create('Periodo Inválido');
      RefrescaTabla;
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

procedure TFLIQCONS02.FormShow(Sender: TObject);
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
    ComboBox3.ItemIndex:=0;
    ComboBox5.ItemIndex:=0;
  end;
end;


procedure TFLIQCONS02.BbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQCONS02.BbImprimirClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQCONS02I,FLIQCONS02I);
  try
    QL_Tran.DisableControls;
    FLIQCONS02I.PreparaReporte;
    if Sender = BbPrever then
      FLIQCONS02I.QuickRep1.Preview
    else
      FLIQCONS02I.QuickRep1.Print;
  finally
    FLIQCONS02I.Free;
    QL_Tran.EnableControls;
  end;
end;

procedure TFLIQCONS02.Panel1Enter(Sender: TObject);
begin
  BbCalcular.Enabled:=true;
  QL_Tran.Close;
  QL_Tran2.Close;
  Listview1.Items.Clear;
  Listview2.Items.Clear;
  Edit1.Text:='';
  Label4.Enabled:=false;
  Edit1.Enabled:=false;
  SBbuscar.Enabled:=false;
end;

procedure TFLIQCONS02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFLIQCONS02.QL_TranCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_TranFechaPaq.AsString:=FechaPaq(QL_TranFecha.AsDateTime);
    QL_TranClientePaq.AsString:=InttoClaveNum(QL_TranCliente.AsInteger,6);
    QL_TranFactura.AsString:='';
    QL_TranFechaFacPaq.Asstring:='';
//    QL_TranReferencia.AsString:='';
//    if QL_TranSubCodigo.AsInteger>0 then
      QL_TranReferencia.AsString:=IntToClaveNum(QL_TranSubCodigo.AsInteger,3);
    if (QL_TranFacturado.AsString='Si')and(QL_TranFolioFac.AsInteger>0) then begin
      QL_TranFactura.AsString:=QL_TranSerieFac.AsString+'-'+IntToClaveNum(QL_TranFolioFac.AsInteger,6);
      QL_TranFechaFacPaq.AsString:=FechaPaq(QL_TranFechaFactura.AsDateTime);
    end;
    QL_TranFolioTran.AsString:=QL_TranTipoVenta.AsString+'-'+IntToClaveNum(QL_TranFolio.AsInteger,6);
  end;
end;

procedure TFLIQCONS02.FiltrarClienteClick(Sender: TObject);
begin
  if Sender=CheckBox1 then begin
    FiltrarCliente.Checked:=CheckBox1.Checked;
  end
  else begin
    FiltrarCliente.Checked:=not FiltrarCliente.Checked;
    CheckBox1.Checked:=FiltrarCliente.Checked;
  end;
  pCliente:=QL_TranCliente.AsInteger;
  RefrescaTabla;
  cxGrid1DBTableView1ClientePaq.Filtered:=CheckBox1.Checked;
end;

procedure TFLIQCONS02.FiltrarFechaClick(Sender: TObject);
begin
  if Sender=CheckBox2 then begin
    FiltrarFecha.Checked:=CheckBox2.Checked;
  end
  else begin
    FiltrarFecha.Checked:=not FiltrarFecha.Checked;
    CheckBox2.Checked:=FiltrarFecha.Checked;
  end;
  pFecha:=QL_TranFecha.AsDateTime;
  RefrescaTabla;
  cxGrid1DBTableView1FechaPaq.Filtered:=CheckBox2.Checked;
end;

procedure TFLIQCONS02.SBBuscarClick(Sender: TObject);
begin
  with DMGEN do begin
    if FGENCLIEB.ShowModal=mrOk then begin
      pcliente:=FGENCLIEB.ClaveClie;
      Edit1.Text:=FGENCLIEB.NombreClie;
      FiltrarCliente.Checked:=true;
      CheckBox1.Checked:=true;
      RefrescaTabla;
    end;
  end;
end;

procedure TFLIQCONS02.Edit1Enter(Sender: TObject);
begin
  BbCalcular.Enabled:=true;
end;

procedure TFLIQCONS02.MaskEdit1Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit1.text);
  MaskEdit2.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

procedure TFLIQCONS02.ComboBox1Change(Sender: TObject);
begin
  QL_Tran.Close;
  QL_Tran2.Close;
  QL_Tran3.Close;
  Listview1.Items.Clear;
  Listview2.Items.Clear;
  RefrescaTabla;
end;

procedure TFLIQCONS02.cxGrid1DBTableView1DataControllerFilterChanged(
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
  if  cxGrid1DBTableView1Factura.Filtered then
    CheckBox3.Checked:=TRUE
  else
    CheckBox3.Checked:=FALSE;
end;

procedure TFLIQCONS02.FiltrarFacturaClick(Sender: TObject);
begin
  if Sender=CheckBox3 then begin
    FiltrarFactura.Checked:=CheckBox3.Checked;
  end
  else begin
    FiltrarFactura.Checked:=not FiltrarFactura.Checked;
    CheckBox3.Checked:=FiltrarFactura.Checked;
  end;
  pEstacionFac:=QL_TranESTACIONFAC.AsInteger;
  pSerieFac:=QL_TranSERIEFAC.AsString;
  pFolioFac:=QL_TranFOLIOFAC.AsInteger;
  RefrescaTabla;
  cxGrid1DBTableView1Factura.Filtered:=CheckBox3.Checked;
end;

procedure TFLIQCONS02.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      ComboBox2.SetFocus;
  end;
end;

procedure TFLIQCONS02.VerFotografiasClick(Sender: TObject);
begin
  Application.CreateForm(TFGASTRANFOTOS,FGASTRANFOTOS);
  try
    QL_Tran.DisableControls;
    FGASTRANFOTOS.PreparaReporte;
    if FGASTRANFOTOS.Q_ImgT.RecordCount > 0 then
      FGASTRANFOTOS.QuickRep1.Preview
    else
      MensajeInfo('No se encontraron fotografías de esta transacción.');
  finally
    FGASTRANFOTOS.Free;
    QL_Tran.EnableControls;
  end;
end;

procedure TFLIQCONS02.PopupMenu1Popup(Sender: TObject);
begin
  VerFotografias.Visible := False;
  if DMGAS.DBIMAGENES.Connected then
    VerFotografias.Visible := True;
end;

end.
