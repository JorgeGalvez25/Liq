unit ULIQREP05;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS,
  QRPDFFilt;

type
  TFLIQREP05 = class(TForm)
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
    QL_Dliqc: TQuery;
    QL_Dliqa: TQuery;
    QL_Dliqp: TQuery;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcNombreCombustible: TStringField;
    QL_DliqpCLAVE_PAGO: TStringField;
    QL_DliqpDescripcionPago: TStringField;
    QRLEstacion: TQRLabel;
    QL_Tpag: TQuery;
    QL_TpagCLAVE: TStringField;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_DliqpClasePago: TStringField;
    QL_Dliqa2: TQuery;
    QL_Dliqa2ISLA: TIntegerField;
    QL_Dliqa2SALDOINICIAL: TFloatField;
    QL_Clas: TQuery;
    QL_ClasCLAVECLASIF: TIntegerField;
    QL_ClasDESCRIPCION: TStringField;
    QL_DliqaPRODUCTO: TIntegerField;
    QL_DliqaNombreProducto: TStringField;
    QL_Auxi: TQuery;
    QL_AuxiREAL1: TFloatField;
    QL_AuxiCOMBUSTIBLE: TIntegerField;
    QL_Ieps: TQuery;
    QL_IepsENTERO1: TIntegerField;
    QL_IepsSTR50: TStringField;
    QL_IepsREAL2: TFloatField;
    QL_IepsREAL3: TFloatField;
    QL_Tanq: TQuery;
    QL_TanqTANQUE: TIntegerField;
    QL_TanqCOMBUSTIBLE: TIntegerField;
    TM_Auxi: TRxMemoryData;
    TM_AuxiCombustible: TStringField;
    TM_AuxiCantidad: TFloatField;
    TM_AuxiSubtotal: TFloatField;
    TM_AuxiIva: TFloatField;
    TM_AuxiTotal: TFloatField;
    TM_AuxiComb: TIntegerField;
    TM_IEPS: TRxMemoryData;
    TM_IEPSLitros: TFloatField;
    TM_IEPSCombustible: TIntegerField;
    TM_IEPSDescripcion: TStringField;
    TM_IEPSIVA: TFloatField;
    QRPDFFilter1: TQRPDFFilter;
    TM_VtasCons: TRxMemoryData;
    TM_VtasConsNombreCmb: TStringField;
    TM_VtasConsVolumen: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    SwImprimeFechaHora:Boolean;
    ModoRep:integer;
    QRLabelEnca,
    QRLabelDeta:array [1..8] of TQRLabel;
    procedure CreaEtiquetas;
    procedure IniciaEtiquetasCmb;
    procedure IniciaEtiquetasProd;
    function medicion_tanque_turno_anterior(tanque:string;fecha_completa:TDateTime):real;
    function Medicion_tanque_UltimoTurno(tanque:string;FechaIni,FechaFin:TDateTime):Real;
    function Entrada_Tanque_Fecha(tanque:string; FechaIni,FechaFin:TDateTime):Real;
  public
    { Public declarations }
    pSwNegritas:Boolean;
    procedure PreparaReporte(xModo:integer);
  end;

Const
  xLeft=5;

var
  FLIQREP05: TFLIQREP05;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  xsw,SwAceites:Boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP05P, ULIQDESGLO, DDMGENT, UAVANCE, DDMCONS;

{$R *.DFM}

procedure TFLIQREP05.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to 8 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=78;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Combustible';
        2:Caption:='';
        3:Caption:='Cantidad';
        4:Caption:='Prec.Unit';
        5:Caption:='Subtotal';
        6:Caption:='I.V.A.';
        7:Caption:='T o t a l';
        8:Caption:='';
      end;
      if i=1 then xw:=150;
      if i in [2..7] then xw:=90;
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
      if i=3 then Frame.DrawLeft:=true;
      if i in [1,2,7,8] then Frame.DrawRight:=false
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
end;

procedure TFLIQREP05.IniciaEtiquetasCmb;
var i:word;
begin
  xl:=xLeft;
  for i:=1 to 8 do begin
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Combustible';
        2:Caption:='';
        3:Caption:='Cantidad';
        4:Caption:='Prec.Unit';
        5:Caption:='Subtotal';
        6:Caption:='I.V.A.';
        7:Caption:='T o t a l';
        8:Caption:='';
      end;
      if i=1 then xw:=150;
      if i in [2..7] then xw:=90;
      Width:=xw;
      Left:=xl;
    end;
    with QRLabelDeta[i] do begin
      Left      :=xl;
      Width     :=xw;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP05.IniciaEtiquetasProd;
var i:word;
begin
  xl:=xleft;
  for i:=1 to 8 do begin
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



procedure TFLIQREP05.PreparaReporte(xModo:integer);
var totc,tota,tota2,subtota2,
    totp,totcant,precio,
    precioprom,venta,
    subtotal,iva,subaux,
    tsubtotal,tiva,
    ttimp,ttotc,ttiva,ttimpdevP,ttimpdevC,ttvolcons,
    cantidad,importe,
    Ajuste,Pago,totefectivo,
    ttsubtotal,xdif,ximpd,
    saldoini,saldofin, IEPS, IEPSLts, ImporteAIEPS:real;
    estacion,i:word;
    xCantFct, xImpFct, xSubFct, xIvaFct:Real;
    xSubtCup:Real;
    totcantFct,tsubtotalFct,tivaFct,totcFct:Real;
    xTasaIva:Real;
    totalesIVA:array[0..2] of Real;
    indice:Integer;
