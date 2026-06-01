unit UCXPREP01x;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QRExport, QRPDFFilt, Printers;

type
  TFCXPREP01 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel20: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QL_Deud: TQuery;
    QRDBText2: TQRDBText;
    QL_DeudNOPROV: TIntegerField;
    QL_DeudNOMBRE: TStringField;
    QL_DeudTIPOPROV: TIntegerField;
    QL_DeudMONEDA: TStringField;
    QL_DeudPLAZO: TIntegerField;
    QL_DeudMES: TStringField;
    QL_DeudTIPOPOLIZA: TStringField;
    QL_DeudNOPOLIZA: TIntegerField;
    QL_DeudTIPOMOV: TStringField;
    QL_DeudFOLIO: TIntegerField;
    QL_DeudFECHA: TDateTimeField;
    QL_DeudFECHADOC: TDateTimeField;
    QL_DeudFECVENCE: TDateTimeField;
    QL_DeudCONCEPTO: TStringField;
    QL_DeudIMPORTE: TFloatField;
    QL_DeudPARIDAD: TFloatField;
    QL_DeudIMPORTEMN: TFloatField;
    QL_DeudTOTALPAGOS: TFloatField;
    QL_DeudSALDADO: TStringField;
    QL_DeudAPLICADO: TStringField;
    QL_DeudSaldo: TFloatField;
    QL_DeudFechaPaq: TStringField;
    QL_DeudFechaPaqVence: TStringField;
    QL_DeudMovimiento: TStringField;
    QRGroup1: TQRGroup;
    QRDBText6: TQRDBText;
    QL_DeudNombreGrupo: TStringField;
    QRDBText7: TQRDBText;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRDBText10: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRBand6: TQRBand;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel15: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel19: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand7: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRRTFFilter1: TQRRTFFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFechaPrint(sender: TObject; var Value: String);
    procedure QRLabel67Print(sender: TObject; var Value: String);
    procedure QL_DeudCalcFields(DataSet: TDataSet);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand6AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

var
  FCXPREP01: TFCXPREP01;
  totp, totg, total:double;
  noregs: word;

implementation

uses DDMCXP, DDMCNT, DDMGEN, ULIBGRAL, UCXPREP01P, ULIBDATABASE, UGEN_NET;

{$R *.DFM}


procedure TFCXPREP01.PreparaReporte;
begin
  with DMCXP, FCXPREP01P do begin

    QL_Deud.close;
    QL_Deud.SQL.Clear;
    QL_Deud.SQL.Add('Select * from DGENPROV p, DCXPDEUD d');
    QL_Deud.SQL.Add('Where p.NoProv=d.Noprov and ');
    QL_Deud.SQL.Add('      p.moneda=:pmoneda and');
    if not swtodos then
      QL_Deud.SQL.Add('      p.noprov=:pprov and');
    QL_Deud.SQL.Add('      d.Aplicado="Si" and ');
    QL_Deud.SQL.Add('      d.Saldado="No" and ');
    QL_Deud.SQL.Add('      d.fecVence>=:pfecini and  ');
    QL_Deud.SQL.Add('      d.fecVence<=:pfecfin  ');

    if RBPorGrupo.Checked then begin
      QL_Deud.SQL.Add(' and  p.TipoProv>=:ptipoini and');
      QL_Deud.SQL.Add('      p.TipoProv<=:ptipofin ');
      QL_Deud.ParamByName('ptipoini').asinteger:=StrToInt(MaskEdit5.Text);
      QL_Deud.ParamByName('ptipofin').asinteger:=StrToInt(MaskEdit6.Text);
      if ComboBox2.ItemIndex=1 then
        QL_Deud.SQL.Add('Order by p.tipoprov,p.Nombre,d.fecvence')
      else
        QL_Deud.SQL.Add('Order by p.tipoprov,p.NoProv,d.fecvence');
      QRLabel19.Enabled:=false;
      QRDBText1.Enabled:=false;
      QRLabel14.Left:=240;
      QRDBText5.Left:=240;
    end
    else begin
      if ComboBox2.ItemIndex=1 then
        QL_Deud.SQL.Add('Order by d.fecvence,p.Nombre')
      else
        QL_Deud.SQL.Add('Order by d.fecvence,p.NoProv');
      QRGroup1.Enabled:=false;
      QRGroup2.Enabled:=false;
      QRBand5.Enabled:=false;
      QRBand6.Enabled:=false;
      ChildBand1.Enabled:=false;
    end;
    if not swtodos then
      QL_Deud.ParamByName('pprov').asinteger:=xprov;
    QL_Deud.ParamByName('pmoneda').asstring:=DBLookupComboBox1.KeyValue;
    QL_Deud.ParamByName('pfecini').asdatetime:=VgFechaIni;
    QL_Deud.ParamByName('pfecfin').asdatetime:=VgFechaFin;
    QL_Deud.Prepare;
    QL_Deud.Open;
  end;
