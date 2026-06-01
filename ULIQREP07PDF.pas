unit ULIQREP07PDF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS,
  QRPDFFilt;

type
  TFLIQREP07PDF = class(TForm)
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
    QRLGrupo: TQRLabel;
    QL_DvalSUBCLAVE: TIntegerField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QL_PvalCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FrmRutaPDF:String;
    procedure VerificarVales;
  public
    { Public declarations }
    _Grupo:Integer;
    SwResumido:Boolean;
    procedure PreparaReporte(pFechaCorte:TDateTime;pGrupo:Integer;Resumido:Boolean);
    function GeneraPDF:string;
  end;

var
  FLIQREP07PDF: TFLIQREP07PDF;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
  DDMLIQ, UAVANCE, DDMGEN_VTAS;

{$R *.DFM}

procedure TFLIQREP07PDF.VerificarVales;
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
      FAvance.PreparaAvance('Verificando Información...',true,QL_Pval2.RecordCount);
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

procedure TFLIQREP07PDF.PreparaReporte(pFechaCorte:TDateTime;pGrupo:Integer;Resumido:Boolean);
var tcant,i:integer;
    tott,tots,toti,totc,
    subtotal,iva,TasaIva:double;
begin
  with DMGEN,DMGAS do begin
    _Grupo:=pGrupo;
    SwResumido:=Resumido;
    VgFecha:=pFechaCorte;
    TT_Auxi.Active:=true;
    TM_Pval.Active:=true;
    QL_Pval.Close;
    QL_Pval.SQL.Clear;
    QL_Pval.SQL.Add('Select Cliente,Sum(Cantidad) as Cantidad,Sum(Total) as Total from DGASPVAL');
    QL_Pval.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
    QL_Pval.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFecha)+'"');
    QL_Pval.SQL.Add(' and Facturado='+QuotedStr('No'));
    QL_Pval.SQL.Add('Group by Cliente');
    QL_Pval.SQL.Add('Order by Cliente');
    QL_Pval.Prepare;
    QL_Pval.Open;
    while not QL_Pval.Eof do begin
      TM_Pval.Insert;
      for i:=0 to 6 do begin
        TM_Pval.Fields[I].AsVariant:=QL_Pval.Fields[I].AsVariant;
      end;
      TM_Pval.Post;
      QL_Pval.Next;
    end;
    if TM_Pval.RecordCount>0 then
    begin
      TM_Pval.SortOnFields('Cliente;NombreCliente',False,False);
    end;
    TM_Pval.First;
    BndDt.Items.Clear;
    tcant:=0; tots:=0; toti:=0; tott:=0;
    try
      FAvance.PreparaAvance('Procesando Información...',true,TM_Pval.RecordCount);
      while not TM_Pval.Eof do begin
        if not SwResumido then begin
          if _Grupo>0 then begin
            if TM_PvalGrupo.AsInteger<>_Grupo then begin
              FAvance.AvanzaPosicion;
              TM_Pval.Next;
              Continue;
            end;
          end;
        end;
        xlin:='D//'+InttoClaveCata(TM_PvalCliente.AsInteger,idClie)+'//'+TM_PvalNombreCliente.AsString+'//'+
                    FormatoMoneda(TM_PvalCantidad.AsInteger)+'//'+
                    FormatoMoneda(TM_PvalSubTotal.AsFloat)+'//'+
                    FormatoMoneda(TM_PvalIva.AsFloat)+'//'+
                    FormatoMoneda(TM_PvalTotal.AsFloat);
        BndDt.Items.Add(xlin);
        QL_Dval.Close;
        QL_Dval.SQL.Clear;
        QL_Dval.SQL.Add('Select Producto,subclave, Sum(Importe) as Total, Count(*) as Cantidad from DGASDVAL');
        QL_Dval.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
        QL_Dval.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFecha)+'"');
        QL_Dval.SQL.Add('  and Cliente='+InttoStr(TM_PvalCliente.AsInteger));
        QL_Dval.SQL.Add(' and Facturado='+QuotedStr('No'));
        QL_Dval.SQL.Add('Group by Producto,subclave');
        QL_Dval.SQL.Add('Order by Producto,subclave');
        QL_Dval.Prepare;
        QL_Dval.Open;
        while not QL_Dval.Eof do begin
          if GetTipoTCMB(QL_DvalPRODUCTO.AsInteger)=idTipoCmb then
            TasaIva:=GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,QL_DvalPRODUCTO.AsInteger,VgFecha)
          else
            TasaIva:=GetTasaIVAdeProducto(T_EstsCLAVE.AsInteger,QL_DvalSUBCLAVE.AsInteger,VgFecha);

          subtotal:=AjustaFloat(QL_DvalTotal.AsFloat/(1+TasaIva/100),2);
          iva:=AjustaFloat(QL_DvalTotal.AsFloat-subtotal,2);
          xlin:='X// //'+QL_DvalNombreProducto.AsString+'// //'+
                         FormatoMoneda(subtotal)+'//'+
                         FormatoMoneda(iva)+'//'+
                         FormatoMoneda(QL_DvalTotal.AsFloat);
          if not SwResumido then BndDt.Items.Add(xlin);
          if TT_Auxi.Locate('Combustible',QL_DvalProducto.AsInteger,[]) then begin
            TT_Auxi.Edit;
            TT_AuxiSubtotal.AsFloat:=TT_AuxiSubtotal.AsFloat+subtotal;
            TT_AuxiIva.AsFloat:=TT_AuxiIva.AsFloat+iva;
            TT_AuxiTotal.AsFloat:=TT_AuxiTotal.AsFloat+QL_DvalTotal.AsFloat;
            TT_AuxiCantidad.Asinteger:=TT_AuxiCantidad.AsInteger+QL_DvalCantidad.AsInteger;
          end
          else begin
            TT_Auxi.Insert;
            TT_AuxiCombustible.AsInteger:=QL_DvalProducto.AsInteger;
            TT_AuxiNombre.AsString:=QL_DvalNombreProducto.AsString;
            TT_AuxiSubtotal.AsFloat:=subtotal;
            TT_AuxiIva.AsFloat:=iva;
            TT_AuxiTotal.AsFloat:=QL_DvalTotal.AsFloat;
            TT_AuxiCantidad.AsFloat:=QL_DvalCantidad.AsInteger;
          end;
          TT_Auxi.Post;
          QL_Dval.Next;
        end;
        if not SwResumido then BndDt.Items.Add('B//');
        tcant:=tcant+TM_PvalCantidad.AsInteger;
        tots:=tots+TM_PvalSubTotal.AsFloat;
        toti:=toti+TM_PvalIva.AsFloat;
        tott:=tott+TM_PvalTotal.AsFloat;
        FAvance.AvanzaPosicion;
        TM_Pval.Next;
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
    TT_Auxi.SortOnFields('Combustible',true,false);
    TT_Auxi.First;
    tots:=0; tott:=0; toti:=0;
    while not TT_Auxi.Eof do begin
      xlin:='X// //'+TT_AuxiNombre.AsString+'//'+
                     FormatoMoneda(TT_AuxiCantidad.AsFloat)+'//'+
                     FormatoMoneda(TT_AuxiSubtotal.AsFloat)+'//'+
                     FormatoMoneda(TT_AuxiIva.AsFloat)+'//'+
                     FormatoMoneda(TT_AuxiTotal.AsFloat);
      BndDt.Items.Add(xlin);
      totc:=totc+TT_AuxiCantidad.AsFloat;
      tots:=tots+TT_AuxiSubtotal.AsFloat;
      toti:=toti+TT_AuxiIva.AsFloat;
      tott:=tott+TT_AuxiTotal.AsFloat;
      TT_Auxi.Next;
    end;
    xlin:='T// // //'+FormatoMoneda(tcant)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+'//'+
                      FormatoMoneda(tott);
    BndDt.Items.Add(xlin);
    BndDt.Items.Add('B//');
  end;
