unit ULIQREP35;

interface

uses  QRPDFFilt,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS;

type
  TFLIQREP35 = class(TForm)
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
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QL_Ajusd2: TQuery;
    QL_Ajusd2ESTACION: TIntegerField;
    QL_Ajusd2FECHA: TDateTimeField;
    QL_Ajusd2COMBUSTIBLE: TIntegerField;
    QL_Ajusd2VOLUMEN: TFloatField;
    QL_Ajusd2VENTA: TFloatField;
    QL_Ajusd2DIFERENCIA: TFloatField;
    QL_Ajusd2PRECIO: TFloatField;
    QL_Ajusd2TOTAL: TFloatField;
    QL_Dliqc: TQuery;
    QL_DliqcESTACION: TIntegerField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcFECHA: TDateTimeField;
    QL_DliqcPRECIO_CIVA: TFloatField;
    QL_DliqcCANTIDAD: TFloatField;
    QL_DliqcIMPORTE: TFloatField;
    TM_AuxiR: TRxMemoryData;
    TM_AuxiRCombustible: TIntegerField;
    TM_AuxiRNombreCombustible: TStringField;
    TM_AuxiRCantidad: TFloatField;
    TM_AuxiRPrecio: TFloatField;
    TM_AuxiRSubtotal: TFloatField;
    TM_AuxiRIVA: TFloatField;
    TM_AuxiRTotal: TFloatField;
    TM_AuxiRCantidadA: TFloatField;
    TM_AuxiRSubtotalA: TFloatField;
    TM_AuxiRIVAA: TFloatField;
    TM_AuxiRTotalA: TFloatField;
    QRLabel99: TQRLabel;
    QRLabel98: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRPDFFilter1: TQRPDFFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    procedure CargaBanda;
  public
    { Public declarations }
    procedure PreparaReporte(xEst:Integer);
  end;

Const
  xLeft=5;

var
  FLIQREP35: TFLIQREP35;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  xsw,SwAceites:Boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP05P, ULIQDESGLO, DDMGENT, UAVANCE, DDMCONS, ULIQREP35P;

{$R *.DFM}

procedure TFLIQREP35.PreparaReporte(xEst:Integer);
var
  fecha:TDateTime;
  xPrecio:Real;
  xPrecioSinIeps:Real;
  xTasa:Real;
  xIeps:Real;
begin
  TM_AuxiR.Active:=False;
  TM_AuxiR.Active:=True;

  try
    FAVANCE.PreparaAvance('Preparando Reporte...',True,DiasEntre(VgFechaIni,vgFechaFin));
    fecha:=VgFechaIni;
    while fecha<=VgFechaFin do begin
      QL_Ajusd2.Close;
      QL_Ajusd2.SQL.Clear;
      QL_Ajusd2.SQL.Add('select d.* from dgasajud2 d');
      QL_Ajusd2.SQL.Add('Where d.fecha='+QuotedStr(FechaToStrSQL(fecha)));
      QL_Ajusd2.SQL.Add('  and d.estacion='+IntToStr(xEst));
      QL_Ajusd2.SQL.Add('order by d.estacion');
      QL_Ajusd2.Prepare;
      QL_Ajusd2.Open;
      if QL_Ajusd2.RecordCount>0 then begin