begin
  with DMGEN,DMGENT,DMLIQ,DMCUP,DMGAS,FLIQREP05P do begin
    ModoRep:=xModo;
    SwImprimeFechaHora:=True;
    CreaEtiquetas;
    totc:=0; totcant:=0; ttimp:=0; ttimpdevP:=0; ttimpdevC:=0;
    ttotc:=0; ttiva:=0; ttsubtotal:=0;
    Ajuste:=0; totefectivo:=0; subaux:=0;
    totcantFct:=0;tsubtotalFct:=0;tivaFct:=0;totcFct:=0;
    estacion:=DBLookupComboBox2.KeyValue;
    if SwDesglose then TT_Auxi.First;
    QL_Tpag.Close;
    QL_Tpag.Prepare;
    QL_Tpag.Open;
    BndDt.Items.Clear;
    QL_Dliqc.Close;
    QL_Dliqc.SQL.Clear;
    QL_Dliqc.SQL.Add('Select distinct Combustible  from DGASDLIQC ');
    if CBEst.Checked then
      QL_Dliqc.SQL.Add('Where ' )
    else
      QL_Dliqc.SQL.Add('Where Estacion='+IntToStr(estacion)+' and ' );
    QL_Dliqc.SQL.Add('  Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni))+' and Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
    QL_Dliqc.SQL.Add('Order by Combustible');
//    QL_Dliqc.ParamByName('pestacion').AsInteger:=estacion;
//    QL_Dliqc.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
//    QL_Dliqc.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;
    tsubtotal:=0; tiva:=0;
    TM_Auxi.Active:=False;
    TM_Auxi.Active:=True;
    TM_IEPS.Active:=False;
    TM_IEPS.Active:=True;
    TM_VtasCons.Active:=False;
    TM_VtasCons.Active:=True;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Dliqc.RecordCount);
      if (FLIQREP05P.CheckBox3.Checked) and (not SwDesglose) and (QL_Dliqc.RecordCount>0) then begin
        xlin:='E//Combustible No Facturado.';
        BndDt.Items.Add(xlin);
      end;
      indice:=0;
      while not QL_Dliqc.Eof do begin
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_AuxiReal2.FieldKind:=fkInternalCalc;
        Q_AuxiReal3.FieldKind:=fkInternalCalc;
        Q_AuxiReal4.FieldKind:=fkInternalCalc;
        Q_AuxiReal5.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select sum(c.Cantidad) as Real1, sum(c.Importe) as Real2, sum(c.Devolucion) as Real3, sum(c.Importe_IEPS) as Real4, sum(c.Consignacion) as Real5 from DGASDLIQC c');
        if CBEst.Checked then
          Q_Auxi.SQL.Add('Where ')
        else
          Q_Auxi.SQL.Add('Where c.Estacion='+IntToStr(estacion)+' and ');
        Q_Auxi.SQL.Add('  c.Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
        Q_Auxi.SQL.Add('  and c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
        Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
        Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado='+QuotedStr('Si')+')');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        Cantidad:=Q_AuxiReal1.AsFloat;
        Importe:=Q_AuxiReal2.AsFloat;
        ttimpdevC:=ttimpdevC+Q_AuxiReal3.AsFloat;
        IEPS:=Q_AuxiReal4.AsFloat;
        ttvolcons:= ttvolcons+Q_AuxiReal5.AsFloat;
        xCantFct:=0;
        xImpFct:=0;
        xSubFct:=0;
        xIvaFct:=0;

        TM_VtasCons.Append;
        TM_VtasConsNombreCmb.AsString := QL_DliqcNombreCombustible.AsString;
        TM_VtasConsVolumen.AsFloat := Q_AuxiReal5.AsFloat;
        TM_VtasCons.Post;

        if (FLIQREP05P.CheckBox3.Checked) and (not SwDesglose) then begin
          //Obtiene la cantidad facturada de Contado
          try
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_AuxiReal2.FieldKind:=fkInternalCalc;
            Q_AuxiReal3.FieldKind:=fkInternalCalc;
            Q_AuxiReal4.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select coalesce(sum(d.cantidad),0) as Real1, coalesce(sum(d.Subtotal),0) as Real2, coalesce(sum(d.Iva),0) as Real3, coalesce(sum(d.importe),0) as Real4 from dgasdfcg2 d, dgasfacg2 m');
            if CBEst.Checked then
              Q_Auxi.SQL.Add('Where ')
            else
              Q_Auxi.SQL.Add('where m.Estacion='+IntToStr(estacion)+'  and');
            Q_Auxi.SQL.Add('   d.combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
            Q_Auxi.SQL.Add('  and m.Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.SQL.Add('  and m.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and d.id=m.id and ESTATUS="A"');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if Q_Auxi.RecordCount>0 then begin
              xCantFct:=Q_AuxiReal1.AsFloat;
              xSubFct :=Q_AuxiReal2.AsFloat;
              xIvaFct :=Q_AuxiReal3.AsFloat;
              xImpFct :=Q_AuxiReal4.AsFloat;
            end;
          finally
            Q_Auxi.Close;
          end;
          //Obtiene la cantidad facturada de Crédito
          try
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_AuxiReal2.FieldKind:=fkInternalCalc;
            Q_AuxiReal3.FieldKind:=fkInternalCalc;
            Q_AuxiReal4.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select coalesce(sum(d.cantidad),0) as Real1, coalesce(sum(d.Subtotal),0) as Real2, coalesce(sum(d.Iva),0) as Real3, '+
            ' coalesce(sum(d.importe),0) as Real4 from dgasdfcr2 d, dgasfacr2 m');
            if CBEst.Checked then
              Q_Auxi.SQL.Add('Where ')
            else
              Q_Auxi.SQL.Add('where m.Estacion='+IntToStr(estacion)+' and');
            Q_Auxi.SQL.Add('   d.Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
            Q_Auxi.SQL.Add('  and m.Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.SQL.Add('  and m.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and d.id=m.id and ESTATUS="A"');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if Q_Auxi.RecordCount>0 then begin
              xCantFct:=xCantFct + Q_AuxiReal1.AsFloat;
              xSubFct :=xSubFct + Q_AuxiReal2.AsFloat;
              xIvaFct :=xIvaFct + Q_AuxiReal3.AsFloat;
              xImpFct :=xImpFct + Q_AuxiReal4.AsFloat;
            end;
          finally
            Q_Auxi.Close;
          end;
          //Obtiene la cantidad facturada de Cupones
          try
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_AuxiReal2.FieldKind:=fkInternalCalc;
            Q_AuxiReal3.FieldKind:=fkInternalCalc;
            Q_AuxiReal4.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select coalesce(sum(d.Cantidad),0) as Real1, coalesce(sum(d.Subtotal),0) as Real2, coalesce(sum(d.Iva),0) as Real3, coalesce(sum(d.importe),0) as Real4 from DGASDFCC2 d, DGASFACC2 m');
            if CBEst.Checked then
              Q_Auxi.SQL.Add('Where ')
            else
              Q_Auxi.SQL.Add('where m.Estacion='+IntToStr(estacion)+' and');
            Q_Auxi.SQL.Add('   d.Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
            Q_Auxi.SQL.Add('  and m.Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.SQL.Add('  and m.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and d.id=m.id and m.ESTATUS="A" ');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if Q_Auxi.RecordCount>0 then begin
              xCantFct:=xCantFct + Q_AuxiReal1.AsFloat;
              xSubFct :=xSubFct + Q_AuxiReal2.AsFloat;
              xIvaFct :=xIvaFct + Q_AuxiReal3.AsFloat;
              xImpFct :=xImpFct + Q_AuxiReal4.AsFloat;
            end;
          finally
            Q_Auxi.Close;
          end;
          //Obtiene la cantidad facturada de prepago
          try
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_AuxiReal2.FieldKind:=fkInternalCalc;
            Q_AuxiReal3.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select coalesce(sum(d.Cantidad),0) as Real1, coalesce(sum(d.Subtotal),0) as Real2, coalesce(sum(d.Iva),0) as Real3, coalesce(sum(d.importe),0) as Real4 from dgasdfcp2 d, dgasfacp2 m');
            if CBEst.Checked then
              Q_Auxi.SQL.Add('Where ')
            else
              Q_Auxi.SQL.Add('where m.Estacion='+IntToStr(estacion)+' and');
            Q_Auxi.SQL.Add('  d.Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
            Q_Auxi.SQL.Add('  and m.Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.SQL.Add('  and m.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and d.id=m.id and m.ESTATUS="A" ');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xCantFct:=xCantFct + Q_AuxiReal1.AsFloat;
            xSubFct :=xSubFct + Q_AuxiReal2.AsFloat;
            xIvaFct :=xIvaFct + Q_AuxiReal3.AsFloat;
            xImpFct :=xImpFct + Q_AuxiReal4.AsFloat;
          finally
            Q_Auxi.Close;
          end;
          try
            TM_Auxi.Append;
            TM_AuxiComb.AsInteger       :=QL_DliqcCOMBUSTIBLE.AsInteger;
            TM_AuxiCombustible.AsString :=QL_DliqcNombreCombustible.AsString;
            TM_AuxiCantidad.AsFloat     :=xCantFct;
            TM_AuxiSubtotal.AsFloat     :=xSubFct;
            TM_AuxiIva.AsFloat          :=xIvaFct;
            TM_AuxiTotal.AsFloat        :=xImpFct;
            TM_Auxi.Post;
          except
            TM_Auxi.Cancel;
          end;
          try
            TM_IEPS.Append;
            TM_IEPSCombustible.AsInteger:=QL_DliqcCombustible.AsInteger;
            TM_IEPSLitros.AsFloat:=xCantFct;
            TM_IEPSIVA.AsFloat:=xIvaFct;
            try
              Q_Auxi.Close;
              Q_AuxiStr10.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select Nombre as Str10 from dgastcmb where clave='+IntToStr(QL_DliqcCombustible.AsInteger));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              TM_IEPSDescripcion.AsString:=Q_AuxiStr10.AsString;
            finally
              Q_Auxi.Close;
            end;
            TM_IEPS.Post;
          except
            TM_IEPS.Cancel;
          end;
        end;
        if ModoRep=0 then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_AuxiReal2.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1, sum(Total) as Real2 from DGASAJUD2');
          if CBEst.Checked then
            Q_Auxi.SQL.Add('Where ')
          else
            Q_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion)+' and');
          Q_Auxi.SQL.Add('   Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
          Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
          Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          Cantidad:=Cantidad-Q_AuxiReal1.AsFloat;
          Importe:=Importe-Q_AuxiReal2.AsFloat;
          Ajuste:=Ajuste+Q_AuxiReal2.AsFloat;
        end;
        importe   := importe - xImpFct;
        cantidad  := cantidad - xCantFct;
//        if (FLIQREP05P.CheckBox3.Checked) and (not SwDesglose) then
//          DMCUP.DamePrecioFecha(QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaFin,precioprom,xTasaIva)
//        else
          precioprom:=AjustaFloat(DivideFloat(Importe,Cantidad),4);
        Subtotal:=AjustaFloat(DivideFloat(Importe,1+GetTasaIVAdeCombustible(estacion,QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaFin)/100),2);
        Iva:=Importe-Subtotal;
        totc:=totc+Importe;
        totcant:=totcant+Cantidad;
        if DMCUP.SwSubModuloCupReformas2008 then begin
          IEPS:=DMCUP.DameIEPS(QL_DliqcCombustible.AsInteger,VgFechaIni);
          IEPS:=cantidad*IEPS;
          ImporteAIEPS:=(Importe-IEPS)/(1+GetTasaIVAdeCombustible(estacion,QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaFin)/100);
          iva:=(Importe-IEPS-ImporteAIEPS);
          subtotal:=ImporteAIEPS+IEPS;
        end;
        tsubtotal:=tsubtotal+Subtotal;
        tiva:=tiva+Iva;
        if not SwDesglose then begin
          xlin:='D//'+QL_DliqcNombreCombustible.AsString+'// //'+FormatFloat('##,##0.0000',Cantidad)+'//'+
                      FormatFloat('##,##0.0000',precioprom)+'//'+
                      FormatoMoneda(subtotal)+'//'+FormatoMoneda(iva)+'//'+
                      FormatoMoneda(subtotal+iva)+'//';
        end
        else begin
          ximpd:=AjustaFloat(subtotal+iva,2);
          ttimp:=ttimp+ximpd;
          subtotal:=AjustaFloat(DivideFloat(ximpd,(1+GetTasaIVAdeCombustible(estacion,QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaFin)/100)),2);
          iva:=ximpd-subtotal;
          ttotc:=ttotc+Cantidad;
          if DMCUP.SwSubModuloCupReformas2008 then begin
            IEPS:=DMCUP.DameIEPS(QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaIni);
            IEPS:=cantidad*IEPS;
            ImporteAIEPS:=(subtotal+iva-IEPS)/(1+GetTasaIVAdeCombustible(estacion,QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaFin)/100);
            iva:=subtotal+iva-IEPS-ImporteAIEPS;
            subtotal:=ImporteAIEPS+IEPS;
          end;
          ttiva:=ttiva+iva;
          ttsubtotal:=ttsubtotal+subtotal;
          xlin:='D//'+QL_DliqcNombreCombustible.AsString+'// //'+FormatFloat('##,##0.0000',cantidad)+'//'+
                      FormatFloat('##,##0.0000',precioprom)+'//'+
                      FormatoMoneda(subtotal)+'//'+FormatoMoneda(iva)+'//'+
                      FormatoMoneda(subtotal+iva)+'//';
        end;

        totalesIVA[indice]:=iva;
        indice:=indice+1;



        BndDt.Items.Add(xlin);
        FAvance.AvanzaPosicion;
        QL_Dliqc.Next;
      end;
    finally
      FAvance.Close;
    end;

    if not SwDesglose then
      xlin:='T// // //'+FormatoMoneda(totcant)+'// //'+FormatoMoneda(tsubtotal)+'//'+
                        FormatoMoneda(tiva)+'//'+FormatoMoneda(totc)+'//'
    else
      xlin:='T// // //'+FormatoMoneda(ttotc)+'// //'+FormatoMoneda(ttsubtotal)+'//'+
                        FormatoMoneda(ttiva)+'//'+FormatoMoneda(ttimp)+'//';
    BndDt.Items.Add(xlin);

    if (FLIQREP05P.CheckBox3.Checked) and (not SwDesglose) and (TM_Auxi.RecordCount>0) then begin
      xlin:='E//Combustible Facturado.';
      BndDt.Items.Add(xlin);
      FAVANCE.PreparaAvance('Preparando combustible facturado...',True,TM_Auxi.RecordCount-1);
      try
        TM_Auxi.SortOnFields('Comb',False,False);
        TM_Auxi.First;
        while not TM_Auxi.Eof do begin
          precioprom:=AjustaFloat(DivideFloat(TM_AuxiTotal.AsFloat,TM_AuxiCantidad.AsFloat),4);
//          DMCUP.DamePrecioFecha(TM_AuxiComb.AsInteger,VgFechaFin,precioprom,xTasaIva);
          xlin:='D//'+TM_AuxiCombustible.AsString+'// //'+FormatoMoneda(TM_AuxiCantidad.AsFloat)+'//'+
                      FormatFloat('##,##0.0000',precioprom)+'//'+
                      FormatoMoneda(TM_AuxiSubtotal.AsFloat)+'//'+FormatoMoneda(TM_AuxiIva.AsFloat)+'//'+
                      FormatoMoneda(TM_AuxiSubtotal.AsFloat+TM_AuxiIva.AsFloat)+'//';
          BndDt.Items.Add(xlin);
          totcantFct:=totcantFct + TM_AuxiCantidad.AsFloat;
          tsubtotalFct:=tsubtotalFct + TM_AuxiSubtotal.AsFloat;
          tivaFct:=tivaFct + TM_AuxiIva.AsFloat;
          totcFct:=totcFct+ (TM_AuxiSubtotal.AsFloat+TM_AuxiIva.AsFloat);
          TM_Auxi.Next;
          FAVANCE.AvanzaPosicion;
        end;
      finally
        FAVANCE.Close;
        xlin:='T// // //'+FormatoMoneda(totcantFct)+'// //'+FormatoMoneda(tsubtotalFct)+'//'+
                      FormatoMoneda(tivaFct)+'//'+FormatoMoneda(totcFct)+'//';
        BndDt.Items.Add(xlin);
        
        BndDt.Items.Add('D//');

        xlin:='T//Total Combustible // //'+FormatoMoneda(totcant+totcantFct)+'// //'+FormatoMoneda(tsubtotal+tsubtotalFct)+'//'+
                        FormatoMoneda(tiva+tivaFct)+'//'+FormatoMoneda(totc+totcFct)+'//';
        BndDt.Items.Add(xlin);
      end;
    end;

//
    QL_Clas.Close;
    QL_Clas.Prepare;
    QL_Clas.Open;
    if QL_Clas.IsEmpty then begin
      AbreTablasGenT('CATA;CLAS');
      if LocalizaTabla(T_Cata,'ClaveCata',idProdG) then begin
        T_Clas.Insert;
        T_ClasClaveCata.AsString:=idProdG;
        T_ClasClaveClasif.AsInteger:=1;
        T_ClasDescripcion.AsString:='Aceites y Derivados';
        T_Clas.Post;
      end;
      T_Cata.Refresh;
      with DMGAS do begin
        try
          DBGAS1.StartTransaction;
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Update DGASPROD set Linea=1');
          Q_Auxi.Prepare;
          Q_Auxi.ExecSQL;
          DBGAS1.Commit;
        except
          DBGAS1.Rollback;
        end;
      end;
      QL_Clas.Close;
      QL_Clas.Prepare;
      QL_Clas.Open;
    end;
    tota2:=0; Subtota2:=0;

    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Clas.RecordCount);
      while not QL_Clas.Eof do begin
        if QL_Clas.Bof then
          xlin:='A//'+QL_ClasDescripcion.AsString+'//Saldo Inicial//Entradas//Devolución//Saldo Final//Ventas//'+
                      'Precio//Importe'
        else
          xlin:='E//'+QL_ClasDescripcion.AsString;
        BndDt.Items.Add(xlin);
        tota:=0; SubTotal:=0;
        QL_Dliqa.Close;
        QL_Dliqa.SQL.Clear;
        QL_Dliqa.SQL.Add('Select distinct a.Producto from DGASDLIQA a ');
        if CBEst.Checked then
          QL_Dliqa.SQL.Add('Where ')
        else
          QL_Dliqa.SQL.Add('Where a.Estacion='+IntToStr(estacion)+' and ');
        QL_Dliqa.SQL.Add('  a.Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni))+' and Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin))+' and');
        QL_Dliqa.SQL.Add('  a.producto in (Select Clave from dgasprod where linea='+IntToStr(QL_ClasClaveClasif.AsInteger)+') ');
        QL_Dliqa.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+QuotedStr('Si')+') ');
        QL_Dliqa.SQL.Add('Order by Producto');
        QL_Dliqa.Prepare;
        QL_Dliqa.Open;
        FAvance.PreparaAvance2(true,QL_Dliqa.RecordCount);
        while not QL_Dliqa.Eof do begin
    //Saldo Incial del Producto
          QL_Dliqa2.Close;
          QL_Dliqa2.SQL.Clear;
          QL_Dliqa2.SQL.Add('select a.isla,sum(a.sald_ini) as saldoinicial from dgasdliqa a ');
          QL_Dliqa2.SQL.Add('where a.fecha=(select min(z.fecha) from dgasdliqa z where z.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni))+' and z.fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin))+') ');
          QL_Dliqa2.SQL.Add('  and a.producto='+IntToStr(QL_DliqaProducto.AsInteger));
          QL_Dliqa2.SQL.Add('  and turno=(Select min(y.turno) from dgasdliqa y ');
          if CBEst.Checked then
            QL_Dliqa2.SQL.Add('Where ')
          else
            QL_Dliqa2.SQL.Add(' where y.estacion='+IntToStr(Estacion)+' and ');
          QL_Dliqa2.SQL.Add('  y.isla=a.isla and y.fecha=a.fecha) ');
          if not CBEst.Checked then
            QL_Dliqa2.SQL.Add('  and a.estacion='+IntToStr(Estacion));
          QL_Dliqa2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+QuotedStr('Si')+') ');
          QL_Dliqa2.SQL.Add('group by a.isla');
          QL_Dliqa2.Prepare;
          QL_Dliqa2.Open;
          saldoini:=0;
          while not QL_Dliqa2.Eof do begin
            saldoini:=saldoini+QL_Dliqa2SaldoInicial.AsFloat;
            QL_Dliqa2.Next;
          end;

          Q_Auxi.Close;
          Q_AuxiReal2.FieldKind:=fkInternalCalc;
          Q_AuxiReal3.FieldKind:=fkInternalCalc;
          Q_AuxiReal5.FieldKind:=fkInternalCalc;
          Q_AuxiReal6.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(a.Entradas) as Real2, sum(a.Devol) as Real3, sum(a.Importe) as Real5, sum(a.Venta) as Real6 from DGASDLIQA a');
          if CBEst.Checked then
            Q_Auxi.SQL.Add('Where ')
          else
            Q_Auxi.SQL.Add('Where a.Estacion='+IntToStr(estacion)+' and ');
          Q_Auxi.SQL.Add('   a.Producto='+IntToStr(QL_DliqaProducto.AsInteger));
          Q_Auxi.SQL.Add('  and a.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
          Q_Auxi.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
          Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+QuotedStr('Si')+')');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          saldofin:=saldoini+Q_AuxiReal2.AsFloat-(Q_AuxiReal6.AsFloat+Q_AuxiReal3.AsFloat);
          venta:=Q_AuxiReal6.AsFloat;
          precioprom:=AjustaFloat(DivideFloat(Q_AuxiReal5.AsFloat,venta),2);
          Precio:=PrecioProductoFecha(QL_DliqaProducto.AsInteger,VgFechaFin);
          SubTotal:=SubTotal+DivideFloat(Q_AuxiReal5.AsFloat,1+PreaTasaIva/100);

          xlin:='D//'+IntToClaveNum(QL_DliqaProducto.AsInteger,3)+'-'+QL_DliqaNombreProducto.AsString+'//'+FormatoMoneda(saldoini)+'//'+
                      FormatoMoneda(Q_AuxiReal2.AsFloat)+'//'+FormatoMoneda(Q_AuxiReal3.AsFloat)+'//'+
                      FormatoMoneda(saldofin)+'//'+FormatoMoneda(Venta)+'//'+
                      FormatFloat('##,##0.00',precioprom)+'//'+FormatoMoneda(Q_AuxiReal5.AsFloat);

          tota:=tota+Q_AuxiReal5.AsFloat;
          if chOcultarVentas.Checked then begin
            if venta > 0.001 then
              BndDt.Items.Add(xlin);
          end else
            BndDt.Items.Add(xlin);
          ttimpdevP:=ttimpdevP+Q_AuxiReal3.AsFloat;
          FAvance.AvanzaPosicion2;
          QL_Dliqa.Next;
        end;
        FAvance.Close2;
        xlin:='T//';
        InsertaElemStr('Subtotal...',4,xlin);
        InsertaElemStr(FormatoMoneda(Subtotal),5,xlin);
        InsertaElemStr('Iva...',6,xlin);
        InsertaElemStr(FormatoMoneda(Tota-Subtotal),7,xlin);
        InsertaElemStr('Total...',8,xlin);
        InsertaElemStr(FormatoMoneda(tota),9,xlin);
        BndDt.Items.Add(xlin);
        tota2:=tota2+tota;
        subtota2:=subtota2+subtotal;
        QL_Clas.Next;
        FAvance.AvanzaPosicion;
      end;
    finally
      FAvance.Close;
    end;                

    if tota<>tota2 then begin
      xlin:='T//Total Productos';
      InsertaElemStr('Subtotal...',4,xlin);
      InsertaElemStr(FormatoMoneda(Subtota2),5,xlin);
      InsertaElemStr('Iva...',6,xlin);
      InsertaElemStr(FormatoMoneda(Tota2-Subtota2),7,xlin);
      InsertaElemStr('Total...',8,xlin);
      InsertaElemStr(FormatoMoneda(tota2),9,xlin);
      BndDt.Items.Add(xlin);
    end;
