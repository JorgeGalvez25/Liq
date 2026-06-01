unit ULIQREP03;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

type
  TFLIQREP03 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLRango: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QL_Cupo: TQuery;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape12: TQRShape;
    QRLabel17: TQRLabel;
    QL_CupoSERIE: TIntegerField;
    QL_CupoFOLIO: TIntegerField;
    QL_CupoFECHAVENTA: TDateTimeField;
    QL_CupoIMPORTE: TFloatField;
    QL_CupoSERIEFAC: TStringField;
    QL_CupoFOLIOFAC: TIntegerField;
    QL_CupoESTACION: TIntegerField;
    ChildBand2: TQRChildBand;
    QL_Ests: TQuery;
    QL_EstsCLAVE: TIntegerField;
    QL_EstsNOMBRE: TStringField;
    QL_CupoNombreEstacion: TStringField;
    QL_Serc: TQuery;
    QL_SercCLAVE: TIntegerField;
    QL_SercDESCRIPCION: TStringField;
    QL_SercPRECIO: TFloatField;
    QL_SercTIPO: TStringField;
    QL_CupoDescripcionSerie: TStringField;
    QL_CupoNOCLIENTE: TIntegerField;
    QL_CupoNombreCliente: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

var
  FLIQREP03: TFLIQREP03;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, UAVANCE, DDMCUP,DDMGEN_VTAS, DDMGAS, DDMGASQ,
  ULIQREP03P;

{$R *.DFM}

procedure TFLIQREP03.PreparaReporte;
var xest,xserie,xfolio:integer;
    xtipo,xdescripserie,
    xdescripestacion:String;
    tot:array[1..3] of double;
    i:word;
    xfechar:tdatetime;
