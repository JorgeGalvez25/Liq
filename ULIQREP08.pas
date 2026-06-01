unit ULIQREP08;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport;

type
  TFLIQREP08 = class(TForm)
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
    ChBEnca: TQRChildBand;
    ChBEnca2: TQRChildBand;
    QRLEti1: TQRLabel;
    QRLEti2: TQRLabel;
    QRLEti3: TQRLabel;
    QL_Tcmb: TQuery;
    QL_TcmbNOMBRE: TStringField;
    QRLabel4: TQRLabel;
    TT_Auxi: TTable;
    TT_AuxiDespachador: TIntegerField;
    TT_AuxiImpCmb1: TFloatField;
    TT_AuxiImpCmb2: TFloatField;
    TT_AuxiImpCmb3: TFloatField;
    TT_AuxiLtsCmb1: TFloatField;
    TT_AuxiLtsCmb2: TFloatField;
    TT_AuxiLtsCmb3: TFloatField;
    QL_DliqcESTACION: TIntegerField;
    QL_DliqcFECHA: TDateTimeField;
    QL_DliqcFOLIO: TIntegerField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcCANTIDAD: TFloatField;
    QL_DliqcPRECIO_CIVA: TFloatField;
    QL_DliqcDESP: TIntegerField;
    QL_TcmbCLAVE: TIntegerField;
    TT_AuxiNombreDespachador: TStringField;
    TT_AuxiTotalLitros: TFloatField;
    TT_AuxiTotalImporte: TFloatField;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_DliqcISLA: TIntegerField;
    QL_DliqcTURNO: TIntegerField;
    QRLabel3: TQRLabel;
    QL_DliqcIMPORTE: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ModoRep:integer;
    QRLabelEnca,
    QRLabelDeta:array [1..9] of TQRLabel;
    procedure CreaEtiquetas;
    procedure CreaTablaTemp;
  public
    { Public declarations }
    pIsla,
    pTurno:integer;
    procedure PreparaReporte(xModo:integer);
  end;

Const
  xLeft=5;

var
  FLIQREP08: TFLIQREP08;
  xtp:char;
  xlin:string;
  xAncho,xwid:integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIQREP08P;

{$R *.DFM}

procedure TFLIQREP08.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
  for i:=1 to 9 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
                1:Caption:='';
          2,4,6,8:Caption:='Litros';
          3,5,7,9:Caption:='Importe';
      end;
      Case i of
             1:xw:=214;
       2,4,6,8:xw:=82;
       3,5,7,9:xw:=92;
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
      if i=9 then Frame.DrawRight:=false;
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
      if i=1 then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
  xwid:=xl;
end;

procedure TFLIQREP08.PreparaReporte;
var tot:Array[1..8] of real;
    totlts:Array[1..3] of real;
    totimp:Array[1..3] of real;
    ajults:Array[1..3] of real;
    ajuimp:Array[1..3] of real;
    lts1,lts2,lts3,ltst:real;
    imp1,imp2,imp3,impt,factor,_FactorAjusteReal:real;
    i:word;
begin
  with DMGEN,DMLIQ,DMGAS do begin
    ModoRep:=xModo;
    xancho:=78;
    CreaEtiquetas;
    InicializaTemp(TT_Auxi);
    CreaTablaTemp;
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
    for i:=1 to 8 do begin
      tot[i]:=0;
      if i<=3 then begin
        totlts[i]:=0;
        totimp[i]:=0;
        ajults[i]:=0;
        ajuimp[i]:=0;
      end;
    end;
    BndDt.Items.Clear;
    QL_Dliqc.Close;
    QL_Dliqc.SQL.Clear;
    QL_Dliqc.SQL.Add('Select c.Estacion,c.Isla,c.Turno,c.Fecha,c.Folio,c.Combustible,c.Cantidad,c.Precio_Civa, c.Importe, ');
    QL_Dliqc.SQL.Add('  (Select Despachador from DGASLIQG where Estacion=c.Estacion and Folio=c.folio) as Desp');
    QL_Dliqc.SQL.Add(' from dgasdliqc c');
    QL_Dliqc.SQL.Add('Where c.Estacion=:pestacion and c.Fecha>=:pfechaini and c.Fecha<=:pfechafin');
    QL_Dliqc.SQL.Add('and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado="Si")');
    if pIsla>0  then QL_Dliqc.SQL.Add(' and Isla='+InttoStr(pIsla));
    if pTurno>0 then QL_Dliqc.SQL.Add(' and Turno='+InttoStr(pTurno));
    QL_Dliqc.SQL.Add('Order by Estacion,Folio,Fecha');
    QL_Dliqc.ParamByName('pestacion').AsInteger:=T_EstsClave.AsInteger;
    QL_Dliqc.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqc.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;

    try
      FAvance.PreparaAvance('Clasificando movimientos...',true,QL_Dliqc.RecordCount);
      while not QL_Dliqc.Eof do begin
        if not TT_Auxi.Locate('Despachador',QL_DliqcDesp.AsInteger,[]) then begin
          TT_Auxi.Insert;
          TT_AuxiDespachador.AsInteger:=QL_DliqcDesp.AsInteger;
          TT_AuxiImpCmb1.AsFloat:=0;
          TT_AuxiImpCmb2.AsFloat:=0;
          TT_AuxiImpCmb3.AsFloat:=0;
          TT_AuxiLtsCmb1.AsFloat:=0;
          TT_AuxiLtsCmb2.AsFloat:=0;
          TT_AuxiLtsCmb3.AsFloat:=0;
          TT_Auxi.Post;
        end;
        TT_Auxi.Edit;
