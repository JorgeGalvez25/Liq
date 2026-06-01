unit ULIQCONS02I;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport;

type
  TFLIQCONS02I = class(TForm)
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
    ChildBand1: TQRChildBand;
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    ChBEnca: TQRChildBand;
    QRLTarjeta: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..13] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=13;

var
  FLIQCONS02I: TFLIQCONS02I;
  xtp:char;
  xlin:string;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIBLICENCIAS, ULIQCONS02;

{$R *.DFM}

procedure TFLIQCONS02I.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Folio';
        2:Caption:='Fecha';
        3:Caption:='Turno';
        4:Caption:='Cliente';
        5:Caption:='Factura';
        6:Caption:='Fec.Fact.';
        7:Caption:='Isla';
        8:Caption:='Desp';
        9:Caption:='Combust.';
       10:Caption:='Litros';
       11:Caption:='Imp.Comb.';
       12:Caption:='Imp.Otros';
       13:Caption:='Total';
      end;
      Case i of
        1:xw:=60;
        2:xw:=65;
        3:xw:=30;
        4:xw:=43;
        5:xw:=60;
        6:xw:=65;
        7:xw:=32;
        8:xw:=32;
        9:xw:=55;
       10:xw:=50;
       11:xw:=68;
       12:xw:=58;
       13:xw:=67;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=true;
      Frame.Width:=1;
      if i=NoEti then Frame.DrawRight:=false;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
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
      if i in [1..6] then Alignment :=taLeftJustify;
      if i in [3,4,7,8,9] then Alignment :=taCenter;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQCONS02I.PreparaReporte;
var i:integer;
    tot:Array[1..4] of real;
    ieps,subtotal:Double;
begin
  with DMGEN,DMLIQ,DMGAS,FLIQCONS02 do begin
    CreaEtiquetas;
    BndDt.Items.Clear;
    for i:=1 to 4 do
      tot[i]:=0;
    QL_Tran.First;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Tran.RecordCount);
      while not QL_Tran.Eof do begin
        xlin:='D//'+
              QL_TranFolioTran.AsString+'//'+
              QL_TranFechaPaq.AsString+'//'+
              IntToClaveNum(QL_TranTurno.AsInteger,2)+'//'+
              IntToClaveCata(QL_TranCliente.AsInteger,idClie)+'//'+
              QL_TranFactura.AsString+'//'+
              QL_TranFechaFacPaq.AsString+'//'+
              IntToClaveNum(QL_TranIsla.AsInteger,2)+'//'+
              IntToClaveNum(QL_TranDespachador.AsInteger,2)+'//'+
              QL_TranNombreCombustible.AsString+'//'+
              FormatoMoneda(QL_TranLitros.AsFloat)+'//'+
              FormatoMoneda(QL_TranImporteCmb.AsFloat)+'//'+
              SetEspacios(QL_TranImporteOtr.AsFloat)+'//'+
              FormatoMoneda(QL_TranTotal.AsFloat)+'//';
        BndDt.Items.Add(xlin);
        tot[1]:=tot[1]+QL_TranLitros.AsFloat;
        tot[2]:=tot[2]+QL_TranImporteCmb.AsFloat;
        tot[3]:=tot[3]+QL_TranImporteOtr.AsFloat;
        tot[4]:=tot[4]+QL_TranTotal.AsFloat;
        QL_Tran.Next;
        FAvance.AvanzaPosicion;
      end;
      xlin:='T//';
      InsertaElemStr('Total',10,xlin);
      for i:=1 to 4 do
        InsertaElemStr(FormatoMoneda(tot[i]),10+i,xlin);
      BndDt.Items.Add(xlin);
      BndDt.Items.Add('');
      Bnddt.Items.Add('E// // // //  // //Resumen');
//Resumen por Combustible;
      QL_Tran2.First;
      for i:=1 to 4 do
        tot[i]:=0;
      xlin:='S// // // // // // // //  // Combus.//Litros//Imp.Comb//Otros//Total//';
      BndDt.Items.Add(xlin);
      while not QL_Tran2.Eof do begin
        xlin:='D// // // // // // // // //'+
              QL_Tran2NombreCombustible.AsString+'//'+
              FormatoMoneda(QL_Tran2Cantidad.AsFloat)+'//'+
              FormatoMoneda(QL_Tran2ImporteCmb.AsFloat)+'//'+
              SetEspacios(QL_Tran2ImporteOtros.AsFloat)+'//'+
              FormatoMoneda(QL_Tran2Total.AsFloat)+'//';
        BndDt.Items.Add(xlin);
        tot[1]:=tot[1]+QL_Tran2Cantidad.AsFloat;
        tot[2]:=tot[2]+QL_Tran2ImporteCmb.AsFloat;
        tot[3]:=tot[3]+QL_Tran2ImporteOtros.AsFloat;
        tot[4]:=tot[4]+QL_Tran2Total.AsFloat;
        QL_Tran2.Next;
      end;
      xlin:='T//';
      for i:=1 to 4 do
        InsertaElemStr(FormatoMoneda(tot[i]),10+i,xlin);
      BndDt.Items.Add(xlin);
      BndDt.Items.Add('B//');
