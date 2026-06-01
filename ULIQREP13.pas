unit ULIQREP13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQREP13 = class(TForm)
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
    QL_DliqpCLAVE_PAGO: TStringField;
    QL_DliqpDescripcionPago: TStringField;
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcNombreCombustible: TStringField;
    QL_Dliqc2: TQuery;
    TT_Auxi: TTable;
    TT_AuxiNombreDespachador: TStringField;
    TT_AuxiDespachador: TIntegerField;
    QL_Dliqa2: TQuery;
    QL_Dliqc2ESTACION: TIntegerField;
    QL_Dliqc2FECHA: TDateTimeField;
    QL_Dliqc2FOLIO: TIntegerField;
    QL_Dliqc2IMPORTE: TFloatField;
    QL_Dliqc2DESP: TIntegerField;
    QL_Dliqa2ESTACION: TIntegerField;
    QL_Dliqa2FECHA: TDateTimeField;
    QL_Dliqa2FOLIO: TIntegerField;
    QL_Dliqa2IMPORTE: TFloatField;
    QL_Dliqa2DESP: TIntegerField;
    TT_AuxiTotalCmb: TFloatField;
    TT_AuxiTotal: TFloatField;
    QL_Tpag: TQuery;
    QL_TpagCLAVE: TStringField;
    QL_DliqpClasePago: TStringField;
    TT_AuxiTotalProd: TFloatField;
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
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ModoRep:integer;
    QRLabelEnca,
    QRLabelDeta:array [1..8] of TQRLabel;
    procedure CreaEtiquetas;
    procedure IniciaEtiquetasCmb;
    procedure IniciaEtiquetasProd;
    procedure CreaTablaTemp;
  public
    { Public declarations }
    procedure PreparaReporte(xModo:integer);
  end;

Const
  xLeft=5;

var
  FLIQREP13: TFLIQREP13;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  SwAceites:Boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP13P, UAVANCE, DDMGENT;

{$R *.DFM}

procedure TFLIQREP13.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to 8 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:xw:=195;
        3:xw:=60;
        7:xw:=70;
        2,4..6:xw:=80;
        8:xw:=35;
      end;
      Caption   :='';
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
      if i<8 then Frame.DrawRight:=true;
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

procedure TFLIQREP13.IniciaEtiquetasCmb;
var i:word;
begin
  xl:=xLeft;
  for i:=1 to 8 do begin
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Combustible';
        2:Caption:='Venta';
        3:Caption:='Precio/Litro';
        4:Caption:='Importe';
        5:Caption:='Subtotal A/IEPS';
        6:Caption:='Costo';
        7:Caption:='Utilidad';
        8:Caption:='%';
      end;
      Case i of
        1:xw:=195;
        3:xw:=65;
        7:xw:=70;
        2,4..6:xw:=80;
        8:xw:=35;
      end;
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

procedure TFLIQREP13.IniciaEtiquetasProd;
var i:word;
begin
  xl:=xleft;
  for i:=1 to 8 do begin
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Aceites y Derivados';
        2:Caption:='Ventas';
        3:Caption:='Precio Unit';
        4:Caption:='Importe';
        5:Caption:='Subtotal';
        6:Caption:='Costo';
        7:Caption:='Utilidad';
        8:Caption:='%';
      end;
      Case i of
        1:xw:=195;
        3:xw:=60;
        7:xw:=70;
        2,4..6:xw:=80;
        8:xw:=35;
      end;
      Left      :=xl;
      Width     :=xw;
    end;
    with QRLabelDeta[i] do begin
      Left      :=xl;
      Width     :=xw;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP13.PreparaReporte;
var TotCmb,TotAlma,TotPago,totclas:Array[1..7] of real;
    i,estacion,almacen:word;
    Precio,SubTotal,
    Costo,PorcUtil,Utilidad,
    Cantidad,Importe,
    Iva,Ajuste,Pago,
    PrecioReal, IEPS, IEPSLts,ImporteAIEPS:real;
