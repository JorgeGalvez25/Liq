unit ULIQREP01P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, Db, DBTables, DBCtrls,
  Grids, DBGrids;

type
  TFLIQREP01P = class(TForm)
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
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    QL_Caja: TQuery;
    QL_CajaCAJA: TIntegerField;
    QL_CajaDESCRIPCION: TStringField;
    QL_CajaVARINI: TMemoField;
    DSL_Caja: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaQueryCajas;
  end;

var
  FLIQREP01P: TFLIQREP01P;


implementation

uses ULIBGRAL, DDMCNT, DDMGEN, UGEN_NET, ULIBDATABASE, DDMCFG,DDMGENP,
  DDMGAS, ULIQREP01, ULIBLICENCIAS;

{$R *.DFM}

procedure TFLIQREP01P.PreparaQueryCajas;
begin
  QL_Caja.Close;
  QL_Caja.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
  QL_Caja.Prepare;
  QL_Caja.Open;
end;

procedure TFLIQREP01P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP01P.FormShow(Sender: TObject);
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
    PreparaQueryCajas;    
    DBLookUpComboBox1.KeyValue:=QL_CajaCaja.AsInteger;
  end;
end;

procedure TFLIQREP01P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP01P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP01,FLIQREP01);
    try
      FLIQREP01.PreparaReporte;
      if sender=BImprimir then
        FLIQREP01.QuickRep1.Print
      else
        FLIQREP01.QuickRep1.Preview;
    finally
      FLIQREP01.Free;
    end;
  end;
end;

procedure TFLIQREP01P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP01P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP01P.DBLookupComboBox2Click(Sender: TObject);
begin
  PreparaQueryCajas;
  DBLookUpComboBox1.KeyValue:=QL_CajaCaja.AsInteger;
end;

procedure TFLIQREP01P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

end.
