unit ULIQREP02;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

type
  TFLIQREP02 = class(TForm)
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
    QRShape21: TQRShape;
    QL_Cupo: TQuery;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape2: TQRShape;
    QRLabel177: TQRLabel;
    QRShape23: TQRShape;
    QRShape27: TQRShape;
    QRLabel17: TQRLabel;
    TT_AuxiMatriz: TFloatField;
    TT_AuxiSucJiq: TFloatField;
    TT_AuxiSucObr: TFloatField;
    TT_AuxiSucMoch: TFloatField;
    TT_AuxiSucRam: TFloatField;
    QL_CupoFOLIO: TIntegerField;
    QL_CupoIMPORTE: TFloatField;
    QL_CupoESTACION: TIntegerField;
    QL_CupoESTACIONRECUP: TIntegerField;
    QL_CupoFECHARECUP: TDateTimeField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure CreaTablaTemp;
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

var
  FLIQREP02: TFLIQREP02;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, UAVANCE, DDMCUP, DDMGEN_VTAS, DDMGAS, DDMGASQ,
  ULIQREP02P;

{$R *.DFM}

procedure TFLIQREP02.PreparaReporte;
var tot:Array[1..7] of double;
    i:word;
    totsvf,totjiq:double;
begin
  with DMGEN,DMCUP,DMGAS,FLIQREP02P do begin
    InicializaTemp(TT_Auxi);
    CreaTablaTemp;
    QL_Cupo.Close;
    QL_Cupo.SQL.Clear;
    QL_Cupo.SQL.Add('Select Folio,FechaRecup,Importe,Estacion,EstacionRecup from DGASCUPO');
    QL_Cupo.SQL.Add('Where fecharecup>=:pfechaini and fecharecup<=:pfechafin');
    if not CheckBox1.Checked then begin
      QL_Cupo.SQL.Add('and estacionrecup=:pestacion');
      QL_Cupo.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
    end;
    QL_Cupo.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Cupo.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Cupo.Prepare;
    QL_Cupo.Open;
    FAvance.PreparaAvance('Preparando reporte...',true,QL_Cupo.RecordCount);
    try
      while not QL_Cupo.Eof do begin
        if not TT_Auxi.Locate('Fecha',QL_CupoFechaRecup.AsDateTime,[]) then begin
          TT_Auxi.Insert;
          TT_AuxiFecha.AsDateTime:=QL_CupoFechaRecup.AsDateTime;
          Case QL_CupoEstacion.Asinteger of
            1:TT_AuxiMatriz.AsFloat:=QL_CupoImporte.AsFloat;
            2:TT_AuxiSucJiq.AsFloat:=QL_CupoImporte.AsFloat;
            3:TT_AuxiSucObr.AsFloat:=QL_CupoImporte.AsFloat;
            4:TT_AuxiSucRam.AsFloat:=QL_CupoImporte.AsFloat;
            5:TT_AuxiSucMoch.AsFloat:=QL_CupoImporte.AsFloat;
          end;
        end
        else begin
          TT_Auxi.Edit;
          Case QL_CupoEstacion.Asinteger of
            1:TT_AuxiMatriz.AsFloat:=TT_AuxiMatriz.AsFloat+QL_CupoImporte.AsFloat;
            2:TT_AuxiSucJiq.AsFloat:=TT_AuxiSucJiq.AsFloat+QL_CupoImporte.AsFloat;
            3:TT_AuxiSucObr.AsFloat:=TT_AuxiSucObr.AsFloat+QL_CupoImporte.AsFloat;
            4:TT_AuxiSucRam.AsFloat:=TT_AuxiSucRam.AsFloat+QL_CupoImporte.AsFloat;
            5:TT_AuxiSucMoch.AsFloat:=TT_AuxiSucMoch.AsFloat+QL_CupoImporte.AsFloat;
          end;
        end;
        try
          TT_Auxi.Post;
        except
          raise Exception.Create('Fecha ya existe');
        end;
        FAvance.AvanzaPosicion;
        QL_Cupo.Next;
      end;
    finally
      FAvance.Close;
    end;
    BndDt.Items.Clear;
    for i:=1 to 7 do
      tot[i]:=0;
    totsvf:=0; totjiq:=0;
    TT_Auxi.First;
    while not TT_Auxi.Eof do begin
      tot[1]:=tot[1]+TT_AuxiMatriz.AsFloat;
      tot[2]:=tot[2]+TT_AuxiSucJiq.AsFloat;
      tot[3]:=tot[3]+TT_AuxiSucObr.AsFloat;
      totsvf:=TT_AuxiMatriz.AsFloat+TT_AuxiSucJiq.AsFloat+TT_AuxiSucObr.AsFloat;
      tot[4]:=tot[4]+totsvf;
      tot[5]:=tot[5]+TT_AuxiSucRam.AsFloat;
      tot[6]:=tot[6]+TT_AuxiSucMoch.AsFloat;
      totjiq:=TT_AuxiSucRam.AsFloat+TT_AuxiSucMoch.AsFloat;
      tot[7]:=tot[7]+totjiq;
      xlin:='D//'+FechaPaq(TT_AuxiFecha.AsDateTime)+'//'+
                  FormatoMoneda(TT_AuxiMatriz.AsFloat)+'//'+
                  FormatoMoneda(TT_AuxiSucJiq.AsFloat)+'//'+
                  FormatoMoneda(TT_AuxiSucObr.AsFloat)+'//'+
                  FormatoMoneda(totsvf)+'//'+
                  FormatoMoneda(TT_AuxiSucRam.AsFloat)+'//'+
                  FormatoMoneda(TT_AuxiSucMoch.AsFloat)+'//'+
                  FormatoMoneda(totjiq);
      BndDt.Items.Add(xlin);
      TT_Auxi.Next;
    end;
    xlin:='T// //';
    for i:=1 to 7 do
      xlin:=xlin+FormatoMoneda(tot[i])+'//';
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQREP02.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
  with DMGEN,DMGAS,DMGASQ,FLIQREP02P do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    if idSist=idGas then begin
      if not CheckBox1.Checked then
         QRLRep.Caption:=Caption+'   Sucursal: '+T_EstsDescripcion.AsString
      else
         QRLRep.Caption:=Caption;
    end
    else begin
      QRLRep.Caption:=Caption+'   Sucursal: '+QT_EstsDescripcion.AsString
    end;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
end;

procedure TFLIQREP02.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP02.BndDtBeforePrint(Sender: TQRCustomBand;
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
  InicializaEtiquetas(10,17);
  HabilitaShapes(21,27,false);
  ExtraeEtiquetas(10,17);
  Case xtp of
    'T':HabilitaShapes(21,27,true);
  end;
end;

procedure TFLIQREP02.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Fecha', ftDateTime, 0, True);
      Add('Matriz', ftFloat,0,false);
      Add('SucJiq', ftFloat,0,false);
      Add('SucObr', ftFloat,0,false);
      Add('SucRam', ftFloat,0,false);
      Add('SucMoch', ftFloat,0,false);
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



procedure TFLIQREP02.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Cupo.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
  end;
end;

end.
