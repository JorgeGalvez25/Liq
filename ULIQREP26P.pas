unit ULIQREP26P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables;

type
  TFLIQREP26P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    BPrever: TButton;
    BImprimir: TButton;
    BOpciones: TButton;
    BCancelar: TButton;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox4: TGroupBox;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP26P: TFLIQREP26P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
     ULIQREP12;

{$R *.DFM}

procedure TFLIQREP26P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP26P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  ComboBox2.ItemIndex:=0;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  with DMGAS do begin
    T_Ests.Active:=true;
    DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
  end;
end;

procedure TFLIQREP26P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP26P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if not FechaEnEjercicio(VgFechaFin,idGas) then
      raise Exception.Create('Fecha final no es del Ejercicio');
    Application.CreateForm(TFLIQREP12,FLIQREP12);
    try
      FLIQREP12.PreparaReporte;
      if sender=BImprimir then
        FLIQREP12.QuickRep1.Print
      else
        FLIQREP12.QuickRep1.Preview;
    finally
      FLIQREP12.Free;
    end;
  end;
end;

procedure TFLIQREP26P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP26P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

end.
