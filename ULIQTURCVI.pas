unit ULIQTURCVI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQTURCVI = class(TForm)
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
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape3: TQRShape;
    QL_Pval: TQuery;
    QL_Dval: TQuery;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalCANTIDAD: TIntegerField;
    QL_PvalNombreCliente: TStringField;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QL_PvalSubtotal: TFloatField;
    QL_PvalIva: TFloatField;
    QRLEstacion: TQRLabel;
    QL_PvalTOTAL: TFloatField;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_Pval2: TQuery;
    QL_Pval2ESTACION: TIntegerField;
    QL_Pval2CAJA: TIntegerField;
    QL_Pval2FECHA: TDateTimeField;
    QL_Pval2TURNO: TIntegerField;
    QL_Pval2INDICE: TIntegerField;
    QL_Pval2CLIENTE: TIntegerField;
    QL_Pval2CANTIDAD: TIntegerField;
    QL_Pval2TOTAL: TFloatField;
    QL_Pval2FACTURADO: TStringField;
    QL_Pval2ESTACIONFAC: TIntegerField;
    QL_Pval2SERIEFAC: TStringField;
    QL_Pval2FOLIOFAC: TIntegerField;
    QL_Pval2INDICEVALE: TIntegerField;
    DSQL_Pval: TDataSource;
    QL_Vale2: TQuery;
    QL_Vale2ESTACION: TIntegerField;
    QL_Vale2CAJA: TIntegerField;
    QL_Vale2FECHA: TDateTimeField;
    QL_Vale2TURNO: TIntegerField;
    QL_Vale2INDICE: TIntegerField;
    QL_Vale2INDICEVALE: TIntegerField;
    QL_Vale2IMPORTE: TFloatField;
    QL_Vale2FACTURADO: TStringField;
    QL_Vale2ESTACIONFAC: TIntegerField;
    QL_Vale2SERIEFAC: TStringField;
    QL_Vale2FOLIOFAC: TIntegerField;
    QL_Vale2CLIENTE: TIntegerField;
    DSQL_Vale: TDataSource;
    QL_Dval2: TQuery;
    QL_Dval2NombreProducto: TStringField;
    QL_Dval2ESTACION: TIntegerField;
    QL_Dval2CAJA: TIntegerField;
    QL_Dval2FECHA: TDateTimeField;
    QL_Dval2TURNO: TIntegerField;
    QL_Dval2INDICE: TIntegerField;
    QL_Dval2INDICEVALE: TIntegerField;
    QL_Dval2PRODUCTO: TIntegerField;
    QL_Dval2IMPORTE: TFloatField;
    QL_Dval2FACTURADO: TStringField;
    QL_Dval2ESTACIONFAC: TIntegerField;
    QL_Dval2SERIEFAC: TStringField;
    QL_Dval2FOLIOFAC: TIntegerField;
    QL_Dval2CLIENTE: TIntegerField;
    QL_DvalINDICEVALE: TIntegerField;
    QL_DvalPRODUCTO: TIntegerField;
    QL_DvalIMPORTE: TFloatField;
    QL_DvalCANTIDAD: TFloatField;
    QL_DvalNombreProducto: TStringField;
    QL_Dval3: TQuery;
    QL_Dval3PRODUCTO: TIntegerField;
    QL_Dval3TOTAL: TFloatField;
    QL_Dval3NombreProducto: TStringField;
    QL_DvalSUBCLAVE: TIntegerField;
    QL_DvalFECHA: TDateTimeField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QL_PvalCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure VerificarVales;
  public
    { Public declarations }
    pswresumido:Boolean;
    pestacion,
    pcaja,
    pturno:integer;
    pfechaini,
    pfechafin:tDateTime;
    procedure PreparaReporte;
  end;

var
  FLIQTURCVI: TFLIQTURCVI;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
  DDMLIQ, UAVANCE, DDMGEN_VTAS, ULIQTURCVP;

{$R *.DFM}

