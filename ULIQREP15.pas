unit ULIQREP15;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS;

type
  TFLIQREP15 = class(TForm)
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
    ChBEnca: TQRChildBand;
    BndDt: TQRStringsBand;
    ChildBand1: TQRChildBand;
    QL_Dliqp: TQuery;
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_DliqpESTACION: TIntegerField;
    QL_DliqpFOLIO: TIntegerField;
    QL_DliqpIMPORTE: TFloatField;
    QL_DliqpDESPACHADOR: TIntegerField;
    QL_Tpa: TQuery;
    QL_TpaCLAVE: TStringField;
    QL_DliqpFECHA: TDateTimeField;
    QL_Desp: TQuery;
    QL_DespCLAVE: TIntegerField;
    QL_DespNOMBRE: TStringField;
    QL_DespCTACNT: TStringField;
    QL_DespESTACION: TIntegerField;
    TT_Auxi: TRxMemoryData;
    TT_AuxiNoReg: TIntegerField;
    TT_AuxiClave: TIntegerField;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiFolio: TIntegerField;
    TT_AuxiFaltante: TFloatField;
    TT_AuxiSobrante: TFloatField;
    TT_AuxiNombre: TStringField;
    TT_AuxiDiferencia: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RxMemoryData1CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  xLeft=8;
  NoEti=5;

var
  FLIQREP15: TFLIQREP15;
  xtp:char;
  xlin:string;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP15P, UAVANCE;

{$R *.DFM}

procedure TFLIQREP15.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=78;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Fecha';
        2:Caption:='Liquidación';
        3:Caption:='Faltante';
        4:Caption:='Sobrante';
        5:Caption:='Diferencia';
      end;
      Case i of
        1:xw:=90;
        2:xw:=80;
        3..5:xw:=90;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      if i=1 then Alignment :=taLeftJustify
      else Alignment :=taCenter;
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
      Tag       :=xl;
      if i<3 then Alignment :=taLeftJustify
      else Alignment :=taRightJustify;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=false;
      Frame.Width:=1;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP15.PreparaReporte;
var xno,xclave,i:integer;
    totd,totg:Array[1..3] of real;
begin
  with DMGEN,DMLIQ,DMGAS,FLIQREP15P do begin
    QL_Tpa.Close;
    QL_Tpa.Prepare;
    QL_Tpa.Open;
    if QL_Tpa.IsEmpty then begin
      raise Exception.Create('No existe Tipo de Pago Faltantes');
//      MensajeErr('No existe Tipo de Pago Faltantes');
//      FLIQREP15.Close;
    end;
    CreaEtiquetas;
    TT_Auxi.Active:=true;
    BndDt.Items.Clear;
    for i:=1 to 3 do begin
      totd[i]:=0;
      totg[i]:=0;
    end;
    xno:=0;
    QL_Desp.Close;
    QL_Desp.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
    QL_Desp.Prepare;
    QL_Desp.Open;

    QL_TPa.First;
    while not QL_Tpa.Eof do begin
      QL_Dliqp.Close;
      QL_Dliqp.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
      QL_Dliqp.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
      QL_Dliqp.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
      QL_Dliqp.ParamByName('pClave_Pago').AsString:=QL_TpaClave.AsString;
      QL_Dliqp.Prepare;
      QL_Dliqp.Open;
      FAvance.PreparaAvance('Clasificando movimientos...',true,QL_Dliqp.RecordCount);
      try
        while not QL_Dliqp.Eof do begin
          TT_Auxi.Insert;
          TT_AuxiNoReg.AsInteger:=xno;
          TT_AuxiClave.AsInteger:=QL_DliqpDespachador.AsInteger;
          TT_AuxiFecha.AsDateTime:=QL_DliqpFecha.AsDateTime;
          TT_AuxiFolio.AsInteger:=QL_DliqpFolio.AsInteger;
          TT_AuxiSobrante.AsFloat:=0;
          TT_AuxiFaltante.AsFloat:=0;
          if QL_DliqpImporte.AsFloat>0.001 then
            TT_AuxiFaltante.AsFloat:=QL_DliqpImporte.AsFloat
          else
            TT_AuxiSobrante.AsFloat:=QL_DliqpImporte.AsFloat;
          TT_Auxi.Post;
          inc(xno);
          FAvance.AvanzaPosicion;
          QL_Dliqp.Next;
        end;
      finally
        FAvance.Close;
      end;
      QL_Tpa.Next;
    end;
    TT_Auxi.SortOnFields('Clave',true,false);
    TT_Auxi.First;
    FAvance.PreparaAvance('Generando reporte...',true,TT_Auxi.RecordCount);
    try
      while not TT_Auxi.Eof do begin
        xlin:='E//'+IntToClaveNum(TT_AuxiClave.AsInteger,3)+'  '+TT_AuxiNombre.AsString;
        BndDt.Items.Add(xlin);
        xclave:=TT_AuxiClave.AsInteger;
        while (xclave=TT_AuxiClave.AsInteger)and(not TT_Auxi.Eof) do begin
          xlin:='D//'+FechaPaq(TT_AuxiFecha.AsDateTime)+'//'+
                      IntToClaveNum(TT_AuxiFolio.AsInteger,8)+'//'+
                      FormatoMoneda(TT_AuxiFaltante.AsFloat)+'//'+
                      FormatoMoneda(TT_AuxiSobrante.AsFloat)+'//'+
                      FormatoMoneda(TT_AuxiDiferencia.AsFloat);
          BndDt.Items.Add(xlin);
          totd[1]:=totd[1]+TT_AuxiFaltante.AsFloat;
          totd[2]:=totd[2]+TT_AuxiSobrante.AsFloat;
          totd[3]:=totd[3]+TT_AuxiDiferencia.AsFloat;
          xclave:=TT_AuxiClave.AsInteger;
          FAvance.AvanzaPosicion;
          TT_Auxi.Next;
        end;
        xlin:='T// // //';
        for i:=1 to 3 do begin
          xlin:=xlin+FormatoMoneda(totd[i])+'//';
          totg[i]:=totg[i]+totd[i];
          totd[i]:=0;
        end;
        BndDt.Items.Add(xlin);
      end;
    finally
      FAvance.Close;
      xlin:='T// // //';
      for i:=1 to 3 do begin
        xlin:=xlin+FormatoMoneda(totg[i])+'//';
      end;
      BndDt.Items.Add(xlin);
    end;
  end;
end;

procedure TFLIQREP15.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP15P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP15.BndDtBeforePrint(Sender: TQRCustomBand;
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
        Left:=Tag;
        if xtp='E' then begin
          Font.Style:=[fsbold];
          if k=1 then Autosize:=true;
          if k=2 then Left:=900;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>2 then Frame.DrawTop:=true
          else Frame.DrawTop:=false;
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

procedure TFLIQREP15.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP15.RxMemoryData1CalcFields(DataSet: TDataSet);
begin
  TT_AuxiDiferencia.AsFloat:=TT_AuxiFaltante.AsFloat-abs(TT_AuxiSobrante.AsFloat);
end;

procedure TFLIQREP15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
