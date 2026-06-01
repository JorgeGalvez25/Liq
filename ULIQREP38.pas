unit ULIQREP38;

interface

uses Variants, QRPDFFilt,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport;

type
  TFLIQREP38 = class(TForm)
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
    ChildBand1: TQRChildBand;
    Q_Volumetricos: TQuery;
    QRLEstacion: TQRLabel;
    ChBEnca: TQRChildBand;
    ChBEnca2: TQRChildBand;
    QRLEti1: TQRLabel;
    QRLEti2: TQRLabel;
    QRLEti3: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    Q_VolumetricosFECHA: TDateTimeField;
    Q_VolumetricosTURNO: TIntegerField;
    Q_VolumetricosTANQUE: TIntegerField;
    Q_VolumetricosCOMBUSTIBLE: TIntegerField;
    Q_Entradas: TQuery;
    Q_EntradasFECHA: TDateTimeField;
    Q_EntradasTURNO: TIntegerField;
    Q_EntradasTANQUE: TIntegerField;
    Q_EntradasCOMBUSTIBLE: TIntegerField;
    Q_EntradasVOLUMENRECEPCION: TFloatField;
    Q_PreciosVol: TQuery;
    Q_PreciosVolPRECIO: TFloatField;
    Q_Liquidaciones: TQuery;
    Q_LiquidacionesCOMBUS: TFloatField;
    Q_LiquidacionesIMPORTE: TFloatField;
    Q_PreciosLiq: TQuery;
    Q_PreciosLiqPRECIO: TFloatField;
    QRPDFFilter1: TQRPDFFilter;
    Q_VolumetricosVOLUMEN: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    ModoRep:integer;
    QRLabelEnca,
    QRLabelDeta:array [1..13] of TQRLabel;
    procedure CreaEtiquetas;
    procedure CreaEtiquetasftc;

  public
    { Public declarations }
    procedure PreparaReporte(xModo:integer);
    procedure PreparaReporte2(xModo:integer);
  end;

Const
  xLeft=0;
  Magna = 1;
  Premium = 2;
  Diesel = 3;

var
  FLIQREP38: TFLIQREP38;
  xtp:char;
  xlin:string;
  xAncho,xwid:integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, UAVANCE, DDMCONS,
     DDMGAS, DDMLIQ, DDMGEN_VTAS, ULIQREP38P;

{$R *.DFM}

procedure TFLIQREP38.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
//  for i:=1 to 10 do begin
  for i:=1 to 13 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Combustible';
        2:Caption:='Lect.Inicial';
        3:Caption:='Entradas VD';
        4:Caption:='Lect.Final';
        5,8,11:Caption:='Litros';
        6,9,12:Caption:='Precio';
        7,10,13:Caption:='Importe';
//        2,5,8:Caption:='Litros';
//        3,6,9:Caption:='Precio';
//        4,7,10:Caption:='Importe';
      end;
      Case i of
        1:xw:=77;
        2:xw:=75;
        3:xw:=75;
        4:xw:=75;
        5,6,7:xw:=77;
        8,9,10:xw:=77;
        11,12,13:xw:=77;
//        1:xw:=239;
//        2,5,8:xw:=84;
//        3,6,9:xw:=84;
//        4,7,10:xw:=84;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=False;
      Frame.DrawBottom:=False;
      Frame.DrawLeft:=true;
      Frame.DrawRight:=true;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taRightJustify;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=False;
      Frame.DrawBottom:=False;
      Frame.DrawLeft:=False;
      Frame.DrawRight:=False;
      Frame.Width:=1;
      if i=1 then Alignment :=taCenter;
    end;
    xl:=xl+xw+0;
  end;
  xwid:=xl;
end;

procedure TFLIQREP38.PreparaReporte(xModo:integer);
var
    i:Integer;
    xfecha:TDateTime;
    Entrada,
    TotalLitros, TotalImporte,
    TotalLitrosLiq, TotalImporteLiq,
    TotalMagna, TotalPremium, TotalDiesel, Ajus,
    TotalMagnaLiq, TotalPremiumLiq, TotalDieselLiq,
    PrecioMagna, PrecioPremium, PrecioDiesel, Precio,
    PrecioMagnaLiq, PrecioPremiumLiq, PrecioDieselLiq, PrecioLiq,
    CombusMagnaAnt, CombusPremiumAnt, CombusDieselAnt,
    CombusMagna, CombusPremium, CombusDiesel: Double;
  xEstacion:Integer;
  xLectIni, xLectFin, xEnt, xDifComb:Double;