begin
  with DMGEN,DMGENT,DMCUP,DMLIQ,DMGAS,FLIQREP13P do begin
    ModoRep:=xModo;
    CreaEtiquetas;
    IniciaEtiquetasCmb;
    estacion:=T_EstsClave.AsInteger;
    almacen:=T_EstsAlmacen.AsInteger;
    BndDt.Items.Clear;
    QL_Dliqc.Close;
    QL_Dliqc.ParamByName('pestacion').AsInteger:=estacion;
    QL_Dliqc.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqc.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;
    for i:=1 to 7 do
      TotCmb[i]:=0;
    FAVANCE.PreparaAvance('Calculando combustibles...',True,QL_Dliqc.RecordCount);
    while not QL_Dliqc.Eof do begin
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_AuxiReal2.FieldKind:=fkInternalCalc;
      Q_AuxiReal3.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select sum(Cantidad) as Real1, sum(Importe) as Real2,Sum(Importe_IEPS) as Real3 from DGASDLIQC');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion));
      Q_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Cantidad:=Q_AuxiReal1.AsFloat;
      Importe:=Q_AuxiReal2.AsFloat;
      PrecioReal:=AjustaFloat(DivideFloat(Importe,Cantidad),4);
      IEPS:=Q_AuxiReal3.AsFloat;
      if ModoRep=0 then begin
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_AuxiReal2.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1, sum(Total) as Real2 from DGASAJUD2');
        Q_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion));
        Q_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
        Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
        Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        Cantidad:=Cantidad-Q_AuxiReal1.AsFloat;
        Importe:=Importe-Q_AuxiReal2.AsFloat;
        Ajuste:=Ajuste+Q_AuxiReal2.AsFloat;
      end;
      Precio:=PrecioCombustibleFecha(QL_DliqcCombustible.AsInteger,VgFechaFin);
      SubTotal:=AjustaFloat(DivideFloat(Importe,1+PrecTasaIva/100),2);
      Iva:=Importe-SubTotal;
      Precio:=AjustaFloat(DivideFloat(Importe,Cantidad),4);
      Costo:=Cantidad*PrecCosto;
      Costo:=AjustaFloat(DivideFloat(Costo,1+PrecTasaIva/100),2);
      if VarGasCostoCombustiblesAlma='Si' then
        Costo:=Cantidad*CostoCombustibleInv(almacen,QL_DliqcCombustible.AsInteger,VgFechaIni,VgFechaFin);
      if DMCUP.SwSubModuloCupReformas2008 then begin
        IEPS:=DMCUP.DameIEPS(QL_DliqcCombustible.AsInteger,VgFechaIni);
        IEPS:=cantidad*IEPS;
        ImporteAIEPS:=(Importe-IEPS)/(1+GetTasaIVAdeCombustible(estacion,QL_DliqcCOMBUSTIBLE.AsInteger,VgFechaFin)/100);
        Iva:=(Importe-IEPS-ImporteAIEPS);
        if not CheckBox2.Checked then
          Subtotal:=ImporteAIEPS+IEPS
        else
          SubTotal:=ImporteAIEPS;
      end;
      Utilidad:=SubTotal-Costo;
      PorcUtil:=AjustaFloat(DivideFloat(Utilidad,SubTotal)*100,2);
      xlin:='D//'+QL_DliqcNombreCombustible.AsString+'//'+
                  FormatoMoneda(Cantidad)+'//'+
                  FormatFloat('##,##0.0000',Precio)+'//'+
                  FormatoMoneda(Importe)+'//'+
                  FormatoMoneda(SubTotal)+'//'+
                  FormatoMoneda(Costo)+'//'+
                  FormatoMoneda(Utilidad)+'//'+
                  FormatFloat('##0.00',PorcUtil);
      BndDt.Items.Add(xlin);
      TotCmb[1]:=TotCmb[1]+Cantidad;
      TotCmb[3]:=TotCmb[3]+Importe;
      TotCmb[4]:=TotCmb[4]+SubTotal;
      TotCmb[5]:=TotCmb[5]+Costo;
      TotCmb[6]:=TotCmb[6]+Utilidad;
      QL_Dliqc.Next;
      FAVANCE.AvanzaPosicion;
    end;
    FAVANCE.Close;
    TotCmb[7]:=AjustaFloat(DivideFloat(TotCmb[6],TotCmb[4])*100,2);
    xlin:='T// //';
    for i:=1 to 7 do begin
      Case i of
        1,3..6:xlin:=xlin+FormatoMoneda(TotCmb[i])+'//';
        2:xlin:=xlin+'//';
        7:xlin:=xlin+FormatFloat('##0.00',TotCmb[7]);
      end;
    end;
    BndDt.Items.Add(xlin);

