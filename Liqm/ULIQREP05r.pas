unit ULIQREP05r;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

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
    QL_DliqaPRODUCTO: TIntegerField;
    QL_DliqaNombreProducto: TStringField;
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
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    ModoRep:integer;
    QRLabelEnca,
    QRLabelDeta:array [1..8] of TQRLabel;
    procedure CreaEtiquetas;
    procedure IniciaEtiquetasCmb;
    procedure IniciaEtiquetasProd;
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
  SwAceites:Boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP05P, ULIQDESGLO;

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



procedure TFLIQREP05.PreparaReporte;
var totc,tota,
    totp,totcant,precio,
    precioprom,venta,
    subtotal,iva,subaux,
    tsubtotal,tiva,
    ttimp,ttotc,ttiva,
    cantidad,importe,
    Ajuste,Pago,totefectivo,
    ttsubtotal,xdif,
    saldoini,saldofin:real;
    estacion,i:word;
begin
  with DMGEN,DMLIQ,DMGAS,DMCUP,FLIQREP05P do begin
    ModoRep:=xModo;
    CreaEtiquetas;
    totc:=0; totcant:=0; ttimp:=0;
    ttotc:=0; ttiva:=0; ttsubtotal:=0;
    Ajuste:=0; totefectivo:=0; subaux:=0;
    estacion:=DBLookupComboBox2.KeyValue;
    if SwDesglose then TT_Auxi.First;
    QL_Tpag.Close;
    QL_Tpag.Prepare;
    QL_Tpag.Open;
    BndDt.Items.Clear;
    QL_Dliqc.Close;
    QL_Dliqc.ParamByName('pestacion').AsInteger:=estacion;
    QL_Dliqc.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqc.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;
    tsubtotal:=0; tiva:=0;
    while not QL_Dliqc.Eof do begin
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_AuxiReal2.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select sum(Cantidad) as Real1, sum(Importe) as Real2 from DGASDLIQC');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion));
      Q_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_DliqcCombustible.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Cantidad:=Q_AuxiReal1.AsFloat;
      Importe:=Q_AuxiReal2.AsFloat;
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
      Subtotal:=AjustaFloat(DivideFloat(Importe,1+VarGasIvaCombustible/100),2);
      Iva:=Importe-Subtotal;
      totc:=totc+Importe;
      totcant:=totcant+Cantidad;
      tsubtotal:=tsubtotal+Subtotal;
      tiva:=tiva+Iva;
      precioprom:=AjustaFloat(DivideFloat(Importe,Cantidad),4);
      if not SwDesglose then begin
        xlin:='D//'+QL_DliqcNombreCombustible.AsString+'// //'+FormatoMoneda(Cantidad)+'//'+
                    FormatFloat('##,##0.0000',precioprom)+'//'+
                    FormatoMoneda(subtotal)+'//'+FormatoMoneda(iva)+'//'+
                    FormatoMoneda(subtotal+iva)+'//';
      end
      else begin
        ttimp:=ttimp+TT_AuxiImporte.AsFloat;
        subtotal:=AjustaFloat(DivideFloat(TT_AuxiImporte.AsFloat,1+VarGasIvaCombustible/100),2);
        iva:=TT_AuxiImporte.AsFloat-subtotal;
        ttotc:=ttotc+TT_AuxiLitros.AsFloat;
        ttiva:=ttiva+iva;
        ttsubtotal:=ttsubtotal+subtotal;
        xlin:='D//'+TT_AuxiNombre.AsString+'// //'+FormatoMoneda(TT_AuxiLitros.AsFloat)+'//'+
                    FormatFloat('##,##0.0000',TT_AuxiPrecio.AsFloat)+'//'+
                    FormatoMoneda(subtotal)+'//'+FormatoMoneda(iva)+'//'+
                    FormatoMoneda(TT_AuxiImporte.AsFloat)+'//';
        TT_Auxi.Next;
      end;
      BndDt.Items.Add(xlin);
      QL_Dliqc.Next;
    end;
    if not SwDesglose then
      xlin:='T// // //'+FormatoMoneda(totcant)+'// //'+FormatoMoneda(tsubtotal)+'//'+
                        FormatoMoneda(tiva)+'//'+FormatoMoneda(totc)+'//'
    else
      xlin:='T// // //'+FormatoMoneda(ttotc)+'// //'+FormatoMoneda(ttsubtotal)+'//'+
                        FormatoMoneda(ttiva)+'//'+FormatoMoneda(ttimp)+'//';
    BndDt.Items.Add(xlin);
//
    xlin:='A//Aceites y Derivados//Saldo Inicial//Entradas//Devolución//Saldo Final//Ventas//'+
             'Precio//Importe';
    BndDt.Items.Add(xlin);
    tota:=0; SubTotal:=0;
    QL_Dliqa.Close;
    QL_Dliqa.ParamByName('pestacion').AsInteger:=estacion;
    QL_Dliqa.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqa.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqa.Prepare;
    QL_Dliqa.Open;
    while not QL_Dliqa.Eof do begin
