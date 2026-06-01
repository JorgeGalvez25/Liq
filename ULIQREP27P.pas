unit ULIQREP27P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons;

type
  TFLIQREP27P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    MaskEdit3: TMaskEdit;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    QL_Desp2: TQuery;
    DSQL_Desp: TDataSource;
    CheckBox1: TCheckBox;
    QL_Desp2CLAVE: TIntegerField;
    QL_Desp2NOMBRE: TStringField;
    QL_Desp2ClaveNombre: TStringField;
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
    procedure QL_Desp2CalcFields(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
    procedure CalculaDesp;
  public
    { Public declarations }
  end;

var
  FLIQREP27P: TFLIQREP27P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
     DDMGASP, DDMCUP, DDMLIQ, ULIQREP27;

{$R *.DFM}

procedure TFLIQREP27P.CalculaDesp;
begin
  QL_Desp2.Close;
  QL_Desp2.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
  QL_Desp2.Prepare;
  QL_Desp2.Open;
  DBLookUpComboBox1.KeyValue:=QL_Desp2Clave.AsInteger;
end;

procedure TFLIQREP27P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP27P.FormShow(Sender: TObject);
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
  CalculaDesp;
end;

procedure TFLIQREP27P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP27P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP27,FLIQREP27);
    try
      FLIQREP27.PreparaReporte;
      if sender=BImprimir then
        FLIQREP27.QuickRep1.Print
      else
        FLIQREP27.QuickRep1.Preview;
    finally
      FLIQREP27.Free;
    end;
  end;
end;

procedure TFLIQREP27P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP27P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP27P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

procedure TFLIQREP27P.QL_Desp2CalcFields(DataSet: TDataSet);
begin
  QL_Desp2ClaveNombre.AsString:=IntToClaveNum(QL_Desp2Clave.AsInteger,2)+' '+QL_Desp2Nombre.AsString;
end;

procedure TFLIQREP27P.CheckBox1Click(Sender: TObject);
begin
  DBLookupComboBox1.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP27P.DBLookupComboBox2Click(Sender: TObject);
begin
  CalculaDesp;
end;

procedure TFLIQREP27P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      MaskEdit3.SetFocus;
  end;
end;

end.