//        FAVANCE.PreparaAvance2(True,QL_Ajusd2.RecordCount);
        while not QL_Ajusd2.Eof do begin
          DMCUP.DamePrecioFecha(QL_Ajusd2COMBUSTIBLE.AsInteger,fecha,xPrecio,xTasa);
          xIeps:=DMCUP.DameIEPS(QL_Ajusd2COMBUSTIBLE.AsInteger,fecha);
          xPrecioSinIeps := DivideFloat((xPrecio - xIeps),1+DivideFloat(xTasa,100))+xIeps;
          if TM_AuxiR.Locate('Combustible',QL_Ajusd2COMBUSTIBLE.AsInteger,[]) then begin
            TM_AuxiR.Edit;
            TM_AuxiRCantidad.AsFloat          :=TM_AuxiRCantidad.AsFloat + QL_Ajusd2VENTA.AsFloat;
            TM_AuxiRSubtotal.AsFloat          :=TM_AuxiRSubtotal.AsFloat + (QL_Ajusd2VENTA.AsFloat*xPrecioSinIeps);//(QL_Ajusd2PRECIO.AsFloat-DMCUP.DameIEPS(QL_Ajusd2COMBUSTIBLE.AsInteger,fecha));
            TM_AuxiRTotal.AsFloat             :=TM_AuxiRTotal.AsFloat + (QL_Ajusd2VENTA.AsFloat * xPrecio);
            TM_AuxiRIVA.AsFloat               :=TM_AuxiRTotal.AsFloat-TM_AuxiRSubtotal.AsFloat;

            TM_AuxiRCantidadA.AsFloat         :=TM_AuxiRCantidadA.AsFloat + QL_Ajusd2VOLUMEN.AsFloat;
            TM_AuxiRSubtotalA.AsFloat         :=TM_AuxiRSubtotalA.AsFloat + (QL_Ajusd2VOLUMEN.AsFloat* xPrecioSinIeps);//(QL_Ajusd2PRECIO.AsFloat-DMCUP.DameIEPS(QL_Ajusd2COMBUSTIBLE.AsInteger,fecha));
            TM_AuxiRTotalA.AsFloat            :=TM_AuxiRTotalA.AsFloat + (QL_Ajusd2VOLUMEN.AsFloat * xPrecio);
            TM_AuxiRIVAA.AsFloat              :=TM_AuxiRTotalA.AsFloat-TM_AuxiRSubtotalA.AsFloat;

          end
          else begin
            TM_AuxiR.Append;
            TM_AuxiRCombustible.AsInteger     :=QL_Ajusd2COMBUSTIBLE.AsInteger;
            TM_AuxiRNombreCombustible.AsString:=Copy(DMGAS.GetNombreCombustible(QL_Ajusd2COMBUSTIBLE.AsInteger),0,15);
            TM_AuxiRCantidad.AsFloat          :=QL_Ajusd2VENTA.AsFloat;
            TM_AuxiRPrecio.AsFloat            :=xPrecio;//QL_Ajusd2PRECIO.AsFloat;
            TM_AuxiRSubtotal.AsFloat          :=QL_Ajusd2VENTA.AsFloat*xPrecioSinIeps;//(QL_Ajusd2PRECIO.AsFloat-DMCUP.DameIEPS(QL_Ajusd2COMBUSTIBLE.AsInteger,fecha));
            TM_AuxiRTotal.AsFloat             :=(TM_AuxiRCantidad.AsFloat * xPrecio);
            TM_AuxiRIVA.AsFloat               :=TM_AuxiRTotal.AsFloat-TM_AuxiRSubtotal.AsFloat;

            TM_AuxiRCantidadA.AsFloat         :=QL_Ajusd2VOLUMEN.AsFloat;
            TM_AuxiRSubtotalA.AsFloat         :=QL_Ajusd2VOLUMEN.AsFloat* xPrecioSinIeps;//(QL_Ajusd2PRECIO.AsFloat-DMCUP.DameIEPS(QL_Ajusd2COMBUSTIBLE.AsInteger,fecha));
            TM_AuxiRTotalA.AsFloat            :=(TM_AuxiRCantidadA.AsFloat * xPrecio);
            TM_AuxiRIVAA.AsFloat              :=TM_AuxiRTotalA.AsFloat-TM_AuxiRSubtotalA.AsFloat;
          end;
          TM_AuxiR.Post;

          QL_Ajusd2.Next;
//          FAVANCE.AvanzaPosicion2;
        end;
      end
      else begin
        try
          QL_Dliqc.Close;
          QL_Dliqc.SQL.Clear;
          QL_Dliqc.SQL.Add('select estacion,combustible,fecha,precio_civa,Sum(cantidad) as Cantidad ,Sum(importe) as Importe from dgasdliqc');
          QL_Dliqc.SQL.Add('where fecha='+QuotedStr(FechaToStrSQL(fecha)));
          QL_Dliqc.SQL.Add('  and estacion='+IntToStr(xEst));
          QL_Dliqc.SQL.Add('group by estacion,combustible,fecha,precio_civa');
          QL_Dliqc.SQL.Add('order by estacion');
          QL_Dliqc.Prepare;
          QL_Dliqc.Open;
