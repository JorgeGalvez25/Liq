unit ULIQAJUD;

interface

uses Variants, UFIBCLASS2,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons, Db, DBTables,
  DBActns, ActnList, ComCtrls, ToolWin;

type
  TFLIQAJUD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    MesBox1: TComboBox;
    TL_Ajud: TTable;
    TL_AjudEstacion: TIntegerField;
    TL_AjudFECHA: TDateTimeField;
    TL_AjudAPLICADO: TStringField;
    TL_AjudTOTAL: TFloatField;
    Panel6: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DSL_Ajud: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    TL_Ajud2: TTable;
    TL_Ajud2ESTACION: TIntegerField;
    TL_Ajud2FECHA: TDateTimeField;
    TL_Ajud2COMBUSTIBLE: TIntegerField;
    TL_Ajud2VOLUMEN: TFloatField;
    TL_Ajud2VENTA: TFloatField;
    TL_Ajud2DIFERENCIA: TFloatField;
    TL_Ajud2PRECIO: TFloatField;
    TL_Ajud2TOTAL: TFloatField;
    DSL_Ajud2: TDataSource;
    TL_Ajud2NombreCombustible: TStringField;
    StaticText2: TStaticText;
    TL_AjudTURNO: TIntegerField;
    Label2: TLabel;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    TL_AjudBLOQUEADO: TStringField;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    TBAjusta: TToolButton;
    TL_Ajud2TURNO: TIntegerField;
    procedure ToolButton1Click(Sender: TObject);
    procedure TL_AjudFECHAValidate(Sender: TField);
    procedure TL_Ajud2AfterInsert(DataSet: TDataSet);
    procedure DBGrid2Enter(Sender: TObject);
    procedure MesBox1Change(Sender: TObject);
    procedure TL_Ajud2AfterPost(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
    procedure TL_AjudAfterInsert(DataSet: TDataSet);
    procedure TL_AjudAfterEdit(DataSet: TDataSet);
    procedure TL_AjudAfterDelete(DataSet: TDataSet);
    procedure TL_AjudAfterPost(DataSet: TDataSet);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure TBAjustaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TL_AjudFECHAChange(Sender: TField);
  private
    { Private declarations }
    SwBotonIns,
    SwBotonDel,SwBloqueos:boolean;
    tipoLiq:Integer;
    FJsonLiquidacionAPI:string;
    FHiloConsultaLiq: TThread;
    FColaConsultaLiq: TList;
    FConsultaLiqActiva: Boolean;
    FConsultaLiqActivaFechaTurno: TDateTime;
    FConsultaLiqActivaNoTurno: Integer;
    FConsultaLiqActivaEstacion: Integer;
    FSyncWaitForm: TForm;
    function HayConsultasLiquidacionPendientesOActivas: Boolean;
    procedure MostrarSincronizandoLiquidacionesNube;
    procedure OcultarSincronizandoLiquidacionesNube;
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
    destructor Destroy; override;
    procedure PreparaForma;
    procedure RefrescaTabla;
    procedure Totaliza;
  end;

  TADIQuery=class(TIMGQuery)
    public
      Constructor Create(SQL:String); overload;
  end;

var
  FLIQAJUD: TFLIQAJUD;

implementation

uses DDMGEN, DDMGASQ, DDMGAS,
     ULIBGRAL, UGEN_NET,  ULIBDATABASE, ULIQREP18P,
     ComObj, uLkJSON, ActiveX, Math;

{$R *.DFM}


const
  WINHTTP_OPTION_SECURE_PROTOCOLS = 9;
  WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2 = $00000800;
  LIQ_API_IDP_BASE_URL = 'https://idpautenticacionestaciondev.azurewebsites.net';
  LIQ_API_BASE_URL = 'https://estaciondev.igas.mx';
  LIQ_API_USERNAME = 'PL_8169_EXP_ES_2015';
  LIQ_API_PASSWORD = '3g.SiM8&Z^z9';
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
  COLOR_BORDE_AZUL = $00D77800;
  COLOR_FONDO = $00EDEDED;
begin
  inherited CreateNew(AOwner);
  BorderStyle := bsDialog;
  BorderIcons := [];
  Caption := 'Sincronizando';
  ClientWidth := 425;
  ClientHeight := 86;
  Position := poOwnerFormCenter;
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
  COLOR_BORDE_AZUL = $00D77800;
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

      Porcentaje := 25 + ((SEGMENTOS - 1 - I) * 75) div (SEGMENTOS - 1);
      DotColor := LiqApiBlendColor(COLOR_BORDE_AZUL, Self.Color, Porcentaje);

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
          '"', '\', '/': Result := Result + Json[I];
          'b': Result := Result + #8;
          'f': Result := Result + #12;
          'n': Result := Result + #10;
          'r': Result := Result + #13;
          't': Result := Result + #9;
          'u': Inc(I, 4);
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

function LiqApiFormatDateParam(const AValue: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', AValue);
end;

function LiqApiNormalizaTokenType(const ATokenType: string): string;
begin
  Result := Trim(ATokenType);
  if Result = '' then
    Result := 'Bearer';
end;

function LiqApiSolicitarTokenAPI(var AAccessToken, ATokenType: string): Boolean;
const
  CAMPOS_TOKEN: array[0..2] of string = ('access_token', 'token', 'id_token');
var
  Url, Body, Resp, Token: string;
  Status, I: Integer;
begin
  Result := False;
  AAccessToken := '';
  ATokenType := '';

  Url := LiqApiRemoveTrailingSlash(LIQ_API_IDP_BASE_URL) + '/auth/token';
  Body := 'username=' + LiqApiUrlEncode(LIQ_API_USERNAME) +
          '&password=' + LiqApiUrlEncode(LIQ_API_PASSWORD) +
          '&grant_type=password';

  LiqApiHttpRequest('POST', Url, Body, '',
    'application/x-www-form-urlencoded', Status, Resp);

  if not (Status in [200, 201]) then
    raise Exception.Create('La API no regreso exito al solicitar token. HTTP ' +
      IntToStr(Status) + #13 + Resp);

  Token := '';
  for I := Low(CAMPOS_TOKEN) to High(CAMPOS_TOKEN) do begin
    Token := LiqApiExtractJsonStringValue(Resp, CAMPOS_TOKEN[I]);
    if Token <> '' then
      Break;
  end;

  if Token = '' then
    raise Exception.Create('No se encontro access_token/token/id_token en la respuesta del token.' + #13 + Resp);

  ATokenType := LiqApiNormalizaTokenType(LiqApiExtractJsonStringValue(Resp, 'token_type'));
  AAccessToken := StringReplace(Token, 'Bearer ', '', [rfIgnoreCase]);
  Result := True;
end;

function LiqApiObtenerToken(var AAccessToken, ATokenType: string): Boolean;
var
  NuevoAccessToken, NuevoTokenType: string;
begin
  Result := False;
  AAccessToken := '';
  ATokenType := '';

  EnterCriticalSection(GLiqApiTokenCS);
  try
    if GLiqApiTokenSolicitado and (Trim(GLiqApiAccessTokenCache) <> '') then begin
      AAccessToken := GLiqApiAccessTokenCache;
      ATokenType := LiqApiNormalizaTokenType(GLiqApiTokenTypeCache);
      Result := True;
      Exit;
    end;

    NuevoAccessToken := '';
    NuevoTokenType := '';

    if LiqApiSolicitarTokenAPI(NuevoAccessToken, NuevoTokenType) then begin
      GLiqApiAccessTokenCache := NuevoAccessToken;
      GLiqApiTokenTypeCache := LiqApiNormalizaTokenType(NuevoTokenType);
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

function LiqApiJsonField(AObj: TlkJSONobject; const AName: string): TlkJSONbase;
begin
  Result := nil;
  if not Assigned(AObj) then
    Exit;
  Result := AObj.Field[AName];
  if Assigned(Result) and (Result is TlkJSONnull) then
    Result := nil;
end;

function LiqApiJsonStringDef(AObj: TlkJSONobject; const AName, ADefault: string): string;
var
  JValue: TlkJSONbase;
begin
  Result := ADefault;
  JValue := LiqApiJsonField(AObj, AName);
  if not Assigned(JValue) then
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
  JValue := LiqApiJsonField(AObj, AName);
  if not Assigned(JValue) then
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

  LitrosDiferencia := Abs(LiqApiJsonDoubleDef(AObj, 'diferencia', 0));
  if LitrosDiferencia > 0.0000001 then begin
    Result := LitrosDiferencia;
    Exit;
  end;

  LitrosLecturas := Abs(LiqApiJsonDoubleDef(AObj, 'diferenciaLecturas', 0));
  if LitrosLecturas > 0.0000001 then
    Result := LitrosLecturas;
end;

function LiqApiModoRepartoAjuste: TModoRepartoAjuste;
var
  Modo: string;
begin
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
      '). Revisar si DGASAJUD2.diferencia contiene el mismo criterio de litros que espera la API.');
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

  LiqApiHttpRequest('GET', Url, '', AuthHeader, '', Status, Resp);

  if not (Status in [200, 201]) then
    raise Exception.Create('La API no regreso exito al consultar liquidaciones. HTTP ' + IntToStr(Status) + #13 + Resp);

  AJsonLiquidacion := LiqApiCrearJsonDetalleLiquidacion(Resp);
  Result := True;
end;

function TFLIQAJUD.DameVolumenAjusteDGASAJUD2(const AEstacion: Integer;
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

function TFLIQAJUD.DameMagnitudARepartirDGASAJUD2(const AEstacion: Integer;
  const AFechaTurno: TDateTime; const ANoTurno, ANoCombustible: Integer): Double;
begin
  // Esta ventana SIEMPRE trabaja global por dia: aunque la tabla tenga turno,
  // no se filtra DGASAJUD2 por turno. El turno enviado a la API debe ser 0.
  Result := DameVolumenAjusteDGASAJUD2(AEstacion, AFechaTurno, 0, ANoCombustible);
end;

procedure TFLIQAJUD.AplicarAjusteDGASAJUD2Json(var AJsonLiquidacion: string;
  const AEstacion: Integer; const AFechaTurno: TDateTime; const ANoTurno: Integer);
type
  TMangueraAjuste = record
    Obj: TlkJSONobject;
    NoTurno: Integer;
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

    // En ULIQAJUD el ajuste es diario. No se valida noTurno del JSON.
    if not LiqApiFechaJsonIgual(LiqApiJsonStringDef(AObj, 'fechaTurno', ''), AFechaTurno) then
      Exit;

    NoCombustible := LiqApiJsonIntegerDef(AObj, 'noCombustible', 0);
    if NoCombustible <= 0 then
      Exit;

    GrupoIndex := IndiceGrupo(NoCombustible);
    MangueraIndex := Length(Grupos[GrupoIndex].Mangueras);
    SetLength(Grupos[GrupoIndex].Mangueras, MangueraIndex + 1);

    LitrosManguera := LiqApiLitrosManguera(AObj);

    Grupos[GrupoIndex].Mangueras[MangueraIndex].Obj := AObj;
    Grupos[GrupoIndex].Mangueras[MangueraIndex].NoTurno :=
      LiqApiJsonIntegerDef(AObj, 'noTurno', 0);
    Grupos[GrupoIndex].Mangueras[MangueraIndex].NoManguera :=
      LiqApiJsonIntegerDef(AObj, 'noManguera', 0);
    Grupos[GrupoIndex].Mangueras[MangueraIndex].PesoLitros := LitrosManguera;
    Grupos[GrupoIndex].Mangueras[MangueraIndex].LitrosApi := LitrosManguera;
  end;

  // Orden estable por (NoTurno, NoManguera): True si A va antes que B.
  // Centraliza el desempate del orden y de la manguera residual.
  function MangueraVaAntes(const A, B: TMangueraAjuste): Boolean;
  begin
    Result := (A.NoTurno < B.NoTurno) or
              ((A.NoTurno = B.NoTurno) and (A.NoManguera < B.NoManguera));
  end;

  procedure OrdenaManguerasPorNumero(var AGrupo: TGrupoCombustibleAjuste);
  var
    I, J: Integer;
    Tmp: TMangueraAjuste;
  begin
    for I := 1 to High(AGrupo.Mangueras) do begin
      Tmp := AGrupo.Mangueras[I];
      J := I - 1;
      while (J >= 0) and MangueraVaAntes(Tmp, AGrupo.Mangueras[J]) do begin
        AGrupo.Mangueras[J + 1] := AGrupo.Mangueras[J];
        Dec(J);
      end;
      AGrupo.Mangueras[J + 1] := Tmp;
    end;
  end;

  function IndiceMangueraResidual(const AGrupo: TGrupoCombustibleAjuste): Integer;
  var
    I: Integer;
    EsMejor: Boolean;
  begin
    Result := 0;
    for I := 1 to High(AGrupo.Mangueras) do begin
      // Mayor peso; a igualdad de peso, la manguera posterior en (turno, no).
      EsMejor :=
        (AGrupo.Mangueras[I].PesoLitros > AGrupo.Mangueras[Result].PesoLitros) or
        ((AGrupo.Mangueras[I].PesoLitros = AGrupo.Mangueras[Result].PesoLitros) and
         MangueraVaAntes(AGrupo.Mangueras[Result], AGrupo.Mangueras[I]));
      if EsMejor then
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

    AGrupo.VolumenTotal := DameMagnitudARepartirDGASAJUD2(
      AEstacion, AFechaTurno, 0, AGrupo.NoCombustible);

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

    LiqApiAsignaDiferenciaLecturas2(AGrupo.Mangueras[IndiceResidual].Obj,
      AGrupo.VolumenTotal - VolumenAsignado);
  end;

var
  I: Integer;
  GrupoIndex: Integer;
begin
  if Trim(AJsonLiquidacion) = '' then
    Exit;

  Modo := LiqApiModoRepartoAjuste;

  JsonBase := TlkJSON.ParseText(AJsonLiquidacion);
  if not Assigned(JsonBase) then
    raise Exception.Create('No fue posible parsear el JSON de liquidacion para aplicar DGASAJUD2.');

  try
    SetLength(Grupos, 0);

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
    FFormulario: TFLIQAJUD;
    FFechaIni: TDateTime;
    FFechaFin: TDateTime;
    FFechaTurno: TDateTime;
    FNoTurno: Integer;
    FEstacion: Integer;
    FJson: string;
    FError: string;
    procedure EntregaResultado;
  protected
    procedure Execute; override;
  public
    constructor Create(AFormulario: TFLIQAJUD;
      const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
      const ANoTurno, AEstacion: Integer);
    procedure OlvidaFormulario;
  end;

constructor TLiqApiConsultaLiqThread.Create(AFormulario: TFLIQAJUD;
  const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
  const ANoTurno, AEstacion: Integer);
begin
  inherited Create(True);
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
  FFormulario := nil;
end;

procedure TLiqApiConsultaLiqThread.Execute;
var
  AccessToken: string;
  TokenType: string;
  hr: HRESULT;
begin
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

  if not Terminated then
    Synchronize(EntregaResultado);
end;

procedure TLiqApiConsultaLiqThread.EntregaResultado;
var
  jsonStr:TStringList;
begin
  if FFormulario = nil then
    Exit;

  try
    try
      if FError <> '' then
        raise Exception.Create(FError);

      FFormulario.AplicarAjusteDGASAJUD2Json(FJson, FEstacion, FFechaTurno, 0);
      FFormulario.FJsonLiquidacionAPI := FJson;

      ForceDirectories('C:\ImagenCo');
      jsonStr:=TStringList.Create();
      try
        jsonStr.Add(FJson);
        jsonStr.SaveToFile('C:\ImagenCo\JsonLiq_Ajud_Dia.txt');
      finally
        jsonStr.Free;
      end;
    except
      on E: Exception do
        MensajeWarn('La fecha se bloqueo, pero no fue posible aplicar/consultar la liquidacion diaria en la API.' + #13 + E.Message);
    end;
  finally
    if FFormulario <> nil then
      FFormulario.FinalizaConsultaLiquidacionAPI(Self);
  end;
end;

function TFLIQAJUD.HayConsultasLiquidacionPendientesOActivas: Boolean;
begin
  Result := FConsultaLiqActiva or Assigned(FHiloConsultaLiq) or
    (Assigned(FColaConsultaLiq) and (FColaConsultaLiq.Count > 0));
end;

procedure TFLIQAJUD.MostrarSincronizandoLiquidacionesNube;
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

procedure TFLIQAJUD.OcultarSincronizandoLiquidacionesNube;
begin
  if Assigned(FSyncWaitForm) then begin
    FSyncWaitForm.Hide;
    FreeAndNil(FSyncWaitForm);
  end;
end;

procedure TFLIQAJUD.ConsultaLiquidacionAPIAlCerrarTurno(const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
  const ANoTurno, AEstacion: Integer);
begin
  // Esta ventana siempre programa la consulta como diaria: noTurno = 0.
  EncolaConsultaLiquidacionAPI(AFechaIni, AFechaFin, AFechaTurno, 0, AEstacion);
end;

function TFLIQAJUD.ConsultaLiquidacionAPIYaProgramada(const AFechaTurno: TDateTime;
  const ANoTurno, AEstacion: Integer): Boolean;
var
  I: Integer;
  Item: TLiqApiConsultaLiqItem;
begin
  Result := False;

  if FConsultaLiqActiva and
     (FConsultaLiqActivaNoTurno = 0) and
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
       (Item.NoTurno = 0) and
       (Item.Estacion = AEstacion) and
       (Trunc(Item.FechaTurno) = Trunc(AFechaTurno)) then begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TFLIQAJUD.EncolaConsultaLiquidacionAPI(const AFechaIni, AFechaFin, AFechaTurno: TDateTime;
  const ANoTurno, AEstacion: Integer);
var
  Item: TLiqApiConsultaLiqItem;
begin
  if ConsultaLiquidacionAPIYaProgramada(AFechaTurno, 0, AEstacion) then
    Exit;

  if not Assigned(FColaConsultaLiq) then
    FColaConsultaLiq := TList.Create;

  Item := TLiqApiConsultaLiqItem.Create;
  Item.FechaIni := AFechaIni;
  Item.FechaFin := AFechaFin;
  Item.FechaTurno := AFechaTurno;
  Item.NoTurno := 0;
  Item.Estacion := AEstacion;

  FColaConsultaLiq.Add(Item);
  MostrarSincronizandoLiquidacionesNube;
  IniciaSiguienteConsultaLiquidacionAPI;
end;

procedure TFLIQAJUD.IniciaSiguienteConsultaLiquidacionAPI;
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
    FJsonLiquidacionAPI := '';
    FConsultaLiqActiva := True;
    FConsultaLiqActivaFechaTurno := Item.FechaTurno;
    FConsultaLiqActivaNoTurno := 0;
    FConsultaLiqActivaEstacion := Item.Estacion;

    Hilo := TLiqApiConsultaLiqThread.Create(
      Self, Item.FechaIni, Item.FechaFin, Item.FechaTurno, 0, Item.Estacion);
    FHiloConsultaLiq := Hilo;

    try
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

procedure TFLIQAJUD.FinalizaConsultaLiquidacionAPI(AThread: TThread);
begin
  if FHiloConsultaLiq = AThread then
    FHiloConsultaLiq := nil;

  FConsultaLiqActiva := False;
  FConsultaLiqActivaFechaTurno := 0;
  FConsultaLiqActivaNoTurno := 0;
  FConsultaLiqActivaEstacion := 0;

  IniciaSiguienteConsultaLiquidacionAPI;

  if not HayConsultasLiquidacionPendientesOActivas then
    OcultarSincronizandoLiquidacionesNube
  else
    MostrarSincronizandoLiquidacionesNube;
end;

procedure TFLIQAJUD.LimpiaColaConsultaLiquidacionAPI;
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

destructor TFLIQAJUD.Destroy;
begin
  LimpiaColaConsultaLiquidacionAPI;
  if Assigned(FHiloConsultaLiq) then
    TLiqApiConsultaLiqThread(FHiloConsultaLiq).OlvidaFormulario;
  OcultarSincronizandoLiquidacionesNube;
  inherited Destroy;
end;


procedure TFLIQAJUD.PreparaForma;
begin
  with DMGEN do begin
    SwBotonIns:=false;
    SwBotonDel:=false;
    SwBloqueos := False;
    IniciaMesBox(MesBox1,MesIniEjercicio(MesInicial(idLiq)),MesFinEjercicio,VgMes,false);
    RefrescaTabla;
    DMGAS.Q_Auxi.Close;
    DMGAS.Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    DMGAS.Q_Auxi.SQL.Clear;
    DMGAS.Q_Auxi.SQL.Add('SELECT TIPOLIQ AS ENTERO1 FROM DGENEMPR');
    DMGAS.Q_Auxi.Open;
    tipoLiq:=DMGAS.Q_AuxiEntero1.AsInteger;
    if tipoLiq=2 then
      DBGrid1.Columns[1].ReadOnly:=False;
  end;
end;

procedure TFLIQAJUD.RefrescaTabla;
var feci,fecf:TDateTime;
begin
  with DMGEN,DMGASQ,DMGAS do begin
    feci:=MesDiaToFecha(ElementoActualMesBox(MesBox1),1);
    fecf:=MesDiaMaxToFecha(ElementoActualMesBox(MesBox1));
    TL_Ajud.Active:=false;
    TL_Ajud.Filter:='Estacion='+IntToStr(EstacionActual)+
                    ' and Fecha>='''+FechaToFormato(feci)+''' and Fecha<='''+FechaToFormato(fecf)+'''';
    TL_Ajud.Filtered:=true;
    TL_Ajud.Active:=true;
    TL_Ajud2.Active:=true;
    VgMes:=FechaToMes(fecf);
    Totaliza;
  end;
end;

procedure TFLIQAJUD.Totaliza;
var BM:TBookMark;
    total:real;
begin
  TL_Ajud.DisableControls;
  BM:=TL_Ajud.GetBookMark;
  total:=0;
  try
    TL_Ajud.First;
    while not TL_Ajud.eof do begin
      if TL_AjudAplicado.AsString='Si' then
        total:=total+TL_AjudTotal.AsFloat;
      TL_Ajud.Next;
    end;
    StaticText2.Caption:=FormatoMoneda(total);
  finally
    TL_Ajud.EnableControls;
    TL_Ajud.GotoBookmark(BM);
    TL_Ajud.FreeBookmark(BM);
  end;
end;

procedure TFLIQAJUD.ToolButton1Click(Sender: TObject);
begin
  with DMGAS do begin
    if TL_Ajud.State<>dsBrowse then
      exit;
    SwBotonIns:=true;
    try
      TL_Ajud.Append;
    finally
      SwBotonIns:=false;
    end;
    TL_AjudEstacion.asinteger:=EstacionActual;
    TL_AjudFecha.AsDateTime:=MesDiaMaxToFecha(ElementoActualMesBox(MesBox1));
    if tipoLiq<>2 then
      TL_AjudTurno.AsInteger:=VarGasAuxiliarLiq;
    DBGrid1.SetFocus;
  end;
end;

procedure TFLIQAJUD.TL_AjudFECHAValidate(Sender: TField);
begin
  with DMGAS do begin
    if FechaToMes(TL_AjudFecha.asdatetime)<>ElementoActualMesBox(MesBox1) then
      raise Exception.Create('Fecha no es del mes actual');
  end;
end;

procedure TFLIQAJUD.TL_Ajud2AfterInsert(DataSet: TDataSet);
begin
  TL_Ajud2.Cancel;
end;

procedure TFLIQAJUD.DBGrid2Enter(Sender: TObject);
var xcant:integer;
begin
  with DMGAS do begin
    if TL_Ajud.State=dsInsert then
      TL_Ajud.Post;
    TL_Ajud.Refresh;
    if TL_Ajud.IsEmpty then
      exit;
    if TL_AjudAplicado.AsString='No' then begin
      if FechaToMes(TL_AjudFecha.asdatetime)<>ElementoActualMesBox(MesBox1) then
        raise Exception.Create('Fecha no es del mes actual');
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASLIQG');
      Q_Auxi.SQL.Add('where Estacion='+inttostr(TL_AjudEstacion.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(TL_AjudFecha.asdatetime)+'"');
      Q_Auxi.Prepare;
      Q_Auxi.open;
      xcant:=Q_AuxiEntero1.AsInteger;
      Q_Auxi.Close;
      if xcant=0 then begin
        TL_Ajud2.Refresh;
        while not TL_Ajud2.IsEmpty do
          TL_Ajud2.Delete;
        raise Exception.Create('No hay Liquidaciones este d�a');
      end;
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC T, DGASCAJA C');
      Q_Auxi.SQL.Add('where T.Estacion='+inttostr(TL_AjudEstacion.asinteger));
      Q_Auxi.SQL.Add('  and T.Fecha="'+FechaToStrSql(TL_AjudFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and T.Estatus="A"');
      Q_Auxi.SQL.Add('  and T.Estacion=C.Estacion');
      Q_Auxi.SQL.Add('  and T.Caja=C.Caja');
      Q_Auxi.SQL.Add('  and C.Tipo="Liquidacion"');
      Q_Auxi.Prepare;
      Q_Auxi.open;
      xcant:=Q_AuxiEntero1.AsInteger;
      Q_Auxi.Close;
      if xcant>0 then begin
        TL_Ajud2.Refresh;
        while not TL_Ajud2.IsEmpty do
          TL_Ajud2.Delete;
        raise Exception.Create('Hay Turnos de Liquidaci�n Abiertos en esta Fecha');
      end;
      TL_Ajud.Edit;
      TL_AjudAplicado.AsString:='Si';
      TL_Ajud.Post;
      TL_Ajud2.Refresh;
    end;
  end;
end;

procedure TFLIQAJUD.MesBox1Change(Sender: TObject);
begin
  RefrescaTabla;
end;

procedure TFLIQAJUD.TL_Ajud2AfterPost(DataSet: TDataSet);
begin
  TL_Ajud.Refresh;
  Totaliza;
end;

procedure TFLIQAJUD.ToolButton2Click(Sender: TObject);
begin
  if TL_Ajud.State<>dsBrowse then
    exit;
  if MensajeConf('Desea Eliminar Registro?')=mrYes then begin
    SwBotonDel:=true;
    try
      TL_Ajud.Edit;
      TL_AjudAplicado.AsString:='No';
      TL_Ajud.Post;
      TL_Ajud.Refresh;
      TL_Ajud.Delete;
    finally
      SwBotonDel:=false;
    end;
  end;
end;

procedure TFLIQAJUD.TL_AjudAfterInsert(DataSet: TDataSet);
begin
  if not SwBotonIns then
    TL_Ajud.Cancel
  else begin
    TL_AjudBLOQUEADO.AsString := 'Si';
  end;
end;

procedure TFLIQAJUD.TL_AjudAfterEdit(DataSet: TDataSet);
begin
  if (TL_AjudAplicado.AsString='Si')and(not SwBotonDel)and(not SwBloqueos) then begin
    TL_Ajud.Cancel;
    raise Exception.Create('No se puede cambiar fecha');
  end;
end;

procedure TFLIQAJUD.TL_AjudAfterDelete(DataSet: TDataSet);
begin
  Totaliza;
end;

procedure TFLIQAJUD.TL_AjudAfterPost(DataSet: TDataSet);
begin
  Totaliza;
end;

procedure TFLIQAJUD.DBGrid1ColEnter(Sender: TObject);
begin
  if DBGrid1.SelectedIndex=1 then
    Label2.Visible:=true;
end;

procedure TFLIQAJUD.DBGrid1ColExit(Sender: TObject);
begin
  if DBGrid1.SelectedIndex=1 then
    Label2.Visible:=false;
end;

procedure TFLIQAJUD.DBGrid1Exit(Sender: TObject);
begin
  Label2.Visible:=false;
end;

procedure TFLIQAJUD.ToolButton3Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP18P,FLIQREP18P);
  try
    FLIQREP18P.ShowModal;
  finally
    FLIQREP18P.Free;
  end;
end;

procedure TFLIQAJUD.ToolButton7Click(Sender: TObject);
begin
  if TL_Ajud.State<>dsBrowse then
    exit;
  if MensajeConf('Desea Desbloquear Fecha '+FechaPaq(TL_AjudFECHA.AsDateTime)+'?')=mrYes then begin
    try
      SwBloqueos:=True;
      try
        TL_Ajud.Edit;
        TL_AjudBLOQUEADO.AsString := 'No';
        TL_Ajud.Post;
      except
        TL_Ajud.Cancel;
      end;
    finally
      TL_Ajud.Refresh;
      SwBloqueos:=False;
    end;
  end;
end;

procedure TFLIQAJUD.ToolButton6Click(Sender: TObject);
var
  DebeConsultarAPI: Boolean;
begin
  if TL_Ajud.State<>dsBrowse then
    exit;
  if MensajeConf('Desea Bloquear Fecha '+FechaPaq(TL_AjudFECHA.AsDateTime)+'?')=mrYes then begin
    DebeConsultarAPI := False;
    try
      SwBloqueos:=True;
      try
        TL_Ajud.Edit;
        TL_AjudBLOQUEADO.AsString := 'Si';
        TL_Ajud.Post;
        DebeConsultarAPI := True;
      except
        TL_Ajud.Cancel;
      end;
    finally
      TL_Ajud.Refresh;
      SwBloqueos:=False;
    end;

    if DebeConsultarAPI then begin
      try
        // ULIQAJUD trabaja global por dia: siempre se manda noTurno = 0.
        ConsultaLiquidacionAPIAlCerrarTurno(
          TL_AjudFECHA.AsDateTime,
          TL_AjudFECHA.AsDateTime,
          TL_AjudFECHA.AsDateTime,
          0,
          TL_AjudEstacion.AsInteger);
      except
        on E: Exception do
          MensajeWarn('La fecha se bloqueo, pero no fue posible programar la consulta diaria en la API.' + #13 + E.Message);
      end;
    end;
  end;
end;

procedure TFLIQAJUD.TBAjustaClick(Sender: TObject);
var
  xPagosEfectivo:array[1..4]of Real;
  i:Integer;
  xTotalEfectivo:Real;
  xPorc:Real;
  xLtsAjustados:Real;
  xLtsVendidos:Real;
  Q_Hist:TADIQuery;
begin
  with DMGAS do begin
    try
      for i:= 1 to 4 do
        xPagosEfectivo[i]:=0;
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('select d.Turno as Entero1,coalesce(Sum(d.importe),0) as Real1 from DGASDLIQP d');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(TL_AjudEstacion.asinteger));
      Q_Auxi.SQL.Add('  and d.fecha='+QuotedStr(FechaToStrSQL(TL_AjudFECHA.AsDateTime)));
      Q_Auxi.SQL.Add('  and exists (select t.* from DGASTPAG t');
      Q_Auxi.SQL.Add('              where t.clave=d.clave_pago');
      Q_Auxi.SQL.Add('                and t.Clase='+QuotedStr('Efectivo')+')');
      Q_Auxi.SQL.Add('  and d.Aplicado='+QuotedStr('Si'));
      Q_Auxi.SQL.Add('group by turno');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      i:=0;
      xTotalEfectivo:=0;
      while not Q_Auxi.Eof do begin
        Inc(i);
        xTotalEfectivo:=xTotalEfectivo+Q_AuxiReal1.AsFloat;
        xPagosEfectivo[Q_AuxiEntero1.AsInteger]:=xPagosEfectivo[Q_AuxiEntero1.AsInteger]+Q_AuxiReal1.AsFloat;
        Q_Auxi.Next;
      end;
      try
        Q_Hist:=TADIQuery.Create('select coalesce(sum(Ajuste),0) as Ajustes from Historia where Fecha='+QuotedStr(FechaToStrSQL(TL_AjudFECHA.AsDateTime)));
        Q_Hist.ExecQuery;
        xLtsAjustados:=Q_Hist.FN('AJUSTES').AsFloat;
      finally
        Q_Hist.Free;
      end;

      if (TL_Ajud2.state in[dsInsert,dsEdit]) then
        TL_Ajud2.Cancel;

      xLtsVendidos:=0;
      TL_Ajud2.First;
      while not TL_Ajud2.Eof do begin
        xLtsVendidos:=xLtsVendidos+TL_Ajud2VENTA.AsFloat;
        TL_Ajud2.Next;
      end;
      i:=0;
      TL_Ajud2.First;
      while (not TL_Ajud2.Eof) and (i<=3) do begin
        Inc(i);
//        xPorc:=AjustaFloat(DivideFloat(xPagosEfectivo[TL_AjudTURNO.AsInteger]*100,xTotalEfectivo),2);
        xPorc:=AjustaFloat(DivideFloat(TL_Ajud2VENTA.AsFloat*100,xLtsVendidos),2);
        try
          TL_Ajud2.Edit;
          TL_Ajud2VOLUMEN.AsFloat:=AjustaFloat((xLtsAjustados*DivideFloat(xPorc,100)),2);
          TL_Ajud2.Post;
        except
          TL_Ajud2.Cancel;
        end;
        TL_Ajud2.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQAJUD.FormShow(Sender: TObject);
begin
  TBAjusta.Visible:= DMGEN.VarComp('RutaAjusta')<>'';
end;

{ TADIQuery }

constructor TADIQuery.Create(SQL: String);
var
  pRuta:string;
begin
  pRuta:=DMGEN.VarComp('RutaAjusta') + 'Ajusta.fdb';
  inherited Create(SQL, pRuta);
end;

procedure TFLIQAJUD.TL_AjudFECHAChange(Sender: TField);
begin
  if tipoLiq=2 then begin
    with DMGAS do begin
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT COALESCE(MAX(TURNO),0)+1 AS ENTERO1 FROM DGASAJUD WHERE ESTACION='+IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('AND FECHA='+QuotedStr(FechaToStrSQL(TL_AjudFECHA.AsDateTime)));
      Q_Auxi.Open;
      TL_AjudTURNO.AsInteger:=Q_AuxiEntero1.AsInteger;
    end;
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
