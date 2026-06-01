unit ULIQREP42;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, QRExport, Printers, QRPDFFilt,
  RxMemDS;


type
  TFLIQREP42 = class(TForm)
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QuickRep1: TQuickRep;
    QRBand3: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData1: TQRSysData;
    QRLRango: TQRLabel;
    CHBEnca: TQRChildBand;
    QRBand4: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    BndDt: TQRStringsBand;
    Q_Cupo: TQuery;
    Q_CupoNOCLIENTE: TIntegerField;
    Q_CupoFECHARECUP: TDateTimeField;
    Q_CupoFOLIO: TIntegerField;
    Q_CupoIMPORTE: TFloatField;
    Q_CupoCOMBUSTIBLE: TIntegerField;
    Q_CupoSERIEFAC: TStringField;
    Q_CupoFOLIOFAC: TIntegerField;
    Q_CupoFECHAVENTA: TDateTimeField;
    Q_CupoNombreComb: TStringField;
    Q_CupoPrecio: TFloatField;
    Q_CupoConsumoLts: TFloatField;
    Q_CupoESTACION: TIntegerField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure Q_CupoCalcFields(DataSet: TDataSet);
  private
    QRLabelEnca,QRLabelDeta:array [1..8] of TQRLabel;
    procedure CreaEtiquetas;

    { Private declarations }
  public
    procedure PreparaForma;
    procedure PreparaReporte;
    procedure CargaBanda;
    { Public declarations }
  end;
  const
    xLeft=5;
    xEti=8;

var
  FLIQREP42: TFLIQREP42;
  xlin:string;
  xtp:char;


implementation

uses ULIBGRAL, ULIBDATABASE, UGEN_NET, DDMGEN, DDMGENT, UAVANCE, ULIQREP42P, DDMGEN_VTAS,
     DDMGAS, DDMCUP;

{$R *.DFM}



procedure TFLIQREP42.PreparaForma;
begin
  BndDt.Items.Clear;
  PreparaReporte;
  CargaBanda;
end;

procedure TFLIQREP42.PreparaReporte;
var
  xClie:Integer;
  xFecha:TDateTime;
  xTotImp,xTotLts:Double;
  xTotImpGen,xTotLtsGen:Double;
begin
  with FLIQREP42P do begin
    try
      CreaEtiquetas;
      try
        xclie:=0;
        Q_Cupo.Close;
        if FLIQREP42P.CheckBox1.Checked then
          Q_Cupo.SQL[2]:=''
        else
          Q_Cupo.ParamByName('ESTACION').AsInteger:=FLIQREP42P.DBLookupComboBox2.KeyValue;
        Q_Cupo.ParamByName('FECHAINI').AsDateTime:=VgFechaIni;
        Q_Cupo.ParamByName('FECHAFIN').AsDateTime:=VgFechaFin;
        if FLIQREP42P.CheckBox2.Checked then
          Q_Cupo.SQL[3]:=''
        else
          Q_Cupo.ParamByName('NOCLIENTE').AsInteger:=StrToInt(MaskEdit2.Text);
        Q_Cupo.Open;
        if Q_Cupo.IsEmpty then
          raise Exception.Create('No se encontraron movimientos en este periodo.'); 
        FAVANCE.PreparaAvance('Preparando Reporte...',True,Q_Cupo.RecordCount);
        DMGEN_VTAS.T_Clie.Open;
        while not Q_Cupo.Eof do begin
          if xclie<>Q_CupoNOCLIENTE.AsInteger then begin
            if xclie>0 then begin
              xTotImpGen:=xTotImpGen+xTotImp;
              xTotLtsGen:=xTotLtsGen+xTotLts;
              BndDt.Items.Add('T// // //'+FormatoMoneda(xTotImp)+'//'+FormatoMoneda(xTotLts));
              xTotImp:=0;
              xTotLts:=0;
              BndDt.Items.Add('X//');
            end;
            xFecha:=0;
            xclie:=Q_CupoNOCLIENTE.AsInteger;
            DMGEN_VTAS.T_Clie.Locate('NOCLIE',xclie,[]);
            BndDt.Items.Add('C//'+IntToClaveNum(xclie,5)+' - '+DMGEN_VTAS.T_ClieNOMBRE.AsString);
          end;
          xTotImp:=xTotImp+Q_CupoIMPORTE.AsFloat;
          xTotLts:=xTotLts+Q_CupoConsumoLts.AsFloat;
          xlin:='X//'+FechaToFormato(Q_CupoFECHARECUP.AsDateTime)+'//'+IntToClaveNum(Q_CupoFOLIO.AsInteger,6)+'//'+FormatoMoneda(Q_CupoIMPORTE.AsFloat);
          xlin:=xlin+'//'+FormatoMoneda(Q_CupoConsumoLts.AsFloat)+'//'+FormatoMoneda(Q_CupoPrecio.AsFloat)+'//'+Q_CupoNombreComb.AsString;
          xlin:=xlin+'//'+Q_CupoSERIEFAC.AsString+'-'+IntToClaveNum(Q_CupoFOLIOFAC.AsInteger,5)+'//'+FechaToFormato(Q_CupoFECHAVENTA.AsDateTime);
          BndDt.Items.Add(xlin);
          Q_Cupo.Next;
          FAVANCE.AvanzaPosicion;
        end;
        xTotImpGen:=xTotImpGen+xTotImp;
        xTotLtsGen:=xTotLtsGen+xTotLts;
        BndDt.Items.Add('T// // //'+FormatoMoneda(xTotImp)+'//'+FormatoMoneda(xTotLts));
        BndDt.Items.Add('X//');
        BndDt.Items.Add('X//');
        BndDt.Items.Add('T// //Total general: //'+FormatoMoneda(xTotImpGen)+'//'+FormatoMoneda(xTotLtsGen));
      finally
        DMGEN_VTAS.T_Clie.Close;
        FAVANCE.Close;
      end;
    except
      on e:Exception do begin
        raise Exception.Create(e.Message);
      end;
    end;
  end;