begin
  with DMGEN,DMCUP,FLIQREP03P do begin
    xfechar:=StrToDate(MaskEdit1.text);
    QL_Serc.Close;
    QL_Serc.Prepare;
    QL_Serc.Open;

    QL_Ests.Close;
    QL_Ests.Prepare;
    QL_Ests.Open;

    QL_Cupo.Close;
    QL_Cupo.SQL.Clear;
    QL_Cupo.SQL.Add('SELECT C.SERIE, C.FOLIO, C.FECHAVENTA, C.IMPORTE, F.TIPOFAC AS SERIEFAC, F.FOLIO AS FOLIOFAC, C.ESTACION, C.NOCLIENTE FROM DGASCUPO C');
    QL_Cupo.SQL.Add('INNER JOIN DGASFACA F ON C.IDANTICIPO = F.ID');
    QL_Cupo.SQL.Add('WHERE C.FECHAVENTA>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Cupo.SQL.Add('  AND C.FECHAVENTA<="'+FechaToStrSQL(VgFechaFin)+'"');
    if not CheckBox1.Checked then
      QL_Cupo.SQL.Add('AND C.ESTACION='+IntToStr(DBLookUpComboBox2.KeyValue));
    if not CheckBox2.Checked then
      QL_Cupo.SQL.Add('AND C.SERIE='+IntToStr(DBLookUpComboBox1.KeyValue));
    QL_Cupo.SQL.Add('AND (C.ESTATUS="V" OR (C.ESTATUS="R" AND C.FECHARECUP>"'+FechaToStrSQL(xfechar)+'"))');
    QL_Cupo.SQL.Add('ORDER BY C.ESTACION, F.TIPOFAC, F.FOLIO');
    QL_Cupo.Prepare;
    QL_Cupo.Open;
    for i:=1 to 3 do
      tot[i]:=0;
    BndDt.Items.Clear;
    FAvance.PreparaAvance('Preparando reporte...',true,QL_Cupo.RecordCount);
    try
      while not QL_Cupo.Eof do begin
        xest:=QL_CupoEstacion.AsInteger;
        xdescripestacion:=QL_CupoNombreEstacion.AsString;
        if FLIQREP03P.CheckBox1.Checked then begin
          xlin:='E//Estación:  '+QL_CupoNombreEstacion.AsString;
          BndDt.Items.Add(xlin);
        end;
        while (QL_CupoEstacion.AsInteger=xest)and not(QL_Cupo.Eof) do begin
          xserie:=QL_CupoSerie.AsInteger;
          xdescripserie:=QL_CupoDescripcionSerie.AsString;
          xlin:='S//'+QL_CupoDescripcionSerie.AsString;
          if ComboBox2.ItemIndex=0 then
            BndDt.Items.Add(xlin);
          xfolio:=0;
          xtipo:='';
          while (QL_CupoSerie.AsInteger=xserie)and not(QL_Cupo.Eof)and(xest=QL_CupoEstacion.AsInteger) do begin
            if ComboBox2.ItemIndex=0 then begin
              xlin:='D// //'+InttoClaveNum(QL_CupoFolio.AsInteger,8)+'//';
              if (QL_CupoSerieFac.AsString=xtipo)and(QL_CupoFolioFac.AsInteger=xfolio) then
                xlin:=xlin+'// //  // //'
              else
                xlin:=xlin+QL_CupoSerieFac.AsString+'-'+IntToClaveNum(QL_CupoFolioFac.AsInteger,6)+'//'+FechaPaq(QL_CupoFechaVenta.AsDateTime)+'//'+
                           IntToClaveNum(QL_CupoNoCliente.AsInteger,6)+'//'+QL_CupoNombreCliente.AsString+'//';
              xlin:=xlin+FormatoMoneda(QL_CupoImporte.AsFloat);
              BndDt.Items.Add(xlin);
            end;
            FAvance.AvanzaPosicion;
            xest:=QL_CupoEstacion.AsInteger;
            xserie:=QL_CupoSerie.AsInteger;
            xfolio:=QL_CupoFolioFac.AsInteger;
            xtipo:=QL_CupoSerieFac.AsString;
            tot[1]:=tot[1]+QL_CupoImporte.AsFloat;
            QL_Cupo.Next;
          end;
          if ComboBox2.ItemIndex=0 then
            xlin:='T// // // // // //Total '+xdescripserie+'//'+FormatoMoneda(tot[1])
          else
            xlin:=xlin+'// // // // // //'+FormatoMoneda(tot[1]);
          BndDt.Items.Add(xlin);
          tot[2]:=tot[2]+tot[1];
          tot[1]:=0;
        end;
        xlin:='T// // // // // //Total '+xdescripestacion+'//'+FormatoMoneda(tot[2]);
        tot[3]:=tot[3]+tot[2];
        tot[2]:=0;
        BndDt.Items.Add(xlin);
      end;
      xlin:='T// // // // // //Total General//'+FormatoMoneda(tot[3]);
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP03.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
  with DMGEN,FLIQREP03P do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    if not CheckBox1.Checked then
      QRLRep.Caption:=Caption+'    '+DBLookUpComboBox2.Text;
    QRLRango.Caption:='Venta:   '+rangofecha(VgFechaini,VgFechafin)+  '      Recuperados hasta:  '+FechaAlf(StrToDate(MaskEdit1.text));
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;
end;

procedure TFLIQREP03.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if xtp in ['T','E','S'] then Font.Style:=[fsBold];
        if xtp='E' then begin
          Font.Size:=9;
          Font.Color:=StringtoColor(DMGEN.QT_EmprColor.Asstring);
        end;
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
      TQRShape(FindComponent('QRShape'+IntToStr(k))).Enabled:=swenabled;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(11,17);
  HabilitaShapes(10,10,false);
  ExtraeEtiquetas(11,17);
  Case xtp of
    'E':if (FLIQREP03P.CheckBox1.Checked)and(QuickRep1.PageNumber>1) then
          QuickRep1.NewPage;
    'T':HabilitaShapes(10,10,true);
  end;
end;

procedure TFLIQREP03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QL_Cupo.Close;
end;

procedure TFLIQREP03.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

end.
