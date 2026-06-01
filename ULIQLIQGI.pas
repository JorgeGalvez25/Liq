unit ULIQLIQGI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport,Math;

type
  TFLIQLIQGI = class(TForm)
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
    QRLabelDeta:array [1..11] of TQRLabel;
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
  FLIQLIQGI: TFLIQLIQGI;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  swaceites:boolean;



implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQLIQG, ULIQLIQGR, StrUtils;

{$R *.DFM}

procedure TFLIQLIQGI.CreaEtiquetas;
var i:integer;
begin
  xw:=69;
  xl:=xLeft;
  for i:=1 to 11 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Isla/Bomba/Combustible';
        2:Caption:='';
        3:Caption:='Lect.Inicial';
        4:Caption:='Lect.Final';
        5:Caption:='Devolución';
        6:Caption:='Consignación';
        7:Caption:='Cantidad';
        8:Caption:='Prec.Unit';
        9:Caption:='Importe';
        10:Caption:='Importe S.P.';
        11:Caption:='Importe Final';
      end;
      if i=1 then xw:=115;
      if i in [3,4,8..11] then xw:=67;
      if i in [5..7] then xw:=61;
      if i=6 then xw:=71;
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
      if i in [1,11] then Frame.DrawRight:=false
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

procedure TFLIQLIQGI.IniciaEtiquetasCmb;
var i:word;
begin
  xl:=xLeft;
  for i:=1 to 11 do begin
    xw:=69;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Isla/Bomba/Combustible';
        2:Caption:='';
        3:Caption:='Lect.Inicial';
        4:Caption:='Lect.Final';
        5:Caption:='Devolución';
        6:Caption:='Consignación';
        7:Caption:='Cantidad';
        8:Caption:='Prec.Unit';
        9:Caption:='Importe';
        10:Caption:='Importe S.P.';
        11:Caption:='Importe Final';
      end;
      if i=1 then Frame.DrawRight:=false;
      if i=1 then xw:=115;
      if i=2 then xw:=0;
      if i in [3,4,8..11] then xw:=67;
      if i in [5..7] then xw:=61;
      if i=6 then xw:=71;
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

procedure TFLIQLIQGI.IniciaEtiquetasProd;
var i:word;
begin
  xl:=xleft;
  for i:=1 to 11 do begin
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
        10:Caption:='';
        11:Caption:='';
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

procedure TFLIQLIQGI.PreparaReporte;
var totc,tota,totdev,totcon,totsp,totf,
    totp,totcant,totfaltantes,totDesc:real;
    s,sAux:string;
    ADescripcion:TStringList;
    i:Integer;
    swTPagEfectivoConDescuento:Boolean;
begin
  with DMGEN,DMGAS,DMLIQ do begin
    CreaEtiquetas;
    T_Tpag.Active:=true;
    totc:=0; totcant:=0; totdev:=0; totcon:=0; totfaltantes:=0;
    swaceites:=false;
    BndDt.Items.Clear;
    T_Dliqc.First;
    while not T_Dliqc.Eof do begin
      xlin:='D//'+InttoClaveNum(T_DliqcISLA.AsInteger,2)+'-'+InttoClaveNum(T_DliqcBomba.AsInteger,2)+'-'+T_DliqcDescCombustible.AsString+'// //'+
                  FormatoLectura(T_DliqcLec_Ant.AsFloat)+'//'+
                  FormatoLectura(T_DliqcLec_Act.AsFloat)+'//'+
                  FormatoLectura(T_DliqcDevolucion.AsFloat)+'//'+
                  FormatoLectura(T_DliqcConsignacion.AsFloat)+'//'+
                  FormatoLectura(T_DliqcCantidad.AsFloat)+'//'+
                  FormatFloat('##,##0.0000',T_DliqcPrecio_Civa.AsFloat)+'//'+
                  FormatoMoneda(T_DliqcImporte.AsFloat)+'//'+
                  FormatoMoneda(T_DliqcIMPORTE_SP.AsFloat)+'//'+
                  FormatoMoneda(T_DliqcImporte_Final.AsFloat);
      BndDt.Items.Add(xlin);
      totc:=totc+T_DliqcImporte.AsFloat;
      totcant:=totcant+T_DliqcCantidad.AsFloat;
      totdev:=totdev+T_DliqcDevolucion.AsFloat;
      totcon:=totcon+T_DliqcConsignacion.AsFloat;
      totsp:=totsp+T_DliqcIMPORTE_SP.AsFloat;
      totf:=totf+T_DliqcImporte_Final.AsFloat;
      T_Dliqc.Next;
    end;
    xlin:='T// // // // //'+FormatoMoneda(totdev)+'//'+FormatoMoneda(totcon)+'//'+FormatoMoneda(totcant)+'// //'+FormatoMoneda(totc)+'//'+FormatoMoneda(totsp)+'//'+FormatoMoneda(totf);
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
      xlin:='D//'+T_DliqpDescripcionPago.AsString+' '+
            IfThen((totDesc>0)and(T_DliqpClasePago.AsString='Efectivo')and(not swTPagEfectivoConDescuento),
              '(con descuento)',
              '')
            +'// //'+
            IfThen((totDesc>0)and(T_DliqpClasePago.AsString='Efectivo')and(not swTPagEfectivoConDescuento),
              FormatoMoneda(T_DliqpImporte.AsFloat-totDesc),//Se le resta el descuento global (combustibles)
              FormatoMoneda(T_DliqpImporte.AsFloat));
      if (totDesc>0)and(T_DliqpClasePago.AsString='Efectivo')and(not swTPagEfectivoConDescuento) then
        swTPagEfectivoConDescuento := True; //Hay clientes que configuran el tipo de pago Cheques con ClasePago "Efectivo" y provocaba que aplicara doble descuento, en realidad sólo se debe aplicar en el tipo de pago Efectivo
      if abs(T_DliqpImporte.AsFloat)>0.001 then
        BndDt.Items.Add(xlin);
      totp:=totp+T_DliqpImporte.AsFloat;
      if T_DliqpClasePago.AsString='Faltantes' then
        totfaltantes:=totfaltantes+T_DliqpImporte.AsFloat;
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

procedure TFLIQLIQGI.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i,xl,xw:word;
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
    QRLFolio.Caption:='Isla: '+IntToClaveNum(DMLIQ.T_LiqgIsla.AsInteger,2)+'       Folio: '+IntToClaveNum(DMLIQ.T_LiqgFolio.AsInteger,6);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  SwAceites:=false;
  xtipo:=1;
  IniciaEtiquetasCmb;
end;

procedure TFLIQLIQGI.BndDtBeforePrint(Sender: TQRCustomBand;
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
            if k in [5..7,9..11] then Frame.DrawTop:=true
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
  InicializaEtiquetas(1,11);
  ExtraeEtiquetas(1,11);
end;

procedure TFLIQLIQGI.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQLIQGI.QRLabel1Print(sender: TObject; var Value: String);
begin
  Value:=DMLIQ.T_LiqgNombreDespachador.AsString;
end;

procedure TFLIQLIQGI.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='F';
end;

end.