// Aceites y Derivados
    for i:=1 to 7 do
      TotAlma[i]:=0;
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
    while not QL_Clas.Eof do begin
      if QL_Clas.Bof then
        xlin:='A//'+QL_ClasDescripcion.AsString+'//Ventas//Precio Uni//Importe//SubTotal//Costo//Utilidad//%'
      else
        xlin:='E//'+QL_ClasDescripcion.AsString;
      BndDt.Items.Add(xlin);
      for i:=1 to 7 do
        TotClas[i]:=0;
      QL_Dliqa.Close;
      QL_Dliqa.ParamByName('pestacion').AsInteger:=estacion;
      QL_Dliqa.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
      QL_Dliqa.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
      QL_Dliqa.ParamByName('plinea').AsInteger:=QL_ClasClaveClasif.AsInteger;
      QL_Dliqa.Prepare;
      QL_Dliqa.Open;
      FAVANCE.PreparaAvance('Calculando aceites y derivados...',True,QL_Dliqa.RecordCount);
      while not QL_Dliqa.Eof do begin
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_AuxiReal2.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Sum(Venta) as Real1, Sum(Importe) as Real2  from DGASDLIQA');
        Q_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion));
        Q_Auxi.SQL.Add('  and Producto='+IntToStr(QL_DliqaProducto.AsInteger));
        Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
        Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        Precio:=PrecioProductoFecha(QL_DliqaProducto.AsInteger,VgFechaFin);
        SubTotal:=AjustaFloat(DivideFloat(Q_AuxiReal2.AsFloat,1+PreaTasaIva/100),2);
        Costo:=Q_AuxiReal1.AsFloat*PreaCosto;
        Costo:=AjustaFloat(DivideFloat(Costo,1+PreaTasaIva/100),2);
        if VarGasCostoProductosAlma='Si' then
          Costo:=Q_AuxiReal1.AsFloat*CostoProductoInv(almacen,QL_DliqaProducto.AsInteger,VgFechaIni,VgFechaFin);
        Utilidad:=SubTotal-Costo;
        PorcUtil:=AjustaFloat(DivideFloat(Utilidad,SubTotal)*100,2);
//        if Q_AuxiReal1.AsFloat>0 then begin
          xlin:='D//'+IntToClaveNum(QL_DliqaProducto.AsInteger,3)+'-'+QL_DliqaNombreProducto.AsString+'//'+
                      FormatoMoneda(Q_AuxiReal1.AsFloat)+'//'+
                      FormatFloat('##,##0.00',Precio)+'//'+
                      FormatoMoneda(Q_AuxiReal2.AsFloat)+'//'+
                      FormatoMoneda(SubTotal)+'//'+
                      FormatoMoneda(Costo)+'//'+
                      FormatoMoneda(Utilidad)+'//'+
                      FormatFloat('##0.00',PorcUtil);
          BndDt.Items.Add(xlin);
