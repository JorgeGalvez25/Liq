unit ULIQREP43;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, QRExport, Printers, QRPDFFilt,
  RxMemDS;


type
  TFLIQREP43 = class(TForm)
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
    Q_Facc: TQuery;
    Q_FaccTIPOFAC: TStringField;
    Q_FaccFOLIO: TIntegerField;
    Q_FaccFECHA: TDateTimeField;
    Q_FaccNOCLIENTE: TIntegerField;
    Q_FaccTOTAL: TFloatField;
    Q_FaccRECUPERADO: TFloatField;
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
    QRLabelEnca,QRLabelDeta:array [1..6] of TQRLabel;
    lefts:array [1..6] of Integer;
    lComplet:Boolean;
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
    xEti=6;

var
  FLIQREP43: TFLIQREP43;
  xlin:string;
  xtp:char;


implementation

uses ULIBGRAL, ULIBDATABASE, UGEN_NET, DDMGEN, DDMGENT, UAVANCE, DDMGEN_VTAS,
  ULIQREP43P, ULIQREP42P, DDMGAS, DDMCUP;

{$R *.DFM}



procedure TFLIQREP43.PreparaForma;
begin
  BndDt.Items.Clear;
  PreparaReporte;
  CargaBanda;
end;

procedure TFLIQREP43.PreparaReporte;
var
  xClie:Integer;
  xPendRecu:Double;
  xPrecM,xPrecP,xPrecD,xTasa:Real;
begin
  with FLIQREP43P do begin
    try
      CreaEtiquetas;
      try
        Q_Facc.Close;
        if CheckBox1.Checked then begin
          Q_Facc.SQL[5]:='';
          Q_Facc.SQL[11]:='';
        end
        else
          Q_Facc.ParamByName('ESTACION').AsInteger:=FLIQREP43P.DBLookupComboBox2.KeyValue;
        Q_Facc.ParamByName('FECHAINI').AsDateTime:=VgFechaIni;
        Q_Facc.ParamByName('FECHAFIN').AsDateTime:=VgFechaFin;
        if CheckBox2.Checked then begin
          Q_Facc.SQL[6]:='';
          Q_Facc.SQL[12]:='';
        end
        else
          Q_Facc.ParamByName('NOCLIENTE').AsInteger:=StrToInt(MaskEdit2.Text);
        Q_Facc.Open;
        if Q_Facc.IsEmpty then
          raise Exception.Create('No se encontraron movimientos en este periodo.');         
        FAVANCE.PreparaAvance('Preparando Reporte...',True,Q_Facc.RecordCount);
        DMGEN_VTAS.T_Clie.Open;
        while not Q_Facc.Eof do begin
          if (Q_FaccTOTAL.AsFloat<=Q_FaccRECUPERADO.AsFloat) then begin
            Q_Facc.Next;
            Continue;
          end;
          if xClie<>Q_FaccNOCLIENTE.AsInteger then
            DMGEN_VTAS.T_Clie.Locate('NOCLIE',Q_FaccNOCLIENTE.AsInteger,[]);
          xlin:='X//'+Q_FaccTIPOFAC.AsString+'-'+IntToClaveNum(Q_FaccFOLIO.AsInteger,5)+'//'+FechaToFormato(Q_FaccFECHA.AsDateTime)+'//'+IntToClaveNum(Q_FaccNOCLIENTE.AsInteger,5)+' - '+DMGEN_VTAS.T_ClieNOMBRE.AsString;
          xlin:=xlin+'//'+FormatoMoneda(Q_FaccTOTAL.AsFloat)+'//'+FormatoMoneda(Q_FaccRECUPERADO.AsFloat)+'//'+FormatoMoneda(Q_FaccTOTAL.AsFloat-Q_FaccRECUPERADO.AsFloat);
          BndDt.Items.Add(xlin);
          xPendRecu:=xPendRecu+(Q_FaccTOTAL.AsFloat-Q_FaccRECUPERADO.AsFloat);
          Q_Facc.Next;
          FAVANCE.AvanzaPosicion;
        end;

        if DMGAS.VarGasPreciosPorEstacion='Si' then begin
          DMCUP.DamePrecioFechaEst(DMGAS.EstacionActual,1,VgFechaFin,xPrecM,xTasa);
          DMCUP.DamePrecioFechaEst(DMGAS.EstacionActual,2,VgFechaFin,xPrecP,xTasa);
          DMCUP.DamePrecioFechaEst(DMGAS.EstacionActual,3,VgFechaFin,xPrecD,xTasa);
        end
        else begin
          DMCUP.DamePrecioFecha(1,VgFechaFin,xPrecM,xTasa);
          DMCUP.DamePrecioFecha(2,VgFechaFin,xPrecP,xTasa);
          DMCUP.DamePrecioFecha(3,VgFechaFin,xPrecD,xTasa);
        end;

        BndDt.Items.Add('X//');
        BndDt.Items.Add('X//');
        BndDt.Items.Add('X//');
        BndDt.Items.Add('E//Pendiente de recuperar por combustible');
        BndDt.Items.Add('S//');
        BndDt.Items.Add('E//Combustible//Litros//Precio//Importe');
        BndDt.Items.Add('S//'+_NOMBRESCOMBUSTIBLES[1]+'//'+FormatoMoneda(xPendRecu/xPrecM)+'//'+FormatoMoneda(xPrecM)+'//'+FormatoMoneda(xPendRecu));
        BndDt.Items.Add('S//'+_NOMBRESCOMBUSTIBLES[2]+'//'+FormatoMoneda(xPendRecu/xPrecP)+'//'+FormatoMoneda(xPrecP)+'//'+FormatoMoneda(xPendRecu));
        BndDt.Items.Add('S//'+_NOMBRESCOMBUSTIBLES[3]+'//'+FormatoMoneda(xPendRecu/xPrecD)+'//'+FormatoMoneda(xPrecD)+'//'+FormatoMoneda(xPendRecu));
      finally
        DMGEN_VTAS.T_Clie.Close;
        FAVANCE.Close;
      end;
    except
      on e:Exception do begin
        raise Exception.Create(e.Message);
      end;
    end;
  end;

