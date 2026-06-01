unit ULIQREP40;

interface

uses  Variants, QRPDFFilt,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS;

type
  TFLIQREP40 = class(TForm)
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
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QL_Ajusd2: TQuery;
    QL_Dliqc: TQuery;
    QL_DliqcESTACION: TIntegerField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcFECHA: TDateTimeField;
    QL_DliqcPRECIO_CIVA: TFloatField;
    QL_DliqcCANTIDAD: TFloatField;
    QL_DliqcIMPORTE: TFloatField;
    TM_AuxiR: TRxMemoryData;
    TM_AuxiRCombustible: TIntegerField;
    TM_AuxiRCantidad: TFloatField;
    TM_AuxiREstacion: TIntegerField;
    ChBEnca: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QL_Ajusd2ESTACION: TIntegerField;
    QL_Ajusd2COMBUSTIBLE: TIntegerField;
    QL_Ajusd2VOLUMEN: TFloatField;
    QL_Ajusd2Nombre: TStringField;
    TM_AuxiRNombre: TStringField;
    QRPDFFilter1: TQRPDFFilter;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    TM_AuxiRLiquidado: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    xModoAjuste:Integer;
  public
    { Public declarations }
    procedure PreparaReporte(xModo:Integer);
  end;

Const
  xLeft=5;

var
  FLIQREP40: TFLIQREP40;
  xtp:char;
  xlin:string;
  xw,xl,
  xtipo:integer;
  xsw,SwAceites:Boolean;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQDESGLO, DDMGENT, UAVANCE, DDMCONS, ULIQREP40P;

{$R *.DFM}