//        end;
        TotClas[1]:=TotClas[1]+Q_AuxiReal1.AsFloat;
        TotClas[3]:=TotClas[3]+Q_AuxiReal2.AsFloat;
        TotClas[4]:=TotClas[4]+SubTotal;
        TotClas[5]:=TotClas[5]+Costo;
        TotClas[6]:=TotClas[6]+Utilidad;
        QL_Dliqa.Next;
        FAVANCE.AvanzaPosicion;
      end;
      FAVANCE.Close;
      TotClas[7]:=AjustaFloat(DivideFloat(TotClas[6],TotClas[4])*100,2);
      xlin:='T// //';
      for i:=1 to 7 do begin
        Case i of
          1,3..6:xlin:=xlin+FormatoMoneda(TotClas[i])+'//';
          2:xlin:=xlin+'//';
          7:xlin:=xlin+FormatFloat('##0.00',TotClas[7]);
        end;
        TotAlma[i]:=TotAlma[i]+TotClas[i];
      end;
      BndDt.Items.Add(xlin);
      QL_Clas.Next;
    end;
    TotAlma[7]:=AjustaFloat(DivideFloat(TotAlma[6],TotAlma[4])*100,2);
    xlin:='T// //';
    for i:=1 to 7 do begin
      Case i of
        1,3..6:xlin:=xlin+FormatoMoneda(TotAlma[i])+'//';
        2:xlin:=xlin+'//';
        7:xlin:=xlin+FormatFloat('##0.00',TotAlma[7]);
      end;
    end;
    BndDt.Items.Add(xlin);

    BndDt.Items.Add('');
//
    SubTotal:=TotCmb[3]+TotAlma[3];
    BndDt.Items.Add('S//Resumen de Ventas:');
    BndDt.Items.Add('D//Combustibles// //'+FormatoMoneda(TotCmb[3])+'//'+FormatFloat('##0.00',AjustaFloat(DivideFloat(TotCmb[3],SubTotal)*100,2))+'%');
    BndDt.Items.Add('D//Productos// //'+FormatoMoneda(TotAlma[3])+'//'+FormatFloat('##0.00',AjustaFloat(DivideFloat(TotAlma[3],SubTotal)*100,2))+'%');
    BndDt.Items.Add('R// // //'+FormatoMoneda(TotCmb[3]+TotAlma[3])+'//'+FormatFloat('#00.00',100.00)+'%');
//
    BndDt.Items.Add('S//Resumen de Ingresos:');
    QL_Dliqp.Close;
    QL_Dliqp.ParamByName('pestacion').AsInteger:=estacion;
    QL_Dliqp.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqp.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqp.Prepare;
    QL_Dliqp.Open;
    for i:=1 to 7 do
      TotPago[i]:=0;
    FAVANCE.PreparaAvance('Calculando Pagos...',True,QL_Dliqp.RecordCount);
    while not QL_Dliqp.Eof do begin
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select sum(Importe) as Real1 from DGASDLIQP');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion));
      Q_Auxi.SQL.Add('  and Clave_pago="'+QL_DliqpClave_Pago.AsString+'"');
      Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Pago:=Q_AuxiReal1.AsFloat;
      if ModoRep=0 then begin
        if QL_DliqpClasePago.AsString='Efectivo' then begin
          Pago:=Pago-Ajuste;
          Ajuste:=0;
        end;
      end;
      xlin:='D//'+QL_DliqpDescripcionPago.AsString+'// //'+FormatoMoneda(Pago)+'//'+
                  FormatFloat('##0.00',AjustaFloat(DivideFloat(Pago,SubTotal)*100,2))+'%';
      BndDt.Items.Add(xlin);
      TotPago[3]:=TotPago[3]+Pago;
      QL_Dliqp.Next;
      FAVANCE.AvanzaPosicion;
    end;
    FAVANCE.Close;
    xlin:='R// // //'+FormatoMoneda(TotPago[3])+'//'+FormatFloat('#00.00',100.00)+'%';
    BndDt.Items.Add(xlin);
    BndDt.Items.Add('');