//      ANTERIORMENTE PARA CALCULAR EL IMPORTE SE REALIZABA LA MULTUPLICACIÓN DE CANTIDAD POR PRECIO Y SE PERDÍAN DECIMALES        
        Case QL_DliqcCombustible.AsInteger of
          1:begin
              TT_AuxiLtsCmb1.AsFloat:=TT_AuxiLtsCmb1.AsFloat+QL_DliqcCantidad.AsFloat;
//              TT_AuxiImpCmb1.AsFloat:=TT_AuxiImpCmb1.AsFloat+AjustaFloat(QL_DliqcCantidad.AsFloat*QL_DliqcPrecio_Civa.AsFloat,2);
              TT_AuxiImpCmb1.AsFloat:=TT_AuxiImpCmb1.AsFloat+AjustaFloat(QL_DliqcIMPORTE.AsFloat,2);
              TotLts[1]:=TotLts[1]+QL_DliqcCantidad.AsFloat;
//              TotImp[1]:=TotImp[1]+(QL_DliqcCantidad.AsFloat*QL_DliqcPrecio_Civa.AsFloat);
              TotImp[1]:=TotImp[1]+(QL_DliqcIMPORTE.AsFloat);
            end;
          2:begin
              TT_AuxiLtsCmb2.AsFloat:=TT_AuxiLtsCmb2.AsFloat+QL_DliqcCantidad.AsFloat;
//              TT_AuxiImpCmb2.AsFloat:=TT_AuxiImpCmb2.AsFloat+AjustaFloat(QL_DliqcCantidad.AsFloat*QL_DliqcPrecio_Civa.AsFloat,2);
              TT_AuxiImpCmb2.AsFloat:=TT_AuxiImpCmb2.AsFloat+AjustaFloat(QL_DliqcIMPORTE.AsFloat,2);
              TotLts[2]:=TotLts[2]+QL_DliqcCantidad.AsFloat;
//              TotImp[2]:=TotImp[2]+(QL_DliqcCantidad.AsFloat*QL_DliqcPrecio_Civa.AsFloat);
              TotImp[2]:=TotImp[2]+(QL_DliqcIMPORTE.AsFloat);
            end;
          3:begin
              TT_AuxiLtsCmb3.AsFloat:=TT_AuxiLtsCmb3.AsFloat+QL_DliqcCantidad.AsFloat;
//              TT_AuxiImpCmb3.AsFloat:=TT_AuxiImpCmb3.AsFloat+AjustaFloat(QL_DliqcCantidad.AsFloat*QL_DliqcPrecio_Civa.AsFloat,2);
              TT_AuxiImpCmb3.AsFloat:=TT_AuxiImpCmb3.AsFloat+AjustaFloat(QL_DliqcIMPORTE.AsFloat,2);
              TotLts[3]:=TotLts[3]+QL_DliqcCantidad.AsFloat;
//              TotImp[3]:=TotImp[3]+(QL_DliqcCantidad.AsFloat*QL_DliqcPrecio_Civa.AsFloat);
              TotImp[3]:=TotImp[3]+(QL_DliqcIMPORTE.AsFloat);
            end;
        end;
        TT_Auxi.Post;
        FAvance.AvanzaPosicion;
        QL_Dliqc.Next;
      end;
      if ModoRep=0 then begin
        for i:=1 to 3 do begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_AuxiReal2.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Sum(Diferencia) as Real1, Sum(Total) as Real2 from DGASAJUD2');
          Q_Auxi.SQL.Add('where Estacion='+inttostr(T_EstsClave.AsInteger));
          Q_Auxi.SQL.Add('  and Combustible='+inttostr(i));
          Q_Auxi.SQL.Add('  and fecha>="'+FechaToStrSql(VgFechaIni)+'"');
          Q_Auxi.SQL.Add('  and fecha<="'+FechaToStrSql(VgFechaFin)+'"');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          AjuLts[i]:=Q_AuxiReal1.AsFloat;
          AjuImp[i]:=Q_AuxiReal2.AsFloat;
          Q_Auxi.Close;
