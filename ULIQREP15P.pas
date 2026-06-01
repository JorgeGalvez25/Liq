unit ULIQREP15P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons;

type
  TFLIQREP15P = class(TForm)
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
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaForma;
  end;

var
  FLIQREP15P: TFLIQREP15P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
     DDMGASP, DDMCUP, DDMLIQ, ULIQREP15;

{$R *.DFM}

procedure TFLIQREP15P.PreparaForma;
begin
end;

procedure TFLIQREP15P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP15P.FormShow(Sender: TObject);
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
      MaskEdit3.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
end;

procedure TFLIQREP15P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP15P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP15,FLIQREP15);
    try
      FLIQREP15.PreparaReporte;
      if sender=BImprimir then
        FLIQREP15.QuickRep1.Print
      else
        FLIQREP15.QuickRep1.Preview;
    finally
      FLIQREP15.Free;
    end;
  end;
end;

procedure TFLIQREP15P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP15P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;


procedure TFLIQREP15P.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF2 then
    MaskEdit4.Text:=MaskEdit3.Text;
end;

procedure TFLIQREP15P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

procedure TFLIQREP15P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      MaskEdit4.SetFocus;
  end;
end;

end.
