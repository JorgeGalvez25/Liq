unit ULIQREP06;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport, Master_Intf;

type
  TFLIQREP06 = class(TForm)
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
    QL_DliqcNombreCombustible: TStringField;
    QL_DliqcNombreComb: TStringField;
    QL_Ieps: TQuery;
    QL_IepsENTERO1: TIntegerField;
    QL_IepsSTR50: TStringField;
    QL_IepsREAL2: TFloatField;
    QL_IepsREAL3: TFloatField;
    QL_Auxi: TQuery;
    QL_AuxiREAL1: TFloatField;
    QL_AuxiCOMBUSTIBLE: TIntegerField;
    QL_DliqcIMPIEPS: TFloatField;
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

var
  FLIQREP06: TFLIQREP06;
  xtp:string;
  xlin:string;
  xAncho,xwid:integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP06P, UAVANCE, StrUtils, DDM_KIOS;

{$R *.DFM}

procedure TFLIQREP06.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
  for i:=1 to 17 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
                1:Caption:='Día';
        2,6,10,14:Caption:='Litros';
        3,7,11,15:Caption:='Subtotal';
        4,8,12,16:Caption:='Iva';
        5,9,13,17:Caption:='Total';
      end;
      Case i of
             1:xw:=22;
        2,6,10:xw:=44;
            14:xw:=48;
        4,8,12:xw:=50;
            16:xw:=55;
         15,17:xw:=65;
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
      if i=17 then Frame.DrawRight:=false;
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
      Font.Size :=StrToInt(FLIQREP06P.Fuente.Text);
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

procedure TFLIQREP06.PreparaReporte;
var tot:Array[3..18] of real;
    tota:Array[3..14] of real;
    i,xind,j:word;
    xfecha:TDateTime;
    totl,tots,toti,totie,tott:real;
    xtasa,IEPSLts,IEPS,
    xlitros,xsubtotal,xiva,xtotal,ImporteAIEPS:real;
    comb,fechas,fecha,sigFecha,xtvta:string;
    PKioMoviAcus:TKioMoviAcus;

function FechaSQLToFecha(xfecha:String):String;
begin
  Result:=xfecha;
  Result[1]:=xfecha[4];
  Result[2]:=xfecha[5];
  Result[4]:=xfecha[1];
  Result[5]:=xfecha[2];
end;

begin
  DMGAS.T_Tcmb.Active:=True;
  with DMGEN,DMLIQ,DMGAS,DM_KIOSK do begin
    ModoRep:=xModo;
    xancho:=78;
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
    for i:=3 to 18 do
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
      TL_Ajud2.Active:=False;
      TL_Ajud2.Active:=True;
      while not QL_Dliqc.Eof do begin
        xlitros:=QL_DliqcLitros.AsFloat;
        xsubtotal:=QL_DliqcSubtotal.AsFloat;
        xiva:=QL_DliqcIva.AsFloat;
        xtotal:=QL_DliqcTotal.AsFloat;
        xtasa:=dividefloat(xiva,xsubtotal);
        if ModoRep=0 then begin
          try
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_AuxiReal2.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1, sum(Total) as Real2 from DGASAJUD2');
            Q_Auxi.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
            Q_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_DliqcFecha.AsDateTime)+'"');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xtotal:=xtotal-Q_AuxiReal2.AsFloat;;
            xlitros:=xlitros-Q_AuxiReal1.AsFloat;
            xsubtotal:=ajustafloat(dividefloat(xtotal,1+xtasa),2);
            xiva:=xtotal-xsubtotal;
          finally
            Q_Auxi.Close;
          end;
