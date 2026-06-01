unit ULIQGRF07;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, GanttCh, TeeProcs, Chart, StdCtrls, Buttons,
  ExtCtrls, DB, DBTables, RxMemDS, Grids, DBGrids, ImgList, ActnList, Menus,
  DateUtils;

type
  TFLIQGRF07 = class(TForm)
    ScrollBox1: TScrollBox;
    MainMenu1: TMainMenu;
    Grfica1: TMenuItem;
    Salir1: TMenuItem;
    ActionList1: TActionList;
    ActionMostrarlosDatos: TAction;
    ActionMostrarLeyendas: TAction;
    ActionOpcImpresora: TAction;
    ActionPrever: TAction;
    ActionImprimir: TAction;
    ActionSalir: TAction;
    ImageList1: TImageList;
    PopupMenuDesCant: TPopupMenu;
    DesactivarCantidades1: TMenuItem;
//    Series1: TLineSeries;
//    Series2: TLineSeries;
//    Series3: TLineSeries;
//    Series4: TLineSeries;
//    Series5: TLineSeries;
    Impresora1: TMenuItem;
    QL_AjusM: TQuery;
    QL_AjusMMES: TSmallintField;
    QL_AjusMANIO: TSmallintField;
    QL_AjusMTOTAL: TFloatField;
    QL_AjusA: TQuery;
    QL_AjusATOTAL: TFloatField;
    QL_AjusAANIO: TSmallintField;
    QL_AjusAT: TQuery;
    QL_AjusMT: TQuery;
    QL_AjusMTTOTAL: TFloatField;
    QL_AjusMTMES: TSmallintField;
    QL_AjusMTANIO: TSmallintField;
    QL_AjusATTOTAL: TFloatField;
    QL_AjusATANIO: TSmallintField;
//    Series6: TLineSeries;
//    Series7: TLineSeries;
//    Series8: TLineSeries;
//    Series10: TLineSeries;
    QL_AjusMESTACION: TIntegerField;
    QL_AjusAESTACION: TIntegerField;
    cht1: TChart;
    PieSeries1: TPieSeries;
    PrintDialog1: TPrintDialog;
    procedure ActionSalirExecute(Sender: TObject);
    procedure DesactivarCantidades1Click(Sender: TObject);
    procedure PopupMenuDesCantPopup(Sender: TObject);
    procedure Impresora1Click(Sender: TObject);
  private
    { Private declarations }
    Colores : array [1..4] of Integer;
    procedure CargaColores;
  public
    { Public declarations }
    procedure PreparaForma(xModo:integer);

  end;

var
  FLIQGRF07: TFLIQGRF07;

implementation

uses ULIQGRF05P, ULIBGRAL, ULIBDATABASE, Printers, DDMGAS, UAVANCE,
  ULIQGRF07P;

{$R *.dfm}

procedure TFLIQGRF07.PreparaForma(xModo:integer);
var
  TotalMayor, Total : Double;
  Dias, i : Integer;
  xLtsTotales:Double;
  xDias:Integer;
  xDato:string;
  xAceite:Real;
  xFI,xFF:TDateTime;
  xFecha:String;

  j,xcomb:Integer;
  xMes:string;

  xVta,xVtaAju:Real;
  xEstaciones:array[1..10] of Double;