//Resumen de Despachadores
    if CheckBox1.Checked then begin
      InicializaTemp(TT_Auxi);
      CreaTablaTemp;
      QL_Dliqc2.Close;
      QL_Dliqc2.ParamByName('pestacion').AsInteger:=Estacion;
      QL_Dliqc2.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
      QL_Dliqc2.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
      QL_Dliqc2.Prepare;
      QL_Dliqc2.Open;
      try
        FAvance.PreparaAvance('Clasificando movimientos...',true,QL_Dliqc2.RecordCount);
        while not QL_Dliqc2.Eof do begin
          if not TT_Auxi.Locate('Despachador',QL_Dliqc2Desp.AsInteger,[]) then begin
            TT_Auxi.Insert;
            TT_AuxiDespachador.AsInteger:=QL_Dliqc2Desp.AsInteger;
            TT_AuxiTotalCmb.AsFloat:=QL_Dliqc2Importe.AsFloat;
            TT_AuxiTotalProd.AsFloat:=0;
          end
          else begin
            TT_Auxi.Edit;
            TT_AuxiTotalCmb.AsFloat:=TT_AuxiTotalCmb.AsFloat+QL_Dliqc2Importe.AsFloat;
          end;
          TT_Auxi.Post;
          FAvance.AvanzaPosicion;
          QL_Dliqc2.Next;
        end;
      finally
        FAvance.Close;
      end;
//
      QL_Dliqa2.Close;
      QL_Dliqa2.ParamByName('pestacion').AsInteger:=Estacion;
      QL_Dliqa2.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
      QL_Dliqa2.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
      QL_Dliqa2.Prepare;
      QL_Dliqa2.Open;
      try
        FAvance.PreparaAvance('Clasificando movimientos...',true,QL_Dliqa2.RecordCount);
        while not QL_Dliqa2.Eof do begin
          if not TT_Auxi.Locate('Despachador',QL_Dliqa2Desp.AsInteger,[]) then begin
            TT_Auxi.Insert;
            TT_AuxiDespachador.AsInteger:=QL_Dliqa2Desp.AsInteger;
            TT_AuxiTotalCmb.AsFloat:=0;
            TT_AuxiTotalProd.AsFloat:=QL_Dliqa2Importe.AsFloat;
          end
          else begin
            TT_Auxi.Edit;
            TT_AuxiTotalProd.AsFloat:=TT_AuxiTotalProd.AsFloat+QL_Dliqa2Importe.AsFloat;
          end;
          TT_Auxi.Post;
          FAvance.AvanzaPosicion;
          QL_Dliqa2.Next;
        end;
      finally
        FAvance.Close;
      end;

      for i:=1 to 3 do
        TotCmb[i]:=0;
      try
        TT_Auxi.First;
        FAvance.PreparaAvance('Preparando reporte...',true,TT_Auxi.RecordCount);
        xlin:='A//Resumen por Despachador// //Gasolina//Aceites//TotAlmal//%';
        BndDt.Items.Add(xlin);
        while not TT_Auxi.Eof do begin
          xlin:='D//'+TT_AuxiNombreDespachador.AsString+'// //'+
                      FormatoMoneda(TT_AuxiTotalCmb.AsFloat)+'//'+
                      FormatoMoneda(TT_AuxiTotalProd.AsFloat)+'//'+
                      FormatoMoneda(TT_AuxiTotal.AsFloat)+'//'+
                      FormatFloat('##0.00',AjustaFloat(DivideFloat(TT_AuxiTotal.AsFloat,SubTotal)*100,2))+'%';
          BndDt.Items.Add(xlin);
          TotCmb[1]:=TotCmb[1]+TT_AuxiTotalCmb.AsFloat;
          TotCmb[2]:=TotCmb[2]+TT_AuxiTotalProd.AsFloat;
          TotCmb[3]:=TotCmb[3]+TT_AuxiTotal.AsFloat;
          FAvance.AvanzaPosicion;
          TT_Auxi.Next;
        end;
        xlin:='X// // //';
        for i:=1 to 3 do
          xlin:=xlin+FormatoMoneda(TotCmb[i])+'//';
        xlin:=xlin+FormatFloat('#00.00',100.00)+'%';
        BndDt.Items.Add(xlin);
      finally
        FAvance.Close;
      end;
    end;
    if CBIeps.Checked then begin
      FAvance.PreparaAvance('Preparando resumen IEPS...',true,QL_Dliqc.RecordCount);
      try
        BndDt.Items.Add('D//');
        BndDt.Items.Add('D//');
        BndDt.Items.Add('S// Resumen de IEPS por Litro:');
        BndDt.Items.Add('E//Combustible //IEPS/Lts //Litros //Total IEPS');
        IEPSLts:=0;
        IEPS:=0;
        QL_Ieps.Close;
        QL_Ieps.SQL.Clear;
        QL_Ieps.SQL.Add('select l.combustible as Entero1,');
        QL_Ieps.SQL.Add('(Select Nombre from dgastcmb where clave=l.combustible) as Str50,');
        QL_Ieps.SQL.Add('sum(l.cantidad) as Real2,sum(l.importe_ieps) as Real3 from dgasdliqc l');
        QL_Ieps.SQL.Add('Where Estacion='+IntToStr(estacion));
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
            IEPS:=DMCUP.DameIEPS(QL_IepsEntero1.AsInteger,VgFechaIni);
            if ModoRep=0 then begin
              QL_Auxi.SQL.Clear;
              QL_Auxi.SQL.Add('Select sum(Diferencia) as Real1, Combustible from DGASAJUD2');
              QL_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion));
              QL_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_IepsEntero1.AsInteger));
              if VgFechaIni<DMGAS.VarGasFechaInicioIEPS then
                QL_Auxi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(DMGAS.VarGasFechaInicioIEPS )))
              else
                QL_Auxi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
              QL_Auxi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
              QL_Auxi.SQL.Add('Group by Combustible');
              QL_Auxi.Prepare;
              QL_Auxi.Open;
              IEPSLts:=IEPSLts+(QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)*IEPS;
            end
            else
              IEPSLts:=IEPSLts+QL_IepsReal2.AsFloat*IEPS;
            xlin:='Z//'+QL_IepsSTR50.AsString+'//'+FloatToStr(IEPS)+'//'+FormatoMoneda(QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)+'//'+FormatoMoneda((QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)*IEPS);
            BndDt.Items.Add(xlin);
          finally
            QL_Auxi.Close;
          end;
          QL_Ieps.Next;
          FAVANCE.AvanzaPosicion;
        end;
        BndDt.Items.Add('Y// // //Total... // '+FormatoMoneda(IEPSLts));
      finally
        FAVANCE.Close;
      end;
    end;
  end;
