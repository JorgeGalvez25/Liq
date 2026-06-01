unit ULIQREP01;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQREP01 = class(TForm)
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
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape7: TQRShape;
    QRShape22: TQRShape;
    QRLabel12: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    TT_Auxi: TTable;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRShape13: TQRShape;
    QRLabel10: TQRLabel;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiCupPropios: TFloatField;
    TT_AuxiCupExternos: TFloatField;
    QRShape21: TQRShape;
    QL_Cupo: TQuery;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape5: TQRShape;
    QRShape9: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QL_CupoESTACION: TIntegerField;
    QL_CupoSERIE: TIntegerField;
    QL_CupoFOLIO: TIntegerField;
    QL_CupoFECHARECUP: TDateTimeField;
    QL_CupoIMPORTE: TFloatField;
    QL_CupoESTACIONRECUP: TIntegerField;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRTextFilter1: TQRTextFilter;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CreaTablaTemp;
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

var
  FLIQREP01: TFLIQREP01;
  xtp:char;
  xlin:string;
  piva:double;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, UAVANCE, DDMCUP, DDMGEN_VTAS, DDMGAS, DDMGASQ,
  ULIQREP01P;

{$R *.DFM}

procedure TFLIQREP01.PreparaReporte;
var ctacup,ctadeud,
    tpcup,tpdeud:string;
    totcup,totdeud,
    totr,totc:double;
    tot:Array[1..9] of double;
    i:word;
    LCtaDeud:TStringList;
    xfechaant:TDateTime;
