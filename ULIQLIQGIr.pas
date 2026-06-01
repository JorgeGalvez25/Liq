unit ULIQLIQGIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
 TFLIQLIQGIR = class(TForm)
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
    QRLEstatus: TQRLabel;
    QL_Prec: TQuery;
    QL_PrecCOSTO: TFloatField;
    QL_PrecTASAIVA: TFloatField;
    ChildBand1: TQRChildBand;
    QL_Dliqc: TQuery;
    QL_DliqcESTACION: TIntegerField;
    QL_DliqcFECHA: TDateTimeField;
    QL_DliqcTURNO: TIntegerField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcCANTIDAD: TFloatField;
    QL_DliqcIMPORTE: TFloatField;
    QL_DliqcDescCombustible: TStringField;
    QL_Dliqa: TQuery;
    QL_DliqaESTACION: TIntegerField;
    QL_DliqaFECHA: TDateTimeField;
    QL_DliqaTURNO: TIntegerField;
    QL_DliqaPRODUCTO: TIntegerField;
    QL_DliqaSALDOINI: TFloatField;
    QL_DliqaENTRADAS: TFloatField;
    QL_DliqaDEVOL: TFloatField;
    QL_DliqaSALDOFIN: TFloatField;
    QL_DliqaVENTA: TFloatField;
    QL_DliqaIMPORTE: TFloatField;
    QL_DliqaNombreProducto: TStringField;
    QL_Dliqp: TQuery;
    QL_PrecFECHA: TDateTimeField;
    QL_PrecCOMBUSTIBLE: TIntegerField;
    QL_PrecPRECIO: TFloatField;
    QL_PrecIEPS: TFloatField;
    QL_DliqaPrecio_Civa: TFloatField;
    QL_DliqpESTACION: TIntegerField;
    QL_DliqpFECHA: TDateTimeField;
    QL_DliqpTURNO: TIntegerField;
    QL_DliqpCLAVE_PAGO: TStringField;
    QL_DliqpIMPORTE: TFloatField;
    QL_DliqpDescripcionPago: TStringField;
    QL_DliqcDEVOLUCION: TFloatField;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..10] of TQRLabel;
    procedure CreaEtiquetas;
    procedure IniciaEtiquetasCmb;
    procedure IniciaEtiquetasProd;
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;

var
  FLIQLIQGIR: TFLIQLIQGIR;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  SwAceites:boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQTURC;

{$R *.DFM}

procedure TFLIQLIQGIR.CreaEtiquetas;
var i:integer;
begin
  xl:=xLeft;
  for i:=1 to 10 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=78;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Bomba/Combustible';
        2:Caption:='Cantidad';
        3:Caption:='Prec.Unit';
        4:Caption:='Importe';
        5:Caption:='Imp.S/Iva';
        6:Caption:='Costo';
        7:Caption:='Utilidad';
        8:Caption:='%';
      end;
      if i=1 then xw:=150;
      if i=8 then xw:=40;
      if i in [2..7] then xw:=78;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      if i=1 then Alignment :=taLeftJustify
      else Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      if i=9 then Frame.DrawRight:=false
      else Frame.DrawRight:=true;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      if i=1 then Alignment :=taLeftJustify
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
    xl:=xl+xw+3;
  end;
end;

procedure TFLIQLIQGIR.IniciaEtiquetasCmb;
var i:word;
begin
  xl:=xLeft;
  for i:=1 to 10 do begin
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Bomba/Combustible';
        2:Caption:='Cantidad';
        3:Caption:='Prec.Unit';
        4:Caption:='Importe';
        5:Caption:='Imp.S/Iva';
        6:Caption:='Costo';
        7:Caption:='Utilidad';
        8:Caption:='%';
      end;
      if i=1 then xw:=150;
      if i=8 then xw:=40;
      if i in [2..7] then xw:=78;
      Left      :=xl;
      Width     :=xw;
    end;
    with QRLabelDeta[i] do begin
      Left      :=xl;
      Width     :=xw;
    end;
    xl:=xl+xw+3;
  end;
end;