end;

procedure TFLIQREP42.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN,FLIQREP42P do begin
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLRango.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
end;

procedure TFLIQREP42.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Size:=8;
        Font.Style:=[];
        Frame.DrawTop:=false;
        if (xtp='C') then Font.Style:=[fsbold];
        if (xtp='T') then begin
          if (k=3) or (k=4) then
            Frame.DrawTop:=True;
          if k=2 then
            Font.Style:=[fsbold];
        end;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k+1)
  end;
begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQREP42.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=FecHorActualToStr;
end;

procedure TFLIQREP42.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP42.CargaBanda;
begin
end;

procedure TFLIQREP42.CreaEtiquetas;
var j,i,xl,xw:Integer;
begin
  xl:=xLeft;
  for i:=1 to xEti do begin
     QRLabelEnca[i]:= TQRLabel (CHBEnca.AddPrintable(TQRLabel));
     QRLabelDeta[i]:= TQRLabel (BndDt.AddPrintable(TQRLabel));
     QRLabelDeta[i].Name:='QRLabel'+Inttostr(i);
     with QRLabelEnca[i] do begin
        case i of
          1:Caption:='Fecha consumo ';
          2:Caption:='Folio ';
          3:Caption:='Importe ';
          4:Caption:='Consumo Lts. ';
          5:Caption:='Precio ';
          6:Caption:='Producto ';
          7:Caption:='Factura ';
          8:Caption:='Fecha Factura ';
        end;
        case i of
          1:xw:=70;
          2:xw:=60;
          3:xw:=70;
          4:xw:=70;
          5:xw:=70;
          6:xw:=80;
          7:xw:=70;
          8:xw:=70;
        end;
        AutoSize:=False;
        Left:=xl;
        Width:=xw;
        Top:=2;
        if i>=2 then
          Alignment:=taRightJustify
        else
          Alignment:=taLeftJustify;
        Font.Name:='Arial';
        Font.Size:=8;
        Font.Style:=[];
        Frame.DrawTop:=False;
        Frame.DrawBottom:=False;
        Frame.DrawLeft:=False;
        Frame.DrawRight:=True;
        Frame.Width:=1;
     end;
     with QRLabelDeta[i] do begin
        Caption:='';
        AutoSize:=True;
        Transparent:=True;
        Left:=xl;
        Width:=xw;
        Top:=2;
        if i>=2 then
          Alignment:=taRightJustify
        else
          Alignment:=taLeftJustify;
        Font.Name:='Arial';
        Frame.DrawTop:=False;
        Frame.DrawBottom:=False;
        Frame.DrawLeft:=False;
        Frame.DrawRight:=False;
        Frame.Width:=1;
     end;
     if i>=5 then
     xl:=xl+xw
     else
     xl:=xl+xw+2;

  end;
end;

procedure TFLIQREP42.BndDtAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
end;

procedure TFLIQREP42.Q_CupoCalcFields(DataSet: TDataSet);
var
  xPrec,xTasa:Real;
begin
  case Q_CupoCOMBUSTIBLE.AsInteger of
    1:Q_CupoNombreComb.AsString:=_NOMBRESCOMBUSTIBLES[1];
    2:Q_CupoNombreComb.AsString:=_NOMBRESCOMBUSTIBLES[2];
    3:Q_CupoNombreComb.AsString:=_NOMBRESCOMBUSTIBLES[3];
    else Q_CupoNombreComb.AsString:='Desconocido';
  end;
  if Q_CupoCOMBUSTIBLE.AsInteger>0 then begin
    with DMGAS,DMCUP do begin
      if VarGasPreciosPorEstacion='Si' then
        DamePrecioFechaEst(Q_CupoESTACION.AsInteger,Q_CupoCOMBUSTIBLE.AsInteger,Q_CupoFECHARECUP.AsDateTime,xPrec,xTasa)
      else
        DamePrecioFecha(Q_CupoCOMBUSTIBLE.AsInteger,Q_CupoFECHARECUP.AsDateTime,xPrec,xTasa);
      Q_CupoPrecio.AsFloat:=xPrec;
    end;
    Q_CupoConsumoLts.AsFloat:=Q_CupoIMPORTE.AsFloat/Q_CupoPrecio.AsFloat;
  end
  else begin
    Q_CupoPrecio.AsFloat:=0;
    Q_CupoConsumoLts.AsFloat:=0;
  end;
end;

end.