end;

procedure TFLIQREP13.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP13P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
  if ModoRep=0 then
    QRLSistema.Caption:=IdSistNombre
  else
    QRLSistema.Caption:='';
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  IniciaEtiquetasCmb;
end;

procedure TFLIQREP13.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if (xtp='S') then begin
          if k=1 then begin
            Font.Style:=[fsbold,fsUnderline];
          end;
        end;
        if (xtp='R') then begin
          if k in [3,4] then begin
            Frame.DrawTop:=true;
          end;
        end;
        if (xtp='X') then begin
          if k in [3..6] then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp='A' then Font.Style:=[fsBold];
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k in [2,4..7] then Frame.DrawTop:=true
          else Frame.DrawTop:=false;
        end;
        if xtp='Y' then begin
          Font.Style:=[fsBold];
          if k=4 then Frame.DrawTop:=true
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
    IniciaEtiquetasProd;
  end;
  InicializaEtiquetas(1,8);
  ExtraeEtiquetas(1,8);
end;

procedure TFLIQREP13.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP13.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Despachador', ftInteger, 0, True);
      Add('TotalCmb', ftFloat,0,false);
      Add('TotalProd', ftFloat,0,false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'Despachador', [ixPrimary, ixUnique]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.IndexFieldNames:='';
    TT_Auxi.Active:=true;
  end;
end;


procedure TFLIQREP13.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  TT_AuxiTotal.AsFloat:=TT_AuxiTotalCmb.AsFloat+TT_AuxiTotalProd.AsFloat;
end;

end.
