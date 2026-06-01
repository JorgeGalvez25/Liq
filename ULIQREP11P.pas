unit ULIQREP11P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons;

type
  TFLIQREP11P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    QL_Tpag: TQuery;
    QL_TpagCLAVE: TStringField;
    QL_TpagDESCRIPCION: TStringField;
    DSQL_Tpag: TDataSource;
    GroupBox4: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP11P: TFLIQREP11P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
     ULIQREP11, DDMLIQ;

{$R *.DFM}

procedure TFLIQREP11P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP11P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  MaskEdit3.EditMask:=MaskFecha2;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  with DMGAS do begin
    QL_Tpag.Close;
    QL_Tpag.Prepare;
    QL_Tpag.Open;
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue:=EstacionActual;
      CheckBox1.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
    DBLookUpComboBox1.KeyValue:=QL_TpagClave.AsString;
  end;
end;

procedure TFLIQREP11P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP11P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if not FechaEnEjercicio(VgFechaIni,idGas) then
      raise Exception.Create('Fecha inicial no es del Ejercicio');
    if not FechaEnEjercicio(VgFechaFin,idGas) then
      raise Exception.Create('Fecha final no es del Ejercicio');
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP11,FLIQREP11);
    try
      FLIQREP11.PreparaReporte;
      if sender=BImprimir then
        FLIQREP11.QuickRep1.Print
      else
        FLIQREP11.QuickRep1.Preview;
    finally
      FLIQREP11.Free;
    end;
  end;
end;

procedure TFLIQREP11P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP11P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP11P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));  
end;

procedure TFLIQREP11P.CheckBox1Click(Sender: TObject);
begin
  DBLookUpComboBox1.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP11P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      CheckBox1.SetFocus;
  end;
end;

end.
