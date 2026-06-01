unit ULIQREP11;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport;

type
  TFLIQREP11 = class(TForm)
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
    QL_Dliqp: TQuery;
    QRLEstacion: TQRLabel;
    QL_Dtpag: TQuery;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    ChBEnca: TQRChildBand;
    QL_DliqpESTACION: TIntegerField;
    QL_DliqpFECHA: TDateTimeField;
    QL_DliqpCLAVE_PAGO: TStringField;
    QL_DliqpDesglosa: TStringField;
    DSQL_Dliqp: TDataSource;
    QL_DliqpDescripcionPago: TStringField;
    QL_DliqpFOLIO: TIntegerField;
    QL_DtpagESTACION: TIntegerField;
    QL_DtpagFOLIO: TIntegerField;
    QL_DtpagCLAVE_PAGO: TStringField;
    QL_DtpagINDICE: TIntegerField;
    QL_DtpagCLIENTE: TIntegerField;
    QL_DtpagNOMBRE: TStringField;
    QL_DtpagREFERENCIA: TStringField;
    QL_DtpagIMPORTE: TFloatField;
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

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=5;

var
  FLIQREP11: TFLIQREP11;
  xtp:char;
  xlin:string;
  xAncho,xwid:integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIQREP11P, ULIBLICENCIAS;

{$R *.DFM}

procedure TFLIQREP11.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Fecha';
        2:Caption:='Cliente';
        3:Caption:='Nombre';
        4:Caption:='Referencia';
        5:Caption:='Importe';
      end;
      Case i of
        1:xw:=80;
        2:xw:=45;
        3:xw:=404;
        4:xw:=80;
        5:xw:=80;
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
      if i in [1..4] then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
  xwid:=xl;
end;

procedure TFLIQREP11.PreparaReporte;
var tot1,tot2:real;
    i:word;
    xtpag:string;
begin
  with DMGEN,DMLIQ,DMGAS,FLIQREP11P do begin
    xancho:=78;
    CreaEtiquetas;
    BndDt.Items.Clear;
    tot1:=0; tot2:=0;
    QL_Dliqp.Close;
    QL_Dliqp.SQL.Clear;
    QL_Dliqp.SQL.Add('Select Estacion,Folio,Fecha,Clave_Pago from DGASDLIQP');
    QL_Dliqp.SQL.Add('Where Estacion='+IntToStr(DBLookUpComboBox2.Keyvalue));
    QL_Dliqp.SQL.Add('  and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Dliqp.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    if not CheckBox1.Checked then
      QL_Dliqp.SQL.Add('and Clave_Pago="'+DBLookUpComboBox1.KeyValue+'"');
    QL_Dliqp.SQL.Add('Order by Clave_Pago,Fecha');
    QL_Dliqp.Prepare;
    QL_Dliqp.Open;
    while not QL_Dliqp.Eof do begin
      if QL_DliqpDesglosa.AsString='No' then begin
        QL_Dliqp.Next;
        Continue;
      end;
      xtpag:=QL_DliqpClave_Pago.AsString;
      xlin:='E//'+QL_DliqpClave_Pago.AsString+'-'+QL_DliqpDescripcionPago.AsString;
      BndDt.Items.Add(xlin);
      while (xtpag=QL_DliqpClave_Pago.AsString)and(not QL_Dliqp.Eof) do begin
        QL_Dtpag.Close;
        QL_Dtpag.Prepare;
        QL_Dtpag.Open;
        if not QL_Dtpag.IsEmpty then begin
          while not QL_Dtpag.Eof do begin
            xlin:='D//'+FechaPaq(QL_DliqpFecha.AsDateTime)+'//'+
                        IntToClaveCata(QL_DtpagCliente.AsInteger,idClie)+'//'+
                        Copy(QL_DtpagNombre.AsString,1,50)+'//'+
                        QL_DtpagReferencia.AsString+'//'+
                        FormatoMoneda(QL_DtpagImporte.AsFloat);
            BndDt.Items.Add(xlin);
            tot2:=tot2+QL_DtpagImporte.AsFloat;
            QL_Dtpag.Next;
          end;
        end;
        xtpag:=QL_DliqpClave_Pago.AsString;
        QL_Dliqp.Next;
      end;
      xlin:='T//';
      InsertaElemStr(FormatoMoneda(tot2),6,xlin);
      BndDt.Items.Add(xlin);
      tot1:=tot1+tot2;
      tot2:=0;
    end;

    xlin:='T// // //Total General';
    InsertaElemStr(FormatoMoneda(tot1),6,xlin);
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQREP11.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP11P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP11.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if xtp='E' then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k=5 then Frame.DrawTop:=true;
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
end;

procedure TFLIQREP11.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP11.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Dliqp.Close;
    QL_Dtpag.Close;
  end;
end;

end.
