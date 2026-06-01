unit ULIQREP10;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

type
  TFLIQREP10 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLSistema: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel3: TQRLabel;
    QL_Dliqp: TQuery;
    QL_Tpag: TQuery;
    QL_TpagCLAVE: TStringField;
    QL_TpagCLASE: TStringField;
    QL_DliqpFECHA: TDateTimeField;
    QL_DliqpCLAVE_PAGO: TStringField;
    QL_DliqpIMPORTE: TFloatField;
    QL_DliqpClase: TStringField;
    QRLFechaHora: TQRLabel;
    TT_Auxi: TTable;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiCredito: TFloatField;
    TT_AuxiTotal: TFloatField;
    TT_AuxiContado: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ModoRep:integer;
    procedure CreaTablaTemp;
  public
    { Public declarations }
    procedure PreparaReporte(xModo:integer);
  end;

var
  FLIQREP10: TFLIQREP10;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMCUP, DDMGAS, DDMGASQ, ULIQREP10P,
  UAVANCE;

{$R *.DFM}

procedure TFLIQREP10.PreparaReporte;
var i:word;
    tot:array[1..3] of real;
    ajuste:real;
begin
  with DMGEN do begin
    ModoRep:=xModo;
    InicializaTemp(TT_Auxi);
    CreaTablaTemp;
    for i:=1 to 3 do
      tot[i]:=0;
    QL_Dliqp.Close;
    QL_Dliqp.ParamByName('pestacion').asinteger:= FLIQREP10P.DBLookupComboBox2.KeyValue;
    QL_Dliqp.ParamByName('pfechaini').AsDate:=VgFechaIni;
    QL_Dliqp.ParamByName('pfechafin').AsDate:=VgFechaFin;
    QL_Dliqp.Open;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Dliqp.RecordCount);
      while not QL_Dliqp.Eof do begin
        if TT_Auxi.Locate('Fecha',QL_DliqpFecha.AsDateTime,[]) then begin
          TT_Auxi.Edit;
          if QL_DliqpClase.AsString=idClaseCredito then
            TT_AuxiCredito.AsFloat:=TT_AuxiCredito.AsFloat+QL_DliqpImporte.AsFloat
          else
            TT_AuxiContado.AsFloat:=TT_AuxiContado.AsFloat+QL_DliqpImporte.AsFloat;
        end
        else begin
          TT_Auxi.Insert;
          TT_AuxiFecha.AsDateTime:=QL_DliqpFecha.AsDateTime;
          if QL_DliqpClase.AsString=idClaseCredito then
            TT_AuxiCredito.AsFloat:=QL_DliqpImporte.AsFloat
          else
            TT_AuxiContado.AsFloat:=QL_DliqpImporte.AsFloat;
        end;
        TT_Auxi.Post;
        FAvance.AvanzaPosicion;
        QL_Dliqp.Next;
      end;
    finally
      FAvance.Close;
    end;
    TT_Auxi.First;
    try
      FAvance.PreparaAvance('Generando reporte...',true,TT_Auxi.RecordCount);
      while not TT_Auxi.Eof do begin
        if ModoRep=0 then with DMGAS do begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(Total) as Real1 from DGASAJUD2');
          Q_Auxi.SQL.Add('Where Estacion='+IntToStr(FLIQREP10P.DBLookupComboBox2.KeyValue));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(TT_AuxiFecha.AsDateTime)+'"');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          ajuste:=Q_AuxiReal1.AsFloat;
        end
        else ajuste:=0;
        xlin:='D//'+FechaPaq(TT_AuxiFecha.AsDateTime)+'//'+
                    FormatoMoneda(TT_AuxiContado.AsFloat-ajuste)+'//'+
                    FormatoMoneda(TT_AuxiCredito.AsFloat)+'//'+
                    FormatoMoneda(TT_AuxiTotal.AsFloat-ajuste)+'//';
        BndDt.Items.Add(xlin);
        tot[1]:=tot[1]+TT_AuxiContado.AsFloat-ajuste;
        tot[2]:=tot[2]+TT_AuxiCredito.AsFloat;
        tot[3]:=tot[3]+TT_AuxiTotal.AsFloat-ajuste;
        FAvance.AvanzaPosicion;
        TT_Auxi.Next;
      end;
    finally
      FAvance.Close;
      xlin:='T// //';
      for i:=1 to 3 do
        xlin:=xlin+FormatoMoneda(tot[i])+'//';
      BndDt.Items.Add(xlin);
    end;
  end;
end;

procedure TFLIQREP10.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ,DMGAS do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=FLIQREP10.Caption;
    QRLEnca.Caption:=FLIQREP10P.DBLookupComboBox2.Text;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;
  if ModoRep=0 then
    QRLSistema.Caption:=IdSistNombre
  else
    QRLSistema.Caption:='';
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP10.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if (xtp='T')or(xtp='M') then Font.Style:=[fsBold];
        if (xtp='T')and(k>11) then Frame.DrawTop:=true;
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
  InicializaEtiquetas(11,14);
  ExtraeEtiquetas(11,14);
end;

procedure TFLIQREP10.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Fecha', ftDateTime, 0, True);
      Add('Contado', ftFloat,0,false);
      Add('Credito', ftFloat,0,false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'Fecha', [ixPrimary, ixUnique]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.IndexFieldNames:='';
    TT_Auxi.Active:=true;
  end;
end;


procedure TFLIQREP10.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Dliqp.Close;
    EliminaTemp(TT_Auxi);
  end;
end;

procedure TFLIQREP10.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  TT_AuxiTotal.AsFloat:=TT_AuxiContado.AsFloat+TT_AuxiCredito.AsFloat;
end;

end.