end;

procedure TFLIQREP43.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN,FLIQREP43P do begin
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLRango.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
end;

procedure TFLIQREP43.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        if lefts[6]=0 then begin
          case k of
            1:lefts[1]:=Left;
            2:lefts[2]:=Left;
            3:lefts[3]:=Left;
            4:lefts[4]:=Left;
            5:lefts[5]:=Left;
            6:lefts[6]:=Left;
          end;
        end;
        Caption:='';
        Font.Size:=8;
        Font.Style:=[];
        Frame.DrawTop:=false;
        if k>=4 then
          Alignment:=taRightJustify
        else
          Alignment:=taLeftJustify;
        if lefts[1]>0 then begin
          case k of
            1:Left:=lefts[1];
            2:Left:=lefts[2];
            3:Left:=lefts[3];
            4:Left:=lefts[4];
            5:Left:=lefts[5];
            6:Left:=lefts[6];
          end;
        end;
        if (xtp='E') or (xtp='S') then begin
          lComplet:=True;
          if (xtp='E') then
            Font.Style:=[fsbold];
          if (k=2) or (k=3) then
            Alignment:=taRightJustify;
          if k=2 then
            Left:=Left+80;
          if k=3 then
            Left:=Left-265;
          if k=4 then
            Left:=Left-250;
        end
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
  InicializaEtiquetas(1,6);
  ExtraeEtiquetas(1,6);
end;

procedure TFLIQREP43.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=FecHorActualToStr;
end;

procedure TFLIQREP43.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP43.CargaBanda;
begin
end;

procedure TFLIQREP43.CreaEtiquetas;
var j,i,xl,xw:Integer;
begin
  xl:=xLeft;
  for i:=1 to xEti do begin
     QRLabelEnca[i]:= TQRLabel (CHBEnca.AddPrintable(TQRLabel));
     QRLabelDeta[i]:= TQRLabel (BndDt.AddPrintable(TQRLabel));
     QRLabelDeta[i].Name:='QRLabel'+Inttostr(i);
     with QRLabelEnca[i] do begin
        case i of
          1:Caption:='Factura ';
          2:Caption:='Fecha Fact. ';
          3:Caption:='Cliente ';
          4:Caption:='Importe ';
          5:Caption:='Recuperado ';
          6:Caption:='Pend. de recup.';
        end;
        case i of
          1:xw:=70;
          2:xw:=70;
          3:xw:=356;
          4:xw:=70;
          5:xw:=70;
          6:xw:=90;
        end;
        AutoSize:=False;
        Left:=xl;
        Width:=xw;
        Top:=2;
        if i>=4 then
          Alignment:=taRightJustify
        else
          Alignment:=taLeftJustify;
        Font.Name:='Arial';
        Font.Size:=8;
        Font.Style:=[];
        Frame.DrawTop:=False;
        Frame.DrawBottom:=False;
        Frame.DrawLeft:=False;
        Frame.DrawRight:=True;
        Frame.Width:=1;
     end;
     with QRLabelDeta[i] do begin
        Caption:='';
        if i=3 then
          AutoSize:=False
        else
          AutoSize:=True;
        Transparent:=True;
        Left:=xl;
        Width:=xw;
        Top:=2;
        if i>=4 then
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

procedure TFLIQREP43.BndDtAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
end;

end.
