unit ULIQREP27;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport,
  RxMemDS;

type
  TFLIQREP27 = class(TForm)
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
    ChBEnca: TQRChildBand;
    QL_Vale: TQuery;
    QL_Dval: TQuery;
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
    QL_ValeDESPACHADOR: TIntegerField;
    QL_ValeSUBCODIGO: TIntegerField;
    QL_ValeFOLIOVOLUMETRICO: TIntegerField;
    QL_ValeISLA: TIntegerField;
    DSQL_Vale: TDataSource;
    QL_DvalESTACION: TIntegerField;
    QL_DvalCAJA: TIntegerField;
    QL_DvalFECHA: TDateTimeField;
    QL_DvalTURNO: TIntegerField;
    QL_DvalINDICE: TIntegerField;
    QL_DvalINDICEVALE: TIntegerField;
    QL_DvalPRODUCTO: TIntegerField;
    QL_DvalSUBCLAVE: TIntegerField;
    QL_DvalIMPORTE: TFloatField;
    QL_DvalCANTIDAD: TFloatField;
    QL_DvalFACTURADO: TStringField;
    QL_DvalESTACIONFAC: TIntegerField;
    QL_DvalSERIEFAC: TStringField;
    QL_DvalFOLIOFAC: TIntegerField;
    QL_DvalCLIENTE: TIntegerField;
    QL_DvalSUBCODIGO: TIntegerField;
    QL_Desp: TQuery;
    QL_DespCLAVE: TIntegerField;
    QL_DespNOMBRE: TStringField;
    QL_DvalNombreCombustible: TStringField;
    QL_ValeIslaStr: TStringField;
    QL_ValeFolioVolStr: TStringField;
    QL_ValeFactura: TStringField;
    TT_Auxi: TRxMemoryData;
    TT_AuxiCombustible: TIntegerField;
    TT_AuxiImporte: TFloatField;
    TT_AuxiCantidad: TFloatField;
    TT_AuxiNombreCombustible: TStringField;
    TT_Auxi2: TRxMemoryData;
    TT_Auxi2Combustible: TIntegerField;
    TT_Auxi2Importe: TFloatField;
    TT_Auxi2NombreCombustible: TStringField;
    TT_Auxi2Cantidad: TFloatField;
    QL_DvalPrecioPromedio: TFloatField;
    QL_DvalLitros: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QL_ValeCalcFields(DataSet: TDataSet);
    procedure QL_DvalCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..10] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=10;

var
  FLIQREP27: TFLIQREP27;
  xtp:char;
  xlin:string;
  xwa,xla:Array[1..NoEti] of integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIBLICENCIAS, DDMGEN_VTAS, ULIQREP27P;

{$R *.DFM}

procedure TFLIQREP27.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='No.';
        2:Caption:='Fecha';
        3:Caption:='Turno';
        4:Caption:='Isla';
        5:Caption:='Fol.Volum.';
        6:Caption:='Cliente';
        7:Caption:='Factura';
        8:Caption:='Combustible';
        9:Caption:='Litros';
       10:Caption:='Importe';
      end;
      Case i of
        1:xw:=35;
        2:xw:=80;
        3:xw:=40;
        4:xw:=40;
        5:xw:=80;
        6:xw:=60;
        7:xw:=70;
        8:xw:=128;
        9:xw:=70;
       10:xw:=80;
      end;
      xwa[i]:=xw;
      xla[i]:=xl;
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
      if i=NoEti then Frame.DrawRight:=false;
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
      if i in [1,3..5] then Alignment :=taCenter;
      if i in [2,6..8] then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP27.PreparaReporte;
var xno:word;
    totl,toti:double;
