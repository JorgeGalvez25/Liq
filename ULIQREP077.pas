unit ULIQREP077;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

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
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLEstacion: TQRLabel;
    TT_Auxi: TTable;
    TT_AuxiProducto: TIntegerField;
    TT_AuxiImporte: TFloatField;
    TT_AuxiNombreProducto: TStringField;
    QL_Pval: TQuery;
    QL_PvalESTACION: TIntegerField;
    QL_PvalCAJA: TIntegerField;
    QL_PvalFECHA: TDateTimeField;
    QL_PvalTURNO: TIntegerField;
    QL_PvalINDICE: TIntegerField;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalCANTIDAD: TIntegerField;
    QL_PvalTOTAL: TFloatField;
    QL_PvalFACTURADO: TStringField;
    QL_PvalESTACIONFAC: TIntegerField;
    QL_PvalSERIEFAC: TStringField;
    QL_PvalFOLIOFAC: TIntegerField;
    QL_PvalINDICEVALE: TIntegerField;
    QL_PvalNombreCliente: TStringField;
    QL_PvalFechaPaq: TStringField;
    QL_PvalClientePaq: TStringField;
    DSQL_Pval: TDataSource;
    QL_Vale: TQuery;
    QL_ValeESTACION: TIntegerField;
    QL_ValeCAJA: TIntegerField;
    QL_ValeFECHA: TDateTimeField;
    QL_ValeTURNO: TIntegerField;
    QL_ValeINDICE: TIntegerField;
    QL_ValeINDICEVALE: TIntegerField;
    QL_ValeIMPORTE: TFloatField;
    QL_ValeFACTURADO: TStringField;
    QL_ValeESTACIONFAC: TIntegerField;
    QL_ValeSERIEFAC: TStringField;
    QL_ValeFOLIOFAC: TIntegerField;
    QL_ValeCLIENTE: TIntegerField;
    DSQL_Vale: TDataSource;
    QL_Dval: TQuery;
    QL_DvalNombreProducto: TStringField;
    QL_DvalESTACION: TIntegerField;
    QL_DvalCAJA: TIntegerField;
    QL_DvalFECHA: TDateTimeField;
    QL_DvalTURNO: TIntegerField;
    QL_DvalINDICE: TIntegerField;
    QL_DvalINDICEVALE: TIntegerField;
    QL_DvalPRODUCTO: TIntegerField;
    QL_DvalIMPORTE: TFloatField;
    QL_DvalFACTURADO: TStringField;
    QL_DvalESTACIONFAC: TIntegerField;
    QL_DvalSERIEFAC: TStringField;
    QL_DvalFOLIOFAC: TIntegerField;
    QL_DvalCLIENTE: TIntegerField;
    QL_Pval2: TQuery;
    QL_Pval2CLIENTE: TIntegerField;
    QL_Pval2CANTIDAD: TIntegerField;
    QL_Pval2TOTAL: TFloatField;
    QL_Pval2Subtotal: TFloatField;
    QL_Pval2Iva: TFloatField;
    QL_Pval2NombreCliente: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QL_PvalCalcFields(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure CreaTablaTemp;
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

procedure TFLIQREP07.PreparaReporte;
var tcant:integer;
    tott,tots,toti,
    subtotal,iva:double;
begin
  with DMGEN,DMGAS,FLIQREP07P do begin
    InicializaTemp(TT_Auxi);
    CreaTablaTemp;
    QL_Pval2.Close;
    QL_Pval2.SQL.Clear;
    QL_Pval2.SQL.Add('Select Cliente,Sum(Cantidad) as Cantidad,Sum(Total) as Total from DGASPval2');
    QL_Pval2.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
    QL_Pval2.SQL.Add('  and Caja='+IntToStr(QL_CajaCaja.AsInteger));
    QL_Pval2.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Pval2.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    Case ComboBox2.ItemIndex of
      0:QL_Pval2.SQL.Add(' and Facturado="No" ');
      1:QL_Pval2.SQL.Add(' and Facturado="Si" ');
    end;
    QL_Pval2.SQL.Add('Group by Cliente');
    QL_Pval2.SQL.Add('Order by Cliente');
    QL_Pval2.Prepare;
    QL_Pval2.Open;
    while not QL_Pval2.Eof do begin

    QL_Pval.Close;
    QL_Pval.SQL.Clear;
    QL_Pval.SQL.Add('Select * from DGASPVAL');
    QL_Pval.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
    QL_Pval.SQL.Add('  and Caja='+IntToStr(QL_CajaCaja.AsInteger));
    QL_Pval.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Pval.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    Case ComboBox2.ItemIndex of
      0:QL_Pval.SQL.Add(' and Facturado="No" ');
      1:QL_Pval.SQL.Add(' and Facturado="Si" ');
    end;
    QL_Pval.SQL.Add('Order by Cliente,fecha');
    QL_Pval.Prepare;
    QL_Pval.Open;
    BndDt.Items.Clear;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Pval.RecordCount);
      while not QL_Pval.Eof do begin
       tcant:=0; tots:=0; toti:=0; tott:=0;
        QL_Vale.Close;
        QL_Vale.Prepare;
        QL_Vale.Open;
        while not QL_Vale.Eof do begin
          inc(tcant);
          tott:=tots+QL_ValeImporte.AsFloat;
          if not CheckBox1.Checked then begin
            while not TT_Auxi.Eof do
              TT_Auxi.Delete;
            QL_Dval.Close;
            QL_Dval.Prepare;
            QL_Dval.Open;
            while not QL_Dval.Eof do begin
              if TT_Auxi.Locate('Producto',QL_DvalProducto.AsInteger,[]) then begin
                TT_Auxi.Edit;
                TT_AuxiImporte.AsFloat:=TT_AuxiImporte.AsFloat+QL_DvalTotal.AsFloat;
              end
              else begin
                TT_Auxi.Insert;
                TT_AuxiProducto.AsInteger:=QL_DvalProducto.AsInteger;
                TT_AuxiImporte.AsFloat:=QL_DvalTotal.AsFloat;
              end;
              TT_Auxi.Post;
              QL_Dval.Next;
            end;
          end;
          QL_Vale.Next;
        end;
        tots:=AjustaFloat(tott/(1+VarGasIvaCombustible/100),2);
        toti:=AjustaFloat(tott-tots,2);
        xlin:='D//'+InttoClaveCata(QL_PvalCliente.AsInteger,idClie)+'//'+QL_PvalNombreCliente.AsString+'//'+
                    FormatoMoneda(QL_PvalCantidad.AsInteger)+'//'+
                    FormatoMoneda(QL_PvalSubTotal.AsFloat)+'//'+
                    FormatoMoneda(QL_PvalIva.AsFloat)+'//'+
                    FormatoMoneda(QL_PvalTotal.AsFloat);
        BndDt.Items.Add(xlin);


        if not CheckBox1.Checked then begin
          QL_Pval2.Close;
          QL_Pval2.SQL.Clear;
          QL_Pval2.SQL.Add('Select *  from DGASPVAL');
          QL_Pval2.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
          QL_Pval2.SQL.Add('  and Caja='+IntToStr(QL_CajaCaja.AsInteger));
          QL_Pval2.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
          QL_Pval2.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
          QL_Pval2.SQL.Add('  and Cliente='+IntToStr(QL_PvalCliente.AsInteger));
          Case ComboBox2.ItemIndex of
            0:QL_Pval2.SQL.Add(' and Facturado="No" ');
            1:QL_Pval2.SQL.Add(' and Facturado="Si" ');
          end;
          QL_Pval2.SQL.Add('Order by Fecha');
          QL_Pval2.Prepare;
          QL_Pval2.Open;
          while not TT_Auxi.Eof do
            TT_Auxi.Delete;
          while not QL_Pval2.Eof do begin
            QL_Dval.Close;
            QL_Dval.SQL.Clear;
            QL_Dval.SQL.Add('Select Producto, Sum(Importe) as Total from DGASDVAL');
            QL_Dval.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
            QL_Dval.SQL.Add('  and Caja='+IntToStr(QL_CajaCaja.AsInteger));
            QL_Dval.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
            QL_Dval.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
            QL_Dval.SQL.Add('  and Indice='+InttoStr(QL_Pval2Indice.AsInteger));
            QL_Dval.SQL.Add('Group by Producto');
            QL_Dval.SQL.Add('Order by Producto');
            QL_Dval.Prepare;
            QL_Dval.Open;
            if TT_Auxi.Locate('Producto',QL_DvalProducto.AsInteger,[]) then begin
              TT_Auxi.Edit;
              TT_AuxiImporte.AsFloat:=TT_AuxiImporte.AsFloat+QL_DvalTotal.AsFloat;
            end
            else begin
              TT_Auxi.Insert;
              TT_AuxiProducto.AsInteger:=QL_DvalProducto.AsInteger;
              TT_AuxiImporte.AsFloat:=QL_DvalTotal.AsFloat;
            end;
            TT_Auxi.Post;
            QL_Pval2.Next;
          end;
          TT_Auxi.First;
          while not TT_Auxi.Eof do begin
            subtotal:=AjustaFloat(TT_AuxiImporte.AsFloat/(1+VarGasIvaCombustible/100),2);
            iva:=AjustaFloat(TT_AuxiImporte.AsFloat-subtotal,2);
            xlin:='X// //'+TT_AuxiNombreProducto.AsString+'// //'+
                           FormatoMoneda(subtotal)+'//'+
                           FormatoMoneda(iva)+'//'+
                           FormatoMoneda(TT_AuxiImporte.AsFloat);
            BndDt.Items.Add(xlin);
            TT_Auxi.Next;
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
    xlin:='E// //Resumen por Tipo de Combustible';
    BndDt.Items.Add(xlin);
    QL_Dval.Close;
    QL_Dval.SQL.Clear;
    QL_Dval.SQL.Add('Select Producto, Sum(Importe) as Total from DGASDVAL');
    QL_Dval.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
    QL_Dval.SQL.Add('  and Caja='+IntToStr(QL_CajaCaja.AsInteger));
    QL_Dval.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Dval.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    Case ComboBox2.ItemIndex of
      0:QL_Dval.SQL.Add(' and Facturado="No" ');
      1:QL_Dval.SQL.Add(' and Facturado="Si" ');
    end;
    QL_Dval.SQL.Add('Group by Producto');
    QL_Dval.SQL.Add('Order by Producto');
    QL_Dval.Prepare;
    QL_Dval.Open;
    tots:=0; tott:=0; toti:=0;
    while not QL_Dval.Eof do begin
      subtotal:=AjustaFloat(QL_DvalTotal.AsFloat/(1+VarGasIvaCombustible/100),2);
      iva:=AjustaFloat(QL_DvalTotal.AsFloat-subtotal,2);
      xlin:='X// //'+QL_DvalNombreProducto.AsString+'// //'+
                     FormatoMoneda(subtotal)+'//'+
                     FormatoMoneda(iva)+'//'+
                     FormatoMoneda(QL_DvalTotal.AsFloat);
      BndDt.Items.Add(xlin);
      QL_Dval.Next;
    end;
    xlin:='T// // //'+FormatoMoneda(tcant)+'//'+FormatoMoneda(tots)+'//'+FormatoMoneda(toti)+'//'+
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
        if (xtp='T')or(xtp='M') then Font.Style:=[fsBold];
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

procedure TFLIQREP07.QL_PvalCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_PvalSubTotal.AsFloat:=AjustaFloat(QL_PvalTotal.AsFloat/(1+VarGasIvaCombustible/100),2);
    QL_PvalIva.AsFloat:=AjustaFloat(QL_PvalTotal.AsFloat-QL_PvalSubtotal.AsFloat,2);
  end;
end;

procedure TFLIQREP07.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Producto', ftInteger, 0, True);
      Add('Importe', ftFloat,0,false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'Producto', [ixPrimary, ixUnique]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.IndexFieldNames:='';
    TT_Auxi.Active:=true;
  end;
end;


procedure TFLIQREP07.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Pval.Close;
    QL_Pval2.Close;
    QL_Dval.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
  end;
end;

end.
