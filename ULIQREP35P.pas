unit ULIQREP35P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons;

type
  TFLIQREP35P = class(TForm)
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
    QL_Tcmb: TQuery;
    QL_TcmbCLAVE: TIntegerField;
    QL_TcmbNOMBRE: TStringField;
    TT_Auxi: TTable;
    TT_AuxiLitros: TFloatField;
    TT_AuxiClave: TIntegerField;
    TT_AuxiPrecio: TFloatField;
    TT_AuxiImporte: TFloatField;
    TT_AuxiNombre: TStringField;
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
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
  public
    { Public declarations }
    SwLlave,
    SwDesglose,
    SwPost:Boolean;
    procedure PreparaForma;
  end;

var
  FLIQREP35P: TFLIQREP35P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP05, ULIQDESGLO, DDMGASP, DDMCUP, DDMLIQ, ULIQTURCVI, VarCmplx,
  DDMCONS, ULIQREP35;

{$R *.DFM}

procedure TFLIQREP35P.PreparaForma;
begin
end;

procedure TFLIQREP35P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP35P.FormShow(Sender: TObject);
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
      ComboBox1.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
  SwDesglose:=false;

end;

procedure TFLIQREP35P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP35P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG,DMGAS do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if not FechaEnEjercicio(VgFechaIni,idGas) then
      raise Exception.Create('Fecha inicial no es del Ejercicio');
    if not FechaEnEjercicio(VgFechaFin,idGas) then
      raise Exception.Create('Fecha final no es del Ejercicio');
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP35,FLIQREP35);
    try
      FLIQREP35.PreparaReporte(DBLookupComboBox2.KeyValue);
      if Sender=BImprimir then
        FLIQREP35.QuickRep1.Print
      else
        FLIQREP35.QuickRep1.Preview;
    finally
      FLIQREP35.Free;
    end;
  end;
end;

procedure TFLIQREP35P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP35P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;



procedure TFLIQREP35P.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF2 then
    MaskEdit4.Text:=MaskEdit3.Text;
end;

procedure TFLIQREP35P.MaskEdit3Exit(Sender: TObject);
begin
  MaskEdit4.Text:=MaskEdit3.Text;
end;

procedure TFLIQREP35P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      ComboBox1.SetFocus;
  end;
end;

end.