procedure TFLIQREP40.PreparaReporte(xModo:Integer);
var
  fecha:TDateTime;
  xAju:Real;
  xEst:Byte;
  xMagna,xPremium,xDiesel:Real;
  xtotC:array[1..4]of Real;
  xcont:Byte;
  xTotalLiq,xDiasEntre:Integer;
  xLiquidado:string[2];

  procedure InicializaTabla(xComb:Integer);
  begin
    with DMGAS do begin
      TM_AuxiR.Append;
      TM_AuxiREstacion.AsInteger          :=Q_Auxi2Entero1.AsInteger;
      TM_AuxiRNombre.AsString             :=Q_Auxi2Str50.AsString;
      TM_AuxiRCombustible.AsInteger       :=xComb;
      TM_AuxiRCantidad.AsFloat            :=0;
      TM_AuxiRLiquidado.AsString          :='No';
      with DMGAS do begin
        try
          Q_Auxi.Close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select Max(Isla) as Entero1 from dgasbomb ');
          Q_Auxi.SQL.Add('where estacion='+IntToStr(Q_Auxi2Entero1.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xDiasEntre:=DiasEntre(VgFechaIni,VgFechaFin)+1;
          xTotalLiq:= (Q_AuxiEntero1.AsInteger*3)*xDiasEntre;
          Q_Auxi.Close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select coalesce(count(*),0) as Entero1 from dgasliqg d');
          Q_Auxi.SQL.Add('where d.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
          Q_Auxi.SQL.Add('  and d.fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
          Q_Auxi.SQL.Add('  and d.estacion='+IntToStr(Q_Auxi2Entero1.AsInteger));
          Q_Auxi.SQL.Add('  and d.aplicado='+QuotedStr('Si'));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if Q_AuxiEntero1.AsInteger=xTotalLiq then
            TM_AuxiRLiquidado.AsString          :='Si';
        finally
          Q_Auxi.Close;
        end;
      end;
      TM_AuxiR.Post;
    end;
  end;
begin

  xModoAjuste:=xModo;
  TM_AuxiR.Active:=False;
  TM_AuxiR.Active:=True;

  with DMGAS do begin
    //Modifica nombres de combustibles
    QRLabel19.Caption := _NOMBRESCOMBUSTIBLES[1];
    QRLabel20.Caption := _NOMBRESCOMBUSTIBLES[2];
    QRLabel21.Caption := _NOMBRESCOMBUSTIBLES[3];
    
    try
      Q_Auxi2.Close;
      Q_Auxi2Entero1.FieldKind:=fkInternalCalc;
      Q_Auxi2Str50.FieldKind:=fkInternalCalc;
      Q_Auxi2.SQL.Clear;
      Q_Auxi2.SQL.Add('Select Clave as Entero1, nombre as Str50 from DGASESTS');
      if DMGEN.QT_EmprSERIEKEY.AsInteger=637 then
        Q_Auxi2.SQL.Add('Where Clave<>7');
      Q_Auxi2.SQL.Add('order by Entero1');
      Q_Auxi2.Prepare;
      Q_Auxi2.Open;
      while not Q_Auxi2.Eof do begin
        InicializaTabla(1);
        InicializaTabla(2);
        InicializaTabla(3);
        Q_Auxi2.Next;
      end;
    finally
      Q_Auxi2.Close;
    end;
  end;
  try
    QL_Ajusd2.Close;
    QL_Ajusd2.SQL.Clear;
    QL_Ajusd2.SQL.Add('select d.estacion,(select e.Nombre from DGASESTS e where e.clave=d.estacion),d.combustible,Sum(d.cantidad) as Volumen from dgasdliqc d');
    QL_Ajusd2.sql.Add('Where d.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
    QL_Ajusd2.sql.Add('  and d.fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
    QL_Ajusd2.sql.Add('group by d.estacion,d.combustible');
    QL_Ajusd2.Prepare;
    QL_Ajusd2.Open;
    FAVANCE.PreparaAvance('Preparando Reporte...',True,QL_Ajusd2.RecordCount);
    
    while not QL_Ajusd2.Eof do begin
      xAju:=0;
      if xModo=0 then begin
        with DMGAS do begin
          try
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select coalesce(Sum(a.diferencia),0) as Real1 from dgasajud2 a');
            Q_Auxi.sql.Add('Where a.Estacion='+IntToStr(QL_Ajusd2ESTACION.AsInteger));
            Q_Auxi.sql.Add('  and a.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.sql.Add('  and a.fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.sql.Add('  and a.Combustible='+IntTOstr(QL_Ajusd2COMBUSTIBLE.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xAju:=Q_AuxiReal1.AsFloat;
          finally
            Q_Auxi.Close;
          end;
        end;
      end;
      if TM_AuxiR.Locate('Estacion;Combustible',VarArrayOf([QL_Ajusd2ESTACION.AsInteger,QL_Ajusd2COMBUSTIBLE.AsInteger]),[]) then begin
        TM_AuxiR.Edit;
        TM_AuxiRCantidad.AsFloat      :=TM_AuxiRCantidad.AsFloat+(QL_Ajusd2VOLUMEN.AsFloat-xAju);
      end
      else begin
        TM_AuxiR.Append;
        TM_AuxiREstacion.AsInteger          :=QL_Ajusd2ESTACION.AsInteger;
        TM_AuxiRNombre.AsString             :=QL_Ajusd2Nombre.AsString;
        TM_AuxiRCombustible.AsInteger       :=QL_Ajusd2COMBUSTIBLE.AsInteger;
        TM_AuxiRCantidad.AsFloat            :=QL_Ajusd2VOLUMEN.AsFloat-xAju;
        TM_AuxiRLiquidado.AsString          :='No';
        with DMGAS do begin
          try
            Q_Auxi.Close;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select Max(Isla) as Entero1 from dgasbomb ');
            Q_Auxi.SQL.Add('where estacion='+IntToStr(QL_Ajusd2ESTACION.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xDiasEntre:=DiasEntre(VgFechaIni,VgFechaFin)+1;
            xTotalLiq:= (Q_AuxiEntero1.AsInteger*3)*xDiasEntre;
            Q_Auxi.Close;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select coalesce(count(*),0) as Entero1 from dgasliqg d');
            Q_Auxi.SQL.Add('where d.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.SQL.Add('  and d.fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and d.estacion='+IntToStr(QL_Ajusd2ESTACION.AsInteger));
            Q_Auxi.SQL.Add('  and d.aplicado='+QuotedStr('Si'));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if Q_AuxiEntero1.AsInteger=xTotalLiq then
              TM_AuxiRLiquidado.AsString          :='Si';
          finally
            Q_Auxi.Close;
          end;
        end;
      end;
      TM_AuxiR.Post;
      QL_Ajusd2.Next;
    end;
  finally
    FAVANCE.Close;
  end;
  // Carga de bandas
  TM_AuxiR.SortOnFields('Estacion;Combustible',False,False);
  TM_AuxiR.First;
  FAVANCE.PreparaAvance('Preparando Reporte...',True,TM_AuxiR.RecordCount);
  xEst:=0;
  for xcont:=1 to 4 do
    xtotC[xcont]:=0;
  while not TM_AuxiR.Eof do begin
    if xEst<>TM_AuxiREstacion.AsInteger then begin
      if xEst<>0 then begin
        xlin:=xlin+'//'+FormatoMoneda(xMagna)+'//'+FormatoMoneda(xPremium)+'//'+FormatoMoneda(xDiesel)+'//'+FormatoMoneda(xMagna+xPremium+xDiesel)+'//'+xLiquidado;
        BndDt.Items.Add(xlin);
        xtotC[1]:=xtotC[1]+xMagna;
        xtotC[2]:=xtotC[2]+xPremium;
        xtotC[3]:=xtotC[3]+xDiesel;
      end;
      xlin:='D//'+TM_AuxiRNombre.AsString;
      xEst:=TM_AuxiREstacion.AsInteger;
      xMagna:=0;
      xPremium:=0;
      xDiesel:=0;
      xLiquidado:=TM_AuxiRLiquidado.AsString;
    end;
    if TM_AuxiRCombustible.AsInteger=1 then
      xMagna:=xMagna+TM_AuxiRCantidad.AsFloat
    else if TM_AuxiRCombustible.AsInteger=2 then
      xPremium:=xPremium+TM_AuxiRCantidad.AsFloat
    else if TM_AuxiRCombustible.AsInteger=3 then
      xDiesel:=xDiesel+TM_AuxiRCantidad.AsFloat;
    TM_AuxiR.Next;
    FAVANCE.AvanzaPosicion;
  end;
  if xEst<>0 then begin
    xlin:=xlin+'//'+FormatoMoneda(xMagna)+'//'+FormatoMoneda(xPremium)+'//'+FormatoMoneda(xDiesel)+'//'+FormatoMoneda(xMagna+xPremium+xDiesel)+'//'+xLiquidado;;
    BndDt.Items.Add(xlin);
    xtotC[1]:=xtotC[1]+xMagna;
    xtotC[2]:=xtotC[2]+xPremium;
    xtotC[3]:=xtotC[3]+xDiesel;
    xlin:='T//Total //'+FormatoMoneda(xtotC[1])+'//'+FormatoMoneda(xtotC[2])+'//'+FormatoMoneda(xtotC[3])+'//'+FormatoMoneda(xtotC[1]+xtotC[2]+xtotC[3]);
    BndDt.Items.Add(xlin);
  end;
  FAVANCE.Close;
  TM_AuxiR.SortOnFields('Estacion;Combustible',False,False);
  TM_AuxiR.First;
  FAVANCE.PreparaAvance('Preparando Reporte...',True,QL_Ajusd2.RecordCount);
  xEst:=0;
  for xcont:=1 to 4 do
    xtotC[xcont]:=0;
  BndDt.Items.Add('D//');
  BndDt.Items.Add('D//');
  xlin:='C// Estación // Gasolina // Diesel // Total';
  BndDt.Items.Add(xlin);
  while not TM_AuxiR.Eof do begin
    if xEst<>TM_AuxiREstacion.AsInteger then begin
      if xEst<>0 then begin
        xlin:=xlin+'//'+FormatoMoneda(xMagna+xPremium)+'//'+FormatoMoneda(xDiesel)+'//'+FormatoMoneda(xMagna+xPremium+xDiesel);
        BndDt.Items.Add(xlin);
        xtotC[1]:=xtotC[1]+xMagna+xPremium;
        xtotC[2]:=xtotC[2]+xDiesel;
      end;
      xlin:='D//'+TM_AuxiRNombre.AsString;
      xEst:=TM_AuxiREstacion.AsInteger;
      xMagna:=0;
      xPremium:=0;
      xDiesel:=0;
    end;
    if TM_AuxiRCombustible.AsInteger=1 then
      xMagna:=xMagna+TM_AuxiRCantidad.AsFloat
    else if TM_AuxiRCombustible.AsInteger=2 then
      xPremium:=xPremium+TM_AuxiRCantidad.AsFloat
    else if TM_AuxiRCombustible.AsInteger=3 then
      xDiesel:=xDiesel+TM_AuxiRCantidad.AsFloat;
    TM_AuxiR.Next;
    FAVANCE.AvanzaPosicion;
  end;
  if xEst<>0 then begin
    xlin:=xlin+'//'+FormatoMoneda(xMagna+xPremium)+'//'+FormatoMoneda(xDiesel)+'//'+FormatoMoneda(xMagna+xPremium+xDiesel);
    BndDt.Items.Add(xlin);
    xtotC[1]:=xtotC[1]+xMagna+xPremium;
    xtotC[2]:=xtotC[2]+xDiesel;
    xlin:='T//Total //'+FormatoMoneda(xtotC[1])+'//'+FormatoMoneda(xtotC[2])+'//'+FormatoMoneda(xtotC[1]+xtotC[2]);
    BndDt.Items.Add(xlin);
  end;
  FAVANCE.Close;

end;

procedure TFLIQREP40.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    if xModoAjuste=1 then //03-12-15
      QRLRep.Caption:=QRLRep.Caption+'*';
//    QRLEstacion.Caption:=FLIQREP40P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  if xModoAjuste=0 then
    QRLSistema.Caption:=IdSistNombre
  else
    QRLSistema.Caption:='';


  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep)
end;

procedure TFLIQREP40.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if k=1 then Left:=xLeft;
        if (xtp='C') then
          Font.Style:=[fsBold];
        if (xtp='S') then begin
          if k=1 then begin
            Font.Style:=[fsUnderline];
          end;
        end;
        if (xtp='R') then begin
          Font.Style:=[fsBold];
          if k in [2..5] then begin
            Frame.DrawTop:=true;
          end;
        end;
        if xtp in ['A','E'] then Font.Style:=[fsBold];
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k in [2..5] then begin
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
  if xtp in ['A','S'] then
    inc(xtipo);
  InicializaEtiquetas(1,6);
  ExtraeEtiquetas(1,6);
end;



end.
