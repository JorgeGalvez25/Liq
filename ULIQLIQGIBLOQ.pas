unit ULIQLIQGIBLOQ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport,Math;

type
  TFLIQLIQGIBLOQ = class(TForm)
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
    QRLFolio: TQRLabel;
    ChildBand1: TQRChildBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    ChildBand2: TQRChildBand;
    QRMemo2: TQRMemo;
    QL_Dliqc: TQuery;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcDESCOMB: TStringField;
    QL_DliqcDEVOLUCION: TFloatField;
    QL_DliqcCANTIDAD: TFloatField;
    QL_DliqcPRECIO_UNITARIO: TFloatField;
    QL_DliqcIEPS_POR_LITRO: TFloatField;
    QL_DliqcIMPORTE_IEPS: TFloatField;
    QL_DliqcIMPORTE: TFloatField;
    QRLabel3: TQRLabel;
    QL_DliqcCONSIGNACION: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..9] of TQRLabel;
    procedure CreaEtiquetas;
    procedure IniciaEtiquetasCmb;
    procedure IniciaEtiquetasProd;

  public
    { Public declarations }
    SwIncluirPagare:Boolean;
    procedure PreparaReporte;
  end;

Const
  xLeft=5;

var
  FLIQLIQGIBLOQ: TFLIQLIQGIBLOQ;
  xtp:char;                                                                                                                                                       
  xlin:string;
  xw,xl,
  xtipo:integer;
  swaceites:boolean;



implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQLIQG, ULIQLIQGR, StrUtils;

{$R *.DFM}

procedure TFLIQLIQGIBLOQ.CreaEtiquetas;
var i:integer;
begin
  xw:=66;
  xl:=xLeft;
  for i:=1 to 9 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Combustible';
        2:Caption:='';
        3:Caption:='Devolución';
        4:Caption:='Consignación';
        5:Caption:='Cantidad';
        6:Caption:='Prec. Unit';
        7:Caption:='IEPS por Lt.';
        8:Caption:='IEPS';
        9:Caption:='Importe';
      end;
      if i=1 then xw:=118;
      if i=4 then xw:=96;
      if i in [3,5,9] then xw:=76;
      if i in [6..8] then xw:=58;
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
      if i in [1,9] then Frame.DrawRight:=false
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

procedure TFLIQLIQGIBLOQ.IniciaEtiquetasCmb;
var i:word;
begin
  xl:=xLeft;
  for i:=1 to 9 do begin
    xw:=66;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Combustible';
        2:Caption:='';
        3:Caption:='Devolución';
        4:Caption:='Consignación';
        5:Caption:='Cantidad';
        6:Caption:='Prec. Unit';
        7:Caption:='IEPS por Lt.';
        8:Caption:='IEPS';
        9:Caption:='Importe';
      end;
      if i=1 then Frame.DrawRight:=false;
      if i=1 then xw:=118;
      if i=2 then xw:=66;
      if i=4 then xw:=96;
      if i in [3,5,9] then xw:=76;
      if i in [6..8] then xw:=58;
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

procedure TFLIQLIQGIBLOQ.IniciaEtiquetasProd;
var i:word;
begin
  xl:=xleft;
  for i:=1 to 9 do begin
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
        9:Caption:='';
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

procedure TFLIQLIQGIBLOQ.PreparaReporte;
var totc,tota,totdev,totcon,totieps,
    totp,totcant,totfaltantes,totDesc:real;
    s,sAux:string;
    ADescripcion:TStringList;
    i:Integer;
    AjuLts,AjuImp,_FactorAjusteReal, ImportePago:Double;
    TotAjuLts,TotAjuImp:Double;
    SwAjusteAplicado:Boolean;
    swTPagEfectivoConDescuento:Boolean;
