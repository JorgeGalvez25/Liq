unit ULIQREP37;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, QRExport, Printers, QRPDFFilt,
  RxMemDS, Master_Intf;


type
  TFLIQREP37 = class(TForm)
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QuickRep1: TQuickRep;
    QRBand3: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData1: TQRSysData;
    QRLRango: TQRLabel;
    CHBEnca: TQRChildBand;
    QRBand4: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    BndDt: TQRStringsBand;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
  private
    QRLabelEnca,QRLabelDeta:array [1..7] of TQRLabel;
    procedure CreaEtiquetas;

    { Private declarations }
  public
    procedure PreparaForma;
    procedure PreparaReporte;
    procedure CargaBanda;
    { Public declarations }
  end;
  const
    xLeft=5;
    xEti=7;

var
  FLIQREP37: TFLIQREP37;
  xlin:string;
  xtp:char;


implementation

uses ULIBGRAL, ULIBDATABASE, UGEN_NET, DDMGEN, DDMGENT, UAVANCE, ULIQREP37P, DDMGAS, DDM_KIOS;

{$R *.DFM}



procedure TFLIQREP37.PreparaForma;
begin
  BndDt.Items.Clear;
  PreparaReporte;
  CargaBanda;
end;

procedure TFLIQREP37.PreparaReporte;
var
  _targetURLMaster:String;
  Reporte:TListaCtesPorDespachador;
  i,j,xturno:Integer;
  totPor:Double;
  totCtes,totCtesFecha:Integer;
  xfecha:TDateTime;
begin
  with DMGEN,DMGENT,FLIQREP37P,DMGAS do begin
    try

      if LocalizaTabla(T_Ests,'Clave',DBLookupComboBox2.KeyValue) then
        _targetURLMaster:=VariableDeMemo(T_EstsCONSOLA,'TargetURLMaster');
      if _targetURLMaster<>'' then begin
        CreaEtiquetas;
        if DM_KIOSK=nil then
          DM_KIOSK:=TDM_KIOSK.Create(Application);
        DM_KIOSK.ROChannel.TargetURL:=_targetURLMaster;
        Reporte:=GetReporteCtesPorDespachador(ComboBox3.ItemIndex,VgFechaIni,VgFechaFin);
        if Reporte=nil then
          raise Exception.Create('No fue posible obtener el reporte.');
      end
      else
        raise Exception.Create('No fue posible crear conexión con Master I-Gas.');
      try
        FAVANCE.PreparaAvance('Preparando Reporte...',True,Reporte.Count);
        for i:=0 to Reporte.Count-1 do begin
          if (xturno<>Reporte[i].Turno) or (xfecha<>Reporte[i].Fecha) then begin
            xturno:=Reporte[i].Turno;
            if i>0 then begin
              if j>1 then begin
                BndDt.Items.Add('T//////////TOTAL DE CLIENTES//'+IntToStr(totCtes)+'//'+FormatoMoneda(totPor));
                BndDt.Items.Add('P//////////PROMEDIO DE CLIENTES//'+FormatoMoneda(totCtes/j));
              end;
              j:=0;
              totPor:=0;
              totCtes:=0;
              BndDt.Items.Add('X//');
            end;
            if xfecha<>Reporte[i].Fecha then begin
              if i>0 then begin
                BndDt.Items.Add('P//////////TOTAL CLIENTES DEL DÍA//'+IntToStr(totCtesFecha));
                totCtesFecha:=0;
                BndDt.Items.Add('X//');
                BndDt.Items.Add('X//');
              end;
              BndDt.Items.Add('F//'+FechaAlf(Reporte[i].Fecha));
              BndDt.Items.Add('X//');
              xfecha:=Reporte[i].Fecha;
            end;
            BndDt.Items.Add('S//TURNO '+IntToStr(Reporte[i].Turno));
            BndDt.Items.Add('E//DESPACHADOR//% ALCANZADO//ACEITES//IMP. ACEITES//POS. CARGA//CLIENTES//% DIARIO');
          end;

          BndDt.Items.Add('X//'+Reporte[i].Despachador+'//'+IntToStr(Trunc(Reporte[i].PorcAlcanzado))+'//'+IntToStr(Reporte[i].AceitesVendidos)+'//'+
                          FormatoMoneda(Reporte[i].TotalVtaAceites)+'//'+Reporte[i].PosCarga+'//'+IntToStr(Reporte[i].ClietesAtendidos)+'//'+FormatoMoneda(Reporte[i].PorcDiario));
          totCtes:=totCtes+Reporte[i].ClietesAtendidos;
          totCtesFecha:=totCtesFecha+Reporte[i].ClietesAtendidos;
          totPor:=totPor+Reporte[i].PorcDiario;
          inc(j);
          FAVANCE.AvanzaPosicion;
        end;
        if j>1 then begin
          BndDt.Items.Add('T//////////TOTAL DE CLIENTES//'+IntToStr(totCtes)+'//'+FormatoMoneda(totPor));
          BndDt.Items.Add('P//////////PROMEDIO DE CLIENTES//'+FormatoMoneda(totCtes/j));
          BndDt.Items.Add('X//');
          BndDt.Items.Add('P//////////TOTAL CLIENTES DEL DÍA//'+IntToStr(totCtesFecha));
        end;
      finally
        Reporte.Free;
        FAVANCE.Close;
      end;    
    except
      on e:Exception do begin
        raise Exception.Create(e.Message);
      end;
    end;
  end;

