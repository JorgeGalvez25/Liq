unit ULIQREP21;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQREP21 = class(TForm)
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
    ChildBand1: TQRChildBand;
    QL_Dliqa: TQuery;
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    TT_Auxi: TTable;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiNoReg: TIntegerField;
    TT_AuxiSubtotal: TFloatField;
    TT_AuxiIVA: TFloatField;
    TT_AuxiTotal: TFloatField;
    QL_DliqaPRODUCTO: TIntegerField;
    QL_DliqaFECHA: TDateTimeField;
    QL_DliqaTOTAL: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..5] of TQRLabel;
    procedure CreaEtiquetas;
    procedure CreaTablaTemp;
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=8;
  NoEti=4;

var
  FLIQREP21: TFLIQREP21;
  xtp:char;
  xlin:string;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP21P, UAVANCE;

{$R *.DFM}

procedure TFLIQREP21.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Fecha';
        2:Caption:='Subtotal';
        3:Caption:='I.V.A.';
        4:Caption:='T o t a l';
      end;
      Case i of
        1:xw:=100;
        2..4:xw:=90;
      end;
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
      Frame.DrawRight:=true;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Tag       :=xl;
      if i<2 then Alignment :=taLeftJustify
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

procedure TFLIQREP21.PreparaReporte;
var xno,i:integer;
    tot:Array[1..3] of real;
    Precio,Subtotal,
    Iva:real;
begin
  with DMGEN,DMLIQ,DMGAS,DMCUP,FLIQREP21P do begin
    CreaEtiquetas;
    InicializaTemp(TT_Auxi);
    CreaTablaTemp;
    BndDt.Items.Clear;
    for i:=1 to 3 do
      tot[i]:=0;
    xno:=0;
    QL_Dliqa.Close;
    QL_Dliqa.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
    QL_Dliqa.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqa.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqa.Prepare;
    QL_Dliqa.Open;
    FAvance.PreparaAvance('Clasificando movimientos...',true,QL_Dliqa.RecordCount);
    try
      while not QL_Dliqa.Eof do begin
        Precio:=PrecioProductoFecha(QL_DliqaProducto.AsInteger,QL_DliqaFecha.AsDateTime);
        SubTotal:=DivideFloat(QL_DliqaTotal.AsFloat,1+PreaTasaIva/100);
        Iva:=QL_DliqaTotal.AsFloat-SubTotal;
        if TT_Auxi.Locate('Fecha',QL_DliqaFecha.AsDateTime,[]) then begin
          TT_Auxi.Edit;
          TT_AuxiSubtotal.AsFloat:=TT_AuxiSubtotal.AsFloat+Subtotal;
          TT_AuxiIva.AsFloat:=TT_AuxiIva.AsFloat+Iva;
          TT_AuxiTotal.AsFloat:=TT_AuxiTotal.AsFloat+QL_DliqaTotal.AsFloat;
        end
        else begin
          TT_Auxi.Insert;
          TT_AuxiNoReg.AsInteger:=xno;
          TT_AuxiFecha.AsDateTime:=QL_DliqaFecha.AsDateTime;
          TT_AuxiSubtotal.AsFloat:=Subtotal;
          TT_AuxiIva.AsFloat:=Iva;
          TT_AuxiTotal.AsFloat:=QL_DliqaTotal.AsFloat;
        end;
        TT_Auxi.Post;
        inc(xno);
        FAvance.AvanzaPosicion;
        QL_Dliqa.Next;
      end;
    finally
      FAvance.Close;
    end;
    TT_Auxi.First;
    FAvance.PreparaAvance('Generando reporte...',true,TT_Auxi.RecordCount);
    try
      while not TT_Auxi.Eof do begin
        xlin:='D//'+FechaPaq(TT_AuxiFecha.AsDateTime)+'//'+
                    FormatoMoneda(TT_AuxiSubTotal.AsFloat)+'//'+
                    FormatoMoneda(TT_AuxiIva.AsFloat)+'//'+
                    FormatoMoneda(TT_AuxiTotal.AsFloat);
        BndDt.Items.Add(xlin);
        tot[1]:=tot[1]+TT_AuxiSubtotal.AsFloat;
        tot[2]:=tot[2]+TT_AuxiIva.AsFloat;
        tot[3]:=tot[3]+TT_AuxiTotal.AsFloat;
        FAvance.AvanzaPosicion;
        TT_Auxi.Next;
      end;
    finally
      FAvance.Close;
      xlin:='T// //';
      for i:=1 to 3 do begin
        xlin:=xlin+FormatoMoneda(tot[i])+'//';
      end;
      BndDt.Items.Add(xlin);
    end;
  end;
end;

procedure TFLIQREP21.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP21P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP21.BndDtBeforePrint(Sender: TQRCustomBand;
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
        Left:=Tag;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>1 then Frame.DrawTop:=true
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
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
end;

procedure TFLIQREP21.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP21.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('NoReg', ftInteger, 0, True);
      Add('Fecha', ftDateTime, 0, False);
      Add('SubTotal', ftFloat,0,false);
      Add('Iva', ftFloat,0,false);
      Add('Total', ftFloat,0,false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'NoReg', [ixPrimary, ixUnique]);
      Add('Fecha','Fecha',[]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.IndexName:='Fecha';
    TT_Auxi.Active:=true;
  end;
end;


procedure TFLIQREP21.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Dliqa.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
  end;
end;

end.
