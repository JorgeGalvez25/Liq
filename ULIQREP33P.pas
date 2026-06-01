unit ULIQREP33P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons;

type
  TFLIQREP33P = class(TForm)
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
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    ComboBox3: TComboBox;
    QL_Isla: TQuery;
    QL_IslaISLA: TIntegerField;
    DSQL_Isla: TDataSource;
    QL_IslaNombre: TStringField;
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
    procedure QL_IslaCalcFields(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
  public
    { Public declarations }
    procedure PreparaForma(xModo:integer);
  end;

var
  FLIQREP33P: TFLIQREP33P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP33;

{$R *.DFM}

procedure TFLIQREP33P.PreparaForma(xModo:integer);
begin
  ModoRep:=xModo;
end;

procedure TFLIQREP33P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP33P.FormShow(Sender: TObject);
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
    QL_Isla.Close;
    QL_Isla.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
    QL_Isla.Prepare;
    QL_Isla.Open;
    DBLookUpComboBox1.KeyValue:=QL_IslaIsla.AsInteger;
    ComboBox3.ItemIndex:=0;
  end;
end;

procedure TFLIQREP33P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP33P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP33,FLIQREP33);
    try
      FLIQREP33.pIsla:=0;
      if not CheckBox1.Checked then
        FLIQREP33.pIsla:=DBLookUpComboBox1.KeyValue;
      FLIQREP33.pTurno:=ComboBox3.ItemIndex;
      FLIQREP33.PreparaReporte;
      if sender=BImprimir then
        FLIQREP33.QuickRep1.Print
      else
        FLIQREP33.QuickRep1.Preview;
    finally
      FLIQREP33.Free;
    end;
  end;
end;

procedure TFLIQREP33P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP33P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP33P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));  
end;

procedure TFLIQREP33P.QL_IslaCalcFields(DataSet: TDataSet);
begin
  QL_IslaNombre.AsString:='Isla '+IntToClaveNum(QL_IslaIsla.AsInteger,2);
end;

procedure TFLIQREP33P.CheckBox1Click(Sender: TObject);
begin
  DBLookupComboBox1.Enabled:=not CheckBox1.Checked;
end;

end.
