unit ULIQRECVALE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxMaskEdit, cxDropDownEdit,
  cxCalendar, StdCtrls, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  cxButtons, cxPC, cxControls, ExtCtrls, DB, RxMemDS, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGroupBox, cxButtonEdit, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSpinEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DBTables,
  dxStatusBar, ComCtrls;

type
  TEstatusTransferencia = (Nula, ValesProceso, CuponesProceso);

  TFLIQRECVALE = class(TForm)
    pFecha: TPanel;
    pMonotos: TPanel;
    Contenedor: TcxPageControl;
    pValesPendientes: TcxTabSheet;
    pRecuperarCupon: TcxTabSheet;
    txtEfectivo: TcxCurrencyEdit;
    txtValesPendientes: TcxCurrencyEdit;
    txtCuponesRecuperados: TcxCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnMontos: TcxButton;
    Label5: TLabel;
    txtEfectivoATrans: TcxCurrencyEdit;
    btnTransferirAVal: TcxButton;
    Label6: TLabel;
    Label7: TLabel;
    DatosTablaCupon: TcxGridDBTableView;
    TablaCuponLevel1: TcxGridLevel;
    TablaCupon: TcxGrid;
    txtFolioCupon: TcxButtonEdit;
    Label9: TLabel;
    imgAyudaCupo: TImage;
    TM_Cupones: TRxMemoryData;
    DS_Cupones: TDataSource;
    TM_CuponesSerie: TStringField;
    TM_CuponesFolio: TStringField;
    TM_CuponesImporte: TFloatField;
    DatosTablaCuponColumn1: TcxGridDBColumn;
    DatosTablaCuponColumn2: TcxGridDBColumn;
    DatosTablaCuponColumn3: TcxGridDBColumn;
    btnTransferirACupon: TcxButton;
    DatosTablaCuponColumn4: TcxGridDBColumn;
    TM_CuponesTipoPago: TIntegerField;
    txtTipoPago: TcxLookupComboBox;
    Label8: TLabel;
    Q_TipoPagoCup: TQuery;
    DS_TipoPagoCup: TDataSource;
    Q_TipoPagoCupCLAVE: TStringField;
    Q_TipoPagoCupDESCRIPCION: TStringField;
    DatosTablaCuponColumn5: TcxGridDBColumn;
    TM_Detallado: TRxMemoryData;
    DS_Detallado: TDataSource;
    TM_DetalladoFolio: TIntegerField;
    TM_DetalladoPago: TStringField;
    TM_DetalladoTurno: TIntegerField;
    TM_DetalladoImporte: TFloatField;
    pDatos: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    TM_Ajuste: TRxMemoryData;
    TM_AjusteImporte: TFloatField;
    TM_AjusteTurno: TIntegerField;
    TM_AjusteEfectivo: TFloatField;
    TM_DetalladoDisponible: TBooleanField;
    TM_Rcupon: TRxMemoryData;
    TM_RcuponFolio: TIntegerField;
    TM_RcuponTurnoLiq: TIntegerField;
    TM_RcuponSerie: TIntegerField;
    TM_RcuponImporte: TFloatField;
    TM_RcuponFolioLiq: TIntegerField;
    pBotones: TPanel;
    cxButton1: TcxButton;
    btnGuardar: TcxButton;
    btnCancelar: TcxButton;
    btnBitacora: TcxButton;
    TM_CuponesSerieFolio: TStringField;
    TM_RcuponSerieFolio: TStringField;
    dtFecha: TDateTimePicker;
    TM_CuponesImporteOriginal: TFloatField;
    procedure btnMontosClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnTransferirAValClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure txtFolioCuponKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtFolioCuponPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure DatosTablaCuponColumn4PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure btnTransferirACuponClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure txtEfectivoATransKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnBitacoraClick(Sender: TObject);
    procedure txtEfectivoATransPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    cvValesPendientes:Integer;
    cvEfectivo:Integer;

    SerieEnCupones:Boolean;
    NumeroFolioCupones:Integer;

    MontoTransferido:Double;
    NumCuponesRec:Integer;

    Transferir:TEstatusTransferencia;

    procedure ValidaAjustador;

    procedure LeeCupon;
    procedure RecuperaCupon;

    procedure CargaTablaDetalle;
    procedure CargaTablaAjusteTurno;

    procedure CargaPaginaVale;
    procedure CargaPaginaCupon;

    procedure CargaMontosConTabla;

    procedure GuardarMovimientos;
  public
    procedure PreparaForma;
  end;

var
  FLIQRECVALE: TFLIQRECVALE;

implementation

uses DDMGAS, ULIBGRAL, ULIBDATABASE, DDMAJUS, DDMGEN, DDMCUP, UGEN_NET,
  UAutoriza, ULIQCONSRV;

{$R *.dfm}

