unit ULIQREP02P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, Db, DBTables, DBCtrls,
  Grids, DBGrids;

type
  TFLIQREP02P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    BPrever: TButton;
    BImprimir: TButton;
    BOpciones: TButton;
    BCancelar: TButton;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    ComboBox1: TComboBox;
    DSL_Caja: TDataSource;
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaQueryCajas;
  end;

var
  FLIQREP02P: TFLIQREP02P;


implementation

uses ULIBGRAL, DDMCNT, DDMGEN, UGEN_NET, ULIBDATABASE, DDMCFG,DDMGENP,
  DDMGAS, ULIQREP02, ULIBLICENCIAS, DDMGASQ;

{$R *.DFM}

procedure TFLIQREP02P.PreparaQueryCajas;
begin
end;

procedure TFLIQREP02P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP02P.FormShow(Sender: TObject);
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
    DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
  end;
  if idSist<>idGas then begin
    CheckBox1.Enabled:=false;
    DBLookUpComboBox2.KeyValue:=DMGASQ.QT_EstsClave.AsInteger;
    DBLookUpComboBox2.Enabled:=false;
  end;
end;

procedure TFLIQREP02P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP02P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP02,FLIQREP02);
    try
      FLIQREP02.PreparaReporte;
      if sender=BImprimir then
        FLIQREP02.QuickRep1.Print
      else
        FLIQREP02.QuickRep1.Preview;
    finally
      FLIQREP02.Free;
    end;
  end;
end;

procedure TFLIQREP02P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP02P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP02P.CheckBox1Click(Sender: TObject);
begin
  DbLookUpComboBox2.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP02P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

end.
