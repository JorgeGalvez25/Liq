unit ULIQREP32;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport,
  RxMemDS;

type
  TFLIQREP32 = class(TForm)
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
    QL_DliqaISLA: TIntegerField;
    QL_DliqaTURNO: TIntegerField;
    QL_DliqaJEFE_TURNO: TIntegerField;
    QL_DliqaNOMBRE_JEFE_TURNO: TStringField;
    TT_AuxiJefeTurno: TIntegerField;
    TT_AuxiNombreJefeTurno: TStringField;
    TM_Auxi: TRxMemoryData;
    TM_AuxiDespachador: TIntegerField;
    TM_AuxiProducto: TIntegerField;
    TM_AuxiCantidad: TIntegerField;
    TM_AuxiImporte: TFloatField;
    TM_AuxiJefeTurno: TIntegerField;
    TM_AuxiNombreJefeTurno: TStringField;
    TM_AuxiNombreDespachador: TStringField;
    TM_AuxiDescripcion: TStringField;
    QL_DliqaNOMBREDESPACHADOR: TStringField;
    QL_DliqaDESCRIPCION: TStringField;
    TM_Auxi2: TRxMemoryData;
    TM_Auxi2Despachador: TIntegerField;
    TM_Auxi2Producto: TIntegerField;
    TM_Auxi2Cantidad: TIntegerField;
    TM_Auxi2NombreDespachador: TStringField;
    TM_Auxi2Importe: TFloatField;
    TM_Auxi2JefeTurno: TIntegerField;
    TM_Auxi2Descripcion: TStringField;
    TM_Auxi2NombreJefeTurno: TStringField;
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
    QRLabelDeta:array [1..5] of TQRLabel;
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
  NoEti=5;

var
  FLIQREP32: TFLIQREP32;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIQREP31P;

{$R *.DFM}

procedure TFLIQREP32.CreaEtiquetas;
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
      end;
      Case i of
        1:xw:=60;
        2:xw:=250;
        3:xw:=70;
        4:xw:=70;
        5:xw:=70;
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

procedure TFLIQREP32.PreparaReporte;
var totd,totg:Array[1..2] of real;
    i,xdesp:word;
    xprecio:double;
begin
  with DMGEN,DMLIQ,DMGAS do begin
    CreaEtiquetas;
