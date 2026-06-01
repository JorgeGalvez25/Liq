unit ULIQREP44;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, Printers, DB, DBTables;

type
  TFLIQREP44 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRLEstacion: TQRLabel;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    BndDt: TQRStringsBand;
    ChildBand1: TQRChildBand;
    ChBEnca: TQRChildBand;
    Q_Cupones: TQuery;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    QRLabelEnca,
    QRLabelDeta:array [1..6] of TQRLabel;
    
    procedure CreaEtiquetas;
  public
    procedure PreparaReporte;
  end;

Const
  xLeft = 5;
  NoEti = 6;

var
  FLIQREP44: TFLIQREP44;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMGAS, DDMGASQ,
     UAVANCE, ULIBLICENCIAS, ULIQREP44P, DDMGEN_VTAS;

{$R *.dfm}

procedure TFLIQREP44.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then QuickRep1.PrinterSettings.PrinterIndex := Printer.PrinterIndex;

    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP44P.Estacion.Text;

    if FLIQREP44P.TodasEstaciones.Checked then QRLEstacion.Caption:='Todas las Estaciones';

    QRLEnca.Caption:=RangoFecha(VgFechaIni, VgFechaFin);
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;
end;

procedure TFLIQREP44.CreaEtiquetas;
var i,
    xIzquierda,
    xAncho:integer;
begin
  xIzquierda := xLeft;

  for i:=1 to NoEti do begin
    QRLabelEnca[i] := TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] := TQRLabel(BndDt.AddPrintable(TQRLabel));

    with QRLabelEnca[i] do begin
      Case i of
        1:Caption := 'Fecha Fac.';
        2:Caption := 'Estación';
        3:Caption := 'Estación Rec.';
        4:Caption := 'Fecha Rec.';
        5:Caption := 'Folio Cupón';
        6:Caption := 'Importe Cupón';
      end;

      Case i of
        1:xAncho := 80;
        2:xAncho := 200;
        3:xAncho := 200;
        4:xAncho := 80;
        5:xAncho := 80;
        6:xAncho := 80;
      end;

      Autosize := False;
      Left := xIzquierda;
      Width := xAncho;
      Top := 2;
      Alignment := taCenter;

      Font.Name := 'Arial';
      Font.Size := 8;
      Font.Style := [];

      Frame.DrawTop := False;
      Frame.DrawBottom := False;
      Frame.DrawLeft := False;
      Frame.DrawRight := not(i = NoEti);
      Frame.Width := 1;

      if (i in [1, 4, 5]) then Alignment := taCenter;
      if (i in [2, 3]) then Alignment := taLeftJustify;
      if (i = 6) then Alignment := taRightJustify;
    end;

    with QRLabelDeta[i] do begin
      Caption := EmptyStr;
      Autosize := False;
      Left := xIzquierda;
      Width := xAncho;
      Top := 2;
      Alignment := taRightJustify;
      Font.Name := 'Arial';
      Font.Size := 8;
      Font.Style := [];

      Frame.DrawTop := False;
      Frame.DrawBottom := False;
      Frame.DrawLeft := False;
      Frame.DrawRight := False;
      Frame.Width := 1;

      if (i in [1, 4, 5]) then Alignment := taCenter;
      if (i in [2, 3]) then Alignment := taLeftJustify;
      if (i = 6) then Alignment := taRightJustify;
    end;

    xIzquierda := xIzquierda + xAncho + 4;
  end;
end;

procedure TFLIQREP44.PreparaReporte;
var
  ClienteA:Integer;
  FacturaTexto:String;
  FacturaTextoActual:String;
  FechaRecuperacion:String;
  EstacionVta:String;
  EstacionRec:String;
  NuevaFactura:Boolean;
  TotalFactura:Double;