procedure TFLIQTURCVI.VerificarVales;
begin
  with DMGEN,DMGAS do begin
    try
      SwCalcFields:=false;
      QL_Pval2.Close;
      QL_Pval2.ParamByName('pestacion').AsInteger:=pestacion;
      QL_Pval2.ParamByName('pcaja').AsInteger:=pcaja;
      QL_Pval2.ParamByName('pfechaini').AsDateTime:=pfechaini;
      QL_Pval2.ParamByName('pfechafin').AsDateTime:=pfechafin;
      QL_Pval2.Prepare;
      QL_Pval2.Open;
      QL_Vale2.Open;
      QL_Dval2.Open;
      FAvance.PreparaAvance('Verificando Vales...',true,QL_Pval2.RecordCount);
      while not QL_Pval2.Eof do begin
        QL_Vale2.Close;
        QL_Vale2.Prepare;
        QL_Vale2.Open;
        while not QL_Vale2.Eof do begin
          if QL_Vale2Cliente.AsInteger<>QL_Pval2Cliente.AsInteger then begin
            MensajeInfo('Error en Cliente: '+IntToClaveCata(QL_Pval2Cliente.AsInteger,idClie));
            Q_Auxi.Close;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Update DGASVALE Set  Cliente='+IntToStr(QL_Pval2Cliente.Asinteger));
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_Pval2Estacion.asinteger));
            Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_Pval2Caja.asinteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_Pval2Fecha.AsDateTime)+'"');
            Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_Pval2Turno.AsInteger));
            Q_Auxi.SQL.Add('  and Indice='+IntToStr(QL_Pval2Indice.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.ExecSql;
            QL_Dval2.Close;
            QL_Dval2.Prepare;
            QL_Dval2.Open;
            while not QL_Dval2.Eof do begin
              if QL_Dval2Cliente.AsInteger<>QL_Pval2Cliente.AsInteger then begin
                Q_Auxi.Close;
                Q_Auxi.SQL.Clear;
                Q_Auxi.SQL.Add('Update DGASDVAL Set  Cliente='+IntToStr(QL_Pval2Cliente.Asinteger));
                Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_Vale2Estacion.asinteger));
                Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_Vale2Caja.asinteger));
                Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_Vale2Fecha.AsDateTime)+'"');
                Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_Vale2Turno.AsInteger));
                Q_Auxi.SQL.Add('  and Indice='+IntToStr(QL_Vale2Indice.AsInteger));
                Q_Auxi.SQL.Add('  and IndiceVale='+IntToStr(QL_Vale2IndiceVale.AsInteger));
                Q_Auxi.Prepare;
                Q_Auxi.ExecSql;
              end;
              QL_Dval2.Next;
            end;
          end;
          QL_Vale2.Next;
        end;
        FAvance.AvanzaPosicion;
        QL_Pval2.Next;
      end;
    finally
      FAvance.Close;
      QL_Pval2.Close;
      QL_Vale2.Close;
      QL_Dval2.Close;
    end;
  end;
end;

procedure TFLIQTURCVI.PreparaReporte;
var tcant,xreg:integer;
    tott,tots,toti,
    subtotal,iva,tasaiva:double;
begin
  with DMGEN,DMGAS do begin
    VerificarVales;
    QL_Pval.Close;
    QL_Pval.SQL.Clear;
    QL_Pval.SQL.Add('Select Cliente,Sum(Cantidad) as Cantidad,Sum(Total) as Total from DGASPVAL');
    QL_Pval.SQL.Add('Where Estacion='+IntToStr(pestacion));
    if pcaja>0 then
      QL_Pval.SQL.Add('  and Caja='+IntToStr(pcaja));
    QL_Pval.SQL.Add('  and Fecha>="'+FechaToStrSQL(pfechaini)+'"');
    QL_Pval.SQL.Add('  and Fecha<="'+FechaToStrSQL(pfechafin)+'"');
    if pturno>0 then
      QL_Pval.SQL.Add('  and Turno='+IntToStr(pturno));
    QL_Pval.SQL.Add('Group by Cliente');
    QL_Pval.SQL.Add('Order by Cliente');
    QL_Pval.Prepare;
    QL_Pval.Open;
    BndDt.Items.Clear;
    tcant:=0; tots:=0; toti:=0; tott:=0;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Pval.RecordCount);
      while not QL_Pval.Eof do begin
        xlin:='D//'+InttoClaveCata(QL_PvalCliente.AsInteger,idClie)+'//'+QL_PvalNombreCliente.AsString+'//'+
                    FormatoMoneda(QL_PvalCantidad.AsInteger)+'//'+
                    FormatoMoneda(QL_PvalSubTotal.AsFloat)+'//'+
                    FormatoMoneda(QL_PvalIva.AsFloat)+'//'+
                    FormatoMoneda(QL_PvalTotal.AsFloat);
        BndDt.Items.Add(xlin);
        if not pswresumido then begin
          xreg:=1;
          QL_Dval.Close;
          QL_Dval.SQL.Clear;
          QL_Dval.SQL.Add('Select IndiceVale,Producto,subclave,fecha,Importe,Cantidad from DGASDVAL');
          QL_Dval.SQL.Add('Where Estacion='+IntToStr(pestacion));
          if pcaja>0 then
            QL_Dval.SQL.Add('  and Caja='+IntToStr(pcaja));
          QL_Dval.SQL.Add('  and Fecha>="'+FechaToStrSQL(pfechaini)+'"');
          QL_Dval.SQL.Add('  and Fecha<="'+FechaToStrSQL(pfechafin)+'"');
          if pturno>0 then
            QL_Dval.SQL.Add('  and Turno='+IntToStr(pturno));
          QL_Dval.SQL.Add('  and Cliente='+InttoStr(QL_PvalCliente.AsInteger));
          QL_Dval.SQL.Add('Order by IndiceVale');
          QL_Dval.Prepare;
          QL_Dval.Open;
          while not QL_Dval.Eof do begin
            if GetTipoTCMB(QL_DvalPRODUCTO.AsInteger)=idTipoCMB then
              tasaiva := GetTasaIVAdeCombustible(pestacion,QL_DvalPRODUCTO.AsInteger,QL_DvalFECHA.AsDateTime)
            else
              tasaiva := GetTasaIVAdeProducto(pestacion,QL_DvalSUBCLAVE.AsInteger,QL_DvalFECHA.AsDateTime);
            subtotal:=AjustaFloat(QL_DvalImporte.AsFloat/(1+tasaiva/100),2);
            iva:=AjustaFloat(QL_DvalImporte.AsFloat-subtotal,2);
            xlin:='X// //'+QL_DvalNombreProducto.AsString+' ['+IntToClaveNum(xreg,2)+']// //'+
                           FormatoMoneda(subtotal)+'//'+
                           FormatoMoneda(iva)+'//'+
                           FormatoMoneda(QL_DvalImporte.AsFloat);
            BndDt.Items.Add(xlin);
            inc(xreg);
            QL_Dval.Next;
          end;
          BndDt.Items.Add('B//');
        end;
        tcant:=tcant+QL_PvalCantidad.AsInteger;
        tots:=tots+QL_PvalSubTotal.AsFloat;
        toti:=toti+QL_PvalIva.AsFloat;
        tott:=tott+QL_PvalTotal.AsFloat;
        FAvance.AvanzaPosicion;
        QL_Pval.Next;
      end;
    finally
      FAvance.Close;
    end;
    xlin:='T// // //'+FormatoMoneda(tcant)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+'//'+
                      FormatoMoneda(tott);
    BndDt.Items.Add(xlin);
