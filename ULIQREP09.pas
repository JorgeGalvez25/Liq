unit ULIQREP09;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

type
  TFLIQREP09 = class(TForm)
    QuickRep1: TQuickRep;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLSistema: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLHora: TQRLabel;
    QRSysData1: TQRSysData;
    QL_COMB: TQuery;
    QL_COMBFECHA: TDateTimeField;
    QL_COMBSUM: TFloatField;
    QL_COMBSUBTOTAL: TFloatField;
    QL_COMBIVA: TFloatField;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRShape10: TQRShape;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    procedure QRLESTBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QL_COMBCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

var
  FLIQREP09: TFLIQREP09;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMCUP, DDMGAS, UCUPCONS01,
  UCUPTURC, DDMGASQ,LIQREP09P;

{$R *.DFM}

procedure TFLIQREP09.PreparaReporte;
var
  t1,t2,t3:real;
  p1,p2,p3:real;
  c:integer;
begin
t1:=0; t2:=0; t3:=0; p1:=0; p2:=0; p3:=0;
c:=0;
  with DMGAS,DMGEN,FCUPCONS01 do begin
   QL_COMB.Close;
   QL_COMB.ParamByName('estacion').asinteger:=T_EstsClave.AsInteger;
   QL_COMB.ParamByName('fecha1').AsDate:=StrToDate(FLIQREP09P.MaskEdit3.text);
   QL_COMB.ParamByName('fecha2').AsDate:=StrToDate(FLIQREP09P.MaskEdit4.text);
   QL_COMB.Open;
   QL_COMB.First;
    while not QL_COMB.Eof do begin
      xlin:='D//'+FechaPaq(QL_COMBFECHA.AsDateTime)+'//'+FormatoMoneda(QL_COMBSUBTOTAL.AsFloat)+'//'+FormatoMoneda(QL_COMBIVA.AsFloat)+'//'+
            FormatoMoneda(QL_COMBSUM.AsFloat);
      t1:=t1+QL_COMBSUBTOTAL.AsFloat;
      t2:=t2+QL_COMBIVA.AsFloat;
      t3:=t3+QL_COMBSUM.AsFloat;
      BndDt.Items.Add(xlin);
      c:=c+1;
      QL_Comb.Next;
    end;
    p1:=t1/c; p2:=t2/c; p3:=t3/c;
    BndDt.Items.Add('PROMEDIO');
    xlin:='T//'+ 'TOTALES'+'//'+FormatoMoneda(t1)+'//'+FormatoMoneda(t2)+'//'+FormatoMoneda(t3);
    BndDt.Items.Add(xlin);
    BndDt.Items.Add('PROMEDIO');
    xlin:='P//'+ 'P. DIARIO'+'//'+FormatoMoneda(p1)+'//'+FormatoMoneda(p2)+'//'+FormatoMoneda(p3);
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQREP09.QRLESTBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN,DMGASQ,DMGAS do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:='Resumen de ventas de aceites';
    QRLEnca.Caption:='Estación: '+FLIQREP09P.DBLookupComboBox2.Text;
  end;
end;

procedure TFLIQREP09.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP09.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
//  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP09.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if (xtp='T')or(xtp='M') or(xtp='P') then Font.Style:=[fsBold];
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
  InicializaEtiquetas(11,14);
  HabilitaShapes(8,10,false);
  ExtraeEtiquetas(11,14);
  Case xtp of
    'T':HabilitaShapes(8,10,true);
  end;
end;

procedure TFLIQREP09.QL_COMBCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_CombSubTotal.AsFloat:=AjustaFloat(QL_COMBSUM.AsFloat/(1+VarGasIvaCombustible/100),2);
    QL_CombIva.AsFloat:=AjustaFloat(QL_CombSum.AsFloat-QL_CombSubTotal.AsFloat,2);
  end;
end;

end.