//          FAVANCE.PreparaAvance2(True,QL_Dliqc.RecordCount);
          while not QL_Dliqc.Eof do begin
            DMCUP.DamePrecioFecha(QL_DliqcCOMBUSTIBLE.AsInteger,fecha,xPrecio,xTasa);
            xIeps:=DMCUP.DameIEPS(QL_DliqcCOMBUSTIBLE.AsInteger,fecha);
            xPrecioSinIeps := DivideFloat((xPrecio - xIeps),1+DivideFloat(xTasa,100))+xIeps;
            if TM_AuxiR.Locate('Combustible',QL_DliqcCOMBUSTIBLE.AsInteger,[]) then begin
              TM_AuxiR.Edit;
              TM_AuxiRCantidad.AsFloat          :=TM_AuxiRCantidad.AsFloat + QL_DliqcCANTIDAD.AsFloat;
              TM_AuxiRSubtotal.AsFloat          :=TM_AuxiRSubtotal.AsFloat+(QL_DliqcCANTIDAD.AsFloat*xPrecioSinIeps);
              TM_AuxiRTotal.AsFloat             :=TM_AuxiRTotal.AsFloat+QL_DliqcIMPORTE.AsFloat;
              TM_AuxiRIVA.AsFloat               :=TM_AuxiRTotal.AsFloat-TM_AuxiRSubtotal.AsFloat;

              TM_AuxiRCantidadA.AsFloat         :=TM_AuxiRCantidadA.AsFloat+QL_DliqcCANTIDAD.AsFloat;
              TM_AuxiRSubtotalA.AsFloat         :=TM_AuxiRSubtotalA.AsFloat+(QL_DliqcCANTIDAD.AsFloat*xPrecioSinIeps);
              TM_AuxiRTotalA.AsFloat            :=TM_AuxiRTotalA.AsFloat+QL_DliqcIMPORTE.AsFloat;
              TM_AuxiRIVAA.AsFloat              :=TM_AuxiRTotalA.AsFloat-TM_AuxiRSubtotalA.AsFloat;

            end
            else begin
              TM_AuxiR.Append;
              TM_AuxiRCombustible.AsInteger     :=QL_DliqcCOMBUSTIBLE.AsInteger;
              TM_AuxiRNombreCombustible.AsString:=Copy(DMGAS.GetNombreCombustible(QL_DliqcCOMBUSTIBLE.AsInteger),0,15);
              TM_AuxiRCantidad.AsFloat          :=QL_DliqcCANTIDAD.AsFloat;
              TM_AuxiRPrecio.AsFloat            :=xPrecio;
              TM_AuxiRSubtotal.AsFloat          :=QL_DliqcCANTIDAD.AsFloat*xPrecioSinIeps;
              TM_AuxiRIVA.AsFloat               :=QL_DliqcIMPORTE.AsFloat-TM_AuxiRSubtotal.AsFloat;
              TM_AuxiRTotal.AsFloat             :=QL_DliqcIMPORTE.AsFloat;

              TM_AuxiRCantidadA.AsFloat         :=QL_DliqcCANTIDAD.AsFloat;
              TM_AuxiRSubtotalA.AsFloat         :=QL_DliqcCANTIDAD.AsFloat*xPrecioSinIeps;
              TM_AuxiRIVAA.AsFloat              :=QL_DliqcIMPORTE.AsFloat-TM_AuxiRSubtotalA.AsFloat;
              TM_AuxiRTotalA.AsFloat            :=QL_DliqcIMPORTE.AsFloat;
            end;
            TM_AuxiR.Post;
            QL_Dliqc.Next;
            FAVANCE.AvanzaPosicion2;
          end;
        finally
          QL_Dliqc.Close;
        end;
      end;
