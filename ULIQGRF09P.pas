unit ULIQGRF09P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons;

type
  TFLIQGRF09P = class(TForm)       //Kylie Jenner
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    QL_Tcmb: TQuery;
    QL_TcmbCLAVE: TIntegerField;
    QL_TcmbNOMBRE: TStringField;
    BPrever: TBitBtn;
    BCancelar: TBitBtn;
    GBFecha: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit3: TMaskEdit;
    GBAnual: TGroupBox;
    Label7: TLabel;
    AnioBox1: TComboBox;
    GBMes: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MesBox1: TComboBox;
    MesBox2: TComboBox;
    RGPeriodo: TRadioGroup;
    lbl1: TLabel;
    cbbAnhioComp: TComboBox;
    cbbACM: TComboBox;
    lbl2: TLabel;
    cbbACA: TComboBox;
    lbl3: TLabel;
    grp1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CBTodas: TCheckBox;
    chkCBAjustado: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure BPreverClick(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure CBTodasEnter(Sender: TObject);
    procedure RGPeriodoClick(Sender: TObject);
  private
    { Private declarations }
    swModo:Integer;
    procedure ActivarDesac(Periodo:byte);
  public
    { Public declarations }
    swModAux:Boolean; //25-11-15
    swModuloAuxiliar:Boolean;
    procedure PreparaForma(xModo:integer; xModAux:Boolean=False;xModuloAuxiliar:Boolean=False); //25-11-15
  end;

var
  FLIQGRF09P: TFLIQGRF09P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT, DDMGAS,
    VarCmplx, ULIQGRF08, DDMLIQ, UAutoriza, ULIQGRF09;

{$R *.DFM}

procedure TFLIQGRF09P.FormShow(Sender: TObject);
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
    cbbAnhioComp.Items.Clear;
    cbbACM.Items.Clear;
    cbbACA.Items.Clear;
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('select distinct Extract(year from Fecha) as Entero1 from DGASDLIQC c');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      while not Q_Auxi.Eof do begin
        AnioBox1.Items.Add(IntToStr(Q_AuxiEntero1.AsInteger));
        cbbAnhioComp.Items.Add(IntToStr(Q_AuxiEntero1.AsInteger));
        cbbACM.Items.Add(IntToStr(Q_AuxiEntero1.AsInteger));
        cbbACA.Items.Add(IntToStr(Q_AuxiEntero1.AsInteger));
//        if AnioBox1.Items.Count>1 then
//          AnioBox2.Items.Add(IntToStr(Q_AuxiEntero1.AsInteger));
        Q_Auxi.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
    AnioBox1.ItemIndex:=0;
    cbbAnhioComp.ItemIndex:=0;
    cbbACM.ItemIndex:=0;
    cbbACA.ItemIndex:=0;
//    cbbAnhioComp.ItemIndex:=AnioBox1.Items.Count-1;
//    cbbACM.ItemIndex:=AnioBox1.Items.Count-1;
//    cbbACA.ItemIndex:=AnioBox1.Items.Count-1;
//    AnioBox2.ItemIndex:=AnioBox1.Items.Count-1;
  end;


  FLIQGRF09P.Width:=394;
  GBMes.Align   :=alClient;
  GBAnual.Align :=alClient;
  ActivarDesac(1);
  chkCBAjustado.Visible:=swModAux; //25-11-15
//  chkCBAjustado.Visible:=swModuloAuxiliar;
end;

procedure TFLIQGRF09P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQGRF09P.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF2 then
    MaskEdit4.Text:=DateToStr(StrToDate(MaskEdit3.Text)+1);
end;

procedure TFLIQGRF09P.MaskEdit3Exit(Sender: TObject);
begin
  MaskEdit4.Text:= DateToStr(StrToDate(MaskEdit3.Text)+1);
end;

procedure TFLIQGRF09P.BPreverClick(Sender: TObject);
var
  xanio:string;
  xFecha:string;
begin
  with DMGEN,DMGAS do begin
    if GBFecha.Visible then begin
      VgFechaIni:=StrToDate(MaskEdit3.text);
      VgFechaFin:=StrToDate(MaskEdit4.text);
      if VgFechaIni>VgFechaFin then
        raise Exception.Create('Periodo Inválido');
      xanio:=cbbAnhioComp.text;

      xFecha:=Copy(MaskEdit3.text,(Length(MaskEdit3.text)-1)-2,4);
      if Copy(MaskEdit3.text,4,2)='02' then begin
        if Copy(MaskEdit4.text,4,2)<>'02' then begin
          raise Exception.Create('Febrero pertenece a un año bisiesto, no se puede combinar con otro mes.');
        end;
        if (StrToInt(xFecha) mod 4)<>0 then begin
          if Copy(MaskEdit3.text,1,2)='29' then begin
            raise Exception.Create('Fecha inicial incorrecta, favor de verificarla.');
          end;
        end;
      end;

      xFecha:=Copy(MaskEdit4.text,(Length(MaskEdit4.text)-1)-2,4);
      if Copy(MaskEdit4.text,4,2)='02' then begin
        if Copy(MaskEdit3.text,4,2)<>'02' then begin
          raise Exception.Create('Febrero pertenece a un año bisiesto, no se puede combinar con otro mes.');
        end;
        if (StrToInt(xFecha) mod 4)<>0 then begin
          if Copy(MaskEdit4.text,1,2)='29' then begin
            raise Exception.Create('Fecha inicial incorrecta, favor de verificarla.');
          end;
        end;
      end;
    end
    else if GBMes.Visible then begin
      VgMesIni:=ElementoActualMesBox(MesBox1);
      VgMesFin:=ElementoActualMesBox(MesBox2);
      if VgMesIni>VgMesFin then
        raise Exception.Create('Periodo Inválido');
      if MesToInt(VgMesFin)-MesToInt(VgMesIni)>11 then
        raise Exception.Create('Periodo de meses no debe de ser mayor a 12');
      if UpperCase(copy(VgMesFin,0,4))<>UpperCase(copy(VgMesIni,0,4)) then
        raise Exception.Create('Periodo de meses debe de corresponder al mismo año');
      xanio:=cbbACM.TExt;

    end
    else if GBAnual.Visible then begin
      VgFechaIni:=StrToDate('01/01/'+AnioBox1.Text);
      VgFechaFin:=StrToDate('31/12/'+AnioBox1.Text);
      xanio:=cbbACA.text;
    end;

    Application.CreateForm(TFLIQGRF09,FLIQGRF09);

    swModo:=0; //25-11-15
    if chkCBAjustado.Visible then begin
      if not chkCBAjustado.Checked  then
        swModo:=1;
    end
    else begin
//      ModoRep:=0;
//      if swModuloAuxiliar then begin
//        if not swModAux then
          swModo:=0;
//      end;
    end;
//    if chkCBAjustado.Visible then begin
//      if chkCBAjustado.Checked then begin
//        swModo:=0
//      end
//      else
//        swModo:=1;
//    end;
    try
      FLIQGRF09.PreparaForma(swModo,xanio);
      FLIQGRF09.ShowModal;
    finally
      FLIQGRF09.Free;
    end;
  end;
end;

procedure TFLIQGRF09P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then begin
      RGPeriodo.SetFocus;
//      CBTodas.Enabled := False;
    end;
  end;
end;

procedure TFLIQGRF09P.CBTodasEnter(Sender: TObject);
begin
  if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
    RGPeriodo.SetFocus;
end;

procedure TFLIQGRF09P.ActivarDesac(Periodo: byte);
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

procedure TFLIQGRF09P.RGPeriodoClick(Sender: TObject);
begin
  if RGPeriodo.ItemIndex=0 then
    ActivarDesac(1)
  else if RGPeriodo.ItemIndex=1 then
    ActivarDesac(2)
  else if RGPeriodo.ItemIndex=2 then
    ActivarDesac(3)
end;

procedure TFLIQGRF09P.PreparaForma(xModo:integer; xModAux:Boolean=False;xModuloAuxiliar:Boolean=False); //25-11-15
begin
  swModAux:=xModAux; //25-11-15
  swModo:=xModo;
  swModuloAuxiliar:=xModuloAuxiliar;
end;

end.
