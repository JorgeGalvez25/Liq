unit ULIQREP40P;

interface

uses ShellApi, QRPDFFilt,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons;

type
  TFLIQREP40P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
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
    CBAjustado: TCheckBox;
    dlgSaveSafeDialog: TSaveDialog;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure _(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
  private
    { Private declarations }
    //FALTA
    ModoRep:integer;
    swModuloAuxiliar:Boolean;
  public
    { Public declarations }
    SwLlave,
    SwDesglose,
    SwPost:Boolean;
    swModo:Integer;
    swModAux:Boolean;
    procedure PreparaForma(xModo:integer; xModAux:Boolean=False;xModuloAuxiliar:Boolean=False);
  end;

var
  FLIQREP40P: TFLIQREP40P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP05, ULIQDESGLO, DDMGASP, DDMCUP, DDMLIQ, ULIQTURCVI, VarCmplx,
  DDMCONS, ULIQREP40;

{$R *.DFM}

procedure TFLIQREP40P.PreparaForma(xModo:integer; xModAux:Boolean=False;xModuloAuxiliar:Boolean=False);
begin
  swModAux:=xModAux;
  swModo:=xModo;
  swModuloAuxiliar:=xModuloAuxiliar;
end;

procedure TFLIQREP40P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP40P.FormShow(Sender: TObject);
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

  SwDesglose:=false;
  CBAjustado.Visible:=swModAux;
end;

procedure TFLIQREP40P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP40P._(Sender: TObject);
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
    Application.CreateForm(TFLIQREP40,FLIQREP40);
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
    swModo:=ModoRep;
    try
      FLIQREP40.PreparaReporte(swModo);
      if Sender=BImprimir then
        FLIQREP40.QuickRep1.Print
//      else if Sender=btnPdf then begin
//        if dlgSaveSafeDialog.Execute then begin
//          FLIQREP40.QuickRep1.ExportToFilter(TQRPDFDocumentFilter.Create(dlgSaveSafeDialog.FileName));
//          ShellExecute(FLIQREP40P.Handle,nil,PChar(dlgSaveSafeDialog.FileName),'','',SW_SHOWNORMAL);
//        end;
//      end
      else
        FLIQREP40.QuickRep1.Preview;
    finally
      FLIQREP40.Free;
    end;
  end;
end;

procedure TFLIQREP40P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP40P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;



procedure TFLIQREP40P.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF2 then
    MaskEdit4.Text:=MaskEdit3.Text;
end;

procedure TFLIQREP40P.MaskEdit3Exit(Sender: TObject);
begin
  MaskEdit4.Text:=MaskEdit3.Text;
end;

end.
