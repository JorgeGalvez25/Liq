unit ULIQREP07P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, Db, DBTables, DBCtrls,
  Grids, DBGrids, Buttons;

type
  TFLIQREP07P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    QL_Caja: TQuery;
    QL_CajaCAJA: TIntegerField;
    QL_CajaDESCRIPCION: TStringField;
    QL_CajaVARINI: TMemoField;
    DSL_Caja: TDataSource;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    DBLookupComboBox3: TDBLookupComboBox;
    QL_Clas: TQuery;
    QL_ClasCLAVECLASIF: TIntegerField;
    QL_ClasDESCRIPCION: TStringField;
    DSQL_Clas: TDataSource;
    CheckBox3: TCheckBox;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    ComboBox3: TComboBox;
    Label3: TLabel;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaQueryCajas;
  end;

var
  FLIQREP07P: TFLIQREP07P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE,DDMGAS,ULIBLICENCIAS, DDMCFG,
  ULIQREP07, DDMLIQ;

{$R *.DFM}

procedure TFLIQREP07P.PreparaQueryCajas;
begin
  QL_Caja.Close;
  QL_Caja.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
  QL_Caja.Prepare;
  QL_Caja.Open;
end;

procedure TFLIQREP07P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP07P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=0;
  MaskEdit3.EditMask:=MaskFecha2;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  QL_Clas.Close;
  QL_Clas.Prepare;
  QL_Clas.Open;
  DBLookUpComboBox3.KeyValue:=QL_ClasClaveClasif.AsInteger;
  with DMGAS do begin
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue:=EstacionActual;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
    PreparaQueryCajas;
    DBLookUpComboBox1.KeyValue:=QL_CajaCaja.AsInteger;
  end;
end;

procedure TFLIQREP07P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP07P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP07,FLIQREP07);
    try
      FLIQREP07.PreparaReporte;
      if sender=BImprimir then
        FLIQREP07.QuickRep1.Print
      else
        FLIQREP07.QuickRep1.Preview;
    finally
      FLIQREP07.Free;
    end;
  end;
end;

procedure TFLIQREP07P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP07P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP07P.DBLookupComboBox2Click(Sender: TObject);
begin
  PreparaQueryCajas;
  DBLookUpComboBox1.KeyValue:=QL_CajaCaja.AsInteger;
end;

procedure TFLIQREP07P.CheckBox3Click(Sender: TObject);
begin
  DBLookUpComboBox3.Enabled:=not CheckBox3.Checked;
end;

procedure TFLIQREP07P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

procedure TFLIQREP07P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      DBLookupComboBox1.SetFocus;
  end;
end;

end.
