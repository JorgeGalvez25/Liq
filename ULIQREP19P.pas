unit ULIQREP19P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons;

type
  TFLIQREP19P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    StaticText1: TStaticText;
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
    procedure MaskEdit1DblClick(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP19P: TFLIQREP19P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP19, UGENCTASB, DDMGENT, DDMLIQ;

{$R *.DFM}

procedure TFLIQREP19P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP19P.FormShow(Sender: TObject);
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
  MaskEdit1.EditMask:=MascaraCtas;
  with DMGAS do begin
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue:=EstacionActual;
      MaskEdit4.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
end;

procedure TFLIQREP19P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP19P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP19,FLIQREP19);
    try
      FLIQREP19.pcuenta:=MaskEdit1.Text;
      FLIQREP19.PreparaReporte;
      if sender=BImprimir then
        FLIQREP19.QuickRep1.Print
      else
        FLIQREP19.QuickRep1.Preview;
    finally
      FLIQREP19.Free;
    end;
  end;
end;

procedure TFLIQREP19P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP19P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP19P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
end;

procedure TFLIQREP19P.MaskEdit1DblClick(Sender: TObject);
begin
  FGENCTASB.ShowModal;
  if FGENCTASB.NoCuentaB<>'' then begin
    MaskEdit1.Text:=FGENCTASB.NoCuentaB;
    StaticText1.Caption:='';
  end;
end;

procedure TFLIQREP19P.MaskEdit1Exit(Sender: TObject);
begin
  with DMGENT do begin
    if MaskEdit1.text<>'' then begin
      if not LocalizaTabla(T_Ctas,'NoCuenta',MaskEdit1.text) then
        raise Exception.Create('No existe cuenta '+MaskEdit1.text);
      StaticText1.Caption:=T_CtasTipo.AsString;
    end;
  end;
end;

procedure TFLIQREP19P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      MaskEdit4.SetFocus;
  end;
end;

end.
