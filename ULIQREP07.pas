unit ULIQREP07;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS;

type
  TFLIQREP07 = class(TForm)
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
    QL_DvalPRODUCTO: TIntegerField;
    QL_DvalTOTAL: TFloatField;
    QL_DvalNombreProducto: TStringField;
    QL_PvalNombreCliente: TStringField;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QL_PvalSubtotal: TFloatField;
    QL_PvalIva: TFloatField;
    QRLEstacion: TQRLabel;
    QRLGrupo: TQRLabel;
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
    QL_PvalGrupo: TIntegerField;
    TT_Auxi: TRxMemoryData;
    TT_AuxiCombustible: TIntegerField;
    TT_AuxiNombre: TStringField;
    TT_AuxiSubtotal: TFloatField;
    TT_AuxiIva: TFloatField;
    TT_AuxiTotal: TFloatField;
    TT_AuxiCantidad: TIntegerField;
    QL_DvalCANTIDAD: TIntegerField;
    TM_Pval: TRxMemoryData;
    TM_PvalCliente: TIntegerField;
    TM_PvalCantidad: TFloatField;
    TM_PvalSubtotal: TFloatField;
    TM_PvalIva: TFloatField;
    TM_PvalNombreCliente: TStringField;
    TM_PvalTotal: TFloatField;
    TM_PvalGrupo: TIntegerField;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    QL_DvalLITROS: TFloatField;
    QRLabel16: TQRLabel;
    TM_PvalIeps: TFloatField;
    TT_AuxiIeps: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QL_PvalCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure VerificarVales;
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

var
  FLIQREP07: TFLIQREP07;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
  DDMLIQ, ULIQREP07P, UAVANCE, DDMGEN_VTAS;

{$R *.DFM}

procedure TFLIQREP07.VerificarVales;
begin
  with DMGEN,DMGAS do begin
    try
      SwCalcFields:=false;
      QL_Pval2.Close;
      QL_Pval2.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
      QL_Pval2.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
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

procedure TFLIQREP07.PreparaReporte;
var tcant, i :integer;
    tott, tots, toti, totc, totieps,
    total, subtotal, iva, ieps, subtotalVale, ivaVale, iepsVale :double;