//          if LocalizaTabla(TL_Ajud2,'Estacion;Fecha;Combustible',
//               VarArrayOf([T_EstsClave.AsInteger,QL_DliqcFecha.AsDateTime,QL_DliqcCombustible.AsInteger])) then
//          begin
//            xtotal:=xtotal-TL_Ajud2Total.AsFloat;
//            xlitros:=xlitros-TL_Ajud2Diferencia.AsFloat;
//            xsubtotal:=ajustafloat(dividefloat(xtotal,1+xtasa),2);
//            xiva:=xtotal-xsubtotal;
//          end;
        end;
        xfecha:=QL_DliqcFecha.AsDateTime;
        xlin:='D//'+IntToClaveNum(GetDiaFromFecha(QL_DliqcFecha.AsDateTime),2);
        xind:=3;
        totl:=0; tots:=0; toti:=0; tott:=0;
        for i:=3 to 14 do
          tota[i]:=0;
        while (xfecha=QL_DliqcFecha.AsDateTime)and (not QL_Dliqc.Eof) do begin
          if DMCUP.SwSubModuloCupReformas2008 then begin
            IEPS:=DMCUP.DameIEPS(QL_DliqcCombustible.AsInteger,QL_DliqcFECHA.AsDateTime);
            IEPS:=xlitros*IEPS;
            ImporteAIEPS:=(xtotal-IEPS)/(1+GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,QL_DliqcCOMBUSTIBLE.AsInteger,QL_DliqcFECHA.AsDateTime)/100);
            xiva:=(xtotal-IEPS-ImporteAIEPS);
            xsubtotal:=ImporteAIEPS+IEPS;
          end;
          xind:=3+4*(QL_DliqcCombustible.AsInteger-1);
          InsertaElemStr(FormatFloat('###,##0.00',xLitros),xind,xlin);
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
            try
              Q_Auxi.Close;
              Q_AuxiReal1.FieldKind:=fkInternalCalc;
              Q_AuxiReal2.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1, sum(Total) as Real2 from DGASAJUD2');
              Q_Auxi.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
              Q_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
               Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_DliqcFecha.AsDateTime)+'"');
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              xtotal:=xtotal-Q_AuxiReal2.AsFloat;;
              xlitros:=xlitros-Q_AuxiReal1.AsFloat;
              xsubtotal:=ajustafloat(dividefloat(xtotal,1+xtasa),2);
              xiva:=xtotal-xsubtotal;
            finally
              Q_Auxi.Close;
            end;
//            if LocalizaTabla(TL_Ajud2,'Estacion;Fecha;Combustible',
//                 VarArrayOf([T_EstsClave.AsInteger,QL_DliqcFecha.AsDateTime,QL_DliqcCombustible.AsInteger])) then
//            begin
//              xtotal:=xtotal-TL_Ajud2Total.AsFloat;
//              xlitros:=xlitros-TL_Ajud2Diferencia.AsFloat;
//              xsubtotal:=ajustafloat(dividefloat(xtotal,1+xtasa),2);
//              xiva:=xtotal-xsubtotal;
//            end;
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
        InsertaElemStr(FormatFloat('###,##0.00',totl),15,xlin);
        InsertaElemStr(FormatoMoneda(tots),16,xlin);
        InsertaElemStr(FormatoMoneda(toti),17,xlin);
        InsertaElemStr(FormatoMoneda(tott),18,xlin);
        BndDt.Items.Add(xlin);
      end;
      xlin:='T// //';
      for i:=3 to 18 do
        if i in [3,7,11,15] then xlin:=xlin+FormatFloat('###,##0.00',tot[i])+'//'
        else xlin:=xlin+FormatoMoneda(tot[i])+'//';
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
    if FLIQREP06P.CBIeps.Checked then begin
      BndDt.Items.Add('D//');
      BndDt.Items.Add('D//');
      BndDt.Items.Add('Z// // Resumen de IEPS/Lts:');
      BndDt.Items.Add('Z// //Combustible // //IEPS/Lts //Litros //Total IEPS');
      IEPSLts:=0;
      FAvance.PreparaAvance('Preparando resumen IEPS...',true,QL_Dliqc.RecordCount);
      try
        IEPS:=0;
        QL_Ieps.Close;
        QL_Ieps.SQL.Clear;
        QL_Ieps.SQL.Add('select l.combustible as Entero1,');
        QL_Ieps.SQL.Add('(Select Nombre from dgastcmb where clave=l.combustible) as Str50,');
        QL_Ieps.SQL.Add('sum(l.cantidad) as Real2,sum(l.importe_ieps) as Real3 from dgasdliqc l');
        QL_Ieps.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
        if VgFechaIni<DMGAS.VarGasFechaInicioIEPS then
          QL_Ieps.SQL.Add('  and l.fecha>='+QuotedStr(FechaToStrSQL(DMGAS.VarGasFechaInicioIEPS)))
        else
          QL_Ieps.SQL.Add('  and l.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
        QL_Ieps.SQL.Add('  and l.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
        QL_Ieps.SQL.Add('group by l.combustible');
        QL_Ieps.Prepare;
        QL_Ieps.Open;
        while not QL_Ieps.Eof do begin
          try
            QL_Auxi.Close;
            QL_Auxi.SQL.Clear;
            QL_Auxi.SQL.Add('Select sum(Diferencia) as Real1, Combustible from DGASAJUD2');
            QL_Auxi.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
            QL_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_IepsEntero1.AsInteger));
            if VgFechaIni<DMGAS.VarGasFechaInicioIEPS then
              QL_Auxi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(DMGAS.VarGasFechaInicioIEPS )))
            else
              QL_Auxi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            QL_Auxi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            QL_Auxi.SQL.Add('Group by Combustible');
            QL_Auxi.Prepare;
            QL_Auxi.Open;
            IEPS:=DMCUP.DameIEPS(QL_IepsEntero1.AsInteger,VgFechaIni);
            IEPSLts:=IEPSLts+(QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)*IEPS;
            xlin:='Z// //'+QL_IepsSTR50.AsString+'// //'+FloatToStr(IEPS)+'//'+FormatoMoneda(AjustaFloat(QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat,0))+'//'+FormatoMoneda(AjustaFloat((QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)*IEPS,0));
            BndDt.Items.Add(xlin);
          finally
            QL_Auxi.Close;
          end;
          QL_Ieps.Next;
          FAVANCE.AvanzaPosicion;
        end;
        BndDt.Items.Add('X// // // // //Total... // '+FormatoMoneda(AjustaFloat(IEPSLts,2)));
      finally
        Q_Auxi.Close;
        FAVANCE.Close;
      end;
    end;
