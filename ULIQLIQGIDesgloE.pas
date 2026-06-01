unit ULIQLIQGIDesgloE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQLIQGIDesgloE = class(TForm)
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
    QRLabelDeta:array [1..3] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;

var
  FLIQLIQGIDesgloE: TFLIQLIQGIDesgloE;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  swaceites:boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQLIQG;

{$R *.DFM}

procedure TFLIQLIQGIDesgloE.CreaEtiquetas;
var i:integer;
begin
  xw:=78;
  xl:=xLeft;
  for i:=1 to 3 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Denominacion';
        2:Caption:='cantidad';
        3:Caption:='Importe';
      end;
      Case i of
        1:xw:=80;
        2:xw:=80;
        3:xw:=80;
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
      if i in [1..3] then Alignment :=taRightJustify
      else Alignment :=taLeftJustify;
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


procedure TFLIQLIQGIDesgloE.PreparaReporte;
var xtotd:real;
begin
  with DMGEN,DMLIQ do begin
    CreaEtiquetas;
    xtotd:=0;
    BndDt.Items.Clear;
    T_Dliqp.First;
    while not T_Dliqp.Eof do begin
      if T_DliqpDesglosa.AsString='Si' then begin
        if T_Dliqe.IsEmpty then begin
          T_Dliqp.Next;
          Continue;
        end;
        xlin:='E//';
        InsertaElemStr(T_DliqpDescripcionPago.AsString,2,xlin);
        BndDt.Items.Add(xlin);
        T_Dliqe.First;
        while not T_Dliqe.Eof do begin
          xlin:='D//'+FormatoMoneda(T_DliqeDENOMINACION.AsFloat)+'//'+
                      FormatoMoneda(T_DliqeCANTIDAD.AsFloat)+'//'+
                      FormatoMoneda(T_DliqeIMPORTE.AsFloat);
          BndDt.Items.Add(xlin);
          xtotd:=xtotd+T_DliqeIMPORTE.AsFloat;
          T_Dliqe.Next;
        end;
        xlin:='T//';
        InsertaElemStr(FormatoMoneda(xtotd),4,xlin);
        BndDt.Items.Add(xlin);
      end;
      T_Dliqp.Next;
    end;
  end;
end;

procedure TFLIQLIQGIDesgloE.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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

procedure TFLIQLIQGIDesgloE.BndDtBeforePrint(Sender: TQRCustomBand;
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
          if k=3 then Frame.DrawTop:=true;
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
  InicializaEtiquetas(1,3);
  ExtraeEtiquetas(1,3);
end;

procedure TFLIQLIQGIDesgloE.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp in ['T','E'];
end;

procedure TFLIQLIQGIDesgloE.QRLabel1Print(sender: TObject; var Value: String);
begin
  Value:=DMLIQ.T_LiqgNombreDespachador.AsString;
end;

end.