//Resumen por Isla;
      for i:=1 to 4 do
        tot[i]:=0;
      QL_Tran3.First;
      xlin:='S// // // // // // // //  // Isla//Litros//Imp.Comb//Otros//Total//';
      BndDt.Items.Add(xlin);
      while not QL_Tran3.Eof do begin
        xlin:='D// // // // // // // // //'+
              IntToClaveNum(QL_Tran3Isla.AsInteger,2)+'//'+
              FormatoMoneda(QL_Tran3Cantidad.AsFloat)+'//'+
              FormatoMoneda(QL_Tran3ImporteCmb.AsFloat)+'//'+
              SetEspacios(QL_Tran3ImporteOtros.AsFloat)+'//'+
              FormatoMoneda(QL_Tran3Total.AsFloat)+'//';
        BndDt.Items.Add(xlin);
        tot[1]:=tot[1]+QL_Tran3Cantidad.AsFloat;
        tot[2]:=tot[2]+QL_Tran3ImporteCmb.AsFloat;
        tot[3]:=tot[3]+QL_Tran3ImporteOtros.AsFloat;
        tot[4]:=tot[4]+QL_Tran3Total.AsFloat;
        QL_Tran3.Next;
      end;
      xlin:='T//';
      for i:=1 to 4 do
        InsertaElemStr(FormatoMoneda(tot[i]),10+i,xlin);
      BndDt.Items.Add(xlin);
      BndDt.Items.Add('B//');
//Resumen por Combustible 2;
      QL_Tran2.First;
      for i:=1 to 4 do
        tot[i]:=0;
      xlin:='S// // // // // // // //  // Combus.//Subtotal//IVA//IEPS//Total//';
      BndDt.Items.Add(xlin);
      while not QL_Tran2.Eof do begin
        ieps:=DMCUP.DameIEPS(QL_Tran2COMBUSTIBLE.AsInteger,VgFechaFin)*QL_Tran2CANTIDAD.AsFloat;
        subtotal:=(QL_Tran2ImporteCmb.AsFloat-ieps)/(1+(GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,QL_Tran2COMBUSTIBLE.AsInteger,VgFechaFin)/100));
        xlin:='D// // // // // // // // //'+
              QL_Tran2NombreCombustible.AsString+'//'+
              FormatoMoneda(subtotal)+'//'+
              FormatoMoneda(subtotal*(GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,QL_Tran2COMBUSTIBLE.AsInteger,VgFechaFin)/100))+'//'+
              FormatoMoneda(ieps)+'//'+
              FormatoMoneda(QL_Tran2IMPORTECMB.AsFloat)+'//';
        BndDt.Items.Add(xlin);
        tot[1]:=tot[1]+subtotal;
        tot[2]:=tot[2]+subtotal*(GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,QL_Tran2COMBUSTIBLE.AsInteger,VgFechaFin)/100);
        tot[3]:=tot[3]+ieps;
        tot[4]:=tot[4]+QL_Tran2IMPORTECMB.AsFloat;
        QL_Tran2.Next;
      end;
      xlin:='T//';
      for i:=1 to 4 do
        InsertaElemStr(FormatoMoneda(tot[i]),10+i,xlin);
      BndDt.Items.Add(xlin);
      BndDt.Items.Add('B//')
    finally
      Favance.Close;
    end;
  end;
end;

procedure TFLIQCONS02I.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ,FLIQCONS02 do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=DBLookupComboBox2.Text;
    QRLTarjeta.Caption:='';
    if ComboBox5.ItemIndex>0 then
      QRLTarjeta.Caption:='Tarjeta '+ComboBox5.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQCONS02I.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if xtp='E' then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
        if xtp='S' then begin
          Font.Style:=[fsBold];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>9 then Frame.DrawTop:=true;
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

procedure TFLIQCONS02I.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQCONS02I.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