end;

procedure TFCXPREP01.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN,FCXPREP01P do begin
    QRLabel1.Caption:=QT_EmprRazonSocial.AsString;
    QRLabel2.Caption:=QT_EmprDireccion.AsString;
    QRLabel5.Caption:=QT_EmprPoblacion.AsString;
    QRLabel6.CAption:=QT_EmprRFC.AsString;
    QRLabel7.Caption:=Caption;
    QRLabel8.Caption:=rangofecha(VgFechaIni,VgFechaFin);
    QRLabel18.Caption:=DBLookUpComboBox1.Text;
  end;

end;

procedure TFCXPREP01.QRFechaPrint(sender: TObject; var Value: String);
begin
  Value:=FechaPaq(date);
end;

procedure TFCXPREP01.QRLabel67Print(sender: TObject; var Value: String);
begin
  with DMGEN do
    Value:=QT_SistNombre.Asstring+' Imagen'
end;

procedure TFCXPREP01.QL_DeudCalcFields(DataSet: TDataSet);
begin
  with FCXPREP01P do begin
    if QL_Clas.Locate('ClaveClasif',QL_DeudTipoProv.Asinteger,[]) then
      QL_DeudNombreGrupo.Asstring:=QL_ClasDescripcion.AsString
    else
      QL_DeudNombreGrupo.Asstring:='Clave de Clasificación No encontrada'
  end;
  with DMGEN do begin
    QL_DeudSaldo.AsFloat:=QL_DeudImporte.AsFloat-QL_DeudTotalPagos.AsFloat;
    QL_DeudFechaPaq.AsString:=fechapaq(QL_DeudFechaDoc.Asdatetime);
    QL_DeudFechaPaqVence.AsString:=fechapaq(QL_DeudFecVence.Asdatetime);
    QL_DeudMovimiento.AsString:=QL_DeudTipoMov.AsString+'-'+IntToClaveDocu(QL_DeudFolio.Asinteger,idDeud);
  end;
end;

procedure TFCXPREP01.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
  totp:=0;
  totg:=0;
  total:=0;
end;

procedure TFCXPREP01.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  totp:=totp+QL_DeudSaldo.Asfloat;
  noregs:=noregs+1;
end;

procedure TFCXPREP01.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if noregs > 1 then begin
    QRShape1.Enabled:=true;
    QRLabel3.Caption:=FormatoMoneda(totp);
  end
  else begin
    QRLabel3.Caption:='';
    QRShape1.Enabled:=false;
  end;  
end;

procedure TFCXPREP01.QRBand6AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  totg:=totg+totp;
  totp:=0;
end;

procedure TFCXPREP01.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel4.Caption:=FormatoMoneda(totg);
end;

procedure TFCXPREP01.QRBand5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  total:=total+totg;
  totg:=0;
end;

procedure TFCXPREP01.FormDestroy(Sender: TObject);
begin
  QL_Deud.Close;
end;

procedure TFCXPREP01.QRDBText1Print(sender: TObject; var Value: String);
begin
  Value:=copy(value,1,35);
end;

procedure TFCXPREP01.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  noregs:=0;
end;

procedure TFCXPREP01.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel15.Caption:=formatomoneda(total);
end;

procedure TFCXPREP01.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

end.
