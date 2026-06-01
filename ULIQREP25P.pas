unit ULIQREP25P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, Db, DBTables, DBCtrls,
  Grids, DBGrids;

type
  TFLIQREP25P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    BPrever: TButton;
    BImprimir: TButton;
    BOpciones: TButton;
    BCancelar: TButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    ComboBox2: TComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    QL_Clas: TQuery;
    QL_ClasCLAVECLASIF: TIntegerField;
    QL_ClasDESCRIPCION: TStringField;
    DSQL_Clas: TDataSource;
    CheckBox3: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP25P: TFLIQREP25P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE,DDMGAS,ULIBLICENCIAS, DDMCFG,
  ULIQREP23;

{$R *.DFM}


procedure TFLIQREP25P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP25P.FormShow(Sender: TObject);
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
    DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
  end;
end;

procedure TFLIQREP25P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP25P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP23,FLIQREP23);
    try
      FLIQREP23.PreparaReporte;
      if sender=BImprimir then
        FLIQREP23.QuickRep1.Print
      else
        FLIQREP23.QuickRep1.Preview;
    finally
      FLIQREP23.Free;
    end;
  end;
end;

procedure TFLIQREP25P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP25P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP25P.CheckBox3Click(Sender: TObject);
begin
  DBLookUpComboBox3.Enabled:=not CheckBox3.Checked;
end;

procedure TFLIQREP25P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

end.
