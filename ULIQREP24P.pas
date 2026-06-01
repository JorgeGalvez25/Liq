unit ULIQREP24P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, Db, DBTables, DBCtrls,
  Grids, DBGrids, Buttons;

type
  TFLIQREP24P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    QL_Ests: TQuery;
    QL_EstsCLAVE: TIntegerField;
    QL_EstsNOMBRE: TStringField;
    DSQL_Ests: TDataSource;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
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
    procedure CheckBox2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP24P: TFLIQREP24P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE,DDMGAS,ULIBLICENCIAS, DDMCFG,
  ULIQREP24, DDMLIQ;

{$R *.DFM}


procedure TFLIQREP24P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP24P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  ComboBox1.ItemIndex:=0;
  MaskEdit3.EditMask:=MaskFecha2;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  QL_Ests.Close;
  QL_Ests.Prepare;
  QL_Ests.Open;
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    DBLookUpComboBox2.KeyValue:=DMGAS.EstacionActual;
    MaskEdit3.SetFocus;
  end
  else begin
    DBLookUpComboBox2.KeyValue:=QL_EstsCLAVE.AsInteger;
  end;
end;

procedure TFLIQREP24P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP24P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo inválido.');
    Application.CreateForm(TFLIQREP24,FLIQREP24);
    try
      FLIQREP24.PreparaReporte;
      if sender=BImprimir then
        FLIQREP24.QuickRep1.Print
      else
        FLIQREP24.QuickRep1.Preview;
    finally
      FLIQREP24.Free;
    end;
  end;
end;

procedure TFLIQREP24P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP24P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP24P.CheckBox2Click(Sender: TObject);
begin
  Label2.Enabled:=not CheckBox2.Checked;
  Edit2.Enabled:=not CheckBox2.Checked;
end;

procedure TFLIQREP24P.Edit2Exit(Sender: TObject);
begin
  if StrToIntDef(Edit2.Text,-1)=-1 then
    raise Exception.Create('Turno no válido');
end;

procedure TFLIQREP24P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

procedure TFLIQREP24P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      MaskEdit4.SetFocus;
  end;
end;

end.
