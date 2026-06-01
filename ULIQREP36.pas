unit ULIQREP36;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS, Master_Intf;

type
  TFLIQREP36 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    BndDt: TQRStringsBand;
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    TM_Auxi: TRxMemoryData;
    ChBEnca: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    TM_AuxiEstacion: TIntegerField;
    TM_AuxiNombreEstacion: TStringField;
    TM_AuxiDespachador: TIntegerField;
    TM_AuxiNombreDespachador: TStringField;
    TM_AuxiFecha: TDateTimeField;
    TM_AuxiFolioVolumetrico: TIntegerField;
    TM_AuxiCodAuto: TStringField;
    TM_AuxiTarjeta: TStringField;
    TM_AuxiImpAutorizado: TFloatField;
    TM_AuxiImpDespachado: TFloatField;
    TM_AuxiFeria: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaReporte;
  end;


var
  FLIQREP36: TFLIQREP36;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  xsw,SwAceites:Boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDM_KIOS, DDMGENT, UAVANCE, DDMCONS, ULIQREP36P;

{$R *.DFM}

procedure TFLIQREP36.PreparaReporte;
var
  _targetURLMaster:string;
  ResumenVtas:TListaVtaTarjBancaria;
  i:Integer;
  xDesp:Integer;
  xNombreDes:string;
  xTotDesp:array[1..3] of Real;
  xTotGral:array[1..3] of Real;

  procedure CambiaDespachador;
  begin
    xlin:='E//'+IntToClaveNum(ResumenVtas.Items[i].Despachador,3)+'-'+ResumenVtas.Items[i].NombreDespachador;
    BndDt.Items.Add(xlin);
    xDesp:=ResumenVtas.Items[i].Despachador;
    xNombreDes:=ResumenVtas.Items[i].NombreDespachador;
    xTotDesp[1]:=0;
    xTotDesp[2]:=0;
    xTotDesp[3]:=0;
  end;

  procedure TotalDespachador;
  begin
    xlin:='T//Total Despachador: '+xNombreDes+'// // // //'+FormatoMoneda(xTotDesp[1])+'//'+FormatoMoneda(xTotDesp[2])+'//'+FormatoMoneda(xTotDesp[3]);
    BndDt.Items.Add(xlin);
    xTotGral[1]:= xTotGral[1] + xTotDesp[1];
    xTotGral[2]:= xTotGral[2] + xTotDesp[2];
    xTotGral[3]:= xTotGral[3] + xTotDesp[3];
  end;

  procedure TotalGral;
  begin
    xlin:='T//TOTAL GENERAL: // // // //'+FormatoMoneda(xTotGral[1])+'//'+FormatoMoneda(xTotGral[2])+'//'+FormatoMoneda(xTotGral[3]);
    BndDt.Items.Add(xlin);
  end;

begin
  _targetURLMaster:='';
  BndDt.Items.Clear;
  with DMGAS,FLIQREP36P do begin
    if LocalizaTabla(T_Ests,'Clave',DBLookupComboBox2.KeyValue) then
      _targetURLMaster:=VariableDeMemo(T_EstsCONSOLA,'TargetURLMaster');
    if _targetURLMaster<>'' then begin
      DM_KIOSK.ROChannel.TargetURL:=_targetURLMaster;
      ResumenVtas:=ReporteVtasTarjetasBancarias(VgFechaIni, VgFechaFin);
      try
        FAVANCE.PreparaAvance('Preparando datos...',True,ResumenVtas.Count);
        xDesp:=-99;
        xTotGral[1]:=0;
        xTotGral[2]:=0;
        xTotGral[3]:=0;
        xTotDesp[1]:=0;
        xTotDesp[2]:=0;
        xTotDesp[3]:=0;

        for i := 0 to ResumenVtas.Count-1 do begin
          if xDesp<>ResumenVtas.Items[i].Despachador then begin
            if xDesp<>-99 then begin
              TotalDespachador;
            end;
            CambiaDespachador;
          end;
          xlin:='D//'+FechaPaq(ResumenVtas.Items[i].Fecha)+' '+ResumenVtas.Items[i].Hora+'//'+ IntToClaveNum(ResumenVtas.Items[i].FolioVolumetrico,8)+'//'+ResumenVtas.Items[i].CodAutorizacion+
                '//************'+ Copy(ResumenVtas.Items[i].Tarjeta,Length(ResumenVtas.Items[i].Tarjeta)-3,Length(ResumenVtas.Items[i].Tarjeta)-1)+
                '//'+FormatoMoneda(ResumenVtas.Items[i].ImpAutorizado)+'//'+FormatoMoneda(ResumenVtas.Items[i].ImpDespachado)+'//'+FormatoMoneda(ResumenVtas.Items[i].Feria);
          BndDt.Items.Add(xlin);
          xTotDesp[1]:=xTotDesp[1]+ResumenVtas.Items[i].ImpAutorizado;
          xTotDesp[2]:=xTotDesp[2]+ResumenVtas.Items[i].ImpDespachado;
          xTotDesp[3]:=xTotDesp[3]+ResumenVtas.Items[i].Feria;
          FAVANCE.AvanzaPosicion;
        end;
        if xDesp<>-99 then begin
          TotalDespachador;
//          TotalGral;
        end;
        TotalGral;
      finally
        ResumenVtas.Free;
        FAVANCE.Close;
      end;
    end
    else
      MensajeWarn('No se configuró la variable <TargetURLMaster> en la Estación: '+T_EstsNOMBRE.AsString);
  end;
end;

procedure TFLIQREP36.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP36P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;

  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep)
end;

procedure TFLIQREP36.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Font.Size:=8;
        if (xtp='S') then begin
          if k=1 then begin
            Font.Style:=[fsUnderline];
          end;
        end;
        if (xtp='R') then begin
          if k in [3,4] then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp in ['A','E'] then Font.Style:=[fsBold];
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k in [5..7] then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp='X' then begin
          Font.Style:=[fsBold];
          if k=4 then Frame.DrawTop:=true
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

begin
  BndDt.Frame.DrawBottom:=false;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  if xtp in ['A','S'] then inc(xtipo);
  InicializaEtiquetas(1,7);
  ExtraeEtiquetas(1,7);
end;

end.
