unit ULIQTURC;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,db,
  Mask, DBTables, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit,
  cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, dxNavBarStyles, dxNavBarCollns, dxNavBarBase, dxNavBar,
  cxImageComboBox;

type
  TFLIQTURC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    MainMenu1: TMainMenu;
    Editar1: TMenuItem;
    PrintDialog1: TPrintDialog;
    Bitsalir: TBitBtn;
    QL_Turc: TQuery;
    DSQL_Turn: TDataSource;
    PopupMenu1: TPopupMenu;
    NuevaConciliacin1: TMenuItem;
    Anterior2: TMenuItem;
    Siguiente2: TMenuItem;
    Fin2: TMenuItem;
    Label1: TLabel;
    MesBox1: TComboBox;
    AbrirTurno1: TMenuItem;
    CerrarTurno1: TMenuItem;
    ImageList1: TImageList;
    QL_TurcESTACION: TIntegerField;
    QL_TurcCAJA: TIntegerField;
    QL_TurcFECHA: TDateTimeField;
    QL_TurcTURNO: TIntegerField;
    QL_TurcHORAINI: TDateTimeField;
    QL_TurcHORAFIN: TDateTimeField;
    QL_TurcESTATUS: TStringField;
    QL_TurcCAJERO: TIntegerField;
    QL_TurcDescEstatus: TStringField;
    QL_TurcNombreCajero: TStringField;
    N1: TMenuItem;
    MIImprimir: TMenuItem;
    MIPrever: TMenuItem;
    Cupones1: TMenuItem;
    QL_TurcDescCaja: TStringField;
    QL_TurcPoliza: TStringField;
    QL_TurcTOTALCUPRECUP: TFloatField;
    QL_TurcCONTABILIZADO: TStringField;
    QL_TurcTIPOPOLIZA: TStringField;
    QL_TurcNOPOLIZA: TIntegerField;
    Polizas1: TMenuItem;
    GenerarPlizaContable1: TMenuItem;
    BorrarPliza1: TMenuItem;
    EliminarTurnoVaco1: TMenuItem;
    TrasaccionesPVG1: TMenuItem;
    QL_TurcTOTALTRAN: TFloatField;
    Liquidaciones1: TMenuItem;
    Vales1: TMenuItem;
    QL_TurcINDICE_PVAL: TIntegerField;
    QL_TurcTOTALVALES: TFloatField;
    N2: TMenuItem;
    ReabrirTurnoLiq: TMenuItem;
    SpeedButton2: TSpeedButton;
    CapturadeLiquidaciones1: TMenuItem;
    ResumendelTurno1: TMenuItem;
    ValesdeCrdito1: TMenuItem;
    N3: TMenuItem;
    QL_TurcTotalGeneral: TFloatField;
    QL_TurcFechaPaq: TStringField;
    ImprimirPoliza: TMenuItem;
    VistaPreliminar: TMenuItem;
    SalidadeAlmacn1: TMenuItem;
    GenerarSalidadeAlmacn1: TMenuItem;
    QL_TurcAUXILIAR1: TStringField;
    QL_TurcAUXILIAR2: TStringField;
    QL_TurcSALIDA_ALMACEN: TStringField;
    QL_TurcDEVOL_ALMACEN: TStringField;
    ReclasificarValesdeCrdito1: TMenuItem;
    EliminarSalidadeAlmacn1: TMenuItem;
    QL_TurcSalidaPaq: TStringField;
    N5: TMenuItem;
    PreverSalida: TMenuItem;
    ImprimirSalidadeAlmacn1: TMenuItem;
    QL_TurcCALC: TStringField;
    QL_TurcAUXILIAR3: TFloatField;
    QL_TurcSalida: TStringField;
    ResumendeValesdelTurno1: TMenuItem;
    ExportarPlizas1: TMenuItem;
    RegistrodeTransacciones1: TMenuItem;
    N6: TMenuItem;
    EliminarValesdelTurno1: TMenuItem;
    RecuperacindeCupones1: TMenuItem;
    N7: TMenuItem;
    EliminarCuponesRecuperados1: TMenuItem;
    RecalcularTotales1: TMenuItem;
    ReclasificacindeTransacciones1: TMenuItem;
    RecuperacinEspecial1: TMenuItem;
    QL_Pval: TQuery;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalIMPORTE: TFloatField;
    QL_PvalSUBCODIGO: TIntegerField;
    VerificarValesdelTurno1: TMenuItem;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1FECHA: TcxGridDBColumn;
    cxGrid1DBTableView1TURNO: TcxGridDBColumn;
    cxGrid1DBTableView1ESTATUS: TcxGridDBColumn;
    cxGrid1DBTableView1CAJERO: TcxGridDBColumn;
    cxGrid1DBTableView1Poliza: TcxGridDBColumn;
    cxGrid1DBTableView1TOTALCUPRECUP: TcxGridDBColumn;
    cxGrid1DBTableView1TOTALTRAN: TcxGridDBColumn;
    cxGrid1DBTableView1TOTALVALES: TcxGridDBColumn;
    cxGrid1DBTableView1TotalGeneral: TcxGridDBColumn;
    cxGrid1DBTableView1Salida: TcxGridDBColumn;
    Panel4: TPanel;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBarliq: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1StyleItem1: TdxNavBarStyleItem;
    dxNavBar1Item4: TdxNavBarItem;
    dxTbPrever: TdxNavBarItem;
    dxTbImprimir: TdxNavBarItem;
    dxNavBar1Item9: TdxNavBarItem;
    dxNavBar1Item10: TdxNavBarItem;
    dxNavBar1Item11: TdxNavBarItem;
    dxNavBar1Item12: TdxNavBarItem;
    QL_Desp: TQuery;
    QL_DespCLAVE: TIntegerField;
    QL_DespNOMBRE: TStringField;
    QL_DespCTACNT: TStringField;
    QL_DespESTACION: TIntegerField;
    QL_TurcTIPOCAJA: TStringField;
    QL_TurcJEFE_TURNO: TIntegerField;
    ModificarJefedeTurno1: TMenuItem;
    QL_TurcNOMBREJEFETURNO: TStringField;
    DBText1: TDBText;
    QL_TurcDescripTurno: TStringField;
    QL_Isla: TQuery;
    QL_IslaISLA: TIntegerField;
    tmValidaLiq: TTimer;
    QL_TurcEstatusLiq: TStringField;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    RegistrarFichadeDepsito1: TMenuItem;
    N8: TMenuItem;
    ModificarFichadeDepsito1: TMenuItem;
    N9: TMenuItem;
    GenerarPlizadeCostos1: TMenuItem;
    EliminarPlizadeCostos1: TMenuItem;
    VistaPreliminardePlizadeCostos1: TMenuItem;
    ImprimirPlizadeCostos1: TMenuItem;
    QL_TurcCONTABILIZADO2: TStringField;
    QL_TurcTIPOPOLIZA2: TStringField;
    QL_TurcNOPOLIZA2: TIntegerField;
    QL_Turcpoliza2: TStringField;
    cxGrid1DBTableView1PoliCostos: TcxGridDBColumn;
    SalidadeAlmacnporIsla1: TMenuItem;
    H1: TMenuItem;
    ExportarCFDIPoliza: TMenuItem;
    QL_FacturasTurno: TQuery;
    QL_FacturasTurnoESTACION: TIntegerField;
    QL_FacturasTurnoTIPOFAC: TStringField;
    QL_FacturasTurnoFOLIO: TIntegerField;
    CierreDeDiaLiqManual: TMenuItem;
    QL_TurcBloqueado: TStringField;
    cxGrid1DBTableView1Bloqueado: TcxGridDBColumn;
    QL_TurcTOTALDESCUENTO: TFloatField;
    QL_TurcTotalNeto: TFloatField;
    cxGrid1DBTableView1TOTALDESC: TcxGridDBColumn;
    cxGrid1DBTableView1TotalNeto: TcxGridDBColumn;
    procedure Salir1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QL_TurcCalcFields(DataSet: TDataSet);
    procedure MesBox1Change(Sender: TObject);
    procedure MIImprimirClick(Sender: TObject);
    procedure GenerarPlizaContable1Click(Sender: TObject);
    procedure EliminarTurnoVaco1Click(Sender: TObject);
    procedure BorrarPliza1Click(Sender: TObject);
    procedure Vales1Click(Sender: TObject);
    procedure ReabrirTurnoLiqClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ReclasificarValesdeCrdito1Click(Sender: TObject);
    procedure CapturadeLiquidaciones1Click(Sender: TObject);
    procedure ResumendelTurno1Click(Sender: TObject);
    procedure ImprimirPolizaClick(Sender: TObject);
    procedure GenerarSalidadeAlmacn1Click(Sender: TObject);
    procedure EliminarSalidadeAlmacn1Click(Sender: TObject);
    procedure PreverSalidaClick(Sender: TObject);
    procedure ResumendeValesdelTurno1Click(Sender: TObject);
    procedure ExportarPlizas1Click(Sender: TObject);
    procedure RegistrodeTransacciones1Click(Sender: TObject);
    procedure EliminarValesdelTurno1Click(Sender: TObject);
    procedure RecuperacindeCupones1Click(Sender: TObject);
    procedure EliminarCuponesRecuperados1Click(Sender: TObject);
    procedure ModificarPliza1Click(Sender: TObject);
    procedure RecalcularTotales1Click(Sender: TObject);
    procedure ReclasificacindeTransacciones1Click(Sender: TObject);
    procedure RecuperacinEspecial1Click(Sender: TObject);
    procedure VerificarValesdelTurno1Click(Sender: TObject);
    procedure NuevaConciliacin1Click(Sender: TObject);
    procedure Anterior2Click(Sender: TObject);
    procedure Siguiente2Click(Sender: TObject);
    procedure Fin2Click(Sender: TObject);
    procedure AbrirTurno1Click(Sender: TObject);
    procedure CerrarTurno1Click(Sender: TObject);
    procedure QL_TurcFechaPaqGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure QL_DespFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure ModificarJefedeTurno1Click(Sender: TObject);
    procedure QL_TurcNOMBREJEFETURNOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure RegistrarFichadeDepsito1Click(Sender: TObject);
    procedure GenerarPlizadeCostos1Click(Sender: TObject);
    procedure EliminarPlizadeCostos1Click(Sender: TObject);
    procedure VistaPreliminardePlizadeCostos1Click(Sender: TObject);
    procedure SalidadeAlmacnporIsla1Click(Sender: TObject);
    procedure ExportarCFDIPolizaClick(Sender: TObject);
    procedure CierreDeDiaLiqManualClick(Sender: TObject);
  private
    { Private declarations }
    ModoProc:integer;
    primeraIsla:integer;
    orIsla:string;
    FJsonLiquidacionAPI:string;
    FHiloConsultaLiq: TThread;   // hilo activo de consulta de liquidacion
    FColaConsultaLiq: TList;     // turnos pendientes por consultar/procesar
    FConsultaLiqActiva: Boolean;
    FConsultaLiqActivaFechaTurno: TDateTime;
    FConsultaLiqActivaNoTurno: Integer;
    FConsultaLiqActivaEstacion: Integer;
    FSyncWaitForm: TForm;
    function HayConsultasLiquidacionPendientesOActivas: Boolean;
    procedure MostrarSincronizandoLiquidacionesNube;
    procedure OcultarSincronizandoLiquidacionesNube;
    procedure VerificarVales;
    function ValidaEstatusLiq:Boolean;
    function DameVolumenAjusteDGASAJUD2(const AEstacion: Integer;
      const AFechaTurno: TDateTime; const ANoTurno, ANoCombustible: Integer): Double;
    function DameMagnitudARepartirDGASAJUD2(const AEstacion: Integer;
      const AFechaTurno: TDateTime; const ANoTurno, ANoCombustible: Integer): Double;
    procedure AplicarAjusteDGASAJUD2Json(var AJsonLiquidacion: string;
      const AEstacion: Integer; const AFechaTurno: TDateTime; const ANoTurno: Integer);
    procedure ConsultaLiquidacionAPIAlCerrarTurno(const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
      const ANoTurno, AEstacion: Integer);
    function ConsultaLiquidacionAPIYaProgramada(const AFechaTurno: TDateTime;
      const ANoTurno, AEstacion: Integer): Boolean;
    procedure EncolaConsultaLiquidacionAPI(const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
      const ANoTurno, AEstacion: Integer);
    procedure IniciaSiguienteConsultaLiquidacionAPI;
    procedure FinalizaConsultaLiquidacionAPI(AThread: TThread);
    procedure LimpiaColaConsultaLiquidacionAPI;
  public
    { Public declarations }
    procedure RefrescaTabla;
    procedure PreparaForma(xModo:integer);
    procedure LimpiaValesEnCeroEnPval;
    function ValidaSalidaAlmacen:Boolean;
    function ValidaTurnoCXC:Boolean;
  end;

var
  FLIQTURC: TFLIQTURC;

implementation

uses ULIBGRAL, DDMGEN, UGEN_NET,  ULIBDATABASE, DDMGAS, DDMGASQ,
  DDMCUP, ULIQRCUP, ULIQCCAJAI, DDMCNT, ULIQTURCN, ULIQTRAN, ULIQLIQGIr,
  ULIQLIQG, ULIQPVAL, ULIQTURCPOLI, DDMLIQ, UCNTPOLICNF, UCNTPOLIF,
  ULIQTURCSALI, DDMINV, DDMGEN_VTAS, UINVSALIF, DDMCFG, ULIQREP14,
  ULIQTURCcpol, ULIQTURCVP, UGASEXPO, UCNTPOLIN, ULIQTRAN2, ULIQRCUP2,
  ULIQTURCJT,UAutoriza, ULIQLIQGR, ULIQPVALR, ULIQRCUPR, ULIQRCUP2R,
  ULIQTRANR, ULIQPVALK, DDMAJUS, ULIQFDEP, DDMGENT, ULIQSALISLA, DDMXML,
  UGENXMLMES, UAVANCE, fClientForm, UGASXMLMES, ULIQREP47, DDM_PUNTOS,
  ComObj, uLkJSON, ActiveX, Math;

{$R *.DFM}

const
  WINHTTP_OPTION_SECURE_PROTOCOLS = 9;
  WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2 = $00000800;
  LIQ_API_IDP_BASE_URL = 'https://idpautenticacionestaciondev.azurewebsites.net';
  LIQ_API_BASE_URL = 'https://estaciondev.igas.mx';
  LIQ_API_USERNAME = 'PL_8169_EXP_ES_2015';
  LIQ_API_PASSWORD = '3g.SiM8&Z^z9';
  // Timeouts en milisegundos: resolve, connect, send, receive.
  // Se mantienen cortos para no congelar demasiado la UI durante el cierre.
  LIQ_API_TIMEOUT_RESOLVE = 5000;
  LIQ_API_TIMEOUT_CONNECT = 5000;
  LIQ_API_TIMEOUT_SEND    = 10000;
  LIQ_API_TIMEOUT_RECEIVE = 15000;

type
  TModoRepartoAjuste = (mraPartesIguales, mraProporcional);

  TSyncWaitForm = class(TForm)
  private
    FPaintBox: TPaintBox;
    FLabel: TLabel;
    FTimer: TTimer;
    FFrame: Integer;
    procedure PaintSpinner(Sender: TObject);
    procedure TimerTick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  // Cache del token de la API de liquidaciones.
  // Durante el cierre de dia se consultan varios turnos; no tiene sentido
  // pedir /auth/token por cada turno si ya se obtuvo correctamente una vez.
  GLiqApiAccessTokenCache: string;
  GLiqApiTokenTypeCache: string;
  GLiqApiTokenSolicitado: Boolean;
  GLiqApiTokenCS: TRTLCriticalSection;


function LiqApiBlendColor(const AColor1, AColor2: TColor;
  const APercentColor1: Integer): TColor;
var
  C1, C2: Longint;
  P1, P2: Integer;
  R, G, B: Integer;
begin
  P1 := APercentColor1;
  if P1 < 0 then
    P1 := 0
  else if P1 > 100 then
    P1 := 100;
  P2 := 100 - P1;

  C1 := ColorToRGB(AColor1);
  C2 := ColorToRGB(AColor2);

  R := (GetRValue(C1) * P1 + GetRValue(C2) * P2) div 100;
  G := (GetGValue(C1) * P1 + GetGValue(C2) * P2) div 100;
  B := (GetBValue(C1) * P1 + GetBValue(C2) * P2) div 100;

  Result := RGB(R, G, B);
end;

constructor TSyncWaitForm.Create(AOwner: TComponent);
const
  COLOR_BORDE_NARANJA = $001A90D9;
  COLOR_FONDO = $00EDEDED;
begin
  inherited CreateNew(AOwner);
  BorderStyle := bsDialog;
  BorderIcons := [];
  Caption := 'Sincronizando';
  ClientWidth := 425;
  ClientHeight := 86;
  Position := poDesigned;
  Color := COLOR_FONDO;
  Font.Name := 'Tahoma';
  Font.Size := 8;
  FormStyle := fsStayOnTop;

  FPaintBox := TPaintBox.Create(Self);
  FPaintBox.Parent := Self;
  FPaintBox.Left := 24;
  FPaintBox.Top := 20;
  FPaintBox.Width := 52;
  FPaintBox.Height := 52;
  FPaintBox.OnPaint := PaintSpinner;

  FLabel := TLabel.Create(Self);
  FLabel.Parent := Self;
  FLabel.Left := 96;
  FLabel.Top := 34;
  FLabel.AutoSize := True;
  FLabel.Transparent := True;
  FLabel.Font.Name := 'Tahoma';
  FLabel.Font.Size := 11;
  FLabel.Font.Style := [];
  FLabel.Caption := 'Sincronizando informacion con liquidaciones nube';

  FTimer := TTimer.Create(Self);
  FTimer.Interval := 90;
  FTimer.Enabled := True;
  FTimer.OnTimer := TimerTick;

  // Borde naranja para que visualmente combine con la ventana principal.
  Canvas.Pen.Color := COLOR_BORDE_NARANJA;
end;

procedure TSyncWaitForm.TimerTick(Sender: TObject);
begin
  Inc(FFrame);
  if FFrame >= 12 then
    FFrame := 0;
  if Assigned(FPaintBox) then
    FPaintBox.Invalidate;
end;

procedure TSyncWaitForm.PaintSpinner(Sender: TObject);
const
  SEGMENTOS = 12;
  COLOR_BORDE_NARANJA = $001A90D9;
var
  I: Integer;
  X, Y: Integer;
  CX, CY: Integer;
  Radio: Integer;
  RadioPunto: Integer;
  Angulo: Double;
  Porcentaje: Integer;
  DotColor: TColor;
begin
  with FPaintBox.Canvas do begin
    Brush.Style := bsSolid;
    Brush.Color := Self.Color;
    FillRect(FPaintBox.ClientRect);
    Pen.Style := psClear;

    CX := FPaintBox.Width div 2;
    CY := FPaintBox.Height div 2;
    Radio := 16;
    RadioPunto := 3;

    for I := 0 to SEGMENTOS - 1 do begin
      Angulo := (((I + FFrame) mod SEGMENTOS) * (2 * Pi / SEGMENTOS)) - (Pi / 2);
      X := CX + Round(Cos(Angulo) * Radio);
      Y := CY + Round(Sin(Angulo) * Radio);

      // Deja una cola suave: el punto lider es naranja intenso y los demas
      // se mezclan con el fondo para dar sensacion de giro sin recuadro blanco.
      Porcentaje := 25 + ((SEGMENTOS - 1 - I) * 75) div (SEGMENTOS - 1);
      DotColor := LiqApiBlendColor(COLOR_BORDE_NARANJA, Self.Color, Porcentaje);

      Brush.Color := DotColor;
      Ellipse(X - RadioPunto, Y - RadioPunto, X + RadioPunto + 1, Y + RadioPunto + 1);
    end;
  end;
end;

