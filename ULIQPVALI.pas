unit ULIQPVALI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQPVALI = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape3: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRLabel15: TQRLabel;
    QRLabel3: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    pestacion,
    pcaja,
    pturno:integer;
    pfecha:tdatetime;
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

var
  FLIQPVALI: TFLIQPVALI;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
  ULIQPVAL, DDMLIQ, ULIQTURC;

{$R *.DFM}

procedure TFLIQPVALI.PreparaReporte;
var tcant:integer;
    timp:double;
begin
  with DMGEN,DMGAS,DMLIQ do begin
    T_Pval.First;
    BndDt.Items.Clear;
    tcant:=0; timp:=0;
    while not T_Pval.Eof do begin
      if VarGasUtilizarReferencia='Si' then
        xlin:='D//'+InttoClaveCata(T_PvalCliente.AsInteger,idClie)+'  ['+IntToClaveNum(T_PvalSubCodigo.AsInteger,2)+']//'
      else
        xlin:='D//'+InttoClaveCata(T_PvalCliente.AsInteger,idClie)+'//';
      xlin:=xlin+T_PvalNombreCliente.AsString+'//'+
                 IntToStr(T_PvalSubCodigo.AsInteger)+'//'+
                 FormatoMoneda(T_PvalCantidad.AsInteger)+'//'+FormatoMoneda(T_PvalTotal.AsFloat);
      BndDt.Items.Add(xlin);
      tcant:=tcant+T_PvalCantidad.AsInteger;
      timp:=timp+T_PvalTotal.AsFloat;
      T_Pval.Next;
    end;
    xlin:='T// //  // //'+FormatoMoneda(tcant)+'//'+FormatoMoneda(timp);
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQPVALI.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    if FLIQTURC<>nil then begin
      if FLIQTURC.QL_TurcESTATUS.AsString='C' then
        QRLEnca.Caption:=FLIQTURC.QL_TurcDescripTurno.AsString+'         Cajero:  '+FLIQTURC.QL_TurcNombreCajero.AsString
      else
        QRLEnca.Caption:=QT_TurcaDescripTurno.AsString+'         Cajero:  '+QT_TurcaNomCajero.AsString;
    end
    else
      QRLEnca.Caption:=QT_TurcaDescripTurno.AsString+'         Cajero:  '+QT_TurcaNomCajero.AsString;
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQPVALI.BndDtBeforePrint(Sender: TQRCustomBand;
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
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Frame.DrawTop:=swenabled;
      end;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(11,15);
  HabilitaShapes(14,15,false);
  ExtraeEtiquetas(11,15);
  Case xtp of
    'T':HabilitaShapes(14,15,true);
  end;
end;

end.
