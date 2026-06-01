unit ULIQGRF02P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons;

type
  TFLIQGRF02P = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    QL_Tcmb: TQuery;
    QL_TcmbCLAVE: TIntegerField;
    QL_TcmbNOMBRE: TStringField;
    BPrever: TBitBtn;
    BCancelar: TBitBtn;
    CBTodas: TCheckBox;
    GroupBox2: TGroupBox;
    GBFecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit3: TMaskEdit;
    GBAnual: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    AnioBox1: TComboBox;
    AnioBox2: TComboBox;
    GBMes: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MesBox1: TComboBox;
    MesBox2: TComboBox;
    RGPeriodo: TRadioGroup;
    chkCBAjustado: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure BPreverClick(Sender: TObject);
    procedure CBTodasClick(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure CBTodasEnter(Sender: TObject);
    procedure RGPeriodoClick(Sender: TObject);
  private
    { Private declarations }
    swModo:Integer;
    procedure ActivarDesac(Periodo:byte);
  public
    { Public declarations }
    swModuloAuxiliar:Boolean;
    procedure PreparaForma(xModo:Integer;xModuloAuxiliar:Boolean=False);
  end;

var
  FLIQGRF02P: TFLIQGRF02P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT, DDMGAS,
  ULIQDESGLO, DDMGASP, VarCmplx, DDMCONS, ULIQGRF02, DDMLIQ;

{$R *.DFM}

procedure TFLIQGRF02P.FormShow(Sender: TObject);
var
  xMes:string;
begin
  MaskEdit3.EditMask:=MaskFecha2;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  with DMGAS, DMLIQ do begin
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue := EstacionActual;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
    try
      Q_Auxi.Close;
      Q_AuxiDate1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.sql.Add('select fecha as Date1 from DGASDLIQC order by fecha desc rows 1');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      xMes:=FechaToMes(Q_AuxiDate1.AsDateTime);
    finally
      Q_Auxi.Close;
    end;
  end;
  // Inicializa Combos de Mes.
  IniciaMesBox(MesBox1,MesIniEjercicio(DMGEN.MesInicial(idLiq)),MesFinEjercicio,MesIniEjercicio(DMGEN.MesInicial(idLiq)),false);
  IniciaMesBox(MesBox2,MesIniEjercicio(DMGEN.MesInicial(idLiq)),xMes,MesFinEjercicio,false);
  MesBox1.ItemIndex:=0;
  MesBox2.ItemIndex:=MesBox2.Items.Count-1;
  // Inicialización de años.
  with DMGAS do begin
    AnioBox1.Items.Clear;
    AnioBox2.Items.Clear;
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('select distinct Extract(year from Fecha) as Entero1 from DGASDLIQC c');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      while not Q_Auxi.Eof do begin
        AnioBox1.Items.Add(IntToStr(Q_AuxiEntero1.AsInteger));
        if AnioBox1.Items.Count>1 then
          AnioBox2.Items.Add(IntToStr(Q_AuxiEntero1.AsInteger));
        Q_Auxi.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
    AnioBox1.ItemIndex:=0;
    AnioBox2.ItemIndex:=AnioBox2.Items.Count-1;
  end;


  FLIQGRF02P.Width:=313;
  GBMes.Align   :=alClient;
  GBAnual.Align :=alClient;
  ActivarDesac(1);

  chkCBAjustado.Visible:=swModuloAuxiliar;
end;

procedure TFLIQGRF02P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQGRF02P.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF2 then
    MaskEdit4.Text:=DateToStr(StrToDate(MaskEdit3.Text)+1);
end;

procedure TFLIQGRF02P.MaskEdit3Exit(Sender: TObject);
begin
  MaskEdit4.Text:=DateToStr(StrToDate(MaskEdit3.Text)+1);
end;

procedure TFLIQGRF02P.BPreverClick(Sender: TObject);
begin
  with DMGEN,DMGAS do begin
    if GBFecha.Visible then begin
      VgFechaIni:=StrToDate(MaskEdit3.text);
      VgFechaFin:=StrToDate(MaskEdit4.text);
      if not FechaEnEjercicio(VgFechaIni,idGas) then
        raise Exception.Create('Fecha inicial no es del Ejercicio');
      if not FechaEnEjercicio(VgFechaFin,idGas) then
        raise Exception.Create('Fecha final no es del Ejercicio');
      if VgFechaIni>VgFechaFin then
        raise Exception.Create('Periodo Inválido');
    end
    else if GBMes.Visible then begin
      VgMesIni:=ElementoActualMesBox(MesBox1);
      VgMesFin:=ElementoActualMesBox(MesBox2);
      if VgMesIni>VgMesFin then
        raise Exception.Create('Periodo Inválido');
      if MesToInt(VgMesFin)-MesToInt(VgMesIni)>11 then
        raise Exception.Create('Periodo de meses no debe de ser mayor a 12');
    end
    else if GBAnual.Visible then begin
      VgFechaIni:=StrToDate('01/01/'+AnioBox1.Text);
      VgFechaFin:=StrToDate('31/12/'+AnioBox2.Text);
    end;

    Application.CreateForm(TFLIQGRF02,FLIQGRF02);
    if chkCBAjustado.Visible then begin
      if chkCBAjustado.Checked then begin
        swModo:=0
      end
      else
        swModo:=1;
    end;
    try
      FLIQGRF02.PreparaForma(swModo);
      FLIQGRF02.ShowModal;
    finally
      FLIQGRF02.Free;
    end;
  end;
end;

procedure TFLIQGRF02P.CBTodasClick(Sender: TObject);
begin
  DBLookupComboBox2.Enabled := not CBTodas.Checked;
end;

procedure TFLIQGRF02P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then begin
      BPrever.SetFocus;
      CBTodas.Enabled := False;
    end;
  end;
end;

procedure TFLIQGRF02P.CBTodasEnter(Sender: TObject);
begin
  if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
    MaskEdit3.SetFocus;
end;

procedure TFLIQGRF02P.ActivarDesac(Periodo: byte);
begin
  GBFecha.Visible :=False;
  GBMes.Visible   :=False;
  GBAnual.Visible :=False;
  if Periodo=1 then
    GBFecha.Visible:=True
  else if Periodo=2 then
    GBMes.Visible:=True
  else if Periodo=3 then
    GBAnual.Visible:=True
end;

procedure TFLIQGRF02P.RGPeriodoClick(Sender: TObject);
begin
  if RGPeriodo.ItemIndex=0 then
    ActivarDesac(1)
  else if RGPeriodo.ItemIndex=1 then
    ActivarDesac(2)
  else if RGPeriodo.ItemIndex=2 then
    ActivarDesac(3)
end;

procedure TFLIQGRF02P.PreparaForma(xModo: Integer;xModuloAuxiliar:Boolean=False);
begin
  swModo:=xModo;
  swModuloAuxiliar:=xModuloAuxiliar;
end;

end.