function LiqApiRemoveTrailingSlash(const S: string): string;
begin
  Result := Trim(S);
  while (Length(Result) > 0) and (Result[Length(Result)] = '/') do
    Delete(Result, Length(Result), 1);
end;

function LiqApiUrlEncode(const S: string): string;
var
  I: Integer;
  Ch: Char;
begin
  Result := '';
  for I := 1 to Length(S) do begin
    Ch := S[I];
    if Ch in ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.', '~'] then
      Result := Result + Ch
    else if Ch = ' ' then
      Result := Result + '+'
    else
      Result := Result + '%' + IntToHex(Ord(Ch), 2);
  end;
end;

function LiqApiExtractJsonStringValue(const Json, Key: string): string;
var
  P, I, StartPos: Integer;
  Pattern: string;
  Ch: Char;
begin
  Result := '';
  Pattern := '"' + Key + '"';

  P := Pos(Pattern, Json);
  if P = 0 then
    Exit;

  I := P + Length(Pattern);

  while (I <= Length(Json)) and (Json[I] <= ' ') do
    Inc(I);

  if (I > Length(Json)) or (Json[I] <> ':') then
    Exit;

  Inc(I);

  while (I <= Length(Json)) and (Json[I] <= ' ') do
    Inc(I);

  if I > Length(Json) then
    Exit;

  if Json[I] = '"' then begin
    Inc(I);
    while I <= Length(Json) do begin
      Ch := Json[I];
      if Ch = '"' then
        Break;

      if Ch = '\' then begin
        Inc(I);
        if I > Length(Json) then
          Break;

        case Json[I] of
          '"', '\', '/':
            Result := Result + Json[I];
          'b':
            Result := Result + #8;
          'f':
            Result := Result + #12;
          'n':
            Result := Result + #10;
          'r':
            Result := Result + #13;
          't':
            Result := Result + #9;
          'u':
            Inc(I, 4);
        else
          Result := Result + Json[I];
        end;
      end
      else
        Result := Result + Ch;

      Inc(I);
    end;
  end
  else begin
    StartPos := I;
    while (I <= Length(Json)) and not (Json[I] in [',', '}', ']', #9, #10, #13, ' ']) do
      Inc(I);
    Result := Trim(Copy(Json, StartPos, I - StartPos));
  end;
end;

procedure LiqApiHttpRequest(const Method, Url, Body, Authorization, ContentType: string;
  var StatusCode: Integer; var ResponseText: string);
var
  Http: OleVariant;
begin
  StatusCode := 0;
  ResponseText := '';

  try
    Http := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    Http.Open(Method, Url, False);

    try
      Http.SetTimeouts(
        LIQ_API_TIMEOUT_RESOLVE,
        LIQ_API_TIMEOUT_CONNECT,
        LIQ_API_TIMEOUT_SEND,
        LIQ_API_TIMEOUT_RECEIVE);
    except
    end;

    try
      Http.Option[WINHTTP_OPTION_SECURE_PROTOCOLS] := WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2;
    except
    end;

    if ContentType <> '' then
      Http.SetRequestHeader('Content-Type', ContentType);

    if Authorization <> '' then
      Http.SetRequestHeader('Authorization', Authorization);

    Http.SetRequestHeader('Accept', 'application/json');

    if Body <> '' then
      Http.Send(Body)
    else
      Http.Send;

    StatusCode := Http.Status;
    ResponseText := Http.ResponseText;
  except
    on E: Exception do
      raise Exception.Create('Error de comunicacion con la API. Metodo: ' + Method +
        ', URL: ' + Url + #13 + E.Message);
  end;
end;

function LiqApiCombinaFechaHora(const AFecha, AHora: TDateTime): TDateTime;
begin
  if Trunc(AHora) = 0 then
    Result := Trunc(AFecha) + Frac(AHora)
  else
    Result := AHora;
end;

function LiqApiFormatDateParam(const AValue: TDateTime): string;
begin
  // La API de liquidaciones espera la fecha del turno sin hora.
  // El filtro fino del turno se completa con noTurno.
  Result := FormatDateTime('yyyy-mm-dd', AValue);
end;

function LiqApiSolicitarTokenAPI(var AAccessToken, ATokenType: string): Boolean;
var
  Url: string;
  Body: string;
  Status: Integer;
  Resp: string;
  Token: string;
begin
  Result := False;
  AAccessToken := '';
  ATokenType := '';

  Url := LiqApiRemoveTrailingSlash(LIQ_API_IDP_BASE_URL) + '/auth/token';
  Body := 'username=' + LiqApiUrlEncode(LIQ_API_USERNAME) +
          '&password=' + LiqApiUrlEncode(LIQ_API_PASSWORD) +
          '&grant_type=password';

  LiqApiHttpRequest(
    'POST',
    Url,
    Body,
    '',
    'application/x-www-form-urlencoded',
    Status,
    Resp
  );

  if not (Status in [200, 201]) then
    raise Exception.Create('La API no regreso exito al solicitar token. HTTP ' + IntToStr(Status) + #13 + Resp);

  Token := LiqApiExtractJsonStringValue(Resp, 'access_token');
  if Token = '' then
    Token := LiqApiExtractJsonStringValue(Resp, 'token');
  if Token = '' then
    Token := LiqApiExtractJsonStringValue(Resp, 'id_token');

  ATokenType := LiqApiExtractJsonStringValue(Resp, 'token_type');
  if ATokenType = '' then
    ATokenType := 'Bearer';

  if Token = '' then
    raise Exception.Create('No se encontro access_token/token/id_token en la respuesta del token.' + #13 + Resp);

  AAccessToken := StringReplace(Token, 'Bearer ', '', [rfIgnoreCase]);
  Result := True;
end;

function LiqApiObtenerToken(var AAccessToken, ATokenType: string): Boolean;
var
  NuevoAccessToken: string;
  NuevoTokenType: string;
begin
  Result := False;
  AAccessToken := '';
  ATokenType := '';

  // El token se pide una sola vez por ejecucion de la unidad/proceso.
  // Si varios turnos entran casi al mismo tiempo, el CriticalSection evita
  // que todos disparen /auth/token simultaneamente.
  EnterCriticalSection(GLiqApiTokenCS);
  try
    if GLiqApiTokenSolicitado and (Trim(GLiqApiAccessTokenCache) <> '') then begin
      AAccessToken := GLiqApiAccessTokenCache;
      ATokenType := GLiqApiTokenTypeCache;
      if Trim(ATokenType) = '' then
        ATokenType := 'Bearer';

      Result := True;
      Exit;
    end;

    NuevoAccessToken := '';
    NuevoTokenType := '';

    if LiqApiSolicitarTokenAPI(NuevoAccessToken, NuevoTokenType) then begin
      GLiqApiAccessTokenCache := NuevoAccessToken;
      GLiqApiTokenTypeCache := NuevoTokenType;
      if Trim(GLiqApiTokenTypeCache) = '' then
        GLiqApiTokenTypeCache := 'Bearer';
      GLiqApiTokenSolicitado := True;

      AAccessToken := GLiqApiAccessTokenCache;
      ATokenType := GLiqApiTokenTypeCache;
      Result := True;
    end;
  finally
    LeaveCriticalSection(GLiqApiTokenCS);
  end;
end;

function LiqApiStrToFloatDef(const S: string; const ADefault: Double): Double;
var
  Tmp: string;
begin
  Result := ADefault;
  Tmp := Trim(S);
  if Tmp = '' then
    Exit;

  try
    Result := StrToFloat(Tmp);
  except
    try
      Tmp := StringReplace(Tmp, '.', DecimalSeparator, [rfReplaceAll]);
      Result := StrToFloat(Tmp);
    except
      Result := ADefault;
    end;
  end;
end;

function LiqApiJsonStringDef(AObj: TlkJSONobject; const AName, ADefault: string): string;
var
  JValue: TlkJSONbase;
begin
  Result := ADefault;
  if not Assigned(AObj) then
    Exit;

  JValue := AObj.Field[AName];
  if not Assigned(JValue) then
    Exit;

  if JValue is TlkJSONnull then
    Exit;

  try
    Result := VarToStr(JValue.Value);
  except
    Result := ADefault;
  end;
end;

function LiqApiJsonDoubleDef(AObj: TlkJSONobject; const AName: string; const ADefault: Double): Double;
var
  JValue: TlkJSONbase;
begin
  Result := ADefault;
  if not Assigned(AObj) then
    Exit;

  JValue := AObj.Field[AName];
  if not Assigned(JValue) then
    Exit;

  if JValue is TlkJSONnull then
    Exit;

  try
    if JValue is TlkJSONstring then
      Result := LiqApiStrToFloatDef(VarToStr(JValue.Value), ADefault)
    else
      Result := JValue.Value;
  except
    Result := ADefault;
  end;
end;

function LiqApiJsonIntegerDef(AObj: TlkJSONobject; const AName: string; const ADefault: Integer): Integer;
begin
  Result := Trunc(LiqApiJsonDoubleDef(AObj, AName, ADefault));
end;

function LiqApiLitrosManguera(AObj: TlkJSONobject): Double;
var
  LitrosDiferencia: Double;
  LitrosLecturas: Double;
begin
  Result := 0;
  if not Assigned(AObj) then
    Exit;

  // IMPORTANTE:
  // Para este flujo los valores que se reparten en diferenciaLecturas2 son
  // litros. DGASAJUD2.volumen esta en litros y la diferencia original de la
  // API tambien representa litros vendidos/movidos por la manguera.
  //
  // No dividir entre precio aqui: eso convertiria incorrectamente litros como
  // si fueran importe. El precio se conserva en el JSON, pero no participa en
  // el reparto del volumen.
  LitrosDiferencia := Abs(LiqApiJsonDoubleDef(AObj, 'diferencia', 0));
  if LitrosDiferencia > 0.0000001 then begin
    Result := LitrosDiferencia;
    Exit;
  end;

  // Fallback defensivo: si la API no trae diferencia, usar diferenciaLecturas
  // siempre como magnitud de litros.
  LitrosLecturas := Abs(LiqApiJsonDoubleDef(AObj, 'diferenciaLecturas', 0));
  if LitrosLecturas > 0.0000001 then
    Result := LitrosLecturas;
end;

function LiqApiModoRepartoAjuste: TModoRepartoAjuste;
var
  Modo: string;
begin
  // Por defecto el ajuste se reparte proporcionalmente al movimiento de cada
  // manguera. Si se requiere repartir en partes iguales, configurar:
  // LiqRepartoAjuste = Iguales
  Result := mraProporcional;

  try
    Modo := Trim(DMGEN.VarComp('LiqRepartoAjuste'));
    if SameText(Modo, 'Iguales') then
      Result := mraPartesIguales
    else if SameText(Modo, 'Proporcional') then
      Result := mraProporcional;
  except
    Result := mraProporcional;
  end;
end;

procedure LiqApiValidaMagnitudVsApi(const AVolumenTotal, ASumaLitrosApi: Double;
  const ANoCombustible: Integer);
const
  UMBRAL_RELATIVO = 0.05;
var
  Denom: Double;
begin
  Denom := Abs(ASumaLitrosApi);
  if Denom < 0.0001 then
    Exit;

  if Abs(Abs(AVolumenTotal) - Denom) / Denom > UMBRAL_RELATIVO then
    MensajeWarn('Aviso liquidacion combustible ' + IntToStr(ANoCombustible) +
      ': los litros a repartir (' + FloatToStr(AVolumenTotal) + ') difieren ' +
      'mucho de los litros reportados por la API (' + FloatToStr(ASumaLitrosApi) +
      '). Revisar si DGASAJUD2.volumen contiene el mismo criterio de litros que espera la API.');
end;

function LiqApiValidacionMagnitudActiva: Boolean;
begin
  Result := False;
  try
    Result := SameText(Trim(DMGEN.VarComp('LiqValidaMagnitudAjusteAPI')), 'Si');
  except
    Result := False;
  end;
end;

function LiqApiEsDetalleLiquidacion(AValue: TlkJSONbase): Boolean;
begin
  Result := Assigned(AValue) and (AValue is TlkJSONobject) and
            (Assigned(TlkJSONobject(AValue).Field['id']) or
             Assigned(TlkJSONobject(AValue).Field['detalleId']) or
             Assigned(TlkJSONobject(AValue).Field['nombreCombustible']));
end;

function LiqApiContenedorDetalleLiquidacion(AValue: TlkJSONbase): TlkJSONbase;
const
  CAMPOS_CONTENEDOR: array[0..6] of string =
    ('data', 'result', 'resultado', 'liquidacion', 'liquidaciones', 'detalle', 'detalles');
var
  I: Integer;
  Campo: TlkJSONbase;
begin
  Result := AValue;

  if LiqApiEsDetalleLiquidacion(Result) or (Assigned(Result) and (Result is TlkJSONlist)) then
    Exit;

  if Assigned(AValue) and (AValue is TlkJSONobject) then begin
    for I := Low(CAMPOS_CONTENEDOR) to High(CAMPOS_CONTENEDOR) do begin
      Campo := TlkJSONobject(AValue).Field[CAMPOS_CONTENEDOR[I]];
      if Assigned(Campo) then begin
        Result := Campo;
        Exit;
      end;
    end;
  end;
end;

function LiqApiCrearObjetoDetalleLiquidacion(AOrigen: TlkJSONobject): TlkJSONobject;
begin
  Result := TlkJSONobject.Generate;

  // Mantener exactamente estos campos y este orden.
  Result.Add('id', LiqApiJsonIntegerDef(AOrigen, 'id', 0));
  Result.Add('noTurno', LiqApiJsonIntegerDef(AOrigen, 'noTurno', 0));
  Result.Add('fechaTurno', LiqApiJsonStringDef(AOrigen, 'fechaTurno', ''));
  Result.Add('detalleId', LiqApiJsonIntegerDef(AOrigen, 'detalleId', 0));
  Result.Add('diferencia', LiqApiJsonDoubleDef(AOrigen, 'diferencia', 0));
  Result.Add('devolucion', LiqApiJsonDoubleDef(AOrigen, 'devolucion', 0));
  Result.Add('consignacion', LiqApiJsonDoubleDef(AOrigen, 'consignacion', 0));
  Result.Add('diferenciaLecturas', LiqApiJsonDoubleDef(AOrigen, 'diferenciaLecturas', 0));
  Result.Add('diferenciaLecturas2', LiqApiJsonDoubleDef(AOrigen, 'diferenciaLecturas2', 0));
  Result.Add('noCombustible', LiqApiJsonIntegerDef(AOrigen, 'noCombustible', 0));
  Result.Add('nombreCombustible', LiqApiJsonStringDef(AOrigen, 'nombreCombustible', ''));
  Result.Add('precio', LiqApiJsonDoubleDef(AOrigen, 'precio', 0));
  Result.Add('noManguera', LiqApiJsonIntegerDef(AOrigen, 'noManguera', 0));
end;

function LiqApiCrearJsonDetalleLiquidacion(const ARespuestaAPI: string): string;
var
  JsonRespuesta: TlkJSONbase;
  JsonContenedor: TlkJSONbase;
  JsonSalida: TlkJSONbase;
  ListaSalida: TlkJSONlist;
  I: Integer;
begin
  Result := '';
  JsonRespuesta := nil;
  JsonSalida := nil;

  JsonRespuesta := TlkJSON.ParseText(ARespuestaAPI);
  if not Assigned(JsonRespuesta) then
    raise Exception.Create('La respuesta de la liquidacion no es un JSON valido.' + #13 + ARespuestaAPI);

  try
    JsonContenedor := LiqApiContenedorDetalleLiquidacion(JsonRespuesta);

    if Assigned(JsonContenedor) and (JsonContenedor is TlkJSONlist) then begin
      ListaSalida := TlkJSONlist.Generate;
      JsonSalida := ListaSalida;

      for I := 0 to JsonContenedor.Count - 1 do begin
        if JsonContenedor.Child[I] is TlkJSONobject then
          ListaSalida.Add(LiqApiCrearObjetoDetalleLiquidacion(TlkJSONobject(JsonContenedor.Child[I])));
      end;
    end
    else if Assigned(JsonContenedor) and (JsonContenedor is TlkJSONobject) then
      JsonSalida := LiqApiCrearObjetoDetalleLiquidacion(TlkJSONobject(JsonContenedor))
    else
      raise Exception.Create('La respuesta de la liquidacion no contiene un objeto de detalle valido.' + #13 + ARespuestaAPI);

    Result := TlkJSON.GenerateText(JsonSalida);
  finally
    if Assigned(JsonSalida) then
      JsonSalida.Free;
    JsonRespuesta.Free;
  end;
end;


function LiqApiFechaJsonIgual(const AFechaJson: string; const AFechaTurno: TDateTime): Boolean;
var
  FechaJson: string;
begin
  FechaJson := Trim(AFechaJson);
  if Length(FechaJson) >= 10 then
    FechaJson := Copy(FechaJson, 1, 10);

  Result := FechaJson = FormatDateTime('yyyy-mm-dd', AFechaTurno);
end;

function LiqApiDetalleCoincideAjuste(AObj: TlkJSONobject; const AFechaTurno: TDateTime;
  const ANoTurno, ANoCombustible: Integer): Boolean;
begin
  Result := Assigned(AObj) and
            (LiqApiJsonIntegerDef(AObj, 'noTurno', 0) = ANoTurno) and
            (LiqApiJsonIntegerDef(AObj, 'noCombustible', 0) = ANoCombustible) and
            LiqApiFechaJsonIgual(LiqApiJsonStringDef(AObj, 'fechaTurno', ''), AFechaTurno);
end;

function LiqApiCuentaManguerasAjuste(AJson: TlkJSONbase; const AFechaTurno: TDateTime;
  const ANoTurno, ANoCombustible: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  if not Assigned(AJson) then
    Exit;

  if AJson is TlkJSONlist then begin
    for I := 0 to AJson.Count - 1 do begin
      if (AJson.Child[I] is TlkJSONobject) and
         LiqApiDetalleCoincideAjuste(TlkJSONobject(AJson.Child[I]), AFechaTurno, ANoTurno, ANoCombustible) then
        Inc(Result);
    end;
  end
  else if (AJson is TlkJSONobject) and
          LiqApiDetalleCoincideAjuste(TlkJSONobject(AJson), AFechaTurno, ANoTurno, ANoCombustible) then
    Result := 1;
end;

procedure LiqApiAsignaDiferenciaLecturas2(AObj: TlkJSONobject; const AValor: Double);
var
  Campo: TlkJSONbase;
begin
  if not Assigned(AObj) then
    Exit;

  Campo := AObj.Field['diferenciaLecturas2'];
  if Assigned(Campo) then
    Campo.Value := AValor
  else
    AObj.Add('diferenciaLecturas2', AValor);
end;

function LiqApiConsultarLiquidacion(const AAccessToken, ATokenType: string;
  const AFechaIni, AFechaFin: TDateTime; const ANoTurno: Integer;
  var AJsonLiquidacion: string): Boolean;
var
  Url: string;
  Status: Integer;
  Resp: string;
  AuthHeader: string;
begin
  Result := False;
  AJsonLiquidacion := '';

  Url := LiqApiRemoveTrailingSlash(LIQ_API_BASE_URL) +
         '/api/legacy/liquidacion/getdetallecombustible' +
         '?fechaini=' + LiqApiUrlEncode(LiqApiFormatDateParam(AFechaIni)) +
         '&fechafin=' + LiqApiUrlEncode(LiqApiFormatDateParam(AFechaFin)) +
         '&noTurno=' + LiqApiUrlEncode(IntToStr(ANoTurno));

  AuthHeader := ATokenType + ' ' + AAccessToken;

  LiqApiHttpRequest(
    'GET',
    Url,
    '',
    AuthHeader,
    '',
    Status,
    Resp
  );

  if not (Status in [200, 201]) then
    raise Exception.Create('La API no regreso exito al consultar liquidaciones. HTTP ' + IntToStr(Status) + #13 + Resp);

  AJsonLiquidacion := LiqApiCrearJsonDetalleLiquidacion(Resp);
  Result := True;
end;


function TFLIQTURC.DameVolumenAjusteDGASAJUD2(const AEstacion: Integer;
  const AFechaTurno: TDateTime; const ANoTurno, ANoCombustible: Integer): Double;
begin
  Result := 0;

  with DMGAS do begin
    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Add('select coalesce(sum(diferencia),0) as Real1');
    Q_Auxi.SQL.Add('from DGASAJUD2');
    Q_Auxi.SQL.Add('where Estacion='+IntToStr(AEstacion));
    Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(AFechaTurno)));
    Q_Auxi.SQL.Add('  and Turno='+IntToStr(ANoTurno));
    Q_Auxi.SQL.Add('  and Combustible='+IntToStr(ANoCombustible));
    Q_Auxi.Prepare;
    Q_Auxi.Open;

    try
      if not Q_Auxi.IsEmpty then
        Result := Q_AuxiReal1.AsFloat;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

function TFLIQTURC.DameMagnitudARepartirDGASAJUD2(const AEstacion: Integer;
  const AFechaTurno: TDateTime; const ANoTurno, ANoCombustible: Integer): Double;
begin
  Result := 0;

  // Devuelve la magnitud que se reparte en diferenciaLecturas2.
  // IMPORTANTE: hoy DGASAJUD2.volumen contiene el valor neto guardado por el
  // cierre local. Si el contrato de la API pide otro delta, debe cambiarse aqui
  // la fuente del dato, no el algoritmo de reparto.

  Result := DameVolumenAjusteDGASAJUD2(AEstacion, AFechaTurno, ANoTurno, ANoCombustible);
end;

procedure TFLIQTURC.AplicarAjusteDGASAJUD2Json(var AJsonLiquidacion: string;
  const AEstacion: Integer; const AFechaTurno: TDateTime; const ANoTurno: Integer);
type
  TMangueraAjuste = record
    Obj: TlkJSONobject;
    NoManguera: Integer;
    PesoLitros: Double;
    LitrosApi: Double;
  end;

  TGrupoCombustibleAjuste = record
    NoCombustible: Integer;
    Mangueras: array of TMangueraAjuste;
    VolumenTotal: Double;
    SumaPesosLitros: Double;
    SumaLitrosApi: Double;
  end;
var
  JsonBase: TlkJSONbase;
  Grupos: array of TGrupoCombustibleAjuste;
  Modo: TModoRepartoAjuste;

  function IndiceGrupo(const ANoCombustible: Integer): Integer;
  var
    J: Integer;
  begin
    for J := Low(Grupos) to High(Grupos) do begin
      if Grupos[J].NoCombustible = ANoCombustible then begin
        Result := J;
        Exit;
      end;
    end;

    Result := Length(Grupos);
    SetLength(Grupos, Result + 1);
    Grupos[Result].NoCombustible := ANoCombustible;
    Grupos[Result].VolumenTotal := 0;
    Grupos[Result].SumaPesosLitros := 0;
    Grupos[Result].SumaLitrosApi := 0;
    SetLength(Grupos[Result].Mangueras, 0);
  end;

  procedure RecolectaManguera(AObj: TlkJSONobject);
  var
    NoCombustible: Integer;
    GrupoIndex: Integer;
    MangueraIndex: Integer;
    LitrosManguera: Double;
  begin
    if not Assigned(AObj) then
      Exit;

    if (LiqApiJsonIntegerDef(AObj, 'noTurno', 0) <> ANoTurno) or
       not LiqApiFechaJsonIgual(LiqApiJsonStringDef(AObj, 'fechaTurno', ''), AFechaTurno) then
      Exit;

    NoCombustible := LiqApiJsonIntegerDef(AObj, 'noCombustible', 0);
    if NoCombustible <= 0 then
      Exit;

    GrupoIndex := IndiceGrupo(NoCombustible);
    MangueraIndex := Length(Grupos[GrupoIndex].Mangueras);
    SetLength(Grupos[GrupoIndex].Mangueras, MangueraIndex + 1);

    LitrosManguera := LiqApiLitrosManguera(AObj);

    Grupos[GrupoIndex].Mangueras[MangueraIndex].Obj := AObj;
    Grupos[GrupoIndex].Mangueras[MangueraIndex].NoManguera :=
      LiqApiJsonIntegerDef(AObj, 'noManguera', 0);
    Grupos[GrupoIndex].Mangueras[MangueraIndex].PesoLitros := LitrosManguera;
    Grupos[GrupoIndex].Mangueras[MangueraIndex].LitrosApi := LitrosManguera;
  end;

  procedure OrdenaManguerasPorNumero(var AGrupo: TGrupoCombustibleAjuste);
  var
    I, J: Integer;
    Tmp: TMangueraAjuste;
  begin
    for I := 1 to High(AGrupo.Mangueras) do begin
      Tmp := AGrupo.Mangueras[I];
      J := I - 1;
      while (J >= 0) and (AGrupo.Mangueras[J].NoManguera > Tmp.NoManguera) do begin
        AGrupo.Mangueras[J + 1] := AGrupo.Mangueras[J];
        Dec(J);
      end;
      AGrupo.Mangueras[J + 1] := Tmp;
    end;
  end;

  function IndiceMangueraResidual(const AGrupo: TGrupoCombustibleAjuste): Integer;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 1 to High(AGrupo.Mangueras) do begin
      if (AGrupo.Mangueras[I].PesoLitros > AGrupo.Mangueras[Result].PesoLitros) or
         ((AGrupo.Mangueras[I].PesoLitros = AGrupo.Mangueras[Result].PesoLitros) and
          (AGrupo.Mangueras[I].NoManguera > AGrupo.Mangueras[Result].NoManguera)) then
        Result := I;
    end;
  end;

  procedure ReparteGrupo(var AGrupo: TGrupoCombustibleAjuste);
  var
    I: Integer;
    N: Integer;
    IndiceResidual: Integer;
    VolumenAsignado: Double;
    VolumenManguera: Double;
    Fraccion: Double;
    UsaProporcional: Boolean;
  begin
    N := Length(AGrupo.Mangueras);
    if N <= 0 then
      Exit;

    OrdenaManguerasPorNumero(AGrupo);

    // VolumenTotal se obtiene de DGASAJUD2.volumen y esta expresado en litros.
    // diferenciaLecturas2 debe recibir litros, no importe.
    AGrupo.VolumenTotal := DameMagnitudARepartirDGASAJUD2(
      AEstacion, AFechaTurno, ANoTurno, AGrupo.NoCombustible);

    AGrupo.SumaPesosLitros := 0;
    AGrupo.SumaLitrosApi := 0;
    for I := 0 to N - 1 do begin
      AGrupo.SumaPesosLitros := AGrupo.SumaPesosLitros + AGrupo.Mangueras[I].PesoLitros;
      AGrupo.SumaLitrosApi := AGrupo.SumaLitrosApi + AGrupo.Mangueras[I].LitrosApi;
    end;

    if LiqApiValidacionMagnitudActiva then
      LiqApiValidaMagnitudVsApi(AGrupo.VolumenTotal, AGrupo.SumaLitrosApi,
        AGrupo.NoCombustible);

    UsaProporcional := (Modo = mraProporcional) and (Abs(AGrupo.SumaPesosLitros) > 0.0000001);
    IndiceResidual := IndiceMangueraResidual(AGrupo);
    VolumenAsignado := 0;

    for I := 0 to N - 1 do begin
      if I = IndiceResidual then
        Continue;

      if UsaProporcional then
        Fraccion := AGrupo.Mangueras[I].PesoLitros / AGrupo.SumaPesosLitros
      else
        Fraccion := 1 / N;

      VolumenManguera := AGrupo.VolumenTotal * Fraccion;
      VolumenAsignado := VolumenAsignado + VolumenManguera;
      LiqApiAsignaDiferenciaLecturas2(AGrupo.Mangueras[I].Obj, VolumenManguera);
    end;

    // La manguera residual recibe el saldo exacto. Asi la suma por combustible
    // siempre cuadra con DGASAJUD2, aunque existan decimales periodicos.
    LiqApiAsignaDiferenciaLecturas2(AGrupo.Mangueras[IndiceResidual].Obj,
      AGrupo.VolumenTotal - VolumenAsignado);
  end;

var
  I: Integer;
  GrupoIndex: Integer;
begin
  if Trim(AJsonLiquidacion) = '' then
    Exit;

  // El ajuste de DGASAJUD2 se aplica por turno. El cierre del turno maximo
  // del dia programa las consultas de cada turno y la cola garantiza que se
  // procesen una por una, sin pisarse entre si.

  Modo := LiqApiModoRepartoAjuste;

  JsonBase := TlkJSON.ParseText(AJsonLiquidacion);
  if not Assigned(JsonBase) then
    raise Exception.Create('No fue posible parsear el JSON de liquidacion para aplicar DGASAJUD2.');

  try
    SetLength(Grupos, 0);

    // Pre-pasada: se agrupa por combustible. Esto evita consultas repetidas y
    // hace posible un reparto determinista, sin depender del orden de la API.
    if JsonBase is TlkJSONlist then begin
      for I := 0 to JsonBase.Count - 1 do begin
        if JsonBase.Child[I] is TlkJSONobject then
          RecolectaManguera(TlkJSONobject(JsonBase.Child[I]));
      end;
    end
    else if JsonBase is TlkJSONobject then
      RecolectaManguera(TlkJSONobject(JsonBase));

    for GrupoIndex := Low(Grupos) to High(Grupos) do
      ReparteGrupo(Grupos[GrupoIndex]);

    AJsonLiquidacion := TlkJSON.GenerateText(JsonBase);
  finally
    JsonBase.Free;
  end;
end;


// ===========================================================================
//  Consulta de liquidacion en segundo plano.
//  - El HTTP corre en este hilo (token + consulta).
//  - El ajuste por manguera lee DGASAJUD2, por eso se ejecuta despues en el
//    hilo principal dentro de EntregaResultado (via Synchronize).
// ===========================================================================
type
  TLiqApiConsultaLiqItem = class
  public
    FechaIni: TDateTime;
    FechaFin: TDateTime;
    FechaTurno: TDateTime;
    NoTurno: Integer;
    Estacion: Integer;
  end;

  TLiqApiConsultaLiqThread = class(TThread)
  private
    FFormulario: TFLIQTURC;        // se toca solo desde el hilo principal; nil = desvinculado
    FFechaIni: TDateTime;
    FFechaFin: TDateTime;
    FFechaTurno: TDateTime;
    FNoTurno: Integer;
    FEstacion: Integer;
    FJson: string;
    FError: string;
    procedure EntregaResultado;    // corre en el hilo principal (Synchronize)
  protected
    procedure Execute; override;
  public
    constructor Create(AFormulario: TFLIQTURC;
      const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
      const ANoTurno, AEstacion: Integer);
    procedure OlvidaFormulario;
  end;

constructor TLiqApiConsultaLiqThread.Create(AFormulario: TFLIQTURC;
  const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
  const ANoTurno, AEstacion: Integer);
begin
  inherited Create(True);          // suspendido: primero llenamos los campos
  FreeOnTerminate := True;
  FFormulario := AFormulario;
  FFechaIni   := AFechaIni;
  FFechaFin   := AFechaFin;
  FFechaTurno := AFechaTurno;
  FNoTurno    := ANoTurno;
  FEstacion   := AEstacion;
end;

procedure TLiqApiConsultaLiqThread.OlvidaFormulario;
begin
  // Se invoca desde el hilo principal. A partir de aqui este hilo ya no debe
  // tocar el formulario, aunque termine correctamente la consulta HTTP.
  FFormulario := nil;
end;

procedure TLiqApiConsultaLiqThread.Execute;
var
  AccessToken: string;
  TokenType: string;
  hr: HRESULT;
begin
  // WinHttp se crea con CreateOleObject (COM): este hilo debe inicializar COM.
  hr := CoInitialize(nil);
  try
    try
      if LiqApiObtenerToken(AccessToken, TokenType) then
        LiqApiConsultarLiquidacion(AccessToken, TokenType,
          FFechaIni, FFechaFin, FNoTurno, FJson)
      else
        FError := 'No fue posible obtener el token de la API.';
    except
      on E: Exception do
        FError := E.Message;
    end;
  finally
    if (hr = S_OK) or (hr = S_FALSE) then
      CoUninitialize;
  end;

  // Regresa al hilo principal. El ajuste toca BD/VCL indirectamente, por eso
  // no se ejecuta dentro del hilo de trabajo.
  if not Terminated then
    Synchronize(EntregaResultado);
end;

procedure TLiqApiConsultaLiqThread.EntregaResultado;
var
  jsonStr:TStringList;
begin
  // ---------- ESTO YA CORRE EN EL HILO PRINCIPAL ----------
  if FFormulario = nil then
    Exit;

  try
    try
      if FError <> '' then
        raise Exception.Create(FError);

      // El ajuste por manguera lee DGASAJUD2: correcto ejecutarlo aqui.
      FFormulario.AplicarAjusteDGASAJUD2Json(FJson, FEstacion, FFechaTurno, FNoTurno);
      FFormulario.FJsonLiquidacionAPI := FJson;

      jsonStr:=TStringList.Create();
      try
        jsonStr.Add(FJson);
        jsonStr.SaveToFile('C:\ImagenCo\JsonLiq_Turno'+IntToStr(FNoTurno)+'.txt');
      finally
        jsonStr.Free;
      end;

      // Aqui puede agregarse la persistencia/envio posterior del JSON ajustado,
      // usando FEstacion, FFechaTurno, FNoTurno y FJson.
    except
      on E: Exception do
        MensajeWarn('El turno se cerro, pero no fue posible aplicar/consultar la '
          + 'liquidacion en la API del turno '+IntToStr(FNoTurno)+'.' + #13 + E.Message);
    end;
  finally
    // Libera el turno activo y dispara el siguiente pendiente.
    if FFormulario <> nil then
      FFormulario.FinalizaConsultaLiquidacionAPI(Self);
  end;
end;


function TFLIQTURC.HayConsultasLiquidacionPendientesOActivas: Boolean;
begin
  Result := FConsultaLiqActiva or Assigned(FHiloConsultaLiq) or
    (Assigned(FColaConsultaLiq) and (FColaConsultaLiq.Count > 0));
end;

procedure TFLIQTURC.MostrarSincronizandoLiquidacionesNube;
begin
  if not Assigned(FSyncWaitForm) then begin
    FSyncWaitForm := TSyncWaitForm.Create(Application);

    if Assigned(Self) then begin
      FSyncWaitForm.Left := Self.Left + ((Self.Width - FSyncWaitForm.Width) div 2);
      FSyncWaitForm.Top := Self.Top + 20;
    end;
  end;

  if not FSyncWaitForm.Visible then
    FSyncWaitForm.Show;

  FSyncWaitForm.BringToFront;
  FSyncWaitForm.Update;
end;

procedure TFLIQTURC.OcultarSincronizandoLiquidacionesNube;
begin
  if Assigned(FSyncWaitForm) then begin
    FSyncWaitForm.Hide;
    FreeAndNil(FSyncWaitForm);
  end;
end;

procedure TFLIQTURC.ConsultaLiquidacionAPIAlCerrarTurno(const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
  const ANoTurno, AEstacion: Integer);
begin
  // Ya no se crea un hilo por llamada dejando atras el anterior.
  // Durante el cierre del turno maximo del dia se pueden programar varios
  // turnos muy rapido; por eso se encolan y se procesan uno por uno.
  EncolaConsultaLiquidacionAPI(AFechaIni, AFechaFin, AFechaTurno, ANoTurno, AEstacion);
end;

function TFLIQTURC.ConsultaLiquidacionAPIYaProgramada(const AFechaTurno: TDateTime;
  const ANoTurno, AEstacion: Integer): Boolean;
var
  I: Integer;
  Item: TLiqApiConsultaLiqItem;
begin
  Result := False;

  // Evita duplicar el mismo turno cuando el ciclo de ajustes recorre varios
  // combustibles del mismo turno. La consulta a la API debe hacerse una sola
  // vez por estacion/fecha/turno, no una vez por combustible.
  if FConsultaLiqActiva and
     (FConsultaLiqActivaNoTurno = ANoTurno) and
     (FConsultaLiqActivaEstacion = AEstacion) and
     (Trunc(FConsultaLiqActivaFechaTurno) = Trunc(AFechaTurno)) then begin
    Result := True;
    Exit;
  end;

  if not Assigned(FColaConsultaLiq) then
    Exit;

  for I := 0 to FColaConsultaLiq.Count - 1 do begin
    Item := TLiqApiConsultaLiqItem(FColaConsultaLiq[I]);
    if Assigned(Item) and
       (Item.NoTurno = ANoTurno) and
       (Item.Estacion = AEstacion) and
       (Trunc(Item.FechaTurno) = Trunc(AFechaTurno)) then begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TFLIQTURC.EncolaConsultaLiquidacionAPI(const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
  const ANoTurno, AEstacion: Integer);
var
  Item: TLiqApiConsultaLiqItem;
begin
  if ConsultaLiquidacionAPIYaProgramada(AFechaTurno, ANoTurno, AEstacion) then
    Exit;

  if not Assigned(FColaConsultaLiq) then
    FColaConsultaLiq := TList.Create;

  Item := TLiqApiConsultaLiqItem.Create;
  Item.FechaIni := AFechaIni;
  Item.FechaFin := AFechaFin;
  Item.FechaTurno := AFechaTurno;
  Item.NoTurno := ANoTurno;
  Item.Estacion := AEstacion;

  FColaConsultaLiq.Add(Item);

  // Mientras exista al menos una consulta pendiente o activa, se muestra una
  // ventana de espera para que el usuario vea que la sincronizacion sigue en curso.
  MostrarSincronizandoLiquidacionesNube;

  // Si no hay consulta activa, arranca de inmediato. Si ya hay una, queda
  // pendiente y se ejecutara al terminar la actual.
  IniciaSiguienteConsultaLiquidacionAPI;
end;

procedure TFLIQTURC.IniciaSiguienteConsultaLiquidacionAPI;
var
  Item: TLiqApiConsultaLiqItem;
  Hilo: TLiqApiConsultaLiqThread;
begin
  if Assigned(FHiloConsultaLiq) then
    Exit;

  if (not Assigned(FColaConsultaLiq)) or (FColaConsultaLiq.Count = 0) then
    Exit;

  Item := TLiqApiConsultaLiqItem(FColaConsultaLiq[0]);
  FColaConsultaLiq.Delete(0);

  try
    // Limpia el JSON anterior justo antes de iniciar el turno que toca.
    // Asi, si este turno falla, no queda en memoria el JSON del anterior.
    FJsonLiquidacionAPI := '';

    FConsultaLiqActiva := True;
    FConsultaLiqActivaFechaTurno := Item.FechaTurno;
    FConsultaLiqActivaNoTurno := Item.NoTurno;
    FConsultaLiqActivaEstacion := Item.Estacion;

    // El HTTP (token + consulta) corre en segundo plano para no congelar la UI.
    // El ajuste por manguera, que toca BD, se ejecuta despues en el hilo principal.
    Hilo := TLiqApiConsultaLiqThread.Create(
      Self, Item.FechaIni, Item.FechaFin, Item.FechaTurno, Item.NoTurno, Item.Estacion);
    FHiloConsultaLiq := Hilo;

    try
      // Delphi clasico: Resume. En Delphi 2010+ se usaria Start.
      Hilo.Resume;
    except
      FHiloConsultaLiq := nil;
      FConsultaLiqActiva := False;
      Hilo.Free;
      raise;
    end;
  finally
    Item.Free;
  end;
end;

procedure TFLIQTURC.FinalizaConsultaLiquidacionAPI(AThread: TThread);
begin
  if FHiloConsultaLiq = AThread then
    FHiloConsultaLiq := nil;

  FConsultaLiqActiva := False;
  FConsultaLiqActivaFechaTurno := 0;
  FConsultaLiqActivaNoTurno := 0;
  FConsultaLiqActivaEstacion := 0;

  // Continua con el siguiente turno pendiente, si lo hay.
  IniciaSiguienteConsultaLiquidacionAPI;

  if not HayConsultasLiquidacionPendientesOActivas then
    OcultarSincronizandoLiquidacionesNube
  else
    MostrarSincronizandoLiquidacionesNube;
end;

procedure TFLIQTURC.LimpiaColaConsultaLiquidacionAPI;
var
  I: Integer;
begin
  if not Assigned(FColaConsultaLiq) then
    Exit;

  for I := 0 to FColaConsultaLiq.Count - 1 do
    TLiqApiConsultaLiqItem(FColaConsultaLiq[I]).Free;

  FColaConsultaLiq.Clear;
  FreeAndNil(FColaConsultaLiq);
end;

procedure TFLIQTURC.PreparaForma(xModo:integer);
begin
  with DMGEN,DMGASQ,DMLIQ do begin
    QL_Isla.Close;
    QL_Isla.ParamByName('pestacion').AsInteger:=DMGAS.EstacionActual;
    QL_Isla.Prepare;
    QL_Isla.Open;
    QL_Isla.First;

    orIsla:=EmptyStr;
    primeraIsla:=QL_IslaISLA.AsInteger;
    QL_Isla.Next;

    while not QL_Isla.Eof do begin
      orIsla:=orIsla+'       or Isla='+IntToStr(QL_IslaISLA.AsInteger);
      QL_Isla.Next;
    end;

    ModoProc:=xModo;
    DMGAS.AbreTablasGasT('Turc');

    QL_Desp.Close;
    QL_Desp.Prepare;
    QL_Desp.Open;

    if not DMGAS.TT_Caja.Active then DMGAS.TT_Caja.Active := True;

    IniciaMesBox(MesBox1,MesIniEjercicio(MesInicial(idGas)),MesFinEjercicio,VgMes,false);
    RefrescaTabla;

    VarLiqTurnoRestringido:=TurnoEsRestringido;

    //OPCION DE MENU
    if DMGAS.VarGasManejaJefeTurno='No' then begin
      ModificarJefedeTurno1.Visible:=False;
      DBText1.Visible:=False;
    end;

    SalidadeAlmacnporIsla1.Visible:=DMGAS.VarLiqGenerarSalidaAlmacenIslas='Si';

    //Opcion exportar CFDI
    ExportarCFDIPoliza.Visible:=((DMCNT.SubMod04_ContaElect)and(DMGEN.varGenDesactivarEnvioDeXMLAlGenerarPoliza='Si'));

    if DMGAS.VarGasAjusteManual='Si' then begin
      cxGrid1DBTableView1Bloqueado.Visible:=True;
      self.Width:=self.Width+60;

      ChecaDerechoEspecialAutor3(idSist,aeCerrarDiaLiq);
      if FAutoriza.PassOk then CierreDeDiaLiqManual.Visible:=true;
    end;


    if (DMGAS.ValidaModulo(idDesc)) or (DMGAS.VarGasSistemaGulfActivo = 'Si') or (DM_PUNTOS.LicenciaEsValidaPuntos) then begin
      cxGrid1DBTableView1TOTALDESC.Visible:=True;
      cxGrid1DBTableView1TotalNeto.Visible:=True;
      FLIQTURC.Width:=1190;
    end
    else begin
      cxGrid1DBTableView1TOTALDESC.Visible:=False;
      cxGrid1DBTableView1TotalNeto.Visible:=False;
      FLIQTURC.Width:=1009;
    end;
  end;
end;

procedure TFLIQTURC.RefrescaTabla;
var feci,
    fecf:TDateTime;
begin
  with DMGEN,DMGASQ,DMGAS do begin
    feci:=MesDiaToFecha(ElementoActualMesBox(MesBox1),1);
    fecf:=MesDiaMaxToFecha(ElementoActualMesBox(MesBox1));
    QL_Turc.close;
    QL_Turc.SQL.Clear;
    QL_Turc.SQL.Add('select t.*,');
    QL_Turc.SQL.Add('  (select nombre from dgasdesp where clave=t.jefe_turno) as NombreJefeTurno,');
    QL_Turc.SQL.Add('  coalesce((select descuento from dgasdesc where estacion=t.estacion and fecha=t.fecha and turno=t.turno),0) as TotalDescuento');
    QL_Turc.SQL.Add('from DGASTURC t');
    QL_Turc.SQL.Add('where t.Estacion='+IntToStr(EstacionActual));
    QL_Turc.SQL.Add('  and t.Caja='+IntToStr(CajaActual));
    QL_Turc.SQL.Add('  and t.Fecha>="'+FechaToStrSql(feci)+'"');
    QL_Turc.SQL.Add('  and t.Fecha<="'+FechaToStrSql(fecf)+'"');
    QL_Turc.SQL.Add('order by t.fecha desc, t.turno desc');
    QL_Turc.Prepare;
    QL_Turc.Open;
    VgMes:=FechaToMes(fecf);
    if cxGrid1DBTableView1.ViewData.RowCount>0 then
      cxGrid1DBTableView1.ViewData.Rows[0].Expanded:=TRUE;
    if not DMGENT.T_Empr.Active then
      DMGENT.T_Empr.Open;
    if DMGENT.T_EmprSERIEKEY.AsInteger=392 then begin
      RegistrarFichadeDepsito1.Visible:=True;
      ModificarFichadeDepsito1.Visible:=True;
    end;
  end;
end;

procedure TFLIQTURC.Salir1Click(Sender: TObject);
begin
  close;
end;

procedure TFLIQTURC.DBLookupComboBox1Click(Sender: TObject);
begin
  RefrescaTabla;
end;

procedure TFLIQTURC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // No se permite cerrar la forma mientras la sincronizacion con la API siga
  // activa o existan turnos pendientes en cola. Asi se evita perder ajustes.
  if HayConsultasLiquidacionPendientesOActivas then begin
    MostrarSincronizandoLiquidacionesNube;
    Action := caNone;
    Exit;
  end;

  OcultarSincronizandoLiquidacionesNube;
  LimpiaColaConsultaLiquidacionAPI;
  FConsultaLiqActiva := False;
  FConsultaLiqActivaFechaTurno := 0;
  FConsultaLiqActivaNoTurno := 0;
  FConsultaLiqActivaEstacion := 0;

  if Assigned(FHiloConsultaLiq) then begin
    TLiqApiConsultaLiqThread(FHiloConsultaLiq).OlvidaFormulario;
    FHiloConsultaLiq := nil;
  end;

  QL_Turc.Close;
end;

procedure TFLIQTURC.QL_TurcCalcFields(DataSet: TDataSet);
begin
  with DMGAS,DMGASQ do begin
    if QL_TurcEstatus.AsString='C' then
      QL_TurcDescEstatus.AsString:='Cerrado';
    if QL_TurcEstatus.AsString='A' then
      QL_TurcDescEstatus.AsString:='Abierto';
    if LocalizaQuery(QT_Cajr,'Clave',QL_TurcCajero.asinteger) then
      QL_TurcNombreCajero.AsString:=QT_CajrNombre.AsString;
    QL_TurcDescCaja.AsString:='Caja '+IntToClaveNum(QL_TurcCaja.asinteger,2);
    QL_TurcFechaPaq.AsString:=FechaPaq(QL_TurcFecha.AsDateTime);
    QL_TurcSalida.AsString:='No';
    if QL_TurcSalida_Almacen.AsString<>'' then
      QL_TurcSalida.AsString:='Si';
    if QL_TurcContabilizado.AsString='Si' then
      if QL_TurcTipoPoliza.AsString='**' then
        QL_TurcPoliza.AsString:='   OK'
      else
        QL_TurcPoliza.AsString:=QL_TurcTipoPoliza.AsString+'-'+IntToClaveNum(QL_TurcNoPoliza.asinteger,6);
    if LimpiaStr(QL_TurcSalida_Almacen.AsString)<>'' then
        QL_TurcSalidaPaq.AsString:=Copy(QL_TurcSalida_Almacen.AsString,3,2)+'-'+Copy(QL_TurcSalida_Almacen.Asstring,5,6);
    if QL_TurcCONTABILIZADO2.AsString='Si' then
      if QL_TurcTipoPoliza2.AsString='**' then
        QL_TurcPoliza2.AsString:='   OK'
      else
        QL_TurcPoliza2.AsString:=QL_TurcTipoPoliza2.AsString+'-'+IntToClaveNum(QL_TurcNoPoliza2.asinteger,6);
//
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Sum(TotGral) as Real1 from DGASLIQG');
    Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
    Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCaja.AsInteger));
    Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
    Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    if ModoProc=0 then
      QL_TurcTotalGeneral.AsFloat:=Q_AuxiReal1.AsFloat-QL_TurcAuxiliar3.AsFloat
    else
      QL_TurcTotalGeneral.AsFloat:=Q_AuxiReal1.AsFloat;


    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASAJUD');
    Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
    Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
    Q_Auxi.SQL.Add('  and aplicado='+QuotedStr('Si'));
    Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
    Q_Auxi.Prepare;
    Q_Auxi.Open;

    if Q_AuxiEntero1.AsInteger > 0 then
      QL_TurcBloqueado.AsString:='S'
    else
      QL_TurcBloqueado.AsString:='N';

  end;
  if ValidaEstatusLiq then
    QL_TurcEstatusLiq.AsString:='Si Liquidado'
  else
    QL_TurcEstatusLiq.AsString:='No Liquidado';
  QL_TurcDescripTurno.asstring:='Turno: '+IntToClaveNum(QL_TurcTURNO.AsInteger,2)+'  Fecha: '+FechaPaq(QL_TurcFECHA.asdatetime);
  QL_TurcTotalNeto.AsFloat:=QL_TurcTotalGeneral.AsFloat-QL_TurcTOTALDESCUENTO.AsFloat;

end;

procedure TFLIQTURC.MesBox1Change(Sender: TObject);
begin
  RefrescaTabla;
end;

procedure TFLIQTURC.MIImprimirClick(Sender: TObject);
var swdetalle:boolean;
begin
  with DMGAS,DMCUP do begin
    if ModoProc=1 then
      exit;
    VgFechaIni:=QL_TurcFecha.AsDateTime;
    if TipoCajaActual=idTipoLiq then begin
      if (Sender=MIPrever)or(Sender=dxTbPrever) then begin
        Application.CreateForm(TFLIQCCAJAI,FLIQCCAJAI);
        try
          FLIQCCAJAI.PreparaReporte(QL_TurcEstacion.asinteger,QL_TurcCaja.AsInteger,QL_TurcTurno.AsInteger,QL_TurcFecha.AsDateTime,true);
          FLIQCCAJAI.QuickRep1.Preview
        finally
          FLIQCCAJAI.Free;
        end;
      end
      else begin
        if MensajeConf('Imprimir detallado?')=mrYes then
          swdetalle:=true
        else
          swdetalle:=false;
        Application.CreateForm(TFLIQCCAJAI,FLIQCCAJAI);
        try
          FLIQCCAJAI.PreparaReporte(QL_TurcEstacion.asinteger,QL_TurcCaja.AsInteger,QL_TurcTurno.AsInteger,QL_TurcFecha.AsDateTime,swdetalle);
          FLIQCCAJAI.QuickRep1.Print;
        finally
          FLIQCCAJAI.Free;
        end;
      end;
    end;
  end;
end;

procedure TFLIQTURC.GenerarPlizaContable1Click(Sender: TObject);
var bm:tbookmark;
begin
  with DMGEN,DMCUP,DMGAS do begin
    if ModoProc=1 then
      exit;
    if QL_Turc.IsEmpty then begin
      MensajeInfo('No se encontrï¿½ turno seleccionado');
      Exit;
    end;
    if QL_TurcEstatus.AsString<>'C' then
      raise Exception.Create('Turno debe estar cerrado');
    if QL_TurcContabilizado.AsString='Si' then
      raise Exception.Create('Turno ya esta contabilizado');
    if not MesAbierto(idCnt,idPoli,FechaToMes(QL_TurcFecha.asdatetime)) then
      raise Exception.Create('Mes esta cerrado en Contabilidad');
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No encuentro turno seleccionado.');
    if VarGasPolizaLiqDia='Si' then begin
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno>'+IntToStr(QL_TurcTurno.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger>0 then
        raise Exception.Create('Debe Contabilizar en el ï¿½ltimo turno del dï¿½a');
    end;
    if VarGasLigarPolizasCXCconLIQ = 'Si' then begin
      if not(ValidaTurnoCXC) then begin
        MensajeInfo('No es posible generar pï¿½liza de Liquidaciones.'+#10+'Asegï¿½rese de tener los turnos cerrados y descontabilizados en el mï¿½dulo de cuentas por cobrar.');
        Exit;
      end;
    end;
    ChecaDerechoEspecialAutor3(idLiq,aeNoPoliza);
    if (FAutoriza.PassOk) and (DMGEN.ClaveUsuarioActivo<>0) then begin
      MensajeErr('Usuario no tiene autotizaciï¿½n para realizar la pï¿½liza de I-Gas Liquidaciones.');
      Exit;
    end;
    if (LocalizaTabla(DMCFG.T_Cpol,'Documento;Numero',VarArrayOf([idLiqg,1])))
       and (DMCFG.T_CpolTipoPoliza.asstring<>'**') then begin
      Application.CreateForm(TFLIQTURCcpol,FLIQTURCcpol);
      bm:=QL_Turc.GetBookmark;
      try
        SetTipoDocumento(idLiqg);
        FLIQTURCcpol.xPolizaCosto:=False;
        FLIQTURCcpol.PreparaForma(idLiqg,1);
        FLIQTURCcpol.showmodal;
        RefrescaTabla;
      finally
        FLIQTURCcpol.Free;
        SpeedButton2Click(Sender);
        QL_Turc.GotoBookmark(bm);
        QL_Turc.FreeBookmark(bm);
      end;
    end
    else begin
      Application.CreateForm(TFLIQTURCPOLI,FLIQTURCPOLI);
      bm:=QL_Turc.GetBookmark;
      try
        SetTipoDocumento(idPoli);
        IniciaDocAccion(idDocu,'',AccNuevo);
        FLIQTURCPOLI.PreparaForma(QL_TurcFecha.AsDateTime);
        FLIQTURCPOLI.showmodal;
        RefrescaTabla;
      finally
        LimpiaDocAccion;
        FLIQTURCPOLI.Free;
        SpeedButton2Click(Sender);
        QL_Turc.GotoBookmark(bm);
        QL_Turc.FreeBookmark(bm);
      end;
    end;
  end;
end;

procedure TFLIQTURC.EliminarTurnoVaco1Click(Sender: TObject);
begin
  with DMGEN,DMGAS do begin
    if ModoProc=1 then
      exit;
    if CajeroActual<>QL_TurcCajero.AsInteger then begin
      MensajeErr('Usuario no es el Cajero del turno');
      ChecaDerechoEspecialAutor2(idLiq,aeUsuarioCajeroSupervisor,True);
      if not FAutoriza.PassOk then
        exit;
    end;
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([EstacionActual,CajaActual,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No encuentro turno abierto.');
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.clear;
    Q_Auxi.SQL.Add('select count(*) as Entero1 from dgaspval');
    Q_Auxi.SQL.Add('where estacion='+inttostr(QL_TurcEstacion.asinteger));
    Q_Auxi.SQL.Add('  and caja='+inttostr(QL_TurcCaja.asinteger));
    Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(QL_TurcFecha.asdatetime)+'"');
    Q_Auxi.SQL.Add('  and turno='+inttostr(QL_TurcTurno.asinteger));
    Q_Auxi.open;
    if Q_AuxiEntero1.asinteger>0 then
      raise Exception.Create('Turno con Vales de Crï¿½dito');
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.clear;
    Q_Auxi.SQL.Add('select count(*) as Entero1 from dgasrcup');
    Q_Auxi.SQL.Add('where estacion='+inttostr(QL_TurcEstacion.asinteger));
    Q_Auxi.SQL.Add('  and caja='+inttostr(QL_TurcCaja.asinteger));
    Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(QL_TurcFecha.asdatetime)+'"');
    Q_Auxi.SQL.Add('  and turno='+inttostr(QL_TurcTurno.asinteger));
    Q_Auxi.open;
    if Q_AuxiEntero1.asinteger>0 then
      raise Exception.Create('Turno con Cupones Recuperados');
    Q_Auxi.Active:=false;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.clear;
    Q_Auxi.SQL.Add('select count(*) as Entero1 from dgasliqg');
    Q_Auxi.SQL.Add('where estacion='+inttostr(QL_TurcEstacion.asinteger));
    Q_Auxi.SQL.Add('  and caja='+inttostr(QL_TurcCaja.asinteger));
    Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(QL_TurcFecha.asdatetime)+'"');
    Q_Auxi.SQL.Add('  and turno='+inttostr(QL_TurcTurno.asinteger));
    Q_Auxi.open;
    if Q_AuxiEntero1.asinteger>0 then
      raise Exception.Create('Turno con Liquidaciones');
    if MensajeConf('Desea eliminar el turno?')=mrYes then begin
      //CORRECCIï¿½N PARA QUE ELIMINE LOS REGISTROS DE LAS TABLAS DE DESCUENTOS QUE NO SE BORRABAN.
      T_Turc.Edit;
      T_TurcESTATUS.AsString:='C';
      T_Turc.Post;
      
      T_Turc.Delete;
      RefrescaQuery(DMGASQ.QT_Turca);
      RefrescaTabla;
    end;
  end;
end;

procedure TFLIQTURC.BorrarPliza1Click(Sender: TObject);
var bm:tbookmark;
  existepolizaenBD:boolean;
begin
  with DMCNT,DMGEN,DMGAS do begin
    existepolizaenBD:=True;
    if ModoProc=1 then
      exit;
    if QL_TurcContabilizado.AsString<>'Si' then
      abort;
    if not MesAbierto(idCnt,idPoli,FechaToMes(QL_TurcFecha.asdatetime)) then
      raise Exception.Create('Mes esta cerrado en contabilidad.');
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No encuentro turno seleccionado.');
    if VarGasPolizaLiqDia='Si' then begin
      if QL_TurcTipoPoliza.AsString='**' then
        raise Exception.Create('No es el ï¿½ltimo turno del dï¿½a.');
    end;
    ChecaDerechoDocu(drEliminar,idPoli,QL_TurcFecha.asdatetime);
    if MensajeConf('ï¿½Desea eliminar esta pï¿½liza?')=mrYes then begin
      bm:=QL_Turc.GetBookmark;
      if not LocalizaTabla(T_Poli,'Mes;TipoPoliza;NoPoliza',VarArrayOf([FechaToMes(QL_TurcFecha.asdatetime),QL_TurcTipoPoliza.asstring,QL_TurcNoPoliza.asinteger])) then begin
        existepolizaenBD:=False;
        T_Turc.Edit;
        T_TurcContabilizado.AsString:='No';
        T_TurcTipoPoliza.AsString:='';
        T_TurcNoPoliza.AsString:='';
        T_Turc.Post;
//
        if VarGasPolizaLiqDia='Si' then begin
          with DMGAS do begin
            Q_Auxi.Close;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Update DGASTURC Set Contabilizado="No", TipoPoliza=" " ');
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
            Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
            Q_Auxi.Prepare;
            Q_Auxi.ExecSQL;
          end;
        end;
        SetTipoDocumento(idPoli);
        try
          if existepolizaenBD then begin //validar que se si exista y no borre lo que encuentre
            IniciaDocAccion(idDocu,T_PoliClaveStr.AsString,AccEliminar);
            try
              AplicaPoliza(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger,false);
              VgSwAvance:=false;
              BorraPoliza_SP(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger);
  //            if DMCNT.SubMod04_ContaElect then
  //              DesvinculaXMLADMNCFDI;
  //            T_Turc.Edit;
  //            T_TurcContabilizado.AsString:='No';
  //            T_TurcTipoPoliza.AsString:='';
  //            T_TurcNoPoliza.AsString:='';
  //            T_Turc.Post;
              FinalizaDocAccion;
  //            RefrescaTabla;
            except
              CancelaDocAccion;
              raise;
            end;
          end;
        finally
          LimpiaDocAccion;
        end;
        SpeedButton2Click(Sender);
        QL_Turc.GotoBookmark(bm);
        QL_Turc.FreeBookmark(bm);
        Exit;
      end;
      try
        IniciaDocAccion(idDocu,T_PoliClaveStr.AsString,AccEliminar);
        try
          AplicaPoliza(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger,false);
          VgSwAvance:=false;
          BorraPoliza_SP(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger);
          T_Turc.Edit;
          T_TurcContabilizado.AsString:='No';
          T_TurcTipoPoliza.AsString:='';
          T_TurcNoPoliza.AsString:='';
          T_Turc.Post;
//
          if VarGasPolizaLiqDia='Si' then begin
            with DMGAS do begin
              Q_Auxi.Close;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Update DGASTURC Set Contabilizado="No", TipoPoliza=" " ');
              Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
              Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
              Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
              Q_Auxi.Prepare;
              Q_Auxi.ExecSQL;
            end;
          end;
          if VarGenExportarXMLLiqCxc = 'Si' then
            DesvinculaCFDI(T_TurcESTACION.AsInteger,T_TurcFECHA.AsDateTime,T_TurcTURNO.AsInteger,T_TurcTIPOPOLIZA.AsString,T_TurcNOPOLIZA.AsInteger,T_TurcCAJA.AsInteger,True);
          FinalizaDocAccion;
        except
          CancelaDocAccion;
          raise;
        end;
      finally
        LimpiaDocAccion;
        SpeedButton2Click(Sender);
        QL_Turc.GotoBookmark(bm);
        QL_Turc.FreeBookmark(bm);
      end;
    end;
  end;
end;

procedure TFLIQTURC.Vales1Click(Sender: TObject);
begin
  with DMGAS,DMGASQ do begin
    if ModoProc=1 then Exit;

    if not VsAccesoRemoto then RefrescaQuery(QT_Turca);

    if (DMGEN.SistemaActivo2(idTablet)) or (DMGEN.SistemaActivo2(idKio)) then begin
      Application.CreateForm(TFLIQPVALK,FLIQPVALK);
      try
        if LocalizaQuery(QT_TurcA,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcEstacion.AsInteger,QL_TurcCaja.AsInteger,
                                                                          QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then begin
          FLIQPVALK.PreparaForma;
          FLIQPVALK.ShowModal;
        end;
      finally
        RefrescaDataBase(DMGAS.DBGAS1);
        RefrescaDataBase(DMGAS.DBGAS2);
        RefrescaTabla;

        if not VsAccesoRemoto then RefrescaQuery(QT_Turca);

        FLIQPVALK.Free;
      end;
    end
    else begin
      if QL_TurcESTATUS.AsString='A' then begin
        Application.CreateForm(TFLIQPVAL,FLIQPVAL);
        try
          if LocalizaQuery(QT_TurcA,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcEstacion.AsInteger,QL_TurcCaja.AsInteger,
                                                                            QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then begin
            FLIQPVAL.PreparaForma;
            FLIQPVAL.ShowModal;
          end;
        finally
          RefrescaDataBase(DMGAS.DBGAS1);
          RefrescaDataBase(DMGAS.DBGAS2);
          RefrescaTabla;

          if not VsAccesoRemoto then RefrescaQuery(QT_Turca);

          FLIQPVAL.Free;
        end;
      end
      else if QL_TurcESTATUS.AsString='C' then begin
        try
          Q_Auxi.close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select count(*) as Entero1 from DGASTURC');
          Q_Auxi.SQL.Add('Where estatus='+QuotedStr('C'));
          Q_Auxi.SQL.Add('  and estacion='+IntToStr(QL_TurcESTACION.AsInteger));
          Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCAJA.AsInteger));
          Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QL_TurcFECHA.AsDateTime)));
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTURNO.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if Q_AuxiEntero1.AsInteger>0 then begin
            try
              DMGAS.swTurnoLectura:=True;
              Application.CreateForm(TFLIQPVALR,FLIQPVALR);
              FLIQPVALR.PreparaForma;
              FLIQPVALR.ShowModal;
            finally
              RefrescaDataBase(DMGAS.DBGAS1);
              RefrescaDataBase(DMGAS.DBGAS2);
              RefrescaTabla;
              if not VsAccesoRemoto then
                RefrescaQuery(QT_Turca);
              FLIQPVALR.Free;
              DMGAS.swTurnoLectura:=False;
            end;
          end;
        finally
          Q_Auxi.Close;
        end;
      end;
    end;
  end;
end;

procedure TFLIQTURC.ReabrirTurnoLiqClick(Sender: TObject);
var bm:tbookmark;
begin
  with DMGAS,DMLIQ,DMGASQ do begin
    if ModoProc=1 then Exit;

    if (DMGAS.VarGasAjusteManual='Si') and (DMGEN.VarComp('AliasAuxiliar')<>'')then begin
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASAJUD');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and aplicado='+QuotedStr('Si'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      if Q_AuxiEntero1.AsInteger > 0 then raise Exception.Create('Dï¿½a de liquidaciones se encuentra bloqueado');
    end;

    if Q_AuxiEntero1.AsInteger>0 then begin
      MensajeInfo('Dï¿½a de liquidaciones ya se encuentra cerrado');
      Exit;
    end;

    if ValidaSalidaAlmacen then begin
      MensajeInfo('No es posible reabrir el turno, contiene salidas de almacï¿½n.');
      exit;
    end;

    RefrescaQuery(QT_Turca);

    if not QT_Turca.IsEmpty then begin
      ChecaDerechoEspecialAutor2(idLiq,aeReabrirTurnoLiq,True);
      if not FAutoriza.PassOk then raise Exception.Create('Existen Turnos abiertos'+#13+'Usuario no tiene derecho para reabrir turno');
    end;

    if VarLiqTurnosAuto='Si' then begin
      ChecaDerechoEspecialAutor2(idLiq,aeModificarLiquidaciones,True);
      if not FAutoriza.PassOk then Exit;
    end;

    if ((QL_TurcContabilizado.AsString='Si') or (QL_TurcContabilizado2.AsString='Si')) then begin
      MensajeInfo('Turno estï¿½ contabilizado');
      Exit;
    end;

    try
      bm:=QL_Turc.GetBookmark;
      DBGAS2.StartTransaction;
      
      try
        Q_Auxi.Close;
        Q_Auxi.SQL.clear;
        Q_Auxi.SQL.Add('Update DGASTURC set Estatus="A" ');
        Q_Auxi.SQL.Add('where Estacion='+inttostr(QL_TurcEstacion.asinteger));
        Q_Auxi.SQL.Add('  and Caja='+inttostr(QL_TurcCaja.asinteger));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
        Q_Auxi.SQL.Add('  and Turno='+inttostr(QL_TurcTurno.asinteger));
        Q_Auxi.Prepare;
        Q_Auxi.ExecSQL;

        if DMGEN.VarComp('AliasAuxiliar')<>'' then begin
          Q_Auxi.Close;
          Q_Auxi.SQL.clear;
          Q_Auxi.SQL.Add('Update DGASAJUD set APLICADO='+QuotedStr('No'));
          Q_Auxi.SQL.Add('where Estacion='+inttostr(QL_TurcEstacion.asinteger));
          Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QL_TurcFecha.AsDateTime)));
          Q_Auxi.Prepare;
          Q_Auxi.ExecSQL;

          Q_Auxi.Close;
          Q_Auxi.SQL.clear;
          Q_Auxi.SQL.Add('Delete from DGASAJUD');
          Q_Auxi.SQL.Add('where Estacion='+inttostr(QL_TurcEstacion.asinteger));
          Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QL_TurcFecha.AsDateTime)));
          Q_Auxi.Prepare;
          Q_Auxi.ExecSQL;

          Q_Auxi.Close;
          Q_Auxi.SQL.clear;
          Q_Auxi.SQL.Add('Delete from DGASAJUD2');
          Q_Auxi.SQL.Add('where Estacion='+inttostr(QL_TurcEstacion.asinteger));
          Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QL_TurcFecha.AsDateTime)));
          Q_Auxi.Prepare;
          Q_Auxi.ExecSQL;
        end;
        
        DBGAS2.Commit;
        VarLiqTurnoRestringido:=TurnoEsRestringido;
      except
        DBGAS2.Rollback;
        raise;
      end;
    finally
      RefrescaDataBase(DMGAS.DBGAS1);
      RefrescaDataBase(DMGAS.DBGAS2);
      RefrescaTabla;

      QL_Turc.GotoBookmark(bm);
      QL_Turc.FreeBookmark(bm);
      RefrescaQuery(QT_Turca);
    end;
  end;