//
    BndDt.Items.Add('S//Resumen de Ventas:');
    if SwDesglose then begin
      BndDt.Items.Add('D//Combustibles// //'+FormatoMoneda(ttimp)+'//'+
                          FormatFloat('##0.00',AjustaFloat(DivideFloat(ttimp,ttimp+tota2)*100,2))+'%');
      BndDt.Items.Add('D//Productos// //'+FormatoMoneda(tota2)+'//'+
                          FormatFloat('##0.00',AjustaFloat(DivideFloat(tota2,ttimp+tota2)*100,2))+'%');
      BndDt.Items.Add('R// // //'+FormatoMoneda(ttimp+tota2)+'//100.00%')
    end
    else begin
      BndDt.Items.Add('D//Combustibles// //'+FormatoMoneda(totc)+'//'+
                          FormatFloat('##0.00',AjustaFloat(DivideFloat(totc,totc+tota2)*100,2))+'%');
      BndDt.Items.Add('D//Productos// //'+FormatoMoneda(tota2)+'//'+
                          FormatFloat('##0.00',AjustaFloat(DivideFloat(tota2,totc+tota2)*100,2))+'%');
      BndDt.Items.Add('R// // //'+FormatoMoneda(totc+tota2)+'//100.00%');
    end;
//
    BndDt.Items.Add('S//Resumen de Ingresos:');
    QL_Dliqp.Close;
    QL_Dliqp.SQL.Clear;
    QL_Dliqp.SQL.Add('Select distinct p.Clave_Pago from DGASDLIQP p ');
    if CBEst.Checked then
      QL_Dliqp.SQL.Add('Where ')
    else
      QL_Dliqp.SQL.Add('Where p.Estacion='+IntToStr(estacion)+' and ');
    QL_Dliqp.SQL.Add('  p.Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni))+' and p.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
    QL_Dliqp.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=p.estacion and m.folio=p.folio and m.aplicado='+QuotedStr('Si')+') ');
    QL_Dliqp.SQL.Add('Order by p.Clave_Pago ');