//    if FLIQREP06P.CBTPago.Checked then begin
//      BndDt.Items.Add('N//');
//      BndDt.Items.Add('D//');
//      BndDt.Items.Add('D//');
//      BndDt.Items.Add('E// // Desglose por tipo de pago');
//      BndDt.Items.Add('D//');
//
//      if ListTPag.IndexOf('Crédito y Prepago')<>-1 then begin
//        //Tarjetas Inteligentes
//        totl:=0;
//        tots:=0;
//        toti:=0;
//        totie:=0;
//        tott:=0;
//        Q_Auxi.Close;
//        Q_Auxi.SQL.Clear;
//        Q_AuxiStr2.FieldKind:=fkInternalCalc;
//        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
//        Q_AuxiReal1.FieldKind:=fkInternalCalc;
//        Q_AuxiReal2.FieldKind:=fkInternalCalc;
//        Q_Auxi.SQL.Add('select tipoventa as Str2,case coalesce(combustible,4) when 0 then 4');
//        Q_Auxi.SQL.Add('else coalesce(combustible,4) end as Entero1,');
//        Q_Auxi.SQL.Add('sum(litros) as Real1,sum(total) as Real2 from DGASTRAN');
//        Q_Auxi.SQL.Add('where fecha between '+QuotedStr(FechaToStrSQL(VgFechaIni))+' and '+QuotedStr(FechaToStrSQL(VgFechaFin))+' and estacion='+T_EstsClave.AsString);
//        Q_Auxi.SQL.Add('group by tipoventa,Entero1 order by tipoventa,Entero1');
//        Q_Auxi.Prepare;
//        Q_Auxi.Open;
//        while not Q_Auxi.Eof do begin
//          case Q_AuxiEntero1.AsInteger of
//            1:comb:='Magna';
//            2:comb:='Premium';
//            3:comb:='Diesel';
//            4:comb:='Aceites y D.';
//          end;
//          if (Q_AuxiStr2.AsString='CR') and (BndDt.Items.IndexOf('E// // Ventas de Crédito')=-1) then begin
//            BndDt.Items.Add('E// // Ventas de Crédito');
//            BndDt.Items.Add('D//');
//            BndDt.Items.Add('LA// // // Combustible////Litros//Subtotal//Iva//IEPS//Total');
//          end;
//          if (Q_AuxiStr2.AsString='PP') and (BndDt.Items.IndexOf('E// // Ventas de Prepago')=-1) then begin
//            BndDt.Items.Add('D//');
//            BndDt.Items.Add('D//');
//            BndDt.Items.Add('E// // Ventas de Prepago');
//            BndDt.Items.Add('D//');
//            BndDt.Items.Add('LA// // // Combustible////Litros//Subtotal//Iva//IEPS//Total');
//          end;
//          xtvta:=Q_AuxiStr2.AsString;
//          IEPS:=DMCUP.DameIEPS(Q_AuxiEntero1.AsInteger,VgFechaFin)*Q_AuxiReal1.AsFloat;
//          xsubtotal:=(Q_AuxiReal2.AsFloat-IEPS)/(1+((GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,Q_AuxiEntero1.AsInteger,VgFechaFin))/100));
//          xiva:=xsubtotal*((GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,Q_AuxiEntero1.AsInteger,VgFechaFin))/100);
//          BndDt.Items.Add('AA// // //'+comb+'////'+FormatoMoneda(Q_AuxiReal1.AsFloat)+'//'+FormatoMoneda(xsubtotal)+'//'+FormatoMoneda(xiva)+
//                          '//'+FormatoMoneda(IEPS)+'//'+FormatoMoneda(Q_AuxiReal2.AsFloat));
//          totie:=totie+IEPS;
//          tots:=tots+xsubtotal;
//          toti:=toti+xiva;
//          totl:=totl+Q_AuxiReal1.AsFloat;
//          tott:=tott+Q_AuxiReal2.AsFloat;
//          Q_Auxi.Next;
//          if xtvta<>Q_AuxiStr2.AsString then begin
//            BndDt.Items.Add('TA// // // ////'+FormatoMoneda(totl)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+
//                            '//'+FormatoMoneda(totie)+'//'+FormatoMoneda(tott));
//            totl:=0;
//            tots:=0;
//            toti:=0;
//            totie:=0;
//            tott:=0;
//          end;
//        end;
//        BndDt.Items.Add('TA// // // ////'+FormatoMoneda(totl)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+
//                        '//'+FormatoMoneda(totie)+'//'+FormatoMoneda(tott));
//      end;
//
//      if ListTPag.IndexOf('Vales')<>-1 then begin
//        //Vales
//        totl:=0;
//        tots:=0;
//        toti:=0;
//        totie:=0;
//        tott:=0;
//        BndDt.Items.Add('D//');
//        BndDt.Items.Add('D//');
//        BndDt.Items.Add('E// // Ventas de Vales');
//        BndDt.Items.Add('D//');
//        BndDt.Items.Add('LA// // // Combustible////Litros//Subtotal//Iva//IEPS//Total');
//        Q_Auxi.Close;
//        Q_Auxi.SQL.Clear;
//        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
//        Q_AuxiReal1.FieldKind:=fkInternalCalc;
//        Q_AuxiReal2.FieldKind:=fkInternalCalc;
//        Q_Auxi.SQL.Add('select coalesce(producto,1) as Entero1,');
//        Q_Auxi.SQL.Add('sum(cantidad) as Real1,sum(importe) as Real2 from DGASDVAL');
//        Q_Auxi.SQL.Add('where fecha between '+QuotedStr(FechaToStrSQL(VgFechaIni))+' and '+QuotedStr(FechaToStrSQL(VgFechaFin)));
//        Q_Auxi.SQL.Add('and estacion='+T_EstsClave.AsString+' and producto in (1,2,3) group by Entero1 order by Entero1');
//        Q_Auxi.Prepare;
//        Q_Auxi.Open;
//        while not Q_Auxi.Eof do begin
//          case Q_AuxiEntero1.AsInteger of
//            1:comb:='Magna';
//            2:comb:='Premium';
//            3:comb:='Diesel';
//          end;
//          IEPS:=DMCUP.DameIEPS(Q_AuxiEntero1.AsInteger,VgFechaFin)*Q_AuxiReal1.AsFloat;
//          xsubtotal:=(Q_AuxiReal2.AsFloat-IEPS)/(1+((GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,Q_AuxiEntero1.AsInteger,VgFechaFin))/100));
//          xiva:=xsubtotal*((GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,Q_AuxiEntero1.AsInteger,VgFechaFin))/100);
//          BndDt.Items.Add('AA// // //'+comb+'////'+FormatoMoneda(Q_AuxiReal1.AsFloat)+'//'+FormatoMoneda(xsubtotal)+'//'+FormatoMoneda(xiva)+
//                          '//'+FormatoMoneda(IEPS)+'//'+FormatoMoneda(Q_AuxiReal2.AsFloat));
//          totie:=totie+IEPS;
//          tots:=tots+xsubtotal;
//          toti:=toti+xiva;
//          totl:=totl+Q_AuxiReal1.AsFloat;
//          tott:=tott+Q_AuxiReal2.AsFloat;
//          Q_Auxi.Next;
//        end;
//        BndDt.Items.Add('TA// // // ////'+FormatoMoneda(totl)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+
//                        '//'+FormatoMoneda(totie)+'//'+FormatoMoneda(tott));
//      end;
//
//      if ListTPag.IndexOf('Cupones')<>-1 then begin
//        //Cupones
//        totl:=0;
//        tots:=0;
//        toti:=0;
//        totie:=0;
//        tott:=0;
//        BndDt.Items.Add('D//');
//        BndDt.Items.Add('D//');
//        BndDt.Items.Add('E// // Ventas de Cupones');
//        BndDt.Items.Add('D//');
//        BndDt.Items.Add('LA// // // Tipo////Litros//Subtotal//Iva//IEPS//Total');
//        for j:=1 to 2 do begin
//          totl:=0;
//          IEPS:=0;
//          tott:=0;
//          xsubtotal:=0;
//          xiva:=0;
//          for i:=1 to CambiosdePrec(1,VgFechaIni,VgFechaFin,fechas) do begin
//            if i>1 then
//              fecha:=FechaToStrSQL(StrtoDate(FechaSQLToFecha(ExtraeElemStrSep(fechas,i,';')))+1)
//            else
//              fecha:=IfThen(StrToDate(FechaSQLToFecha(ExtraeElemStrSep(fechas,i,';')))<VgFechaIni,FechaToStrSQL(VgFechaIni),ExtraeElemStrSep(fechas,i,';'));
//            sigFecha:=IfThen(ExtraeElemStrSep(fechas,i+1,';')<>'',ExtraeElemStrSep(fechas,i+1,';'),FechaToStrSQL(VgFechaFin));
//            Q_Auxi.Close;
//            Q_Auxi.SQL.Clear;
//            Q_AuxiReal1.FieldKind:=fkInternalCalc;
//            Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS Real1 FROM DGASRRCU R WHERE FECHA BETWEEN '+QuotedStr(fecha)+' AND '+QuotedStr(sigFecha));
//            Q_Auxi.SQL.Add('AND (SELECT TIPO FROM DGASSERC WHERE CLAVE=R.SERIE)='+IfThen(j=1,'''N''','''F'''));
//            Q_Auxi.SQL.Add('and ESTACION='+T_EstsClave.AsString);
//            Q_Auxi.Prepare;
//            Q_Auxi.Open;
//            LocalizaTabla(T_Prec,'FECHA;COMBUSTIBLE',VarArrayOf([StrToDate(FechaSQLToFecha(ExtraeElemStrSep(fechas,i,';'))),1]));
//            totl:=totl+(Q_AuxiReal1.AsFloat/T_PrecPRECIO.AsFloat);
//            IEPS:=IEPS+DMCUP.DameIEPS(1,StrToDate(FechaSQLToFecha(sigFecha)))*totl;
//            tott:=tott+Q_AuxiReal1.AsFloat;
//          end;
//          xsubtotal:=xsubtotal+(tott-IEPS)/(1+((GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,1,VgFechaFin))/100));
//          xiva:=(xsubtotal*((GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,1,StrToDate(FechaSQLToFecha(sigFecha))))/100));
//          if tott>0 then
//            BndDt.Items.Add('AA// // //'+IfThen(j=1,'Normales','Feria')+'////'+FormatoMoneda(totl)+'//'+FormatoMoneda(xsubtotal)+'//'+FormatoMoneda(xiva)+
//                            '//'+FormatoMoneda(IEPS)+'//'+FormatoMoneda(tott));
//        end;
//      end;
//
//      if VarComp('ServiciosMaster')='Si' then begin
//        ROChannel.TargetURL:=VariableDeMemo(T_EstsCONSOLA,'TargetURLMaster');  
//        for i:=0 to ListTPag.Count-1 do begin
//          if not AnsiMatchStr(ListTPag[i],['Crédito y Prepago','Vales','Cupones']) then begin
//            PKioMoviAcus:=TKioMoviAcus.Create;
//            PKioMoviAcus:=GetAcuKioTPag(StrToIntDef(ExtraeElemStrSep(ListTPag[i],1,'-'),0),VgFechaIni,VgFechaFin);
//            if PKioMoviAcus=nil then
//              Continue;
//            BndDt.Items.Add('D//');
//            BndDt.Items.Add('D//');
//            BndDt.Items.Add('E// //'+Trim(ExtraeElemStrSep(ListTPag[i],2,'-')));
//            BndDt.Items.Add('D//');
//            BndDt.Items.Add('LA// // //Combustible////Litros//Subtotal//Iva//IEPS//Total');
//            for j:=0 to PKioMoviAcus.Count-1 do begin
//              if PKioMoviAcus[j].Producto=4 then Continue;
//              case PKioMoviAcus[j].Producto of
//                1:comb:='Magna';
//                2:comb:='Premium';
//                3:comb:='Diesel';
//              end;
//              IEPS:=DMCUP.DameIEPS(PKioMoviAcus[j].Producto,VgFechaFin)*PKioMoviAcus[j].Litros;
//              xsubtotal:=(PKioMoviAcus[j].Importe-IEPS)/(1+((GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,PKioMoviAcus[j].Producto,VgFechaFin))/100));
//              xiva:=xsubtotal*((GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,PKioMoviAcus[j].Producto,VgFechaFin))/100);
//              BndDt.Items.Add('AA// // //'+comb+'////'+FormatoMoneda(PKioMoviAcus[j].Litros)+'//'+FormatoMoneda(xsubtotal)+'//'+FormatoMoneda(xiva)+
//                              '//'+FormatoMoneda(IEPS)+'//'+FormatoMoneda(PKioMoviAcus[j].Importe));
//            end;
//            PKioMoviAcus.Free;
//          end;
//        end;
//        ROChannel.TargetURL:=VarGasTargetURL_Master;
//      end;
//    end;
  end;