end;

procedure TFLIQTURC.SpeedButton2Click(Sender: TObject);
begin
  RefrescaDataBase(DMGAS.DBGAS1);
  RefrescaDataBase(DMGAS.DBGAS2);
  RefrescaTabla;
end;

procedure TFLIQTURC.ReclasificarValesdeCrdito1Click(Sender: TObject);
begin
  with DMLIQ,DMGAS,DMGASQ do begin
    if ModoProc=1 then
      exit;
    if QL_TurcEstatus.AsString<>'C' then
      raise Exception.Create('Turno no estï¿½ cerrado');
    try
      VarLiqModoReclasificar:=True;
      Application.CreateForm(TFLIQPVAL,FLIQPVAL);
      try
        T_Turc.Active:=true;
        if LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcEstacion.AsInteger,QL_TurcCaja.AsInteger,
                                                                        QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then begin
          VarLiqTotalVales:=T_TurcTotalVales.AsFloat;
          FLIQPVAL.PreparaForma;
          FLIQPVAL.ShowModal;
        end;
      finally
        RefrescaTabla;
        if not VsAccesoRemoto then
          RefrescaQuery(QT_Turca);
        FLIQPVAL.Free;
      end;
    finally
      VarLiqModoReclasificar:=false;
    end;
  end;