begin
  with DMGEN,DMGAS,FLIQREP07P do begin
    VerificarVales;
    TT_Auxi.Active:=true;
    TM_Pval.Active:=true;
    
    QL_Pval.Close;
    QL_Pval.SQL.Clear;
    QL_Pval.SQL.Add('Select Cliente,Sum(Cantidad) as Cantidad from DGASPVAL');
    QL_Pval.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
    QL_Pval.SQL.Add('  and Caja='+IntToStr(QL_CajaCaja.AsInteger));
    QL_Pval.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Pval.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    Case ComboBox2.ItemIndex of
      0:QL_Pval.SQL.Add(' and Facturado="No" ');
      1:QL_Pval.SQL.Add(' and Facturado="Si" ');
      2:QL_Pval.SQL.Add(' and Facturado<>" " ');
    end;
    QL_Pval.SQL.Add('Group by Cliente');
    QL_Pval.SQL.Add('Order by Cliente');
    QL_Pval.Prepare;
    QL_Pval.Open;
    FAvance.PreparaAvance('Preparando reporte...',true,TM_Pval.RecordCount);
    while not QL_Pval.Eof do begin
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind := fkInternalCalc;
      Q_AuxiEntero2.FieldKind := fkInternalCalc;
      Q_AuxiDate1.FieldKind := fkInternalCalc;
      Q_AuxiReal1.FieldKind := fkInternalCalc;
      Q_AuxiReal2.FieldKind := fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('select cliente as Entero1, producto as Entero2, fecha as Date1, sum(importe) as Real1, sum(cantidad) as Real2');
      Q_Auxi.SQL.Add('From DGASDVAL');
      Q_Auxi.SQL.Add('Where');
      Q_Auxi.SQL.Add('  Estacion = '+IntToStr(T_EstsClave.AsInteger));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_CajaCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi.SQL.Add('  and Cliente = '+IntToStr(QL_PvalCLIENTE.AsInteger));
      Case ComboBox2.ItemIndex of
        0:Q_Auxi.SQL.Add(' and Facturado="No" ');
        1:Q_Auxi.SQL.Add(' and Facturado="Si" ');
        2:Q_Auxi.SQL.Add(' and Facturado<>" " ');
      end;
      Q_Auxi.SQL.Add('Group by cliente, producto, fecha');
      Q_Auxi.SQL.Add('Order by Cliente');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      total := 0; ieps := 0; subtotal := 0; iva := 0;
      while not Q_Auxi.Eof do begin
        iepsVale := 0; subtotalVale := 0; ivaVale := 0;
        total := total + Q_AuxiReal1.AsFloat;
        iepsVale := (Q_AuxiReal2.AsFloat * DMCUP.DameIEPS(Q_AuxiEntero2.AsInteger,Q_AuxiDate1.AsDateTime));
        ieps := ieps + iepsVale;
        subtotalVale := AjustaFloat((Q_AuxiReal1.AsFloat-iepsVale)/(1+GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,Q_AuxiEntero2.AsInteger,VgFechaFin)/100),2);
        subtotal := subtotal + subtotalVale;
        ivaVale := AjustaFloat((Q_AuxiReal1.AsFloat-iepsVale)-subtotalVale,2);
        iva:= iva + ivaVale;
        Q_Auxi.Next;
      end;
      TM_Pval.Insert;
      TM_PvalCliente.AsInteger := QL_PvalCLIENTE.AsInteger;
      TM_PvalCantidad.AsFloat := QL_PvalCANTIDAD.AsInteger;
      TM_PvalSubtotal.AsFloat := subtotal;
      TM_PvalIva.AsFloat := iva;
      TM_PvalNombreCliente.AsString := QL_PvalNombreCliente.AsString;
      TM_PvalIeps.AsFloat := ieps;
      TM_PvalTotal.AsFloat := total;
      TM_PvalGrupo.AsInteger := QL_PvalGrupo.AsInteger;
      TM_Pval.Post;
      QL_Pval.Next;
      FAvance.AvanzaPosicion;
    end;
    FAVANCE.Close;
    if TM_Pval.RecordCount>0 then begin
      case ComboBox3.ItemIndex of
        0:TM_Pval.SortOnFields('Cliente;NombreCliente',False,False);
        1:TM_Pval.SortOnFields('NombreCliente',False,False);
      end;
    end;
    TM_Pval.First;
    BndDt.Items.Clear;
    tcant:=0; tots:=0; toti:=0; totieps := 0; tott:=0;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,TM_Pval.RecordCount);
      while not TM_Pval.Eof do begin
        if not CheckBox3.Checked then begin
          if TM_PvalGrupo.AsInteger<>DBLookUpComboBox3.KeyValue then begin
            FAvance.AvanzaPosicion;
            TM_Pval.Next;
            Continue;
          end;
        end;
        xlin:='D//'+InttoClaveCata(TM_PvalCliente.AsInteger,idClie)+'//'+TM_PvalNombreCliente.AsString+'//'+
                    FormatoMoneda(TM_PvalCantidad.AsInteger)+'//'+
                    FormatoMoneda(TM_PvalSubTotal.AsFloat)+'//'+
                    FormatoMoneda(TM_PvalIva.AsFloat)+'//'+
                    FormatoMoneda(TM_PvalIeps.AsFloat)+'//'+
                    FormatoMoneda(TM_PvalTotal.AsFloat);
        BndDt.Items.Add(xlin);
        QL_Dval.Close;
        QL_Dval.SQL.Clear;
        QL_Dval.SQL.Add('Select Producto, Sum(Importe) as Total, Count(*) as Cantidad, Sum(cantidad) as litros from DGASDVAL');
        QL_Dval.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
        QL_Dval.SQL.Add('  and Caja='+IntToStr(QL_CajaCaja.AsInteger));
        QL_Dval.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
        QL_Dval.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
        QL_Dval.SQL.Add('  and Cliente='+InttoStr(TM_PvalCliente.AsInteger));
        Case ComboBox2.ItemIndex of
          0:QL_Dval.SQL.Add(' and Facturado="No" ');
          1:QL_Dval.SQL.Add(' and Facturado="Si" ');
          2:QL_Dval.SQL.Add(' and Facturado<>" " ');
        end;
        QL_Dval.SQL.Add('Group by Producto');
        QL_Dval.SQL.Add('Order by Producto');
        QL_Dval.Prepare;
        QL_Dval.Open;
        while not QL_Dval.Eof do begin
          ieps := (QL_DvalLITROS.AsFloat * DMCUP.DameIEPS(QL_DvalPRODUCTO.AsInteger,VgFechaFin));
          subtotal:=AjustaFloat((QL_DvalTotal.AsFloat-ieps)/(1+GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,1,VgFechaFin) /100),2);
          iva:=AjustaFloat((QL_DvalTotal.AsFloat-ieps)-subtotal,2);
          xlin:='X// //'+QL_DvalNombreProducto.AsString+'// //'+
                         FormatoMoneda(subtotal)+'//'+
                         FormatoMoneda(iva)+'//'+
                         FormatoMoneda(ieps)+'//'+
                         FormatoMoneda(QL_DvalTotal.AsFloat);
          if not CheckBox1.Checked then BndDt.Items.Add(xlin);
          if TT_Auxi.Locate('Combustible',QL_DvalProducto.AsInteger,[]) then begin
            TT_Auxi.Edit;
            TT_AuxiSubtotal.AsFloat:=TT_AuxiSubtotal.AsFloat+subtotal;
            TT_AuxiIva.AsFloat:=TT_AuxiIva.AsFloat+iva;
            TT_AuxiIeps.AsFloat := TT_AuxiIeps.AsFloat + ieps;
            TT_AuxiTotal.AsFloat:=TT_AuxiTotal.AsFloat+QL_DvalTotal.AsFloat;
            TT_AuxiCantidad.Asinteger:=TT_AuxiCantidad.AsInteger+QL_DvalCantidad.AsInteger;
          end
          else begin
            TT_Auxi.Insert;
            TT_AuxiCombustible.AsInteger:=QL_DvalProducto.AsInteger;
            TT_AuxiNombre.AsString:=QL_DvalNombreProducto.AsString;
            TT_AuxiSubtotal.AsFloat:=subtotal;
            TT_AuxiIva.AsFloat:=iva;
            TT_AuxiIeps.AsFloat := ieps;
            TT_AuxiTotal.AsFloat:=QL_DvalTotal.AsFloat;
            TT_AuxiCantidad.AsFloat:=QL_DvalCantidad.AsInteger;
          end;
          TT_Auxi.Post;
          QL_Dval.Next;
        end;
        if not CheckBox1.Checked then BndDt.Items.Add('B//');
        tcant:=tcant+TM_PvalCantidad.AsInteger;
        tots:=tots+TM_PvalSubTotal.AsFloat;
        toti:=toti+TM_PvalIva.AsFloat;
        totieps := totieps + TM_PvalIeps.AsFloat;
        tott:=tott+TM_PvalTotal.AsFloat;
        FAvance.AvanzaPosicion;
        TM_Pval.Next;
      end;
    finally
      FAvance.Close;
    end;
    xlin:='T// // //'+FormatoMoneda(tcant)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+'//'+FormatoMoneda(totieps)+'//'+
                      FormatoMoneda(tott);
    BndDt.Items.Add(xlin);
    xlin:='E// //Resumen por Tipo de Combustible';
    BndDt.Items.Add(xlin);
    TT_Auxi.SortOnFields('Combustible',true,false);
    TT_Auxi.First;
    tots:=0; tott:=0; toti:=0; totieps := 0;
    while not TT_Auxi.Eof do begin
      xlin:='X// //'+TT_AuxiNombre.AsString+'//'+
                     FormatoMoneda(TT_AuxiCantidad.AsFloat)+'//'+
                     FormatoMoneda(TT_AuxiSubtotal.AsFloat)+'//'+
                     FormatoMoneda(TT_AuxiIva.AsFloat)+'//'+
                     FormatoMoneda(TT_AuxiIeps.AsFloat)+'//'+
                     FormatoMoneda(TT_AuxiTotal.AsFloat);
      BndDt.Items.Add(xlin);
      totc:=totc+TT_AuxiCantidad.AsFloat;
      tots:=tots+TT_AuxiSubtotal.AsFloat;
      toti:=toti+TT_AuxiIva.AsFloat;
      totieps := totieps + TT_AuxiIeps.AsFloat;
      tott:=tott+TT_AuxiTotal.AsFloat;
      TT_Auxi.Next;
    end;
    xlin:='T// // //'+FormatoMoneda(tcant)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+'//'+FormatoMoneda(totieps)+'//'+
                      FormatoMoneda(tott);
    BndDt.Items.Add(xlin);
    BndDt.Items.Add('B//');
  end;