end;

procedure TFLIQREP06.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP06P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  if ModoRep=0 then
    QRLSistema.Caption:=IdSistNombre
  else
    QRLSistema.Caption:='';
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP06.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with QRLabelDeta[k] do begin
        if xtp[2]='A' then begin
          Case k of
            5:begin
                Width:=70;
                Left:=146;
                Alignment:=taRightJustify;
              end;
            6:begin
                Width:=70;
                Left:=220;
                Alignment:=taRightJustify;
              end;
            7:begin
                Width:=70;
                Left:=294;
                Alignment:=taRightJustify;
              end;
            8:begin
                Width:=70;
                Left:=364;
                Alignment:=taRightJustify;
              end;
            9:begin
                Width:=70;
                Left:=434;
                Alignment:=taRightJustify;
              end;
           10:Left:=515;
          end;
        end
        else begin
          Case k of
            5:begin
                Width:=63;
                Left:=200;
              end;
            6:begin
                Width:=44;
                Left:=267;
              end;
            7:begin
                Width:=63;
                Left:=315;
              end;
            8:begin
                Width:=50;
                Left:=382;
              end;
            9:begin
                Width:=63;
                Left:=436;
              end;
           10:Left:=503;              
          end;
        end;
        if k=1 then Alignment:=taCenter
        else Alignment:=taRightJustify;
        if (k=2) and ((xtp<>'Z') or (xtp<>'E')) then
          Width:=44
        else if (k=3) and (xtp<>'Z') then
          Width:=63;

        AutoSize:=False;
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Font.Size:=StrToInt(FLIQREP06P.Fuente.Text);
        Transparent:=False;
        if xtp='R' then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>1 then Frame.DrawTop:=true;
        end;
        if xtp='Z' then begin
          Alignment:=taRightJustify;
          if k in[2,3] then begin
            AutoSize:=True;
            Alignment:=taLeftJustify;
          end;
        end;
        if xtp='X' then begin
          Font.Style:=[fsBold];
          if k=6 then Frame.DrawTop:=true;
        end;
        if xtp='E' then begin
          Font.Style:=[fsBold];
          if k=2 then
            Width:=200;
          Transparent:=True;
        end;
        if xtp='LA' then begin
          Font.Style:=[fsUnderline];
//          AutoSize:=True;
        end;
        if xtp='TA' then begin
          Font.Style:=[fsBold];
          if (k>=5) and (k<=9) then Frame.DrawTop:=true;
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
  xtp:=ExtraeElemStr(xlin,1);
  if xtp='N' then QuickRep1.NewPage;
  InicializaEtiquetas(1,17);
  ExtraeEtiquetas(1,17);     
end;

procedure TFLIQREP06.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP06.QL_DliqcCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_DliqcSubTotal.AsFloat:=AjustaFloat(QL_DliqcTotal.AsFloat/(1+GetTasaIVAdeCombustible(EstacionActual,QL_DliqcCOMBUSTIBLE.AsInteger,QL_DliqcFECHA.AsDateTime)/100),2);
    QL_DliqcIva.AsFloat:=AjustaFloat(QL_DliqcTotal.AsFloat-QL_DliqcSubtotal.AsFloat,2);
  end;
end;

end.