end;

procedure TFLIQTURC.CapturadeLiquidaciones1Click(Sender: TObject);
begin
  if ModoProc=1 then Exit;

  if QL_TurcESTATUS.AsString='A' then begin
    RefrescaQuery(DMGASQ.QT_Turca);
    if not(LocalizaQuery(DMGASQ.QT_TurcA,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcEstacion.AsInteger,QL_TurcCaja.AsInteger,QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger]))) then Exit;

    Application.CreateForm(TFLIQLIQG,FLIQLIQG);
    try
      FLIQLIQG.pFecha:=QL_TurcFecha.AsDateTime;
      FLIQLIQG.pTurno:=QL_TurcTurno.AsInteger;
      FLIQLIQG.PreparaForma;
      FLIQLIQG.ShowModal;
    finally
      RefrescaDataBase(DMGAS.DBGAS1);
      RefrescaDataBase(DMGAS.DBGAS2);
      RefrescaTabla;
      FLIQLIQG.Free;
    end;
  end
  else if QL_TurcESTATUS.AsString='C' then begin
    try
      DMGAS.swTurnoLectura:=True;
      Application.CreateForm(TFLIQLIQGR,FLIQLIQGR);
      FLIQLIQGR.pFecha:=QL_TurcFecha.AsDateTime;
      FLIQLIQGR.pTurno:=QL_TurcTurno.AsInteger;
      FLIQLIQGR.PreparaForma;
      FLIQLIQGR.ShowModal;
    finally
      RefrescaDataBase(DMGAS.DBGAS1);
      RefrescaDataBase(DMGAS.DBGAS2);
      RefrescaTabla;
      FLIQLIQGR.Free;
      DMGAS.swTurnoLectura:=False;
    end;
  end;