//    QL_Dliqp.ParamByName('pestacion').AsInteger:=estacion;
//    QL_Dliqp.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
//    QL_Dliqp.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqp.Prepare;
    QL_Dliqp.Open;
    totp:=0;

    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Dliqp.RecordCount);
      while not QL_Dliqp.Eof do begin
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select sum(p.Importe) as Real1 from DGASDLIQP p');
        if CBEst.Checked then
          Q_Auxi.SQL.Add('Where ')
        else
          Q_Auxi.SQL.Add('Where p.Estacion='+IntToStr(estacion)+' and ');
        Q_Auxi.SQL.Add('   p.Clave_pago="'+QL_DliqpClave_Pago.AsString+'"');
        Q_Auxi.SQL.Add('  and p.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
        Q_Auxi.SQL.Add('  and p.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
        Q_Auxi.SQL.Add('and exists(select m.* from dgasliqg m where m.estacion=p.estacion and m.folio=p.folio and m.aplicado='+QuotedStr('Si')+')');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        Pago:=Q_AuxiReal1.AsFloat;
        if abs(Pago)<0.001 then begin
          QL_Dliqp.Next;
          Continue;
        end;
        if ModoRep=0 then begin
          if QL_DliqpClasePago.AsString='Efectivo' then begin
            Pago:=Pago-Ajuste;
            Ajuste:=0;
          end;
        end;
        xdif:=0;
        if {(SwDesglose)and}(QL_DliqpClave_Pago.AsString=QL_TpagClave.AsString) then begin
          i:=999;
          totefectivo:=totefectivo+pago;
         { xdif:=totc-ttimp;
          totefectivo:=Pago-xdif;
          xlin:='D//'+QL_DliqpDescripcionPago.AsString+'// //'+FormatoMoneda(totefectivo)+'//'+
                      FormatFloat('##0.00',AjustaFloat(DivideFloat(Pago,ttimp+tota2)*100,2))+'%';}
        end;
//        else
  //        xlin:='D//'+QL_DliqpDescripcionPago.AsString+'// //'+FormatoMoneda(Pago);
          xlin:='D//'+QL_DliqpDescripcionPago.AsString+'// //'+FormatoMoneda(Pago)+'//'+
                      FormatFloat('##0.00',AjustaFloat(DivideFloat(Pago,totc+tota2)*100,2))+'%';

        BndDt.Items.Add(xlin);
        if (SwDesglose)and(QL_DliqpClasePago.Asstring='Efectivo') then begin
          if i=999 then
            i:=BndDt.Items.IndexOf(xlin)
          else begin
            xlin:=BndDt.Items[i];
            InsertaElemStr(FormatoMoneda(totefectivo+Pago),4,xlin);
            BndDt.Items[i]:=xlin;
            BndDt.Items.Delete(BndDt.Items.Count-1);

          end;
        end;
        {if SwDesglose then
          totp:=totp+Pago-xdif
        else}
          totp:=totp+Pago;
        QL_Dliqp.Next;
        FAvance.AvanzaPosicion;
      end;
    finally
      FAvance.Close;
    end;


    xlin:='R// // //'+FormatoMoneda(totp)+'//100.00%';
    BndDt.Items.Add(xlin);
    if (CheckBox2.Checked)and((ttimpdevP>0.01)or(ttimpdevC>0.01)) then begin
      BndDt.Items.Add('S//Resumen de Devoluciones:');
      BndDt.Items.Add('D//Combustibles// //'+FormatoMoneda(ttimpdevC)+'//'+
                          FormatFloat('##0.00',AjustaFloat(DivideFloat(ttimpdevC,ttimpdevC+ttimpdevP)*100,2))+'%');
      BndDt.Items.Add('D//Productos// //'+FormatoMoneda(ttimpdevP)+'//'+
                         FormatFloat('##0.00',AjustaFloat(DivideFloat(ttimpdevP,ttimpdevC+ttimpdevP)*100,2))+'%');
      BndDt.Items.Add('R// // //'+FormatoMoneda(ttimpdevC+ttimpdevP)+'//'+
                          FormatFloat('##0.00',AjustaFloat((DivideFloat(ttimpdevP,ttimpdevC+ttimpdevP)*100)+(DivideFloat(ttimpdevC,ttimpdevC+ttimpdevP)*100),2))+'%');
    end;
    if ((CheckBox4.Checked) and (ttvolcons > 0)) then begin
      BndDt.Items.Add('S//Resumen de Ventas a Consignación:');

      TM_VtasCons.First;
      while not TM_VtasCons.eof do begin
        BndDt.Items.Add('D//'+TM_VtasConsNombreCmb.AsString+'// //'+FormatoMoneda(TM_VtasConsVolumen.AsFloat)+'//'+
                          FormatFloat('##0.00',AjustaFloat(DivideFloat(TM_VtasConsVolumen.AsFloat,ttvolcons)*100,2))+'%');
        TM_VtasCons.next;
      end;
      BndDt.Items.Add('R// // //'+FormatoMoneda(ttvolcons)+'//'+
                          FormatFloat('##0.00',AjustaFloat(100,2))+'%');
    end;
    if (VarComp('Elab1Camp')='Si')and(estacion=1) then begin
      BndDt.Items.Add('D//');
      BndDt.Items.Add('D//');
      BndDt.Items.Add('E//Formuló: Gabriela Chaparro Moreno');
      BndDt.Items.Add('E//Cajera del Turno');
      SwImprimeFechaHora := False;
    end;
    if (VarComp('Elab2Camp')='Si')and(estacion=2) then begin
      BndDt.Items.Add('D//');
      BndDt.Items.Add('D//');
      BndDt.Items.Add('E//Formuló: Lizeth Gpe. Leyva Miranda');
      BndDt.Items.Add('E//Cajera del Turno.');
      SwImprimeFechaHora := False;
    end;
    if CBIEPS.Checked then begin
      IEPS:=0; IEPSLts:=0;
      FAvance.PreparaAvance('Preparando resumen IEPS...',true,QL_Dliqc.RecordCount);
      try
        BndDt.Items.Add('D//');
        BndDt.Items.Add('D//');
        BndDt.Items.Add('S// Resumen de IEPS por Litro:');
        BndDt.Items.Add('E//Combustible //IEPS/Lts //Litros //Total IEPS //Total IVA');
        IEPSLts:=0;
        if not FLIQREP05P.CheckBox3.Checked then begin
          QL_Ieps.Close;
          QL_Ieps.SQL.Clear;
          QL_Ieps.SQL.Add('select l.combustible as Entero1,');
          QL_Ieps.SQL.Add('(Select Nombre from dgastcmb where clave=l.combustible) as Str50,');
          QL_Ieps.SQL.Add('sum(l.cantidad) as Real2,sum(l.importe_ieps) as Real3 from dgasdliqc l');
          if CBEst.Checked then
            QL_Ieps.SQL.Add('Where ')
          else
            QL_Ieps.SQL.Add('Where Estacion='+IntToStr(estacion)+' and ');
          if VgFechaIni<DMGAS.VarGasFechaInicioIEPS then
            QL_Ieps.SQL.Add('   l.fecha>='+QuotedStr(FechaToStrSQL(DMGAS.VarGasFechaInicioIEPS)))
          else
            QL_Ieps.SQL.Add('   l.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
          QL_Ieps.SQL.Add('  and l.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
          QL_Ieps.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=l.estacion and m.folio=l.folio and m.aplicado='+QuotedStr('Si')+')');
          QL_Ieps.SQL.Add('group by l.combustible');
          QL_Ieps.Prepare;
          QL_Ieps.Open;
          indice:=0;
          while not QL_Ieps.Eof do begin
            try
              QL_Auxi.Close;
              IEPS:=DMCUP.DameIEPS(QL_IepsEntero1.AsInteger,VgFechaIni);
              if ModoRep=0 then begin
                QL_Auxi.SQL.Clear;
                QL_Auxi.SQL.Add('Select sum(Diferencia) as Real1, Combustible from DGASAJUD2');
                if CBEst.Checked then
                  QL_Auxi.SQL.Add('Where ')
                else
                  QL_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion)+' and ');
                QL_Auxi.SQL.Add('   Combustible='+IntToStr(QL_IepsEntero1.AsInteger));
                if VgFechaIni<DMGAS.VarGasFechaInicioIEPS then
                  QL_Auxi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(DMGAS.VarGasFechaInicioIEPS )))
                else
                  QL_Auxi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
                QL_Auxi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
                QL_Auxi.SQL.Add('Group by Combustible');
                QL_Auxi.Prepare;
                QL_Auxi.Open;
              end;
              if ModoRep=0 then
                IEPSLts:=IEPSLts+(QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)*IEPS
              else
                IEPSLts:=IEPSLts+(QL_IepsReal2.AsFloat)*IEPS;
              xlin:='Z//'+QL_IepsStr50.AsString+'//'+FloatToStr(IEPS)+'//'+FormatoMoneda(QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)+'//'+FormatoMoneda((QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)*IEPS)+'//'+FormatoMoneda(totalesIVA[indice]);
              BndDt.Items.Add(xlin);
            finally
              QL_Auxi.Close;
            end;
            QL_Ieps.Next;
            FAVANCE.AvanzaPosicion;
            indice:=indice+1;
          end;
        end
        else begin
          TM_IEPS.First;
          indice:=0;
          tiva:=0;
          ttiva:=0;
          while not TM_IEPS.Eof do begin
            IEPS:=DMCUP.DameIEPS(TM_IEPSCombustible.AsInteger,VgFechaIni);
            IEPSLts:=IEPSLts+(TM_IEPSLitros.AsFloat)*IEPS;
            tiva:=tiva+TM_IEPSIVA.AsFloat;
            ttiva:=ttiva+TM_IEPSIVA.AsFloat;
            xlin:='Z//'+TM_IEPSDescripcion.AsString+'//'+FloatToStr(IEPS)+'//'+FormatoMoneda(TM_IEPSLitros.AsFloat)+'//'+FormatoMoneda((TM_IEPSLitros.AsFloat)*IEPS)+'//'+FormatoMoneda(TM_IEPSIVA.AsFloat);
            BndDt.Items.Add(xlin);
            TM_IEPS.Next;
            FAVANCE.AvanzaPosicion;
            indice:=indice+1;
          end;
        end;
        if not SwDesglose then begin
          BndDt.Items.Add('X// // //Total... // '+FormatoMoneda(IEPSLts)+' //'+FormatoMoneda(tiva));
        end
        else begin
          BndDt.Items.Add('X// // //Total... // '+FormatoMoneda(IEPSLts)+' //'+FormatoMoneda(ttiva));
        end;
      finally
        FAVANCE.Close;
      end;
    end;
  end;
  if FLIQREP05P.CBRT.Checked then begin
    BndDt.Items.Add('D//');
    xlin:='E//Inventario en Tanques';
    BndDt.Items.Add(xlin);
    xlin:='A//Tanque - Combustible //Inv. Inicial //Entrada //Inv. Final';
    BndDt.Items.Add(xlin);
    try
      QL_Tanq.Close;
      QL_Tanq.SQL.Clear;
      QL_Tanq.SQL.Add('SELECT distinct tanque, combustible FROM DPVGCVOLT WHERE FECHA='+QuotedStr(FechaToStrSQL(VgFechaIni)));
      QL_Tanq.Prepare;
      QL_Tanq.Open;
      FAVANCE.PreparaAvance('Resumen de tanques...',True,QL_Tanq.RecordCount);
      while not QL_Tanq.Eof do begin
        xlin:='';
        if QL_TanqCOMBUSTIBLE.AsInteger=1 then begin
          xlin:='D//'+IntToClaveNum(QL_TanqTANQUE.AsInteger,2)+' - Magna //'+FormatoMoneda(medicion_tanque_turno_anterior(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni))+
                '//'+FormatoMoneda(Entrada_Tanque_Fecha(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin))+' //'+FormatoMoneda(Medicion_tanque_UltimoTurno(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin));
        end
        else if QL_TanqCOMBUSTIBLE.AsInteger=2 then begin
          xlin:='D//'+IntToClaveNum(QL_TanqTANQUE.AsInteger,2)+' - Premium //'+FormatoMoneda(medicion_tanque_turno_anterior(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni))+
                '//'+FormatoMoneda(Entrada_Tanque_Fecha(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin))+' //'+FormatoMoneda(Medicion_tanque_UltimoTurno(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin));
        end
        else if QL_TanqCOMBUSTIBLE.AsInteger=3 then begin
          xlin:='D//'+IntToClaveNum(QL_TanqTANQUE.AsInteger,2)+' - Diesel //'+FormatoMoneda(medicion_tanque_turno_anterior(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni))+
                '//'+FormatoMoneda(Entrada_Tanque_Fecha(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin))+' //'+FormatoMoneda(Medicion_tanque_UltimoTurno(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin));
        end;
        if xlin<>'' then
          BndDt.Items.Add(xlin);
        QL_Tanq.Next;
        FAVANCE.AvanzaPosicion;
      end;
    finally
      FAVANCE.Close;
      QL_Tanq.Close;
    end;
  end;