procedure TFLIQRECVALE.ValidaAjustador;
begin
  try
    with DMAJUS do begin
      DBAJUS1.close;
      DBAJUS1.AliasName := DMGEN.VarComp('AliasAuxiliar');
      DBAJUS1.open;
    end;
  except
    on e:EDatabaseError do raise Exception.Create('Alias mal configurado.');
    on e:Exception do raise Exception.Create('Error al intentar proceso automático.'+#10#13+e.Message);
  end;
end;

procedure TFLIQRECVALE.CargaTablaDetalle;

function TipoPagos:String;
begin
  with DMGAS do begin
    try
      Result := '(';

      //EFECTIVO
      Result := Result + IntToStr(cvEfectivo);

      //VALES PENDIENTES
      Result := Result + ', ' + IntToStr(cvValesPendientes);

      //CUPONES
      Q_TipoPagoCup.First;
      while not(Q_TipoPagoCup.Eof) do begin
        Result := Result + ', ' + Q_TipoPagoCupCLAVE.AsString;
        Q_TipoPagoCup.Next;
      end;

    finally
      Result := Result + ')';

      Q_TipoPagoCup.First;
    end;
  end;
end;

begin
  with DMGAS do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiEntero2.FieldKind:=fkInternalCalc;
      Q_AuxiStr2.FieldKind:=fkInternalCalc;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;

      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT TURNO AS Entero1, FOLIO AS Entero2, CLAVE_PAGO AS Str2, IMPORTE AS Real1 FROM DGASDLIQP');
      Q_Auxi.SQL.Add('WHERE ESTACION = ' + IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('AND FECHA = ' + QuotedStr(FechaToStrSQL(dtFecha.Date)));
      Q_Auxi.SQL.Add('AND CLAVE_PAGO IN ' + TipoPagos);
      Q_Auxi.SQL.Add('ORDER BY TURNO, FOLIO');

      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Q_Auxi.First;

      while not(Q_Auxi.Eof) do begin
        TM_Detallado.Append;
        TM_DetalladoFolio.AsInteger := Q_AuxiEntero2.AsInteger;
        TM_DetalladoTurno.AsInteger := Q_AuxiEntero1.AsInteger;
        TM_DetalladoPago.AsString := Q_AuxiStr2.AsString;
        TM_DetalladoImporte.AsFloat := Q_AuxiReal1.AsFloat;
        TM_DetalladoDisponible.AsBoolean := False;
        TM_Detallado.Post;

        Q_Auxi.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQRECVALE.CargaTablaAjusteTurno;
begin
  with DMGAS, DMAJUS do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;

      Q_Auxi.SQL.Add('SELECT TURNO AS Entero1, SUM(IMPORTE) AS Real1 FROM DGASDLIQP');
      Q_Auxi.SQL.Add('WHERE ESTACION = ' + IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('AND CLAVE_PAGO = ' + IntToStr(cvEfectivo));
      Q_Auxi.SQL.Add('AND FECHA = ' + QuotedStr(FechaToStrSQL(dtFecha.Date)));
      Q_Auxi.SQL.Add('GROUP BY TURNO');

      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Q_Auxi.First;

      while not(Q_Auxi.Eof) do begin
        try
          Q_AuxiAjus.Close;
          Q_AuxiAjusReal1.FieldKind:=fkInternalCalc;
          Q_AuxiAjus.SQL.Clear;

          Q_AuxiAjus.SQL.Add('SELECT SUM((VOLUMEN1 - VOLUMEN2) * PRECIO) AS Real1 FROM CLAVES');
          Q_AuxiAjus.SQL.Add('WHERE FECHAADMIN = ' + QuotedStr(FechaToStrSQL(dtFecha.Date)));
          Q_AuxiAjus.SQL.Add('AND TURNOADMIN = ' + Q_AuxiEntero1.AsString);

          Q_AuxiAjus.Prepare;
          Q_AuxiAjus.Open;

          TM_Ajuste.Append;
          TM_AjusteTurno.AsInteger := Q_AuxiEntero1.AsInteger;
          TM_AjusteImporte.AsFloat := Q_AuxiAjusReal1.AsFloat;
          TM_AjusteEfectivo.AsFloat := Q_AuxiReal1.AsFloat;
          TM_Ajuste.Post;
        finally
          Q_AuxiAjus.Close;
        end;

        Q_Auxi.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQRECVALE.PreparaForma;

function buscaCvVales:Integer;
begin
  Result := 0;

  with DMGAS do begin
    try
      Q_Auxi.Close;
      Q_AuxiStr2.FieldKind:=fkInternalCalc;

      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT CLAVE AS Str2 FROM DGASTPAG');
      Q_Auxi.SQL.Add('WHERE CLASE = ' + QuotedStr('Vale Pendiente'));
      Q_Auxi.SQL.Add('AND ACTIVO = ' + QuotedStr('Si'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      //Si encontró mas de un resultado envia error
      if (Q_Auxi.RecordCount = 1) then Result := StrToInt(Q_AuxiStr2.AsString);
      if (Q_Auxi.RecordCount > 1) then Result := -1;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

function buscaCvEfectivo:Integer;
begin
  Result := 0;

  with DMGAS do begin
    try
      Q_Auxi.Close;
      Q_AuxiStr2.FieldKind:=fkInternalCalc;

      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT CLAVE AS Str2 FROM DGASTPAG');
      Q_Auxi.SQL.Add('WHERE CLASE = ' + QuotedStr('Efectivo'));
      Q_Auxi.SQL.Add('AND ACTIVO = ' + QuotedStr('Si'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      //Si encontró mas de un resultado envia error
      if (Q_Auxi.RecordCount = 1) then Result := StrToInt(Q_AuxiStr2.AsString);
      if (Q_Auxi.RecordCount > 1) then Result := -1;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

begin
  //Valida conexíón con ajustador
  ValidaAjustador;

  //Estado de controles
  TM_Cupones.Active := True;
  TM_Detallado.Active := True;
  TM_Ajuste.Active := True;
  TM_Rcupon.Active := True;

  pValesPendientes.TabVisible := False;
  pRecuperarCupon.TabVisible := False;

  //SOLO PROGRAMADORES
  pDatos.TabVisible := (DebugHook > 0);

  btnBitacora.Enabled := False;
  btnCancelar.Enabled := False;
  btnGuardar.Enabled := False;

  //Obtiene clave de efectivo
  cvEfectivo := buscaCvEfectivo;

  if (buscaCvEfectivo = 0) then Raise Exception.Create('No se encontró un tipo de pago con clase "Efectivo" configurado.');
  if (buscaCvEfectivo = -1) then Raise Exception.Create('Solo debe existir un tipo de pago con clase "Efectivo" configurado.');

  //Obtiene clave de vales pendientes y valida
  cvValesPendientes := buscaCvVales;

  if (cvValesPendientes = 0) then Raise Exception.Create('No se encontró un tipo de pago con clase "Vale Pendiente" configurado.');
  if (cvValesPendientes = -1) then Raise Exception.Create('Solo debe existir un tipo de pago con clase "Vale Pendiente" configurado.');

  //Btiene tipos de pagos de cupones y valida
  Q_TipoPagoCup.Active := True;
  if (Q_TipoPagoCup.RecordCount = 0) then Raise Exception.Create('No se encontró un tipo de pago con clase "Cupón" configurado.');

  dtFecha.Date := FechaTrabajo;

  //Variables
  SerieEnCupones := (DMGAS.VarGasSerieEnBarrasCupones = 'Si');
  NumeroFolioCupones := DMGAS.VarGasDigitosCupon;

  Transferir := Nula;
  MontoTransferido := 0;
end;

procedure TFLIQRECVALE.btnMontosClick(Sender: TObject);
begin
  //Asigna valor default al componente de fecha
  //if (dtFecha. .Text = EmptyStr) then dtFecha.Date := := FechaTrabajo;

  //Carga TABLA
  CargaTablaDetalle;

  if (TM_Detallado.IsEmpty) then begin
    MensajeInfo('No se encontrarón turnos liquidados en la fecha seleccionada.');
    dtFecha.SetFocus();
    Exit;
  end;

  if not(TM_Detallado.Locate('Pago', cvValesPendientes,[])) then begin
    MensajeInfo('No se encontró el tipo de pago Vale Pendiente en las liquidaciones del día seleccionado.');
    dtFecha.SetFocus();
    Exit;
  end;

  TM_Detallado.First;

  //Carga Ajuste
  CargaTablaAjusteTurno;

  //Carga totales
  CargaMontosConTabla;

  //Carga paginas
  CargaPaginaVale;
  CargaPaginaCupon;

  btnCancelar.Enabled := True;
  btnBitacora.Enabled := True;
  dtFecha.Enabled := False;
  btnMontos.Enabled := False;

  Transferir := Nula;
  MontoTransferido := 0;
end;

procedure TFLIQRECVALE.CargaPaginaVale;
begin
  ChecaDerechoEspecialAutor3(idLiq,aeTransferirVales);

  if (FAutoriza.PassOk) then begin
    pValesPendientes.TabVisible := True;

    txtEfectivoATrans.Properties.MinValue := 0;
    txtEfectivoATrans.EditValue := txtEfectivo.Value;

    btnTransferirAVal.Enabled := not(txtEfectivoATrans.Value = 0);

    txtEfectivoATrans.SelectAll;

    Contenedor.ActivePage := pValesPendientes;
  end;
end;

procedure TFLIQRECVALE.CargaPaginaCupon;
begin
  ChecaDerechoEspecialAutor3(idLiq,aeTransferirCupones);

  if (FAutoriza.PassOk) then begin
    pRecuperarCupon.TabVisible := True;

    imgAyudaCupo.Hint := 'Número de dígitos: ' + IntToStr(NumeroFolioCupones);
    imgAyudaCupo.ShowHint := True;

    txtTipoPago.EditValue := Q_TipoPagoCupCLAVE.AsInteger;

    TM_Cupones.EmptyTable;

    Contenedor.ActivePage := pRecuperarCupon;
  end;
end;

procedure TFLIQRECVALE.CargaMontosConTabla;
var
  TotalE:Double;
  TotalV:Double;
  TotalC:Double;
begin
  TotalE := 0;
  TotalV := 0;
  TotalC := 0;

  TM_Detallado.First;
  while not(TM_Detallado.Eof) do begin
    if (TM_DetalladoImporte.AsFloat > 0) then begin
      //Efectivo
      if (TM_DetalladoPago.AsString = IntToStr(cvEfectivo)) then begin
        TotalE := TotalE + TM_DetalladoImporte.AsFloat
      end
      else begin
        //Vales P
        if (TM_DetalladoPago.AsString = IntToStr(cvValesPendientes)) then begin
          TotalV := TotalV + TM_DetalladoImporte.AsFloat
        end
        else begin
          //Cupon R
          Q_TipoPagoCup.First;
          while not(Q_TipoPagoCup.Eof) do begin
            if (TM_DetalladoPago.AsString = Q_TipoPagoCupCLAVE.AsString) then begin
              TotalC := TotalC + TM_DetalladoImporte.AsFloat
            end;

            Q_TipoPagoCup.Next;
          end;
        end;
      end;
    end;

    TM_Detallado.Next;
  end;

  TM_Ajuste.First;
  while not(TM_Ajuste.Eof) do begin
    TotalE := TotalE - TM_AjusteImporte.AsFloat;

    TM_Ajuste.Next;
  end;

  txtEfectivo.Value := TotalE;
  txtValesPendientes.Value := TotalV;
  txtCuponesRecuperados.Value := TotalC;
end;

procedure TFLIQRECVALE.LeeCupon;
var
  SerieCupon:Integer;
  FolioCupon:Integer;
  SerieCuponString:String;
  FolioCuponString:String;
  ImporteCupon:Double;
  Error:Boolean;

function ConsultaCupon(pSerie, pFolio:Integer):Double;
begin
  with DMGAS do begin
    try
      Result := 0;

      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;

      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT IMPORTE AS Real1 FROM DGASCUPO');
      Q_Auxi.SQL.Add('WHERE SERIE = ' + IntToStr(pSerie));
      Q_Auxi.SQL.Add('AND FOLIO = ' + IntToStr(pFolio));
      Q_Auxi.SQL.Add('AND ESTATUS = ' + QuotedStr('V'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      if (Q_Auxi.RecordCount > 0) then Result := Q_AuxiReal1.AsFloat;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

begin
  try
    Error := False;

    if (SerieEnCupones) then begin
      //Valida la longitud del folio capturado
      if (length(txtFolioCupon.Text) < NumeroFolioCupones + 1) then begin
        MensajeInfo('Error en folio.');
        Error := True;
        Exit;
      end;

      //Separa folio y serie de la cadena ingresada
      FolioCupon := StrToInt(copy(txtFolioCupon.Text, length(txtFolioCupon.Text) - NumeroFolioCupones + 1, length(txtFolioCupon.Text)));
      SerieCupon := StrToInt(copy(txtFolioCupon.Text, 1, length(txtFolioCupon.Text) - NumeroFolioCupones));

      SerieCuponString := IntToClaveNum(SerieCupon, 10 - NumeroFolioCupones);
      FolioCuponString := IntToClaveNum(FolioCupon, NumeroFolioCupones);
    end
    else begin

    end;

    //Valida cupón en lista
    if TM_Cupones.Locate('Serie;Folio',VarArrayOf([SerieCuponString,FolioCuponString]),[]) then begin
      MensajeInfo('Cupón ya se encuentra capturado.');
      Error := True;
      Exit;
    end;

    //Asigna importe a cupon
    ImporteCupon := ConsultaCupon(SerieCupon, FolioCupon);

    //Valida cupon
    if (ImporteCupon = 0) then begin
      MensajeInfo('No se encontró cupón vendido. Serie: ' + SerieCuponString + ' Folio: ' + FolioCuponString);
      Error := True;
      Exit;
    end;

    TM_Cupones.Append;
    TM_CuponesSerie.AsString := SerieCuponString;
    TM_CuponesFolio.AsString := FolioCuponString;
    TM_CuponesSerieFolio.AsString := txtFolioCupon.Text;
    TM_CuponesImporte.AsString := FormatFloat('#0.00', ImporteCupon);
    TM_CuponesImporteOriginal.AsString := FormatFloat('#0.00', ImporteCupon);
    TM_CuponesTipoPago.AsInteger := txtTipoPago.EditValue;
    TM_Cupones.Post;
  finally
    if (Error)
    then txtFolioCupon.SelectAll
    else txtFolioCupon.Clear;
  end;
end;

procedure TFLIQRECVALE.RecuperaCupon;
var
  CajaLiq:Integer;
  IslaLiq:Integer;

procedure ConsultaDatosLiq;
begin
  with DMCUP do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiEntero2.FieldKind:=fkInternalCalc;

      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT ISLA AS Entero1, CAJA AS Entero2 FROM DGASLIQG');
      Q_Auxi.SQL.Add('WHERE ESTACION = ' + IntToStr(DMGAS.EstacionActual));
      Q_Auxi.SQL.Add('AND FOLIO = ' + IntToStr(TM_RcuponFolioLiq.AsInteger));
      Q_Auxi.SQL.Add('AND TURNO = ' + IntToStr(TM_RcuponTurnoLiq.AsInteger));
      Q_Auxi.SQL.Add('AND FECHA = ' + QuotedStr(FechaToStrSQL(dtFecha.Date)));
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      IslaLiq := Q_AuxiEntero1.AsInteger;
      CajaLiq := Q_AuxiEntero2.AsInteger;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

begin
  with DMCUP do begin
    ConsultaDatosLiq;

    try
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('INSERT INTO DGASRCUP');
      Q_Auxi.SQL.Add('(ESTACION, CAJA, FECHA, TURNO, SERIE, CUPON, IMPORTE, TURNO_PVG, LIQUIDADO, ISLA_PVG)');
      Q_Auxi.SQL.Add('VALUES (:ESTACION, :CAJA, :FECHA, :TURNO, :SERIE, :CUPON, :IMPORTE, :TURNO_PVG, :LIQUIDADO, :ISLA_PVG)');

      Q_Auxi.Params[0].AsInteger := DMGAS.EstacionActual;
      Q_Auxi.Params[1].AsInteger := CajaLiq;
      Q_Auxi.Params[2].AsDateTime := dtFecha.Date;
      Q_Auxi.Params[3].AsInteger := TM_RcuponTurnoLiq.AsInteger;
      Q_Auxi.Params[4].AsInteger := TM_RcuponSerie.AsInteger;
      Q_Auxi.Params[5].AsFloat := StrToFloat(TM_RcuponFolio.AsString);
      Q_Auxi.Params[6].AsFloat := TM_RcuponImporte.AsFloat;
      Q_Auxi.Params[7].AsInteger := 0;
      Q_Auxi.Params[8].AsString := 'Si';
      Q_Auxi.Params[9].AsInteger := IslaLiq;

      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;

      NumCuponesRec := NumCuponesRec + Q_Auxi.RowsAffected;

      SP_Total_Rcup.ParamByName('P_Estacion').AsInteger := DMGAS.EstacionActual;
      SP_Total_Rcup.ParamByName('P_Caja').AsInteger := CajaLiq;
      SP_Total_Rcup.ParamByName('P_Fecha').AsDateTime := dtFecha.Date;
      SP_Total_Rcup.ParamByName('P_Turno').AsInteger := TM_RcuponTurnoLiq.AsInteger;
      SP_Total_Rcup.ExecProc;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQRECVALE.GuardarMovimientos;
var
  MontoEfectivo:Double;
  MontoVale:Double;
  MondoCupones:Double;

procedure Activa_DGASLIQTRIGGER2;
begin
  with DMGAS do begin
    try
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('ALTER TRIGGER DGASLIQGTRIGGER2 ACTIVE');
      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure DesActiva_DGASLIQTRIGGER2;
begin
   with DMGAS do begin
    try
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('ALTER TRIGGER DGASLIQGTRIGGER2 INACTIVE');
      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

begin
  with DMGAS do begin
    try
      //Valida transferencia
      if not((Transferir = ValesProceso) or (Transferir = CuponesProceso)) then raise Exception.Create('Error con el tipo de transferencia');
      //Valida num de cupones recuperados
      if ((Transferir = CuponesProceso) and (TM_Rcupon.RecordCount = 0)) then raise Exception.Create('El numero de cupones recuperados en memoria es 0');

      NumCuponesRec := 0;
      DesActiva_DGASLIQTRIGGER2;

      TM_Detallado.First;

      while not(TM_Detallado.Eof) do begin
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DGASDLIQP SET IMPORTE = ' + FloatToStr(TM_DetalladoImporte.AsFloat));
        Q_Auxi.SQL.Add('WHERE ESTACION = ' + IntToStr(EstacionActual));
        Q_Auxi.SQL.Add('AND FOLIO = ' + IntToStr(TM_DetalladoFolio.AsInteger));
        Q_Auxi.SQL.Add('AND CLAVE_PAGO = ' + TM_DetalladoPago.AsString);
        Q_Auxi.SQL.Add('AND FECHA = ' + QuotedStr(FechaToStrSQL(dtFecha.Date)));
        Q_Auxi.SQL.Add('AND TURNO = ' + IntToStr(TM_DetalladoTurno.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.ExecSQL;

        TM_Detallado.Next;
      end;

      //Guarda Bitacora
      if (Transferir = ValesProceso ) then begin
        MontoEfectivo := (MontoTransferido * -1);
        MontoVale := MontoTransferido;
        MondoCupones := 0;
      end
      else begin
        MontoEfectivo := 0;
        MontoVale := (MontoTransferido * -1);
        MondoCupones := MontoTransferido;
      end;

      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('INSERT INTO DLIQRECVALE');
      Q_Auxi.SQL.Add('(FECHA, HORA, ESTACION, CLAVE_USUARIO, USUARIO, EFECTIVO, VALES, CUPONES)');
      Q_Auxi.SQL.Add('VALUES (:Fecha, :Hora, ' +
                      IntToStr(DMGAS.EstacionActual) + ', '+
                      IntToStr(DMGEN.ClaveUsuarioActivo) + ', '+
                      QuotedStr(DMGEN.UsuarioActivo) + ', ' +
                      FloatToStr(MontoEfectivo) + ', ' +
                      FloatToStr(MontoVale) + ', ' +
                      FloatToStr(MondoCupones) + ')');

      Q_Auxi.Params[0].AsDateTime := dtFecha.Date;
      Q_Auxi.Params[1].AsDateTime := Now;

      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;

      if (Transferir = CuponesProceso) then begin
        //Recupera cupones
        if (TM_Rcupon.RecordCount > 0) then begin
          TM_Rcupon.First;

          while not(TM_Rcupon.Eof) do begin
            RecuperaCupon;

            TM_Rcupon.Next;
          end;

          TM_Rcupon.EmptyTable;

          if (NumCuponesRec = 1)
          then MensajeInfo('Se recuperó 1 cupón.')
          else MensajeInfo('Se recuperaron ' + IntToStr(NumCuponesRec) + ' cupones.');
        end;
      end;
    finally
      Activa_DGASLIQTRIGGER2;

      TM_Detallado.First;

      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQRECVALE.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQRECVALE.btnTransferirAValClick(Sender: TObject);
var
  TotalEfectivo:Double;
  Efectivo:Double;

  Turno:Integer;

  LimiteEfectivoPorTurno:Double;

  EfectivoTransferidoPorTurno:Double;
  EfectivoTransferidoPorMov:Double;
begin
  with DMGAS do begin
    try
      if (Transferir <> Nula) then begin
        if (MensajeConf('Por cuestiones de seguridad es necesario guardar la transferencia anterior antes de continuar.' + #13 + '¿Desea guardar la transferencia?') = mrYes) then begin
          GuardarMovimientos;

          Transferir := Nula;
          MontoTransferido := 0;

          btnGuardar.Enabled := False;
        end
        else Exit;
      end;

      Efectivo := StrToFloat(FormatFloat('#0.00',txtEfectivo.Value));
      TotalEfectivo := StrToFloat(FormatFloat('#0.00',txtEfectivoATrans.Value));

      //Validaciones
      if (Efectivo = 0) then begin
        MensajeInfo('No cuenta con efectivo suficiente.');
        Exit;
      end;

      if (TotalEfectivo < 0.5) then begin
        MensajeInfo('El valor de efectivo capturado no es válido.');
        Exit;
      end;

      if (TotalEfectivo > Efectivo) then begin
        MensajeInfo('El valor que desea transferir excede el importe de Efectivo.');
        Exit;
      end;

      if (MensajeConf('¿Desea transferir la cantidad de ' + txtEfectivoATrans.Text + ' a Vales Pendientes?') = mrYes) then begin
        MontoTransferido := TotalEfectivo;

        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_AuxiEntero2.FieldKind:=fkInternalCalc;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;

        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('SELECT TURNO AS Entero1, FOLIO AS Entero2, IMPORTE AS Real1 FROM DGASDLIQP');
        Q_Auxi.SQL.Add('WHERE ESTACION = ' + IntToStr(EstacionActual));
        Q_Auxi.SQL.Add('AND FECHA = ' + QuotedStr(FechaToStrSQL(dtFecha.Date)));
        Q_Auxi.SQL.Add('AND CLAVE_PAGO = ' + IntToStr(cvEfectivo));
        Q_Auxi.SQL.Add('AND IMPORTE > 0');
        Q_Auxi.SQL.Add('ORDER BY TURNO, FOLIO');

        Q_Auxi.Prepare;
        Q_Auxi.Open;
        Q_Auxi.First;

        Turno := 0;
        
        while not(Q_Auxi.Eof) do begin
          if (TotalEfectivo > 0) then begin
            //Si es un nuevo turno
            if not(Turno = Q_AuxiEntero1.AsInteger) then begin
              TM_Ajuste.Locate('Turno', Q_AuxiEntero1.AsInteger,[]);

              //Actualiza el limite de efectivo por turno
              LimiteEfectivoPorTurno := TM_AjusteEfectivo.AsFloat - TM_AjusteImporte.AsFloat;
              //Reinicia el contador de efectivo transferido por turno
              EfectivoTransferidoPorTurno := 0;
            end;

            Turno := Q_AuxiEntero1.AsInteger;

            if (LimiteEfectivoPorTurno >= EfectivoTransferidoPorTurno) then begin
              if ((LimiteEfectivoPorTurno - EfectivoTransferidoPorTurno) > Q_AuxiReal1.AsFloat)
              then EfectivoTransferidoPorMov := Q_AuxiReal1.AsFloat
              else EfectivoTransferidoPorMov := (LimiteEfectivoPorTurno - EfectivoTransferidoPorTurno);

              if (TotalEfectivo >= EfectivoTransferidoPorMov) then begin
                //Actualiza Efectivo
                if (TM_Detallado.Locate('Turno;Folio;Pago',VarArrayOf([Turno, Q_AuxiEntero2.AsInteger, cvEfectivo]),[])) then begin
                  TM_Detallado.Edit;
                  TM_DetalladoImporte.AsFloat := TM_DetalladoImporte.AsFloat - EfectivoTransferidoPorMov;
                  TM_Detallado.Post;
                end;

                TotalEfectivo := TotalEfectivo - EfectivoTransferidoPorMov;

                //Actualiza Vales
                if (TM_Detallado.Locate('Turno;Folio;Pago',VarArrayOf([Turno, Q_AuxiEntero2.AsInteger, cvValesPendientes]),[])) then begin
                  TM_Detallado.Edit;
                  TM_DetalladoImporte.AsFloat := TM_DetalladoImporte.AsFloat + EfectivoTransferidoPorMov;
                  TM_Detallado.Post;
                end;

                EfectivoTransferidoPorTurno := EfectivoTransferidoPorTurno + EfectivoTransferidoPorMov;
              end
              else begin
                //Actualiza Vales
                if (TM_Detallado.Locate('Turno;Folio;Pago',VarArrayOf([Turno, Q_AuxiEntero2.AsInteger, cvValesPendientes]),[])) then begin
                  TM_Detallado.Edit;
                  TM_DetalladoImporte.AsFloat := TM_DetalladoImporte.AsFloat + TotalEfectivo;
                  TM_Detallado.Post;
                end;

                //Actualiza Efectivo
                if (TM_Detallado.Locate('Turno;Folio;Pago',VarArrayOf([Turno, Q_AuxiEntero2.AsInteger, cvEfectivo]),[])) then begin
                  TM_Detallado.Edit;
                  TM_DetalladoImporte.AsFloat := TM_DetalladoImporte.AsFloat - TotalEfectivo;
                  TM_Detallado.Post;
                end;

                TotalEfectivo := 0;
              end;
            end;
          end;

          Q_Auxi.Next;
        end;

        Transferir := ValesProceso;
        
        CargaMontosConTabla;
        CargaPaginaVale;

        btnGuardar.Enabled := True;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQRECVALE.btnTransferirACuponClick(Sender: TObject);
var
  TotalVales:Double;
  TotalCuponCap:Double;

  ImporteVale:Double;

  TurnoLiq:Integer;
  FolioLiq:Integer;
begin
  with DMGAS do begin
    try
      if (Transferir <> Nula) then begin
        if (MensajeConf('Por cuestiones de seguridad es necesario guardar la transferencia anterior antes de continuar.' + #13 + '¿Desea guardar la transferencia?') = mrYes) then begin
          GuardarMovimientos;

          Transferir := Nula;
          MontoTransferido := 0;

          btnGuardar.Enabled := False;
        end
        else Exit;
      end;

      TotalVales := StrToFloat(FormatFloat('#0.00', txtValesPendientes.Value));

      //Validaciones
      if (TotalVales = 0) then begin
        MensajeInfo('No cuenta con vales pendientes.');
        Exit;
      end;

      if (TM_Cupones.RecordCount = 0) then begin
        MensajeInfo('Es necesario capturar los cupones que desea recuperar.');
        Exit;
      end;

      TotalCuponCap := DatosTablaCupon.DataController.Summary.FooterSummaryValues[0];

      if (TotalCuponCap < 0.5) then begin
        MensajeInfo('El valor de cupones capturado no es válido.');
        Exit;
      end;

      if (TotalCuponCap > TotalVales) then begin
        MensajeInfo('El valor que desea transferir excede el importe de vales pendientes.');
        Exit;
      end;

      if (MensajeConf('¿Desea transferir la cantidad de ' + FormatoMoneda(TotalCuponCap) + ' a cupones recuperados?') = mrYes) then begin
        MontoTransferido := TotalCuponCap;

        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_AuxiEntero2.FieldKind:=fkInternalCalc;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;

        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('SELECT TURNO AS Entero1, FOLIO AS Entero2, IMPORTE AS Real1 FROM DGASDLIQP');
        Q_Auxi.SQL.Add('WHERE ESTACION = ' + IntToStr(EstacionActual));
        Q_Auxi.SQL.Add('AND FECHA = ' + QuotedStr(FechaToStrSQL(dtFecha.Date)));
        Q_Auxi.SQL.Add('AND CLAVE_PAGO = ' + IntToStr(cvValesPendientes));
        Q_Auxi.SQL.Add('AND IMPORTE > 0');
        Q_Auxi.SQL.Add('ORDER BY TURNO, FOLIO');

        Q_Auxi.Prepare;
        Q_Auxi.Open;
        Q_Auxi.First;

        TM_Rcupon.EmptyTable;

        while not(Q_Auxi.Eof) do begin
          TurnoLiq := Q_AuxiEntero1.AsInteger;
          FolioLiq := Q_AuxiEntero2.AsInteger;

          if (TotalVales > 0) then begin
            if not(TM_Cupones.IsEmpty) then begin
              TM_Detallado.Locate('Turno;Folio;Pago',VarArrayOf([TurnoLiq, FolioLiq, cvValesPendientes]),[]);

              if ((TM_DetalladoImporte.AsFloat + 0.0005) >= TM_CuponesImporte.AsFloat) then begin
                //Actualiza vales
                TM_Detallado.Edit;
                TM_DetalladoImporte.AsFloat := TM_DetalladoImporte.AsFloat - TM_CuponesImporte.AsFloat;
                TM_Detallado.Post;

                TotalVales := TotalVales - TM_CuponesImporte.AsFloat;

                //Actualiza Cupones
                TM_Detallado.Locate('Turno;Folio;Pago',VarArrayOf([TurnoLiq, FolioLiq, TM_CuponesTipoPago.AsInteger]),[]);
                TM_Detallado.Edit;
                TM_DetalladoImporte.AsFloat := TM_DetalladoImporte.AsFloat + TM_CuponesImporte.AsFloat;
                TM_Detallado.Post;

                //Agrega a lista de recuperación
                TM_Rcupon.Append;
                TM_RcuponTurnoLiq.AsInteger := TurnoLiq;
                TM_RcuponFolioLiq.AsInteger := FolioLiq;
                TM_RcuponSerie.AsInteger := TM_CuponesSerie.AsInteger;
                TM_RcuponFolio.AsInteger := TM_CuponesFolio.AsInteger;
                TM_RcuponImporte.AsFloat := TM_CuponesImporteOriginal.AsFloat;
                TM_RcuponSerieFolio.AsString := TM_CuponesSerieFolio.AsString;
                TM_Rcupon.Post;

                //Elimina cupón de lista
                TM_Cupones.Delete;
              end
              else begin
                ImporteVale := TM_DetalladoImporte.AsFloat;

                //Actualiza vales
                TM_Detallado.Edit;
                TM_DetalladoImporte.AsFloat := TM_DetalladoImporte.AsFloat - ImporteVale;
                TM_Detallado.Post;

                TotalVales := TotalVales - ImporteVale;

                //Actualiza Cupones
                TM_Detallado.Locate('Turno;Folio;Pago',VarArrayOf([TurnoLiq, FolioLiq, TM_CuponesTipoPago.AsInteger]),[]);
                TM_Detallado.Edit;
                TM_DetalladoImporte.AsFloat := TM_DetalladoImporte.AsFloat + ImporteVale;
                TM_Detallado.Post;

                TM_Cupones.Edit;
                TM_CuponesImporte.AsFloat := TM_CuponesImporte.AsFloat - ImporteVale;
                TM_Cupones.Post;

                Q_Auxi.Next;
              end;
            end
            else Q_Auxi.Next;
          end
          else Q_Auxi.Next;
        end;

        Transferir := CuponesProceso;

        CargaMontosConTabla;
        CargaPaginaCupon;

        btnGuardar.Enabled := True;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQRECVALE.btnCancelarClick(Sender: TObject);
begin
  if (MensajeConf('¿Desea cancelar la transferencia?') = mrYes) then begin
    TM_Detallado.EmptyTable;
    TM_Cupones.EmptyTable;
    TM_Rcupon.EmptyTable;
    TM_Ajuste.EmptyTable;

    pValesPendientes.TabVisible := False;
    pRecuperarCupon.TabVisible := False;

    Transferir := Nula;
    MontoTransferido := 0;

    btnBitacora.Enabled := False;
    btnCancelar.Enabled := False;
    btnGuardar.Enabled := False;
    dtFecha.Enabled := True;
    btnMontos.Enabled := True;

    txtEfectivo.Clear;
    txtValesPendientes.Clear;
    txtCuponesRecuperados.Clear;

    dtFecha.SetFocus;
  end;
end;

procedure TFLIQRECVALE.txtFolioCuponKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key in [13,9,40] then LeeCupon;
end;

procedure TFLIQRECVALE.txtFolioCuponPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  LeeCupon;
end;

procedure TFLIQRECVALE.DatosTablaCuponColumn4PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if (MensajeConf('¿Desea eliminar cupón capturado?') = mrYes) then begin
    if not TM_Cupones.Eof then TM_Cupones.Delete;
  end;
end;

procedure TFLIQRECVALE.btnGuardarClick(Sender: TObject);
begin
  if (MensajeConf('¿Desea guardar la transferencia?') = mrYes) then begin
    GuardarMovimientos;

    Transferir := Nula;
    MontoTransferido := 0;

    btnGuardar.Enabled := False;
  end;
end;

procedure TFLIQRECVALE.txtEfectivoATransKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = 13 then btnTransferirAValClick(nil);
end;

procedure TFLIQRECVALE.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Transferir <> Nula) then
    if (MensajeConf('¿Desea guardar la transferencia antes de salir?') = mrYes) then GuardarMovimientos;
end;

procedure TFLIQRECVALE.btnBitacoraClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQCONSRV,FLIQCONSRV);
  try
    FLIQCONSRV.PreparaReporte;
    FLIQCONSRV.QuickRep1.Preview;
  finally
    FLIQCONSRV.Free;
  end;
end;

procedure TFLIQRECVALE.txtEfectivoATransPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if (Error) then Error := False;
end;

end.