procedure TFLIQLIQGIR.IniciaEtiquetasProd;
var i:word;
begin
  xl:=xleft;
  for i:=1 to 10 do begin
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Aceites y Derivados';
        2:Caption:='Saldo Inicial';
        3:Caption:='Entradas';
        4:Caption:='Devolución';
        5:Caption:='Saldo Final';
        6:Caption:='Ventas';
        7:Caption:='Prec.Unit';
        8:Caption:='Importe';
      end;
      if i=1 then xw:=210;
      if i=1 then Frame.DrawRight:=true;
      if i in [2..7] then xw:=65;
      if i in [8] then xw:=80;
      Left      :=xl;
      Width     :=xw;
    end;
    with QRLabelDeta[i] do begin
      if i=1 then xw:=210;
      if i in [2..7] then xw:=65;
      if i in [8] then xw:=80;
      Left      :=xl;
      Width     :=xw;
    end;
    xl:=xl+xw+4;
  end;
end;


procedure TFLIQLIQGIR.PreparaReporte;
var totc:Array[1..5] of double;
    tota,totp:double;
    xcosto,xprecio_civa,xprecio_siva,
    ximp_siva,ximp_costo,xiva,
    xporc,xutil:double;
    i:word;
begin
  with DMGEN,DMGAS,DMGASQ,DMLIQ,FLIQTURC do begin
    CreaEtiquetas;
    BndDt.Items.Clear;
    for i:=1 to 5 do
      totc[i]:=0;
    QL_Dliqc.Close;
    QL_Dliqc.ParamByName('pestacion').AsInteger:=QL_TurcEstacion.AsInteger;
    QL_Dliqc.ParamByName('pfecha').AsDateTime:=QL_TurcFecha.AsDateTime;
    QL_Dliqc.ParamByName('pturno').AsInteger:=QL_TurcTurno.AsInteger;
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;
    QL_Dliqc.First;
    while not QL_Dliqc.Eof do begin
      xcosto:=0; xprecio_siva:=0; xprecio_civa:=0;
      QL_Prec.Close;
      QL_Prec.ParamByName('pclavecmb').AsInteger:=QL_DliqcCombustible.AsInteger;
      QL_Prec.ParamByName('pfecha').AsDateTime:=QL_DliqcFecha.AsDateTime;
      QL_Prec.Prepare;
      QL_Prec.Open;
      if not QL_Prec.IsEmpty then begin
        xcosto:=QL_PrecCosto.AsFloat;
        xprecio_civa:=QL_PrecPrecio.AsFloat;
        xprecio_siva:=AjustaFloat(DivideFloat(xprecio_civa,1+QL_PrecTasaIva.AsFloat/100),4);
      end;
      ximp_costo:=AjustaFloat(QL_DliqcCantidad.AsFloat*xcosto,2);
      ximp_siva:=AjustaFloat(DivideFloat(QL_DliqcImporte.AsFloat,1+GetTasaIVAdeCombustible(QL_DliqcESTACION.AsInteger,QL_DliqcCOMBUSTIBLE.AsInteger,QL_DliqcFECHA.AsDateTime)/100),2);
      xutil:=AjustaFloat(ximp_siva-ximp_costo,2);
      xporc:=AjustaFloat(DivideFloat(xutil,ximp_siva)*100,2);
      xlin:='D//'+QL_DliqcDescCombustible.AsString+'//'+
                  FormatoMoneda(QL_DliqcCantidad.AsFloat)+'//'+
                  FormatFloat('##,##0.0000',xprecio_civa)+'//'+
                  FormatoMoneda(QL_DliqcImporte.AsFloat)+'//'+
                  FormatoMoneda(ximp_siva)+'//'+FormatoMoneda(ximp_costo)+'//'+
                  FormatoMoneda(xutil)+'//'+FormatFloat('##0.00',xporc);
      BndDt.Items.Add(xlin);
      totc[1]:=totc[1]+QL_DliqcCantidad.AsFloat;
      totc[2]:=totc[2]+QL_DliqcImporte.AsFloat;
      totc[3]:=totc[3]+ximp_siva;
      totc[4]:=totc[4]+ximp_costo;
      totc[5]:=totc[5]+xutil;
      QL_Dliqc.Next;
    end;
    xporc:=AjustaFloat(DivideFloat(totc[5],totc[3])*100,2);
    xlin:='T// //'+FormatoMoneda(totc[1])+'// //';
    for i:=2 to 5 do
      xlin:=xlin+FormatoMoneda(totc[i])+'//';
    xlin:=xlin+FormatoMoneda(xporc);
    BndDt.Items.Add(xlin);
