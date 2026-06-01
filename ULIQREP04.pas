unit ULIQREP04;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables;

type
  TFLIQREP04 = class(TForm)
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
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape22: TQRShape;
    QRLabel12: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape12: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape21: TQRShape;
    QRShape23: TQRShape;
    QRShape9: TQRShape;
    QL_Cupo: TQuery;
    QL_CupoCUPVENDIDOS: TFloatField;
    QL_Facc: TQuery;
    QL_FaccCUPFACTURADOS: TFloatField;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel14: TQRLabel;
    TT_Auxi: TTable;
    TT_AuxiImporteVendido: TFloatField;
    TT_AuxiImporteFacturado: TFloatField;
    TT_AuxiNoReg: TIntegerField;
    QL_Cupo2: TQuery;
    QL_Facc2: TQuery;
    QL_Cupo2FOLIOFAC: TIntegerField;
    QL_Cupo2TOTAL: TFloatField;
    QL_Cupo2SERIEFAC: TStringField;
    QL_Facc2TIPOFAC: TStringField;
    QL_Facc2FOLIO: TIntegerField;
    QL_Facc2TOTAL: TFloatField;
    TT_AuxiTipoFac: TStringField;
    TT_AuxiFolioFac: TIntegerField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TT_AuxiFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaReporte;
    procedure CreaTablaTemp;
  end;

var
  FLIQREP04: TFLIQREP04;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, UAVANCE, DDMCUP, DDMGEN_VTAS, DDMGAS, DDMGASQ,
  ULIQREP04P;

{$R *.DFM}

procedure TFLIQREP04.PreparaReporte;
var i,dias,cont:integer;
    xfecha:TDatetime;
    totv,totf,dif:real;
