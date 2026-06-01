unit ULIQREP20P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  CheckLst, Menus, Buttons;

type
  TFLIQREP20P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    CheckListBox1: TCheckListBox;
    QL_Tpag: TQuery;
    QL_TpagCLAVE: TStringField;
    QL_TpagDESCRIPCION: TStringField;
    QL_TpagCLASE: TStringField;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    PopupMenu1: TPopupMenu;
    MarcarTodos1: TMenuItem;
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
    procedure MarcarTodos1Click(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
  public
    { Public declarations }
    procedure PreparaForma(xModo:integer);
  end;

var
  FLIQREP20P: TFLIQREP20P;

implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP20, DDMLIQ;

{$R *.DFM}

procedure TFLIQREP20P.PreparaForma(xModo:integer);
begin
  ModoRep:=xModo;
//  with DMGAS do begin
    QL_Tpag.Close;
    QL_Tpag.Prepare;
    QL_Tpag.Open;
    QL_Tpag.First;
    CheckListBox1.Items.Clear;
    while not QL_Tpag.Eof do begin
      CheckListBox1.Items.AddObject(QL_TpagDescripcion.AsString,TObject(QL_Tpag.GetBookmark));
      QL_Tpag.Next;
    end;
//  end;
end;

procedure TFLIQREP20P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP20P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  ComboBox2.ItemIndex:=0;
  ComboBox3.ItemIndex:=0;
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

procedure TFLIQREP20P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP20P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    Application.CreateForm(TFLIQREP20,FLIQREP20);
    try
      FLIQREP20.pWidth:=680;
      if ComboBox3.ItemIndex=1 then
        if ComboBox2.ItemIndex=0 then FLIQREP20.pWidth:=900
        else FLIQREP20.pWidth:=1180;
      FLIQREP20.PreparaReporte(ModoRep);
      if sender=BImprimir then
        FLIQREP20.QuickRep1.Print
      else
        FLIQREP20.QuickRep1.Preview;
    finally
      FLIQREP20.Free;
    end;
  end;
end;

procedure TFLIQREP20P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP20P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP20P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));  
end;

procedure TFLIQREP20P.MarcarTodos1Click(Sender: TObject);
var i:word;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do
    CheckListBox1.Checked[i]:=true;
end;

procedure TFLIQREP20P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      MaskEdit4.SetFocus;
  end;
end;

end.
