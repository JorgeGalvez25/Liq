unit ULIQREP46P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons;

type
  TFLIQREP46P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    QL_Tcmb: TQuery;
    QL_TcmbCLAVE: TIntegerField;
    QL_TcmbNOMBRE: TStringField;
    Label1: TLabel;
    MaskEdit3: TMaskEdit;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    CheckBox1: TCheckBox;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    CBIeps: TCheckBox;
    CheckBox2: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
  public
    { Public declarations }
    procedure PreparaForma(xModo:integer);
  end;

var
  FLIQREP46P: TFLIQREP46P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
     DDMGASP, DDMCUP, DDMLIQ, ULIQREP46;

{$R *.DFM}


procedure TFLIQREP46P.PreparaForma(xModo:integer);
begin
  ModoRep:=xModo;
end;

procedure TFLIQREP46P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP46P.FormShow(Sender: TObject);
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
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue:=EstacionActual;
      CBIeps.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
  CBIeps.Checked:=False;
  CBIeps.Visible:=DMCUP.SwSubModuloCupReformas2008;
end;

procedure TFLIQREP46P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP46P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    if FechaToMes(VgFechaIni)<>FechaToMes(VgFechaFin) then
      raise Exception.Create('Fechas deben ser del mismo mes');    
    Application.CreateForm(TFLIQREP46,FLIQREP46);
    try
      FLIQREP46.PreparaReporte(ModoRep);
      if sender=BImprimir then
        FLIQREP46.QuickRep1.Print
      else
        FLIQREP46.QuickRep1.Preview;
    finally
      FLIQREP46.Free;
    end;
  end;
end;

procedure TFLIQREP46P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP46P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP46P.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Tcmb.Close;
  end;
end;

procedure TFLIQREP46P.MaskEdit3Exit(Sender: TObject);
begin
  MaskEdit4.Text:=MaskEdit3.Text;
end;

procedure TFLIQREP46P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      CBIeps.SetFocus;
  end;
end;

end.