begin
  with DMGEN,DMCUP,DMGAS,FLIQREP04P do begin
    if ComboBox2.ItemIndex>0 then begin
      InicializaTemp(TT_Auxi);
      CreaTablaTemp;
      cont:=1;
    end;
    BndDt.Items.Clear;
    dias:=DiasEntre(VgFechaIni,VgFechaFin);
    xfecha:=VgFechaIni; totv:=0; totf:=0;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,dias+1);
      for i:=1 to dias+1 do begin
        QL_Cupo.Close;
        QL_Cupo.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
        QL_Cupo.ParamByName('pcaja').AsInteger:=DBLookUpComboBox1.KeyValue;
        QL_Cupo.ParamByName('pfecha').AsDateTime:=xfecha;
        QL_Cupo.Prepare;
        QL_Cupo.Open;
        QL_Facc.Close;
        QL_Facc.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
        QL_Facc.ParamByName('pcaja').AsInteger:=DBLookUpComboBox1.KeyValue;
        QL_Facc.ParamByName('pfecha').AsDateTime:=xfecha;
        QL_Facc.Prepare;
        QL_Facc.Open;
        dif:=QL_CupoCupVendidos.AsFloat-QL_FaccCupFacturados.AsFloat;
        xlin:='D//'+FechaPaq(xfecha)+' // //'+FormatoMoneda(QL_CupoCupVendidos.AsFloat)+'//'+
                                              FormatoMoneda(QL_FaccCupFacturados.AsFloat)+'//'+
                                              FormatoMoneda(dif);
        if ComboBox3.ItemIndex=1 then BndDt.Items.Add(xlin)
        else if abs(dif)>0.001 then BndDt.Items.Add(xlin);
        totv:=totv+QL_CupoCupVendidos.Asfloat;
        totf:=totf+QL_FaccCupFacturados.Asfloat;
        if (ComboBox2.ItemIndex>0)and(abs(dif)>0.001) then begin
          while not TT_Auxi.IsEmpty do begin
            TT_Auxi.Delete;
          end;
          QL_Cupo2.Close;
          QL_Cupo2.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
          QL_Cupo2.ParamByName('pcaja').AsInteger:=DBLookUpComboBox1.KeyValue;
          QL_Cupo2.ParamByName('pfecha').AsDateTime:=xfecha;
          QL_Cupo2.Prepare;
          QL_Cupo2.Open;
          while not QL_Cupo2.Eof do begin
            TT_Auxi.Insert;
            TT_AuxiNoReg.AsInteger:=cont;
            TT_AuxiTipoFac.AsString:=QL_Cupo2SerieFac.AsString;
            TT_AuxiFolioFac.AsInteger:=QL_Cupo2FolioFac.AsInteger;
            TT_AuxiImporteVendido.AsFloat:=QL_Cupo2Total.AsFloat;
            TT_AuxiImporteFacturado.AsFloat:=0;
            TT_Auxi.Post;
            inc(cont);
            QL_Cupo2.Next;
          end;
          QL_Facc2.Close;
          QL_Facc2.ParamByName('pestacion').AsInteger:=DBLookUpComboBox2.KeyValue;
          QL_Facc2.ParamByName('pcaja').AsInteger:=DBLookUpComboBox1.KeyValue;
          QL_Facc2.ParamByName('pfecha').AsDateTime:=xfecha;
          QL_Facc2.Prepare;
          QL_Facc2.Open;
          while not QL_Facc2.Eof do begin
            if TT_Auxi.Locate('TipoFac;FolioFac',VarArrayOf([QL_Facc2TipoFac.AsString,QL_Facc2Folio.AsInteger]),[]) then begin
              TT_Auxi.Edit;
              TT_AuxiImporteFacturado.AsFloat:=QL_Facc2Total.AsFloat;
              TT_Auxi.Post;
            end
            else begin
              TT_Auxi.Insert;
              TT_AuxiNoReg.AsInteger:=cont;
              TT_AuxiTipoFac.AsString:=QL_Facc2TipoFac.AsString;
              TT_AuxiFolioFac.AsInteger:=QL_Facc2Folio.AsInteger;
              TT_AuxiImporteFacturado.AsFloat:=QL_Facc2Total.AsFloat;
              TT_AuxiImporteVendido.AsFloat:=0;
              TT_Auxi.Post;
              inc(cont);
            end;
            QL_Facc2.Next;
          end;
          TT_Auxi.Filtered:=true;
          TT_Auxi.First;
          while not TT_Auxi.Eof do begin
            xlin:='F// //'+TT_AuxiTipoFac.AsString+'-'+IntToClaveNum(TT_AuxiFolioFac.AsInteger,6)+'//'+
                           FormatoMoneda(TT_AuxiImporteVendido.AsFloat)+'//'+FormatoMoneda(TT_AuxiImporteFacturado.AsFloat);
            BndDt.Items.Add(xlin);
            TT_Auxi.Next;
          end;
        end;
        FAvance.AvanzaPosicion;
        xfecha:=Incfecha(xfecha,1);
      end;
      xlin:='T// // //'+FormatoMoneda(totv)+'//'+FormatoMoneda(totf)+'//'+
                     FormatoMoneda(totv-totf);
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP04.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN,DMGAS,FLIQREP04P do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption+'   Sucursal: '+T_EstsDescripcion.AsString;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
end;

procedure TFLIQREP04.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP04.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP04.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);


  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Font.Size:=8;
        Font.Color:=ClWindowText;
        if xtp='F' then begin
          Font.Color:=clGray;
        end;
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
  InicializaEtiquetas(10,14);
  HabilitaShapes(21,23,false);
  ExtraeEtiquetas(10,14);
  Case xtp of
    'T':HabilitaShapes(21,23,true);
  end;
end;

procedure TFLIQREP04.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN do begin
    QL_Facc.Close;
    QL_Cupo.Close;
    QL_Facc2.Close;
    QL_Cupo2.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
  end;
end;


procedure TFLIQREP04.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Noreg', ftInteger, 0, True);
      Add('TipoFac', ftString,2,true);
      Add('FolioFac', ftInteger,0,true);
      Add('ImporteVendido', ftFloat,0,false);
      Add('ImporteFacturado', ftFloat,0,false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'NoReg', [ixPrimary, ixUnique]);
      Add('Factura', 'TipoFac;FolioFac', []);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.IndexName:='Factura';
    TT_Auxi.Active:=true;
  end;
end;



procedure TFLIQREP04.TT_AuxiFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=(TT_AuxiImporteVendido.AsFloat<>TT_AuxiImporteFacturado.AsFloat);
end;

end.
