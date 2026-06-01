unit ULIQREP33;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport;

type
  TFLIQREP33 = class(TForm)
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
    QL_Dliqa: TQuery;
    QRLEstacion: TQRLabel;
    ChBEnca: TQRChildBand;
    TT_Auxi: TTable;
    TT_AuxiDespachador: TIntegerField;
    TT_AuxiNombreDespachador: TStringField;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    TT_AuxiCantidad: TIntegerField;
    TT_AuxiImporte: TFloatField;
    TT_AuxiDescripcion: TStringField;
    TT_AuxiProducto: TIntegerField;
    QL_DliqaESTACION: TIntegerField;
    QL_DliqaFECHA: TDateTimeField;
    QL_DliqaFOLIO: TIntegerField;
    QL_DliqaPRODUCTO: TIntegerField;
    QL_DliqaVENTA: TFloatField;
    QL_DliqaPRECIO_CIVA: TFloatField;
    QL_DliqaIMPORTE: TFloatField;
    QL_DliqaDESP: TIntegerField;
    TT_AuxiPorcComision: TFloatField;
    TT_AuxiComision: TFloatField;
    QL_DliqaCOMISION: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..7] of TQRLabel;
    procedure CreaEtiquetas;
    procedure CreaTablaTemp;
  public
    { Public declarations }
    pIsla,
    pTurno:integer;
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=7;

var
  FLIQREP33: TFLIQREP33;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIQREP33P;

{$R *.DFM}

procedure TFLIQREP33.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Clave';
        2:Caption:='Descripción';
        3:Caption:='Precio Unit.';
        4:Caption:='Cantidad';
        5:Caption:='Importe';
        6:Caption:='% Comision';
        7:Caption:='Comision';
      end;
      Case i of
        1:xw:=60;
        2:xw:=250;
        3:xw:=70;
        4:xw:=70;
        5:xw:=70;
        6:xw:=60;
        7:xw:=70;
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
//      if i=5 then Frame.DrawRight:=false;
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
      if i<3 then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP33.PreparaReporte;
var totd,totg:Array[1..3] of real;
    i,xdesp:word;
    xprecio:double;
begin
  with DMGEN,DMLIQ,DMGAS do begin
    CreaEtiquetas;
    InicializaTemp(TT_Auxi);
    CreaTablaTemp;
    BndDt.Items.Clear;
    QL_Dliqa.Close;
    {QL_Dliqa.ParamByName('pestacion').AsInteger:=T_EstsClave.AsInteger;
    QL_Dliqa.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqa.ParamByName('pfechafin').AsDateTime:=VgFechaFin; }
    QL_Dliqa.SQL.Clear;
    QL_Dliqa.SQL.Add('Select a.Estacion,a.Fecha,a.Folio,a.Producto,a.Venta,a.Precio_Civa,a.Importe,');
    QL_Dliqa.SQL.Add('      (Select d.Despachador from DGASLIQG d where d.Estacion=a.Estacion and d.Folio=a.folio) as Desp,');
    QL_Dliqa.SQL.Add('      (select p.Comision from DGASPROD p where p.clave=a.producto) as Comision,');
    QL_Dliqa.SQL.Add('      a.isla,a.turno');
    QL_Dliqa.SQL.Add('from DGASDLIQA a');
    QL_Dliqa.SQL.Add('Where a.Estacion='+IntToStr(T_EstsClave.AsInteger));
    QL_Dliqa.SQL.Add('  and a.Fecha>="'+FechaToStrSql(VgFechaIni)+'" and a.Fecha<="'+FechaToStrSql(VgFechaFin)+'"');
    QL_Dliqa.SQL.Add('  and a.Venta>0.001');
    if pIsla>0  then
      QL_Dliqa.SQL.Add(' and a.Isla='+InttoStr(pIsla));
    if pTurno>0 then
      QL_Dliqa.SQL.Add(' and a.Turno='+InttoStr(pTurno));
    QL_Dliqa.SQL.Add('Order by a.Estacion,a.Folio,a.Fecha');
    QL_Dliqa.Prepare;
    QL_Dliqa.Open;
    try
      FAvance.PreparaAvance('Clasificando movimientos...',true,QL_Dliqa.RecordCount);
      while not QL_Dliqa.Eof do begin
        if not TT_Auxi.Locate('Despachador;Producto',VarArrayOf([QL_DliqaDesp.AsInteger,QL_DliqaProducto.AsInteger]),[]) then begin
          TT_Auxi.Insert;
          TT_AuxiDespachador.AsInteger:=QL_DliqaDesp.AsInteger;
          TT_AuxiProducto.AsInteger:=QL_DliqaProducto.AsInteger;
          TT_AuxiCantidad.AsInteger:=QL_DliqaVenta.AsInteger;
          TT_AuxiImporte.AsFloat:=QL_DliqaImporte.AsFloat;
          TT_AuxiPorcComision.AsFloat:=QL_DliqaCOMISION.AsFloat;
          TT_AuxiComision.AsFloat:=AjustaFloat(TT_AuxiImporte.AsFloat*DivideFloat(TT_AuxiPorcComision.AsFloat,100),2);
        end
        else begin
          TT_Auxi.Edit;
          TT_AuxiCantidad.AsInteger:=TT_AuxiCantidad.AsInteger+QL_DliqaVenta.AsInteger;
          TT_AuxiImporte.AsFloat:=TT_AuxiImporte.AsFloat+QL_DliqaImporte.AsFloat;
          TT_AuxiComision.AsFloat:=AjustaFloat(TT_AuxiImporte.AsFloat*DivideFloat(TT_AuxiPorcComision.AsFloat,100),2);
        end;
        FAvance.AvanzaPosicion;
        QL_Dliqa.Next;
      end;
    finally
      FAvance.Close;
    end;
