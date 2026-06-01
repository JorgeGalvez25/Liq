unit ULIQREP08P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons;

type
  TFLIQREP08P = class(TForm)
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
    ComboBox2: TComboBox;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    ComboBox3: TComboBox;
    QL_Isla: TQuery;
    QL_IslaISLA: TIntegerField;
    DSQL_Isla: TDataSource;
    QL_IslaNombre: TStringField;
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
    procedure QL_IslaCalcFields(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
  public
    { Public declarations }
    procedure PreparaForma(xModo:integer);
  end;

var
  FLIQREP08P: TFLIQREP08P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP08, ULIQREP17, DDMLIQ;

{$R *.DFM}

procedure TFLIQREP08P.PreparaForma(xModo:integer);
begin
  ModoRep:=xModo;
end;

procedure TFLIQREP08P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP08P.FormShow(Sender: TObject);
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
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  with DMGAS do begin
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue:=EstacionActual;
      ComboBox2.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
    QL_Isla.Close;
    QL_Isla.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
    QL_Isla.Prepare;
    QL_Isla.Open;
    DBLookUpComboBox1.KeyValue:=QL_IslaIsla.AsInteger;
    ComboBox3.ItemIndex:=0;
  end;
end;

procedure TFLIQREP08P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP08P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    if ComboBox2.ItemIndex=0 then begin
      Application.CreateForm(TFLIQREP08,FLIQREP08);
      try
        FLIQREP08.pIsla:=0;
        if not CheckBox1.Checked then FLIQREP08.pIsla:=DBLookUpComboBox1.KeyValue;
        FLIQREP08.pTurno:=ComboBox3.ItemIndex;
        FLIQREP08.PreparaReporte(ModoRep);
        if sender=BImprimir then
          FLIQREP08.QuickRep1.Print
        else
          FLIQREP08.QuickRep1.Preview;
      finally
        FLIQREP08.Free;
      end;
    end
    else begin
      Application.CreateForm(TFLIQREP17,FLIQREP17);
      try
        FLIQREP17.pIsla:=0;
        if not CheckBox1.Checked then FLIQREP17.pIsla:=DBLookUpComboBox1.KeyValue;
        FLIQREP17.pTurno:=ComboBox3.ItemIndex;
        FLIQREP17.PreparaReporte;
        if sender=BImprimir then
          FLIQREP17.QuickRep1.Print
        else
          FLIQREP17.QuickRep1.Preview;
      finally
        FLIQREP17.Free;
      end;
    end;
  end;
end;

procedure TFLIQREP08P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP08P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP08P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));  
end;

procedure TFLIQREP08P.QL_IslaCalcFields(DataSet: TDataSet);
begin
  QL_IslaNombre.AsString:='Isla '+IntToClaveNum(QL_IslaIsla.AsInteger,2);
end;

procedure TFLIQREP08P.CheckBox1Click(Sender: TObject);
begin
  DBLookupComboBox1.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP08P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      ComboBox2.SetFocus;
  end;
end;

end.
