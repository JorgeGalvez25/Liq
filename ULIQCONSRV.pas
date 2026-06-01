unit ULIQCONSRV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, Db, Printers, DBTables;

type
  TFLIQCONSRV = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    ChBEnca: TQRChildBand;
    BndDt: TQRStringsBand;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    Q_Bitacora: TQuery;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLEnca: TQRLabel;
    QRLEstacion: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  public
    procedure PreparaReporte;
  end;

var
  FLIQCONSRV: TFLIQCONSRV;
  xtp:char;
  xlin:string;

implementation

uses
  DDMGEN, DDMGAS, DDMGASQ, ULIBDATABASE, ULIBGRAL, UGEN_NET, UAVANCE, ULIQRECVALE,
  ComCtrls;

{$R *.dfm}

procedure TFLIQCONSRV.PreparaReporte;
begin
  try
    Q_Bitacora.Close;
    Q_Bitacora.Params[0].AsInteger := DMGAS.EstacionActual;
    Q_Bitacora.Params[1].AsDateTime := FLIQRECVALE.dtFecha.Date;
    Q_Bitacora.Prepare;
    Q_Bitacora.Open;
    Q_Bitacora.First;

    FAvance.PreparaAvance('Consultando movimientos...', True, Q_Bitacora.RecordCount);
    while not(Q_Bitacora.Eof) do begin
      xlin:='D//' + FormatDateTime(ShortDateFormat, Q_Bitacora.Fields[1].AsDateTime) + '//' +
                  FormatDateTime(LongTimeFormat, Q_Bitacora.Fields[1].AsDateTime) + '//' +
                  Q_Bitacora.Fields[2].AsString + '//' +
                  FormatoMoneda(Q_Bitacora.Fields[3].AsFloat) + '//' +
                  FormatoMoneda(Q_Bitacora.Fields[4].AsFloat)+ '//' +
                  FormatoMoneda(Q_Bitacora.Fields[5].AsFloat);

      BndDt.Items.Add(xlin);

      FAvance.AvanzaPosicion;
      Q_Bitacora.Next;
    end;
  finally
    FAvance.Close;
    Q_Bitacora.Close;
  end;
end;

procedure TFLIQCONSRV.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);

function ObtenerDir(xSucl:Integer):String;
begin
  with DMGEN do begin
    try
      try
        Result:='';

        Q_Auxi.Close;
        Q_AuxiStr40.FieldKind := fkInternalCalc;
        Q_AuxiStr50.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Clear;

        Q_Auxi.SQL.Add('SELECT DIRECCION AS Str40, POBLACION AS Str50 FROM DGENSUCL WHERE CLAVE = ' + IntToStr(xSucl));

        Q_Auxi.Prepare;
        Q_Auxi.Open;
      except
        on e:Exception do raise Exception.Create(e.Message);
      end;
    finally
      Result := Q_AuxiStr40.AsString+'    '+Q_AuxiStr50.Asstring+'    ';

      Q_Auxi.Close;
    end;
  end;
end;

begin
  with DMGEN,DMGASQ do begin
    if (PrinterActiva) then QuickRep1.PrinterSettings.PrinterIndex := Printer.PrinterIndex;

    QRLEmp.Font.Color := StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption := QT_EmprRazonSocial.AsString;
    QRLDir.Caption := QT_EmprDireccion.AsString + '    ' + QT_EmprPoblacion.Asstring + '    ' + QT_EmprRFC.AsString;
    QRLEstacion.Caption := DMGASQ.QT_EstsNOMBRE.AsString;
    QRLEnca.Caption := FechaAlf(FLIQRECVALE.dtFecha.Date);
    QRLRep.Caption := Caption;
  end;

  QRLSistema.Caption := IdSistNombre;
  QRLFechaHora.Caption := SetFechaHora(FechaToStr(Now));
end;

procedure TFLIQCONSRV.BndDtBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
      Caption:='';
      Font.Style:=[];
      Frame.DrawTop:=false;
      Font.Size:=8;
      Font.Color:=clWindowText;
      if xtp='X' then Font.Color:=clGrayText;
      if k=12 then Alignment:=taLeftJustify;
      if (xtp='T')or(xtp='M')or(xtp='E') then Font.Style:=[fsBold];
      if (xtp='X') and (k=12) then Alignment:=taRightJustify;
    end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k-9);
    end;
  end;

  procedure HabilitaShapes(ri,rf:integer;swenabled:boolean);
  var k:word;
  begin
    for k:=ri to rf do with TQRShape(FindComponent('QRShape'+IntToStr(k))) do begin
      Visible := swenabled;
    end;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(11,16);
  ExtraeEtiquetas(11,16);
  HabilitaShapes(1,5,False);
end;

end.
