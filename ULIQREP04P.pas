unit ULIQREP04P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, Db, DBTables, DBCtrls,
  Grids, DBGrids;

type
  TFLIQREP04P = class(TForm)
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
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    QL_Caja: TQuery;
    QL_CajaCAJA: TIntegerField;
    QL_CajaDESCRIPCION: TStringField;
    QL_CajaVARINI: TMemoField;
    DSL_Caja: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaQueryCajas;
  end;

var
  FLIQREP04P: TFLIQREP04P;


implementation

uses ULIBGRAL, DDMCNT, DDMGEN, UGEN_NET, ULIBDATABASE, DDMCFG,DDMGENP,
  DDMGAS, ULIQREP04, ULIBLICENCIAS;

{$R *.DFM}

procedure TFLIQREP04P.PreparaQueryCajas;
begin
  QL_Caja.Close;
  QL_Caja.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
  QL_Caja.Prepare;
  QL_Caja.Open;
end;

procedure TFLIQREP04P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP04P.FormShow(Sender: TObject);
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
    DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    PreparaQueryCajas;    
    DBLookUpComboBox1.KeyValue:=QL_CajaCaja.AsInteger;
  end;
end;

procedure TFLIQREP04P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP04P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP04,FLIQREP04);
    try
      FLIQREP04.PreparaReporte;
      if sender=BImprimir then
        FLIQREP04.QuickRep1.Print
      else
        FLIQREP04.QuickRep1.Preview;
    finally
      FLIQREP04.Free;
    end;
  end;
end;

procedure TFLIQREP04P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP04P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP04P.DBLookupComboBox2Click(Sender: TObject);
begin
  PreparaQueryCajas;
  DBLookUpComboBox1.KeyValue:=QL_CajaCaja.AsInteger;
end;

end.