begin
  CargaColores;
  cht1.Title.Text.Clear;
  if xModo=1 then //03-12-15
    cht1.Title.Text.Add('Ventas por tipo de combustible y aceites en importe*')
  else
    cht1.Title.Text.Add('Ventas por tipo de combustible y aceites en importe');
  for i:= 1 to 10 do
    xEstaciones[i]:=0;
  with FLIQGRF05P, DMGAS do begin
    Dias := DaysBetween(VgFechaIni,VgFechaFin);
    xDias:=DiasEntre(VgFechaIni, VgFechaFin)+1;

    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select c.combustible as Entero1, sum(c.Importe) as Real1');
    Q_Auxi.SQL.Add('From DGASDLIQC c');
    Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    if GBFecha.Visible then begin
      cht1.BottomAxis.Title.Caption:='Fecha';
    end
    else if GBMes.Visible then begin
      cht1.BottomAxis.Title.Caption:='Mes';
    end
    else if GBAnual.visible then begin
      cht1.BottomAxis.Title.Caption:='Año';
    end;
    Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado='+QuotedStr('Si')+')');
    Q_Auxi.SQL.Add(' group by entero1');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    Q_Auxi.First;
    if Q_AuxiEntero1.AsInteger=0 then
      raise Exception.Create('No se encontraron resultados con los parámetros proporcionados.');
    FAVANCE.PreparaAvance('Generando gráfica.',True,Q_Auxi.RecordCount);
    Q_Auxi.First;
    xLtsTotales:=0;
    while not Q_Auxi.Eof do begin
      xVta:=Q_AuxiReal1.AsFloat;
      xVtaAju:=0;
      xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime);
      if xModo=0 then begin
        try
          Q_Auxi2.Close;
          Q_Auxi2Real1.FieldKind:=fkInternalCalc;
          Q_Auxi2.SQL.Clear;
          Q_Auxi2.SQL.Add('select sum(coalesce(total,0)) as Real1 from DGASAJUD2');
          Q_Auxi2.SQL.Add('where fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
          Q_Auxi2.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
          Q_Auxi2.SQL.Add('  and combustible='+IntToStr(Q_AuxiEntero1.AsInteger));
          Q_Auxi2.Prepare;
          Q_Auxi2.Open;
          xVtaAju:=Q_Auxi2Real1.AsFloat;
        finally
          Q_Auxi2.Close;
        end;
        xVta:=xVta-xVtaAju;
      end;
      if Q_AuxiEntero1.AsInteger=1 then begin
        PieSeries1.AddXY(Q_AuxiEntero1.AsInteger,xVta,'Magna: '+FormatoMoneda(xVta),Colores[Q_AuxiEntero1.AsInteger]);
      end
      else if Q_AuxiEntero1.AsInteger=2 then begin
        PieSeries1.AddXY(Q_AuxiEntero1.AsInteger,xVta,'Premium: '+FormatoMoneda(xVta),Colores[Q_AuxiEntero1.AsInteger]);
      end
      else if Q_AuxiEntero1.AsInteger=3 then begin
        PieSeries1.AddXY(Q_AuxiEntero1.AsInteger,xVta,'Diesel: '+FormatoMoneda(xVta),Colores[Q_AuxiEntero1.AsInteger]);
      end;
      xLtsTotales:=xLtsTotales+ {Q_AuxiReal1.AsFloat}xVta;
      Q_Auxi.Next;
      FAVANCE.AvanzaPosicion;
    end;

    try
      Q_Auxi2.Close;
      Q_Auxi2Real1.FieldKind:=fkInternalCalc;
      Q_Auxi2.sql.Clear;
      Q_Auxi2.SQL.Add('Select sum(a.Importe) as Real1 From DGASDLIQA a');
      Q_Auxi2.SQL.Add('where a.fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi2.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
      Q_Auxi2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
      Q_Auxi2.Prepare;
      Q_Auxi2.Open;
      PieSeries1.AddXY(4,Q_Auxi2Real1.AsFloat,'Derivados: '+FormatoMoneda(Q_Auxi2Real1.AsFloat),Colores[4]); //TODO 15-02-16
    finally
      Q_Auxi2.Close;
    end;

    FAVANCE.Close;
//    Q_Auxi.Close;
//    Q_AuxiEntero2.FieldKind:=fkInternalCalc;
//    Q_AuxiReal1.FieldKind:=fkInternalCalc;
//    if GBFecha.Visible then begin
//      Q_AuxiDate1.FieldKind:=fkInternalCalc
//    end
//    else if GBMes.Visible then begin
//      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
//      Q_AuxiEntero3.FieldKind:=fkInternalCalc;
//      j:=0;
//    end
//    else
//      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
//    Q_Auxi.SQL.Clear;
//    Q_Auxi.SQL.Add('Select a.Estacion as Entero2, sum(a.Importe) as Real1, ');
//    if GBFecha.Visible then begin
//      Q_Auxi.SQL.Add(' a.Fecha as Date1 ');
//      Q_Auxi.SQL.Add(' From DGASDLIQA a ');
//      Q_Auxi.SQL.Add('Where a.Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
//      Q_Auxi.SQL.Add('  and a.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
//    end
//    else if GBMes.Visible then begin
//      xDias:=0;
//      Q_Auxi.SQL.Add(' Extract(year from Fecha) as Entero3,');
//      Q_Auxi.SQL.Add(' Extract(month from a.Fecha) as Entero1 ');
//      Q_Auxi.SQL.Add('From DGASDLIQA a');
//      Q_Auxi.SQL.Add('Where a.Fecha>="'+FechaToStrSQL(MesDiaToFecha(VgMesIni,1))+'"');
//      Q_Auxi.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha(VgMesFin))+'"');
//
//    end
//    else if GBAnual.visible then begin
//      xDias:=0;
//      Q_Auxi.SQL.Add(' Extract(year from a.Fecha) as Entero1 ');
//      Q_Auxi.SQL.Add('From DGASDLIQA a');
//      Q_Auxi.SQL.Add('Where a.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
//      Q_Auxi.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
//    end;
//
//    Q_Auxi.SQL.Add('and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+QuotedStr('Si')+') ');
////    if not CBTodas.Checked then
////      Q_Auxi.SQL.Add('and a.Estacion='+IntToStr(estacion));
//    if GBFecha.Visible then
//      Q_Auxi.SQL.Add('group by Entero2,Date1')
//    else if GBMes.Visible then begin
//      Q_Auxi.SQL.Add('  group by Entero2,Entero3,Entero1');
//    end
//    else begin
//      Q_Auxi.SQL.Add('group by Entero2,Entero1');
//    end;
//
//    Q_Auxi.Prepare;
//    Q_Auxi.Open;
//    if GBFecha.Visible then begin
//      Q_Auxi.First;
//      xFI:=Q_AuxiDate1.AsDateTime;
//      Q_Auxi.Last;
//      xFF:=Q_AuxiDate1.AsDateTime;
//    end;
//    Q_Auxi.First;
//    if GBMes.Enabled then begin
//      xcomb:=Q_AuxiEntero1.AsInteger;
//      Inc(j);
//      xMes:='';
//    end;
//    for i := 0 to Dias do begin
//      if GBFecha.Visible then begin
//        xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime);
//        if Dias>31 then begin
//          if ((Q_AuxiDate1.AsDateTime<>xFI) and (Q_AuxiDate1.AsDateTime<>xFF)) or (Q_AuxiDate1.AsDateTime>xFF) then
//            xFecha:=''
//          else
//            xFecha:=xFecha;
//        end;
//        if (VgFechaIni+i) = Q_AuxiDate1.AsDateTime then begin
////          Series4.AddXY(Q_AuxiDate1.AsDateTime,Q_AuxiReal1.AsFloat,xFecha);
////          xLtsTotales:=xLtsTotales+ Q_AuxiReal1.AsFloat;
//          Q_Auxi.Next;
//        end
////        else
////          Series4.AddXY((VgFechaIni+i),0,xFecha);
////          Series4.AddXY((VgFechaIni+i),0,FechaPaq(VgFechaIni+i));
//      end
//      else if GBMes.Visible then begin
////        if (VgFechaIni+i) = Q_AuxiDate1.AsDateTime then begin
//          if xMes<>(Q_AuxiEntero3.AsString+Q_AuxiEntero1.AsString) then begin
//            xMes:=Q_AuxiEntero3.AsString+Q_AuxiEntero1.AsString;
//            Inc(j);
//          end;
////          Series4.AddXY({Q_AuxiEntero1.AsInteger}j,Q_AuxiReal1.AsFloat,DameMes(Q_AuxiEntero1.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
////          xLtsTotales:=xLtsTotales+ Q_AuxiReal1.AsFloat;
//          Q_Auxi.Next;
////        end
////        else
////          Series4.AddXY((VgFechaIni+i),0,DameMes(Q_AuxiEntero1.AsInteger+i));
//      end
//      else begin
////        if (VgFechaIni+i) = Q_AuxiDate1.AsDateTime then begin
////          Series4.AddXY(Q_AuxiEntero1.AsInteger,Q_AuxiReal1.AsFloat,IntToStr(Q_AuxiEntero1.AsInteger));
////          xLtsTotales:=xLtsTotales+ Q_AuxiReal1.AsFloat;
//          Q_Auxi.Next;
////        end
////        else
////          Series4.AddXY((VgFechaIni+i),0,IntToStr(Q_AuxiEntero1.AsInteger+i));
//      end;
//
//
//    end;

//    Q_Auxi2.Close;
//    Q_Auxi2Real1.FieldKind:=fkInternalCalc;
//    if GBFecha.Visible then
//      Q_Auxi2Date1.FieldKind:=fkInternalCalc
//    else if GBMes.Visible then begin
//      Q_Auxi2Entero1.FieldKind:=fkInternalCalc;
//      Q_Auxi2Entero3.FieldKind:=fkInternalCalc;
//      j:=0;
//    end
//    else
//      Q_Auxi2Entero1.FieldKind:=fkInternalCalc;
//    Q_Auxi2.SQL.Clear;
//    Q_Auxi2.SQL.Add('Select sum(coalesce(c.Importe,0)) as Real1, ');
//    if GBFecha.Visible then begin
//      Q_Auxi2.SQL.Add(' c.Fecha as Date1 ');
//      Q_Auxi2.SQL.Add('From DGASDLIQC c');
//      Q_Auxi2.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
//      Q_Auxi2.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
//    end
//    else if GBMes.Visible then begin
//      xDias:=0;
//      Q_Auxi2.SQL.Add(' Extract(year from Fecha) as Entero3,');
//      Q_Auxi2.SQL.Add(' Extract(month from Fecha) as Entero1 ');
//      Q_Auxi2.SQL.Add('From DGASDLIQC c');
//      Q_Auxi2.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(MesDiaToFecha(VgMesIni,1))+'"');
//      Q_Auxi2.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha(VgMesFin))+'"');
//      
//      QL_AjusMT.Close;
//      QL_AjusMT.SQL.Clear;
//      QL_AjusMT.SQL.Add('select sum(coalesce(Total,0)) as Total,');
//      QL_AjusMT.SQL.Add('Extract(month from Fecha) as Mes, Extract(year from Fecha) as Anio');
//      QL_AjusMT.SQL.Add('From DGASAJUD2 ');
//      QL_AjusMT.SQL.Add('Where Fecha>="'+FechaToStrSQL(MesDiaToFecha(VgMesIni,1))+'"');
//      QL_AjusMT.SQL.Add('  and Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha(VgMesFin))+'"');
//    end
//    else if GBAnual.visible then begin
//      xDias:=0;
//      Q_Auxi2.SQL.Add(' Extract(year from Fecha) as Entero1 ');
//      Q_Auxi2.SQL.Add('From DGASDLIQC c');
//      Q_Auxi2.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
//      Q_Auxi2.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
//
//      QL_AjusAT.Close;
//      QL_AjusAT.SQL.Clear;
//      QL_AjusAT.SQL.Add('select sum(coalesce(Total,0)) as Total, ');
//      QL_AjusAT.SQL.Add('  Extract(year from Fecha) as Anio');
//      QL_AjusAT.SQL.Add('From DGASAJUD2');
//      QL_AjusAT.SQL.Add('Where Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
//      QL_AjusAT.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
//    end;
//    Q_Auxi2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado='+QuotedStr('Si')+')');
////    if not CBTodas.Checked then
////      Q_Auxi2.SQL.Add('  and c.Estacion='+IntToStr(estacion));
//    if GBFecha.Visible then
//      Q_Auxi2.SQL.Add(' group by date1')
//    else if GBMes.Visible then begin
//      Q_Auxi2.SQL.Add(' group by Entero3,Entero1');
//      QL_AjusMT.SQL.Add('group by Anio,Mes');
//      QL_AjusMT.Prepare;
//      QL_AjusMT.Open;
//    end
//    else begin
//      Q_Auxi2.SQL.Add(' group by Entero1');
//      QL_AjusAT.SQL.Add('group by Anio');
//      QL_AjusAT.Prepare;
//      QL_AjusAT.Open;
//    end;
//    Q_Auxi2.Prepare;
//    Q_Auxi2.Open;
//    if GBFecha.Visible then begin
//      Q_Auxi2.First;
//      xFI:=Q_Auxi2Date1.AsDateTime;
//      Q_Auxi2.Last;
//      xFF:=Q_Auxi2Date1.AsDateTime;
//    end;
//    Q_Auxi2.First;
//    Q_Auxi.First;
//    TotalMayor := 0;
//    xLtsTotales:=0;
//    xDias:=0;
//    FAVANCE.PreparaAvance('Generando gráfica.',True,Q_Auxi2.RecordCount);
//    if GBMes.Enabled then begin
//      xcomb:=Q_AuxiEntero1.AsInteger;
//      Inc(j);
//      xMes:='';
//    end;
//    while not Q_Auxi2.Eof do begin
//      xVtaAju:=0;
//      Inc(xDias);
//      Total := Q_Auxi2Real1.AsFloat;
//      xVta :=Q_Auxi2Real1.AsFloat;
//
////      if Q_Auxi2Date1.AsDateTime = Q_AuxiDate1.AsDateTime then begin
////        Total := Q_Auxi2Real1.AsFloat+Q_AuxiReal1.AsFloat;
////        Q_Auxi.Next;
////      end;
//      if Total > TotalMayor then begin
//        TotalMayor := Q_Auxi2Real1.AsFloat+xAceite;
//      end;
////      xLtsTotales:= xLtsTotales+Total;
//      if GBFecha.Visible then begin
//        if xModo=0 then begin
//          try
//            Q_Auxi3.Close;
//            Q_Auxi3Real1.FieldKind:=fkInternalCalc;
//            Q_Auxi3.SQL.Clear;
//            Q_Auxi3.SQL.Add('select sum(coalesce(total,0)) as Real1 from DGASAJUD2');
//            Q_Auxi3.SQL.Add('where fecha='+QuotedStr(FechaToStrSQL(Q_Auxi2Date1.AsDateTime)));
////            Q_Auxi2.SQL.Add('  and estacion='+IntToStr(Q_AuxiEntero1.AsInteger));
//            Q_Auxi3.Prepare;
//            Q_Auxi3.Open;
//            xVtaAju:=Q_Auxi3Real1.AsFloat;
//          finally
//            Q_Auxi3.Close;
//          end;
//          Total:=Total-xVtaAju;
//        end;
//        try
//          Q_Auxi3.Close;
//          Q_Auxi3Real1.FieldKind:=fkInternalCalc;
//          Q_Auxi3.sql.Clear;
//          Q_Auxi3.SQL.Add('Select sum(a.Importe) as Real1 From DGASDLIQA a');
//          Q_Auxi3.SQL.Add('Where a.Fecha='+QuotedStr(FechaToStrSQL(Q_Auxi2Date1.AsDateTime)));
////          Q_Auxi2.SQL.Add('  and estacion='+IntToStr(Q_AuxiEntero1.AsInteger));
//          Q_Auxi3.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
//          Q_Auxi3.Prepare;
//          Q_Auxi3.Open;
//          Total:=Total+Q_Auxi3Real1.AsFloat;
//        finally
//          Q_Auxi3.Close;
//        end;
//        xFecha:=FechaPaq(Q_Auxi2Date1.AsDateTime);
//        if Dias>31 then begin
//          if ((Q_Auxi2Date1.AsDateTime<>xFI) and (Q_Auxi2Date1.AsDateTime<>xFF)) or (Q_Auxi2Date1.AsDateTime>xFF) then
//            xFecha:=''
//          else
//            xFecha:=xFecha;
//        end;
//        Series10.AddXY(Q_Auxi2Date1.AsDateTime,{Total-xVtaAju}Total,xFecha);
//      end
//      else if GBMes.Visible then begin
//        if xMes<>(Q_Auxi2Entero3.AsString+Q_Auxi2Entero1.AsString) then begin
//          xMes:=Q_Auxi2Entero3.AsString+Q_Auxi2Entero1.AsString;
//          Inc(j);
//        end;
//        if xModo=0 then begin
//          if QL_AjusMT.Locate('Anio;Mes',VarArrayOf([Q_Auxi2Entero3.AsInteger,Q_Auxi2Entero1.AsInteger]),[]) then
//            xVtaAju:=QL_AjusMTTOTAL.AsFloat;
//          Total:=Total-xVtaAju;
//        end;
//        try
//          Q_Auxi3.Close;
//          Q_Auxi3Real1.FieldKind:=fkInternalCalc;
//          Q_Auxi3.SQL.Clear;
//          Q_Auxi3.SQL.Add('Select sum(a.Importe) as Real1 ');
//          Q_Auxi3.SQL.Add('From DGASDLIQA a');
//          Q_Auxi3.SQL.Add('Where a.Fecha>="'+FechaToStrSQL(MesDiaToFecha((Q_Auxi2Entero3.AsString+IntToClaveNum(Q_Auxi2Entero1.AsInteger,2)),1))+'"');
//          Q_Auxi3.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha((Q_Auxi2Entero3.AsString+IntToClaveNum(Q_Auxi2Entero1.AsInteger,2))))+'"');
//          Q_Auxi3.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
//          Q_Auxi3.Prepare;
//          Q_Auxi3.Open;
//          Total:=Total+Q_Auxi3Real1.AsFloat;
//        finally
//          Q_Auxi3.Close;
//        end;
//        Series10.AddXY({Q_Auxi2Entero1.AsInteger}j,Total{-xVtaAju},DameMes(Q_Auxi2Entero1.AsInteger));
//      end
//      else begin
//        if xModo=0 then begin
//          if QL_AjusAT.Locate('Anio',Q_Auxi2Entero1.AsInteger,[]) then
//            xVtaAju:=QL_AjusATTOTAL.AsFloat;
//          Total:=Total-xVtaAju;
//        end;
//        try
//          Q_Auxi3.Close;
//          Q_Auxi3Real1.FieldKind:=fkInternalCalc;
//          Q_Auxi3.SQL.Clear;
//          Q_Auxi3.SQL.Add('Select sum(a.Importe) as Real1 ');
//          Q_Auxi3.SQL.Add('From DGASDLIQA a');
//          Q_Auxi3.SQL.Add('Where a.Fecha>="'+FechaToStrSQL(MesDiaToFecha((Q_Auxi2Entero1.AsString+'01'),1))+'"');
//          Q_Auxi3.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha((Q_Auxi2Entero1.AsString+'12')))+'"');
////          Q_Auxi3.SQL.Add('  and a.estacion='+IntToStr(Q_AuxiEntero1.AsInteger));
//          Q_Auxi3.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
//          Q_Auxi3.Prepare;
//          Q_Auxi3.Open;
//          Total:=Total+Q_Auxi3Real1.AsFloat;
//        finally
//          Q_Auxi3.Close;
//        end;
//        Series10.AddXY(Q_Auxi2Entero1.AsInteger,Total,IntToStr(Q_Auxi2Entero1.AsInteger));
//      end;
////      xLtsTotales:= xLtsTotales+Total-xVtaAju;
//      xLtsTotales:= xLtsTotales+Total;
//      Q_Auxi2.Next;
//      FAVANCE.AvanzaPosicion;
//    end;
//    FAVANCE.Close;
    cht1.LeftAxis.Minimum := 0;
    cht1.LeftAxis.Maximum := TotalMayor+1000;
    Q_Auxi2.Close;
    Q_Auxi.Close;
//    if not CBTodas.Checked then
//      Chart1.Title.Text.Add(DBLookupComboBox2.Text+'          Promedio:'+FormatoMoneda(DivideFloat(xLtsTotales,xDias)))
//    else
    cht1.Title.Text.Add('Todas las Estaciones');
    if GBFecha.Visible then
      cht1.Title.Text.Add(RangoFecha(VgFechaIni,VgFechaFin))
    else if GBMes.Visible then
      cht1.Title.Text.Add('Del mes: '+FLIQGRF07P.MesBox1.Text+' al mes: '+FLIQGRF07P.MesBox2.Text)
    else
      cht1.Title.Text.Add('Del año: '+FLIQGRF07P.AnioBox1.Text+' al año: '+FLIQGRF07P.AnioBox2.Text);
  end;
end;

procedure TFLIQGRF07.ActionSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFLIQGRF07.DesactivarCantidades1Click(Sender: TObject);
begin
  PieSeries1.Marks.Visible:=not PieSeries1.Marks.Visible;
//  Series1.Marks.Visible := not Series1.Marks.Visible;
//  Series2.Marks.Visible := not Series2.Marks.Visible;
//  Series3.Marks.Visible := not Series3.Marks.Visible;
//  Series4.Marks.Visible := not Series4.Marks.Visible;
//  Series5.Marks.Visible := not Series5.Marks.Visible;
//  Series6.Marks.Visible := not Series6.Marks.Visible;
//  Series7.Marks.Visible := not Series7.Marks.Visible;
//  Series8.Marks.Visible := not Series8.Marks.Visible;
//  Series9.Marks.Visible := not Series9.Marks.Visible;
//  Series10.Marks.Visible := not Series10.Marks.Visible;
end;

procedure TFLIQGRF07.PopupMenuDesCantPopup(Sender: TObject);
begin
  if PieSeries1.Marks.Visible then
    DesactivarCantidades1.Caption := 'Desactivar Cantidades'
  else
    DesactivarCantidades1.Caption := 'Activar Cantidades';
end;

procedure TFLIQGRF07.Impresora1Click(Sender: TObject);
begin
  with TPrintDialog.Create(nil) do begin
    try
      if Execute then begin
        cht1.Gradient.Visible:=False;
        cht1.PrintLandscape;
        cht1.Gradient.Visible:=True;
      end;
    finally
      Free;
    end;
  end;
//  QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
//  cht1.print
//  cht1.Gradient.Visible:=False;
//  cht1.PrintLandscape;
//  cht1.Gradient.Visible:=True;
end;

procedure TFLIQGRF07.CargaColores;
begin
  Colores[1] := clGreen;
  Colores[2] := clRed;
  Colores[3] := clBlack;
  Colores[4] := clOlive;
end;

end.