//    InicializaTemp(TM_Auxi);
//    CreaTablaTemp;
    TM_Auxi.Active:=True;
    TM_Auxi2.Active:=True;
    BndDt.Items.Clear;
    QL_Dliqa.Close;
    {QL_Dliqa.ParamByName('pestacion').AsInteger:=T_EstsClave.AsInteger;
    QL_Dliqa.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqa.ParamByName('pfechafin').AsDateTime:=VgFechaFin; }
    QL_Dliqa.SQL.Clear;
    QL_Dliqa.SQL.Add('Select Estacion,Fecha,Folio,Producto,Venta,Precio_Civa,Importe,');
    QL_Dliqa.SQL.Add('(select descripcion from DGASPROD where clave=d.producto) as Descripcion,');
    QL_Dliqa.SQL.Add('  (Select Despachador from DGASLIQG where Estacion=d.Estacion and Folio=d.folio) as Desp,');
    QL_Dliqa.SQL.Add('(select nombre from DGASDESP where clave=(select Despachador from DGASLIQG where estacion=d.estacion and folio=d.folio)) as NombreDespachador,');
    QL_Dliqa.SQL.Add('  d.isla, d.turno,(select jefe_turno from DGASTURC ');
    QL_Dliqa.SQL.Add('  where estacion=m.estacion and caja=m.caja and fecha=m.fecha and turno=m.turno)as jefe_turno');
    QL_Dliqa.SQL.Add(' ,(select NOMBRE FROM DGASDESP where clave=(select jefe_turno from DGASTURC');
    QL_Dliqa.SQL.Add(' where estacion=m.estacion and caja=m.caja and fecha=m.fecha and turno=m.turno))as Nombre_jefe_turno');
    QL_Dliqa.SQL.Add('from DGASDLIQA d, DGASLIQG m');
    QL_Dliqa.SQL.Add('where d.estacion=m.estacion');
    QL_Dliqa.SQL.Add('  and d.folio=m.folio');
    QL_Dliqa.SQL.Add(' and d.Fecha>="'+FechaToStrSql(VgFechaIni)+'" and d.Fecha<="'+FechaToStrSql(VgFechaFin)+'"');
    //QL_Dliqa.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
    if (FLIQREP31P.ListadoEstaciones<>'*')and(LimpiaStr(FLIQREP31P.ListadoEstaciones)<>'') then
      QL_Dliqa.SQL.Add('and d.Estacion in('+FLIQREP31P.ListadoEstaciones+')');
    QL_Dliqa.SQL.Add('      and d.Venta>0.001');
    if pIsla>0  then QL_Dliqa.SQL.Add(' and d.Isla='+InttoStr(pIsla));
    if pTurno>0 then QL_Dliqa.SQL.Add(' and d.Turno='+InttoStr(pTurno));
    QL_Dliqa.SQL.Add('Order by d.Estacion,d.Folio,d.Fecha');
    QL_Dliqa.Prepare;
    QL_Dliqa.Open;
    try
      FAvance.PreparaAvance('Clasificando movimientos...',true,QL_Dliqa.RecordCount);
      while not QL_Dliqa.Eof do begin
        if not TM_Auxi.Locate('Despachador;Producto',VarArrayOf([QL_DliqaDesp.AsInteger,QL_DliqaProducto.AsInteger]),[]) then begin
          TM_Auxi.Insert;
          TM_AuxiDespachador.AsInteger:=QL_DliqaDesp.AsInteger;
          TM_AuxiProducto.AsInteger:=QL_DliqaProducto.AsInteger;
          TM_AuxiCantidad.AsInteger:=QL_DliqaVenta.AsInteger;
          TM_AuxiImporte.AsFloat:=QL_DliqaImporte.AsFloat;
          TM_AuxiNombreDespachador.AsString:=QL_DliqaNOMBREDESPACHADOR.AsString;
          TM_AuxiDescripcion.AsString:=QL_DliqaDESCRIPCION.AsString;
          if QL_DliqaJEFE_TURNO.AsInteger>0 then begin
            TM_AuxiJefeTurno.AsInteger:=QL_DliqaJEFE_TURNO.AsInteger;
            TM_AuxiNombreJefeTurno.AsString:=QL_DliqaNOMBRE_JEFE_TURNO.AsString;
          end
          else begin
            TM_AuxiJefeTurno.AsInteger:=0;
            TM_AuxiNombreJefeTurno.AsString:='Jefe de Turno no Asignado';
          end;
        end
        else begin
          TM_Auxi.Edit;
          TM_AuxiCantidad.AsInteger:=TM_AuxiCantidad.AsInteger+QL_DliqaVenta.AsInteger;
          TM_AuxiImporte.AsFloat:=TM_AuxiImporte.AsFloat+QL_DliqaImporte.AsFloat;
        end;
        TM_Auxi.Post;

        //Jefes de Turno

         if not TM_Auxi2.Locate('JefeTurno;Producto',VarArrayOf([QL_DliqaJEFE_TURNO.AsInteger,QL_DliqaProducto.AsInteger]),[]) then begin
          TM_Auxi2.Insert;
          TM_Auxi2Despachador.AsInteger:=QL_DliqaDesp.AsInteger;
          TM_Auxi2Producto.AsInteger:=QL_DliqaProducto.AsInteger;
          TM_Auxi2Cantidad.AsInteger:=QL_DliqaVenta.AsInteger;
          TM_Auxi2Importe.AsFloat:=QL_DliqaImporte.AsFloat;
          TM_Auxi2NombreDespachador.AsString:=QL_DliqaNOMBREDESPACHADOR.AsString;
          TM_Auxi2Descripcion.AsString:=QL_DliqaDESCRIPCION.AsString;
          if QL_DliqaJEFE_TURNO.AsInteger>0 then begin
            TM_Auxi2JefeTurno.AsInteger:=QL_DliqaJEFE_TURNO.AsInteger;
            TM_Auxi2NombreJefeTurno.AsString:=QL_DliqaNOMBRE_JEFE_TURNO.AsString;
          end
          else begin
            TM_Auxi2JefeTurno.AsInteger:=0;
            TM_Auxi2NombreJefeTurno.AsString:='Jefe de Turno no Asignado';
          end;
        end
        else begin
          TM_Auxi2.Edit;
          TM_Auxi2Cantidad.AsInteger:=TM_Auxi2Cantidad.AsInteger+QL_DliqaVenta.AsInteger;
          TM_Auxi2Importe.AsFloat:=TM_Auxi2Importe.AsFloat+QL_DliqaImporte.AsFloat;
        end;
        TM_Auxi2.Post;

        FAvance.AvanzaPosicion;
        QL_Dliqa.Next;
      end;
    finally
      FAvance.Close;
    end;