begin
  CreaEtiquetas;

  ClienteA := 0;
  FacturaTexto := EmptyStr;
  NuevaFactura := False;
  BndDt.Items.Clear;

  Q_Cupones.SQL.Add('SELECT SERIEFAC, FOLIOFAC, FECHAVENTA, ESTACION, FECHARECUP, SERIE, FOLIO, IMPORTE, NOCLIENTE, ESTACIONRECUP FROM DGASCUPO');
  Q_Cupones.SQL.Add('WHERE FECHAVENTA BETWEEN :FECHAINI AND :FECHAFIN');

  if not(FLIQREP44P.TodasEstaciones.Checked) then Q_Cupones.SQL.Add('AND ESTACION = :ESTACION');
  if not(FLIQREP44P.TodosClientes.Checked) then Q_Cupones.SQL.Add('AND NOCLIENTE = :NOCLIENTE');

  if (FLIQREP44P.SoloCuponesRecuperados.Checked)
  then Q_Cupones.SQL.Add('AND ESTATUS = ' + QuotedStr('R'))
  else Q_Cupones.SQL.Add('AND ESTATUS IN (' + QuotedStr('V') + ', ' + QuotedStr('R') + ')');

  Q_Cupones.SQL.Add('ORDER BY NOCLIENTE, SERIEFAC, FOLIOFAC');

  //Parametros
  Q_Cupones.ParamByName('FECHAINI').AsDateTime := VgFechaIni;
  Q_Cupones.ParamByName('FECHAFIN').AsDateTime := VgFechaFin;

  if not(FLIQREP44P.TodasEstaciones.Checked) then Q_Cupones.ParamByName('ESTACION').AsInteger := FLIQREP44P.Estacion.EditValue;
  if not(FLIQREP44P.TodosClientes.Checked) then Q_Cupones.ParamByName('NOCLIENTE').AsInteger := StrToInt(FLIQREP44P.Cliente.Text);

  Q_Cupones.Prepare;
  Q_Cupones.Open;

  if (Q_Cupones.RecordCount > 0) then begin
    Q_Cupones.First;

    FAvance.PreparaAvance('Preparando reporte...', True, Q_Cupones.RecordCount);

    while not(Q_Cupones.Eof) do begin
      //Nombre de factura
      FacturaTextoActual := Q_Cupones.FieldByName('SERIEFAC').AsString + '-' + IntToClaveNum(Q_Cupones.FieldByName('FOLIOFAC').AsInteger, 6);

      NuevaFactura := not(FacturaTexto = FacturaTextoActual);

      //Totales
      if (not(FacturaTexto = EmptyStr) and (NuevaFactura)) then begin
        xlin := 'T//TOTAL:// // // // //$' + FormatoMoneda(TotalFactura);
        BndDt.Items.Add(xlin);

        xlin := 'D// // // // // //';
        BndDt.Items.Add(xlin);
      end;

      //Nombre de cliente
      if not(ClienteA = Q_Cupones.FieldByName('NOCLIENTE').AsInteger) then begin
        ClienteA := Q_Cupones.FieldByName('NOCLIENTE').AsInteger;

        BuscaQuery(DMGEN_VTAS.QB_Clie, 'pNoClie', ClienteA);

        xlin := 'C//CLIENTE: ' + DMGEN.IntToClaveCata(DMGEN_VTAS.QB_ClieNOCLIE.AsInteger, idClie) + ' - ' + DMGEN_VTAS.QB_ClieNOMBRE.AsString;
        BndDt.Items.Add(xlin);
      end;

      //Factura
      if (NuevaFactura) then begin
        FacturaTexto := FacturaTextoActual;
        TotalFactura := 0;

        xlin := 'F//FACTURA: ' + FacturaTexto;
        BndDt.Items.Add(xlin);
      end;

      DMGAS.T_Ests.Locate('CLAVE', Q_Cupones.FieldByName('ESTACION').AsInteger,[]);
      EstacionVta := DMGAS.T_EstsNOMBRE.AsString;

      DMGAS.T_Ests.Locate('CLAVE', Q_Cupones.FieldByName('ESTACIONRECUP').AsInteger,[]);
      EstacionRec := DMGAS.T_EstsNOMBRE.AsString;

      if (Q_Cupones.FieldByName('FECHARECUP').AsString = EmptyStr) then begin
        FechaRecuperacion := 'No recuperado';
        EstacionRec := 'No recuperado';
      end
      else FechaRecuperacion := Q_Cupones.FieldByName('FECHARECUP').AsString;

      if (NuevaFactura) then begin
        xlin := 'D//' + Q_Cupones.FieldByName('FECHAVENTA').AsString
               + '//' + EstacionVta
               + '//' + EstacionRec
               + '//' + FechaRecuperacion
               + '//' + Q_Cupones.FieldByName('SERIE').AsString + IntToClaveNum(Q_Cupones.FieldByName('FOLIO').AsInteger, DMGAS.VarGasDigitosCupon)
               + '//$' + FormatoMoneda(Q_Cupones.FieldByName('IMPORTE').AsFloat);
      end
      else begin
        xlin := 'D// //'
               + '//' + EstacionRec
               + '//' + FechaRecuperacion
               + '//' + Q_Cupones.FieldByName('SERIE').AsString + IntToClaveNum(Q_Cupones.FieldByName('FOLIO').AsInteger, DMGAS.VarGasDigitosCupon)
               + '//$' + FormatoMoneda(Q_Cupones.FieldByName('IMPORTE').AsFloat);
      end;

      TotalFactura := TotalFactura + Q_Cupones.FieldByName('IMPORTE').AsFloat;

      BndDt.Items.Add(xlin);

      FAVANCE.AvanzaPosicion;
      Q_Cupones.Next;
    end;

    xlin := 'T//TOTAL:// // // // //' + FormatoMoneda(TotalFactura);
    BndDt.Items.Add(xlin);

    FAvance.Close;
  end;
