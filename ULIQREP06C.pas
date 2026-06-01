unit ULIQREP06C;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport, Master_Intf;

type
  TFLIQREP06C = class(TForm)
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
    QRLabelDeta:array [1..13] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte(xModo:integer);
  end;

Const
  xLeft=5;

var
  FLIQREP06C: TFLIQREP06C;
  xtp:string;
  xlin:string;
  xAncho,xwid:integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP06P, UAVANCE, StrUtils, DDM_KIOS;

{$R *.DFM}

procedure TFLIQREP06C.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
  for i:=1 to 13 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Día';
        2,6,10:Caption:='Litros';
        3,7,11:Caption:='Subtotal';
        4,8,12:Caption:='Iva';
        5,9,13:Caption:='Total';
      end;
      Case i of
        1:xw:=21;
      else
        xw:=77;
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
      if i=13 then Frame.DrawRight:=false;
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

procedure TFLIQREP06C.PreparaReporte;
var tot:Array[3..14] of real;
    tota:Array[3..10] of real;
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
    xancho:=84;
    CreaEtiquetas;
    QL_Tcmb.Close;
    QL_Tcmb.Prepare;
    QL_Tcmb.Open;
    for i:=1 to 2 do begin
      Case i of
        1:QRLEti1.Caption:=Uppercase(QL_TcmbNombre.AsString);
        2:QRLEti2.Caption:=Uppercase(QL_TcmbNombre.AsString);
      end;
      QL_Tcmb.Next;
    end;
    for i:=3 to 14 do
      tot[i]:=0;
    for i:=3 to 10 do
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
        end;
        xfecha:=QL_DliqcFecha.AsDateTime;
        xlin:='D//'+IntToClaveNum(GetDiaFromFecha(QL_DliqcFecha.AsDateTime),2);
        xind:=3;
        totl:=0; tots:=0; toti:=0; tott:=0;
        for i:=3 to 10 do
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
          end;
        end;
        totl:=tota[3]+tota[7];
        tots:=tota[4]+tota[8];
        toti:=tota[5]+tota[9];
        tott:=tota[6]+tota[10];
        tot[11]:=tot[11]+totl;
        tot[12]:=tot[12]+tots;
        tot[13]:=tot[13]+toti;
        tot[14]:=tot[14]+tott;
        InsertaElemStr(FormatFloat('###,##0.00',totl),11,xlin);
        InsertaElemStr(FormatoMoneda(tots),12,xlin);
        InsertaElemStr(FormatoMoneda(toti),13,xlin);
        InsertaElemStr(FormatoMoneda(tott),14,xlin);
        BndDt.Items.Add(xlin);
      end;
      xlin:='T// //';
      for i:=3 to 14 do
        if i in [3,7,11] then xlin:=xlin+FormatFloat('###,##0.00',tot[i])+'//'
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
  end;
end;

procedure TFLIQREP06C.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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

procedure TFLIQREP06C.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with QRLabelDeta[k] do begin
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
          Transparent:=True;
        end;
        if xtp='LA' then begin
          Font.Style:=[fsUnderline];
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
  InicializaEtiquetas(1,13);
  ExtraeEtiquetas(1,13);
end;

procedure TFLIQREP06C.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP06C.QL_DliqcCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_DliqcSubTotal.AsFloat:=AjustaFloat(QL_DliqcTotal.AsFloat/(1+GetTasaIVAdeCombustible(EstacionActual,QL_DliqcCOMBUSTIBLE.AsInteger,QL_DliqcFECHA.AsDateTime)/100),2);
    QL_DliqcIva.AsFloat:=AjustaFloat(QL_DliqcTotal.AsFloat-QL_DliqcSubtotal.AsFloat,2);
  end;
end;

end.