end;

procedure TFLIQTURC.ResumendelTurno1Click(Sender: TObject);
begin
  if (ModoProc=1) then Exit; 

  if not(DMGAS.ValidaModulo(idDesc)) and not(DMGAS.VarGasSistemaGulfActivo = 'Si') and not(DM_PUNTOS.LicenciaEsValidaPuntos)  then begin
    try
      Application.CreateForm(TFLIQREP14,FLIQREP14);
      FLIQREP14.pEstacion:=QL_TurcEstacion.AsInteger;
      FLIQREP14.pAlmacen:=1;
  
      if LocalizaTabla(DMGAS.T_Ests,'Clave',QL_TurcEstacion.AsInteger) then
        FLIQREP14.pAlmacen:=DMGAS.T_EstsAlmacen.AsInteger;
  
      FLIQREP14.pFecha:=QL_TurcFecha.AsDateTime;
      FLIQREP14.pTurno:=QL_TurcTurno.AsInteger;
      FLIQREP14.PreparaReporte(ModoProc);
  
      if ((Sender=dxTBImprimir)or(Sender=MiImprimir))
      then FLIQREP14.QuickRep1.Print
      else FLIQREP14.QuickRep1.Preview;
    finally
      FLIQREP14.Free;
    end;
  end
  else begin
    try
      Application.CreateForm(TFLIQREP47,FLIQREP47);
      FLIQREP47.pEstacion:=QL_TurcEstacion.AsInteger;
      FLIQREP47.pAlmacen:=1;

      if LocalizaTabla(DMGAS.T_Ests,'Clave',QL_TurcEstacion.AsInteger) then
        FLIQREP47.pAlmacen:=DMGAS.T_EstsAlmacen.AsInteger;

      FLIQREP47.pFecha:=QL_TurcFecha.AsDateTime;
      FLIQREP47.pTurno:=QL_TurcTurno.AsInteger;
      FLIQREP47.PreparaReporte(ModoProc);

      if ((Sender=dxTBImprimir)or(Sender=MiImprimir))
      then FLIQREP47.QuickRep1.Print
      else FLIQREP47.QuickRep1.Preview;
    finally
      FLIQREP47.Free;
    end;
  end;
end;

procedure TFLIQTURC.ImprimirPolizaClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMCNT do begin
    if ModoProc=1 then
      exit;
    if QL_TurcContabilizado.AsString<>'Si' then begin
      MensajeInfo('No se encontrï¿½ pï¿½liza');
      Exit;
    end;
    try
      idDocu:=idPoli;
      T_Poli.Active:=true;
      T_Dpol.Active:=true;
      if LocalizaTabla(T_Poli,'Mes;TipoPoliza;NoPoliza',VarArrayOf([FechaToMes(QL_TurcFecha.asdatetime),QL_TurcTipoPoliza.asstring,QL_TurcNoPoliza.asinteger])) then
      begin
        if (sender=VistaPreliminar) then
          FCNTPOLIF.PreparaForma('V',T_PoliTipoPoliza.asstring,false)
        else
          FCNTPOLIF.PreparaForma('I',T_PoliTipoPoliza.asstring,true);
        FCNTPOLIF.ImprimeForma;
        FCNTPOLIF.LiberaForma;
      end;
    finally
      idDocu:=idLiqg;
    end;
  end;
end;

procedure TFLIQTURC.GenerarSalidadeAlmacn1Click(Sender: TObject);
var xtipo:string;
begin
  with DMGEN,DMGEN_VTAS,DMCUP,DMGAS do begin
    if ModoProc=1 then
      exit;
    T_Ests.Locate('Clave',EstacionActual,[]);
    T_EmprVtas.Active:=true;
    if QL_TurcEstatus.AsString<>'C' then
      raise Exception.Create('Turno debe estar cerrado');
    if QL_TurcSalida_Almacen.AsString<>'' then
      raise Exception.Create('Ya existe Salida de Almacï¿½n');
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No encuentro turno seleccionado.');
    if VarGasPolizaLiqDia='Si' then begin
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno>'+IntToStr(QL_TurcTurno.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger>0 then
        raise Exception.Create('La salida debe generarse en el ï¿½ltimo turno del dï¿½a');
    end;
    Application.CreateForm(TFLIQTURCSALI,FLIQTURCSALI);
    try
      SetTipoDocumento(idSali);
      IniciaDocAccion(idDocu,'',AccNuevo);
      if not LocalizaTabla(TT_Caja,'Estacion;Caja',VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger])) then
        raise Exception.Create('No encuentro caja '+IntToStr(QL_TurcCaja.asinteger));
      xtipo:=FiltraStrNum(VariableDeMemo(DMGAS.TT_CajaVarIni,'TipoDefSali'));
      FLIQTURCSALI.PreparaForma(xtipo,ModoProc);
      FLIQTURCSALI.showmodal;
    finally
      LimpiaDocAccion;
      FLIQTURCSALI.Free;
      RefrescaTabla;
      TT_Caja.close;
    end;
  end;
end;

procedure TFLIQTURC.EliminarSalidadeAlmacn1Click(Sender: TObject);
begin
  with DMINV,DMGEN_VTAS,DMGEN,DMGAS do begin
    if ModoProc=1 then
      exit;
    if QL_TurcSalida.AsString<>'Si' then
      raise Exception.Create('No existe Salida de Almacï¿½n');
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
    if QL_TurcFecha.AsDateTime<FechaCosteo then
      raise Exception.Create('Movimientos anteriores a la fecha de costeo: '+FechaPaq(FechaCosteo)+' no se pueden eliminar.');
    try
      QL_Turc.DisableControls;
      ChecaDerechoDocu(drEliminar,idSali,QL_TurcFecha.AsDateTime);
      if MensajeConf('Desea BORRAR esta Salida ?')=mrYes then begin
        if not LocalizaTabla(T_Sali,'Sucursal;TipoSal;Folio',
                         VarArrayOf([StrToInt(Copy(QL_TurcSalida_Almacen.AsString,1,2)),
                                     copy(QL_TurcSalida_Almacen.AsString,3,2),
                                     StrToInt(Copy(QL_TurcSalida_Almacen.AsString,5,8))])) then
          raise Exception.Create('No puedo localizar Salida a Borrar');
        try
          if T_SaliCosteado.AsString='Si' then begin
//            if T_SaliEstatus.AsString='A' then begin    NO SE DEBE ELIMINAR UNA SALIDA COSTEADA
//              IniciaUpdates(DBGEN2,T_Sali);
//              T_Sali.Edit;
//              T_SaliCosteado.AsString:='No';
//              T_Sali.Post;
//              AplicaUpdates(DBGEN2,T_Sali);
//              T_Sali.Refresh;
//            end;
            MensajeInfo('La salida no se puede eliminar, se encuentra costeada.');
            Exit;
          end;
          T_Sali.Refresh;
          IniciaUpdates(DBGEN2,T_Sali);
          T_Sali.Edit;
          T_SaliEstatus.AsString:='C';
          T_SaliTotal.AsFloat:=0;
          T_SaliIndice.AsInteger:=0;
          T_Sali.Post;
          AplicaUpdates(DBGEN2,T_Sali);
          T_Sali.Refresh;

          IniciaUpdates(DBGEN2,T_Sali);
          T_Sali.Delete;
          AplicaUpdates(DBGEN2,T_Sali);
          T_Sali.Refresh;
          RefrescaDataBase(DMGEN_VTAS.DBVentas1);
          RefrescaDataBase(DMGEN_VTAS.DBVentas2);

//
          T_Turc.Edit;
          T_TurcSalida_Almacen.AsString:='';
          T_Turc.Post;
          RefrescaDataBase(DMGAS.DBGAS1);
          RefrescaDataBase(DMGAS.DBGAS2);
        except
          CancelaUpdates(DBGEN2,T_Sali);
          raise;
        end;
      end;
    finally
      QL_Turc.EnableControls;
      RefrescaTabla;
    end
  end
end;

