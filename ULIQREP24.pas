unit ULIQREP24;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport,
  RxMemDS, StrUtils, Variants, Math;

type
  TFLIQREP24 = class(TForm)
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
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    ChBEnca: TQRChildBand;
    QL_Rcup: TQuery;
    QL_RcupESTACION: TIntegerField;
    QL_RcupFECHA: TDateTimeField;
    QL_RcupTURNO: TIntegerField;
    QL_RcupSERIE: TIntegerField;
    QL_RcupIMPORTE: TFloatField;
    QL_RcupCLIENTE: TIntegerField;
    TT_Auxi: TRxMemoryData;
    TT_AuxiCliente: TIntegerField;
    TT_AuxiSerie: TIntegerField;
    TT_AuxiImporte: TFloatField;
    TT_AuxiNombre: TStringField;
    QL_CupoFeria: TQuery;
    QL_CupoFeriaSERIE: TIntegerField;
    QL_CupoFeriaNOBLOCK: TIntegerField;
    QL_CupoFeriaFOLIO: TIntegerField;
    QL_CupoFeriaFECHAVENTA: TDateTimeField;
    QL_CupoFeriaFECHARECUP: TDateTimeField;
    QL_CupoFeriaIMPORTE: TFloatField;
    QL_CupoFeriaESTATUS: TStringField;
    QL_CupoFeriaSERIEFAC: TStringField;
    QL_CupoFeriaFOLIOFAC: TIntegerField;
    QL_CupoFeriaESTACION: TIntegerField;
    QL_CupoFeriaCAJA: TIntegerField;
    QL_CupoFeriaTURNO: TIntegerField;
    QL_CupoFeriaFECHAEMISION: TDateTimeField;
    QL_CupoFeriaTIPO: TStringField;
    QL_CupoFeriaINDICE: TIntegerField;
    QL_CupoFeriaESTACIONRECUP: TIntegerField;
    QL_CupoFeriaNOCLIENTE: TIntegerField;
    QL_CupoFeriaIMPRESO: TStringField;
    QL_CupoFeriaKIOSCO: TIntegerField;
    QL_CupoFeriaTURNO_KIOSCO: TIntegerField;
    QL_CupoFeriaFECHA_KIOSCO: TDateTimeField;
    QL_RcupCUPON: TFloatField;
    TT_AuxiCupon: TFloatField;
    QL_RcupTIPO: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..6] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=6;

var
  FLIQREP24: TFLIQREP24;
  xtp:char;
  xlin:string;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIBLICENCIAS, DDMGEN_VTAS, ULIQREP24P;

{$R *.DFM}

procedure TFLIQREP24.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Serie';
        2:Caption:='Descripción / Folios';
        3:Caption:='Cantidad';
        4:Caption:='Precio';
        5:Caption:='Importe';
        6:Caption:='';
      end;
      Case i of
        1:xw:=45;
        2:xw:=390;
        3:xw:=60;
        4:xw:=60;
        5:xw:=80;
        6:xw:=60;
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
      Frame.Width:=1;
//      if i=NoEti then Frame.DrawRight:=false;
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
      if i in [1..2] then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP24.PreparaReporte;
var totc,totg,totl,IEPS,
    tott,cIEPS,xsubtotal,xiva:double;
    i,xno,xcliente,
    j,long,xcont,xnoserie,k,l:integer;
    swprimero:boolean;
    ximporte:double;
    ss,xlin2,xlin3,fechas,fecha,sigfecha:string;
    ListaCupones:TStringlist;

function FechaSQLToFecha(xfecha:String):String;
begin
  Result:=xfecha;
  Result[1]:=xfecha[4];
  Result[2]:=xfecha[5];
  Result[4]:=xfecha[1];
  Result[5]:=xfecha[2];
end;

