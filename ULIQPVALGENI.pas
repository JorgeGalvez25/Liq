unit ULIQPVALGENI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQPVALGENI = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLRango: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRLabel12: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    ChildBand2: TQRChildBand;
    QRShape6: TQRShape;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaReporte;

  end;

var
  FLIQPVALGENI: TFLIQPVALGENI;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, UAVANCE, DDMCUP, DDMGAS, DDMGASQ,
     ULIQPVALGEN;

{$R *.DFM}

procedure TFLIQPVALGENI.PreparaReporte;
var tot1,
    tot2:double;
begin
  with DMGEN,DMGAS,FLIQPVALGEN do begin
    tot1:=0; tot2:=0;
    TT_Auxi.First;
    BndDt.Items.Clear;
    while not TT_Auxi.Eof do begin
      xlin:='D//'+IntToClaveCata(TT_AuxiCliente.AsInteger,idClie)+'//'+TT_AuxiNombre.AsString+'//'+
                  FormatoMoneda(TT_AuxiCantidad.AsFloat)+'//'+FormatoMoneda(TT_AuxiTotal.AsFloat);
      BndDt.Items.Add(xlin);
      tot1:=tot1+TT_AuxiCantidad.AsFloat;
      tot2:=tot2+TT_AuxiTotal.AsFloat;
      TT_Auxi.Next;
    end;
    xlin:='T// // //'+FormatoMoneda(tot1)+'//'+FormatoMoneda(tot2);
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQPVALGENI.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
  with DMGEN do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLRango.Caption:='Fecha de Corte: '+FechaAlf(VgFechaIni);
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;

end;

procedure TFLIQPVALGENI.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Font.Size:=8;
        Font.Color:=clWindowText;
        Frame.DrawTop:=false;
        if xtp in ['T','E','R'] then Font.Style:=[fsBold];
        if xtp='S' then begin
          Font.Style:=[fsbold];
          Font.Color:=StringtoColor(DMGEN.QT_EmprColor.Asstring);
          Font.Size:=9;
        end;
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
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Frame.DrawTop:=swenabled;
      end;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(11,14);
  HabilitaShapes(13,14,false);
  ExtraeEtiquetas(11,14);
  Case xtp of
    'T':HabilitaShapes(13,14,true);
  end;
end;

procedure TFLIQPVALGENI.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=(xtp='T');
end;

end.
