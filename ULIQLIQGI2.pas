unit ULIQLIQGI2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

type
  TFLIQLIQGI1 = class(TForm)
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
    QRLFolio: TQRLabel;
    ChildBand1: TQRChildBand;
    QL_Dliqc: TQuery;
    QL_Dliqa: TQuery;
    QL_DliqcESTACION: TIntegerField;
    QL_DliqcFECHA: TDateTimeField;
    QL_DliqcTURNO: TIntegerField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcCANTIDAD: TFloatField;
    QL_DliqcIMPORTE: TFloatField;
    QL_DliqcDescCombustible: TStringField;
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
    QRLabelDeta:array [1..7] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;

var
  FLIQLIQGI1: TFLIQLIQGI1;
  xtp:char;
  xlin:string;
  xAncho,xwid,
  xtipo:integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ;

{$R *.DFM}

procedure TFLIQLIQGI1.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
  for i:=1 to 7 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Bomba/Combustible';
        2:Caption:='';
        3:Caption:='Lect.Inicial';
        4:Caption:='Lect.Final';
        5:Caption:='Cantidad';
        6:Caption:='Prec.Unit';
        7:Caption:='Importe';
      end;
      if i=1 then xw:=150;
      if i=7 then xw:=90;
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
      if i in [1] then Frame.DrawRight:=false
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
    xl:=xl+xw+4;
  end;
  xwid:=xl;
end;

procedure TFLIQLIQGI1.PreparaReporte;
var totc,tota,
    totp,totcant:double;
begin
  with DMGEN,DMLIQ do begin
    xancho:=78;
    CreaEtiquetas;
    totc:=0; totcant:=0;
    BndDt.Items.Clear;
    T_Dliqc.First;
    while not T_Dliqc.Eof do begin
      xlin:='D//'+InttoClaveNum(T_DliqcBomba.AsInteger,2)+'-'+T_DliqcDescCombustible.AsString+'// //'+
                  FormatoMoneda(T_DliqcLec_Ant.AsFloat)+'//'+
                  FormatoMoneda(T_DliqcLec_Act.AsFloat)+'//'+
                  FormatoMoneda(T_DliqcCantidad.AsFloat)+'//'+
                  FormatFloat('##,##0.0000',T_DliqcPrecio_Civa.AsFloat)+'//'+
                  FormatoMoneda(T_DliqcImporte.AsFloat);
      BndDt.Items.Add(xlin);
      totc:=totc+T_DliqcImporte.AsFloat;
      totcant:=totcant+T_DliqcCantidad.AsFloat;
      T_Dliqc.Next;
    end;
    xlin:='T// // // // //'+FormatoMoneda(totcant)+'// //'+FormatoMoneda(totc);
    BndDt.Items.Add(xlin);
//
    xlin:='E//Aceites y Derivados//Saldo Inicial//Entradas//Saldo Final//Ventas//'+
             'Precio//Importe';
    BndDt.Items.Add(xlin);
    tota:=0;
    T_Dliqa.First;
    while not T_Dliqa.Eof do begin
      xlin:='D//'+T_DliqaNombreProducto.AsString+'//'+FormatoMoneda(T_DliqaSald_Ini.AsFloat)+'//'+
                  FormatoMoneda(T_DliqaEntradas.AsFloat+T_DliqaDevol.AsFloat)+'//'+
                  FormatoMoneda(T_DliqaSald_Fin.Asfloat)+'//'+
                  FormatoMoneda(T_DliqaVenta.AsFloat)+'//'+FormatoMoneda(T_DliqaPrecio_Civa.AsFloat)+'//'+
                  FormatoMoneda(T_DliqaImporte.AsFloat);
      tota:=tota+T_DliqaImporte.AsFloat;
      BndDt.Items.Add(xlin);
      T_Dliqa.Next;
    end;
    xlin:='T//';
    InsertaElemStr(FormatoMoneda(tota),8,xlin);
    BndDt.Items.Add(xlin);
//
    BndDt.Items.Add('S//Resumen de Ventas:');
    BndDt.Items.Add('D//Combustibles//'+FormatoMoneda(totc));
    BndDt.Items.Add('D//Aceites y Derivados//'+FormatoMoneda(tota));
    BndDt.Items.Add('R// //'+FormatoMoneda(totc+tota));
//
    BndDt.Items.Add('S//Resumen de Ingresos:');
    T_Dliqp.First;
    totp:=0;
    while not T_Dliqp.Eof do begin
      xlin:='D//'+T_DliqpDescripcionPago.AsString+'//'+FormatoMoneda(T_DliqpImporte.AsFloat);
      if T_DliqpImporte.AsFloat>0.001 then
        BndDt.Items.Add(xlin);
      totp:=totp+T_DliqpImporte.AsFloat;
      T_Dliqp.Next;
    end;
    xlin:='R// //'+FormatoMoneda(totp);
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQLIQGI1.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEnca.Caption:=QT_TurcaDescripTurno.AsString+'          Despachador: '+DMLIQ.T_LiqgNombreDespachador.AsString+'    Cajero:  '+QT_TurcaNomCajero.AsString;
    QRLFolio.Caption:='Folio: '+IntToClaveNum(DMLIQ.T_LiqgFolio.AsInteger,6);     
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  xtipo:=1;
end;

procedure TFLIQLIQGI1.BndDtBeforePrint(Sender: TQRCustomBand;
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
          if k=2 then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if xtipo=1 then begin
            if k in [5,7] then Frame.DrawTop:=true
            else Frame.DrawTop:=false;
          end
          else if xtipo=2 then
            if k=7 then Frame.DrawTop:=true
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
  if xtp='E' then BndDt.Frame.DrawBottom:=true;
  if xtp in ['E','S'] then inc(xtipo);
  InicializaEtiquetas(1,7);
  ExtraeEtiquetas(1,7);
end;

procedure TFLIQLIQGI1.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQLIQGI1.QRLabel1Print(sender: TObject; var Value: String);
begin
  Value:=DMLIQ.T_LiqgNombreDespachador.AsString;
end;

end.
