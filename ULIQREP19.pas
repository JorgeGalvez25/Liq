unit ULIQREP19;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QRExport, Printers;

type
  TFLIQREP19 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLRango: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    QRRTFFilter1: TQRRTFFilter;
    QRLabel22: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRLabel26: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape6: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape7: TQRShape;
    QRLabel17: TQRLabel;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRExcelFilter1: TQRExcelFilter;
    QRLCuenta: TQRLabel;
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    pcuenta:string;
    procedure PreparaReporte;
  end;

var
  FLIQREP19: TFLIQREP19;
  xlin:string;
  xtp:char;

implementation

uses DDMCNT, DDMGEN, ULIBGRAL,ULIQREP19P, ULIBDATABASE, DDMGENQ,
  DDMGENP, UGEN_NET, UAVANCE, DDMGENT, DDMLIQ, DDMGAS;

{$R *.DFM}

procedure TFLIQREP19.PreparaReporte;
var imp,tot:Array[1..9] of real;
    xsaldo:TSaldoCnt;
    i,j,dias:word;
    xfecha:TDateTime;
    ximporte:real;
begin
  with DMGEN,DMCNT,DMLIQ,DMGAS,FLIQREP19P do begin
    for i:=1 to 9 do begin
      imp[i]:=0;
      tot[i]:=0;
    end;
    BndDt.Items.Clear;
    ximporte:=0;
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Sum(Total) as Real1 from DGASPVAL');
    Q_Auxi.SQL.Add('where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    Q_Auxi.SQL.Add('  and Fecha<"'+FechaToStrSQL(VgFechaIni)+'"');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    ximporte:=Q_AuxiReal1.AsFloat;
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Sum(Total) as Real1 from DGASPVAL');
    Q_Auxi.SQL.Add('where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    Q_Auxi.SQL.Add('  and Facturado="Si" and FechaFactura<"'+FechaToStrSQL(VgFechaIni)+'"');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    ximporte:=ximporte-Q_AuxiReal1.AsFloat;
    imp[7]:=ximporte;
    SaldoCntCtasF(pCuenta,VgFechaIni,VgFechaFin,xsaldo);
    imp[8]:=abs(xsaldo.SaldoIni);
    imp[9]:=imp[7]-imp[8];
    xlin:='D//Saldo Inicial//';
    for i:=7 to 9 do
      InsertaElemStr(FormatoMoneda(imp[i]),i+2,xlin);
    BndDt.Items.Add(xlin);
    xfecha:=VgFechaIni;
    dias:=DiasEntre(VgFechaIni,VgFechaFin)+1;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,dias);
      for i:=1 to dias do begin
        SaldoCntCtasF(pCuenta,xfecha,xfecha,xsaldo);
        imp[2]:=xsaldo.CargosPer;
        imp[5]:=xsaldo.AbonosPer;
        imp[8]:=abs(xsaldo.SaldoFin);
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Sum(Total) as Real1 from DGASPVAL');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(xfecha)+'"');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        imp[1]:=Q_AuxiReal1.AsFloat;
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Sum(Total) as Real1 from DGASPVAL');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
        Q_Auxi.SQL.Add('  and FechaFactura="'+FechaToStrSQL(xfecha)+'"');
        Q_Auxi.SQL.Add('  and Facturado="Si" ');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        imp[4]:=Q_AuxiReal1.AsFloat;
        imp[3]:=imp[1]-imp[2];
        imp[6]:=imp[4]-imp[5];
        imp[7]:=imp[7]+imp[1]-imp[4];
//        imp[8]:=imp[8]+imp[2]-imp[5];
        imp[9]:=imp[7]-imp[8];
        xlin:='D//'+FechaPaq(xfecha)+'//';
        for j:=1 to 9 do begin
          InsertaElemStr(FormatoMoneda(imp[j]),j+2,xlin);
          if j<7 then tot[j]:=tot[j]+imp[j]
          else tot[j]:=imp[j];
        end;
        BndDt.Items.Add(xlin);
        xfecha:=Incfecha(xfecha,1);
        FAvance.AvanzaPosicion;
      end;
    finally
      xlin:='T// //';
      for i:=1 to 9 do
        xlin:=xlin+FormatoMoneda(tot[i])+'//';
      BndDt.Items.Add(xlin);
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP19.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Font.Size:=8;
        Frame.DrawTop:=false;
        if xtp='T' then
          Frame.DrawTop:=true;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k-ri+2)
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
  InicializaEtiquetas(21,30);
  ExtraeEtiquetas(21,30);
end;

procedure TFLIQREP19.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
  with DMGEN do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLRango.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
    QRLCuenta.Caption:='Cuenta: '+FormatoCuenta(pcuenta);
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VarGenFechaHoraRepos);
  end;

end;

end.