begin
  with DMGEN,DMGAS,DMLIQ do begin
    CreaEtiquetas;
    SwAjusteAplicado := False;
    T_Tpag.Active:=true;
    totc:=0; totcant:=0; totdev:=0; totcon:=0; totfaltantes:=0; totieps:=0;
    AjuLts:=0; AjuImp:=0; ImportePago := 0;  TotAjuLts:=0; TotAjuImp:=0;
    swaceites:=false;
    BndDt.Items.Clear;
    QL_Dliqc.Close;
    QL_Dliqc.SQL.Clear;
    QL_Dliqc.SQL.Add('Select d.combustible,(select nombre from dgastcmb where clave=d.combustible) as DesComb,');
    QL_Dliqc.SQL.Add('  coalesce(sum(d.Devolucion),0) as Devolucion,');
    QL_Dliqc.SQL.Add('  coalesce(sum(d.Consignacion),0) as Consignacion,');
    QL_Dliqc.SQL.Add('  coalesce(sum(d.Cantidad),0) as Cantidad,');
    QL_Dliqc.SQL.Add('  max(d.precio_civa) as precio_unitario,');
    QL_Dliqc.SQL.Add('  max(d.ieps_por_litro) as ieps_por_litro,');
    QL_Dliqc.SQL.Add('  coalesce(sum(d.Importe_ieps),0) as Importe_ieps,');
    QL_Dliqc.SQL.Add('  coalesce(sum(d.Importe),0) as Importe');
    QL_Dliqc.SQL.Add('from dgasdliqc d');
    QL_Dliqc.SQL.Add('Where d.Estacion=:pestacion and d.Fecha>=:pfechaini and d.Fecha<=:pfechafin');
    if T_LiqgLIQUIDAGLOBAL.AsString='No' then
      QL_Dliqc.SQL.Add(' and d.Isla='+InttoStr(T_LiqgISLA.AsInteger));
    QL_Dliqc.SQL.Add(' and d.Turno='+InttoStr(T_LiqgTURNO.AsInteger));
    QL_Dliqc.SQL.Add('group by d.combustible');
    QL_Dliqc.ParamByName('pestacion').AsInteger:=T_LiqgESTACION.AsInteger;
    QL_Dliqc.ParamByName('pfechaini').AsDateTime:=T_LiqgFECHA.AsDateTime;
    QL_Dliqc.ParamByName('pfechafin').AsDateTime:=T_LiqgFECHA.AsDateTime;
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;
    QL_Dliqc.First;
    while not QL_Dliqc.Eof do begin
      //determina ajuste
      try
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_AuxiReal2.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select coalesce(Sum(d.Diferencia),0) as Real1, coalesce(Sum(d.Total),0) as Real2 from DGASAJUD2 d, DGASAJUD m');
        Q_Auxi.SQL.Add('where m.estacion=d.estacion');
        Q_Auxi.SQL.Add('  and m.fecha=d.fecha');
        Q_Auxi.SQL.Add('  and m.turno=d.turno');
        Q_Auxi.SQL.Add('  and d.Estacion='+inttostr(T_LiqgESTACION.AsInteger));
        Q_Auxi.SQL.Add('  and d.fecha>='+QuotedStr(FechaToStrSql(T_LiqgFECHA.AsDateTime)));
        Q_Auxi.SQL.Add('  and d.fecha<='+QuotedStr(FechaToStrSql(T_LiqgFECHA.AsDateTime)));
        Q_Auxi.SQL.Add('  and d.Combustible='+inttostr(QL_DliqcCOMBUSTIBLE.AsInteger));
        Q_Auxi.SQL.Add('  and m.turno='+IntToStr(T_LiqgTURNO.AsInteger));

        Q_Auxi.Prepare;
        Q_Auxi.Open;
        AjuLts := Q_AuxiReal1.AsFloat;
        AjuImp := Q_AuxiReal2.AsFloat;
        if AjuImp>0.001 then begin
          if T_LiqgLIQUIDAGLOBAL.AsString='No' then
            _FactorAjusteReal:=DeterminaFactorDeAjuste(T_LiqgESTACION.AsInteger,T_LiqgFECHA.AsDateTime,T_LiqgFECHA.AsDateTime,QL_DliqcCOMBUSTIBLE.AsInteger,T_LiqgISLA.AsInteger,T_LiqgTURNO.AsInteger)
          else
            _FactorAjusteReal:=DeterminaFactorDeAjuste(T_LiqgESTACION.AsInteger,T_LiqgFECHA.AsDateTime,T_LiqgFECHA.AsDateTime,QL_DliqcCOMBUSTIBLE.AsInteger,0,T_LiqgTURNO.AsInteger);
          if _FactorAjusteReal>0.001 then begin
            AjuLts := AjustaFloat(AjuLts*_FactorAjusteReal,2);
            AjuImp := AjustaFloat(AjuImp*_FactorAjusteReal,2);
          end
          else begin
            AjuLts := AjustaFloat(AjuLts*0,2);
            AjuImp := AjustaFloat(AjuImp*0,2);
          end;
        end
        else begin
          AjuLts := AjustaFloat(AjuLts*0,2);
          AjuImp := AjustaFloat(AjuImp*0,2);
        end;
        TotAjuLts := TotAjuLts + AjuLts;
        TotAjuImp := TotAjuImp + AjuImp;
      finally
        Q_Auxi.Close;
      end;

      xlin:='D//'+QL_DliqcDESCOMB.AsString+'// //'+
                  FormatoMoneda(QL_DliqcDEVOLUCION.AsFloat)+'//'+
                  FormatoMoneda(QL_DliqcCONSIGNACION.AsFloat)+'//'+
                  FormatoMoneda(QL_DliqcCANTIDAD.AsFloat-AjuLts)+'//'+
                  FormatFloat('##,##0.0000',QL_DliqcPRECIO_UNITARIO.AsFloat)+'//'+
                  FormatoMoneda(QL_DliqcIEPS_POR_LITRO.AsFloat)+'//'+
                  FormatoMoneda((QL_DliqcCANTIDAD.AsFloat-AjuLts)*QL_DliqcIEPS_POR_LITRO.AsFloat)+'//'+
                  FormatoMoneda(QL_DliqcIMPORTE.AsFloat-AjuImp);
      BndDt.Items.Add(xlin);
      totc:=totc+(QL_DliqcIMPORTE.AsFloat-AjuImp);
      totcant:=totcant+(QL_DliqcCANTIDAD.AsFloat-AjuLts);
      totdev:=totdev+QL_DliqcDEVOLUCION.AsFloat;
      totcon:=totcon+QL_DliqcCONSIGNACION.AsFloat;
      totieps := totieps +((QL_DliqcCANTIDAD.AsFloat-AjuLts)*QL_DliqcIEPS_POR_LITRO.AsFloat);
      QL_Dliqc.Next;
    end;
    xlin:='T// // //'+FormatoMoneda(totdev)+'//'+FormatoMoneda(totcon)+'//'+FormatoMoneda(totcant)+'// // //'+FormatoMoneda(totieps)+'//'+FormatoMoneda(totc);
    BndDt.Items.Add(xlin);
    
    with DMGAS do begin
      try
        Q_Auxi.Close;
        Q_AuxiStr50.FieldKind:=fkInternalCalc;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('select');
        Q_Auxi.SQL.Add('    t.nombre as Str50,');
        Q_Auxi.SQL.Add('    sum(d.descuento) as Real1');
        Q_Auxi.SQL.Add('from dgasdescd d');
        Q_Auxi.SQL.Add('inner join dgastcmb t on');
        Q_Auxi.SQL.Add('    d.combustible=t.clave');
        Q_Auxi.SQL.Add('where');
        Q_Auxi.SQL.Add('    d.estacion=:pestacion');
        Q_Auxi.SQL.Add('    and d.fecha=:pfecha');
        Q_Auxi.SQL.Add('    and d.turno=:pturno');
        Q_Auxi.SQL.Add('    and d.isla=:pisla');
        Q_Auxi.SQL.Add('group by');
        Q_Auxi.SQL.Add('    t.nombre,');
        Q_Auxi.SQL.Add('    d.descuento');
        Q_Auxi.SQL.Add('having(sum(d.descuento))>0');

        Q_Auxi.ParamByName('PESTACION').AsInteger:=DMLIQ.T_LiqgESTACION.AsInteger;
        Q_Auxi.ParamByName('PFECHA').AsDateTime:=DMLIQ.T_LiqgFECHA.AsDateTime;
        Q_Auxi.ParamByName('PTURNO').AsInteger:=DMLIQ.T_LiqgTURNO.AsInteger;
        Q_Auxi.ParamByName('PISLA').AsInteger:=DMLIQ.T_LiqgISLA.AsInteger;
        Q_Auxi.Prepare;
        Q_Auxi.Open;

        if Q_Auxi.RecordCount>0 then begin
          totDesc := 0;
          BndDt.Items.Add('S//Descuentos:');
          while not Q_Auxi.Eof do begin
            BndDt.Items.Add('D//'+Q_AuxiStr50.AsString+' // //'+FormatoMoneda(Q_AuxiReal1.AsFloat));
            totDesc := totDesc+Q_AuxiReal1.AsFloat;
            Q_Auxi.Next;
          end;
          BndDt.Items.Add('R// // //'+FormatoMoneda(totDesc));
        end;
      finally
        Q_Auxi.Close;
      end;
    end;