//Cargando banda detalle
    try
      for i:=1 to 3 do begin
        totd[i]:=0;
        totg[i]:=0;
      end;
      TT_Auxi.First;
      FAvance.PreparaAvance('Preparando reporte...',true,TT_Auxi.RecordCount);
      while not TT_Auxi.Eof do begin
        xlin:='E//'+IntToClaveNum(TT_AuxiDespachador.AsInteger,3)+'//'+TT_AuxiNombreDespachador.AsString;
        BndDt.Items.Add(xlin);
        xdesp:=TT_AuxiDespachador.AsInteger;
        for i:=1 to 3 do
          totd[i]:=0;
        while (xdesp=TT_AuxiDespachador.AsInteger)and(not TT_Auxi.Eof) do begin
          xprecio:=AjustaFloat(DivideFloat(TT_AuxiImporte.AsFloat,TT_AuxiCantidad.AsInteger),2);
          xlin:='D//'+IntToClaveNum(TT_AuxiProducto.AsInteger,3)+'//'+
                      TT_AuxiDescripcion.AsString+'//'+
                      FormatFloat('###,##0.00',xprecio)+'//'+
                      FormatFloat('###,##0',TT_AuxiCantidad.AsFloat)+'//'+
                      FormatoMoneda(TT_AuxiImporte.AsFloat)+'//'+FormatoMoneda(TT_AuxiPorcComision.AsFloat)+'//'+
                      FormatoMoneda(TT_AuxiComision.AsFloat);
          totd[1]:=totd[1]+TT_AuxiCantidad.AsInteger;
          totd[2]:=totd[2]+TT_AuxiImporte.AsFloat;
          totd[3]:=totd[3]+TT_AuxiComision.AsFloat;
          BndDt.Items.Add(xlin);
          FAvance.AvanzaPosicion;
          xdesp:=TT_AuxiDespachador.AsInteger;
          TT_Auxi.Next;
        end;
        xlin:='T// // // //'+FormatoMoneda(totd[1])+'//'+FormatoMoneda(totd[2])+'// //'+FormatoMoneda(totd[3]);
        for i:=1 to 3 do begin
//          Case i of
//            1:InsertaElemStr(FormatFloat('###,##0',totd[i]),4+i,xlin);
//            2:InsertaElemStr(FormatoMoneda(totd[i]),4+i,xlin);
//          end;
          totg[i]:=totg[i]+totd[i];
        end;
        BndDt.Items.Add(xlin);
      end;
      xlin:='T// //Total General// //'+FormatoMoneda(totg[1])+'//'+FormatoMoneda(totg[2])+'// //'+FormatoMoneda(totg[3]);
//      for i:=1 to 3 do begin
//        InsertaElemStr(FormatoMoneda(totg[i]),4+i,xlin);
//      end;
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP33.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP33P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
    if pIsla>0  then QRLEnca.Caption:=QRLEnca.Caption+'     Isla '+IntToClaveNum(pIsla,2);
    if pTurno>0 then QRLEnca.Caption:=QRLEnca.Caption+'     Turno '+IntToClaveNum(pTurno,2);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP33.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if (xtp='E')and(k<3) then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if (k>3) and (k<>6) then
            Frame.DrawTop:=true;
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
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
end;

procedure TFLIQREP33.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP33.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Despachador', ftInteger, 0, True);
      Add('Producto', ftInteger,0,True);
      Add('Cantidad', ftInteger,0,false);
      Add('Importe', ftFloat,0,false);
      Add('PorcComision',ftFloat,0,False);
      Add('Comision',ftFloat,0,False);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'Despachador;Producto', [ixPrimary, ixUnique]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.IndexFieldNames:='';
    TT_Auxi.Active:=true;
  end;
end;


procedure TFLIQREP33.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Dliqa.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
  end;
end;

end.
