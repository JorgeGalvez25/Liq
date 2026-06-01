unit ULIQREP03P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, Db, DBTables, DBCtrls,
  Grids, DBGrids;

type
  TFLIQREP03P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    BPrever: TButton;
    BImprimir: TButton;
    BOpciones: TButton;
    BCancelar: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    DSL_Caja: TDataSource;
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox4: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox2: TCheckBox;
    GroupBox5: TGroupBox;
    ComboBox2: TComboBox;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaQueryCajas;
  end;

var
  FLIQREP03P: TFLIQREP03P;


implementation

uses ULIBGRAL, DDMCNT, DDMGEN, UGEN_NET, ULIBDATABASE, DDMCFG,DDMGENP,
  DDMGAS, ULIQREP02, ULIBLICENCIAS, DDMGASQ, DDMGASP, DDMCUP, ULIQREP03;

{$R *.DFM}

procedure TFLIQREP03P.PreparaQueryCajas;
begin
end;

procedure TFLIQREP03P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP03P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  ComboBox2.ItemIndex:=0;
  MaskEdit3.EditMask:=MaskFecha2;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit1.EditMask:=MaskFecha2;
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  MaskEdit1.Text:=FechaToFormato(date);
  with DMGAS,DMCUP do begin
    T_Ests.Active:=true;
    T_Serc.Active:=true;
    DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    DBLookUpComboBox1.KeyValue:=T_SercClave.AsInteger;
  end;
  if idSist<>idGas then begin
    CheckBox1.Enabled:=false;
    DBLookUpComboBox2.KeyValue:=DMGASQ.QT_EstsClave.AsInteger;
    DBLookUpComboBox2.Enabled:=false;
  end;
end;

procedure TFLIQREP03P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP03P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP03,FLIQREP03);
    try
      FLIQREP03.PreparaReporte;
      if sender=BImprimir then
        FLIQREP03.QuickRep1.Print
      else
        FLIQREP03.QuickRep1.Preview;
    finally
      FLIQREP03.Free;
    end;
  end;
end;

procedure TFLIQREP03P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP03P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP03P.CheckBox1Click(Sender: TObject);
begin
  DbLookUpComboBox2.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP03P.CheckBox2Click(Sender: TObject);
begin
  DbLookUpComboBox1.Enabled:=not CheckBox2.Checked;
end;

end.
