unit ULIQREPESP01;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS,
  QRPDFFilt;

type
  TFLIQREPESP01 = class(TForm)
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
    QL_Dliqa: TQuery;
    QL_Dliqp: TQuery;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcNombreCombustible: TStringField;
    QRLEstacion: TQRLabel;
    QL_Tpag: TQuery;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_Dliqa2: TQuery;
    QL_Dliqa2ISLA: TIntegerField;
    QL_Dliqa2SALDOINICIAL: TFloatField;
    QL_Clas: TQuery;
    QL_ClasCLAVECLASIF: TIntegerField;
    QL_ClasDESCRIPCION: TStringField;
    QL_DliqaPRODUCTO: TIntegerField;
    QL_DliqaNombreProducto: TStringField;
    QL_Tanq: TQuery;
    QL_TanqTANQUE: TIntegerField;
    QL_TanqCOMBUSTIBLE: TIntegerField;
    QRPDFFilter1: TQRPDFFilter;
    BndDtA: TQRStringsBand;
    BndDtTP: TQRStringsBand;
    BndDtT: TQRStringsBand;
    Q_Clie: TQuery;
    Q_ClieCREDITO: TFloatField;
    Q_ClieDEBITO: TFloatField;
    Q_ClieNOCLIENTE: TIntegerField;
    BndDtCD: TQRStringsBand;
    BndDtCR: TQRStringsBand;
    Q_ClieNOMBRE: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtABeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtTAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure BndDtTPAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Q_ClieCalcFields(DataSet: TDataSet);
    procedure BndDtCDAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure BndDtCRAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    SwImprimeFechaHora:Boolean;
    QRLabelEnca,
    QRLabelDetaC,
    QRLabelDetaA,
    QRLabelDetaTt,
    QRLabelDetaT,
    QRLabelDetaCD,
    QRLabelDetaCR:array [1..8] of TQRLabel;
    procedure CreaEtiquetas;
    procedure IniciaEtiquetasTanq;
    procedure IniciaEtiquetasTipoP;
    function medicion_tanque_turno_anterior(tanque:string;fecha_completa:TDateTime):real;
    function Medicion_tanque_UltimoTurno(tanque:string;FechaIni,FechaFin:TDateTime):Real;
    function Entrada_Tanque_Fecha(tanque:string; FechaIni,FechaFin:TDateTime):Real;
  public
    { Public declarations }
    pSwNegritas:Boolean;
    LineaTotales:Integer;
    function PreparaReporte:Boolean;
  end;

Const
  xLeft=5;

var
  FLIQREPESP01: TFLIQREPESP01;
  xtp:string;
  xlin:string;
  xw,xl:Integer;
  xsw,SwAceites:Boolean;
  estacion:word;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREPESP01P, ULIQDESGLO, DDMGENT, UAVANCE, DDMCONS, DDMGEN_VTAS;

{$R *.DFM}