//
    xlin:='A//Aceites y Derivados//Saldo Inicial//Entradas//Devolución//Saldo Final//Ventas//'+
             'Precio//Importe';
    BndDt.Items.Add(xlin);
    tota:=0;
    T_Dliqa.First;
    while not T_Dliqa.Eof do begin
      xlin:='D//'+IntToClaveNum(T_DliqaProducto.AsInteger,3)+'-'+T_DliqaNombreProducto.AsString+'//'+
                  FormatoMoneda(T_DliqaSald_Ini.AsFloat)+'//'+
                  FormatoMoneda(T_DliqaEntradas.AsFloat)+'//'+FormatoMoneda(T_DliqaDevol.AsFloat)+'//'+
                  FormatoMoneda(T_DliqaSald_Fin.Asfloat)+'//'+
                  FormatoMoneda(T_DliqaVenta.AsFloat)+'//'+FormatoMoneda(T_DliqaPrecio_Civa.AsFloat)+'//'+
                  FormatoMoneda(T_DliqaImporte.AsFloat);
      tota:=tota+T_DliqaImporte.AsFloat;
      BndDt.Items.Add(xlin);
      T_Dliqa.Next;
    end;
    xlin:='T//';
    InsertaElemStr(FormatoMoneda(tota),9,xlin);
    BndDt.Items.Add(xlin);