//Saldo Incial del Producto
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select first 1  Sald_Ini as Real1 from DGASDLIQA');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion));
      Q_Auxi.SQL.Add('  and Producto='+IntToStr(QL_DliqaProducto.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');       Q_Auxi.Prepare;
      Q_Auxi.Open;
      saldoini:=Q_AuxiReal1.AsFloat;

      Q_Auxi.Close;
      Q_AuxiReal2.FieldKind:=fkInternalCalc;
      Q_AuxiReal3.FieldKind:=fkInternalCalc;
      Q_AuxiReal5.FieldKind:=fkInternalCalc;
      Q_AuxiReal6.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select sum(Entradas) as Real2, sum(Devol) as Real3, sum(Importe) as Real5, sum(Venta) as Real6 from DGASDLIQA');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(estacion));
      Q_Auxi.SQL.Add('  and Producto='+IntToStr(QL_DliqaProducto.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      saldofin:=saldoini+Q_AuxiReal2.AsFloat-Q_AuxiReal6.AsFloat-Q_AuxiReal3.AsFloat;
      venta:=Q_AuxiReal6.AsFloat;
      precioprom:=AjustaFloat(DivideFloat(Q_AuxiReal5.AsFloat,venta),2);
      Precio:=PrecioProductoFecha(QL_DliqaProducto.AsInteger,VgFechaFin);
      SubTotal:=SubTotal+DivideFloat(Q_AuxiReal5.AsFloat,1+PreaTasaIva/100);
      xlin:='D//'+IntToClaveNum(QL_DliqaProducto.AsInteger,3)+'-'+QL_DliqaNombreProducto.AsString+'//'+FormatoMoneda(saldoini)+'//'+
                  FormatoMoneda(Q_AuxiReal2.AsFloat)+'//'+FormatoMoneda(Q_AuxiReal3.AsFloat)+'//'+
                  FormatoMoneda(saldofin)+'//'+FormatoMoneda(Venta)+'//'+
                  FormatFloat('##,##0.00',precioprom)+'//'+FormatoMoneda(Q_AuxiReal5.AsFloat);
      tota:=tota+Q_AuxiReal5.AsFloat;
      BndDt.Items.Add(xlin);
      QL_Dliqa.Next;
    end;
    xlin:='T//';
    InsertaElemStr('Subtotal...',4,xlin);
    InsertaElemStr(FormatoMoneda(Subtotal),5,xlin);
    InsertaElemStr('Iva...',6,xlin);
    InsertaElemStr(FormatoMoneda(Tota-Subtotal),7,xlin);
    InsertaElemStr('Total...',8,xlin);    
    InsertaElemStr(FormatoMoneda(tota),9,xlin);
    BndDt.Items.Add(xlin);

    BndDt.Items.Add('S//Resumen de Ventas:');
    if SwDesglose then
      BndDt.Items.Add('D//Combustibles// //'+FormatoMoneda(ttimp))
    else
      BndDt.Items.Add('D//Combustibles// //'+FormatoMoneda(totc));
    BndDt.Items.Add('D//Aceites y Derivados// //'+FormatoMoneda(tota));
    if SwDesglose then
      BndDt.Items.Add('R// // //'+FormatoMoneda(ttimp+tota))
    else
      BndDt.Items.Add('R// // //'+FormatoMoneda(totc+tota));
//
    BndDt.Items.Add('S//Resumen de Ingresos:');
    QL_Dliqp.Close;
    QL_Dliqp.ParamByName('pestacion').AsInteger:=estacion;
    QL_Dliqp.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqp.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqp.Prepare;
    QL_Dliqp.Open;
    totp:=0;
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
      xdif:=0;
      if (SwDesglose)and(QL_DliqpClave_Pago.AsString=QL_TpagClave.AsString) then begin
        i:=999;
        xdif:=totc-ttimp;
        totefectivo:=Pago-xdif;
        xlin:='D//'+QL_DliqpDescripcionPago.AsString+'// //'+FormatoMoneda(totefectivo)
      end
      else
        xlin:='D//'+QL_DliqpDescripcionPago.AsString+'// //'+FormatoMoneda(Pago);
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
      if SwDesglose then
        totp:=totp+Pago-xdif
      else
        totp:=totp+Pago;
      QL_Dliqp.Next;
    end;
    xlin:='R// // //'+FormatoMoneda(totp);
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQREP05.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP05P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  if ModoRep=0 then
    QRLSistema.Caption:=IdSistNombre
  else
    QRLSistema.Caption:='';
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
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
          if k=3 then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp='A' then Font.Style:=[fsBold];
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

end.
