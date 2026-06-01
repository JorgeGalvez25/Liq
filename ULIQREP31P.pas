unit ULIQREP31P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons, CheckLst;

type
  TFLIQREP31P = class(TForm)
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
    chlbEstaciones: TCheckListBox;
    QL_Ests: TQuery;
    QL_EstsCLAVE: TIntegerField;
    QL_EstsNOMBRE: TStringField;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure QL_IslaCalcFields(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure chlbEstacionesEnter(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
  public
    { Public declarations }
    ListadoEstaciones:string;
    procedure PreparaForma(xModo:integer);
    procedure cargaListaEstaciones;
    function obtenEstacionesSeleccionadas:string;
  end;

var
  FLIQREP31P: TFLIQREP31P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP31, ULIQREP17, ULIQREP32, DDMLIQ;

{$R *.DFM}

procedure TFLIQREP31P.PreparaForma(xModo:integer);
begin
  ModoRep:=xModo;
  cargaListaEstaciones;
end;

procedure TFLIQREP31P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP31P.FormShow(Sender: TObject);
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
    DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    QL_Isla.Close;
    QL_Isla.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
    QL_Isla.Prepare;
    QL_Isla.Open;
    DBLookUpComboBox1.KeyValue:=QL_IslaIsla.AsInteger;
    ComboBox3.ItemIndex:=0;
  end;
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    ComboBox2.SetFocus
  end
  else
    chlbEstaciones.SetFocus;
end;

procedure TFLIQREP31P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP31P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    ListadoEstaciones:=obtenEstacionesSeleccionadas;
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    if ComboBox2.ItemIndex=0 then begin
      Application.CreateForm(TFLIQREP31,FLIQREP31);
      try
        FLIQREP31.pIsla:=0;
        if not CheckBox1.Checked then FLIQREP31.pIsla:=DBLookUpComboBox1.KeyValue;
        FLIQREP31.pTurno:=ComboBox3.ItemIndex;
        FLIQREP31.PreparaReporte(ModoRep);
        if sender=BImprimir then
          FLIQREP31.QuickRep1.Print
        else
          FLIQREP31.QuickRep1.Preview;
      finally
        FLIQREP31.Free;
      end;
    end
    else begin
      Application.CreateForm(TFLIQREP32,FLIQREP32);
      try
        FLIQREP32.pIsla:=0;
        if not CheckBox1.Checked then FLIQREP32.pIsla:=DBLookUpComboBox1.KeyValue;
        FLIQREP32.pTurno:=ComboBox3.ItemIndex;
        FLIQREP32.PreparaReporte;
        if sender=BImprimir then
          FLIQREP32.QuickRep1.Print
        else
          FLIQREP32.QuickRep1.Preview;
      finally
        FLIQREP32.Free;
      end;
    end;
  end;
end;

procedure TFLIQREP31P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
  QL_Ests.Close;
end;

procedure TFLIQREP31P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP31P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));  
end;

procedure TFLIQREP31P.QL_IslaCalcFields(DataSet: TDataSet);
begin
  QL_IslaNombre.AsString:='Isla '+IntToClaveNum(QL_IslaIsla.AsInteger,2);
end;

procedure TFLIQREP31P.CheckBox1Click(Sender: TObject);
begin
  DBLookupComboBox1.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP31P.cargaListaEstaciones;
var
  i:integer;
begin
  QL_Ests.close;
  QL_Ests.Prepare;
  QL_Ests.Open;
  QL_Ests.First;
  chlbEstaciones.Items.Clear;
  i:=0;
  while not QL_Ests.Eof do begin
    chlbEstaciones.Items.Add(IntToClaveNum(QL_EstsCLAVE.AsInteger,3)+' '+QL_EstsNOMBRE.AsString);
    if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
      if QL_EstsCLAVE.AsInteger = DMGAS.EstacionActual then
        chlbEstaciones.Checked[i]:=True
      else
        chlbEstaciones.Checked[i]:=False
    end
    else begin
      chlbEstaciones.Checked[i]:=True;
    end;

    QL_Ests.Next;
    inc(i);
  end;
end;

function TFLIQREP31P.obtenEstacionesSeleccionadas: string;
var
  i,count:integer;
  xtmp:string;
begin
  xtmp:='';
  count:=0;
  for i:=0 to chlbEstaciones.Items.Count-1 do begin
    if chlbEstaciones.Checked[i]=True then begin
      xtmp:=xtmp+IntToStr(StrToInt(copy(chlbEstaciones.Items.Strings[i],1,3)))+',';
      Inc(count);
    end;
  end;
  if count=0 then
    Result:='*'
  else
    result:=copy(xtmp,1,length(xtmp)-1);
end;

procedure TFLIQREP31P.chlbEstacionesEnter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      ComboBox2.SetFocus;
  end;
end;

end.
