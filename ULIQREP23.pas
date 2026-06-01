unit ULIQREP23;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport;

type
  TFLIQREP23 = class(TForm)
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
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    ChBEnca: TQRChildBand;
    QL_Pval: TQuery;
    QL_Vale: TQuery;
    DSQL_Pval: TDataSource;
    QL_ValeESTACION: TIntegerField;
    QL_ValeCAJA: TIntegerField;
    QL_ValeFECHA: TDateTimeField;
    QL_ValeTURNO: TIntegerField;
    QL_ValeINDICE: TIntegerField;
    QL_ValeINDICEVALE: TIntegerField;
    QL_ValeCLIENTE: TIntegerField;
    QL_ValeDESPACHADOR: TIntegerField;
    QL_ValeSUBCODIGO: TIntegerField;
    QL_ValeFOLIOVOLUMETRICO: TIntegerField;
    QL_ValeISLA: TIntegerField;
    DSQL_Vale: TDataSource;
    QL_Dval: TQuery;
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
    QL_DvalNombre: TStringField;
    QL_ValeFolioVolStr: TStringField;
    QL_ValeDespachadorStr: TStringField;
    QL_PvalGrupo: TIntegerField;
    QL_PvalNombre: TStringField;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalSERIEFAC: TStringField;
    QL_PvalFOLIOFAC: TIntegerField;
    QL_PvalTOTAL: TFloatField;
    QL_ValeIMPORTE: TFloatField;
    QL_ValeFACTURADO: TStringField;
    QL_ValeESTACIONFAC: TIntegerField;
    QL_ValeSERIEFAC: TStringField;
    QL_ValeFOLIOFAC: TIntegerField;
    QL_PvalFECHAFACTURA: TDateTimeField;
    QL_ValeIslaStr: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QL_ValeCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..9] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=9;

var
  FLIQREP23: TFLIQREP23;
  xtp:char;
  xlin:string;
  xwa,xla:Array[1..NoEti] of integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIBLICENCIAS, DDMGEN_VTAS, ULIQREP23P;

{$R *.DFM}

procedure TFLIQREP23.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Factura';
        2:Caption:='Fecha';
        3:Caption:='Turno';
        4:Caption:='Desp';
        5:Caption:='Isla';
        6:Caption:='Folio Vol.';
        7:Caption:='Comustible';
        8:Caption:='Importe Vale';
        9:Caption:='Total Factura';
      end;
      Case i of
        1:xw:=80;
        2:xw:=80;
        3:xw:=40;
        4:xw:=50;
        5:xw:=50;
        6:xw:=90;
        7:xw:=120;
        8,9:xw:=80;
      end;
      xwa[i]:=xw;
      xla[i]:=xl;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Tag       :=xl;
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
      if i in [3,4] then Alignment :=taCenter;
      if i in [1,2,5,6] then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP23.PreparaReporte;
var totc,totg:real;
    xcliente:integer;
