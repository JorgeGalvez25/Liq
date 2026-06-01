unit ULIQREPESP01P;

interface

uses ShellApi, QRPDFFilt,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons;

type
  TFLIQREPESP01P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    QL_Tcmb: TQuery;
    QL_TcmbCLAVE: TIntegerField;
    QL_TcmbNOMBRE: TStringField;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    dlgSaveSafeDialog: TSaveDialog;
    CBEst: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREPESP01P: TFLIQREPESP01P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREPESP01, ULIQDESGLO, DDMGASP, DDMCUP, DDMLIQ, ULIQTURCVI, VarCmplx,
  DDMCONS;

{$R *.DFM}

procedure TFLIQREPESP01P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREPESP01P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  DateTimePicker1.Date:=VgFechaIni;
  DateTimePicker2.Date:=VgFechaFin;
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

procedure TFLIQREPESP01P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREPESP01P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG,DMGAS do begin
    try
      BPrever.Enabled:=False;
      BImprimir.Enabled:=False;

      VgFechaIni:=DateTimePicker1.Date;
      VgFechaFin:=DateTimePicker2.Date;
      if not FechaEnEjercicio(VgFechaIni,idGas) then
        raise Exception.Create('Fecha inicial no es del Ejercicio');
      if not FechaEnEjercicio(VgFechaFin,idGas) then
        raise Exception.Create('Fecha final no es del Ejercicio');
      if VgFechaIni>VgFechaFin then
        raise Exception.Create('Periodo Inválido');
      Application.CreateForm(TFLIQREPESP01,FLIQREPESP01);
      try
        if FLIQREPESP01.PreparaReporte then begin
          if sender=BImprimir then
            FLIQREPESP01.QuickRep1.Print
          else
            FLIQREPESP01.QuickRep1.Preview;
        end
        else
          MensajeInfo('No se encontró información con los parámetros actuales.');
      finally
        FLIQREPESP01.Free;
      end;
    finally
      BPrever.Enabled:=True;
      BImprimir.Enabled:=True;
    end;
  end;
end;

procedure TFLIQREPESP01P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREPESP01P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREPESP01P.FormDestroy(Sender: TObject);
begin
  QL_Tcmb.Close;
end;

end.