//
    BndDt.Items.Add('S//Resumen de Ventas:');
    BndDt.Items.Add('D//Combustibles '+ifthen(totDesc>0,'(con descuento)','')+'// //'+FormatoMoneda(totc-totDesc));
    BndDt.Items.Add('D//Aceites y Derivados // //'+FormatoMoneda(tota));
    BndDt.Items.Add('R// // //'+FormatoMoneda(totc-totDesc+tota));
//
    BndDt.Items.Add('S//Resumen de Ingresos:');
    T_Dliqp.First;
    totp:=0;
    swTPagEfectivoConDescuento := False;
    while not T_Dliqp.Eof do begin
      ImportePago := T_DliqpImporte.AsFloat;
      if UpperCase(T_DliqpClasePago.AsString) = 'EFECTIVO' then begin
        if (not SwAjusteAplicado)and(TotAjuImp>0.001) then begin
          SwAjusteAplicado := True;
          ImportePago := T_DliqpImporte.AsFloat-TotAjuImp;
        end;
      end;
      xlin:='D//'+T_DliqpDescripcionPago.AsString+' '+
            IfThen((totDesc>0)and(UpperCase(T_DliqpClasePago.AsString) = 'EFECTIVO')and(not swTPagEfectivoConDescuento),
              '(con descuento)',
              '')
            +'// //'+
            IfThen((totDesc>0)and(UpperCase(T_DliqpClasePago.AsString) = 'EFECTIVO')and(not swTPagEfectivoConDescuento),
              FormatoMoneda(ImportePago-totDesc),
              FormatoMoneda(ImportePago));

      if (totDesc>0) and (UpperCase(T_DliqpClasePago.AsString) = 'EFECTIVO') and (not swTPagEfectivoConDescuento) then
        swTPagEfectivoConDescuento := True; //Hay clientes que configuran el tipo de pago Cheques con ClasePago "Efectivo" y provocaba que aplicara doble descuento, en realidad sólo se debe aplicar en el tipo de pago Efectivo

      if abs(ImportePago)>0.001 then
        BndDt.Items.Add(xlin);
      totp:=totp+ImportePago;
      if T_DliqpClasePago.AsString='Faltantes' then
        totfaltantes:=totfaltantes+ImportePago;
      T_Dliqp.Next;
    end;
    xlin:='R// // //'+FormatoMoneda(totp-totDesc);
    BndDt.Items.Add(xlin);
    if VarGasImprimirPagareFaltantes='Si' then begin
      BndDt.Items.Add('F//');
      s:=QRMemo2.Lines[0];
      if FileExists(ExtractFilePath(Application.ExeName) + 'LiqComb.txt') then begin
        ADescripcion:=TStringList.Create();
        ADescripcion.LoadFromFile(ExtractFilePath(Application.ExeName) + 'LiqComb.txt');
        QRMemo2.Lines.Clear;
        for i:=0 to ADescripcion.Count-1 do begin
          sAux:=sAux+ADescripcion.Strings[i]+#13;
          QRMemo2.Lines.Add('');
        end;
        Insert(FormatFloat('###,###,##0.00',totfaltantes),sAux,Pos('$',sAux)+2);
        QRMemo2.Lines[0]:=sAux;
        ADescripcion.Free;
      end
      else begin
        Insert(FormatFloat('###,###,##0.00',totfaltantes),s,Pos('$',s)+2);
        QRMemo2.Lines[0]:=s;
      end;
    end;
    if SwIncluirPagare then begin
      QRMemo2.Enabled:=True;
      ChildBand2.Frame.DrawTop:=True;
    end
    else begin
      QRMemo2.Enabled:=False;
      ChildBand2.Frame.DrawTop:=False;
    end;
  end;
