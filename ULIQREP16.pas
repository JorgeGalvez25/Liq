unit ULIQREP16;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport;

type
  TFLIQREP16 = class(TForm)
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
    QL_Dliqc: TQuery;
    QRLEstacion: TQRLabel;
    QL_DliqcFECHA: TDateTimeField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcLITROS: TFloatField;
    QL_DliqcTOTAL: TFloatField;
    QL_DliqcSubtotal: TFloatField;
    QL_DliqcIva: TFloatField;
    ChBEnca: TQRChildBand;
    ChBEnca2: TQRChildBand;
    QRLEti1: TQRLabel;
    QRLEti2: TQRLabel;
    QRLEti3: TQRLabel;
    QL_Tcmb: TQuery;
    QL_TcmbNOMBRE: TStringField;
    QRLabel4: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    TL_Ajud2: TTable;
    TL_Ajud2ESTACION: TIntegerField;
    TL_Ajud2FECHA: TDateTimeField;
    TL_Ajud2COMBUSTIBLE: TIntegerField;
    TL_Ajud2VOLUMEN: TFloatField;
    TL_Ajud2VENTA: TFloatField;
    TL_Ajud2DIFERENCIA: TFloatField;
    TL_Ajud2PRECIO: TFloatField;
    TL_Ajud2TOTAL: TFloatField;
    QRLEti0: TQRLabel;
    QL_Dliqp: TQuery;
    QL_DliqpIMPORTE: TFloatField;
    QL_DliqpCLAVE_PAGO: TStringField;
    QL_DliqpClase: TStringField;
    QL_Dliqa: TQuery;
    QL_DliqaIMPORTE: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QL_DliqcCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ModoRep:integer;
    QRLabelEnca,
    QRLabelDeta:array [1..17] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte(xModo:integer);
  end;

Const
  xLeft=5;
  NoEti=19;

var
  FLIQREP16: TFLIQREP16;
  xtp:char;
  xlin:string;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP16P, UAVANCE;

{$R *.DFM}

procedure TFLIQREP16.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
                1:Caption:='Día';
                2:Caption:='Total';
                3:Caption:='Contado';
                4:Caption:='Crédito';
           5,9,13:Caption:='Litros';
       6,10,14,17:Caption:='Subtotal';
       7,11,15,18:Caption:='Iva';
       8,12,16,19:Caption:='Total';
      end;
      Case i of
        1:xw:=22;
        5,9,13:xw:=44;
        2..4,6,10,14,17:xw:=50;
        7,11,15,18:xw:=48
      else
        xw:=63;
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
      if i=NoEti then Frame.DrawRight:=false;
      Frame.Width:=1;
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
      if i=1 then Alignment :=taCenter;
    end;
    xl:=xl+xw+4;
  end;
  xwid:=xl;
end;

procedure TFLIQREP16.PreparaReporte;
var tot:Array[2..19] of real;
    tota:Array[3..14] of real;
    i,xind:word;
    xfecha:TDateTime;
    totl,tots,toti,
    tott,totcred,totcont:real;
    xtasa,
    xlitros,xsubtotal,xiva,xtotal:real;