//
    xlin:='E// //Resumen por Tipo de Combustible';
    BndDt.Items.Add(xlin);
    QL_Dval3.Close;
    QL_Dval3.SQL.Clear;
    QL_Dval3.SQL.Add('Select Producto, Sum(Importe) as Total from DGASDVAL');
    QL_Dval3.SQL.Add('Where Estacion='+IntToStr(pestacion));
    if pcaja>0 then
      QL_Dval3.SQL.Add('  and Caja='+IntToStr(pcaja));
    QL_Dval3.SQL.Add('  and Fecha>="'+FechaToStrSQL(pfechaini)+'"');
    QL_Dval3.SQL.Add('  and Fecha<="'+FechaToStrSQL(pfechafin)+'"');
    if pturno>0 then
      QL_Dval3.SQL.Add('  and Turno='+IntToStr(pturno));
    QL_Dval3.SQL.Add('Group by Producto');
    QL_Dval3.SQL.Add('Order by Producto');
    QL_Dval3.Prepare;
    QL_Dval3.Open;
    tots:=0; tott:=0; toti:=0;
    while not QL_Dval3.Eof do begin
      subtotal:=AjustaFloat(QL_Dval3Total.AsFloat/(1+GetTasaIVAdeCombustible(pestacion,1,pfechafin)/100),2);
      iva:=AjustaFloat(QL_Dval3Total.AsFloat-subtotal,2);
      xlin:='X// //'+QL_Dval3NombreProducto.AsString+'// //'+
                     FormatoMoneda(subtotal)+'//'+
                     FormatoMoneda(iva)+'//'+
                     FormatoMoneda(QL_Dval3Total.AsFloat);
      BndDt.Items.Add(xlin);
      tots:=tots+subtotal;
      toti:=toti+iva;
      tott:=tott+QL_Dval3Total.AsFloat;
      QL_Dval3.Next;
    end;
    xlin:='T// // //'+FormatoMoneda(tcant)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+'//'+
                      FormatoMoneda(tott);
    BndDt.Items.Add(xlin);
    BndDt.Items.Add('B//');
  end;
end;

procedure TFLIQTURCVI.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
    QRLEstacion.Caption:=DMGAS.T_EstsNombre.AsString;
    QRLEnca.Caption:=RangoFecha(pfechaini,pfechafin);
    if pturno>0 then QRLEnca.Caption:=QRLEnca.Caption+'  Turno: '+IntToClaveNum(pturno,2);
    if QT_EmprSERIEKEY.AsInteger=485 then
      QRLDir.Caption:=ObtenerDir(DMGAS.T_EstsSUCURSAL.AsInteger)+QT_EmprRFC.AsString;
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQTURCVI.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Font.Size:=8;
        Font.Color:=clWindowText;
        if xtp='X' then Font.Color:=clGrayText;
        if k=12 then Alignment:=taLeftJustify;
        if (xtp='T')or(xtp='M')or(xtp='E') then Font.Style:=[fsBold];
        if (xtp='X') and (k=12) then Alignment:=taRightJustify;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k-9);
    end;
  end;

  procedure HabilitaShapes(ri,rf:integer;swenabled:boolean);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Frame.DrawTop:=swenabled;
      end;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(11,16);
  HabilitaShapes(13,16,false);
  ExtraeEtiquetas(11,16);
  Case xtp of
    'T':HabilitaShapes(13,16,true);
  end;
end;

procedure TFLIQTURCVI.QL_PvalCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_PvalSubTotal.AsFloat:=AjustaFloat(QL_PvalTotal.AsFloat/(1+GetTasaIVAdeCombustible(EstacionActual,1,VgFechaFin)/100),2);
    QL_PvalIva.AsFloat:=AjustaFloat(QL_PvalTotal.AsFloat-QL_PvalSubtotal.AsFloat,2);
  end;
end;


end.
