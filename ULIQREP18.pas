unit ULIQREP18;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

type
  TFLIQREP18 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel3: TQRLabel;
    QRLFechaHora: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QL_Ajud2: TQuery;
    QL_Ajud2ESTACION: TIntegerField;
    QL_Ajud2FECHA: TDateTimeField;
    QL_Ajud2COMBUSTIBLE: TIntegerField;
    QL_Ajud2VOLUMEN: TFloatField;
    QL_Ajud2VENTA: TFloatField;
    QL_Ajud2DIFERENCIA: TFloatField;
    QL_Ajud2PRECIO: TFloatField;
    QL_Ajud2TOTAL: TFloatField;
    QL_Ajud2NombreCombustible: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pestacion:integer;
    procedure PreparaReporte;
  end;

var
  FLIQREP18: TFLIQREP18;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMCUP, DDMGAS, DDMGASQ, ULIQREP18P,
  UAVANCE;

{$R *.DFM}

procedure TFLIQREP18.PreparaReporte;
var totd,totg:real;
    xfecha:TDateTime;
begin
  with DMGEN do begin
    totd:=0; totg:=0;
    BndDt.Items.Clear;
    QL_Ajud2.Close;
    QL_Ajud2.SQL.Clear;
    QL_Ajud2.SQL.Add('Select * from DGASAJUD2');
    QL_Ajud2.SQL.Add('Where Estacion='+IntToStr(pestacion));
    QL_Ajud2.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Ajud2.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    QL_Ajud2.SQL.Add('Order by Fecha,Combustible');
    QL_Ajud2.Prepare;
    QL_Ajud2.Open;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Ajud2.RecordCount);
      while not QL_Ajud2.Eof do begin
        totd:=0;
        xfecha:=QL_Ajud2Fecha.AsDateTime;
        xlin:='D//'+FechaPaq(QL_Ajud2Fecha.AsDateTime)+'//';
        while (xfecha=QL_Ajud2Fecha.AsDatetime)and(not QL_Ajud2.Eof) do begin
          xlin:=xlin+QL_Ajud2NombreCombustible.AsString+'//'+
                     FormatFloat('###,##0.00',QL_Ajud2Volumen.AsFloat)+'//'+
                     FormatFloat('###,##0.00',QL_Ajud2Venta.AsFloat)+'//'+
                     FormatFloat('###,##0.00',QL_Ajud2Diferencia.AsFloat)+'//'+
                     FormatFloat('###,##0.00',QL_Ajud2Precio.AsFloat)+'//'+
                     FormatoMoneda(QL_Ajud2Total.AsFloat);
          BndDt.Items.Add(xlin);
          xlin:='D// //';
          totd:=totd+QL_Ajud2Total.AsFloat;
          xfecha:=QL_Ajud2Fecha.AsDateTime;
          QL_Ajud2.Next;
        end;
        xlin:='T//';
        InsertaElemStr(FormatoMoneda(totd),8,xlin);
        BndDt.Items.Add(xlin);
        totg:=totg+totd;
      end;
    finally
      xlin:='T//';
      InsertaElemStr(FormatoMoneda(totg),8,xlin);
      BndDt.Items.Add(xlin);
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP18.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ,DMGAS do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=FLIQREP18.Caption;
    QRLEnca.Caption:=FLIQREP18P.DBLookupComboBox2.Text;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP18.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);


  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Font.Size:=8;
        if (xtp='T')or(xtp='M') then Font.Style:=[fsBold];
        if (xtp='T')and(k>16) then Frame.DrawTop:=true;
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
    for k:=ri to rf do
      TQRShape(FindComponent('QRShape'+IntToStr(k))).Enabled:=swenabled;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(11,17);
  ExtraeEtiquetas(11,17);
end;

procedure TFLIQREP18.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Ajud2.Close;
  end;
end;

end.