begin
  with DMGEN,DMCUP,DMGAS,FLIQREP01P do begin
    if CheckBox1.Checked then piva:=1
    else piva:=1.16;
    try
      LCtaDeud:=TStringList.Create;
      LCtaDeud.Clear;
      ctacup:=VariableDeMemo(QL_CajaVarIni,'CtaCupones');
      ctadeud:=VariableDeMemo(QL_CajaVarIni,'CtaDeudores');
      tpcup:=VariableDeMemo(QL_CajaVarIni,'TPolCupones');
      tpdeud:=VariableDeMemo(QL_CajaVarIni,'TPolDeudores');
      for i:=1 to NoElemStr(ctadeud)do
        LCtaDeud.Add(ExtraeElemStr(ctadeud,i));
      InicializaTemp(TT_Auxi);
      CreaTablaTemp;
      QL_Cupo.Close;
      QL_Cupo.ParamByName('pestacionrecup').AsInteger:=DBLookUpComboBox2.KeyValue;
      QL_Cupo.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
      QL_Cupo.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
      QL_Cupo.Prepare;
      QL_Cupo.Open;
      FAvance.PreparaAvance('Preparando reporte...',true,QL_Cupo.RecordCount);
      try
        xfechaant:=VgFechaIni;
        while not QL_Cupo.Eof do begin
          while IncFecha(xfechaant,1)<QL_CupoFechaRecup.AsDateTime do begin
            xfechaant:=IncFecha(xfechaant,1);
            TT_Auxi.Insert;
            TT_AuxiFecha.AsDateTime:=xfechaant;
            TT_AuxiCupPropios.AsFloat:=0;
            TT_AuxiCupExternos.AsFloat:=0;
            TT_Auxi.Post;
          end;
          if not TT_Auxi.Locate('Fecha',QL_CupoFechaRecup.AsDateTime,[]) then begin
            TT_Auxi.Insert;
            TT_AuxiFecha.AsDateTime:=QL_CupoFechaRecup.AsDateTime;
            if QL_CupoEstacion.AsInteger in [1..3,6]then
              TT_AuxiCupPropios.AsFloat:=DivideFloat(QL_CupoImporte.AsFloat,piva)
            else
              TT_AuxiCupExternos.AsFloat:=DivideFloat(QL_CupoImporte.AsFloat,piva);
          end
          else begin
            TT_Auxi.Edit;
            if QL_CupoEstacion.AsInteger in [1..3,6] then
              TT_AuxiCupPropios.AsFloat:=TT_AuxiCupPropios.AsFloat+DivideFloat(QL_CupoImporte.AsFloat,piva)
            else
              TT_AuxiCupExternos.AsFloat:=TT_AuxiCupExternos.AsFloat+DivideFloat(QL_CupoImporte.AsFloat,piva);
          end;
          try
            TT_Auxi.Post;
          except
            raise Exception.Create('Fecha ya existe');
          end;
          FAvance.AvanzaPosicion;
          xfechaant:=QL_CupoFechaRecup.AsDateTime;
          QL_Cupo.Next;
        end;
        while xfechaant<VgFechaFin do begin
          xfechaant:=IncFecha(xfechaant,1);
          TT_Auxi.Insert;
          TT_AuxiFecha.AsDateTime:=xfechaant;
          TT_AuxiCupPropios.AsFloat:=0;
          TT_AuxiCupExternos.AsFloat:=0;
          TT_Auxi.Post;
        end;
      finally
        FAvance.Close;
      end;
      BndDt.Items.Clear;
      for i:=1 to 9 do
        tot[i]:=0;
      TT_Auxi.First;
      while not TT_Auxi.Eof do begin
        totcup:=0; totdeud:=0;
        with DMGEN do begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(ImpCargo) as Real1 from DCNTDPOL');
          Q_Auxi.SQL.Add('where Fecha="'+FechaToStrSQL(TT_AuxiFecha.AsDateTime)+'"');
          Q_Auxi.SQL.Add('  and Aplicado="Si"');
          Q_Auxi.SQL.Add('  and Cuenta="'+ctacup+'"');
          if tpcup<>'*' then
            Q_Auxi.SQL.Add('  and TipoPoliza="'+tpcup+'"');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          totcup:=Q_AuxiReal1.AsFloat;
          if CheckBox1.Checked then
            totcup:=AjustaFloat(totcup*1.16,2);
    //
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(ImpAbono) as Real1 from DCNTDPOL');
          Q_Auxi.SQL.Add('where Fecha="'+FechaToStrSQL(TT_AuxiFecha.AsDateTime)+'"');
          Q_Auxi.SQL.Add('  and Aplicado="Si"');
          Q_Auxi.SQL.Add('  and (Cuenta="'+LCtaDeud[0]+'"');
          for i:=1 to NoElemStr(ctadeud)-1 do
            Q_Auxi.SQL.Add('  or Cuenta="'+LCtaDeud[i]+'"');
          Q_Auxi.SQL.Add(')');
          if tpdeud<>'*' then
            Q_Auxi.SQL.Add('  and TipoPoliza="'+tpdeud+'"');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          totdeud:=Q_AuxiReal1.AsFloat;
          if CheckBox1.Checked then
            totdeud:=AjustaFloat(totdeud*1.16,2);
        end;
        totr:=TT_AuxiCupPropios.AsFloat+TT_AuxiCupExternos.AsFloat;
        totc:=totcup+totdeud;
        xlin:='D//'+FechaPaq(TT_AuxiFecha.AsDateTime)+'//'+
                    FormatoMoneda(TT_AuxiCupPropios.AsFloat)+'//'+FormatoMoneda(totcup)+'//'+
                    FormatoMoneda(TT_AuxiCupPropios.AsFloat-totcup)+'//'+
                    FormatoMoneda(TT_AuxiCupExternos.AsFloat)+'//'+FormatoMoneda(totdeud)+'//'+
                    FormatoMoneda(TT_AuxiCupExternos.AsFloat-totdeud)+'//'+
                    FormatoMoneda(totr)+'//'+FormatoMoneda(totc)+'//'+FormatoMoneda(totr-totc);
        tot[1]:=tot[1]+TT_AuxiCupPropios.AsFloat;
        tot[2]:=tot[2]+totcup;
        tot[3]:=tot[3]+(TT_AuxiCupPropios.AsFloat-totcup);
        tot[4]:=tot[4]+TT_AuxiCupExternos.AsFloat;
        tot[5]:=tot[5]+totdeud;
        tot[6]:=tot[6]+(TT_AuxiCupExternos.AsFloat-totdeud);
        tot[7]:=tot[7]+totr;
        tot[8]:=tot[8]+totc;
        tot[9]:=tot[9]+totr-totc;
        BndDt.Items.Add(xlin);
        TT_Auxi.Next;
      end;
      xlin:='T// //';
      for i:=1 to 9 do
        xlin:=xlin+FormatoMoneda(tot[i])+'//';
      BndDt.Items.Add(xlin);
{      BndDt.Items.Add('');
      xlin:='D// Total Recuperados: //'+FormatoMoneda(tot[1]+tot[4]);
      BndDt.Items.Add(xlin);
      xlin:='D// Total Contab.: //'+FormatoMoneda(tot[2]+tot[5]);
      BndDt.Items.Add(xlin);
      xlin:='D// Diferencia: //'+FormatoMoneda(tot[3]+tot[6]);
      BndDt.Items.Add(xlin);}
    finally
      LCtaDeud.Free;
    end;
  end;
end;

procedure TFLIQREP01.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN,DMGAS,FLIQREP01P do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption+'   Sucursal: '+T_EstsDescripcion.AsString;
    if CheckBox1.Checked then QRLRep.Caption:=Caption+'    (Iva Incluído)'
    else QRLRep.Caption:=Caption+'    (No incluye Iva)';
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
end;

procedure TFLIQREP01.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP01.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP01.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);


  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k-ri+2);
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
  InicializaEtiquetas(10,19);
  HabilitaShapes(21,29,false);
  ExtraeEtiquetas(10,19);
  Case xtp of
    'T':HabilitaShapes(21,29,true);
  end;
end;

procedure TFLIQREP01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN do begin
    QL_Cupo.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
  end;
end;

procedure TFLIQREP01.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Fecha', ftDateTime, 0, True);
      Add('CupPropios', ftFloat,0,false);
      Add('CupExternos', ftFloat,0,false);
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



end.
