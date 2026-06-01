unit ULIQREP12P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons;

type
  TFLIQREP12P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox4: TGroupBox;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    ChbTodasEstaciones: TCheckBox;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    chkClientesSaldoCero: TCheckBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    GroupBox5: TGroupBox;
    cbTipo: TComboBox;
    GBCliente: TGroupBox;
    MaskEdit2: TMaskEdit;
    StaticText2: TStaticText;
    CheckBox4: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure ChbTodasEstacionesClick(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure MaskEdit2DblClick(Sender: TObject);
    procedure MaskEdit2Enter(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP12P: TFLIQREP12P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
     ULIQREP12, DDMLIQ, UGENCLIEB, DDMGENQ, DDMGEN_VTAS;

{$R *.DFM}

procedure TFLIQREP12P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP12P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  ComboBox2.ItemIndex:=0;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  with DMGAS do begin
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue:=EstacionActual;
      CheckBox1.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
  FLIQREP12P.Height:=320;
  GBCliente.Visible:=False;
end;

procedure TFLIQREP12P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP12P.BImprimirClick(Sender: TObject);
begin
  with DMGEN,DMCFG do begin
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if not FechaEnEjercicio(VgFechaFin,idGas) then
      raise Exception.Create('Fecha final no es del Ejercicio');
    Application.CreateForm(TFLIQREP12,FLIQREP12);
    FLIQREP12.xNoClie:=0;
    if GBCliente.Visible then begin
      FLIQREP12.xNoClie:=StrToIntDef(FLIQREP12P.MaskEdit2.Text,0);
      if FLIQREP12.xNoClie=0 then
        Raise Exception.Create('No se ha indicado el cliente en los parametros.');
    end;
    try
      FLIQREP12.PreparaReporte;
      if sender=BImprimir then
        FLIQREP12.QuickRep1.Print
      else
        FLIQREP12.QuickRep1.Preview;
    finally
      FLIQREP12.Free;
    end;
  end;
end;

procedure TFLIQREP12P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP12P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP12P.ChbTodasEstacionesClick(Sender: TObject);
begin
  DBLookUpComboBox2.Enabled:=not ChbTodasEstaciones.Checked;
  if ChbTodasEstaciones.Checked then begin
    cbTipo.ItemIndex:=0;
    CheckBox1.Enabled := True;
    cbTipo.Enabled:=True;
  //    FLIQREP12P.Height:=351;
    if ( not CheckBox1.Checked)then begin
      FLIQREP12P.Height:=371;//290
      GBCliente.Visible:=true;
    end;
  end
  else begin
    cbTipo.ItemIndex:=0;
    CheckBox1.Checked := True;
    CheckBox1.Enabled := False;
    FLIQREP12P.Height:=320;
    cbTipo.Enabled:=False;
    GBCliente.Visible:=False;
  end;
end;

procedure TFLIQREP12P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      MaskEdit4.SetFocus;
  end;
end;

procedure TFLIQREP12P.MaskEdit2DblClick(Sender: TObject);
begin
  if FGENCLIEB.ShowModal=mrOK then with DMGEN do begin
    with Sender as TMaskEdit do begin
      Text:=InttoClaveCata(FGENCLIEB.ClaveClie,idClie);
    end;
    MaskEdit2Exit(Sender);
  end;
end;

procedure TFLIQREP12P.MaskEdit2Enter(Sender: TObject);
begin
  with Sender as TMaskEdit do
    Text:='';
  if Sender = MaskEdit2 then StaticText2.Caption:=''
end;

procedure TFLIQREP12P.MaskEdit2Exit(Sender: TObject);
begin
  with DMGENQ,DMGEN_VTAS do begin
    with Sender as TMaskEdit do begin
      if Text='' then exit;
      try
        if not BuscaQuery(QB_Clie,'pNoClie',StrtoInt(Text)) then
          raise Exception.Create('No existe Cliente');
        Text:=LlenaStr(Text,'D',6,'0');
        if Sender = MaskEdit2 then StaticText2.Caption:=QB_ClieNombre.AsString
      except
        SetFocus;
        raise;
      end;
    end;
  end;
end;

procedure TFLIQREP12P.cbTipoChange(Sender: TObject);
begin
  if cbTipo.ItemIndex=1 then begin
    FLIQREP12P.Height:=371;
    GBCliente.Visible:=True;
    CheckBox1.Checked := False;
  end
  else begin
    FLIQREP12P.Height:=320;
    GBCliente.Visible:=False;
    CheckBox1.Checked := True;
  end;
end;

procedure TFLIQREP12P.CheckBox1Click(Sender: TObject);
begin
  if (ChbTodasEstaciones.Checked) and (not CheckBox1.Checked) then begin
    FLIQREP12P.Height:=371; //351
    GBCliente.Visible:=True;
    cbTipo.ItemIndex:= 1;
  end else if (CheckBox1.Checked)then begin
    FLIQREP12P.Height:=320;//290
    GBCliente.Visible:=False;
    cbTipo.ItemIndex:= 0;
  end;
end;

procedure TFLIQREP12P.CheckBox3Click(Sender: TObject);
begin
    if CheckBox3.Checked then begin
      CheckBox4.Checked := False;
      CheckBox4.Enabled := False;
    end else begin
      CheckBox4.Enabled := True;
    end;
end;

end.