end;

procedure TFLIQREP37.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN do begin
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption+' '+DMGAS.T_EstsDescripcion.AsString;
    if VgFechaIni<>VgFechaFin then
      QRLRango.Caption:='Del: '+FechaAlf(VgFechaIni)+' al '+FechaAlf(VgFechaFin)
    else
      QRLRango.Caption:='Del: '+FechaAlf(VgFechaIni);
  end;
end;

procedure TFLIQREP37.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Size:=8;
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Font.Color:=clBlack;
        if (xtp='E') or (xtp='P') then Font.Style:=[fsbold];
        if (xtp='T') and (k>=6) then Frame.DrawTop:=True;
        if (xtp='S') then begin
          Font.Size:=9;
          Font.Style:=[fsbold,fsItalic];
        end;
        if (xtp='F') then begin
          Font.Size:=9;
          Font.Style:=[fsbold];
          Font.Color:=clBlue;
        end;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k+1)
  end;
begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,7);
  ExtraeEtiquetas(1,7);
end;

procedure TFLIQREP37.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=FecHorActualToStr;
end;

procedure TFLIQREP37.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP37.CargaBanda;
begin
end;

procedure TFLIQREP37.CreaEtiquetas;
var j,i,xl,xw:Integer;
begin
  xl:=xLeft;
  for i:=1 to xEti do begin
     QRLabelEnca[i]:= TQRLabel (CHBEnca.AddPrintable(TQRLabel));
     QRLabelDeta[i]:= TQRLabel (BndDt.AddPrintable(TQRLabel));
     QRLabelDeta[i].Name:='QRLabel'+Inttostr(i);
     with QRLabelEnca[i] do begin
        case i of
          1:Caption:='';
          2:Caption:='';
          3:Caption:='';
          4:Caption:='';
          5:Caption:='';
          6:Caption:='';
          7:Caption:='';
        end;
        case i of
          1:xw:=250;
          2:xw:=80;
          3:xw:=80;
          4:xw:=80;
          5:xw:=80;
          6:xw:=80;
          7:xw:=80;
        end;
        AutoSize:=False;
        Left:=xl;
        Width:=xw;
        Top:=2;
        if i>1 then
          Alignment:=taRightJustify
        else
          Alignment:=taLeftJustify;
        Font.Name:='Arial';
        Font.Size:=8;
        Font.Style:=[];
        Frame.DrawTop:=False;
        Frame.DrawBottom:=False;
        Frame.DrawLeft:=False;
        Frame.DrawRight:=False;
        Frame.Width:=1;
     end;
     with QRLabelDeta[i] do begin
        Caption:='';
        AutoSize:=True;
        Transparent:=True;
        Left:=xl;
        Width:=xw;
        Top:=2;
        if i>1 then
          Alignment:=taRightJustify
        else
          Alignment:=taLeftJustify;
        Font.Name:='Arial';
        Frame.DrawTop:=False;
        Frame.DrawBottom:=False;
        Frame.DrawLeft:=False;
        Frame.DrawRight:=False;
        Frame.Width:=1;
     end;
     if i>=5 then
     xl:=xl+xw
     else
     xl:=xl+xw+2;

  end;
end;

procedure TFLIQREP37.BndDtAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
end;

end.
