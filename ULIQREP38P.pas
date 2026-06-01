unit ULIQREP38P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons;

type
  TFLIQREP38P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CBAjustado: TCheckBox;
    chkImpDeta: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
    swModo:Integer;
    swModAux:Boolean;
    swModuloAuxiliar:Boolean;
  public
    { Public declarations }
    procedure PreparaForma(xModo:integer; xModAux:Boolean=False;xModuloAuxiliar:Boolean=False);
  end;

var
  FLIQREP38P: TFLIQREP38P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP38, DDMCUP, DDMLIQ;

{$R *.DFM}

procedure TFLIQREP38P.PreparaForma(xModo:integer; xModAux:Boolean=False;xModuloAuxiliar:Boolean=False);
begin
  ModoRep:=xModo;
  swModAux:=xModAux;
  swModo:=xModo;
  swModuloAuxiliar:=xModuloAuxiliar;
end;

procedure TFLIQREP38P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP38P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  //FALTA
  CBAjustado.Visible:=swModAux;
  
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
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
end;

procedure TFLIQREP38P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP38P.BImprimirClick(Sender: TObject);
var
  xEstacion:Integer;
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if not FechaEnEjercicio(VgFechaIni,idGas) then
      raise Exception.Create('Fecha inicial no es del Ejercicio');
    if not FechaEnEjercicio(VgFechaFin,idGas) then
      raise Exception.Create('Fecha final no es del Ejercicio');
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP38,FLIQREP38);
    try
      xEstacion:=DMGAS.EstacionActual;
      DMGAS.EstacionActual:=DBLookupComboBox2.KeyValue;
      DMGAS.CargaConfiguracionConsola;
      if CBAjustado.Visible then begin
        if CBAjustado.Checked then
          ModoRep:=0
        else
          ModoRep:=1;
      end;
      //FALTA
      ModoRep:=0;
      if CBAjustado.Visible then begin
        if not CBAjustado.Checked  then
          ModoRep:=1;
      end
      else begin
        ModoRep:=0;
        if swModuloAuxiliar then begin
          if not swModAux then
            ModoRep:=1;
        end;
      end;
      FLIQREP38.PreparaReporte(ModoRep);
      if Sender=BImprimir then
        FLIQREP38.QuickRep1.Print
      else
        FLIQREP38.QuickRep1.PreviewModal;
    finally
      FLIQREP38.Free;
      DMGAS.EstacionActual:=xEstacion;
      DMGAS.CargaConfiguracionConsola;
    end;
  end;
end;

procedure TFLIQREP38P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP38P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP38P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(VgFechaIni);  
end;

end.