begin
  BndDt.Items.Clear;
  if not (FLIQREP38P.chkImpDeta.Checked) then begin
    with DMGEN, DMCONS, DMGAS do begin
      ModoRep:=xModo;
      xancho:=78;
      CreaEtiquetas;
      BndDt.Items.Clear;
      xEstacion:=EstacionActual;
      try
        TotalLitros := 0;
        TotalImporte := 0;
        for i := 1 to 3 do begin
          Q_PreciosVol.Close;
          Q_PreciosVol.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
          Q_PreciosVol.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
          Q_PreciosVol.ParamByName('PCombus').AsInteger := i;
          Q_PreciosVol.Prepare;
          Q_PreciosVol.Open;
          if Q_PreciosVolPRECIO.AsFloat = 0 then begin
            DMCONS.Q_Auxi.Close;
            DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
            DMCONS.Q_Auxi.SQL.Clear;
            DMCONS.Q_Auxi.SQL.Add('select precio as Real1');
            DMCONS.Q_Auxi.SQL.Add(' from dpvgprec');
            DMCONS.Q_Auxi.SQL.Add(' where fechahora = (select max(fechahora) from dpvgprec where fechahora<= :PFecha)');
            DMCONS.Q_Auxi.SQL.Add(' and combustible = :PCombus');
            DMCONS.Q_Auxi.SQL.Add(' and aplicado = "Si"');
            DMCONS.Q_Auxi.SQL.Add(' and en_edicion = "No"');
            DMCONS.Q_Auxi.SQL.Add(' and error = "No"');
            DMCONS.Q_Auxi.ParamByName('PFecha').AsDateTime := VgFechaIni;
            DMCONS.Q_Auxi.ParamByName('PCombus').AsInteger := i;
            DMCONS.Q_Auxi.Prepare;
            DMCONS.Q_Auxi.Open;
            Precio := DMCONS.Q_AuxiReal1.AsFloat;
            DMCONS.Q_Auxi.Close;
          end
          else
            Precio := Q_PreciosVolPRECIO.AsFloat;

          Q_Liquidaciones.Close;
          Q_Liquidaciones.ParamByName('PEst').AsInteger := xEstacion;
          Q_Liquidaciones.ParamByName('PCombus').AsInteger := i;
          Q_Liquidaciones.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
          Q_Liquidaciones.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
          Q_Liquidaciones.Prepare;
          Q_Liquidaciones.Open;

          Ajus := 0;
          if ModoRep = 0 then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind := fkInternalCalc;
            Q_AuxiReal2.FieldKind := fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1, sum(Total) as Real2');
            Q_Auxi.SQL.Add(' From DGASAJUD2');
            Q_Auxi.SQL.Add(' Where Estacion = :PEst');
            Q_Auxi.SQL.Add(' and Combustible = :PCombus');
            Q_Auxi.SQL.Add(' and Fecha>=:PFechaIni');
            Q_Auxi.SQL.Add(' and Fecha<=:PFechaFin');
            Q_Auxi.ParamByName('PEst').AsInteger := xEstacion;
            Q_Auxi.ParamByName('PCombus').AsInteger := i;
            Q_Auxi.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
            Q_Auxi.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            Ajus := Q_AuxiReal1.AsFloat;
            Q_Auxi.Close;
          end;

          Q_PreciosLiq.Close;
          Q_PreciosLiq.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
          Q_PreciosLiq.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
          Q_PreciosLiq.ParamByName('PCombus').AsInteger := i;
          Q_PreciosLiq.Prepare;
          Q_PreciosLiq.Open;
          if Q_PreciosLiqPRECIO.AsFloat = 0 then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind := fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select precio as Real1');
            Q_Auxi.SQL.Add(' from dgasprec');
            Q_Auxi.SQL.Add(' where ');
            Q_Auxi.SQL.Add(' fecha = (select max(fecha) from dgasprec where fecha<= :PFecha)');
            Q_Auxi.SQL.Add(' and combustible = :PCombus');
            Q_Auxi.ParamByName('PFecha').AsDateTime := VgFechaIni;
            Q_Auxi.ParamByName('PCombus').AsInteger := i;
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            PrecioLiq := Q_AuxiReal1.AsFloat;
            Q_Auxi.Close;
          end
          else
            PrecioLiq := Q_PreciosLiqPRECIO.AsFloat;
          if i = Magna then begin
            TotalMagnaLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
            PrecioMagna := Precio;
            PrecioMagnaLiq := PrecioLiq;
          end;
          if i = Premium then begin
            TotalPremiumLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
            PrecioPremium := Precio;
            PrecioPremiumLiq := PrecioLiq;
          end;
          if i = Diesel then begin
            TotalDieselLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
            PrecioDiesel := Precio;
            PrecioDieselLiq := PrecioLiq;
          end;
          Q_Liquidaciones.Close;
        end;
        with DMCONS do begin
          try
            xLectIni:=0;
            xLectFin:=0;
            xEnt:=0;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(m.Volumen) as Real1 From DPVGTURNT m');     //03-12-15
            Q_Auxi.SQL.Add('Where m.Fecha = '+QuotedStr(FechaToStrSQL(VgFechaIni-1)));
            Q_Auxi.SQL.Add('  and m.Turno=3');
            Q_Auxi.SQL.Add('  and m.combustible=1');
            Q_Auxi.SQL.Add('Group by m.combustible');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xLectIni:=Q_AuxiReal1.AsFloat;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(m.Volumen) as Real1 From DPVGTURNT m');     //03-12-15
            Q_Auxi.SQL.Add('Where m.Fecha = '+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and m.Turno=3');
            Q_Auxi.SQL.Add('  and m.combustible=1');
            Q_Auxi.SQL.Add('Group by m.combustible');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xLectFin:=Q_AuxiReal1.AsFloat;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(VolumenRecepcion) as Real1 from dpvgetan');
            Q_Auxi.SQL.Add('where Fecha >='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.SQL.Add('  and Fecha <='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and combustible=1');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xEnt:=Q_AuxiReal1.AsFloat;
          finally
            Q_Auxi.Close;
          end;
          TotalMagna:=xLectIni+xEnt-xLectFin;  //03-12-15
        end;
        xDifComb:=TotalMagnaLiq-TotalMagna;
        xlin := 'D//'+_NOMBRESCOMBUSTIBLES[1]+'//'+FormatoMoneda(xLectIni)+'//'+FormatoMoneda(xEnt)+'//'+FormatoMoneda(xLectFin)+'//'+ FormatoNumero(TotalMagna,15,3) + '//' + FormatoNumero(PrecioMagna,5,2) + '//' + FormatoNumero(TotalMagna * PrecioMagna,15,3) + '//' +
                FormatoNumero(TotalMagnaLiq,15,3) + '//' + FormatoNumero(PrecioMagnaLiq,5,2) + '//' + FormatoNumero(TotalMagnaLiq * PrecioMagnaLiq,15,3) + '//' +
                FormatoNumero(xDifComb,15,3) + '//' + FormatoNumero(PrecioMagna,5,2) + '//' + FormatoNumero(xDifComb*PrecioMagna,15,3);
        BndDt.Items.Add(xlin);

        with DMCONS do begin
           try
            xLectIni:=0;
            xLectFin:=0;
            xEnt:=0;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(Volumen) as Real1 From DPVGTURNT');       //03-12-15
            Q_Auxi.SQL.Add('Where Fecha = '+QuotedStr(FechaToStrSQL(VgFechaIni-1)));
            Q_Auxi.SQL.Add('  and Turno=3');
            Q_Auxi.SQL.Add('  and combustible=2');
            Q_Auxi.SQL.Add('Group by combustible');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xLectIni:=Q_AuxiReal1.AsFloat;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(Volumen) as Real1 From DPVGTURNT');          //03-12-15
            Q_Auxi.SQL.Add('Where Fecha = '+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and Turno=3');
            Q_Auxi.SQL.Add('  and combustible=2');
            Q_Auxi.SQL.Add('Group by combustible');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xLectFin:=Q_AuxiReal1.AsFloat;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(VolumenRecepcion) as Real1 from dpvgetan');
            Q_Auxi.SQL.Add('where Fecha >='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.SQL.Add('  and Fecha <='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and combustible=2');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xEnt:=Q_AuxiReal1.AsFloat;
          finally
            Q_Auxi.Close;
          end;
          TotalPremium:=xLectIni+xEnt-xLectFin;  //03-12-15
        end;
        xDifComb:=TotalPremiumLiq-TotalPremium;
        xlin := 'D//'+_NOMBRESCOMBUSTIBLES[2]+'//'+FormatoMoneda(xLectIni)+'//'+FormatoMoneda(xEnt)+'//'+FormatoMoneda(xLectFin)+'//'+ FormatoNumero(TotalPremium,15,3) + '//' + FormatoNumero(PrecioPremium,5,2) + '//' + FormatoNumero(TotalPremium * PrecioPremium,15,3) + '//' +
                FormatoNumero(TotalPremiumLiq,15,3) + '//' + FormatoNumero(PrecioPremiumLiq,5,2) + '//' + FormatoNumero(TotalPremiumLiq * PrecioPremiumLiq,15,3) + '//' +
                FormatoNumero(xDifComb,15,3) + '//' + FormatoNumero(PrecioPremium,5,2) + '//' + FormatoNumero(xDifComb*PrecioPremium,15,3);
        BndDt.Items.Add(xlin);

        with DMCONS do begin
          try
            TotalDiesel:=0;        //03-12-15
            xLectIni:=0;
            xLectFin:=0;
            xEnt:=0;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(Volumen) as Real1 From DPVGTURNT');      //03-12-15
            Q_Auxi.SQL.Add('Where Fecha = '+QuotedStr(FechaToStrSQL(VgFechaIni-1)));
            Q_Auxi.SQL.Add('  and Turno=3');
            Q_Auxi.SQL.Add('  and combustible=3');
            Q_Auxi.SQL.Add('Group by combustible');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xLectIni:=Q_AuxiReal1.AsFloat;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(Volumen) as Real1 From DPVGTURNT');         //03-12-15
            Q_Auxi.SQL.Add('Where Fecha = '+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and Turno=3');
            Q_Auxi.SQL.Add('  and combustible=3');
            Q_Auxi.SQL.Add('Group by combustible');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xLectFin:=Q_AuxiReal1.AsFloat;
            Q_Auxi.close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select sum(VolumenRecepcion) as Real1 from dpvgetan');
            Q_Auxi.SQL.Add('where Fecha >='+QuotedStr(FechaToStrSQL(VgFechaIni)));
            Q_Auxi.SQL.Add('  and Fecha <='+QuotedStr(FechaToStrSQL(VgFechaFin)));
            Q_Auxi.SQL.Add('  and combustible=3');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            xEnt:=Q_AuxiReal1.AsFloat;
          finally
            Q_Auxi.Close;
          end;
          TotalDiesel:=xLectIni+xEnt-xLectFin;  //03-12-15
        end;
        xDifComb:=TotalDieselLiq-TotalDiesel;
        xlin := 'D//'+_NOMBRESCOMBUSTIBLES[3]+'//'+FormatoMoneda(xLectIni)+'//'+FormatoMoneda(xEnt)+'//'+FormatoMoneda(xLectFin)+'//'+FormatoNumero(TotalDiesel,15,3) + '//' + FormatoNumero(PrecioDiesel,5,3) + '//' + FormatoNumero(TotalDiesel * PrecioDiesel,15,3) + '//' +
                FormatoNumero(TotalDieselLiq,15,3) + '//' + FormatoNumero(PrecioDieselLiq,5,2) + '//' + FormatoNumero(TotalDieselLiq * PrecioDieselLiq,15,3) + '//' +
                FormatoNumero(xDifComb,15,3) + '//' + FormatoNumero(PrecioDiesel,5,2) + '//' + FormatoNumero(xDifComb*PrecioDiesel,15,3);
        BndDt.Items.Add(xlin);
      finally
        FAvance.Close;
        DMCONS.Q_Auxi.Close;
        Q_Auxi.Close;
        Q_PreciosVol.Close;
        Q_PreciosLiq.Close;
        Q_Volumetricos.Close;
        Q_Liquidaciones.Close;
        Q_Entradas.Close;
      end;
    end;
  end;

  // Se realizaran los mismos calculos, la unica diferencia es que se tomara el datos de entrada lo que se registre en los datos adicionales del I-Gas Cliente:
  with DMGEN, DMCONS, DMGAS do begin
    ModoRep:=xModo;
    if not (FLIQREP38P.chkImpDeta.Checked) then begin
      xancho:=78;
      BndDt.Items.Add('D//');
      BndDt.Items.Add('D//');
      xlin:='Y// Combustible // Lect. Inicial // Entradas Fct. // Lect. Final // Litros // Precio // Importe // Litros // Precio // Importe // Litros // Precio // Importe';
      BndDt.Items.Add(xlin);
    end
    else
      CreaEtiquetasftc;
    xEstacion:=EstacionActual;
    try
      TotalLitros := 0;
      TotalImporte := 0;
      for i := 1 to 3 do begin
        Q_PreciosVol.Close;
        Q_PreciosVol.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
        Q_PreciosVol.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
        Q_PreciosVol.ParamByName('PCombus').AsInteger := i;
        Q_PreciosVol.Prepare;
        Q_PreciosVol.Open;
        if Q_PreciosVolPRECIO.AsFloat = 0 then begin
          DMCONS.Q_Auxi.Close;
          DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
          DMCONS.Q_Auxi.SQL.Clear;
          DMCONS.Q_Auxi.SQL.Add('select precio as Real1');
          DMCONS.Q_Auxi.SQL.Add(' from dpvgprec');
          DMCONS.Q_Auxi.SQL.Add(' where fechahora = (select max(fechahora) from dpvgprec where fechahora<= :PFecha)');
          DMCONS.Q_Auxi.SQL.Add(' and combustible = :PCombus');
          DMCONS.Q_Auxi.SQL.Add(' and aplicado = "Si"');
          DMCONS.Q_Auxi.SQL.Add(' and en_edicion = "No"');
          DMCONS.Q_Auxi.SQL.Add(' and error = "No"');
          DMCONS.Q_Auxi.ParamByName('PFecha').AsDateTime := VgFechaIni;
          DMCONS.Q_Auxi.ParamByName('PCombus').AsInteger := i;
          DMCONS.Q_Auxi.Prepare;
          DMCONS.Q_Auxi.Open;
          Precio := DMCONS.Q_AuxiReal1.AsFloat;
          DMCONS.Q_Auxi.Close;
        end
        else
          Precio := Q_PreciosVolPRECIO.AsFloat;

        Q_Liquidaciones.Close;
        Q_Liquidaciones.ParamByName('PEst').AsInteger := xEstacion;
        Q_Liquidaciones.ParamByName('PCombus').AsInteger := i;
        Q_Liquidaciones.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
        Q_Liquidaciones.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
        Q_Liquidaciones.Prepare;
        Q_Liquidaciones.Open;

        Ajus := 0;
        if ModoRep = 0 then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind := fkInternalCalc;
          Q_AuxiReal2.FieldKind := fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1, sum(Total) as Real2');
          Q_Auxi.SQL.Add(' From DGASAJUD2');
          Q_Auxi.SQL.Add(' Where Estacion = :PEst');
          Q_Auxi.SQL.Add(' and Combustible = :PCombus');
          Q_Auxi.SQL.Add(' and Fecha>=:PFechaIni');
          Q_Auxi.SQL.Add(' and Fecha<=:PFechaFin');
          Q_Auxi.ParamByName('PEst').AsInteger := xEstacion;
          Q_Auxi.ParamByName('PCombus').AsInteger := i;
          Q_Auxi.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
          Q_Auxi.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          Ajus := Q_AuxiReal1.AsFloat;
          Q_Auxi.Close;
        end;

        Q_PreciosLiq.Close;
        Q_PreciosLiq.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
        Q_PreciosLiq.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
        Q_PreciosLiq.ParamByName('PCombus').AsInteger := i;
        Q_PreciosLiq.Prepare;
        Q_PreciosLiq.Open;
        if Q_PreciosLiqPRECIO.AsFloat = 0 then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind := fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select precio as Real1');
          Q_Auxi.SQL.Add(' from dgasprec');
          Q_Auxi.SQL.Add(' where ');
          Q_Auxi.SQL.Add(' fecha = (select max(fecha) from dgasprec where fecha<= :PFecha)');
          Q_Auxi.SQL.Add(' and combustible = :PCombus');
          Q_Auxi.ParamByName('PFecha').AsDateTime := VgFechaIni;
          Q_Auxi.ParamByName('PCombus').AsInteger := i;
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          PrecioLiq := Q_AuxiReal1.AsFloat;
          Q_Auxi.Close;
        end
        else
          PrecioLiq := Q_PreciosLiqPRECIO.AsFloat;
        if i = Magna then begin
          TotalMagnaLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
          PrecioMagna := Precio;
          PrecioMagnaLiq := PrecioLiq;
        end;
        if i = Premium then begin
          TotalPremiumLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
          PrecioPremium := Precio;
          PrecioPremiumLiq := PrecioLiq;
        end;
        if i = Diesel then begin
          TotalDieselLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
          PrecioDiesel := Precio;
          PrecioDieselLiq := PrecioLiq;
        end;
        Q_Liquidaciones.Close;
      end;
      with DMCONS do begin
        try
          xLectIni:=0;
          xLectFin:=0;
          xEnt:=0;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select sum(m.Volumen) as Real1 From DPVGTURNT m');     //03-12-15
          Q_Auxi.SQL.Add('Where m.Fecha = '+QuotedStr(FechaToStrSQL(VgFechaIni-1)));
          Q_Auxi.SQL.Add('  and m.Turno=3');
          Q_Auxi.SQL.Add('  and m.combustible=1');
          Q_Auxi.SQL.Add('Group by m.combustible');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xLectIni:=Q_AuxiReal1.AsFloat;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select sum(m.Volumen) as Real1 From DPVGTURNT m');     //03-12-15
          Q_Auxi.SQL.Add('Where m.Fecha = '+QuotedStr(FechaToStrSQL(VgFechaFin)));
          Q_Auxi.SQL.Add('  and m.Turno=3');
          Q_Auxi.SQL.Add('  and m.combustible=1');
          Q_Auxi.SQL.Add('Group by m.combustible');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xLectFin:=Q_AuxiReal1.AsFloat;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select coalesce(sum(d.volpemex),0) as Real1 from dpvgdocu d');
          Q_Auxi.SQL.Add('where exists (select e.folio from dpvgetan e');
          Q_Auxi.SQL.Add('                      where Fecha >='+QuotedStr(FechaToStrSQL(VgFechaIni)));
          Q_Auxi.SQL.Add('                        and Fecha <='+QuotedStr(FechaToStrSQL(VgFechaFin)));
          Q_Auxi.SQL.Add('                        and e.folio=d.folioentrada ');
          Q_Auxi.SQL.Add('                        and combustible=1)');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xEnt:=Q_AuxiReal1.AsFloat;
        finally
          Q_Auxi.Close;
        end;
        TotalMagna:=xLectIni+xEnt-xLectFin;  //03-12-15
      end;
      xDifComb:=TotalMagnaLiq-TotalMagna;
      xlin := 'D//'+_NOMBRESCOMBUSTIBLES[1]+'//'+FormatoMoneda(xLectIni)+'//'+FormatoMoneda(xEnt)+'//'+FormatoMoneda(xLectFin)+'//'+ FormatoNumero(TotalMagna,15,3) + '//' + FormatoNumero(PrecioMagna,5,2) + '//' + FormatoNumero(TotalMagna * PrecioMagna,15,3) + '//' +
              FormatoNumero(TotalMagnaLiq,15,3) + '//' + FormatoNumero(PrecioMagnaLiq,5,2) + '//' + FormatoNumero(TotalMagnaLiq * PrecioMagnaLiq,15,3) + '//' +
              FormatoNumero(xDifComb,15,3) + '//' + FormatoNumero(PrecioMagna,5,2) + '//' + FormatoNumero(xDifComb*PrecioMagna,15,3);
      BndDt.Items.Add(xlin);

      with DMCONS do begin
         try
          xLectIni:=0;
          xLectFin:=0;
          xEnt:=0;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select sum(Volumen) as Real1 From DPVGTURNT');       //03-12-15
          Q_Auxi.SQL.Add('Where Fecha = '+QuotedStr(FechaToStrSQL(VgFechaIni-1)));
          Q_Auxi.SQL.Add('  and Turno=3');
          Q_Auxi.SQL.Add('  and combustible=2');
          Q_Auxi.SQL.Add('Group by combustible');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xLectIni:=Q_AuxiReal1.AsFloat;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select sum(Volumen) as Real1 From DPVGTURNT');          //03-12-15
          Q_Auxi.SQL.Add('Where Fecha = '+QuotedStr(FechaToStrSQL(VgFechaFin)));
          Q_Auxi.SQL.Add('  and Turno=3');
          Q_Auxi.SQL.Add('  and combustible=2');
          Q_Auxi.SQL.Add('Group by combustible');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xLectFin:=Q_AuxiReal1.AsFloat;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select coalesce(sum(d.volpemex),0) as Real1 from dpvgdocu d');
          Q_Auxi.SQL.Add('where exists (select e.folio from dpvgetan e');
          Q_Auxi.SQL.Add('                      where Fecha >='+QuotedStr(FechaToStrSQL(VgFechaIni)));
          Q_Auxi.SQL.Add('                        and Fecha <='+QuotedStr(FechaToStrSQL(VgFechaFin)));
          Q_Auxi.SQL.Add('                        and e.folio=d.folioentrada ');
          Q_Auxi.SQL.Add('                        and combustible=2)');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xEnt:=Q_AuxiReal1.AsFloat;
        finally
          Q_Auxi.Close;
        end;
        TotalPremium:=xLectIni+xEnt-xLectFin;  //03-12-15
      end;
      xDifComb:=TotalPremiumLiq-TotalPremium;
      xlin := 'D//'+_NOMBRESCOMBUSTIBLES[2]+'//'+FormatoMoneda(xLectIni)+'//'+FormatoMoneda(xEnt)+'//'+FormatoMoneda(xLectFin)+'//'+ FormatoNumero(TotalPremium,15,3) + '//' + FormatoNumero(PrecioPremium,5,2) + '//' + FormatoNumero(TotalPremium * PrecioPremium,15,3) + '//' +
              FormatoNumero(TotalPremiumLiq,15,3) + '//' + FormatoNumero(PrecioPremiumLiq,5,2) + '//' + FormatoNumero(TotalPremiumLiq * PrecioPremiumLiq,15,3) + '//' +
              FormatoNumero(xDifComb,15,3) + '//' + FormatoNumero(PrecioPremium,5,2) + '//' + FormatoNumero(xDifComb*PrecioPremium,15,3);
      BndDt.Items.Add(xlin);

      with DMCONS do begin
        try
          TotalDiesel:=0;        //03-12-15
          xLectIni:=0;
          xLectFin:=0;
          xEnt:=0;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select sum(Volumen) as Real1 From DPVGTURNT');      //03-12-15
          Q_Auxi.SQL.Add('Where Fecha = '+QuotedStr(FechaToStrSQL(VgFechaIni-1)));
          Q_Auxi.SQL.Add('  and Turno=3');
          Q_Auxi.SQL.Add('  and combustible=3');
          Q_Auxi.SQL.Add('Group by combustible');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xLectIni:=Q_AuxiReal1.AsFloat;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select sum(Volumen) as Real1 From DPVGTURNT');         //03-12-15
          Q_Auxi.SQL.Add('Where Fecha = '+QuotedStr(FechaToStrSQL(VgFechaFin)));
          Q_Auxi.SQL.Add('  and Turno=3');
          Q_Auxi.SQL.Add('  and combustible=3');
          Q_Auxi.SQL.Add('Group by combustible');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xLectFin:=Q_AuxiReal1.AsFloat;
          Q_Auxi.close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select coalesce(sum(d.volpemex),0) as Real1 from dpvgdocu d');
          Q_Auxi.SQL.Add('where exists (select e.folio from dpvgetan e');
          Q_Auxi.SQL.Add('                      where Fecha >='+QuotedStr(FechaToStrSQL(VgFechaIni)));
          Q_Auxi.SQL.Add('                        and Fecha <='+QuotedStr(FechaToStrSQL(VgFechaFin)));
          Q_Auxi.SQL.Add('                        and e.folio=d.folioentrada ');
          Q_Auxi.SQL.Add('                        and combustible=3)');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xEnt:=Q_AuxiReal1.AsFloat;
        finally
          Q_Auxi.Close;
        end;
        TotalDiesel:=xLectIni+xEnt-xLectFin;  //03-12-15
      end;
      xDifComb:=TotalDieselLiq-TotalDiesel;
      xlin := 'D//'+_NOMBRESCOMBUSTIBLES[3]+'//'+FormatoMoneda(xLectIni)+'//'+FormatoMoneda(xEnt)+'//'+FormatoMoneda(xLectFin)+'//'+FormatoNumero(TotalDiesel,15,3) + '//' + FormatoNumero(PrecioDiesel,5,3) + '//' + FormatoNumero(TotalDiesel * PrecioDiesel,15,3) + '//' +
              FormatoNumero(TotalDieselLiq,15,3) + '//' + FormatoNumero(PrecioDieselLiq,5,2) + '//' + FormatoNumero(TotalDieselLiq * PrecioDieselLiq,15,3) + '//' +
              FormatoNumero(xDifComb,15,3) + '//' + FormatoNumero(PrecioDiesel,5,2) + '//' + FormatoNumero(xDifComb*PrecioDiesel,15,3);
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
      DMCONS.Q_Auxi.Close;
      Q_Auxi.Close;
      Q_PreciosVol.Close;
      Q_PreciosLiq.Close;
      Q_Volumetricos.Close;
      Q_Liquidaciones.Close;
      Q_Entradas.Close;
    end;
  end;
end;

procedure TFLIQREP38.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN, DMLIQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    if ModoRep=1 then //03-12-15
      QRLRep.Caption:=QRLRep.Caption+'*';
    QRLEstacion.Caption:=FLIQREP38P.DBLookupComboBox2.Text;//DMGEN_VTAS.NombreSucursalActual;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  if ModoRep=0 then
    QRLSistema.Caption:=IdSistNombre
  else
    QRLSistema.Caption:='';
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP38.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with QRLabelDeta[k] do begin
        if k=1 then
          Alignment:=taLeftJustify
        else
          Alignment:=taRightJustify;
        AutoSize:=False;
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Frame.DrawLeft:=False;
        Frame.DrawRight:=False;
        Font.Size:=8;
        if xtp='Y' then begin
//          Font.Style:=[fsBold];
          Frame.DrawTop:=true;
          Frame.DrawBottom:=true;
          Frame.DrawLeft:=True;
          Frame.DrawRight:=True;
        end;
        if xtp='R' then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>1 then Frame.DrawTop:=true;
        end;
        if xtp='Z' then begin
          Alignment:=taRightJustify;
          if k in[2,3] then begin
            AutoSize:=True;
            Alignment:=taLeftJustify;
          end;
        end;
        if xtp='X' then begin
          Font.Style:=[fsBold];
          if k=6 then Frame.DrawTop:=true;
        end;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDeta[k].Caption:=ExtraeElemStr(xlin,k-ri+2);
    end;
  end;

begin
  BndDt.Frame.DrawBottom:=false;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  if xtp='E' then BndDt.Frame.DrawBottom:=true;
  InicializaEtiquetas(1,13);
  ExtraeEtiquetas(1,13);
end;

procedure TFLIQREP38.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP38.PreparaReporte2(xModo: integer);
var
    i:Integer;
    xfecha:TDateTime;
    Entrada,
    TotalLitros, TotalImporte,
    TotalLitrosLiq, TotalImporteLiq,
    TotalMagna, TotalPremium, TotalDiesel, Ajus,
    TotalMagnaLiq, TotalPremiumLiq, TotalDieselLiq,
    PrecioMagna, PrecioPremium, PrecioDiesel, Precio,
    PrecioMagnaLiq, PrecioPremiumLiq, PrecioDieselLiq, PrecioLiq,
    CombusMagnaAnt, CombusPremiumAnt, CombusDieselAnt,
    CombusMagna, CombusPremium, CombusDiesel: Double;
//    tot:Array[3..10] of real;
//    tota:Array[3..10] of real;
begin
  with DMGEN, DMCONS, DMGAS do begin
    ModoRep:=xModo;
    xancho:=78;
    CreaEtiquetas;
    BndDt.Items.Clear;
    try
      TotalLitros := 0;
      TotalImporte := 0;
      Q_Volumetricos.Close;
      Q_Volumetricos.ParamByName('PFechaIni').AsDateTime:=VgFechaIni;
      Q_Volumetricos.ParamByName('PFechaFin').AsDateTime:=VgFechaFin;
      Q_Volumetricos.Prepare;
      Q_Volumetricos.Open;
      Q_Volumetricos.First;

      Q_Entradas.Close;
      Q_Entradas.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
      Q_Entradas.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
      Q_Entradas.Prepare;
      Q_Entradas.Open;
      FAvance.PreparaAvance('Preparando reporte...',true,Q_Volumetricos.RecordCount);

      DMCONS.Q_Auxi.Close;
      DMCONS.Q_AuxiEntero1.FieldKind := fkInternalCalc;
      DMCONS.Q_Auxi.SQL.Clear;
      DMCONS.Q_Auxi.SQL.Add('select max(turno) as Entero1');
      DMCONS.Q_Auxi.SQL.Add(' from dpvgturnt');
      DMCONS.Q_Auxi.SQL.Add(' where Fecha >= ((:PFecha) - 1)');
      DMCONS.Q_Auxi.ParamByName('PFecha').AsDateTime := VgFechaIni;
      DMCONS.Q_Auxi.Prepare;
      DMCONS.Q_Auxi.Open;
      while not Q_Volumetricos.Eof do begin
        if (Q_VolumetricosFECHA.AsDateTime = (VgFechaIni-1)) and (Q_VolumetricosTURNO.AsInteger <> DMCONS.Q_AuxiEntero1.AsInteger) then begin
          Q_Volumetricos.Next;
          Continue;
        end;
        if Q_VolumetricosCOMBUSTIBLE.AsInteger = Magna then
          CombusMagnaAnt := Q_VolumetricosVOLUMEN.AsFloat;
        if Q_VolumetricosCOMBUSTIBLE.AsInteger = Premium then
          CombusPremiumAnt := Q_VolumetricosVOLUMEN.AsFloat;
        if Q_VolumetricosCOMBUSTIBLE.AsInteger = Diesel then
          CombusDieselAnt := Q_VolumetricosVOLUMEN.AsFloat;
        Q_Volumetricos.Next;
        if Q_Entradas.Locate('Fecha;Turno;Tanque;Combustible',VarArrayOf([Q_VolumetricosFECHA.AsDateTime,Q_VolumetricosTURNO.AsInteger,
                              Q_VolumetricosTANQUE.AsInteger,Q_VolumetricosCOMBUSTIBLE.AsInteger]),[]) then
          Entrada := Q_EntradasVOLUMENRECEPCION.AsFloat
        else
          Entrada := 0;
        if (CombusMagnaAnt > 0) and (Q_VolumetricosCOMBUSTIBLE.AsInteger = Magna) then begin
          CombusMagna := (CombusMagnaAnt + Entrada) - Q_VolumetricosVOLUMEN.AsFloat;
        end;
        if (CombusPremiumAnt > 0) and (Q_VolumetricosCOMBUSTIBLE.AsInteger = Premium) then begin
          CombusPremium := (CombusPremiumAnt + Entrada) - Q_VolumetricosVOLUMEN.AsFloat;
        end;
        if (CombusDieselAnt > 0) and (Q_VolumetricosCOMBUSTIBLE.AsInteger = Diesel) then begin
          CombusDiesel := (CombusDieselAnt + Entrada) - Q_VolumetricosVOLUMEN.AsFloat;
        end;
        TotalMagna := TotalMagna + CombusMagna;
        TotalPremium := TotalPremium + CombusPremium;
        TotalDiesel := TotalDiesel + CombusDiesel;
        CombusMagna := 0;
        CombusPremium := 0;
        CombusDiesel := 0;
      end;

      for i := 1 to 3 do begin
        Q_PreciosVol.Close;
        Q_PreciosVol.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
        Q_PreciosVol.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
        Q_PreciosVol.ParamByName('PCombus').AsInteger := i;
        Q_PreciosVol.Prepare;
        Q_PreciosVol.Open;
        if Q_PreciosVolPRECIO.AsFloat = 0 then begin
          DMCONS.Q_Auxi.Close;
          DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
          DMCONS.Q_Auxi.SQL.Clear;
          DMCONS.Q_Auxi.SQL.Add('select precio as Real1');
          DMCONS.Q_Auxi.SQL.Add(' from dpvgprec');
          DMCONS.Q_Auxi.SQL.Add(' where fechahora = (select max(fechahora) from dpvgprec where fechahora<= :PFecha)');
          DMCONS.Q_Auxi.SQL.Add(' and combustible = :PCombus');
          DMCONS.Q_Auxi.SQL.Add(' and aplicado = "Si"');
          DMCONS.Q_Auxi.SQL.Add(' and en_edicion = "No"');
          DMCONS.Q_Auxi.SQL.Add(' and error = "No"');
          DMCONS.Q_Auxi.ParamByName('PFecha').AsDateTime := VgFechaIni;
          DMCONS.Q_Auxi.ParamByName('PCombus').AsInteger := i;
          DMCONS.Q_Auxi.Prepare;
          DMCONS.Q_Auxi.Open;
          Precio := DMCONS.Q_AuxiReal1.AsFloat;
          DMCONS.Q_Auxi.Close;
        end
        else
          Precio := Q_PreciosVolPRECIO.AsFloat;

        Q_Liquidaciones.Close;
        Q_Liquidaciones.ParamByName('PEst').AsInteger := DMGEN_VTAS.SucursalActual;
        Q_Liquidaciones.ParamByName('PCombus').AsInteger := i;
        Q_Liquidaciones.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
        Q_Liquidaciones.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
        Q_Liquidaciones.Prepare;
        Q_Liquidaciones.Open;

        Ajus := 0;
        if ModoRep = 0 then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind := fkInternalCalc;
          Q_AuxiReal2.FieldKind := fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1, sum(Total) as Real2');
          Q_Auxi.SQL.Add(' From DGASAJUD2');
          Q_Auxi.SQL.Add(' Where Estacion = :PEst');
          Q_Auxi.SQL.Add(' and Combustible = :PCombus');
          Q_Auxi.SQL.Add(' and Fecha>=:PFechaIni');
          Q_Auxi.SQL.Add(' and Fecha<=:PFechaFin');
          Q_Auxi.ParamByName('PEst').AsInteger := DMGEN_VTAS.SucursalActual;
          Q_Auxi.ParamByName('PCombus').AsInteger := i;
          Q_Auxi.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
          Q_Auxi.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          Ajus := Q_AuxiReal1.AsFloat;
          Q_Auxi.Close;
        end;

        Q_PreciosLiq.Close;
        Q_PreciosLiq.ParamByName('PFechaIni').AsDateTime := VgFechaIni;
        Q_PreciosLiq.ParamByName('PFechaFin').AsDateTime := VgFechaFin;
        Q_PreciosLiq.ParamByName('PCombus').AsInteger := i;
        Q_PreciosLiq.Prepare;
        Q_PreciosLiq.Open;
        if Q_PreciosLiqPRECIO.AsFloat = 0 then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind := fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select precio as Real1');
          Q_Auxi.SQL.Add(' from dgasprec');
          Q_Auxi.SQL.Add(' where ');
          Q_Auxi.SQL.Add(' fecha = (select max(fecha) from dgasprec where fecha<= :PFecha)');
          Q_Auxi.SQL.Add(' and combustible = :PCombus');
//          Q_Auxi.SQL.Add(' and aplicado = "Si"');
          Q_Auxi.ParamByName('PFecha').AsDateTime := VgFechaIni;
          Q_Auxi.ParamByName('PCombus').AsInteger := i;
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          PrecioLiq := Q_AuxiReal1.AsFloat;
          Q_Auxi.Close;
        end
        else
          PrecioLiq := Q_PreciosLiqPRECIO.AsFloat;
        if i = Magna then begin
          TotalMagnaLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
          PrecioMagna := Precio;
          PrecioMagnaLiq := PrecioLiq;
        end;
        if i = Premium then begin
          TotalPremiumLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
          PrecioPremium := Precio;
          PrecioPremiumLiq := PrecioLiq;
        end;
        if i = Diesel then begin
          TotalDieselLiq := Q_LiquidacionesCOMBUS.AsFloat - Ajus;
          PrecioDiesel := Precio;
          PrecioDieselLiq := PrecioLiq;
        end;
        Q_Liquidaciones.Close;
      end;

      xlin := 'D//'+_NOMBRESCOMBUSTIBLES[1]+'//'+FormatoNumero(TotalMagna,15,3) + '//' + FormatoNumero(PrecioMagna,5,2) + '//' + FormatoNumero(TotalMagna * PrecioMagna,15,3) + '//' +
              FormatoNumero(TotalMagnaLiq,15,3) + '//' + FormatoNumero(PrecioMagnaLiq,5,2) + '//' + FormatoNumero(TotalMagnaLiq * PrecioMagnaLiq,15,3) + '//' +
              FormatoNumero(TotalMagna - TotalMagnaLiq,15,3) + '//' + FormatoNumero(PrecioMagna,5,2) + '//' + FormatoNumero((TotalMagna - TotalMagnaLiq)*PrecioMagna,15,3);
      BndDt.Items.Add(xlin);
      xlin := 'D//'+_NOMBRESCOMBUSTIBLES[2]+'//'+FormatoNumero(TotalPremium,15,3) + '//' + FormatoNumero(PrecioPremium,5,2) + '//' + FormatoNumero(TotalPremium * PrecioPremium,15,3) + '//' +
              FormatoNumero(TotalPremiumLiq,15,3) + '//' + FormatoNumero(PrecioPremiumLiq,5,2) + '//' + FormatoNumero(TotalPremiumLiq * PrecioPremiumLiq,15,3) + '//' +
              FormatoNumero(TotalPremium - TotalPremiumLiq,15,3) + '//' + FormatoNumero(PrecioPremium,5,2) + '//' + FormatoNumero((TotalPremium - TotalPremiumLiq)*PrecioPremium,15,3);
      BndDt.Items.Add(xlin);
      xlin := 'D//'+_NOMBRESCOMBUSTIBLES[3]+'//'+FormatoNumero(TotalDiesel,15,3) + '//' + FormatoNumero(PrecioDiesel,5,3) + '//' + FormatoNumero(TotalDiesel * PrecioDiesel,15,3) + '//' +
              FormatoNumero(TotalDieselLiq,15,3) + '//' + FormatoNumero(PrecioDieselLiq,5,2) + '//' + FormatoNumero(TotalDieselLiq * PrecioDieselLiq,15,3) + '//' +
              FormatoNumero(TotalDiesel - TotalDieselLiq,15,3) + '//' + FormatoNumero(PrecioDiesel,5,2) + '//' + FormatoNumero((TotalDiesel - TotalDieselLiq)*PrecioDiesel,15,3);
      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
      DMCONS.Q_Auxi.Close;
      Q_Auxi.Close;
      Q_PreciosVol.Close;
      Q_PreciosLiq.Close;
      Q_Volumetricos.Close;
      Q_Liquidaciones.Close;
      Q_Entradas.Close;
    end;
  end;

end;

procedure TFLIQREP38.CreaEtiquetasftc;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
  for i:=1 to 13 do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Combustible';
        2:Caption:='Lect. Inicial';
        3:Caption:='Entradas Fct.';
        4:Caption:='Lect. Final';
        5,8,11:Caption:='Litros';
        6,9,12:Caption:='Precio';
        7,10,13:Caption:='Importe';
      end;
      Case i of
        1:xw:=77;
        2:xw:=75;
        3:xw:=75;
        4:xw:=75;
        5,6,7:xw:=77;
        8,9,10:xw:=77;
        11,12,13:xw:=77;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=False;
      Frame.DrawBottom:=False;
      Frame.DrawLeft:=true;
      Frame.DrawRight:=true;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taRightJustify;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=False;
      Frame.DrawBottom:=False;
      Frame.DrawLeft:=False;
      Frame.DrawRight:=False;
      Frame.Width:=1;
      if i=1 then Alignment :=taCenter;
    end;
    xl:=xl+xw+0;
  end;
  xwid:=xl;
end;

end.