procedure TFLIQTURC.PreverSalidaClick(Sender: TObject);
begin
  with DMINV,DMGAS,DMGEN do begin
    if ModoProc=1 then
      exit;
    try
      QL_Turc.DisableControls;
      idDocu:=idSali;
      T_Sali.Active:=true;
      T_Movs.Active:=true;
      if not LocalizaTabla(T_Sali,'Sucursal;TipoSal;Folio',
                       VarArrayOf([StrToInt(Copy(QL_TurcSalida_Almacen.AsString,1,2)),
                                   copy(QL_TurcSalida_Almacen.AsString,3,2),
                                   StrToInt(Copy(QL_TurcSalida_Almacen.AsString,5,6))])) then
        raise Exception.Create('No puedo localizar Salida a Borrar');
      if Sender = PreverSalida then
        FINVSALIF.PreparaForma('V',IntToStr(0),false)
      else FINVSALIF.PreparaForma('I',IntToStr(0),true);
      FINVSALIF.ImprimeForma;
    finally
      QL_Turc.EnableControls;
      idDocu:=idLiqg;
    end;
  end;
end;

procedure TFLIQTURC.ResumendeValesdelTurno1Click(Sender: TObject);
begin
  if ModoProc=1 then
    exit;
  Application.CreateForm(TFLIQTURCVP,FLIQTURCVP);
  try
    FLIQTURCVP.ShowModal;
  finally
    FLIQTURCVP.Free;
  end;
end;

procedure TFLIQTURC.ExportarPlizas1Click(Sender: TObject);
begin
  if ModoProc=1 then
    exit;
  Application.CreateForm(TFGASEXPO,FGASEXPO);
  try
    FGASEXPO.ShowModal;
  finally
    FGASEXPO.Free;
  end;
end;

procedure TFLIQTURC.RegistrodeTransacciones1Click(Sender: TObject);
var bm:Tbookmark;
begin
  if ModoProc=1 then Exit;

  if QL_TurcESTATUS.AsString='A' then begin
    RefrescaQuery(DMGASQ.QT_Turca);
    if not(LocalizaQuery(DMGASQ.QT_TurcA,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcEstacion.AsInteger,QL_TurcCaja.AsInteger,QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger]))) then Exit;

    Application.CreateForm(TFLIQTRAN,FLIQTRAN);
    try
      bm:=QL_Turc.GetBookmark;

      FLIQTRAN.PreparaForma;
      FLIQTRAN.ShowModal;
      RefrescaQuery(DMGASQ.QT_Turca);
    finally
      FLIQTRAN.Free;
      RefrescaTabla;
      QL_Turc.GotoBookmark(bm);
      QL_Turc.FreeBookmark(bm);
    end;
  end
  else if QL_TurcESTATUS.AsString='C' then begin
    try
      DMGAS.swTurnoLectura:=True;
      Application.CreateForm(TFLIQTRANR,FLIQTRANR);
      bm:=QL_Turc.GetBookmark;

      FLIQTRANR.PreparaForma;
      FLIQTRANR.ShowModal;
      RefrescaQuery(DMGASQ.QT_Turca);
    finally
      FLIQTRANR.Free;
      RefrescaTabla;
      QL_Turc.GotoBookmark(bm);
      QL_Turc.FreeBookmark(bm);
      DMGAS.swTurnoLectura:=False;
    end;
  end;
end;

procedure TFLIQTURC.EliminarValesdelTurno1Click(Sender: TObject);
begin
  with DMGAS do begin
    if ModoProc=1 then
      exit;
    if CajeroActual<>QL_TurcCajero.AsInteger then begin
      MensajeErr('Usuario no es el Cajero del turno');
      ChecaDerechoEspecialAutor2(idCup,aeUsuarioCajeroSupervisor,True);
      if not FAutoriza.PassOk then
        exit;
    end;
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([EstacionActual,CajaActual,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No encuentro turno abierto.');
    if MensajeConf('Desea eliminar los vales del turno?')=mrYes then begin
      try
        DBGAS1.StartTransaction;
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.clear;
        Q_Auxi.SQL.Add('Delete from dgaspval');
        Q_Auxi.SQL.Add('where estacion='+inttostr(QL_TurcEstacion.asinteger));
        Q_Auxi.SQL.Add('  and caja='+inttostr(QL_TurcCaja.asinteger));
        Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(QL_TurcFecha.asdatetime)+'"');
        Q_Auxi.SQL.Add('  and turno='+inttostr(QL_TurcTurno.asinteger));
        Q_Auxi.ExecSQL;
        DBGAS1.Commit;
        RefrescaQuery(DMGASQ.QT_Turca);
        RefrescaTabla;
      except
        DBGAS1.Rollback;
      end;
    end;
  end;
end;

procedure TFLIQTURC.RecuperacindeCupones1Click(Sender: TObject);
begin
  with DMGEN, DMGAS,DMGASQ do begin
    if QL_TurcEstatus.AsString='A' then begin
      if idSist=idLiq then
        if LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
          if T_TurnEstatus.AsString='A' then
            raise Exception.Create('No se puede Accesar: Turno abierto en Punto de Venta');

      if ModoProc=1 then Exit;

      if SistemaActivo(idPvg) then begin
        Application.CreateForm(TFLIQRCUP,FLIQRCUP);
        try
          if LocalizaQuery(QT_TurcA,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcEstacion.AsInteger,QL_TurcCaja.AsInteger,
                                                                          QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then begin
            FLIQRCUP.pFecha:=QL_TurcFecha.AsDateTime;
            FLIQRCUP.pTurno:=QL_TurcTurno.AsInteger;
            FLIQRCUP.PreparaForma;
            FLIQRCUP.ShowModal;
          end;
        finally
          RefrescaDataBase(DMGAS.DBGAS1);
          RefrescaDataBase(DMGAS.DBGAS2);
          RefrescaTabla;

          if not VsAccesoRemoto then RefrescaQuery(QT_Turca);

          FLIQRCUP.Free;
        end;
      end
      else begin
        Application.CreateForm(TFLIQRCUP2,FLIQRCUP2);
        try
          if LocalizaQuery(QT_TurcA,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcEstacion.AsInteger,QL_TurcCaja.AsInteger,
                                                                          QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then begin
            FLIQRCUP2.PreparaForma;
            FLIQRCUP2.ShowModal;
          end;
        finally
          RefrescaDataBase(DMGAS.DBGAS1);
          RefrescaDataBase(DMGAS.DBGAS2);
          RefrescaTabla;

          if not VsAccesoRemoto then RefrescaQuery(QT_Turca);

          FLIQRCUP2.Free;
        end;
      end;
    end
    else if QL_TurcEstatus.AsString='C' then begin
      if idSist=idLiq then
        if LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
          if T_TurnEstatus.AsString='A' then
            raise Exception.Create('No se puede Accesar: Turno abierto en Punto de Venta');

      if ModoProc=1 then Exit;

      if SistemaActivo(idPvg) then begin
        try
          Q_Auxi.close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select count(*) as Entero1 from DGASTURC');
          Q_Auxi.SQL.Add('Where estatus='+QuotedStr('C'));
          Q_Auxi.SQL.Add('  and estacion='+IntToStr(QL_TurcESTACION.AsInteger));
          Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCAJA.AsInteger));
          Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QL_TurcFECHA.AsDateTime)));
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTURNO.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;

          if Q_AuxiEntero1.AsInteger>0 then begin
            try
              DMGAS.swTurnoLectura:=True;
              Application.CreateForm(TFLIQRCUPR,FLIQRCUPR);

              FLIQRCUPR.PreparaForma;
              FLIQRCUPR.ShowModal;
            finally
              RefrescaDataBase(DMGAS.DBGAS1);
              RefrescaDataBase(DMGAS.DBGAS2);
              RefrescaTabla;
              if not VsAccesoRemoto then RefrescaQuery(QT_Turca);
              FLIQRCUPR.Free;
              DMGAS.swTurnoLectura:=False;
            end;
          end;
        finally
          Q_Auxi.Close;
        end;
      end
      else begin
        try
          Q_Auxi.close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select count(*) as Entero1 from DGASTURC');
          Q_Auxi.SQL.Add('Where estatus='+QuotedStr('C'));
          Q_Auxi.SQL.Add('  and estacion='+IntToStr(QL_TurcESTACION.AsInteger));
          Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCAJA.AsInteger));
          Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QL_TurcFECHA.AsDateTime)));
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTURNO.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if Q_AuxiEntero1.AsInteger>0 then begin
            try
              DMGAS.swTurnoLectura:=True;
              Application.CreateForm(TFLIQRCUP2R,FLIQRCUP2R);
              FLIQRCUP2R.PreparaForma;
              FLIQRCUP2R.ShowModal;
            finally
              RefrescaDataBase(DMGAS.DBGAS1);
              RefrescaDataBase(DMGAS.DBGAS2);
              RefrescaTabla;

              if not VsAccesoRemoto then RefrescaQuery(QT_Turca);
              FLIQRCUP2R.Free;
              DMGAS.swTurnoLectura:=False;
            end;
          end;
        finally
          Q_Auxi.Close;
        end;
      end;
    end
  end;
end;

procedure TFLIQTURC.EliminarCuponesRecuperados1Click(Sender: TObject);
begin
  with DMGAS do begin
    if ModoProc=1 then
      exit;
    if CajeroActual<>QL_TurcCajero.AsInteger then begin
      MensajeErr('Usuario no es el Cajero del turno');
      ChecaDerechoEspecialAutor2(idCup,aeUsuarioCajeroSupervisor,True);
      if not FAutoriza.PassOk then
        exit;
    end;
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([EstacionActual,CajaActual,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No encuentro turno abierto.');
    if MensajeConf('Desea eliminar los cupones del turno?')=mrYes then begin
      try
        DBGAS1.StartTransaction;
        Q_Auxi.Active:=false;
        Q_Auxi.SQL.clear;
        Q_Auxi.SQL.Add('Delete from dgasrcup');
        Q_Auxi.SQL.Add('where estacion='+inttostr(QL_TurcEstacion.asinteger));
        Q_Auxi.SQL.Add('  and caja='+inttostr(QL_TurcCaja.asinteger));
        Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(QL_TurcFecha.asdatetime)+'"');
        Q_Auxi.SQL.Add('  and turno='+inttostr(QL_TurcTurno.asinteger));
        Q_Auxi.ExecSQL;
        DBGAS1.Commit;
        DMCUP.TotalizaRcup;
        RefrescaDataBase(DMGAS.DBGAS1);
        RefrescaDataBase(DMGAS.DBGAS2);
        RefrescaTabla;
      except
        DBGAS1.Rollback;
      end;
    end;
  end;
end;

procedure TFLIQTURC.ModificarPliza1Click(Sender: TObject);
begin
  with DMGEN,DMCNT do begin
    T_Poli.Active:=true;
    T_Dpol.Active:=true;
    if not LocalizaTabla(T_Poli,'Mes;TipoPoliza;NoPoliza',VarArrayOf([FechaToMes(QL_TurcFecha.AsDateTime),QL_TurcTipoPoliza.Asstring,QL_TurcNoPoliza.Asinteger])) then
      raise Exception.Create('No puedo localizar Pï¿½liza');
    Application.CreateForm(TFCNTPOLIN,FCNTPOLIN);
    try
      SetTipoDocumento(idPoli);
      IniciaDocAccion(idDocu,T_PoliClaveStr.AsString,AccModificar);
      FCNTPOLIN.PreparaForma(T_PoliMes.AsString,'',false);
      FCNTPOLIN.Showmodal;
      RefrescaTabla;
    finally
      if T_PoliAplicado.AsString='No' then
        AplicaPoliza(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger,true);
      LimpiaDocAccion;
      FCNTPOLIN.free;
      SetTipoDocumento(idLiqg);
    end;
  end;

end;

procedure TFLIQTURC.RecalcularTotales1Click(Sender: TObject);
begin
  with DMGAS do begin
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
        VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No se localizï¿½ el Turno');
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
    Q_Auxi.SQL.Add('where estacion='+inttostr(QL_TurcEstacion.asinteger));
    Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(QL_TurcFecha.asdatetime)+'"');
    Q_Auxi.SQL.Add('  and turnoliq='+inttostr(QL_TurcTurno.asinteger));
    Q_Auxi.SQL.Add('  and Despachador<>0 ');    
    Q_Auxi.SQL.Add('  and estatus="A"');
    Q_Auxi.SQL.Add('  and tipoventa<>'+QuotedStr('CO'));
    if CteEzzyGas>0 then
      Q_Auxi.SQL.Add('and Cliente<>'+IntToStr(CteEzzyGas));
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    T_Turc.edit;
    T_TurcTotalTran.AsFloat:=Q_AuxiReal1.AsFloat;
    T_Turc.post;
    RefrescaDataBase(DMGAS.DBGAS1);
    RefrescaDataBase(DMGAS.DBGAS2);
    RefrescaTabla;
  end;
end;

procedure TFLIQTURC.ReclasificacindeTransacciones1Click(Sender: TObject);
var bm:Tbookmark;
begin
  if ModoProc=1 then
    exit;
  Application.CreateForm(TFLIQTRAN2,FLIQTRAN2);
  try
    bm:=QL_Turc.GetBookmark;
    FLIQTRAN2.PreparaForma;
    FLIQTRAN2.ShowModal;
    RefrescaQuery(DMGASQ.QT_Turca);
  finally
    FLIQTRAN2.Free;
    RefrescaTabla;
    QL_Turc.GotoBookmark(bm);
    QL_Turc.FreeBookmark(bm);
  end;
end;

