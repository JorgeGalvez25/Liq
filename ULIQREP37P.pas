unit ULIQREP37P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TFLIQREP37P = class(TForm)
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    ComboBox3: TComboBox;
    PrintDialog1: TPrintDialog;
    procedure BPreverClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BOpcionesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP37P: TFLIQREP37P;

implementation

uses
  DDMGAS, ULIQREP37, ULIBDATABASE, ULIBGRAL;

{$R *.dfm}

procedure TFLIQREP37P.BPreverClick(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  VgFechaFin:=StrToDate(MaskEdit4.text);
  if VgFechaIni>VgFechaFin then
    raise Exception.Create('Periodo Inválido');
  try
    Application.CreateForm(TFLIQREP37,FLIQREP37);
    FLIQREP37.PreparaReporte;
    if Sender = BImprimir then
      FLIQREP37.QuickRep1.Print
    else
      FLIQREP37.QuickRep1.Preview
  finally
    FLIQREP37.Free;
  end;
end;

procedure TFLIQREP37P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP37P.FormShow(Sender: TObject);
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

procedure TFLIQREP37P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

end.