end;

procedure TFLIQLIQGIBLOQ.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i,xl,xw:word;
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
    if DMGAS.swTurnoLectura then
      QRLEnca.Caption:=FLIQLIQGR.QL_LiqgDescripTurno.AsString+'    Desp.: '+DMLIQ.T_LiqgNombreDespachador.AsString+'    Cajero:  '+QT_TurcaNomCajero.AsString
    else
      QRLEnca.Caption:=FLIQLIQG.QL_LiqgDescripTurno.AsString+'    Desp.: '+DMLIQ.T_LiqgNombreDespachador.AsString+'    Cajero:  '+QT_TurcaNomCajero.AsString;
    if DMLIQ.T_LiqgLIQUIDAGLOBAL.AsString='No' then
      QRLFolio.Caption:='Isla: '+IntToClaveNum(DMLIQ.T_LiqgIsla.AsInteger,2)+'       Folio: '+IntToClaveNum(DMLIQ.T_LiqgFolio.AsInteger,6)
    else
      QRLFolio.Caption:='Isla: Global       Folio: '+IntToClaveNum(DMLIQ.T_LiqgFolio.AsInteger,6);
    if QT_EmprSERIEKEY.AsInteger=485 then begin
      if DMGAS.T_Ests.Locate('Clave',DMLIQ.T_LiqgESTACION.AsInteger,[]) then  begin
        QRLabel3.Caption:='Estación: '+DMGAS.T_EstsNOMBRE.AsString;
        QRLDir.Caption:=ObtenerDir(DMGAS.T_EstsSUCURSAL.AsInteger)+QT_EmprRFC.AsString;
      end;
    end
    else
      QRLabel3.Caption:='';
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
    SwAceites:=false;
    xtipo:=1;
    IniciaEtiquetasCmb;
  end;
end;

procedure TFLIQLIQGIBLOQ.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var i,xl,xw:word;

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
          Font.Style:=[fsBold];
          if xtipo=1 then begin
            if k in [3,4,5,8,9] then Frame.DrawTop:=true
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
  BndDt.Frame.DrawTop:=false;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  if xtp='A' then begin
   BndDt.Frame.DrawBottom:=true;
    if not SwAceites then IniciaEtiquetasProd;
    swaceites:=true;
  end;
  if xtp in ['A','S'] then inc(xtipo);
  InicializaEtiquetas(1,9);
  ExtraeEtiquetas(1,9);
end;

procedure TFLIQLIQGIBLOQ.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQLIQGIBLOQ.QRLabel1Print(sender: TObject; var Value: String);
begin
  Value:=DMLIQ.T_LiqgNombreDespachador.AsString;
end;

procedure TFLIQLIQGIBLOQ.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='F';
end;

end.