//
    xlin:='A//Aceites y Derivados//Saldo Inicial//Entradas//Devolución//Saldo Final//Ventas//'+
             'Precio//Importe';
    BndDt.Items.Add(xlin);
    tota:=0;
    QL_Dliqa.Close;
    QL_Dliqa.ParamByName('pestacion').AsInteger:=QL_TurcEstacion.AsInteger;
    QL_Dliqa.ParamByName('pfecha').AsDateTime:=QL_TurcFecha.AsDateTime;
    QL_Dliqa.ParamByName('pturno').AsInteger:=QL_TurcTurno.AsInteger;
    QL_Dliqa.Prepare;
    QL_Dliqa.Open;
    QL_Dliqa.First;
    while not QL_Dliqa.Eof do begin
      xlin:='D//'+IntToClaveNum(QL_DliqaProducto.AsInteger,3)+'-'+QL_DliqaNombreProducto.AsString+'//'+FormatoMoneda(QL_DliqaSaldoIni.AsFloat)+'//'+
                  FormatoMoneda(QL_DliqaEntradas.AsFloat)+'//'+FormatoMoneda(QL_DliqaDevol.AsFloat)+'//'+
                  FormatoMoneda(QL_DliqaSaldoFin.Asfloat)+'//'+
                  FormatoMoneda(QL_DliqaVenta.AsFloat)+'//'+FormatoMoneda(QL_DliqaPrecio_Civa.AsFloat)+'//'+
                  FormatoMoneda(QL_DliqaImporte.AsFloat);
      tota:=tota+QL_DliqaImporte.AsFloat;
      BndDt.Items.Add(xlin);
      QL_Dliqa.Next;
    end;
    xlin:='T//';
    InsertaElemStr(FormatoMoneda(tota),9,xlin);
    BndDt.Items.Add(xlin);
//
    BndDt.Items.Add('S//Resumen de Ventas:');
    BndDt.Items.Add('D//Combustibles// //'+FormatoMoneda(totc[2]));
    BndDt.Items.Add('D//Aceites y Derivados// //'+FormatoMoneda(tota));
    BndDt.Items.Add('R// // //'+FormatoMoneda(totc[2]+tota));
//
    BndDt.Items.Add('S//Resumen de Ingresos:');
    QL_Dliqp.Close;
    QL_Dliqp.ParamByName('pestacion').AsInteger:=QL_TurcEstacion.AsInteger;
    QL_Dliqp.ParamByName('pfecha').AsDateTime:=QL_TurcFecha.AsDateTime;
    QL_Dliqp.ParamByName('pturno').AsInteger:=QL_TurcTurno.AsInteger;
    QL_Dliqp.Prepare;
    QL_Dliqp.Open;
    QL_Dliqp.First;
    totp:=0;
    while not QL_Dliqp.Eof do begin
      xlin:='D//'+QL_DliqpDescripcionPago.AsString+'// //'+FormatoMoneda(QL_DliqpImporte.AsFloat);
      BndDt.Items.Add(xlin);
      totp:=totp+QL_DliqpImporte.AsFloat;
      QL_Dliqp.Next;
    end;
    xlin:='R// // //'+FormatoMoneda(totp);
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQLIQGIR.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ,FLIQTURC do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=FLIQLIQGIR.Caption;
    QRLEnca.Caption:='Turno: '+InttoClaveNum(QL_TurcTurno.AsInteger,2)+'    '+
                     'Fecha: '+FechaPaq(QL_TurcFecha.AsDateTime)+'         Cajero:  '+QL_TurcNombreCajero.AsString;
    if QL_TurcEstatus.AsString='A' then QRLEstatus.Caption:='CORTE PARCIAL'
    else QRLEstatus.Caption:='';
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  SwAceites:=false;
  xtipo:=1;
  IniciaEtiquetasCmb;
end;

procedure TFLIQLIQGIR.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

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
        if k=1 then Left:=xLeft;
        if (xtp='D')and(xtipo>2) then
          if k=1 then Left:=Left+30;
        if (xtp='S') then begin
          if k=1 then begin
            Font.Style:=[fsUnderline];
          end;
        end;
        if (xtp='R') then begin
          if k=3 then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp='A' then Font.Style:=[fsBold];        
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if xtipo=1 then begin
            if k in [1,3,8] then Frame.DrawTop:=false
            else Frame.DrawTop:=true;
          end
          else if xtipo=2 then
            if k=8 then Frame.DrawTop:=true
            else Frame.DrawTop:=false;
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
  BndDt.Frame.DrawBottom:=false;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  if xtp='A' then begin
    BndDt.Frame.DrawBottom:=true;
    inc(xtipo);
    if not SwAceites then IniciaEtiquetasProd;
    swaceites:=true;
  end;
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQLIQGIR.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

end.