procedure TFLIQTURC.RecuperacinEspecial1Click(Sender: TObject);
begin
  with DMGEN, DMGAS,DMGASQ do begin
    if QL_TurcEstatus.AsString<>'A' then
      raise Exception.Create('Este turno no estï¿½ abierto.');
    if idSist=idLiq then
      if LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
        if T_TurnEstatus.AsString='A' then
          raise Exception.Create('No se puede Accesar: Turno abierto en Punto de Venta');
    if ModoProc=1 then
      exit;
    Application.CreateForm(TFLIQRCUP2,FLIQRCUP2);
    try
     if LocalizaQuery(QT_TurcA,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcEstacion.AsInteger,QL_TurcCaja.AsInteger,
                                                                      QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then begin
        FLIQRCUP2.PreparaForma;
        FLIQRCUP2.ShowModal;
      end;
    finally
      RefrescaDataBase(DMGAS.DBGAS1);
      RefrescaDataBase(DMGAS.DBGAS2);
      RefrescaTabla;
      if not VsAccesoRemoto then
        RefrescaQuery(QT_Turca);
      FLIQRCUP2.Free;
    end;
  end;
end;

procedure TFLIQTURC.VerificarVales;
begin
  with DMGEN,DMGAS,DMLIQ do begin
    QL_Pval.Close;
    QL_Pval.ParamByName('pestacion').AsInteger:=QL_TurcEstacion.AsInteger;
    QL_Pval.ParamByName('pcaja').AsInteger:=QL_TurcCaja.AsInteger;
    QL_Pval.ParamByName('pfecha').AsDateTime:=QL_TurcFecha.AsDateTime;
    QL_Pval.ParamByName('pturno').AsInteger:=QL_TurcTurno.AsInteger;
    QL_Pval.Prepare;
    QL_Pval.Open;
    while not QL_Pval.Eof do begin
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASVALE');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
      Q_Auxi.SQL.Add('  and Cliente='+IntToStr(QL_PvalCliente.AsInteger));
      Q_Auxi.SQL.Add('  and SubCodigo='+IntToStr(QL_PvalSubCodigo.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      if abs(QL_PvalImporte.AsFloat-Q_AuxiReal1.AsFloat)>0.001 then
        raise Exception.Create('Error en la Captura de Vales Cliente: '+IntToStr(QL_PvalCliente.AsInteger));
//
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDVAL');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
      Q_Auxi.SQL.Add('  and Cliente='+IntToStr(QL_PvalCliente.AsInteger));
      Q_Auxi.SQL.Add('  and SubCodigo='+IntToStr(QL_PvalSubCodigo.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      if abs(QL_PvalImporte.AsFloat-Q_AuxiReal1.AsFloat)>0.001 then
        raise Exception.Create('Error en la Captura de Vales del Cliente: '+IntToStr(QL_PvalCliente.AsInteger)+' Ref. '+IntToStr(QL_PvalSubcodigo.AsInteger));
      QL_Pval.Next;
    end;
  end;
end;



procedure TFLIQTURC.VerificarValesdelTurno1Click(Sender: TObject);
var bm:tbookmark;
begin
  try
    bm:=QL_Turc.GetBookmark;
    QL_Turc.DisableControls;
    QL_Turc.First;
    while not QL_Turc.Eof do begin
      Label2.Caption:='Vericando Vales... Fecha '+FechaPaq(QL_TurcFecha.AsDateTime)+' Turno: '+IntTOStr(QL_TurcTurno.AsInteger);
      Label2.Refresh;
      VerificarVales;
      QL_Turc.Next;
    end;
  finally
    QL_Turc.GotoBookmark(bm);
    QL_Turc.FreeBookmark(bm);
    QL_Turc.EnableControls;
    Label2.Caption:='';
    Label2.Refresh;
    MensajeInfo('Proceso terminado...');
  end;
end;

procedure TFLIQTURC.NuevaConciliacin1Click(Sender: TObject);
begin
  QL_Turc.First;
end;

procedure TFLIQTURC.Anterior2Click(Sender: TObject);
begin
  QL_Turc.Prior;
end;

procedure TFLIQTURC.Siguiente2Click(Sender: TObject);
begin
  QL_Turc.Next;
end;

procedure TFLIQTURC.Fin2Click(Sender: TObject);
begin
  QL_Turc.Last;
end;

procedure TFLIQTURC.AbrirTurno1Click(Sender: TObject);
begin
  with DMGAS do begin
    if ModoProc=1 then Exit;

    RefrescaQuery(DMGASQ.QT_Turca);
    if not DMGASQ.QT_Turca.IsEmpty then raise Exception.Create('Existen turnos abiertos, no es posible abrir otro turno.');

    if VarLiqTurnosAuto='Si' then begin
      ChecaDerechoEspecialAutor2(idLiq,aeReabrirTurnoLiq,True);

      if not FAutoriza.PassOk then exit;
    end;

    MesGasActual:=ElementoActualMesBox(MesBox1);
    Application.CreateForm(TFLIQTURCN,FLIQTURCN);
    try
      FLIQTURCN.PreparaForma;
      FLIQTURCN.ShowModal;
      RefrescaTabla;
    finally
      FLIQTURCN.Free;
    end;
  end;
end;

procedure TFLIQTURC.CerrarTurno1Click(Sender: TObject);
var LClaseCred,
    LClaseCupo,
    LClaseTarj:TStringList;
    i:word;
    bm:tBookMark;
    xturno : Integer;
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if ModoProc=1 then
      exit;
    if QL_TurcEstatus.AsString<>'A' then
      raise Exception.Create('Este turno no estï¿½ abierto.');
    if CajeroActual<>QL_TurcCajero.AsInteger then begin
      MensajeErr('Usuario no es el Cajero del turno');
      ChecaDerechoEspecialAutor2(idCup,aeUsuarioCajeroSupervisor,True);
      if not FAutoriza.PassOk then
        exit;
    end;
    if VarLiqTurnosAuto='Si' then begin
      ChecaDerechoEspecialAutor2(idLiq,aeCerrarTurnoLiq,True);
      if not FAutoriza.PassOk then
        exit;
    end;
    ApagaSwitchs('SwCalcFields');
    LClaseCred:=TStringList.Create;
    LClaseCupo:=TStringList.Create;
    LClaseTarj:=TStringList.Create;
    try
      bm:=QL_Turc.GetBookmark;
      if not LocalizaTabla(T_Turc,'Estacion;Caja;Estatus',VarArrayOf([EstacionActual,CajaActual,'A'])) then
        raise Exception.Create('No encuentro turno abierto.');
      if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',VarArrayOf([EstacionActual,CajaActual,QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then
        raise Exception.Create('No encuentro el turno.');
// Validar que existan las liquidaciones para todas las islas////
      if DMGAS.VarGasValidarIslas='Si' then begin
        try
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Add('Select count(*) as Entero1 from DGASLIQG');
          Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));

          QL_Isla.Close;
          QL_Isla.ParamByName('pestacion').AsInteger:=EstacionActual;
          QL_Isla.Prepare;
          QL_Isla.Open;
          QL_Isla.First;
          Q_Auxi.SQL.Add('  and (Isla='+IntToStr(QL_IslaISLA.AsInteger));
          QL_Isla.Next;
          while not QL_Isla.Eof do begin
            Q_Auxi.SQL.Add('       or Isla='+IntToStr(QL_IslaISLA.AsInteger));
            QL_Isla.Next;
          end;
          Q_Auxi.SQL.Add('       )');

  //        Q_Auxi.SQL.Add('  and Caja='+IntToStr(CajaActual));
          Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QL_TurcFecha.AsDateTime)));
          Q_Auxi.SQL.Add('  and Turno='+InttoStr(QL_TurcTurno.AsInteger));
          Q_Auxi.SQL.Add('  and LiquidaGlobal='+QuotedStr('No'));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
        finally
          if Q_AuxiEntero1.AsInteger<QL_Isla.RecordCount then begin
            Q_Auxi.Close;
            Q_Auxi.SQL.Clear;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Add('Select count(*) as Entero1');
            Q_Auxi.SQL.Add(' from DGASLIQG');
            Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
  //          Q_Auxi.SQL.Add('  and Caja='+IntToStr(CajaActual));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
            Q_Auxi.SQL.Add('  and Turno='+InttoStr(QL_TurcTurno.AsInteger));
            Q_Auxi.SQL.Add('  and LiquidaGlobal='+QuotedStr('Si'));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if Q_AuxiEntero1.AsInteger<=0 then begin
              raise Exception.Create('Faltan islas por liquidar.'+#13+'Favor de verificarlo.');
            end;
          end;
          Q_Auxi.Close;
        end;
      end;        
/////////////////////////////////////////////////////////////////
      if MensajeConf('¿Desea cerrar el turno?')=mrYes then begin
//        VerificarVales;
        if VarGasValidarValesyCupones='Si' then begin
          T_Tpag.Active:=true;
          T_Tpag.First;
          while not T_Tpag.Eof do begin
            if (T_TpagClase.AsString=idClaseCredito) or (T_TpagClase.AsString=idClaseCreditoAceites) then
              LClaseCred.Add(T_TpagClave.AsString)
            else
              if (T_TpagClase.AsString=idClaseCupones) or (T_TpagClase.AsString=idClaseCuponesAceites) then
                LClaseCupo.Add(T_TpagClave.AsString)
              else
                if (T_TpagClase.AsString=idClaseTarjFloIn) or (T_TpagClase.AsString=idClaseTarjeta)or(T_TpagClase.AsString=idClaseTarjIntCre)or(T_TpagClase.AsString=idClaseTarjIntPre)or(T_TpagClase.AsString=idClaseTarjIntCreAceites)or(T_TpagClase.AsString=idClaseTarjIntPreAceites) then
                  LClaseTarj.Add(T_TpagClave.AsString);
            T_Tpag.Next;
          end;
          // valida cupones no liquidados de turnos anteriores
          if SistemaActivo(idPvg) then begin
            try
              Q_Auxi.Active:=false;
              Q_AuxiEntero1.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('select count(*) as Entero1 from DGASRCUP');
              Q_Auxi.SQL.Add('where liquidado="No"');
              Q_Auxi.SQL.Add('  and estacion='+IntToStr(QL_TurcEstacion.asinteger));
              Q_Auxi.SQL.Add('  and fecha<"'+FechaToStrSQL(QL_TurcFecha.asdatetime)+'"');
              Q_Auxi.Active:=true;
              if Q_AuxiEntero1.AsInteger>0 then
                raise Exception.Create('No se puede cerrar: Hay cupones sin liquidar de dias anteriores');
            finally
              Q_Auxi.Active:=false;
            end;
          end;
          if LClaseCred.Count>0 then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDLIQP');
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.asinteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
            Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
            Q_Auxi.SQL.Add('  and (Clave_Pago="'+LClaseCred[0]+'" ');
            for i:=1 to LClaseCred.Count-1 do begin
              Q_Auxi.SQL.Add(' or Clave_Pago="'+LClaseCred[i]+'"');
            end;
            Q_Auxi.SQL.Add(')');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if abs(Q_AuxiReal1.AsFloat-T_TurcTotalVales.AsFloat)>0.01 then
              raise Exception.Create('Total de Vales de Credito diferente al Total Liquidado');
          end;
          if LClaseCupo.Count>0 then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDLIQP');
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.asinteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
            Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
            Q_Auxi.SQL.Add('  and (Clave_Pago="'+LClaseCupo[0]+'"');
            for i:=1 to LClaseCupo.Count-1 do begin
              Q_Auxi.SQL.Add(' or Clave_Pago="'+LClaseCupo[i]+'"');
            end;
            Q_Auxi.SQL.Add(')');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if abs(Q_AuxiReal1.AsFloat-T_TurcTotalCupRecup.AsFloat)>0.1 then
              raise Exception.Create('Total de Cupones diferente al Total Liquidado');
          end;
//Valida que el total de transacciones en tarjetas sea igual a los pagos tipo tarjetas
          if LClaseTarj.Count>0 then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDLIQP');
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.asinteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
            Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
            Q_Auxi.SQL.Add('  and (Clave_Pago="'+LClaseTarj[0]+'" ');
            for i:=1 to LClaseTarj.Count-1 do begin
              Q_Auxi.SQL.Add(' or Clave_Pago="'+LClaseTarj[i]+'"');
            end;
            Q_Auxi.SQL.Add(')');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if abs(Q_AuxiReal1.AsFloat-T_TurcTotalTran.AsFloat)>0.01 then
              raise Exception.Create('Total de Transacciones de Tarjetas diferente al Total Liquidado');
          end;
        end;
        //checa si hay que hacer ajuste automatico o manual de Liquidaciones
        if DMGAS.VarGasAjusteManual<>'Si'then begin
          if (SwAjustadorAutomaticoLiq)and(T_TurcTURNO.AsInteger=VarGasMaximoTurnosLiq) then begin
            if VarComp('AliasAuxiliar')<>'' then begin
              with DMAJUS do begin
                try
                  DBAJUS1.close;
                  DBAJUS1.AliasName:=VarComp('AliasAuxiliar');
                  DBAJUS1.open;

                  //checa ajuste
                  if VarComp('TipoCambioA')='Turno' then begin
                    xturno := 1;
                    repeat
                      if not LocalizaTabla(TL_Ajud,'ESTACION;FECHA;TURNO',VarArrayOf([T_TurcESTACION.AsInteger,T_TurcFECHA.AsDateTime,xturno])) then begin
                        if TL_Ajud.State<>dsBrowse then
                          exit;
                        try
                          TL_Ajud.Append;
                          TL_AjudEstacion.asinteger:=T_TurcESTACION.AsInteger;
                          TL_AjudFecha.AsDateTime:=T_TurcFECHA.AsDateTime;
                          TL_AjudTurno.AsInteger:=xturno;
                          TL_Ajud.Post;
                        except
                        end;
                      end;
                      xturno := xturno + 1;
                    until xturno>VarGasMaximoTurnosLiq;
                  
                    xturno := 1;
                    TL_Ajud.Refresh;                  
                    repeat
                      if LocalizaTabla(TL_Ajud,'ESTACION;FECHA;TURNO',VarArrayOf([T_TurcESTACION.AsInteger,T_TurcFECHA.AsDateTime,xturno])) then begin
                        if TL_AjudAPLICADO.AsString<>'Si' then begin
                          TL_Ajud.Edit;
                          TL_AjudAplicado.AsString:='Si';
                          TL_Ajud.Post;
                        end;
                      end;
                      xturno := xturno + 1;
                    until xturno>VarGasMaximoTurnosLiq;

                    Q_AuxiAjus.Close;
                    Q_AuxiAjus.SQL.Clear;
                    Q_AuxiAjusReal1.FieldKind:=fkInternalCalc;
                    Q_AuxiAjusEntero1.FieldKind:=fkInternalCalc;
                    Q_AuxiAjusEntero2.FieldKind:=fkInternalCalc;
                    Q_AuxiAjus.SQL.Add('SELECT TURNOADMIN As Entero1, COMBUSTIBLE As Entero2, COALESCE(SUM(VOLUMEN1 - VOLUMEN2),0) As Real1');
                    Q_AuxiAjus.SQL.Add(' FROM CLAVES');
                    Q_AuxiAjus.SQL.Add(' WHERE FECHAADMIN=:PFECHAADMIN');
                    Q_AuxiAjus.SQL.Add(' GROUP BY TURNOADMIN,COMBUSTIBLE');
                    Q_AuxiAjus.ParamByName('PFECHAADMIN').AsDateTime := T_TurcFECHA.AsDateTime;
                    Q_AuxiAjus.Prepare;
                    Q_AuxiAjus.Open;
                    if not TL_Ajud2.Active then
                      TL_Ajud2.Open;
                    TL_Ajud2.Refresh;
                    TL_Ajud2.First;
                    while not Q_AuxiAjus.Eof do begin
                      Q_Auxi.Close;
                      Q_Auxi.SQL.Clear;
                      Q_Auxi.SQL.Add('update DGASAJUD2');
                      Q_Auxi.SQL.Add('set volumen = ((select venta');
                      Q_Auxi.SQL.Add('                from dgasajud2');
                      Q_Auxi.SQL.Add('                where estacion = '+IntToStr(T_TurcESTACION.AsInteger));
                      Q_Auxi.SQL.Add('                and fecha = '+QuotedStr(FechaToStrSQL(T_TurcFECHA.AsDateTime)));
                      Q_Auxi.SQL.Add('                and combustible = '+IntToStr(Q_AuxiAjusEntero2.AsInteger));
                      Q_Auxi.SQL.Add('                and turno = '+IntToStr(Q_AuxiAjusEntero1.AsInteger)+')-'+FloatToStr(Q_AuxiAjusReal1.AsFloat)+')');
                      Q_Auxi.SQL.Add('  where estacion = '+IntToStr(T_TurcESTACION.AsInteger));
                      Q_Auxi.SQL.Add('  and fecha = '+QuotedStr(FechaToStrSQL(T_TurcFECHA.AsDateTime)));
                      Q_Auxi.SQL.Add('  and combustible = '+IntToStr(Q_AuxiAjusEntero2.AsInteger));
                      Q_Auxi.SQL.Add('  and turno = '+IntToStr(Q_AuxiAjusEntero1.AsInteger));
                      Q_Auxi.ExecSQL;

                      try
                        ConsultaLiquidacionAPIAlCerrarTurno(T_TurcFECHA.AsDateTime, T_TurcFECHA.AsDateTime,T_TurcFecha.AsDateTime, Q_AuxiAjusEntero1.AsInteger, T_TurcEstacion.AsInteger);
                      except
                        on E: Exception do
                          raise Exception.Create('Error al consultar API: '+e.Message);
                      end;

                      Q_AuxiAjus.Next;
                    end;
                    Q_AuxiAjus.Close;
                    Q_Auxi.Close;
                  end else
                  begin
                    if not LocalizaTabla(TL_Ajud,'ESTACION;FECHA',VarArrayOf([T_TurcESTACION.AsInteger,T_TurcFECHA.AsDateTime])) then begin
                      if TL_Ajud.State<>dsBrowse then
                        exit;
                      try
                        TL_Ajud.Append;
                        TL_AjudEstacion.asinteger:=T_TurcESTACION.AsInteger;
                        TL_AjudFecha.AsDateTime:=T_TurcFECHA.AsDateTime;
                        TL_AjudTurno.AsInteger:=VarGasAuxiliarLiq;
                        TL_Ajud.Post;
                      except
                      end;
                    end;
                    TL_Ajud.Refresh;
                    if TL_AjudAPLICADO.AsString<>'Si' then begin
                      TL_Ajud.Edit;
                      TL_AjudAplicado.AsString:='Si';
                      TL_Ajud.Post;
                    end;
                    if not TL_Ajud2.Active then
                      TL_Ajud2.Open;
                    TL_Ajud2.Refresh;
                    TL_Ajud2.First;
                    while not TL_Ajud2.Eof do begin
                      try
                        Q_AuxiAjus.Close;
                        Q_AuxiAjus.SQL.Clear;
                        Q_AuxiAjusReal1.FieldKind:=fkInternalCalc;
                        Q_AuxiAjus.SQL.Add('select coalesce(ajuste,0) as Real1 from dame_ajuste_admin_global('+QuotedStr(FechaToStrSQL(T_TurcFECHA.AsDateTime))+','+TL_Ajud2COMBUSTIBLE.AsString+')');
                        Q_AuxiAjus.Prepare;
                        Q_AuxiAjus.Open;
                        if not Q_AuxiAjus.IsEmpty then begin
                          TL_Ajud2.Edit;
                          TL_Ajud2VOLUMEN.AsFloat:=TL_Ajud2VENTA.AsFloat-Q_AuxiAjusReal1.AsFloat;
                          TL_Ajud2.Post;   
                          try
                            ConsultaLiquidacionAPIAlCerrarTurno(T_TurcFECHA.AsDateTime, T_TurcFECHA.AsDateTime,T_TurcFecha.AsDateTime, 0, T_TurcEstacion.AsInteger);
                          except
                            on E: Exception do
                              raise Exception.Create('Error al consultar API: '+e.Message);
                          end;
                        end;
                      finally
                        Q_AuxiAjus.Close;
                      end;
                      TL_Ajud2.Next;
                    end;
                  end;
                  DBAJUS1.Close;

                except
                  on e:EDatabaseError do begin
                    MensajeWarn('Alias mal configurado.');
                  end;
                  on e:Exception do begin
                    MensajeWarn('Error al intentar proceso automï¿½tico.'+#10#13+e.Message);
                  end;
                end;
              end;
            end;
          end;
        end;

        try
          T_Turc.Edit;
          T_TurcEstatus.AsString:='C';
          T_TurcHoraFin.AsDateTime:=Date+Time;
          T_Turc.Post;

          if VarLiqTurnoRestringido then VarLiqTurnoRestringido:=false;
          RefrescaQuery(DMGASQ.QT_Turca);
        except
          if T_Turc.State=dsInsert then
            T_Turc.Cancel;
          raise;
        end;
      end;
    finally
      RecuperaSwitchs;
      LimpiaValesEnCeroEnPval;
      RefrescaTabla;
      QL_Turc.GotoBookmark(bm);
      QL_Turc.FreeBookmark(bm);
      LClaseCred.Free;
      LClaseCupo.Free;
      LClaseTarj.Free;
    end;
  end;
end;

procedure TFLIQTURC.QL_TurcFechaPaqGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if QL_TurcPoliza.AsString<>'' then
    if QL_TurcSALIDA_ALMACEN.AsString<>'' then
      Text:=QL_TurcFECHA.AsString+' Poliza: '+QL_TurcPoliza.AsString+' Salida de Almacen: '+QL_TurcSALIDA_ALMACEN.AsString
    else
      Text:=QL_TurcFECHA.AsString+' Poliza: '+QL_TurcPoliza.AsString
  else begin
    if QL_TurcSALIDA_ALMACEN.AsString<>'' then
      Text:=QL_TurcFECHA.AsString+' Salida de Almacen: '+QL_TurcSALIDA_ALMACEN.AsString
    else
      Text:=QL_TurcFECHA.AsString;
  end;
end;

procedure TFLIQTURC.LimpiaValesEnCeroEnPval;
begin
  with DMGAS do begin
    try
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('UPDATE DGASPVAL SET FACTURADO="No"');
      Q_Auxi.SQL.Add('WHERE CANTIDAD=0 AND TOTAL=0 AND FACTURADO="Si"');
      Q_Auxi.ExecSQL;

      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('DELETE FROM DGASPVAL');
      Q_Auxi.SQL.Add('WHERE CANTIDAD=0 AND TOTAL=0 AND FACTURADO="No"');
      Q_Auxi.ExecSQL;

    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQTURC.QL_DespFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
   Accept:=QL_DespEstacion.AsInteger=QL_TurcESTACION.AsInteger;
end;

procedure TFLIQTURC.ModificarJefedeTurno1Click(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    ChecaDerechoEspecialAutor2(idLiq,aeModificarjefeTurno,true);
    if not FAutoriza.PassOk then begin
      MensajeErr('Usuario no tiene derechos para Modificar el Jefe de Turno.');
      exit;
    end;
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',VarArrayOf([EstacionActual,CajaActual,QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then
      raise Exception.Create('No encuentro el turno.');
    T_Turc.Edit;
    try
      Application.CreateForm(TFLIQTURCJT,FLIQTURCJT);
      if FLIQTURCJT.ShowModal=mrOk then
        T_Turc.Post
      else
        T_Turc.Cancel;
    finally
      FLIQTURCJT.Free;
      RefrescaTabla;
    end;
  end;
end;

procedure TFLIQTURC.QL_TurcNOMBREJEFETURNOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if LimpiaStr(QL_TurcNOMBREJEFETURNO.AsString)<>'' then
    text:='Jefe de Turno: '+IntToClaveNum(QL_TurcJEFE_TURNO.AsInteger,3)+' '+QL_TurcNOMBREJEFETURNO.AsString
  else
    text:='Turno no tiene Jefe asignado.';

end;

function TFLIQTURC.ValidaEstatusLiq: Boolean;
var
  xResult:Boolean;
begin
  with DMGAS do begin
    try
      xResult:=True;
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('Select count(*) as Entero1 from DGASLIQG');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));

      Q_Auxi.SQL.Add('  and (Isla='+IntToStr(primeraIsla));
      Q_Auxi.SQL.Add(orIsla);
      Q_Auxi.SQL.Add('       )');
      Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QL_TurcFecha.AsDateTime)));
      Q_Auxi.SQL.Add('  and Turno='+InttoStr(QL_TurcTurno.AsInteger));
      Q_Auxi.SQL.Add('  and LiquidaGlobal='+QuotedStr('No'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
    finally
      if Q_AuxiEntero1.AsInteger<QL_Isla.RecordCount then begin
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Add('Select count(*) as Entero1');
        Q_Auxi.SQL.Add(' from DGASLIQG');
        Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
        Q_Auxi.SQL.Add('  and (Isla='+IntToStr(primeraIsla));    //Se agregï¿½ la condiciï¿½n de islas para que la consulta utilice el ï¿½ndice y asi sea mas rï¿½pida debido al. Los Silos tenï¿½a problema de lentitud al cargar los turnos 
        Q_Auxi.SQL.Add(orIsla);
        Q_Auxi.SQL.Add('       )');
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
        Q_Auxi.SQL.Add('  and Turno='+InttoStr(QL_TurcTurno.AsInteger));
        Q_Auxi.SQL.Add('  and LiquidaGlobal='+QuotedStr('Si'));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger<=0 then begin
          xResult:=False;
        end;
      end;
      Q_Auxi.Close;
    end;
    Result:=xResult;
  end;
end;

procedure TFLIQTURC.RegistrarFichadeDepsito1Click(Sender: TObject);
begin
  with DMCUP do begin
    if QL_TurcESTATUS.AsString='C' then
      raise Exception.Create('Turno estï¿½ cerrado.');
    try
      Application.CreateForm(TFLIQFDEP,FLIQFDEP);
      FLIQFDEP.swNuevo:=Sender=RegistrarFichadeDepsito1;
      FLIQFDEP.PreparaForma('T');
      FLIQFDEP.ShowModal;
    finally
      FLIQFDEP.Free;
    end;
  end;
end;

procedure TFLIQTURC.GenerarPlizadeCostos1Click(Sender: TObject);
var bm:tbookmark;
begin
  with DMGEN,DMCUP,DMGAS do begin
    if ModoProc=1 then
      exit;
    if QL_Turc.IsEmpty then begin
      MensajeInfo('No se encontrï¿½ turno seleccionado');
      Exit;
    end;
    if QL_TurcEstatus.AsString<>'C' then
      raise Exception.Create('Turno debe estar cerrado');
    if QL_TurcContabilizado2.AsString='Si' then
      raise Exception.Create('Turno ya esta contabilizado');
    if not MesAbierto(idCnt,idPoli,FechaToMes(QL_TurcFecha.asdatetime)) then
      raise Exception.Create('Mes esta cerrado en contabilidad');
    if DMGEN_VTAS.FechaCosteo<QL_TurcFecha.AsDateTime then begin
      MensajeInfo('Fecha '+DateTimeToStr(QL_TurcFecha.AsDateTime)+' no se encuentra costeada, actualice la fecha de costeo para continuar');
      Exit;
    end;
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No encuentro turno seleccionado.');
    if VarGasPolizaLiqDia='Si' then begin
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno>'+IntToStr(QL_TurcTurno.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger>0 then
        raise Exception.Create('Debe contabilizar en el ï¿½ltimo turno del dï¿½a');
    end;
    Application.CreateForm(TFLIQTURCcpol,FLIQTURCcpol);
    bm:=QL_Turc.GetBookmark;
    try
      SetTipoDocumento(idLiqg);
      FLIQTURCcpol.xPolizaCosto:=True;
      FLIQTURCcpol.PreparaForma(idLiqg,1);
      FLIQTURCcpol.showmodal;
      RefrescaTabla;
    finally
      FLIQTURCcpol.Free;
      SpeedButton2Click(Sender);
      QL_Turc.GotoBookmark(bm);
      QL_Turc.FreeBookmark(bm);
    end;
  end;
end;

procedure TFLIQTURC.EliminarPlizadeCostos1Click(Sender: TObject);
var bm:tbookmark;
begin
  with DMCNT,DMGEN,DMGAS do begin
    if ModoProc=1 then
      exit;
    if QL_TurcContabilizado2.AsString<>'Si' then
      abort;
    if not MesAbierto(idCnt,idPoli,FechaToMes(QL_TurcFecha.asdatetime)) then
      raise Exception.Create('Mes esta cerrado en Contabilidad');
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
      raise Exception.Create('No encuentro turno seleccionado.');

    ChecaDerechoDocu(drEliminar,idPoli,QL_TurcFecha.asdatetime);
    if MensajeConf('ï¿½Desea eliminar esta pï¿½liza de costos?')=mrYes then begin
      bm:=QL_Turc.GetBookmark;
      if not LocalizaTabla(T_Poli,'Mes;TipoPoliza;NoPoliza',VarArrayOf([FechaToMes(QL_TurcFecha.asdatetime),QL_TurcTipoPoliza2.asstring,QL_TurcNoPoliza2.asinteger])) then begin
        T_Turc.Edit;
        T_TurcContabilizado2.AsString:='No';
        T_TurcTipoPoliza2.AsString:='';
        T_TurcNoPoliza2.AsString:='';
        T_Turc.Post;
//
        if VarGasPolizaLiqDia='Si' then begin
          with DMGAS do begin
            Q_Auxi.Close;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Update DGASTURC Set Contabilizado2="No", TipoPoliza2=" " ');
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
            Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
            Q_Auxi.Prepare;
            Q_Auxi.ExecSQL;
          end;
        end;
        SetTipoDocumento(idPoli);
        try
          IniciaDocAccion(idDocu,T_PoliClaveStr.AsString,AccEliminar);
          try
            AplicaPoliza(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger,false);
            VgSwAvance:=false;
            BorraPoliza_SP(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger);
            FinalizaDocAccion;
          except
            CancelaDocAccion;
            raise;
          end;
        finally
          LimpiaDocAccion;
        end;
        SpeedButton2Click(Sender);
        QL_Turc.GotoBookmark(bm);
        QL_Turc.FreeBookmark(bm);
        Exit;
      end;
      try
        IniciaDocAccion(idDocu,T_PoliClaveStr.AsString,AccEliminar);
        try
          AplicaPoliza(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger,false);
          VgSwAvance:=false;
          BorraPoliza_SP(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger);
          T_Turc.Edit;
          T_TurcContabilizado2.AsString:='No';
          T_TurcTipoPoliza2.AsString:='';
          T_TurcNoPoliza2.AsString:='';
          T_Turc.Post;

          if VarGasPolizaLiqDia='Si' then begin
            with DMGAS do begin
              Q_Auxi.Close;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Update DGASTURC Set Contabilizado2="No", TipoPoliza2=" " ');
              Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
              Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
              Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
              Q_Auxi.Prepare;
              Q_Auxi.ExecSQL;
            end;
          end;

          FinalizaDocAccion;
        except
          CancelaDocAccion;
          raise;
        end;
      finally
        LimpiaDocAccion;
        SpeedButton2Click(Sender);
        QL_Turc.GotoBookmark(bm);
        QL_Turc.FreeBookmark(bm);
      end;
    end;
  end;
end;

procedure TFLIQTURC.VistaPreliminardePlizadeCostos1Click(Sender: TObject);
begin
  with DMGEN,DMGAS,DMCNT do begin
    if QL_TurcContabilizado2.AsString<>'Si' then begin
      MensajeInfo('No se encontrï¿½ pï¿½liza de costos');
      Exit;
    end;
    try
      idDocu:=idPoli;
      T_Poli.Active:=true;
      T_Dpol.Active:=true;
      if LocalizaTabla(T_Poli,'Mes;TipoPoliza;NoPoliza',VarArrayOf([FechaToMes(QL_TurcFecha.asdatetime),QL_TurcTipoPoliza2.asstring,QL_TurcNOPOLIZA2.asinteger])) then begin
        if (sender=VistaPreliminardePlizadeCostos1) then
          FCNTPOLIF.PreparaForma('V',T_PoliTipoPoliza.asstring,false)
        else
          FCNTPOLIF.PreparaForma('I',T_PoliTipoPoliza.asstring,true);
        FCNTPOLIF.ImprimeForma;
        FCNTPOLIF.LiberaForma;
      end
      else
        MensajeInfo('No se encontrï¿½ pï¿½liza de costos');

    finally
      idDocu:=idLiqg;
    end;
  end;
end;

procedure TFLIQTURC.SalidadeAlmacnporIsla1Click(Sender: TObject);
var xtipo:string;
begin
  with DMGEN, DMGAS do begin
    Application.CreateForm(TFLIQSALISLA,FLIQSALISLA);
    try
      FLIQSALISLA.PreparaForma;
      FLIQSALISLA.showmodal;
    finally
      FLIQSALISLA.Free;
    end;
  end;
end;

function TFLIQTURC.ValidaSalidaAlmacen:Boolean;
begin
  with DMGAS do begin
    try
      Result:=False;
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT COUNT(*) as Entero1 FROM DGASTURC');
      Q_Auxi.SQL.Add('WHERE ESTACION='+IntToStr(QL_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('AND FECHA='+QuotedStr(FechaToStrSQL(QL_TurcFecha.AsDateTime)));
      Q_Auxi.SQL.Add('AND CAJA='+IntToStr(QL_TurcCAJA.AsInteger));
      Q_Auxi.SQL.Add('AND TURNO='+IntToStr(QL_TurcTURNO.AsInteger));     
      Q_Auxi.SQL.Add('AND ((SALIDA_ALMACEN IS NOT NULL) AND (SALIDA_ALMACEN<>'+quotedstr('')+'))');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger>0 then
        Result:=True;

      if VarLiqGenerarSalidaAlmacenIslas='Si' then begin
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Add('SELECT COUNT(*) as Entero1 FROM DGASTURCSALI');
        Q_Auxi.SQL.Add('WHERE ESTACION='+IntToStr(QL_TurcEstacion.AsInteger));
        Q_Auxi.SQL.Add('AND FECHA='+QuotedStr(FechaToStrSQL(QL_TurcFecha.AsDateTime)));
        Q_Auxi.SQL.Add('AND CAJA='+IntToStr(QL_TurcCAJA.AsInteger));
        Q_Auxi.SQL.Add('AND TURNO='+IntToStr(QL_TurcTURNO.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger>0 then
          Result:=True;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQTURC.ExportarCFDIPolizaClick(Sender: TObject);
begin
  with DMGEN do begin
    if DMCNT.SubMod04_ContaElect then begin         // Valida alias Administrdor CFDI
      if VarGenAliasAdmonCFDI='' then begin
        MensajeInfo('No se configurï¿½ "Alias" de Administrador CFDI en Mï¿½dulo General');
        Exit;
      end;
      if not(DMXML.DBXML1.Connected) then begin
        MensajeInfo('Error al conectarse con la base de datos del Administrador CFDI');
        Exit;
      end;
    end;

    ClientForm.ROChannel.Connected:=True;
    ClientForm.ROChannel.TargetURL:=DMGAS.VarGasTargetURL_FACELE2;
    ClientForm.ROChannel.Connected:=True;

    Application.CreateForm(TFGASXMLMES,FGASXMLMES);

    FGASXMLMES.TM_MES.Active:=True;

    QL_Turc.DisableControls;
    QL_Turc.First;
    while not(QL_Turc.Eof) do begin
      if QL_TurcContabilizado.AsString='Si' then begin
        if not(QL_TurcTIPOPOLIZA.AsString='**') then begin
          FGASXMLMES.TM_MES.Insert;
          FGASXMLMES.TM_MESSUCURSAL.AsInteger  := QL_TurcESTACION.AsInteger;
          FGASXMLMES.TM_MESTURNO.AsInteger     := QL_TurcTURNO.AsInteger;
          FGASXMLMES.TM_MESCAJA.AsInteger      := QL_TurcCAJA.AsInteger;
          FGASXMLMES.TM_MESFECHA.AsDateTime    := QL_TurcFECHA.AsDateTime;
          FGASXMLMES.TM_MESNOPOLIZA.AsInteger  := QL_TurcNOPOLIZA.AsInteger;
          FGASXMLMES.TM_MESTIPOPOLIZA.AsString := QL_TurcTIPOPOLIZA.AsString;
          FGASXMLMES.TM_MES.Post;
        end;
      end;
      QL_Turc.Next;
    end;
    QL_Turc.EnableControls;

    try
      FGASXMLMES.PreparaForma;
      FGASXMLMES.ShowModal;
    finally
      FGASXMLMES.Free;
    end;
    ClientForm.ROChannel.Connected:=True;
    ClientForm.ROChannel.TargetURL:=DMGAS.VarGasTargetURL_FACELE;
    ClientForm.ROChannel.Connected:=True;
  end;
end;

function TFLIQTURC.ValidaTurnoCXC:Boolean;
begin
  with DMGEN_VTAS do begin
    try
      Result := True;
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('select Count(*) as Entero1 from dgenturc t');
      Q_Auxi.SQL.Add('where exists (select c.caja from dgencaja c');
      Q_Auxi.SQL.Add('                where c.tipo = '+QuotedStr('Cobranza'));
      Q_Auxi.SQL.Add('                and t.caja = c.caja');
      Q_Auxi.SQL.Add('                and t.sucursal = c.sucursal)');
      Q_Auxi.SQL.Add('and t.fecha = '+QuotedStr(FechaToStrSQL(QL_TurcFecha.asdatetime)));
      Q_Auxi.SQL.Add('and ((t.estatus = '+QuotedStr('A')+') or (t.contabilizado='+QuotedStr('Si')+'))');
      Q_Auxi.SQL.Add('and t.sucursal = '+IntToStr(QL_TurcESTACION.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      if Q_AuxiEntero1.AsInteger>0 then
        Result := False;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQTURC.CierreDeDiaLiqManualClick(Sender: TObject);
var
  turnosCerrados:Integer;
  xturno : Integer;
  bm:tBookMark;
begin
  try
    with DMGAS do begin
      bm:=QL_Turc.GetBookmark;
      if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',VarArrayOf([EstacionActual,CajaActual,QL_TurcFecha.AsDateTime,QL_TurcTurno.AsInteger])) then
        raise Exception.Create('No encuentro el turno.');

      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASAJUD');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and aplicado='+QuotedStr('Si'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      if Q_AuxiEntero1.AsInteger>0 then begin
        MensajeInfo('Dï¿½a de liquidaciones ya se encuentra cerrado');
        Exit;
      end;

      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.asinteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Estatus='+QuotedStr('C'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      turnosCerrados:=Q_AuxiEntero1.AsInteger;
      Q_Auxi.Close;
    end;
    with DMGEN,DMGAS,DMLIQ do begin
      if (turnosCerrados=DMGAS.VarGasMaximoTurnosLiq) then begin
        if DMGEN.VarComp('AliasAuxiliar')<>'' then begin
          with DMAJUS do begin
            try
              DBAJUS1.close;
              DBAJUS1.AliasName:=DMGEN.VarComp('AliasAuxiliar');
              DBAJUS1.open;

              //checa ajuste
              if DMGEN.VarComp('TipoCambioA')='Turno' then begin
                xturno := 1;
                repeat
                  if not LocalizaTabla(TL_Ajud,'ESTACION;FECHA;TURNO',VarArrayOf([T_TurcESTACION.AsInteger,T_TurcFECHA.AsDateTime,xturno])) then begin
                    if TL_Ajud.State<>dsBrowse then
                      exit;
                    try
                      TL_Ajud.Append;
                      TL_AjudEstacion.asinteger:=T_TurcESTACION.AsInteger;
                      TL_AjudFecha.AsDateTime:=T_TurcFECHA.AsDateTime;
                      TL_AjudTurno.AsInteger:=xturno;
                      TL_Ajud.Post;
                    except
                    end;
                  end;
                  xturno := xturno + 1;
                until xturno>VarGasMaximoTurnosLiq;
                  
                xturno := 1;
                TL_Ajud.Refresh;                  
                repeat
                  if LocalizaTabla(TL_Ajud,'ESTACION;FECHA;TURNO',VarArrayOf([DMGAS.T_TurcESTACION.AsInteger,DMGAS.T_TurcFECHA.AsDateTime,xturno])) then begin
                    if TL_AjudAPLICADO.AsString<>'Si' then begin
                      TL_Ajud.Edit;
                      TL_AjudAplicado.AsString:='Si';
                      TL_Ajud.Post;
                    end;
                  end;
                  xturno := xturno + 1;
                until xturno>VarGasMaximoTurnosLiq;

                Q_AuxiAjus.Close;
                Q_AuxiAjus.SQL.Clear;
                Q_AuxiAjusReal1.FieldKind:=fkInternalCalc;
                Q_AuxiAjusEntero1.FieldKind:=fkInternalCalc;
                Q_AuxiAjusEntero2.FieldKind:=fkInternalCalc;
                Q_AuxiAjus.SQL.Add('SELECT TURNOADMIN As Entero1, COMBUSTIBLE As Entero2, COALESCE(SUM(VOLUMEN1 - VOLUMEN2),0) As Real1');
                Q_AuxiAjus.SQL.Add(' FROM CLAVES');
                Q_AuxiAjus.SQL.Add(' WHERE FECHAADMIN=:PFECHAADMIN');
                Q_AuxiAjus.SQL.Add(' GROUP BY TURNOADMIN,COMBUSTIBLE');
                Q_AuxiAjus.ParamByName('PFECHAADMIN').AsDateTime := DMGAS.T_TurcFECHA.AsDateTime;
                Q_AuxiAjus.Prepare;
                Q_AuxiAjus.Open;
                if not TL_Ajud2.Active then
                  TL_Ajud2.Open;
                TL_Ajud2.Refresh;
                TL_Ajud2.First;
                while not Q_AuxiAjus.Eof do begin
                  Q_Auxi.Close;
                  Q_Auxi.SQL.Clear;
                  Q_Auxi.SQL.Add('update DGASAJUD2');
                  Q_Auxi.SQL.Add('set volumen = ((select venta');
                  Q_Auxi.SQL.Add('                from dgasajud2');
                  Q_Auxi.SQL.Add('                where estacion = '+IntToStr(DMGAS.T_TurcESTACION.AsInteger));
                  Q_Auxi.SQL.Add('                and fecha = '+QuotedStr(FechaToStrSQL(DMGAS.T_TurcFECHA.AsDateTime)));
                  Q_Auxi.SQL.Add('                and combustible = '+IntToStr(Q_AuxiAjusEntero2.AsInteger));
                  Q_Auxi.SQL.Add('                and turno = '+IntToStr(Q_AuxiAjusEntero1.AsInteger)+')-'+FloatToStr(Q_AuxiAjusReal1.AsFloat)+')');
                  Q_Auxi.SQL.Add('  where estacion = '+IntToStr(DMGAS.T_TurcESTACION.AsInteger));
                  Q_Auxi.SQL.Add('  and fecha = '+QuotedStr(FechaToStrSQL(DMGAS.T_TurcFECHA.AsDateTime)));
                  Q_Auxi.SQL.Add('  and combustible = '+IntToStr(Q_AuxiAjusEntero2.AsInteger));
                  Q_Auxi.SQL.Add('  and turno = '+IntToStr(Q_AuxiAjusEntero1.AsInteger));
                  Q_Auxi.ExecSQL;
                  Q_AuxiAjus.Next;
                end;
                Q_AuxiAjus.Close;
                Q_Auxi.Close;
              end else
              begin
                if not LocalizaTabla(TL_Ajud,'ESTACION;FECHA',VarArrayOf([DMGAS.T_TurcESTACION.AsInteger,DMGAS.T_TurcFECHA.AsDateTime])) then begin
                  if TL_Ajud.State<>dsBrowse then
                    exit;
                  try
                    TL_Ajud.Append;
                    TL_AjudEstacion.asinteger:=DMGAS.T_TurcESTACION.AsInteger;
                    TL_AjudFecha.AsDateTime:=DMGAS.T_TurcFECHA.AsDateTime;
                    TL_AjudTurno.AsInteger:=VarGasAuxiliarLiq;
                    TL_Ajud.Post;
                  except
                  end;
                end;
                TL_Ajud.Refresh;
                if TL_AjudAPLICADO.AsString<>'Si' then begin
                  TL_Ajud.Edit;
                  TL_AjudAplicado.AsString:='Si';
                  TL_Ajud.Post;
                end;
                if not TL_Ajud2.Active then
                  TL_Ajud2.Open;
                TL_Ajud2.Refresh;
                TL_Ajud2.First;
                while not TL_Ajud2.Eof do begin
                  try
                    Q_AuxiAjus.Close;
                    Q_AuxiAjus.SQL.Clear;
                    Q_AuxiAjusReal1.FieldKind:=fkInternalCalc;
                    Q_AuxiAjus.SQL.Add('select coalesce(ajuste,0) as Real1 from dame_ajuste_admin_global('+QuotedStr(FechaToStrSQL(DMGAS.T_TurcFECHA.AsDateTime))+','+TL_Ajud2COMBUSTIBLE.AsString+')');
                    Q_AuxiAjus.Prepare;
                    Q_AuxiAjus.Open;
                    if not Q_AuxiAjus.IsEmpty then begin
                      TL_Ajud2.Edit;
                      TL_Ajud2VOLUMEN.AsFloat:=TL_Ajud2VENTA.AsFloat-Q_AuxiAjusReal1.AsFloat;
                      TL_Ajud2.Post;
                    end;
                  finally
                    Q_AuxiAjus.Close;
                  end;
                  TL_Ajud2.Next;
                end;
              end;
              DBAJUS1.Close;
            except
              on e:EDatabaseError do begin
                MensajeWarn('Alias mal configurado.');
              end;
              on e:Exception do begin
                MensajeWarn('Error al intentar proceso manual.'+#10#13+e.Message);
              end;
            end;
          end;
        end;
      end
      else begin
        MensajeInfo('No es posible cerrar dï¿½a de liquidaciones, debe cerrar primero todos los turnos del dï¿½a.');
      end;
    end;
  finally
    RefrescaTabla;
    QL_Turc.GotoBookmark(bm);
    QL_Turc.FreeBookmark(bm);
  end;
end;

initialization
  GLiqApiAccessTokenCache := '';
  GLiqApiTokenTypeCache := 'Bearer';
  GLiqApiTokenSolicitado := False;
  InitializeCriticalSection(GLiqApiTokenCS);

finalization
  DeleteCriticalSection(GLiqApiTokenCS);

end.