begin
  with DMGEN,DMLIQ,DMGEN_VTAS,DMGAS,FLIQREP27P do begin
    CreaEtiquetas;
    BndDt.Items.Clear;
    QL_Desp.Close;
    QL_Desp.SQL.Clear;
    QL_Desp.SQL.Add('Select Clave,Nombre from DGASDESP');
    QL_Desp.SQL.Add('Where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    if not CheckBox1.Checked then
      QL_Desp.SQL.Add('and Clave='+IntToStr(DBLookUpComboBox1.KeyValue));
    QL_Desp.SQL.Add('Order by Clave');
    QL_Desp.Prepare;
    QL_Desp.Open;
    TT_Auxi.Active:=true;
    TT_Auxi2.Active:=true;
    try
      FAvance.PreparaAvance('Generando reporte...',true,QL_Desp.RecordCount);
      while not QL_Desp.Eof do begin
        TT_Auxi.EmptyTable;
        xlin:='E//'+InttoClaveNum(QL_DespClave.AsInteger,3)+'  '+QL_DespNombre.AsString;
        QL_Vale.Close;
        QL_Vale.ParamByName('pdespachador').AsInteger:=QL_DespClave.AsInteger;
        QL_Vale.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
        QL_Vale.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
        QL_Vale.Prepare;
        QL_Vale.Open;
        if not QL_Vale.IsEmpty then
          BndDt.Items.Add(xlin);
        xno:=1;
        while not QL_Vale.Eof do begin
          xlin:='D//'+InttoClaveNum(xno,2)+'//'+
                      FechaPaq(QL_ValeFecha.AsDateTime)+'//'+
                      InttoClaveNum(QL_ValeTurno.AsInteger,2)+'//'+
                      QL_ValeIslaStr.AsString+'//'+
                      QL_ValeFolioVolStr.AsString+'//'+
                      IntToClaveCata(QL_ValeCliente.AsInteger,idClie)+'//'+
                      QL_ValeFactura.AsString+'//';
          QL_Dval.Close;
          QL_Dval.Prepare;
          QL_Dval.Open;
          while not QL_Dval.Eof do begin
            xlin:=xlin+QL_DvalNombreCombustible.AsString+'//'+
                       FormatoMoneda(QL_DvalLitros.AsFloat)+'//'+
                       FormatoMoneda(QL_DvalImporte.AsFloat)+'//';
            BndDt.Items.Add(xlin);
            if TT_Auxi.Locate('Combustible',QL_DvalProducto.AsInteger,[]) then begin
              TT_Auxi.Edit;
              TT_AuxiCantidad.AsFloat:=TT_AuxiCantidad.AsFloat+QL_DvalLitros.AsFloat;
              TT_AuxiImporte.AsFloat:=TT_AuxiImporte.AsFloat+QL_DvalImporte.AsFloat;
            end
            else begin
              TT_Auxi.Insert;
              TT_AuxiCombustible.AsInteger:=QL_DvalProducto.AsInteger;
              TT_AuxiCantidad.AsFloat:=QL_DvalLitros.AsFloat;
              TT_AuxiImporte.AsFloat:=QL_DvalImporte.AsFloat;
            end;
            TT_Auxi.Post;
//Acumualdo Global
            if TT_Auxi2.Locate('Combustible',QL_DvalProducto.AsInteger,[]) then begin
              TT_Auxi2.Edit;
              TT_Auxi2Cantidad.AsFloat:=TT_Auxi2Cantidad.AsFloat+QL_DvalLitros.AsFloat;
              TT_Auxi2Importe.AsFloat:=TT_Auxi2Importe.AsFloat+QL_DvalImporte.AsFloat;
            end
            else begin
              TT_Auxi2.Insert;
              TT_Auxi2Combustible.AsInteger:=QL_DvalProducto.AsInteger;
              TT_Auxi2Cantidad.AsFloat:=QL_DvalLitros.AsFloat;
              TT_Auxi2Importe.AsFloat:=QL_DvalImporte.AsFloat;
            end;
            TT_Auxi2.Post;
//
            xlin:='D// // // // // // //';
            QL_Dval.Next;
          end;
          inc(xno);
          QL_Vale.Next;
        end;
        if not TT_Auxi.IsEmpty then begin
          TT_Auxi.SortOnFields('Combustible',true,false);
          TT_Auxi.First;
          BndDt.Items.Add('B//');
          xlin:='E//';
          InsertaElemStr('Resumen              ',9,xlin);
          BndDt.Items.Add(xlin);
          totl:=0; toti:=0;
          xlin:='D//';
          while not TT_Auxi.Eof do begin
            InsertaElemStr(TT_AuxiNombreCombustible.AsString,9,xlin);
            InsertaElemStr(FormatoMoneda(TT_AuxiCantidad.AsFloat),10,xlin);
            InsertaElemStr(FormatoMoneda(TT_AuxiImporte.AsFloat),11,xlin);
            BndDt.Items.Add(xlin);
            totl:=totl+TT_AuxiCantidad.AsFloat;
            toti:=toti+TT_AuxiImporte.AsFloat;
            TT_Auxi.Next;
          end;
          xlin:='T//';
          InsertaElemStr(FormatoMoneda(totl),10,xlin);
          InsertaElemStr(FormatoMoneda(toti),11,xlin);
          BndDt.Items.Add(xlin);
        end;
        FAvance.AvanzaPosicion;
        QL_Desp.Next;
      end;
//Total Global
      if not TT_Auxi2.IsEmpty then begin
        TT_Auxi2.SortOnFields('Combustible',true,false);
        TT_Auxi2.First;
        BndDt.Items.Add('B//');
        xlin:='E//';
        InsertaElemStr('Resumen Global',9,xlin);
        BndDt.Items.Add(xlin);
        totl:=0; toti:=0;
        xlin:='D//';
        while not TT_Auxi2.Eof do begin
          InsertaElemStr(TT_Auxi2NombreCombustible.AsString,9,xlin);
          InsertaElemStr(FormatoMoneda(TT_Auxi2Cantidad.AsFloat),10,xlin);
          InsertaElemStr(FormatoMoneda(TT_Auxi2Importe.AsFloat),11,xlin);
          BndDt.Items.Add(xlin);
          totl:=totl+TT_Auxi2Cantidad.AsFloat;
          toti:=toti+TT_Auxi2Importe.AsFloat;
          TT_Auxi2.Next;
        end;
        xlin:='T//';
        InsertaElemStr(FormatoMoneda(totl),10,xlin);
        InsertaElemStr(FormatoMoneda(toti),11,xlin);
        BndDt.Items.Add(xlin);
      end;
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP27.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP27P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP27.BndDtBeforePrint(Sender: TQRCustomBand;
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
        Left:=xla[k];
        width:=xwa[k];
        if k=1 then Alignment:=taCenter;
        if xtp='E' then begin
          Font.Style:=[fsBold,fsUnderline];
          if k=1 then begin
            Autosize:=true;
            Left:=5;
            Alignment:=taLeftJustify;
          end;
          if k in [2,3,4,5] then left:=800;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>8 then Frame.DrawTop:=true;
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

procedure TFLIQREP27.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp in ['T','B'];
end;

procedure TFLIQREP27.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFLIQREP27.QL_ValeCalcFields(DataSet: TDataSet);
begin
  QL_ValeIslaStr.AsString:='';
  QL_ValeFolioVolStr.AsString:='';
  QL_ValeFactura.AsString:='';
  if QL_ValeIsla.AsInteger>0 then
    QL_ValeIslaStr.AsString:=IntToClaveNum(QL_ValeIsla.AsInteger,2);
  if QL_ValeFolioVolumetrico.AsInteger>0 then
    QL_ValeFolioVolStr.AsString:=IntToClaveNum(QL_ValeFolioVolumetrico.AsInteger,8);
  if QL_ValeFacturado.AsString='Si' then
    QL_ValeFactura.AsString:=QL_ValeSerieFac.AsString+'-'+InttoClaveNum(QL_ValeFolioFac.AsInteger,6);

end;

procedure TFLIQREP27.QL_DvalCalcFields(DataSet: TDataSet);
var xprecio1,
    xprecio2,
    xtasa:real;
begin
  with DMGAS,DMCUP do begin
    DamePrecioFecha(QL_DvalProducto.AsInteger,VgFechaIni,xprecio1,xtasa);
    DamePrecioFecha(QL_DvalProducto.AsInteger,VgFechaFin,xprecio2,xtasa);
    QL_DvalPrecioPromedio.AsFloat:=AjustaFloat(DivideFloat(xprecio1+xprecio2,2),2);
    QL_DvalLitros.AsFloat:=AjustaFloat(DivideFloat(QL_DvalImporte.AsFloat,QL_DvalPrecioPromedio.AsFloat),2);
  end;
end;

end.