//      FAVANCE.Close2;
      QL_Ajusd2.Close;
      fecha:=fecha+1;
      FAVANCE.AvanzaPosicion;
    end;
  finally
    FAVANCE.Close;
    if TM_AuxiR.RecordCount>0 then
      CargaBanda
    else
      MensajeInfo('No hay datos a mostrar, favor de verificar la estación o rango de fechas');
  end;
end;

procedure TFLIQREP35.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP35P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;

  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep)
end;

procedure TFLIQREP35.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Font.Size:=8;
        if k=1 then Left:=xLeft;
//        if (xtp='D')and(xtipo>2) then
//          if k=1 then
//            Left:=Left+30;
        if (xtp='S') then begin
          if k=1 then begin
            Font.Style:=[fsUnderline];
          end;
        end;
        if (xtp='R') then begin
          Font.Style:=[fsBold];
          if k in [2..5] then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp in ['A','E'] then Font.Style:=[fsBold];
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k in [2,4..6,10..12] then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp='X' then begin
          Font.Style:=[fsBold];
          if k=4 then Frame.DrawTop:=true
        end;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k-ri+2);
    end;
  end;

begin
  BndDt.Frame.DrawBottom:=false;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  if xtp in ['A','S'] then
    inc(xtipo);
  InicializaEtiquetas(1,12);
  ExtraeEtiquetas(1,12);
end;

procedure TFLIQREP35.CargaBanda;
var
  xtotr,xtota,xtotcmb:array[1..4] of Real;
  i:Integer;
  xDiferencia:Real;
  xDifComb:Real;
