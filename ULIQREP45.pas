unit ULIQREP45;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, QRExport, Printers, QRPDFFilt,
  RxMemDS;


type
  TFLIQREP45 = class(TForm)
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
    Q_Desc: TQuery;
    Q_DescIMPORTE: TFloatField;
    Q_DescDESCUENTO: TFloatField;
    Q_DescTOTAL: TFloatField;
    Q_DescFECHA: TDateTimeField;
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
    { Public declarations }
  end;
  const
    xLeft=5;
    xEti=5;

var
  FLIQREP45: TFLIQREP45;
  xlin:string;
  xtp:char;


implementation

uses ULIBGRAL, ULIBDATABASE, UGEN_NET, DDMGEN, DDMGENT, UAVANCE, ULIQREP45P,
  StrUtils;

{$R *.DFM}



procedure TFLIQREP45.PreparaForma;
begin
  BndDt.Items.Clear;
  PreparaReporte;
end;

procedure TFLIQREP45.PreparaReporte;
var
  TotImp,TotDesc,TotTot:Double;
begin
  with DMGEN,FLIQREP45P do begin
    try
      CreaEtiquetas;
      try
        Q_Desc.SQL[2]:='AND COMBUSTIBLE IN ('+IfThen(CheckListBox1.Checked[0],'1,','')+IfThen(CheckListBox1.Checked[1],'2,','')+IfThen(CheckListBox1.Checked[2],'3,','');
        Q_Desc.SQL[2]:=Copy(Q_Desc.SQL[2],1,Length(Q_Desc.SQL[2])-1);
        Q_Desc.SQL[2]:=Q_Desc.SQL[2]+')';
        Q_Desc.ParamByName('FECHAINI').AsDateTime:=VgFechaIni;
        Q_Desc.ParamByName('FECHAFIN').AsDateTime:=VgFechaFin;
        Q_Desc.Open;
        FAVANCE.PreparaAvance('Preparando Reporte...',True,Q_Desc.RecordCount);
        while not Q_Desc.Eof do begin
          xlin:='X//'+FechaToFormato(Q_DescFECHA.AsDateTime)+'//'+FormatoMoneda(Q_DescIMPORTE.AsFloat)+'//'+FormatoMoneda(Q_DescDESCUENTO.AsFloat);
          xlin:=xlin+'//'+IfThen(Q_DescDESCUENTO.AsFloat>0,FormatoMoneda((Q_DescDESCUENTO.AsFloat/Q_DescTOTAL.AsFloat)*100),'0.00')+'//'+FormatoMoneda(Q_DescTOTAL.AsFloat);
          TotImp:=TotImp+Q_DescIMPORTE.AsFloat;
          TotDesc:=TotDesc+Q_DescDESCUENTO.AsFloat;
          TotTot:=TotTot+Q_DescTOTAL.AsFloat;
          BndDt.Items.Add(xlin);
          Q_Desc.Next;
          FAVANCE.AvanzaPosicion;
        end;
        BndDt.Items.Add('T// //'+FormatoMoneda(TotImp)+'//'+FormatoMoneda(TotDesc)+'//'+IfThen(TotDesc>0,
                       FormatoMoneda((TotDesc/TotTot)*100),'0.00')+'//'+FormatoMoneda(TotTot));
      finally
       FAVANCE.Close;
      end;
    except
      on e:Exception do begin
        raise Exception.Create(e.Message);
      end;
    end;
  end;

end;

procedure TFLIQREP45.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with DMGEN do begin
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLRango.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
end;

procedure TFLIQREP45.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if (xtp='T') and (k>1) then begin
          Frame.DrawTop:=True;
          Font.Style:=[fsBold];
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
  InicializaEtiquetas(1,5);
  ExtraeEtiquetas(1,5);
end;

procedure TFLIQREP45.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=FecHorActualToStr;
end;

procedure TFLIQREP45.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQREP45.CreaEtiquetas;
var j,i,xl,xw:Integer;
begin
  xl:=xLeft;
  for i:=1 to xEti do begin
     QRLabelEnca[i]:= TQRLabel (CHBEnca.AddPrintable(TQRLabel));
     QRLabelDeta[i]:= TQRLabel (BndDt.AddPrintable(TQRLabel));
     QRLabelDeta[i].Name:='QRLabel'+Inttostr(i);
     with QRLabelEnca[i] do begin
        case i of
          1:Caption:='Fecha ';
          2:Caption:='Venta ';
          3:Caption:='Descuento ';
          4:Caption:='% Descuento ';
          5:Caption:='Venta Neta ';
        end;
        case i of
          1:xw:=75;
          2:xw:=100;
          3:xw:=100;
          4:xw:=100;
          5:xw:=100;
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
        Frame.DrawRight:=True;
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

procedure TFLIQREP45.BndDtAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
end;

end.