procedure TFLIQREPESP01.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to 8 do begin
    QRLabelDetaC[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    QRLabelDetaA[i] :=TQRLabel(BndDtA.AddPrintable(TQRLabel));
    QRLabelDetaTt[i]:=TQRLabel(BndDtTP.AddPrintable(TQRLabel));
    QRLabelDetaT[i] :=TQRLabel(BndDtT.AddPrintable(TQRLabel));
    QRLabelDetaCD[i]:=TQRLabel(BndDtCD.AddPrintable(TQRLabel));
    QRLabelDetaCR[i]:=TQRLabel(BndDtCR.AddPrintable(TQRLabel));
    xw:=78;
    with QRLabelDetaC[i] do begin
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
      xl:=xl+xw+4;
    end;
    with QRLabelDetaA[i] do begin
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
      xl:=xl+xw+4;
    end;
    with QRLabelDetaT[i] do begin
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
      xl:=xl+xw;
    end;
    with QRLabelDetaTt[i] do begin
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
      xl:=xl+xw;
    end;
    with QRLabelDetaCD[i] do begin
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
      xl:=xl+xw;
    end;
    with QRLabelDetaCR[i] do begin
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
      xl:=xl+xw;
    end;
  end;
end;

procedure TFLIQREPESP01.IniciaEtiquetasTipoP;
var i:word;
begin
  xl:=xleft;
  for i:=1 to 8 do begin
    with QRLabelDetaTt[i] do begin
      xw:=200;
      if i=1 then xw:=300;
      if i=2 then xw:=200;
      if i>3 then xl:=xl+4;
      Left      :=xl;
      Width     :=xw;
    end;
    xl:=xl+xw;
  end;
end;

procedure TFLIQREPESP01.IniciaEtiquetasTanq;
var i:word;
begin
  xl:=xleft;
  for i:=1 to 8 do begin
    with QRLabelDetaT[i] do begin
      xw:=90;
      if i=1 then xw:=180;
      if i>5 then xl:=xl+4;
      Left      :=xl;
      Width     :=xw;
    end;
    xl:=xl+xw;
  end;
end;

function TFLIQREPESP01.PreparaReporte:Boolean;
var
    TotalComb,SubtotalComb,TotalAceite,TotalGeneralAceite,TotalCombDev,TotalCantComb,PrecioUnidad,VentaAceite,Devoluciones,
    CantidadComb,ImporteComb,saldoini,saldofin,IEPS,IEPSLts,ImporteAIEPS,TotalCantAceite,IvaComb,TotalIngresos,TotalAjustado,
    TotalCantGenAceite,SubtotalGenComb,TotalIvaComb,TanqInicial,TanqueEntrada,TanqueFinal,TotalDebito,TotalCredito,TotalEfectivo:real;
    i:word;
    xTasaIva,TotalCreDeb:Real;
    totalesIVA:array[0..2] of Real;
    indice:Integer;
    swEfecOtros:boolean;
    swCreditoDebito:boolean;
begin
  Result:=False;
  with DMGEN,DMGENT,DMLIQ,DMCUP,DMGAS,FLIQREPESP01P do begin
    SwImprimeFechaHora:=True;
    CreaEtiquetas;

    //COMBUSTIBLES
    TotalComb:=0;
    TotalCantComb:=0;
    TotalCombDev:=0;
    Devoluciones:=0;
    SubtotalGenComb:=0;
    TotalIvaComb:=0;

    //ACEITES
    TotalCantAceite:=0;
    TotalCantGenAceite:=0;
    TotalAceite:=0;
    TotalGeneralAceite:=0;

    //RESUMEN DE INGRESOS
    TotalIngresos:=0;
    TotalAjustado:=0;

    //TANQUES
    TanqInicial:=0;
    TanqueEntrada:=0;
    TanqueFinal:=0;

    estacion:=DBLookupComboBox2.KeyValue;

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
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;

    BndDt.Items.Add('T//Resumen de ventas de combustibles');
    BndDt.Items.Add('TT//Combustible//Litros//Jarreos//Lts. Vendidos//Precio//Subtotal//I.V.A.//Total//');
    try
      FAvance.PreparaAvance('Preparando reporte combustibles...',true,QL_Dliqc.RecordCount);

      indice:=0;
      while not QL_Dliqc.Eof do begin
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_AuxiReal2.FieldKind:=fkInternalCalc;
        Q_AuxiReal3.FieldKind:=fkInternalCalc;
        Q_AuxiReal4.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select sum(c.Cantidad) as Real1, sum(c.Importe) as Real2, sum(c.Devolucion) as Real3, sum(c.Importe_IEPS) as Real4 from DGASDLIQC c');
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

        CantidadComb:=Q_AuxiReal1.AsFloat;
        ImporteComb:=Q_AuxiReal2.AsFloat;
        Devoluciones:=Q_AuxiReal3.AsFloat;
        IEPS:=Q_AuxiReal4.AsFloat;

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

        CantidadComb:=CantidadComb-Q_AuxiReal1.AsFloat;
        ImporteComb:=ImporteComb-Q_AuxiReal2.AsFloat;
        TotalAjustado:=TotalAjustado+Q_AuxiReal2.AsFloat;
        PrecioUnidad:=AjustaFloat(DivideFloat(ImporteComb,CantidadComb),4);
        SubtotalComb:=AjustaFloat(DivideFloat(ImporteComb,1+GetTasaIVAdeCombustible(estacion,QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaFin)/100),2);
        IvaComb:=ImporteComb-SubtotalComb;
        TotalCombDev:=TotalCombDev+Devoluciones;
        TotalComb:=TotalComb+ImporteComb;
        TotalCantComb:=TotalCantComb+CantidadComb;

        if DMCUP.SwSubModuloCupReformas2008 then begin
          IEPS:=DMCUP.DameIEPS(QL_DliqcCombustible.AsInteger,VgFechaIni);
          IEPS:=CantidadComb*IEPS;
          ImporteAIEPS:=(ImporteComb-IEPS)/(1+GetTasaIVAdeCombustible(estacion,QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaFin)/100);
          IvaComb:=(ImporteComb-IEPS-ImporteAIEPS);
          SubtotalComb:=ImporteAIEPS+IEPS;
        end;

        SubtotalGenComb:=SubtotalGenComb+SubtotalComb;
        TotalIvaComb:=TotalIvaComb+IvaComb;

        xlin:='D//'+QL_DliqcNombreCombustible.AsString+'//'+
                    FormatFloat('###,##0.00',CantidadComb+Devoluciones)+'//'+
                    FormatFloat('###,##0.00',Devoluciones)+'//'+
                    FormatFloat('###,##0.00',CantidadComb)+'//'+
                    FormatFloat('##,##0.0000',PrecioUnidad)+'//'+
                    FormatoMoneda(SubtotalComb)+'//'+
                    FormatoMoneda(IvaComb)+'//'+
                    FormatoMoneda(SubtotalComb+IvaComb)+'//';

        totalesIVA[indice]:=IvaComb;
        indice:=indice+1;

        BndDt.Items.Add(xlin);
        Result:=True;
        FAvance.AvanzaPosicion;
        QL_Dliqc.Next;
      end;
    finally
      FAvance.Close;
    end;

    xlin:='TC//Totales//'+
    FormatFloat('###,##0.00',TotalCantComb+TotalCombDev)+'//'+
    FormatFloat('###,##0.00',TotalCombDev)+'//'+
    FormatFloat('###,##0.00',TotalCantComb)+'// //'+
    FormatoMoneda(SubtotalGenComb)+'//'+
    FormatoMoneda(TotalIvaComb)+'//'+
    FormatoMoneda(TotalComb)+'//';

    BndDt.Items.Add(xlin);
    LineaTotales:=BndDt.Items.Count;

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

    try
      BndDtA.Items.Clear;
      BndDtA.Items.Add('T//Resumen de venta de Aceites y Derivados');
      FAvance.PreparaAvance('Preparando reporte aceites...',true,QL_Clas.RecordCount);
      while not QL_Clas.Eof do begin
        BndDtA.Items.Add('');

        if QL_Clas.Bof then
          xlin:='N//'+QL_ClasDescripcion.AsString+'//Inv. Inicial//Entradas//Devolución//Ventas//Inv. Final//'+
                      'Precio//Importe'
        else
          xlin:='N//'+QL_ClasDescripcion.AsString;

        BndDtA.Items.Add(xlin);

        TotalAceite:=0;
        TotalCantAceite:=0;

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
          VentaAceite:=Q_AuxiReal6.AsFloat;
          PrecioUnidad:=AjustaFloat(DivideFloat(Q_AuxiReal5.AsFloat,VentaAceite),2);
          xlin:='D//'+IntToClaveNum(QL_DliqaProducto.AsInteger,3)+'-'+QL_DliqaNombreProducto.AsString+'//'+FormatoMoneda(saldoini)+'//'+
                      FormatoMoneda(Q_AuxiReal2.AsFloat)+'//'+FormatoMoneda(Q_AuxiReal3.AsFloat)+'//'+FormatoMoneda(VentaAceite)+'//'+
                      FormatoMoneda(saldofin)+'//'+ FormatFloat('##,##0.00',PrecioUnidad)+'//'+FormatoMoneda(Q_AuxiReal5.AsFloat);

          TotalAceite:=TotalAceite+Q_AuxiReal5.AsFloat;
          TotalCantAceite:=TotalCantAceite+VentaAceite;

          BndDtA.Items.Add(xlin);
          Result:=True;
          FAvance.AvanzaPosicion2;
          QL_Dliqa.Next;
        end;
        FAvance.Close2;
        xlin:='TA//Total// // // //'+FormatoMoneda(TotalCantAceite)+'// // //'+FormatoMoneda(TotalAceite);
        BndDtA.Items.Add(xlin);

        TotalGeneralAceite:=TotalGeneralAceite+TotalAceite;
        TotalCantGenAceite:=TotalCantGenAceite+TotalCantAceite;

        QL_Clas.Next;
        FAvance.AvanzaPosicion;
      end;

      BndDt.Items.Insert(LineaTotales,'D//Aceites (Piezas vendidas)// // //'+FormatoMoneda(TotalCantGenAceite)+'// // // //'+FormatoMoneda(TotalGeneralAceite));
      BndDt.Items.Insert(LineaTotales+1,'T//Venta total// // // // // // //'+FormatoMoneda(TotalGeneralAceite+TotalComb));

      BndDtTP.Items.Clear;
      BndDtTP.Items.Clear;
      BndDtTP.Items.Add('');
      BndDtTP.Items.Add('N//Resumen de ingresos');
      BndDtTP.Items.Add('TT//Cuenta bancaria  //Número de cuenta  //Importe  ');
      try

        swEfecOtros:=false;
        swCreditoDebito:=false;
        TotalCreDeb:=0;
        xlin:='';
        QL_Dliqp.Close;
        QL_Dliqp.SQL.Clear;
        QL_Dliqp.SQL.Add('SELECT A.CLAVE, A.DESCRIPCION, SUM(P.IMPORTE), A.CLASE FROM DGASDLIQP P INNER JOIN ');
        QL_Dliqp.SQL.Add('DGASTPAG A ON P.CLAVE_PAGO=A.CLAVE');
        QL_Dliqp.SQL.Add('WHERE  P.APLICADO = '+quotedstr('Si'));
        QL_Dliqp.SQL.Add('AND P.FECHA >= "'+FechaToStrSQL(VgFechaIni)+'"');
        QL_Dliqp.SQL.Add('AND P.FECHA <= "'+FechaToStrSQL(VgFechaFin)+'"');
        if not(CBEst.Checked) then
          QL_Dliqp.SQL.Add('AND P.ESTACION='+IntToStr(estacion));
        QL_Dliqp.SQL.Add('AND EXISTS(SELECT M.* FROM DGASLIQG M WHERE M.ESTACION=P.ESTACION AND M.FOLIO=P.FOLIO AND M.APLICADO='+quotedstr('Si')+')');
        QL_Dliqp.SQL.Add('AND P.IMPORTE>0 AND A.CLASE='+QuotedStr('Efectivo')+' GROUP BY A.CLAVE, A.DESCRIPCION, A.CLASE ORDER BY A.CLAVE');
        QL_Dliqp.Prepare;
        QL_Dliqp.Open;

        FAVANCE.PreparaAvance('Resumen de tanques...',True,QL_Dliqp.RecordCount);

        while not QL_Dliqp.Eof do begin
          xlin:='D//'+ExtraeElemStrSep(QL_Dliqp.Fields[1].AsString,1,'-')+'//'+ExtraeElemStrSep(QL_Dliqp.Fields[1].AsString,2,'-')+'//'+FormatoMoneda(QL_Dliqp.Fields[2].AsFloat-TotalAjustado);
          BndDtTP.Items.Add(xlin);
          Result:=True;

          TotalIngresos:=TotalIngresos+QL_Dliqp.Fields[2].AsFloat-TotalAjustado;
          TotalAjustado:=0;
          swEfecOtros:=true;
          FAvance.AvanzaPosicion;
          QL_Dliqp.Next;
        end;



        QL_Dliqp.Close;
        QL_Dliqp.SQL.Clear;
        QL_Dliqp.SQL.Add('SELECT A.CLAVE, A.DESCRIPCION, SUM(P.IMPORTE), A.CLASE FROM DGASDLIQP P INNER JOIN ');
        QL_Dliqp.SQL.Add('DGASTPAG A ON P.CLAVE_PAGO=A.CLAVE');
        QL_Dliqp.SQL.Add('WHERE  P.APLICADO = '+quotedstr('Si'));
        QL_Dliqp.SQL.Add('AND P.FECHA >= "'+FechaToStrSQL(VgFechaIni)+'"');
        QL_Dliqp.SQL.Add('AND P.FECHA <= "'+FechaToStrSQL(VgFechaFin)+'"');
        if not(CBEst.Checked) then
          QL_Dliqp.SQL.Add('AND P.ESTACION='+IntToStr(estacion));
        QL_Dliqp.SQL.Add('AND EXISTS(SELECT M.* FROM DGASLIQG M WHERE M.ESTACION=P.ESTACION AND M.FOLIO=P.FOLIO AND M.APLICADO='+quotedstr('Si')+')');
        QL_Dliqp.SQL.Add('AND P.IMPORTE>0 AND ((A.CLASE<>'+quotedstr('Efectivo')+')AND(A.CLASE<>'+quotedstr('Tarjeta Crédito')+')');
        QL_Dliqp.SQL.Add('AND(A.CLASE<>'+quotedstr('Tarjeta Prepago')+')AND(A.CLASE<>'+quotedstr('Vale de Crédito')+'))');
        QL_Dliqp.SQL.Add('GROUP BY A.CLAVE, A.DESCRIPCION, A.CLASE ORDER BY A.CLAVE');
        QL_Dliqp.Prepare;
        QL_Dliqp.Open;


        while not QL_Dliqp.Eof do begin
          xlin:='D//'+ExtraeElemStrSep(QL_Dliqp.Fields[1].AsString,1,'-')+'//'+ExtraeElemStrSep(QL_Dliqp.Fields[1].AsString,2,'-')+'//'+FormatoMoneda(QL_Dliqp.Fields[2].AsFloat);
          BndDtTP.Items.Add(xlin);
          Result:=True;

          TotalIngresos:=TotalIngresos+QL_Dliqp.Fields[2].AsFloat;
          swEfecOtros:=true;
          QL_Dliqp.Next;
        end;

        if swEfecOtros then
          BndDtTP.Items.Add('T//Total de efectivo y otros// //'+FormatoMoneda(TotalIngresos));


        QL_Dliqp.Close;
        QL_Dliqp.SQL.Clear;
        QL_Dliqp.SQL.Add('SELECT A.CLAVE, A.DESCRIPCION, SUM(P.IMPORTE), A.CLASE FROM DGASDLIQP P INNER JOIN ');
        QL_Dliqp.SQL.Add('DGASTPAG A ON P.CLAVE_PAGO=A.CLAVE');
        QL_Dliqp.SQL.Add('WHERE  P.APLICADO = '+quotedstr('Si'));
        QL_Dliqp.SQL.Add('AND P.FECHA >= "'+FechaToStrSQL(VgFechaIni)+'"');
        QL_Dliqp.SQL.Add('AND P.FECHA <= "'+FechaToStrSQL(VgFechaFin)+'"');
        if not(CBEst.Checked) then
          QL_Dliqp.SQL.Add('AND P.ESTACION='+IntToStr(estacion));
        QL_Dliqp.SQL.Add('AND EXISTS(SELECT M.* FROM DGASLIQG M WHERE M.ESTACION=P.ESTACION AND M.FOLIO=P.FOLIO AND M.APLICADO='+quotedstr('Si')+')');
        QL_Dliqp.SQL.Add('AND P.IMPORTE>0 AND ((A.CLASE='+quotedstr('Tarjeta Crédito')+')');
        QL_Dliqp.SQL.Add('OR(A.CLASE='+quotedstr('Tarjeta Prepago')+') OR(A.CLASE='+quotedstr('Vale de Crédito')+'))');
        QL_Dliqp.SQL.Add('GROUP BY A.CLAVE, A.DESCRIPCION, A.CLASE ORDER BY A.CLAVE');
        QL_Dliqp.Prepare;
        QL_Dliqp.Open;


        while not QL_Dliqp.Eof do begin
          xlin:='D//'+ExtraeElemStrSep(QL_Dliqp.Fields[1].AsString,1,'-')+'//'+ExtraeElemStrSep(QL_Dliqp.Fields[1].AsString,2,'-')+'//'+FormatoMoneda(QL_Dliqp.Fields[2].AsFloat);
          BndDtTP.Items.Add(xlin);
          Result:=True;

          TotalCreDeb:=TotalCreDeb+QL_Dliqp.Fields[2].AsFloat;
          TotalIngresos:=TotalIngresos+QL_Dliqp.Fields[2].AsFloat;
          swCreditoDebito:=true;
          QL_Dliqp.Next;
        end;

        if swCreditoDebito then
          BndDtTP.Items.Add('T//Total de créditos y débitos// //'+FormatoMoneda(TotalCreDeb));


        BndDtTP.Items.Add('T//Total de ingresos// //'+FormatoMoneda(TotalIngresos));
        BndDtTP.Items.Add('');
        BndDtTP.Items.Add('N//Diferencia de ventas totales// //'+FormatoMoneda(Abs((TotalGeneralAceite+TotalComb)-TotalIngresos)));
      finally
        BndDtTP.Items.Add('');
        FAVANCE.Close;
        QL_Tpag.Close;
        QL_Dliqp.Close;
      end;

      BndDtT.Items.Clear;
      BndDtT.Items.Add('');
      BndDtT.Items.Add('T//Inventarios de tanques');
      BndDtT.Items.Add('TT//Combustibles//Inv. Inicial//Entradas//Ventas//Inv. Final');

      try
        QL_Tanq.Close;
        QL_Tanq.SQL.Clear;
        QL_Tanq.SQL.Add('SELECT distinct tanque, combustible FROM DPVGCVOLT WHERE FECHA='+QuotedStr(FechaToStrSQL(VgFechaIni)));
        QL_Tanq.Prepare;
        QL_Tanq.Open;
        QL_Tanq.First;
        FAVANCE.PreparaAvance('Resumen de tanques...',True,QL_Tanq.RecordCount);
        while not QL_Tanq.Eof do begin
          xlin:='';
          if QL_TanqCOMBUSTIBLE.AsInteger=1 then begin
            TanqInicial:=medicion_tanque_turno_anterior(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni);
            TanqueEntrada:=Entrada_Tanque_Fecha(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin);
            TanqueFinal:=Medicion_tanque_UltimoTurno(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin);
            xlin:='D//'+IntToClaveNum(QL_TanqTANQUE.AsInteger,2)+' - '+_NOMBRESCOMBUSTIBLES[1]+' //'+FormatoMoneda(TanqInicial)+'//'+FormatoMoneda(TanqueEntrada)+'//'+FormatoMoneda((TanqInicial+TanqueEntrada)-TanqueFinal)+'//'+FormatoMoneda(TanqueFinal);
          end
          else if QL_TanqCOMBUSTIBLE.AsInteger=2 then begin
            TanqInicial:=medicion_tanque_turno_anterior(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni);
            TanqueEntrada:=Entrada_Tanque_Fecha(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin);
            TanqueFinal:=Medicion_tanque_UltimoTurno(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin);
            xlin:='D//'+IntToClaveNum(QL_TanqTANQUE.AsInteger,2)+' - '+_NOMBRESCOMBUSTIBLES[2]+' //'+FormatoMoneda(TanqInicial)+'//'+FormatoMoneda(TanqueEntrada)+'//'+FormatoMoneda((TanqInicial+TanqueEntrada)-TanqueFinal)+'//'+FormatoMoneda(TanqueFinal);
          end
          else if QL_TanqCOMBUSTIBLE.AsInteger=3 then begin
            TanqInicial:=medicion_tanque_turno_anterior(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni);
            TanqueEntrada:=Entrada_Tanque_Fecha(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin);
            TanqueFinal:=Medicion_tanque_UltimoTurno(IntToStr(QL_TanqTANQUE.AsInteger),VgFechaIni,VgFechaFin);
            xlin:='D//'+IntToClaveNum(QL_TanqTANQUE.AsInteger,2)+' - '+_NOMBRESCOMBUSTIBLES[3]+' //'+FormatoMoneda(TanqInicial)+'//'+FormatoMoneda(TanqueEntrada)+'//'+FormatoMoneda((TanqInicial+TanqueEntrada)-TanqueFinal)+'//'+FormatoMoneda(TanqueFinal);
          end;
          if xlin<>'' then begin
            BndDtT.Items.Add(xlin);
            Result:=True;
          end;
          QL_Tanq.Next;
          FAVANCE.AvanzaPosicion;
        end;
      finally
        BndDtT.Items.Add('');
        FAVANCE.Close;
        QL_Tanq.Close;
      end;

      TotalDebito :=0;
      TotalCredito:=0;

      BndDtCD.Items.Clear;
      BndDtCD.Items.Add('');
      BndDtCD.Items.Add('N//Reporte de clientes Débito');
      BndDtCD.Items.Add('TT//Clave//Nombre//Importe');

      BndDtCR.Items.Clear;
      BndDtCR.Items.Add('');
      BndDtCR.Items.Add('N//Reporte de clientes Crédito');
      BndDtCR.Items.Add('TT//Clave//Nombre//Importe');
      try
        Q_Clie.Close;
        Q_Clie.SQL.Clear;
        Q_Clie.SQL.Add('SELECT NOCLIENTE FROM DGASCUPO');
        Q_Clie.SQL.Add('WHERE FECHARECUP >="'+FechaToStrSQL(VgFechaIni)+'"');
        Q_Clie.SQL.Add('UNION SELECT CLIENTE FROM DGASVALE');
        Q_Clie.SQL.Add('WHERE FECHA >="'+FechaToStrSQL(VgFechaIni)+'"');
        Q_Clie.SQL.Add('UNION SELECT CLIENTE FROM DGASTRAN');
        Q_Clie.SQL.Add('WHERE FECHA >="'+FechaToStrSQL(VgFechaIni)+'"');
        Q_Clie.SQL.Add('GROUP BY CLIENTE');
        Q_Clie.Prepare;
        Q_Clie.Open;
        FAVANCE.PreparaAvance('Resumen de clientes...',True,Q_Clie.RecordCount);
        while not(Q_Clie.Eof) do begin
          if Q_ClieDEBITO.AsFloat>0 then begin
            BndDtCD.Items.Add('D//'+ IntToClaveNum(Q_ClieNOCLIENTE.AsInteger,8)+'//'+Q_ClieNOMBRE.AsString+'//'+FormatoMoneda(Q_ClieDEBITO.AsFloat));
            TotalDebito:=TotalDebito+Q_ClieDEBITO.AsFloat;
            Result:=True;
          end;
          if Q_ClieCREDITO.AsFloat>0 then begin
            BndDtCR.Items.Add('D//'+ IntToClaveNum(Q_ClieNOCLIENTE.AsInteger,8)+'//'+Q_ClieNOMBRE.AsString+'//'+FormatoMoneda(Q_ClieCREDITO.AsFloat));
            TotalCredito:=TotalCredito+Q_ClieCREDITO.AsFloat;
            Result:=True;
          end;
          Q_Clie.Next;
          FAvance.AvanzaPosicion;
        end;
      finally
        BndDtCD.Items.Add('T//Total// //'+FormatoMoneda(TotalDebito));
        BndDtCR.Items.Add('T//Total// //'+FormatoMoneda(TotalCredito));
        BndDtCD.Items.Add('D// // //');
        BndDtCR.Items.Add('D// // //');
        BndDtCR.Items.Add('D// // //');
        Q_Clie.Close;
      end;
    finally
      FAvance.Close;
    end;
  end;
end;

function TFLIQREPESP01.medicion_tanque_turno_anterior(tanque: string; fecha_completa: TDateTime): real;
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

function TFLIQREPESP01.Medicion_tanque_UltimoTurno(tanque:string;FechaIni,FechaFin:TDateTime):Real;
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

function TFLIQREPESP01.Entrada_Tanque_Fecha(tanque: string;
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

procedure TFLIQREPESP01.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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

    if FLIQREPESP01P.CBEst.Checked then
      QRLEstacion.Caption:='Todas las estaciones'
    else
      QRLEstacion.Caption:=FLIQREPESP01P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;

  QRLSistema.Caption:=IdSistNombre;

  if SwImprimeFechaHora then
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep)
  else
    QRLFechaHora.Caption:='';
  SwAceites:=false;
  IniciaEtiquetasTipoP;
  IniciaEtiquetasTanq;
end;

procedure TFLIQREPESP01.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    xl:=xLeft;
    for k:=ri to rf do
      with QRLabelDetaC[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawTop:=false;
        Frame.DrawLeft :=false;
        Frame.DrawBottom:=false;
        Frame.DrawRight:=false;
        Font.Size:=8;
        Alignment:=taRightJustify;

        Width:=90;
        if k = 1 then begin
          Width := 150;
          Left:=xLeft;
          Alignment:=taLeftJustify;
        end;
        if k = 5 then Width := 50;
        if k in [2,3,4] then  Width:=75;
        Left:=xl;

        if xtp='TC' then begin
          Font.Style:=[fsBold];
          Frame.DrawTop:=false;
          if k in [2,3,4,6,7,8] then begin
            Frame.DrawTop:=true;
            Width:=Width-4;
            Left:=Left+4;
          end;
        end;
        if xtp='TT' then begin
          Frame.DrawTop:=true;
          Frame.DrawLeft :=true;
          Frame.DrawBottom:=true;
          if k = 8 then Frame.DrawRight:=true;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          Width:=90;
          if k = 1 then         Width:=210;
          if k in [2,3,4] then  Width:=55;
          if K = 5 then         Width:=50;
        end;
        xl:=Left+Width;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDetaC[k].Caption:=ExtraeElemStr(xlin,k-ri+2)+' ';
    end;
  end;

begin
  BndDt.Frame.DrawBottom:=false;
  xlin:=BndDt.Item;
  xtp:=ExtraeElemStr(xlin,1);
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQREPESP01.BndDtABeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    xl:=xLeft;
    for k:=ri to rf do
      with QRLabelDetaA[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Font.Size:=8;

        if k=1 then begin
          Width:=185;
          Left:=xLeft;
        end;
        if k in [2..8] then Width:=70;
        Left:=xl;

        if xtp='TA' then begin
          Font.Style:=[fsBold];
          if k in [5,8] then Frame.DrawTop:=true
          else Frame.DrawTop:=false;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k=1 then Width:=350;
        end;
        if xtp='N' then begin
          Font.Style:=[fsBold];
        end;
        xl:=Left+Width+4;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDetaA[k].Caption:=ExtraeElemStr(xlin,k-ri+2)+' ';
    end;
  end;

begin
  xlin:=BndDtA.Item;
  xtp:=ExtraeElemStr(xlin,1);
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQREPESP01.BndDtTAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with QRLabelDetaT[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawLeft :=false;
        Frame.DrawBottom:=false;
        Frame.DrawRight:=false;
        if k > 1 then Alignment:=taRightJustify
        else          Alignment:=taLeftJustify;
        Font.Size:=8;

        if xtp='TT' then begin
          Font.Style:=[fsBold];
          if k in [1..5] then begin
            Frame.DrawTop:=true;
            Frame.DrawLeft :=true;
            Frame.DrawBottom:=true;
            Frame.DrawRight:=true;
          end
          else Frame.DrawTop:=false;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
        end;
        if k=1 then Left:=xLeft;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDetaT[k].Caption:=' '+ExtraeElemStr(xlin,k-ri+2)+' ';
    end;
  end;

begin
  xlin:=BndDtT.Item;
  xtp:=ExtraeElemStr(xlin,1);
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQREPESP01.BndDtTPAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with QRLabelDetaTt[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawLeft :=false;
        Frame.DrawBottom:=false;
        Frame.DrawRight:=false;
        if k > 1 then Alignment:=taRightJustify
        else          Alignment:=taLeftJustify;
        Font.Size:=8;

        if xtp='TT' then begin
          Font.Style:=[fsBold];
          if k in [1..3] then begin
            Frame.DrawTop:=true;
            Frame.DrawLeft :=true;
            Frame.DrawBottom:=true;
            Frame.DrawRight:=true;
          end
          else Frame.DrawTop:=false;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k = 3 then Frame.DrawTop:=true;
        end;
        if xtp='N' then Font.Style:=[fsBold];
        if k=1 then Left:=xLeft;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDetaTt[k].Caption:=' '+ExtraeElemStr(xlin,k-ri+2)+' ';
    end;
  end;

begin
  xlin:=BndDtTP.Item;
  xtp:=ExtraeElemStr(xlin,1);
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQREPESP01.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREPESP01.Q_ClieCalcFields(DataSet: TDataSet);
var
  ImporteC,ImporteD:Double;
begin
  with DMGAS do begin
    try
      Q_ClieDEBITO.AsFloat :=0;
      Q_ClieCREDITO.AsFloat:=0;

      DMGEN_VTAS.Q_Auxi.Close;
      DMGEN_VTAS.Q_Auxi.SQL.Clear;
      DMGEN_VTAS.Q_AuxiStr120.FieldKind:=fkInternalCalc;
      DMGEN_VTAS.Q_Auxi.SQL.Add('SELECT NOMBRE AS STR120 FROM DGENCLIE');
      DMGEN_VTAS.Q_Auxi.SQL.Add('WHERE NOCLIE='+IntToStr(Q_ClieNOCLIENTE.AsInteger));
      DMGEN_VTAS.Q_Auxi.Prepare;
      DMGEN_VTAS.Q_Auxi.Open;
      Q_ClieNOMBRE.AsString:=DMGEN_VTAS.Q_AuxiStr120.AsString;
      DMGEN_VTAS.Q_Auxi.Close;

      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS REAL1 FROM DGASCUPO');
      Q_Auxi.SQL.Add('WHERE FECHARECUP >="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('AND FECHARECUP <="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.SQL.Add('AND ESTATUS = "R"');
      if not FLIQREPESP01P.CBEst.Checked then
        Q_Auxi.SQL.Add('AND ESTACION='+IntToStr(estacion));
      Q_Auxi.SQL.Add('AND NOCLIENTE ='+IntToStr(Q_ClieNOCLIENTE.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Q_ClieDEBITO.AsFloat:=Q_AuxiReal1.AsFloat;

      Q_Auxi.SQL.Clear;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT SUM(TOTAL) AS REAL1 FROM DGASTRAN');
      Q_Auxi.SQL.Add('WHERE TIPOVENTA = "PP"');
      if not FLIQREPESP01P.CBEst.Checked then
        Q_Auxi.SQL.Add('AND ESTACION='+IntToStr(estacion));
      Q_Auxi.SQL.Add('AND FECHA >="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('AND FECHA <="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.SQL.Add('AND CLIENTE ='+IntToStr(Q_ClieNOCLIENTE.AsInteger));
      Q_Auxi.SQL.Add('AND ESTATUS="A"');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Q_ClieDEBITO.AsFloat:=Q_ClieDEBITO.AsFloat+Q_AuxiReal1.AsFloat;

      Q_Auxi.SQL.Clear;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT SUM(TOTAL) AS REAL1 FROM DGASTRAN');
      Q_Auxi.SQL.Add('WHERE TIPOVENTA = "CR"');
      if not FLIQREPESP01P.CBEst.Checked then
        Q_Auxi.SQL.Add('AND ESTACION='+IntToStr(estacion));
      Q_Auxi.SQL.Add('AND FECHA >="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('AND FECHA <="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.SQL.Add('AND CLIENTE ='+IntToStr(Q_ClieNOCLIENTE.AsInteger));
      Q_Auxi.SQL.Add('AND ESTATUS="A"');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Q_ClieCREDITO.AsFloat:=Q_AuxiReal1.AsFloat;

      Q_Auxi.SQL.Clear;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS REAL1 FROM DGASVALE');
      if not FLIQREPESP01P.CBEst.Checked then begin
        Q_Auxi.SQL.Add('WHERE ESTACION='+IntToStr(estacion));
        Q_Auxi.SQL.Add('AND FECHA >="'+FechaToStrSQL(VgFechaIni)+'"');
      end
      else
        Q_Auxi.SQL.Add('WHERE FECHA >="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('AND FECHA <="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.SQL.Add('AND CLIENTE ='+IntToStr(Q_ClieNOCLIENTE.AsInteger));

      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Q_ClieCREDITO.AsFloat:=Q_ClieCREDITO.AsFloat+Q_AuxiReal1.AsFloat;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQREPESP01.BndDtCDAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    xl:=xLeft;
    for k:=ri to rf do
      with QRLabelDetaCD[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawLeft :=false;
        Frame.DrawBottom:=false;
        Frame.DrawRight:=false;
        if k =3 then Alignment:=taRightJustify;
        if k =2 then Alignment:=taLeftJustify;
        if k =1 then Alignment:=taCenter;
        Font.Size:=8;

        if k=1 then Width:=100;
        if k=2 then Width:=400;
        if k=3 then Width:=150;
        if k>3 then xl:=xl+4;
        Left:=xl;

        if xtp='TT' then begin
          Font.Style:=[fsBold];
          if k in [1..3] then begin
            Frame.DrawTop:=true;
            Frame.DrawLeft :=true;
            Frame.DrawBottom:=true;
            Frame.DrawRight:=true;
          end;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k = 3 then Frame.DrawTop:=true;
        end;
        if xtp='N' then begin
          Font.Style:=[fsBold];
          if k=1 then begin
            Width:=300;
            Alignment:=taLeftJustify;
          end;
        end;
        xl:=xl+Width;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDetaCD[k].Caption:=' '+ExtraeElemStr(xlin,k-ri+2)+' ';
    end;
  end;

begin
  xlin:=BndDtCD.Item;
  xtp:=ExtraeElemStr(xlin,1);
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQREPESP01.BndDtCRAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    xl:=xLeft;
    for k:=ri to rf do
      with QRLabelDetaCR[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawLeft :=false;
        Frame.DrawBottom:=false;
        Frame.DrawRight:=false;
        if k =3 then Alignment:=taRightJustify;
        if k =2 then Alignment:=taLeftJustify;
        if k =1 then Alignment:=taCenter;
        Font.Size:=8;
        if k=1 then Width:=100;
        if k=2 then Width:=400;
        if k=3 then Width:=150;
        if k>3 then xl:=xl+4;
        Left:=xl;

        if xtp='TT' then begin
          Font.Style:=[fsBold];
          if k in [1..3] then begin
            Frame.DrawTop:=true;
            Frame.DrawLeft :=true;
            Frame.DrawBottom:=true;
            Frame.DrawRight:=true;
          end;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k = 3 then Frame.DrawTop:=true;
        end;
        if xtp='N' then begin
          Font.Style:=[fsBold];
          if k=1 then begin
            Width:=300;
            Alignment:=taLeftJustify;
          end;
        end;
        xl:=xl+Width;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDetaCR[k].Caption:=' '+ExtraeElemStr(xlin,k-ri+2)+' ';
    end;
  end;

begin
  xlin:=BndDtCR.Item;
  xtp:=ExtraeElemStr(xlin,1);
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

end.
