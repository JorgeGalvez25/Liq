unit ULIQLIQIDesglo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQLIQGIDesglo = class(TForm)
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
    ChBEnca: TQRChildBand;
    BndDt: TQRStringsBand;
    QRLDesp: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    ChildBand1: TQRChildBand;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..4] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;

var
  FLIQLIQGIDesglo: TFLIQLIQGIDesglo;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  swaceites:boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQLIQG;

{$R *.DFM}

procedure TFLIQLIQGIDesglo.CreaEtiquetas;
var i:integer;
begin
  xw:=78;
  xl:=xLeft;
  for i:=1 to 4 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Cliente';
        2:Caption:='Nombre';
        3:Caption:='Referencia';
        4:Caption:='Importe';
      end;
      Case i of
        1:xw:=60;
        2:xw:=240;
        3:xw:=80;
        4:xw:=70;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      if i in [1,2] then Alignment :=taLeftJustify
      else Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=true;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      if i in [1..3] then Alignment :=taLeftJustify
      else Alignment :=taRightJustify;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=false;
      Frame.Width:=1;
    end;
    xl:=xl+xw+4;
  end;
end;


procedure TFLIQLIQGIDesglo.PreparaReporte;
var xtotd:real;
begin
  with DMGEN,DMLIQ do begin
    CreaEtiquetas;
    xtotd:=0;
    BndDt.Items.Clear;
    T_Dliqp.First;
    while not T_Dliqp.Eof do begin
      if T_DliqpDesglosa.AsString='Si' then begin
        if T_Dtpag.IsEmpty then begin
          T_Dliqp.Next;
          Continue;
        end;
        xlin:='E//';
        InsertaElemStr(T_DliqpDescripcionPago.AsString,3,xlin);
//        InsertaElemStr(FormatoMoneda(T_DliqpImporte.AsFloat),5,xlin);
        BndDt.Items.Add(xlin);
        T_Dtpag.First;
        while not T_Dtpag.Eof do begin
          xlin:='D//'+IntToClaveNum(T_DtpagCliente.AsInteger,5)+'//'+
                      T_DtpagNombre.AsString+'//'+
                      T_DtpagReferencia.AsString+'//'+
                      FormatoMoneda(T_DtpagImporte.AsFloat);
          BndDt.Items.Add(xlin);
          xtotd:=xtotd+T_DtpagImporte.AsFloat;
          T_Dtpag.Next;
        end;
        xlin:='T//';
        InsertaElemStr(FormatoMoneda(xtotd),5,xlin);
        BndDt.Items.Add(xlin);
      end;
      T_Dliqp.Next;
    end;
  end;
end;

procedure TFLIQLIQGIDesglo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i,xl,xw:word;
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEnca.Caption:='Liquidación No.: '+IntToClaveNum(DMLIQ.T_LiqgFolio.AsInteger,6)+'   Isla: '+IntToClaveNum(DMLIQ.T_LiqgIsla.AsInteger,2);       
    QRLDesp.Caption:='Despachador: '+DMLIQ.T_LiqgNombreDespachador.AsString;
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQLIQGIDesglo.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var i,xl,xw:word;

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with QRLabelDeta[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Font.Size:=8;
        if xtp='E' then Font.Style:=[fsBold];
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k=4 then Frame.DrawTop:=true;
        end;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDeta[k].Caption:=ExtraeElemStr(xlin,k-ri+2);
    end;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,4);
  ExtraeEtiquetas(1,4);
end;

procedure TFLIQLIQGIDesglo.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp in ['T','E'];
end;

procedure TFLIQLIQGIDesglo.QRLabel1Print(sender: TObject; var Value: String);
begin
  Value:=DMLIQ.T_LiqgNombreDespachador.AsString;
end;

end.