//          _FactorAjusteReal:=DeterminaFactorDeAjuste(T_EstsCLAVE.AsInteger,VgFechaIni,VgFechaFin,i,pIsla,pTurno);
//          if _FactorAjusteReal>0.001 then begin
//            AjuLts[i]:=AjustaFloat(AjuLts[i]*_FactorAjusteReal,2);
//            AjuImp[i]:=AjustaFloat(AjuImp[i]*_FactorAjusteReal,2);
//          end
//          else begin
//            AjuLts[i]:=AjustaFloat(AjuLts[i]*0,2);
//            AjuImp[i]:=AjustaFloat(AjuImp[i]*0,2);
//          end;
        end;
      end;
    finally
      FAvance.Close;
    end;

    try
      TT_Auxi.First;
      FAvance.PreparaAvance('Preparando reporte...',true,TT_Auxi.RecordCount);
      while not TT_Auxi.Eof do begin
        lts1:=TT_AuxiLtsCmb1.AsFloat;
        lts2:=TT_AuxiLtsCmb2.AsFloat;
        lts3:=TT_AuxiLtsCmb3.AsFloat;
        imp1:=TT_AuxiImpCmb1.AsFloat;
        imp2:=TT_AuxiImpCmb2.AsFloat;
        imp3:=TT_AuxiImpCmb3.AsFloat;
        if ModoRep=0 then begin
          factor:=dividefloat(imp1,totimp[1]);
          lts1:=lts1-ajults[1]*factor;
          imp1:=(imp1-ajuimp[1]*factor);
          factor:=dividefloat(imp2,totimp[2]);
          lts2:=lts2-ajults[2]*factor;
          imp2:=(imp2-ajuimp[2]*factor);
          factor:=dividefloat(imp3,totimp[3]);
          lts3:=lts3-ajults[3]*factor;
          imp3:=(imp3-ajuimp[3]*factor);
        end;
        ltst:=lts1+lts2+lts3;
        impt:=imp1+imp2+imp3;
        xlin:='D//'+TT_AuxiNombreDespachador.AsString+'//'+
                    FormatoMoneda(Lts1)+'//'+FormatoMoneda(Imp1)+'//'+
                    FormatoMoneda(Lts2)+'//'+FormatoMoneda(Imp2)+'//'+
                    FormatoMoneda(Lts3)+'//'+FormatoMoneda(Imp3)+'//'+
                    FormatoMoneda(Ltst)+'//'+FormatoMoneda(Impt)+'//';

        BndDt.Items.Add(xlin);
        FAvance.AvanzaPosicion;
        tot[1]:=tot[1]+lts1;
        tot[3]:=tot[3]+lts2;
        tot[5]:=tot[5]+lts3;
        tot[7]:=tot[7]+lts1+lts2+lts3;
        tot[2]:=tot[2]+imp1;
        tot[4]:=tot[4]+imp2;
        tot[6]:=tot[6]+imp3;
        tot[8]:=tot[8]+imp1+imp2+imp3;
        FAvance.AvanzaPosicion;
        TT_Auxi.Next;
      end;
      xlin:='T// //';
      for i:=1 to 8 do
        xlin:=xlin+FormatoMoneda(tot[i])+'//';
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP08.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP08P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
    if pIsla>0  then QRLEnca.Caption:=QRLEnca.Caption+'     Isla '+IntToClaveNum(pIsla,2);
    if pTurno>0 then QRLEnca.Caption:=QRLEnca.Caption+'     Turno '+IntToClaveNum(pTurno,2);
  end;
  if ModoRep=0 then
    QRLSistema.Caption:=IdSistNombre
  else
    QRLSistema.Caption:='';
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP08.BndDtBeforePrint(Sender: TQRCustomBand;
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
  InicializaEtiquetas(1,9);
  ExtraeEtiquetas(1,9);
end;

procedure TFLIQREP08.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP08.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Despachador', ftInteger, 0, True);
      Add('ImpCmb1', ftFloat,0,false);
      Add('ImpCmb2', ftFloat,0,false);
      Add('ImpCmb3', ftFloat,0,false);
      Add('LtsCmb1', ftFloat,0,false);
      Add('LtsCmb2', ftFloat,0,false);
      Add('LtsCmb3', ftFloat,0,false);
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


procedure TFLIQREP08.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Dliqc.Close;
    QL_Tcmb.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
  end;
end;

procedure TFLIQREP08.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  TT_AuxiTotalLitros.AsFloat:=TT_AuxiLtSCmb1.AsFloat+TT_AuxiLtsCmb2.AsFloat+TT_AuxiLtsCmb3.AsFloat;
  TT_AuxiTotalImporte.AsFloat:=TT_AuxiImpCmb1.AsFloat+TT_AuxiImpCmb2.AsFloat+TT_AuxiImpCmb3.AsFloat;
end;

end.
