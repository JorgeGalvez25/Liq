unit ULIQREP06P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons, cxControls, cxContainer, cxEdit, cxTextEdit, cxGraphics,
  cxMaskEdit, cxDropDownEdit;

type
  TFLIQREP06P = class(TForm)
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
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    CBIeps: TCheckBox;
    CBTPago: TCheckBox;
    Label3: TLabel;
    Fuente: TcxComboBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure CBTPagoClick(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
  public
    { Public declarations }
    procedure PreparaForma(xModo:integer);
    function ManejaDiesel:Boolean;
  end;

var
  FLIQREP06P: TFLIQREP06P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP06, ULIQREP06C, DDMCUP, DDMLIQ, ULIQLTPAG, ULIQREP06D,
  ULIQREP06CD, DDM_PUNTOS;

{$R *.DFM}

procedure TFLIQREP06P.PreparaForma(xModo:integer);
begin
  ModoRep:=xModo;
end;

procedure TFLIQREP06P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP06P.FormShow(Sender: TObject);
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
      CBIeps.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
  CBIeps.Checked:=False;
  CBIeps.Visible:=DMCUP.SwSubModuloCupReformas2008;
end;

function TFLIQREP06P.ManejaDiesel:Boolean;
begin
  Result:=False;
  with DMGAS do begin
    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_AuxiEntero1.FieldKind := fkInternalCalc;
    Q_Auxi.SQL.Add('SELECT COALESCE(COUNT(*),0) AS Entero1 FROM DGASBOMB');
    Q_Auxi.SQL.Add('WHERE COMBUSTIBLE = 3');
    Q_Auxi.SQL.Add('AND ESTACION = '+IntToStr(DBLookUpComboBox2.KeyValue));

    Q_Auxi.Prepare;
    Q_Auxi.Open;

    Result:=Q_AuxiEntero1.AsInteger>0;

    Q_Auxi.Close;
  end;
end;

procedure TFLIQREP06P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP06P.BImprimirClick(Sender: TObject);
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
    if ManejaDiesel then begin
      if (DMGAS.ValidaModulo(idDesc)) or (DMGAS.VarGasSistemaGulfActivo = 'Si') or (DM_PUNTOS.LicenciaEsValidaPuntos) then begin
        Application.CreateForm(TFLIQREP06D,FLIQREP06D);
        try
          FLIQREP06D.PreparaReporte(ModoRep);
          if sender=BImprimir then
            FLIQREP06D.QuickRep1.Print
          else
            FLIQREP06D.QuickRep1.Preview;
        finally
          FLIQREP06D.Free;
        end;
      end
      else begin
        Application.CreateForm(TFLIQREP06,FLIQREP06);
        try
          FLIQREP06.PreparaReporte(ModoRep);
          if sender=BImprimir then
            FLIQREP06.QuickRep1.Print
          else
            FLIQREP06.QuickRep1.Preview;
        finally
          FLIQREP06.Free;
        end;
      end;
    end
    else begin
      if (DMGAS.ValidaModulo(idDesc)) or (DMGAS.VarGasSistemaGulfActivo = 'Si') or (DM_PUNTOS.LicenciaEsValidaPuntos) then begin
        Application.CreateForm(TFLIQREP06CD,FLIQREP06CD);
        try
          FLIQREP06CD.PreparaReporte(ModoRep);
          if sender=BImprimir then
            FLIQREP06CD.QuickRep1.Print
          else
            FLIQREP06CD.QuickRep1.Preview;
        finally
          FLIQREP06CD.Free;
        end;
      end
      else begin
        Application.CreateForm(TFLIQREP06C,FLIQREP06C);
        try
          FLIQREP06C.PreparaReporte(ModoRep);
          if sender=BImprimir then
            FLIQREP06C.QuickRep1.Print
          else
            FLIQREP06C.QuickRep1.Preview;
        finally
          FLIQREP06C.Free;
        end;
      end;
    end;
  end;
end;

procedure TFLIQREP06P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP06P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP06P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));  
end;

procedure TFLIQREP06P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      CBIeps.SetFocus;
  end;
end;

procedure TFLIQREP06P.CBTPagoClick(Sender: TObject);
begin
//  if CBTPago.Checked then begin
//    Application.CreateForm(TFLIQLTPAG,FLIQLTPAG);
//    try
//      FLIQLTPAG.ShowModal;
//    finally
//      FLIQLTPAG.Free;
//    end;  
//  end;
end;

end.