begin
  with DMGEN,DMLIQ,DMGAS do begin
    ModoRep:=xModo;
    CreaEtiquetas;
    QL_Tcmb.Close;
    QL_Tcmb.Prepare;
    QL_Tcmb.Open;
    for i:=1 to 3 do begin
      Case i of
        1:QRLEti1.Caption:=Uppercase(QL_TcmbNombre.AsString);
        2:QRLEti2.Caption:=Uppercase(QL_TcmbNombre.AsString);
        3:QRLEti3.Caption:=Uppercase(QL_TcmbNombre.AsString);
      end;
      QL_Tcmb.Next;
    end;
    for i:=2 to 19 do
      tot[i]:=0;
    for i:=3 to 14 do
      tota[i]:=0;
    BndDt.Items.Clear;
    QL_Dliqc.Close;
    QL_Dliqc.ParamByName('pestacion').AsInteger:=T_EstsClave.AsInteger;
    QL_Dliqc.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqc.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Dliqc.RecordCount);
      while not QL_Dliqc.Eof do begin
        xlitros:=QL_DliqcLitros.AsFloat;
        xsubtotal:=QL_DliqcSubtotal.AsFloat;
        xtotal:=QL_DliqcTotal.AsFloat;
        xiva:=xtotal-xsubtotal;
        xtasa:=dividefloat(xiva,xsubtotal);
        QL_Dlipp.Close;
        QL_Dliqp.ParamByName('pestacion').AsInteger:=QL_DliqcEstacion.AsInteger;
        QL_Dliqp.ParamByName('pfecha').AsDateTime:=QL_DliqcFecha.AsDateTime;
        QL_Dliqp.Prepare;
        QL_Dliqp.Open;
        totcred:=0; totcont:=0;
        while not QL_Dliqp.Eof do begin
          if QL_DliqpClase.AsString=idClaseCredito then
            totcred:=totcred+QL_DlipqImporte.AsFloat
          else
            totcont:=totcont+QL_DlipqImporte.AsFloat;
          QL_Dliqp.Next;
        end;
        QL_Dlipp.Close;
        QL_Dliqa.ParamByName('pestacion').AsInteger:=QL_DliqcEstacion.AsInteger;
        QL_Dliqa.ParamByName('pfecha').AsDateTime:=QL_DliqcFecha.AsDateTime;
        QL_Dliqa.Prepare;
        QL_Dliqa.Open;
        if ModoRep=0 then begin
          if LocalizaTabla(TL_Ajud2,'Estacion;Fecha;Combustible',
               VarArrayOf([T_EstsClave.AsInteger,QL_DliqcFecha.AsDateTime,QL_DliqcCombustible.AsInteger])) then
          begin
            xtotal:=xtotal-TL_Ajud2Total.AsFloat;
            xlitros:=xlitros-TL_Ajud2Diferencia.AsFloat;
            xsubtotal:=ajustafloat(dividefloat(xtotal,1+xtasa),2);
            xiva:=xtotal-xsubtotal;
          end;
        end;
        xfecha:=QL_DliqcFecha.AsDateTime;
        xlin:='D//'+IntToClaveNum(GetDiaFromFecha(QL_DliqcFecha.AsDateTime),2)+
                    FormatoMoneda(totcred+totcont)+'//'+
                    FormatoMoneda(totcont)+'//'+
                    FormatoMoneda(totcred);
        xind:=6;
        totl:=0; tots:=0; toti:=0; tott:=0;
        for i:=3 to 14 do
          tota[i]:=0;
        while (xfecha=QL_DliqcFecha.AsDateTime)and (not QL_Dliqc.Eof) do begin
          xind:=6+4*(QL_DliqcCombustible.AsInteger-1);
          InsertaElemStr(FormatFloat('###,##0',xLitros),xind,xlin);
          InsertaElemStr(FormatoMoneda(xSubtotal),xind+1,xlin);
          InsertaElemStr(FormatoMoneda(xIva),xind+2,xlin);
          InsertaElemStr(FormatoMoneda(xTotal),xind+3,xlin);
          tot[xind]:=tot[xind]+xLitros;
          tot[xind+1]:=tot[xind+1]+xSubTotal;
          tot[xind+2]:=tot[xind+2]+xIva;
          tot[xind+3]:=tot[xind+3]+xTotal;
//
          tota[xind]:=tota[xind]+xLitros;
          tota[xind+1]:=tota[xind+1]+xSubtotal;
          tota[xind+2]:=tota[xind+2]+xIva;
          tota[xind+3]:=tota[xind+3]+xTotal;

          xfecha:=QL_DliqcFecha.AsDateTime;
          FAvance.AvanzaPosicion;
          QL_Dliqc.Next;
          xlitros:=QL_DliqcLitros.AsFloat;
          xsubtotal:=QL_DliqcSubtotal.AsFloat;
          xiva:=QL_DliqcIva.AsFloat;
          xtotal:=QL_DliqcTotal.AsFloat;
          xtasa:=dividefloat(xiva,xsubtotal);
          if ModoRep=0 then begin
            if LocalizaTabla(TL_Ajud2,'Estacion;Fecha;Combustible',
                 VarArrayOf([T_EstsClave.AsInteger,QL_DliqcFecha.AsDateTime,QL_DliqcCombustible.AsInteger])) then
            begin
              xtotal:=xtotal-TL_Ajud2Total.AsFloat;
              xlitros:=xlitros-TL_Ajud2Diferencia.AsFloat;
              xsubtotal:=ajustafloat(dividefloat(xtotal,1+xtasa),2);
              xiva:=xtotal-xsubtotal;
            end;
          end;
        end;
        totl:=tota[3]+tota[7]+tota[11];
        tots:=tota[4]+tota[8]+tota[12];
        toti:=tota[5]+tota[9]+tota[13];
        tott:=tota[6]+tota[10]+tota[14];
        tot[15]:=tot[15]+totl;
        tot[16]:=tot[16]+tots;
        tot[17]:=tot[17]+toti;
        tot[18]:=tot[18]+tott;
        InsertaElemStr(FormatFloat('###,##0',totl),15,xlin);
        InsertaElemStr(FormatoMoneda(tots),16,xlin);
        InsertaElemStr(FormatoMoneda(toti),17,xlin);
        InsertaElemStr(FormatoMoneda(tott),18,xlin);
        BndDt.Items.Add(xlin);
      end;
      xlin:='T// //';
      for i:=3 to 18 do
        if i in [3,7,11,15] then xlin:=xlin+FormatFloat('###,##0',tot[i])+'//'
        else xlin:=xlin+FormatoMoneda(tot[i])+'//';
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP16.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP16P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP16.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if xtp='R' then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>1 then Frame.DrawTop:=true;
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
  InicializaEtiquetas(1,17);
  ExtraeEtiquetas(1,17);
end;

procedure TFLIQREP16.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP16.QL_DliqcCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_DliqcSubTotal.AsFloat:=AjustaFloat(QL_DliqcTotal.AsFloat/(1+VarGasIvaCombustible/100),2);
    QL_DliqcIva.AsFloat:=AjustaFloat(QL_DliqcTotal.AsFloat-QL_DliqcSubtotal.AsFloat,2);
  end;
end;

end.