end;

procedure TFLIQREP44.BndDtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);

procedure InicializaEtiquetas(ri,rf:integer);
var k:word;
begin
  for k:=ri to rf do with QRLabelDeta[k] do begin
    Caption := EmptyStr;
    Font.Style := [];
    Frame.DrawTop := False;
    Frame.DrawBottom := False;
    Font.Size := 8;
    Transparent := False;
    Autosize := False;
    Font.Color := clBlack;

    if (xtp = 'C') then begin
      if (k = 1) then begin
        Font.Style := [fsBold];
        Font.Color := StringtoColor(DMGEN.QT_EmprColor.Asstring);

        AutoSize := True;
        Left := 1;
        Alignment := taLeftJustify;

        BringToFront;
      end;
    end;

    if (xtp = 'F') then begin
      if (k = 1) then begin
        Font.Style := [fsBold];

        AutoSize := True;
        Left := 1;
        Alignment := taLeftJustify;

        BringToFront;
      end;
    end;

    if (xtp = 'D') then begin
      if (k = 1) then begin
        AutoSize := False;
        Left := 5;
        Width := 70;
        Top := 2;
        Alignment := taCenter;
        Font.Name := 'Arial';
        Font.Size := 8;
        Font.Style := [];
      end;
    end;

    if (xtp ='T') then begin
      Font.Style := [fsBold];
      
      if (k = 1) then Alignment := taLeftJustify;
      if (k = 6) then Frame.DrawTop := True;
    end;
  end;
end;

procedure ExtraeEtiquetas(ri,rf:integer);
var k:word;
begin
  for k:=ri to rf do QRLabelDeta[k].Caption:=ExtraeElemStr(xlin, k - ri + 2);
end;

begin
  BndDt.Frame.DrawBottom := False;

  xlin := BndDt.Item;
  xtp := StrtoChar(ExtraeElemStr(xlin, 1));

  InicializaEtiquetas(1, NoEti);
  ExtraeEtiquetas(1, NoEti);
end;

end.