//  FAVANCE.Close;
end;

procedure TFLIQREP05.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
  function ObtenerDir(xSucl:Integer):String;
  begin
    with DMGEN do begin
      try
        Result:='';
        try
          Q_Auxi.Close;
          Q_AuxiStr40.FieldKind:=fkInternalCalc;
          Q_AuxiStr50.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('SELECT DIRECCION AS Str40, POBLACION as Str50 FROM DGENSUCL WHERE CLAVE='+IntToStr(xSucl));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
        except
          on e:Exception do
            raise Exception.Create(e.Message);
        end;
      finally
        Result:=Q_AuxiStr40.AsString+'    '+Q_AuxiStr50.Asstring+'    ';
        Q_Auxi.Close;
      end;
    end;
  end;
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    if ModoRep=1 then //03-12-15
      QRLRep.Caption:=QRLRep.Caption+'*';
    if FLIQREP05P.CBEst.Checked then
      QRLEstacion.Caption:='Todas las estaciones'
    else
      QRLEstacion.Caption:=FLIQREP05P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
    if QT_EmprSERIEKEY.AsInteger=485 then
      QRLDir.Caption:=ObtenerDir(DMGAS.T_EstsSUCURSAL.AsInteger)+QT_EmprRFC.AsString;
  end;
  if ModoRep=0 then
    QRLSistema.Caption:=IdSistNombre
  else
    QRLSistema.Caption:='';
  if SwImprimeFechaHora then
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep)
  else
    QRLFechaHora.Caption:='';
  SwAceites:=false;
  xtipo:=1;
  IniciaEtiquetasCmb;