begin
  with DMGEN,DMLIQ,DMGEN_VTAS,DMGAS,FLIQREP24P do begin
    CreaEtiquetas;
    BndDt.Items.Clear;
    for i:=1 to 2 do begin
      QL_Rcup.Close;
      QL_Rcup.SQL.Clear;

      if (i=1) then begin
        QL_Rcup.SQL.Add('Select r.Estacion, r.Fecha, r.Turno, r.serie, r.cupon, r.importe, c.tipo, c.nocliente as cliente');
        QL_Rcup.SQL.Add(' from dgasrcup r join dgascupo c on r.estacion=c.estacionrecup and r.serie=c.serie and r.cupon=c.folio');
        QL_Rcup.SQL.Add(' Where c.FechaRecup between :fechaIni and :fechaFin');
        QL_Rcup.SQL.Add('  and r.Estacion=:estacion');
        if not CheckBox2.Checked then
          QL_Rcup.SQL.Add('  and r.Turno=:turno');
        QL_Rcup.SQL.Add('Order by c.tipo, r.serie, r.cupon');
      end
      else begin
        QL_Rcup.SQL.Add('Select Estacion, Fechaventa as fecha, Turno, Serie, cast(Folio as double PRECISION) as cupon, Importe, tipo, nocliente as cliente');
        QL_Rcup.SQL.Add('from dgascupo');
        QL_Rcup.SQL.Add('Where Fechaventa between :fechaini and :fechafin and tipo=:tipo');
        QL_Rcup.SQL.Add('and Estacion=:estacion');
        if not CheckBox2.Checked then
          QL_Rcup.SQL.Add('  and Turno=:turno');
        QL_Rcup.SQL.Add('Order by tipo, serie, folio');
        QL_Rcup.ParamByName('tipo').AsString := 'F';
      end;

      QL_Rcup.ParamByName('fechaIni').AsDateTime := VgFechaIni;
      QL_Rcup.ParamByName('fechaFin').AsDateTime := VgFechaFin;
      QL_Rcup.ParamByName('estacion').AsInteger := DBLookUpComboBox2.KeyValue;
      if not CheckBox2.Checked then
        QL_Rcup.ParamByName('turno').AsInteger := StrToInt(Edit2.Text);

      QL_Rcup.Prepare;
      QL_Rcup.Open;
      TT_Auxi.Active:=true;
      try
        Favance.PreparaAvance('Preparando reporte...',true,QL_Rcup.RecordCount);
        while not QL_Rcup.Eof do begin
          TT_Auxi.Insert;
          TT_AuxiCliente.AsInteger:=QL_RcupCliente.AsInteger;
          if LocalizaTabla(TV_Clie,'NoClie',QL_RcupCliente.asinteger) then
            TT_AuxiNombre.AsString:=TV_ClieNombre.AsString;
          TT_AuxiSerie.AsInteger:=QL_RcupSerie.AsInteger;
          TT_AuxiCupon.AsInteger:=QL_RcupCupon.AsInteger;
          TT_AuxiImporte.AsFloat:=IfThen(i = 1, QL_RcupImporte.AsFloat, QL_RcupImporte.AsFloat * -1);
          //aqui preguntar si existe en DGASRCUP si no existe proceder
          TT_Auxi.Post;
          Favance.AvanzaPosicion;
          QL_Rcup.Next;
        end;
      finally
        FAvance.Close;
      end;
    end;
    TT_Auxi.SortOnFields('Cliente;Serie;Importe;Cupon',true,false);
    TT_Auxi.First;
    totg:=0;
    try
      FAvance.PreparaAvance('Clasificando Cupones...',true,TT_Auxi.RecordCount);
      while not TT_Auxi.Eof do begin
        totc:=0;
        xcliente:=TT_AuxiCliente.AsInteger;
        xlin:='E//'+IntToClaveCata(TT_AuxiCliente.AsInteger,idClie)+'// '+TT_AuxiNombre.AsString;
        BndDt.Items.Add(xlin);
        xnoserie:=0;
        while (xcliente=TT_AuxiCliente.AsInteger)and(not TT_Auxi.Eof) do begin
          ximporte:=TT_AuxiImporte.AsFloat;
          xlin:='D//'+IntToClaveNum(TT_AuxiSerie.AsInteger,4)+'//Cupón de '+FormatoMoneda(TT_AuxiImporte.AsFloat)+'//';
          xlin2:='';
          xlin3:='';
          xcont:=0;
          while (xcliente=TT_AuxiCliente.AsInteger)and(ximporte=TT_AuxiImporte.AsFloat)and(not TT_Auxi.Eof) do begin
            if xcont>116 then
              xlin3:=xlin3+IntToClaveNum(TT_AuxiCupon.AsInteger,dgCupo)+'  '
            else
              xlin2:=xlin2+IntToClaveNum(TT_AuxiCupon.AsInteger,dgCupo)+'  ';
            xcliente:=TT_AuxiCliente.AsInteger;
            ximporte:=TT_AuxiImporte.AsFloat;
            inc(xcont);
            TT_Auxi.Next;
          end;
          xlin:=xlin+FormatFloat('##0.00',IfThen(ximporte < 0, xcont * -1, xcont))+'//'+
                     FormatoMoneda(ximporte)+'//'+
                     FormatoMoneda(ximporte*xcont);
          BndDt.Items.Add(xlin);
          inc(xnoserie);
          totc:=totc+ximporte*xcont;    //creo que es por aqui.
          try
            ListaCupones:=TstringList.Create;
            long:=70;
            ss:=''; j:=1;
            repeat
              if j>13 then
                ss:=ExtraeLineaDeParrafo(xlin3,long,(j-13))
              else
                ss:=ExtraeLineaDeParrafo(xlin2,long,j);
              if limpiastr(ss)<>'' then
                ListaCupones.Add(ss);
              inc(j);
            until limpiastr(ss)='';
            for j:=0 to ListaCupones.Count-1 do begin
              xlin:='C// //';
              xlin:=xlin+ListaCupones[j];
              BndDt.Items.Add(xlin);
            end;
          finally
            ListaCupones.Free;
          end;
        end;
        if xnoserie>=1 then begin
          //al moneto de insertar es donde se va a validar que el feria que no exista se sume
          //sumarle los importes que no existan en DGASRCUP pero si DGASCUPO esto con la finalidad de no afectar el proceso actual
          //es decir si existe el dgascupo como recuperado, pero no en dgasrcup entonces proceder a sumarlo como positivo
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Add('SELECT COALESCE(SUM(IMPORTE), 0) AS Real1 FROM DGASCUPO');
          Q_Auxi.SQL.Add('WHERE TIPO =:Ptipo AND ESTATUS =:PEstatus AND NOCLIENTE =:PNoCliente AND FECHARECUP BETWEEN :PFechaini AND :PFechafin AND ESTACION =:PEstacion');
          Q_Auxi.SQL.Add('  AND NOT EXISTS ( SELECT 1 FROM DGASRCUP DRC WHERE DRC.CUPON = DGASCUPO.Folio AND DRC.Serie = DGASCUPO.Serie);');
          //asignacion de parametros
          Q_Auxi.ParamByName('Ptipo').AsString := 'F';
          Q_Auxi.ParamByName('PEstatus').AsString := 'R';
          Q_Auxi.ParamByName('PNoCliente').AsInteger := xcliente ;
          Q_Auxi.ParamByName('PFechaini').AsDateTime := VgFechaIni;
          Q_Auxi.ParamByName('PFechafin').AsDateTime := VgFechaFin;
          Q_Auxi.ParamByName('PEstacion').AsInteger := DBLookUpComboBox2.KeyValue;
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          totc:=totc+Q_AuxiReal1.AsFloat;    //creo que es por aqui.

          xlin:='T// //Total Cliente...';
          InsertaElemStr(FormatoMoneda(totc),6,xlin);
          BndDt.Items.Add(xlin);
        end
        else
          BndDt.Items.Add('B//');
        totg:=totg+totc;
      end;
      xlin:='T// //Total General...';
      InsertaElemStr(FormatoMoneda(totg),6,xlin);
      BndDt.Items.Add(xlin);

      BndDt.Items.Add('D//');
      BndDt.Items.Add('D//');
      BndDt.Items.Add('Z// Desglose por tipo de cupón.');
      BndDt.Items.Add('D//');
      BndDt.Items.Add('A//Tipo//Litros//Subtotal//Iva//IEPS//Total');
      for k:=1 to 4 do begin
        totl:=0;
        cIEPS:=0;
        IEPS:=0;
        tott:=0;
        xsubtotal:=0;
        xiva:=0;
        for l:=1 to DMGAS.CambiosdePrec(1,VgFechaIni,VgFechaFin,fechas) do begin
          if l>1 then
            fecha:=FechaToStrSQL(StrtoDate(FechaSQLToFecha(ExtraeElemStrSep(fechas,l,';')))+1)
          else
            fecha:=IfThen(StrToDate(FechaSQLToFecha(ExtraeElemStrSep(fechas,l,';')))<VgFechaIni,FechaToStrSQL(VgFechaIni),ExtraeElemStrSep(fechas,l,';'));
          sigFecha:=IfThen(ExtraeElemStrSep(fechas,l+1,';')<>'',ExtraeElemStrSep(fechas,l+1,';'),FechaToStrSQL(VgFechaFin));
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS Real1 FROM DGASCUPO R WHERE ');
          if (k <> 2) then
            Q_Auxi.SQL.Add('FECHARECUP BETWEEN '+QuotedStr(fecha)+' AND '+QuotedStr(sigFecha))
          else
            Q_Auxi.SQL.Add('FECHAVENTA BETWEEN '+QuotedStr(fecha)+' AND '+QuotedStr(sigFecha));
          Q_Auxi.SQL.Add('AND TIPO=:tipo');

          if (k <> 2) then begin
            Q_Auxi.SQL.Add('AND ESTACIONRECUP=:estacionrecup');
            Q_Auxi.SQL.Add('AND ESTATUS=:estatus');
            Q_Auxi.ParamByName('estatus').AsString := 'R';
            Q_Auxi.ParamByName('estacionrecup').AsInteger := DBLookUpComboBox2.KeyValue;
          end;

          Q_Auxi.ParamByName('tipo').AsString := IfThen(k=1,'N',IfThen(((k=2) or (k=3)),'F','E'));

          Q_Auxi.Prepare;
          Q_Auxi.Open;
          LocalizaTabla(DMGAS.T_Prec,'FECHA;COMBUSTIBLE',VarArrayOf([StrToDate(FechaSQLToFecha(ExtraeElemStrSep(fechas,l,';'))),1]));
          totl:=totl+IfThen(k <> 2, (Q_AuxiReal1.AsFloat/DMGAS.T_PrecPRECIO.AsFloat), (Q_AuxiReal1.AsFloat/DMGAS.T_PrecPRECIO.AsFloat) * -1);
          tott:=tott+IfThen(k <> 2, Q_AuxiReal1.AsFloat, Q_AuxiReal1.AsFloat * -1);

          //Nueva variable, ya que ocasionaba errores porque acumulaba todos los litros anteriores
          cIEPS:=Ifthen(k<>2, (Q_AuxiReal1.AsFloat/DMGAS.T_PrecPRECIO.AsFloat), (Q_AuxiReal1.AsFloat/DMGAS.T_PrecPRECIO.AsFloat) * -1);
          IEPS:=IEPS+IfThen(k <> 2, DMCUP.DameIEPS(1,StrToDate(FechaSQLToFecha(sigFecha)))*cIEPS, DMCUP.DameIEPS(1,StrToDate(FechaSQLToFecha(sigFecha)))*cIEPS);
        end;
        xsubtotal:=xsubtotal+IfThen(k <> 2, (tott-IEPS)/(1+((DMGAS.GetTasaIVAdeCombustible(DMGAS.T_EstsCLAVE.AsInteger,1,VgFechaFin))/100)), (tott-IEPS)/(1+((DMGAS.GetTasaIVAdeCombustible(DMGAS.T_EstsCLAVE.AsInteger,1,VgFechaFin))/100)));
        xiva:=(xsubtotal*((DMGAS.GetTasaIVAdeCombustible(DMGAS.T_EstsCLAVE.AsInteger,1,StrToDate(FechaSQLToFecha(sigFecha))))/100));

        if tott<>0 then begin
          BndDt.Items.Add('A//'+IfThen(k=1,'Normales',IfThen(k=2,'Feria Vend.',IfThen(k = 3, 'Feria Recu.', 'Especiales')))+'//'+FormatoMoneda(totl)+'//'+FormatoMoneda(xsubtotal)+'//'+FormatoMoneda(xiva)+
                          '//'+FormatoMoneda(IEPS)+'//'+FormatoMoneda(tott));
          BndDt.Items.Add('D//');
          BndDt.Items.Add('D//');
        end;
      end;
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP24.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP24P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=rangofecha(VgFechaini,VgFechafin);
    if not FLIQREP24P.CheckBox2.Checked then QRLEnca.Caption:=QRLEnca.Caption+'   Turno: '+FLIQREP24P.Edit2.Text;
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP24.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if k<=2 then
          Alignment:=taLeftJustify;
        if k=2 then begin
          Width:=390;
          Left:=54;
        end;
        if k=1 then begin
          Left:=5;
          Width:=45;
        end;
        if xtp='E' then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k=5 then Frame.DrawTop:=true;
        end;
        Transparent:=True;
        if xtp in ['A','Z'] then begin

          if k=2 then begin
            Alignment:=taRightJustify;
            Width:=60;
            Left:=380;
          end;
          if k=1 then begin
            Width:=60;
            Left:=315;
          end;
          if (xtp='Z') and (k=1) then begin
            Font.Style:=[fsBold];
            Width:=400;
          end;
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
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
  PrintBand:=xtp<>'B';
end;

procedure TFLIQREP24.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp in ['T','B'];
end;

procedure TFLIQREP24.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