end;

procedure TFLIQREP07PDF.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption+' [No Facturado]';
    QRLEstacion.Caption:=QT_EstsNOMBRE.AsString;
    if _Grupo>0 then
      QRLGrupo.Caption:='Grupo: '+IntToClaveNum(_Grupo,3)
    else
      QRLGrupo.Caption:='';
    QRLEnca.Caption:=RangoFecha(VgFecha,VgFecha)+' [ '+IntToStr(DMGAS.VarGasNumeroDiasRevisionVales)+' Días Vencidos]';
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP07PDF.BndDtBeforePrint(Sender: TQRCustomBand;
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

procedure TFLIQREP07PDF.QL_PvalCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_PvalSubTotal.AsFloat:=AjustaFloat(QL_PvalTotal.AsFloat/(1+GetTasaIVAdeCombustible(T_EstsCLAVE.AsInteger,1,VgFecha)/100),2);
    QL_PvalIva.AsFloat:=AjustaFloat(QL_PvalTotal.AsFloat-QL_PvalSubtotal.AsFloat,2);
  end;
end;


procedure TFLIQREP07PDF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TT_Auxi.EmptyTable;
  Action:=caFree;
end;

function TFLIQREP07PDF.GeneraPDF: string;
var
  PDFFilt : TQRPDFDocumentFilter;
begin
  with DMGASQ do begin
    try
      FrmRutaPDF:=VsLocalDir+'\'+FormatDateTime('YYMMDD',VgFecha)+'_ValesPendientesDeFacturar_'+QT_EstsNOMBRE.AsString+'.pdf';
      PDFFilt:=TQRPDFDocumentFilter.Create(FrmRutaPDF);
      try
        try
          QuickRep1.ShowProgress:=False;
          QuickRep1.ExportToFilter( PDFFilt );
        except
          On E:Exception do
            raise E;
        end;
      finally
        pdffilt.Free;
      end;
      Result:=FrmRutaPDF;
    except
      on e:Exception do begin
        Result:='';
        raise Exception.Create(e.Message);
      end;
    end;
  end;
end;

end.
