unit ULIQTURCVP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, Db, DBTables, DBCtrls,
  Grids, DBGrids;

type
  TFLIQTURCVP = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    BPrever: TButton;
    BImprimir: TButton;
    BOpciones: TButton;
    BCancelar: TButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox4: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
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
  FLIQTURCVP: TFLIQTURCVP;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE,DDMGAS,ULIBLICENCIAS, DDMCFG,
  ULIQTURCVI, ULIQTURC;

{$R *.DFM}

procedure TFLIQTURCVP.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQTURCVP.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  ComboBox1.ItemIndex:=0;
end;

procedure TFLIQTURCVP.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQTURCVP.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG,FLIQTURC do begin
    Application.CreateForm(TFLIQTURCVI,FLIQTURCVI);
    try
      FLIQTURCVI.pswresumido:=RadioButton1.Checked;
      FLIQTURCVI.pestacion:=QL_TurcEstacion.AsInteger;
      FLIQTURCVI.pcaja:=QL_TurcCaja.AsInteger;
      FLIQTURCVI.pfechaini:=QL_TurcFecha.AsDateTime;
      FLIQTURCVI.pfechafin:=QL_TurcFecha.AsDateTime;      
      FLIQTURCVI.pturno:=QL_TurcTurno.AsInteger;
      FLIQTURCVI.PreparaReporte;
      if sender=BImprimir then
        FLIQTURCVI.QuickRep1.Print
      else
        FLIQTURCVI.QuickRep1.Preview;
    finally
      FLIQTURCVI.Free;
    end;
  end;
end;

procedure TFLIQTURCVP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQTURCVP.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

end.
