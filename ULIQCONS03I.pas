unit ULIQCONS03I;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport;

type
  TFLIQCONS03I = class(TForm)
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
    BndDt: TQRStringsBand;
    QRLEstacion: TQRLabel;
    ChBEnca: TQRChildBand;
    ChildBand1: TQRChildBand;
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
    QRLabelDeta:array [1..7] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=7;

var
  FLIQCONS03I: TFLIQCONS03I;
  xtp:char;
  xlin:string;
  xAncho,xwid:integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIQCONS03;

{$R *.DFM}

procedure TFLIQCONS03I.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Isla';
        2:Caption:='Desp.';
        3:Caption:='Cliente';
        4:Caption:='Producto';
        5:Caption:='Código';
        6:Caption:='Cantidad';
        7:Caption:='Importe';
      end;
      Case i of
        1:xw:=40;
        2:xw:=40;
        3:xw:=50;
        4:xw:=100;
        5:xw:=50;
        6:xw:=90;
        7:xw:=90;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Tag       :=xw;
      Top       :=2;
      Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=true;
      if i=NoEti then Frame.DrawRight:=false;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl-2;
      Width     :=xw;
      Tag       :=xw;
      Top       :=2;
      Alignment :=taRightJustify;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=false;
      Frame.Width:=1;
      if i in [2] then Alignment :=taCenter;
      if i in [1,3,4,5,6,7] then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
  xwid:=xl;
end;

procedure TFLIQCONS03I.PreparaReporte;
var xcte:string;
begin
  with DMGEN,DMLIQ,DMGAS,FLIQCONS03 do begin
    xancho:=78;
    CreaEtiquetas;
    BndDt.Items.Clear;
    xcte:=' ';
    QL_Vale.First;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Vale.RecordCount);
      while not QL_Vale.Eof do begin
        xlin:='D//'+InttoClaveNum(QL_ValeIsla.AsInteger,3)+'//'+
                    InttoClaveNum(QL_ValeDespachador.AsInteger,3)+'//'+
                    InttoClaveNum(QL_ValeCliente.AsInteger,5)+'//'+
                    InttoClaveNum(QL_ValeFolioVolumetrico.AsInteger,8);
        QL_Dval.Close;
        QL_Dval.Prepare;
        QL_Dval.Open;
        while not QL_Dval.Eof do begin
          xlin:=xlin+QL_DvalNombreCombustible.AsString+'//'+
                     Inttoclavenum(QL_DvalSubClave.AsInteger,3)+'//'+
                     FormatoMoneda(QL_DvalCantidad.AsFloat)+'//'+
                     FormatoMoneda(QL_DvalImporte.AsFloat);
          BndDt.Items.Add(xlin);
          xlin:='D//';

        end;
        if CheckBox1.Checked then xcte:='';
        xlin:='D//'+QL_PvalFechaPaq.AsString+'//'+IntToStr(QL_PvalTurno.AsInteger)+'//'+
                    xcte+'//'+QL_PvalReferencia.AsString+'//'+QL_PvalFactura.AsString+'//'+QL_PvalFechaFacPaq.AsString+'//';
        InsertaElemStr(FormatFloat('##0',QL_PvalCantidad.AsFloat),10,xlin);
        InsertaElemStr(FormatoMoneda(QL_PvalTotal.AsFloat),11,xlin);
        QL_Vale.Close;
        QL_Vale.Prepare;
        QL_Vale.Open;
        While not QL_Vale.Eof do begin
          QL_Dval.Close;
          QL_Dval.Prepare;
          QL_Dval.Open;
          while not QL_Dval.Eof do begin
            InsertaElemStr(QL_DvalNombreProducto.AsString,8,xlin);
            InsertaElemStr(FormatoMoneda(QL_DvalImporte.AsFloat),9,xlin);
            BndDt.Items.Add(xlin);
            xlin:='D//';
            QL_Dval.Next;
            if not QL_Dval.Eof then
          end;
          QL_Vale.Next;
        end;
        BndDt.Items.Add('B//');
        FAvance.AvanzaPosicion;
        QL_Pval.Next;
      end;
      xlin:='T//';
      InsertaElemStr('Total...',9,xlin);
      InsertaElemStr(FLIQCONS03.StaticText1.Caption,10,xlin);
      InsertaElemStr(FLIQCONS03.StaticText2.Caption,11,xlin);
      BndDt.Items.Add(xlin);
      BndDt.Items.Add('');
      BndDt.Items.Add('');
      BndDt.Items.Add('R//Resumen: // // // // // //Combustible//Precio Prom.//Litros//Importe//');
      QL_Dval2.First;
      while not QL_Dval2.Eof do begin
        xlin:='D//';
        InsertaElemStr(QL_Dval2NombreProducto.AsString,8,xlin);
        InsertaElemStr(FormatFloat('##0.00',QL_Dval2PrecioPromedio.AsFloat),9,xlin);
        InsertaElemStr(FormatoMoneda(QL_Dval2Litros.AsFloat),10,xlin);
        InsertaElemStr(FormatoMoneda(QL_Dval2Total.AsFloat),11,xlin);
        BndDt.Items.Add(xlin);
        QL_Dval2.Next;
      end;
      xlin:='T//';
      InsertaElemStr(FLIQCONS03.StaticText3.Caption,10,xlin);
      InsertaElemStr(FLIQCONS03.StaticText4.Caption,11,xlin);
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQCONS03I.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQCONS03.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQCONS03I.BndDtBeforePrint(Sender: TQRCustomBand;
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
        AutoSize:=false;
        if k < 7 then Width:=Tag;
        if xtp='R' then begin
          Font.Style:=[fsBold];
        end;
        if xtp='E' then begin
          Font.Style:=[fsBold];
          if k < 7 then Autosize:=true;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k in [9,10] then Frame.DrawTop:=true;
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
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
  if xtp='R' then
    BndDt.Frame.DrawBottom:=true;
  PrintBand:=xtp<>'B';
end;

procedure TFLIQCONS03I.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='B';
end;

end.