begin
  with DMGEN,DMLIQ,DMGEN_VTAS,DMGAS,FLIQREP23P do begin
    CreaEtiquetas;
    BndDt.Items.Clear;
    QL_Pval.Close;
    QL_Pval.SQL.Clear;
    QL_Pval.SQL.Add('Select Cliente,SerieFac,FolioFac,Sum(Total) as Total,max(fechaFactura) as FechaFactura from DGASPVAL');
    QL_Pval.SQL.Add(' Where Facturado="Si" ');
    QL_Pval.SQL.Add('   and FechaFactura>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Pval.SQL.Add('   and FechaFactura<="'+FechaToStrSQL(VgFechaFin)+'"');
    QL_Pval.SQL.Add('   and Estacion='+IntToStr(T_EstsClave.AsInteger));
    if CheckBox2.Checked then
      QL_Pval.SQL.Add(' and SerieFac="'+VarGasTipoMovCargoVales+'"');
    QL_Pval.SQL.Add('Group by Cliente,SerieFac,FolioFac');
    QL_Pval.SQL.Add('Order by Cliente,FolioFac');
    QL_Pval.Prepare;
    QL_Pval.Open;
    totg:=0;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Pval.RecordCount);
      while not QL_Pval.Eof do begin
        if not CheckBox3.Checked then begin
          if QL_PvalGrupo.AsInteger<>DBLookUpComboBox3.KeyValue then begin
            QL_Pval.Next;
            Continue;
          end;
        end;
        totc:=0;
        xcliente:=QL_PvalCliente.AsInteger;
        xlin:='E//'+IntToClaveCata(QL_PvalCliente.AsInteger,idClie)+' '+QL_PvalNombre.AsString;
        BndDt.Items.Add(xlin);
        while (xcliente=QL_PvalCliente.AsInteger)and(not QL_Pval.Eof) do begin
          xlin:='D//'+QL_PvalSerieFac.AsString+'-'+IntToClaveNum(QL_PvalFolioFac.AsInteger,6)+'//'+
                      FechaPaq(QL_PvalFechaFactura.AsDateTime)+'//';
          InsertaElemStr(FormatoMoneda(QL_PvalTotal.AsFloat),10,xlin);
          BndDt.Items.Add(xlin);
          if FLIQREP23P.ComboBox2.ItemIndex=0 then begin
            QL_Vale.Close;
            QL_Vale.Prepare;
            QL_Vale.Open;
            while not QL_Vale.Eof do begin
              xlin:='V//';
              InsertaElemStr(FechaPaq(QL_ValeFecha.AsDateTime),3,xlin);
              InsertaElemStr(IntToClaveNum(QL_ValeTurno.AsInteger,2),4,xlin);
              InsertaElemstr(QL_ValeDespachadorStr.AsString,5,xlin);
              InsertaElemstr(QL_ValeIslaStr.AsString,6,xlin);
              InsertaElemstr(QL_ValeFolioVolStr.AsString,7,xlin);
              QL_Dval.Close;
              QL_Dval.Prepare;
              QL_Dval.Open;
              while not QL_Dval.eof do begin
                InsertaElemStr(QL_DvalNombre.AsString,8,xlin);
                InsertaElemStr(FormatoMoneda(Ql_DvalImporte.AsFloat),9,xlin);
                BndDt.Items.Add(xlin);
                xlin:='D//';
                QL_Dval.Next;
              end;
              QL_Vale.Next;
            end;
          end;
          totc:=totc+QL_PvalTotal.AsFloat;
          xcliente:=QL_PvalCliente.AsInteger;
          Favance.AvanzaPosicion;
          QL_Pval.Next;
        end;
        xlin:='T//';
        InsertaElemStr(FormatoMoneda(totc),10,xlin);
        BndDt.Items.Add(xlin);
        totg:=totg+totc;
      end;
      xlin:='T//';
      InsertaElemStr('Total General',9,xlin);
      InsertaElemStr(FormatoMoneda(totg),10,xlin);
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP23.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP23.BndDtBeforePrint(Sender: TQRCustomBand;
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
        Autosize:=false;
        Left:=xla[k];
        width:=xwa[k];
        if xtp='V' then Font.Size:=7;
        if xtp='E' then begin
          Font.Style:=[fsBold,fsUnderline];
          if k=1 then Autosize:=true;
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
  BndDt.Height:=15;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
  if xtp='V' then BndDt.Height:=14;
  Printband:=xtp<>'B';
  if (xtp='E')and(FLIQREP23P.CheckBox1.Checked) then QuickRep1.NewPage;
end;

procedure TFLIQREP23.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp in ['B','T'];
end;

procedure TFLIQREP23.FormDestroy(Sender: TObject);
begin
  QL_Pval.Close;
  QL_Vale.Close;
  QL_Dval.Close;
end;


procedure TFLIQREP23.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFLIQREP23.QL_ValeCalcFields(DataSet: TDataSet);
begin
  QL_ValeFolioVolStr.AsString:='';
  QL_ValeDespachadorStr.AsString:='';
  QL_ValeIslaStr.AsString:='';
  if QL_ValeFolioVolumetrico.AsInteger>0 then
    QL_ValeFolioVolStr.AsString:=IntToClaveNum(QL_ValeFolioVolumetrico.AsInteger,8);
  if QL_ValeDespachador.AsInteger>0 then
    QL_ValeDespachadorStr.AsString:=IntToClaveNum(QL_ValeDespachador.AsInteger,3);
  if QL_ValeIsla.AsInteger>0 then
    QL_ValeIslaStr.AsString:=IntToClaveNum(QL_ValeIsla.AsInteger,3);
end;

end.
