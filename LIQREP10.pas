unit LIQREP10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

type
  TFLIQREP10 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLSistema: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape4: TQRShape;
    QRLabel3: TQRLabel;
    QRLHora: TQRLabel;
    QRSysData1: TQRSysData;
    ql_otros: TQuery;
    ql_vales: TQuery;
    QRShape10: TQRShape;
    QRSysData2: TQRSysData;
    QRShape3: TQRShape;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

var
  FLIQREP10: TFLIQREP10;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMCUP, DDMGAS, UCUPCONS01,
  UCUPTURC, DDMGASQ, LIQREP09P, LIQREP10P;

{$R *.DFM}

procedure TFLIQREP10.PreparaReporte;
TYPE
   struct = record
      fecha:string;
      contado:real;
      credito:real;
      vtotal:real;
   end;
var
   temp:array of struct;
   i,j:integer;
  t1,t2,t3:real;
begin
  with DMGEN,FCUPCONS01 do begin
   QL_OTROS.Close;
   QL_OTROS.ParamByName('estacion').asinteger:= FLIQREP10P.DBLookupComboBox2.KeyValue;
   QL_OTROS.ParamByName('fecha1').AsDate:=StrToDate(FLIQREP10P.MaskEdit3.text);
   QL_OTROS.ParamByName('fecha2').AsDate:=StrToDate(FLIQREP10P.MaskEdit4.text);
   QL_OTROS.Open;
   j:=ql_otros.RecordCount;
   SetLength(temp,j);
   for i:=0 to High(temp) do
    begin
      temp[i].fecha:='';
      temp[i].contado:=0;
      temp[i].credito:=0;
      temp[i].vtotal:=0;
    end;
   QL_OTROS.First;
   i:=0;
   while not QL_OTROS.eof do
     begin
       temp[i].fecha:=FechaPaq(ql_otros.Fields.Fields[0].AsDateTime);
       temp[i].contado:=ql_otros.Fields.Fields[1].AsFloat;
       QL_OTROS.Next;
       i:=i+1;
     end;
   QL_OTROS.CLOSE;
   QL_VALES.Close;
   QL_VALES.ParamByName('estacion').asinteger:=1;
   QL_VALES.ParamByName('fecha1').AsDate:=StrToDate(FLIQREP10P.MaskEdit3.text);
   QL_VALES.ParamByName('fecha2').AsDate:=StrToDate(FLIQREP10P.MaskEdit4.text);
   QL_VALES.Open;
   i:=0;
   while not QL_VALES.eof do
     begin
       temp[i].credito:=ql_vales.Fields.Fields[1].AsFloat;
       temp[i].vtotal:=temp[i].contado+temp[i].credito;
       QL_VALES.Next;
       i:=i+1;
     end;
   QL_VALES.CLOSE;
   t1:=0;   t2:=0;   t3:=0;
  for i:=0 to High(temp) do
    begin
      xlin:='D//'+temp[i].fecha+'//'+FormatoMoneda(temp[i].contado)+'//'+FormatoMoneda(temp[i].credito)+'//'+
            FormatoMoneda(temp[i].vtotal);
      BndDt.Items.Add(xlin);
      t1:=t1+temp[i].contado; t2:=t2+temp[i].credito; t3:=t1+temp[i].vtotal;
    end;
   BndDt.Items.Add('');
   xlin:='T//'+ 'TOTALES'+'//'+FormatoMoneda(t1)+'//'+FormatoMoneda(t2)+'//'+FormatoMoneda(t3);
   BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQREP10.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN,DMGASQ,DMGAS do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:='Reporte de ventas';
    QRLEnca.Caption:='Estacion: '+FLIQREP09P.DBLookupComboBox2.Text;
  end;
end;

procedure TFLIQREP10.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP10.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
//  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP10.BndDtBeforePrint(Sender: TQRCustomBand;
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

end.