end;

procedure TFLIQREP07.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption+' ['+FLIQREP07P.ComboBox2.Text+']';
    QRLEstacion.Caption:=FLIQREP07P.DBLookupComboBox2.Text;
    QRLGrupo.Caption:='Grupo: '+FLIQREP07P.DBLookupComboBox3.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP07.BndDtBeforePrint(Sender: TQRCustomBand;
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
  InicializaEtiquetas(11,17);
  HabilitaShapes(13,17,false);
  ExtraeEtiquetas(11,17);
  Case xtp of
    'T':HabilitaShapes(13,17,true);
  end;
end;

procedure TFLIQREP07.QL_PvalCalcFields(DataSet: TDataSet);
var
  ieps : Real;
begin
  with DMGAS do begin
//    ieps := QL_PvalLITROS.Asfloat * DMCUP.DameIEPS(QL_PvalPRODUCTO.AsInteger,VgFechaFin);
//    QL_PvalSubTotal.AsFloat:=AjustaFloat((QL_PvalTotal.AsFloat-(ieps))/(1+GetTasaIVAdeCombustible(EstacionActual,1,VgFechaFin)/100),2);
//    QL_PvalIva.AsFloat:=AjustaFloat((QL_PvalTotal.AsFloat-(ieps))-QL_PvalSubtotal.AsFloat,2);
  end;
end;


procedure TFLIQREP07.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TT_Auxi.EmptyTable;
  Action:=caFree;
end;

end.