//Cargando banda detalle
    try
      for i:=1 to 2 do begin
        totd[i]:=0;
        totg[i]:=0;
      end;
      TM_Auxi.SortOnFields('Despachador;Producto',True,True);
      TM_Auxi.First;
      FAvance.PreparaAvance('Preparando reporte...',true,TM_Auxi.RecordCount);
      while not TM_Auxi.Eof do begin
        xlin:='E//'+IntToClaveNum(TM_AuxiDespachador.AsInteger,3)+'//'+TM_AuxiNombreDespachador.AsString;
        BndDt.Items.Add(xlin);
        xdesp:=TM_AuxiDespachador.AsInteger;
        for i:=1 to 2 do
          totd[i]:=0;
        while (xdesp=TM_AuxiDespachador.AsInteger)and(not TM_Auxi.Eof) do begin
          xprecio:=AjustaFloat(DivideFloat(TM_AuxiImporte.AsFloat,TM_AuxiCantidad.AsInteger),2);
          xlin:='D//'+IntToClaveNum(TM_AuxiProducto.AsInteger,3)+'//'+
                      TM_AuxiDescripcion.AsString+'//'+
                      FormatFloat('###,##0.00',xprecio)+'//'+
                      FormatFloat('###,##0',TM_AuxiCantidad.AsFloat)+'//'+
                      FormatoMoneda(TM_AuxiImporte.AsFloat)+'//';
          totd[1]:=totd[1]+TM_AuxiCantidad.AsInteger;
          totd[2]:=totd[2]+TM_AuxiImporte.AsFloat;
          BndDt.Items.Add(xlin);
          FAvance.AvanzaPosicion;
          xdesp:=TM_AuxiDespachador.AsInteger;
          TM_Auxi.Next;
        end;
        xlin:='T//';
        for i:=1 to 2 do begin
          Case i of
            1:InsertaElemStr(FormatFloat('###,##0',totd[i]),4+i,xlin);
            2:InsertaElemStr(FormatoMoneda(totd[i]),4+i,xlin);
          end;
          totg[i]:=totg[i]+totd[i];
        end;
        BndDt.Items.Add(xlin);
      end;
      xlin:='T// //Total Despachadores//';
      for i:=1 to 2 do begin
        InsertaElemStr(FormatoMoneda(totg[i]),4+i,xlin);
      end;
      BndDt.Items.Add(xlin);

      //jefes de turno
      for i:=1 to 2 do begin
        totd[i]:=0;
        totg[i]:=0;
      end;
      TM_Auxi2.SortOnFields('JefeTurno;Producto',True,True);
      TM_Auxi2.First;
      FAvance.PreparaAvance('Preparando reporte...',true,TM_Auxi2.RecordCount);
      xlin:='E// // Jefes de Turno.';
      BndDt.Items.Add(xlin);
      while not TM_Auxi2.Eof do begin
        xlin:='E//'+IntToClaveNum(TM_Auxi2JefeTurno.AsInteger,3)+'//'+TM_Auxi2NombreJefeTurno.AsString;
        BndDt.Items.Add(xlin);
        xdesp:=TM_Auxi2JefeTurno.AsInteger;
        for i:=1 to 2 do
          totd[i]:=0;
        while (xdesp=TM_Auxi2JefeTurno.AsInteger)and(not TM_Auxi2.Eof) do begin
          xprecio:=AjustaFloat(DivideFloat(TM_Auxi2Importe.AsFloat,TM_Auxi2Cantidad.AsInteger),2);
          xlin:='D//'+IntToClaveNum(TM_Auxi2Producto.AsInteger,3)+'//'+
                      TM_Auxi2Descripcion.AsString+'//'+
                      FormatFloat('###,##0.00',xprecio)+'//'+
                      FormatFloat('###,##0',TM_Auxi2Cantidad.AsFloat)+'//'+
                      FormatoMoneda(TM_Auxi2Importe.AsFloat)+'//';
          totd[1]:=totd[1]+TM_Auxi2Cantidad.AsInteger;
          totd[2]:=totd[2]+TM_Auxi2Importe.AsFloat;
          BndDt.Items.Add(xlin);
          FAvance.AvanzaPosicion;
          xdesp:=TM_Auxi2JefeTurno.AsInteger;
          TM_Auxi2.Next;
        end;
        xlin:='T//';
        for i:=1 to 2 do begin
          Case i of
            1:InsertaElemStr(FormatFloat('###,##0',totd[i]),4+i,xlin);
            2:InsertaElemStr(FormatoMoneda(totd[i]),4+i,xlin);
          end;
          totg[i]:=totg[i]+totd[i];
        end;
        BndDt.Items.Add(xlin);
      end;
      xlin:='T// //Total Jefes de Turno//';
      for i:=1 to 2 do begin
        InsertaElemStr(FormatoMoneda(totg[i]),4+i,xlin);
      end;
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP32.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:='Estaciones: '+FLIQREP31P.ListadoEstaciones;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
    if pIsla>0  then QRLEnca.Caption:=QRLEnca.Caption+'     Isla '+IntToClaveNum(pIsla,2);
    if pTurno>0 then QRLEnca.Caption:=QRLEnca.Caption+'     Turno '+IntToClaveNum(pTurno,2);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP32.BndDtBeforePrint(Sender: TQRCustomBand;
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
          if k>3 then Frame.DrawTop:=true;
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

procedure TFLIQREP32.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP32.CreaTablaTemp;
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
      Add('JefeTurno', ftInteger,0,false);
      Add('NombreJefeTurno', ftString,50,false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('Despachador', 'Despachador;Producto', [ixPrimary, ixUnique]);
      Add('JefeTurno', 'JefeTurno;Producto', [ixPrimary, ixUnique]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.IndexFieldNames:='Despachador';
    TT_Auxi.Active:=true;
  end;
end;


procedure TFLIQREP32.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Dliqa.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
  end;
end;

end.