end;

procedure TFLIQREP05.BndDtBeforePrint(Sender: TQRCustomBand;
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
          if k in [3,4] then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp in ['A','E'] then Font.Style:=[fsBold];
        if xtp='T' then begin
          if not pSwNegritas then Font.Style:=[fsBold];
          if xtipo=1 then begin
            if k in [3,5,6,7] then Frame.DrawTop:=true
            else Frame.DrawTop:=false;
          end
          else if xtipo=2 then
            if k=8 then Frame.DrawTop:=true
            else Frame.DrawTop:=false;
        end;
        if xtp='X' then begin
          if not pSwNegritas then Font.Style:=[fsBold];
          if k in [4,5] then Frame.DrawTop:=true
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
    if not SwAceites then IniciaEtiquetasProd;
    swaceites:=true;
  end;
  if xtp in ['A','S'] then inc(xtipo);
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQREP05.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

function TFLIQREP05.medicion_tanque_turno_anterior(tanque: string; fecha_completa: TDateTime): real;
var
  FechaAnt:TDateTime;
  CorteAnt:Integer;
begin
  with DMCONS do begin
    try
      Q_Auxi.Close;
      Q_AuxiDate1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Max(Fecha) as Date1 from DPVGTURNT');
      Q_Auxi.SQL.Add('Where Fecha<"'+FechaToStrSQL(fecha_completa)+'"');
      Q_Auxi.SQL.Add('  and Tanque='+tanque);
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if not Q_Auxi.IsEmpty then
        FechaAnt:=Q_AuxiDate1.AsDateTime
      else
        FechaAnt:=fecha_completa;

      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Max(Turno) as Entero1 from DPVGTURNT');
      Q_Auxi.SQL.Add('Where Fecha="'+FechaToStrSQL(FechaAnt)+'"');
      Q_Auxi.SQL.Add('  and Tanque='+tanque);
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_Auxi.RecordCount>0 then begin
        CorteAnt:=Q_AuxiEntero1.AsInteger;Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Volumen as Real1 from DPVGTURNT');
        Q_Auxi.SQL.Add('Where Fecha="'+FechaToStrSQL(FechaAnt)+'"');
        Q_Auxi.SQL.Add('  and Turno='+InttoStr(CorteAnt));
        Q_Auxi.SQL.Add('  and Tanque='+tanque);
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if not Q_Auxi.IsEmpty then
          Result:=Q_AuxiReal1.AsFloat
        else
          Result:=0;
        Q_Auxi.Close;
      end
      else
        Result:=0;
    finally
       Q_Auxi.Close;
    end;
  end;
end;

function TFLIQREP05.Medicion_tanque_UltimoTurno(tanque:string;FechaIni,FechaFin:TDateTime):Real;
var
  FechaMax:TDateTime;
  CorteMax:Integer;
begin
  with DMCONS do begin
    try
      Q_Auxi.Close;
      Q_AuxiDate1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Max(Fecha) as Date1 from DPVGTURNT');
      Q_Auxi.SQL.Add('Where Fecha>="'+FechaToStrSQL(FechaIni)+'"');
      Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(FechaFin)+'"');
      Q_Auxi.SQL.Add('  and Tanque='+tanque);
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if not Q_Auxi.IsEmpty then
        FechaMax:=Q_AuxiDate1.AsDateTime
      else
        FechaMax:=FechaFin;

      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Max(Turno) as Entero1 from DPVGTURNT');
      Q_Auxi.SQL.Add('Where Fecha="'+FechaToStrSQL(FechaMax)+'"');
      Q_Auxi.SQL.Add('  and Tanque='+tanque);
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if not Q_Auxi.IsEmpty then begin
        CorteMax:=Q_AuxiEntero1.AsInteger;
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Volumen as Real1 from DPVGTURNT');
        Q_Auxi.SQL.Add('Where Fecha="'+FechaToStrSQL(FechaMax)+'"');
        Q_Auxi.SQL.Add('  and Turno='+InttoStr(CorteMax));
        Q_Auxi.SQL.Add('  and Tanque='+tanque);
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if not Q_Auxi.IsEmpty then
          Result:=Q_AuxiReal1.AsFloat
        else
          Result:=0;
        Q_Auxi.Close;
      end
      else
        Result:=0;
    finally
       Q_Auxi.Close;
    end;
  end;
end;

function TFLIQREP05.Entrada_Tanque_Fecha(tanque: string;
  FechaIni,FechaFin:TDateTime): Real;
begin
  with DMCONS do begin
    try
      Result:=0;
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT coalesce(Sum(VOLUMENRECEPCION),0) as Real1 FROM DPVGETAN');
      Q_Auxi.SQL.Add('WHERE FECHA>='+QuotedStr(FechaToStrSQL(FechaIni)));
      Q_Auxi.SQL.Add('  AND FECHA<='+QuotedStr(FechaToStrSQL(FechaFin)));
      Q_Auxi.SQL.Add('  AND TANQUE='+tanque+' AND TRASPASO='+QuotedStr('No'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Result:=Q_AuxiReal1.AsFloat;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

end.