begin
  try
    FAVANCE.PreparaAvance('Preparando datos...', True, TM_AuxiR.RecordCount);
    TM_AuxiR.First;
    BndDt.Items.Clear;
    for i := 1 to 4 do begin
      xtotr[i]:=0;
      xtota[i]:=0;
    end;
    while not TM_AuxiR.Eof do begin
      xlin:='D//'+TM_AuxiRNombreCombustible.AsString+'//'+FormatoMoneda(TM_AuxiRCantidad.AsFloat)+'//'+FormatoMoneda(TM_AuxiRPrecio.AsFloat)+'//'+
            FormatoMoneda(TM_AuxiRSubtotal.AsFloat)+'//'+FormatoMoneda(TM_AuxiRIVA.AsFloat)+'//'+FormatoMoneda(TM_AuxiRTotal.AsFloat)+'//'+
            TM_AuxiRNombreCombustible.AsString+'//'+FormatoMoneda(TM_AuxiRCantidadA.AsFloat)+'//'+FormatoMoneda(TM_AuxiRPrecio.AsFloat)+'//'+
            FormatoMoneda(TM_AuxiRSubtotalA.AsFloat)+'//'+FormatoMoneda(TM_AuxiRIVAA.AsFloat)+'//'+FormatoMoneda(TM_AuxiRTotalA.AsFloat);
      BndDt.Items.Add(xlin);
      xtotr[1]:=xtotr[1]+TM_AuxiRSubtotal.AsFloat;
      xtotr[2]:=xtotr[2]+TM_AuxiRIVA.AsFloat;
      xtotr[3]:=xtotr[3]+TM_AuxiRTotal.AsFloat;
      xtotr[4]:=xtotr[4]+TM_AuxiRCantidad.AsFloat;

      xtota[1]:=xtota[1]+TM_AuxiRSubtotalA.AsFloat;
      xtota[2]:=xtota[2]+TM_AuxiRIVAA.AsFloat;
      xtota[3]:=xtota[3]+TM_AuxiRTotalA.AsFloat;
      xtota[4]:=xtota[4]+TM_AuxiRCantidadA.AsFloat;

      TM_AuxiR.Next;
      FAVANCE.AvanzaPosicion;
    end;
    xlin:='T//Total: //'+FormatoMoneda(xtotr[4])+' // //'+FormatoMoneda(xtotr[1])+'//'+FormatoMoneda(xtotr[2])+'//'+FormatoMoneda(xtotr[3])+'// //'+FormatoMoneda(xtota[4])+' // //'+FormatoMoneda(xtota[1])+'//'+FormatoMoneda(xtota[2])+
          '//'+FormatoMoneda(xtota[3]);
    BndDt.Items.Add(xlin);

    BndDt.Items.Add('D//');
    xlin:='A//Diferencia entre Ventas';
    BndDt.Items.Add(xlin);
    xlin:='A// Conceptos // Real // Ajustadas // Diferencias // %';
    BndDt.Items.Add(xlin);
    xDiferencia:=xtotr[4]-xtota[4];
    xlin:='D//Cantidad (lts) //'+FormatoMoneda(xtotr[4])+'//'+FormatoMoneda(xtota[4])+'//'+FormatoMoneda(xDiferencia)+'//'+FormatoMoneda(DivideFloat(xDiferencia*100,xtotr[4]))+'%';
    BndDt.Items.Add(xlin);
    xDiferencia:=xtotr[1]-xtota[1];
    xlin:='D//Subtotal //'+FormatoMoneda(xtotr[1])+'//'+FormatoMoneda(xtota[1])+'//'+FormatoMoneda(xDiferencia)+'//'+FormatoMoneda(DivideFloat(xDiferencia*100,xtotr[1]))+'%';
    BndDt.Items.Add(xlin);
    xDiferencia:=xtotr[2]-xtota[2];
    xlin:='D//IVA //'+FormatoMoneda(xtotr[2])+'//'+FormatoMoneda(xtota[2])+'//'+FormatoMoneda(xDiferencia)+'//'+FormatoMoneda(DivideFloat(xDiferencia*100,xtotr[2]))+'%';
    BndDt.Items.Add(xlin);
    xDiferencia:=xtotr[3]-xtota[3];
    xlin:='R//Total //'+FormatoMoneda(xtotr[3])+'//'+FormatoMoneda(xtota[3])+'//'+FormatoMoneda(xDiferencia)+'//'+FormatoMoneda(DivideFloat(xDiferencia*100,xtotr[3]))+'%';
    BndDt.Items.Add(xlin);

    //FALTA
    //Resumen solicitado por JAG
    BndDt.Items.Add('D//');
    xlin:='A//Diferencia entre Combustible';
    BndDt.Items.Add(xlin);
    xlin:='A// Combustible // Real // Ajustadas // Diferencias // %';
    BndDt.Items.Add(xlin);
    TM_AuxiR.First;
    for i:=1 to 4 do
      xtotcmb[i]:=0;
    while not TM_AuxiR.Eof do begin
      xDifComb:=TM_AuxiRCantidad.AsFloat-TM_AuxiRCantidadA.AsFloat;
      xlin:='D//'+TM_AuxiRNombreCombustible.AsString+'//'+FormatoMoneda(TM_AuxiRCantidad.AsFloat)+'//'+FormatoMoneda(TM_AuxiRCantidadA.AsFloat)
             +'//'+FormatoMoneda(xDifComb)
             +'//'+FormatoMoneda(DivideFloat(xDifComb*100,TM_AuxiRCantidad.AsFloat))+'%';
      BndDt.Items.Add(xlin);
      xtotcmb[1]:=xtotcmb[1]+TM_AuxiRCantidad.AsFloat;
      xtotcmb[2]:=xtotcmb[2]+TM_AuxiRCantidadA.AsFloat;
      xtotcmb[3]:=xtotcmb[3]+xDifComb;
      TM_AuxiR.Next;
    end;
    xlin:='R//Total //'+FormatoMoneda(xtotcmb[1])+'//'+FormatoMoneda(xtotcmb[2])
             +'//'+FormatoMoneda(xtotcmb[3])
             +'//'+FormatoMoneda(DivideFloat(xtotcmb[3]*100,xtotcmb[1]))+'%';
    BndDt.Items.Add(xlin);
  finally
    TM_AuxiR.Active:=False;
    FAVANCE.Close;
  end;
end;

end.
