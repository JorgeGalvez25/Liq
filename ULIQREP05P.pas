unit ULIQREP05P;

interface

uses ShellApi, QRPDFFilt,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Menus, Buttons, DateUtils;

type
  TFLIQREP05P = class(TForm)
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
    QL_Tcmb: TQuery;
    QL_TcmbCLAVE: TIntegerField;
    QL_TcmbNOMBRE: TStringField;
    TT_Auxi: TTable;
    TT_AuxiLitros: TFloatField;
    TT_AuxiClave: TIntegerField;
    TT_AuxiPrecio: TFloatField;
    TT_AuxiImporte: TFloatField;
    TT_AuxiNombre: TStringField;
    CheckBox1: TCheckBox;
    PopupMenu1: TPopupMenu;
    Negritas: TMenuItem;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    CheckBox2: TCheckBox;
    desglose1: TMenuItem;
    CBIEPS: TCheckBox;
    CBRT: TCheckBox;
    CheckBox3: TCheckBox;
    CBAjustado: TCheckBox;
    dlgSaveSafeDialog: TSaveDialog;
    CBEst: TCheckBox;
    chOcultarVentas: TCheckBox;
    CheckBox4: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TT_AuxiAfterInsert(DataSet: TDataSet);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
    procedure TT_AuxiAfterPost(DataSet: TDataSet);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BOpcionesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure NegritasClick(Sender: TObject);
    procedure desglose1Click(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure CBIEPSClick(Sender: TObject);
    procedure CBEstClick(Sender: TObject);
    procedure CBEstEnter(Sender: TObject);
  private
    { Private declarations }
    //FALTA
    ModoRep:integer;
    swModuloAuxiliar:Boolean;
    swMjeDiasResumenLiq:Boolean;
  public
    { Public declarations }
    SwLlave,
    SwDesglose,
    SwPost:Boolean;
    //FALTA
    swModAux:Boolean;
    procedure PreparaForma(xModo:integer; xModAux:Boolean=False;xModuloAuxiliar:Boolean=False);
    procedure CreaTablaTemp;
    procedure DesgloseLiquidacion;
  end;

var
  FLIQREP05P: TFLIQREP05P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP05, ULIQDESGLO, DDMGASP, DDMCUP, DDMLIQ, ULIQTURCVI, VarCmplx,
  DDMCONS, UAUTORIZA, ULIQREP05D, DDM_PUNTOS;

{$R *.DFM}

procedure TFLIQREP05P.PreparaForma(xModo:integer; xModAux:Boolean=False;xModuloAuxiliar:Boolean=False);
begin
  //FALTA
  swModAux:=xModAux;
  ModoRep:=xModo;
  swModuloAuxiliar:=xModuloAuxiliar;
  CheckBox2.Checked:=not (DMGEN.VarComp('Devoluciones')='No');
end;

procedure TFLIQREP05P.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Clave', ftInteger, 0, True);
      Add('Litros', ftFloat,0, false);
      Add('Precio', ftFloat,0, false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'Clave', [ixPrimary, ixUnique]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.Active:=true;
  end;
end;


procedure TFLIQREP05P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP05P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  //FALTA
  CBAjustado.Visible:=swModAux;
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
      CheckBox2.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
  SwDesglose:=false;
  CBIEPS.Checked:=False;
  CBIEPS.Visible:=DMCUP.SwSubModuloCupReformas2008;
  if DMCONS.DBGASCON.Connected then
    CBRT.Visible:=True
  else
    CBRT.Visible:=False;
  swMjeDiasResumenLiq:=False; // Controla que no entre al evento enter del del DBCombobox2 cuando aparece mensaje de información
end;

procedure TFLIQREP05P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP05P.BImprimirClick(Sender: TObject);
var
  FechaMinima,diaConsulta:TDateTime;
  FechaMinStr:String;
  difDias:Integer;
begin
  with DMGEN,DMCFG,DMGAS do begin
    BImprimir.Enabled:=False;
    BPrever.Enabled:=False;
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if not FechaEnEjercicio(VgFechaIni,idGas) then
      raise Exception.Create('Fecha inicial no es del Ejercicio');
    if not FechaEnEjercicio(VgFechaFin,idGas) then
      raise Exception.Create('Fecha final no es del Ejercicio');
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');

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
    
    if ((idSist = idGas) or(idSist=idLiq)) and (UsuarioActivo<>IdSuper) then begin
      ChecaDerechoEspecialAutor3(idSist,aeResumenLiqInfoReal);
      if FAutoriza.PassOk then begin
        ModoRep:=1;
        FechaMinima:=FechaTrabajo-VarGasDiasResumenLiq;
        if VgFechaIni<FechaMinima then begin
          FechaMinStr:= RangoFecha(FechaMinima,FechaMinima);
          if copy(FechaMinStr,1,1)='0' then
            FechaMinStr:=copy(FechaMinStr,2,Length(FechaMinStr));
          swMjeDiasResumenLiq:=True;
          MensajeInfo('Información disponible solamente a partir del día '+FechaMinStr);
          swMjeDiasResumenLiq:=False;
          BImprimir.Enabled:=True;
          BPrever.Enabled:=True;
          Exit;
        end;
      end
      else begin
        ChecaDerechoEspecialAutor3(idSist,aeResumenLiqInfoAju);
        if FAutoriza.PassOk then begin
          ModoRep:=0;
          difDias:=DaysBetween(VgFechaIni,VgFechaFin)+1;
          try


            if VgFechaIni= VgFechaFin then begin
              Q_Auxi.Close;
              Q_AuxiDate1.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select distinct fecha as date1  from DGASAJUD ');
              if CBEst.Checked then
                Q_Auxi.SQL.Add(' where ')
              else
                Q_Auxi.SQL.Add(' where estacion='+T_EstsCLAVE.AsString+' and ');
              Q_Auxi.SQL.Add(' fecha<='+QuotedStr(FechaToStrSQL(VgFechaIni)));
              Q_Auxi.SQL.Add('  and fecha>='+QuotedStr(FechaToStrSQL(VgFechaFin)));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              if Q_AuxiDate1.IsNull then  begin
                MensajeInfo('Información no disponible.');
                BImprimir.Enabled:=True;
                BPrever.Enabled:=True;
                Exit;
              end;
            end
            else begin
              diaConsulta:=VgFechaIni;
              while diaConsulta <> VgFechaFin+1 do begin
                Q_Auxi.Close;
                Q_AuxiDate1.FieldKind:=fkInternalCalc;
                Q_Auxi.SQL.Clear;
                Q_Auxi.SQL.Add('Select distinct fecha as date1  from DGASAJUD ');
                if CBEst.Checked then
                  Q_Auxi.SQL.Add(' where ')
                else
                  Q_Auxi.SQL.Add(' where estacion='+T_EstsCLAVE.AsString+' and ');
                Q_Auxi.SQL.Add(' fecha<='+QuotedStr(FechaToStrSQL(diaConsulta)));
                Q_Auxi.SQL.Add('  and fecha>='+QuotedStr(FechaToStrSQL(diaConsulta)));
                Q_Auxi.Prepare;
                Q_Auxi.Open;
                if Q_AuxiDate1.IsNull then  begin
                  MensajeInfo('Información no disponible.');
                  BImprimir.Enabled:=True;
                  BPrever.Enabled:=True;
                  Exit;
                end;
                diaConsulta:=diaConsulta+1;
              end;
            end;
          finally
            Q_Auxi.Close;
          end;
        end;
      end;
    end;

    if not(DMGAS.ValidaModulo(idDesc)) and not(DMGAS.VarGasSistemaGulfActivo = 'Si') and not(DM_PUNTOS.LicenciaEsValidaPuntos)then begin
      try
        Application.CreateForm(TFLIQREP05,FLIQREP05);
        FLIQREP05.pSwNegritas:=Negritas.Checked;
        FLIQREP05.PreparaReporte(ModoRep);
        if sender=BImprimir then
          FLIQREP05.QuickRep1.Print
        else
          FLIQREP05.QuickRep1.Preview;
      finally
        FLIQREP05.Free;
      end;
    end
    else begin
      try
        Application.CreateForm(TFLIQREP05D,FLIQREP05D);
        FLIQREP05D.pSwNegritas:=Negritas.Checked;
        FLIQREP05D.PreparaReporte(ModoRep);
        if sender=BImprimir then
          FLIQREP05D.QuickRep1.Print
        else
          FLIQREP05D.QuickRep1.Preview;
      finally
        FLIQREP05D.Free;
      end;
    end;


    if CheckBox1.Checked then begin
      Application.CreateForm(TFLIQTURCVI,FLIQTURCVI);
      try
        FLIQTURCVI.pswresumido:=false;
        FLIQTURCVI.pestacion:=T_EstsClave.AsInteger;;
        FLIQTURCVI.pcaja:=0;
        FLIQTURCVI.pfechaini:=VgFechaIni;
        FLIQTURCVI.pfechafin:=VgFechaFin;
        FLIQTURCVI.pturno:=0;
        FLIQTURCVI.PreparaReporte;
        if sender=BImprimir then
          FLIQTURCVI.QuickRep1.Print
        else
          FLIQTURCVI.QuickRep1.Preview;
      finally
        FLIQTURCVI.Free;
      end;
    end;
  end;
  BImprimir.Enabled:=True;
  BPrever.Enabled:=True;
end;

procedure TFLIQREP05P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP05P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP05P.DesgloseLiquidacion;
var xPrecio,xTasa:real;
begin
  with DMGEN,DMGAS,DMCUP do begin
    SwPost:=false;
    if not TT_Auxi.Exists then begin
      InicializaTemp(TT_Auxi);
      CreaTablaTemp;
      SwLlave:=False;
      VgFechaIni:=StrToDate(MaskEdit3.text);
      VgFechaFin:=StrToDate(MaskEdit4.text);
      QL_Tcmb.Close;
      QL_Tcmb.Prepare;
      QL_Tcmb.Open;
      while not QL_Tcmb.Eof do begin
        TT_Auxi.Insert;
        TT_AuxiClave.AsInteger:=QL_TcmbClave.AsInteger;
        DamePrecioFecha(TT_AuxiClave.AsInteger,VgFechaFin,xPrecio,xTasa);
        TT_AuxiPrecio.AsFloat:=xPrecio;
        TT_Auxi.Post;
        QL_Tcmb.Next;
      end;
      SwLLave:=true;
    end;
    Application.CreateForm(TFLIQDESGLO,FLIQDESGLO);
    try
      SwPost:=true;
      FLIQDESGLO.ShowModal;
      SwDesglose:=FLIQDESGLO.CheckBox1.Checked;
    finally
      FLIQDESGLO.Free;
    end;
  end;
end;

procedure TFLIQREP05P.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Tcmb.Close;
    try
      if TT_Auxi.Exists then
        EliminaTemp(TT_Auxi);
    except
    end;
  end;
end;

procedure TFLIQREP05P.TT_AuxiAfterInsert(DataSet: TDataSet);
begin
  if SwLLave then
    TT_Auxi.Cancel;
end;

procedure TFLIQREP05P.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  TT_AuxiImporte.AsFloat:=AjustaFloat(TT_AuxiLitros.AsFloat*TT_AuxiPrecio.AsFloat,2);
end;

procedure TFLIQREP05P.TT_AuxiAfterPost(DataSet: TDataSet);
var bm:Tbookmark;
    totl,tott:real;
begin
  with DMGEN, FLIQDESGLO do begin
    if not SwPost then exit;
    totl:=0; tott:=0;
    try
      TT_Auxi.DisableControls;
      bm:=TT_Auxi.GetBookmark;
      TT_Auxi.First;
      while not TT_Auxi.Eof do begin
        totl:=totl+TT_AuxiLitros.AsFloat;
        tott:=tott+TT_AuxiImporte.AsFloat;
        TT_Auxi.Next;
      end;
    finally
      StaticText3.Caption:=FormatoMoneda(totl);
      StaticText2.Caption:=FormatoMoneda(tott);
      StaticText3.Refresh;
      StaticText2.Refresh;
      TT_Auxi.GotoBookmark(bm);
      TT_Auxi.FreeBookmark(bm);
      TT_Auxi.EnableControls;
    end;
  end;
end;

procedure TFLIQREP05P.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF2 then
    MaskEdit4.Text:=MaskEdit3.Text;
end;

procedure TFLIQREP05P.BOpcionesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=idF8 then DesgloseLiquidacion;
end;

procedure TFLIQREP05P.MaskEdit3Exit(Sender: TObject);
begin
  MaskEdit4.Text:=MaskEdit3.Text;
end;

procedure TFLIQREP05P.NegritasClick(Sender: TObject);
begin
  Negritas.Checked:=not Negritas.Checked;
end;

procedure TFLIQREP05P.desglose1Click(Sender: TObject);
begin
  DesgloseLiquidacion;
end;

procedure TFLIQREP05P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if (DMGAS.VarLiqReportesEstacionActiva='Si') and (swMjeDiasResumenLiq=False)  then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      CheckBox2.SetFocus;
  end;
end;

procedure TFLIQREP05P.CBIEPSClick(Sender: TObject);
begin
//  CheckBox3.Visible:=not CBIEPS.Checked;
//  if not CheckBox3.Visible then
//    CheckBox3.Checked:=False;
end;

procedure TFLIQREP05P.CBEstClick(Sender: TObject);
begin
  DBLookupComboBox2.Enabled:= not CBEst.Checked;
  if CBEst.Checked then begin
    CBRT.Checked:=False;
    CBRT.Enabled:=False;
  end
  else
    CBRT.Enabled:=True;
end;

procedure TFLIQREP05P.CBEstEnter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      CheckBox2.setfocus;
  end;
end;

end.
