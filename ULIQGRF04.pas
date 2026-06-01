unit ULIQGRF04;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, GanttCh, TeeProcs, Chart, StdCtrls, Buttons,
  ExtCtrls, DB, DBTables, RxMemDS, Grids, DBGrids, ImgList, ActnList, Menus,
  DateUtils;

type
  TFLIQGRF04 = class(TForm)
    Chart1: TChart;
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
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    TM_Datos: TRxMemoryData;
    TM_DatosMes: TStringField;
    TM_DatosLitros: TFloatField;
    TM_DatosFecha: TDateTimeField;
    TM_DatosAno: TIntegerField;
    TM_DatosCombustible: TIntegerField;
    TM_Suma: TRxMemoryData;
    TM_SumaAno: TIntegerField;
    TM_SumaMes: TStringField;
    TM_SumaFecha: TDateTimeField;
    TM_SumaLitros: TFloatField;
    Imprimir1: TMenuItem;
    QL_Ajus: TQuery;
    QL_AjusDIFERENCIA: TFloatField;
    QL_AjusMES: TSmallintField;
    QL_AjusANIO: TSmallintField;
    QL_AjusT: TQuery;
    QL_AjusTDIFERENCIA: TFloatField;
    QL_AjusTMES: TSmallintField;
    QL_AjusTANIO: TSmallintField;
    QL_AjusA: TQuery;
    QL_AjusADIFERENCIA: TFloatField;
    QL_AjusAANIO: TSmallintField;
    QL_AjusAT: TQuery;
    QL_AjusATDIFERENCIA: TFloatField;
    QL_AjusATANIO: TSmallintField;
    QL_AjusESTACION: TIntegerField;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series10: TLineSeries;
    QL_AjusAESTACION: TIntegerField;
    PrintDialog1: TPrintDialog;
    procedure ActionSalirExecute(Sender: TObject);
    procedure DesactivarCantidades1Click(Sender: TObject);
    procedure PopupMenuDesCantPopup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaForma(xModo:Integer);
  end;

var
  FLIQGRF04: TFLIQGRF04;

implementation

uses  ULIBGRAL, ULIBDATABASE, Printers, DDMGAS, UAVANCE, ULIQGRF04P;

{$R *.dfm}

procedure TFLIQGRF04.PreparaForma(xModo:Integer);
var
  TotalMayor : Double;
  FechaMayor : TDateTime;
  xDias:Integer;
  xLtsTotales:Real;
  xFecha:string;
  xFechaIni:TDateTime;
  i,xcomb:Integer;
  xMes:string;
  xVta:Real;
  xVtaAju:Real;
  xTotEst:array[1..10] of Real;

  function DameMes(xMes:Integer):string;
  begin
    Result:='Enero ';
    if xMes=2 then
      Result:='Febrero '
    else if xMes=3 then
      Result:='Marzo '
    else if xMes=4 then
      Result:='Abril '
    else if xMes=5 then
      Result:='Mayo '
    else if xMes=6 then
      Result:='Junio '
    else if xMes=7 then
      Result:='Julio '
    else if xMes=8 then
      Result:='Agosto '
    else if xMes=9 then
      Result:='Septiembre '
    else if xMes=10 then
      Result:='Octubre '
    else if xMes=11 then
      Result:='Noviembre '
    else if xMes=12 then
      Result:='Diciembre '
  end;
begin
  Chart1.Title.Text.Clear;
  if xModo=1 then //03-12-15
    Chart1.Title.Text.Add('Ventas en litros de combustibles por estación*')
  else
    Chart1.Title.Text.Add('Ventas en litros de combustibles por estación');
  for i:= 1 to 10 do begin
    xTotEst[i]:=0;
  end;
  with FLIQGRF04P, DMGAS do begin
    xDias:=DiasEntre(VgFechaIni, VgFechaFin)+1;
    dmgas.Q_Auxi.Close;
    dmgas.Q_AuxiReal1.FieldKind:=fkInternalCalc;
    dmgas.Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    if GBFecha.Visible then begin
      dmgas.Q_AuxiDate1.FieldKind:=fkInternalCalc;
    end
    else if GBMes.Visible then begin
      dmgas.Q_AuxiEntero2.FieldKind:=fkInternalCalc;
      dmgas.Q_AuxiEntero3.FieldKind:=fkInternalCalc;
      i:=0;
    end
    else begin
      dmgas.Q_AuxiEntero2.FieldKind:=fkInternalCalc;
    end;
    dmgas.Q_Auxi.SQL.Clear;
    dmgas.Q_Auxi.SQL.Add('Select c.Estacion as Entero1, sum(c.Cantidad) as Real1,');

    if GBFecha.Visible then begin
      Chart1.BottomAxis.Title.Caption:='Fecha';
      dmgas.Q_Auxi.SQL.Add(' c.Fecha as Date1 ');
      dmgas.Q_Auxi.SQL.Add('From DGASDLIQC c');
      dmgas.Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      dmgas.Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    end
    else if GBMes.Visible then begin
      Chart1.BottomAxis.Title.Caption:='Mes';
      xDias:=0;
      dmgas.Q_Auxi.SQL.Add(' Extract(month from Fecha) as Entero2, Extract(year from Fecha) as Entero3 ');
      dmgas.Q_Auxi.SQL.Add('From DGASDLIQC c');
      dmgas.Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(MesDiaToFecha(VgMesIni,1))+'"');
      dmgas.Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha(VgMesFin))+'"');

      QL_Ajus.Close;
      QL_Ajus.SQL.Clear;
      QL_Ajus.SQL.Add('select Estacion, sum(coalesce(Diferencia,0)) as Diferencia,');
      QL_Ajus.SQL.Add(' Extract(month from Fecha) as Mes, Extract(year from Fecha) as Anio ');
      QL_Ajus.SQL.Add('From DGASAJUD2');
      QL_Ajus.SQL.Add('Where Fecha>="'+FechaToStrSQL(MesDiaToFecha(VgMesIni,1))+'"');
      QL_Ajus.SQL.Add('  and Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha(VgMesFin))+'"');
    end
    else if GBAnual.visible then begin
      Chart1.BottomAxis.Title.Caption:='Año';
      xDias:=0;
      dmgas.Q_Auxi.SQL.Add(' Extract(year from Fecha) as Entero2 ');
      dmgas.Q_Auxi.SQL.Add('From DGASDLIQC c');
      dmgas.Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      dmgas.Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');

      QL_AjusA.Close;
      QL_AjusA.SQL.Clear;
      QL_AjusA.SQL.Add('select Estacion,sum(coalesce(Diferencia,0)) as Diferencia,');
      QL_AjusA.SQL.Add('  Extract(year from Fecha) as Anio');
      QL_AjusA.SQL.Add('From DGASAJUD2 ');
      QL_AjusA.SQL.Add('Where Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      QL_AjusA.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    end;
    dmgas.Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado='+QuotedStr('Si')+')');
//    if not CBTodas.Checked then begin
//      dmgas.Q_Auxi.SQL.Add('  and c.Estacion='+IntToStr(estacion));
//      QL_Ajus.SQL.Add('  and Estacion='+IntToStr(estacion));
//      QL_AjusA.SQL.Add('  and Estacion='+IntToStr(estacion));
//    end;
    if GBFecha.Visible then begin
      dmgas.Q_Auxi.SQL.Add('  group by Entero1, Date1');
    end
    else if GBMes.Visible then begin
      dmgas.Q_Auxi.SQL.Add('  group by Entero3,Entero2,Entero1');
      QL_Ajus.SQL.Add('  group by Anio,Mes,Estacion');
      QL_Ajus.Prepare;
      QL_Ajus.Open;
    end
    else begin
      dmgas.Q_Auxi.SQL.Add('  group by Entero2,Entero1');
      QL_AjusA.SQL.Add('  group by Anio,Estacion');
      QL_AjusA.Prepare;
      QL_AjusA.Open;
    end;
    dmgas.Q_Auxi.Prepare;
    dmgas.Q_Auxi.Open;
    dmgas.Q_Auxi.First;


    if dmgas.Q_AuxiEntero1.AsInteger=0 then
      raise Exception.Create('No se encontraron resultados con los parámetros proporcionados.');
    TotalMayor := 0;
    FechaMayor := 0;
    xLtsTotales:=0;
    FAVANCE.PreparaAvance('Calculando Datos.',True,Q_Auxi.RecordCount);
    TM_Datos.Active:=False;
    TM_Datos.Active:=True;
    if GBMes.Enabled then begin
      xcomb:=Q_AuxiEntero1.AsInteger;
      Inc(i);
      xMes:='';
    end;
    while not Q_Auxi.Eof do begin
      xVta:=Q_AuxiReal1.AsFloat;
      xVtaAju:=0;
      if GBFecha.Visible then begin
        if xModo=0 then begin
          try
            Q_Auxi2.Close;
            Q_Auxi2Real1.FieldKind:=fkInternalCalc;
            Q_Auxi2.SQL.Clear;
            Q_Auxi2.SQL.Add('select sum(coalesce(diferencia,0)) as Real1 from DGASAJUD2');
            Q_Auxi2.SQL.Add('where fecha='+QuotedStr(FechaToStrSQL(Q_AuxiDate1.AsDateTime)));
//            if not CBTodas.Checked then
              Q_Auxi2.SQL.Add('  and estacion='+IntToStr(Q_AuxiEntero1.AsInteger));
//            Q_Auxi2.SQL.Add('  and combustible='+IntToStr(Q_AuxiEntero1.AsInteger));
            Q_Auxi2.Prepare;
            Q_Auxi2.Open;
            xVtaAju:=Q_Auxi2Real1.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime);
        if xDias>31 then begin
          if (Q_AuxiDate1.AsDateTime=VgFechaIni) or (Q_AuxiDate1.AsDateTime=VgFechaFin) then
            xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime)
          else
            xFecha:='';
        end;
        if Q_AuxiEntero1.AsInteger=1 then begin
          Series1.AddXY(Q_AuxiDate1.AsDateTime,{Q_AuxiReal1.AsFloat}xVta,xFecha);
        end
        else if Q_AuxiEntero1.AsInteger=2 then begin
          Series2.AddXY(Q_AuxiDate1.AsDateTime,{Q_AuxiReal1.AsFloat}xVta,xFecha);
        end
        else if Q_AuxiEntero1.AsInteger=3 then begin
          Series3.AddXY(Q_AuxiDate1.AsDateTime,{Q_AuxiReal1.AsFloat}xVta,xFecha);
        end
        else if Q_AuxiEntero1.AsInteger=4 then begin
          Series4.AddXY(Q_AuxiDate1.AsDateTime,{Q_AuxiReal1.AsFloat}xVta,xFecha);
        end
        else if Q_AuxiEntero1.AsInteger=6 then begin
          Series5.AddXY(Q_AuxiDate1.AsDateTime,{Q_AuxiReal1.AsFloat}xVta,xFecha);
        end
        else if Q_AuxiEntero1.AsInteger=8 then begin
          Series6.AddXY(Q_AuxiDate1.AsDateTime,{Q_AuxiReal1.AsFloat}xVta,xFecha);
        end
        else if Q_AuxiEntero1.AsInteger=9 then begin
          Series7.AddXY(Q_AuxiDate1.AsDateTime,{Q_AuxiReal1.AsFloat}xVta,xFecha);
        end
        else if Q_AuxiEntero1.AsInteger=10 then begin
          Series8.AddXY(Q_AuxiDate1.AsDateTime,{Q_AuxiReal1.AsFloat}xVta,xFecha);
        end
      end
      else if GBMes.Visible then begin
        if xMes<>(Q_AuxiEntero3.AsString+Q_AuxiEntero2.AsString) then begin
          xMes:=Q_AuxiEntero3.AsString+Q_AuxiEntero2.AsString;
          Inc(i);
        end;
        if xModo=0 then begin
          try
            if QL_Ajus.Locate('Anio;Mes;Estacion',VarArrayOf([Q_AuxiEntero3.AsInteger,Q_AuxiEntero2.AsInteger,Q_AuxiEntero1.AsInteger]),[]) then
              xVtaAju:=QL_AjusDIFERENCIA.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        if Q_AuxiEntero1.AsInteger=1 then begin
          Series1.AddXY(i{Q_AuxiEntero2.AsInteger},{Q_AuxiReal1.AsFloat}xVta,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=2 then begin
          Series2.AddXY(i{Q_AuxiEntero2.AsInteger},{Q_AuxiReal1.AsFloat}xVta,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=3 then begin
          Series3.AddXY(i{Q_AuxiEntero2.AsInteger},{Q_AuxiReal1.AsFloat}xVta,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=4 then begin
          Series4.AddXY(i{Q_AuxiEntero2.AsInteger},{Q_AuxiReal1.AsFloat}xVta,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=7 then begin
          Series5.AddXY(i{Q_AuxiEntero2.AsInteger},{Q_AuxiReal1.AsFloat}xVta,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=8 then begin
          Series6.AddXY(i{Q_AuxiEntero2.AsInteger},{Q_AuxiReal1.AsFloat}xVta,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=9 then begin
          Series7.AddXY(i{Q_AuxiEntero2.AsInteger},{Q_AuxiReal1.AsFloat}xVta,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=10 then begin
          Series8.AddXY(i{Q_AuxiEntero2.AsInteger},{Q_AuxiReal1.AsFloat}xVta,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
        end
      end
      else begin
        if xModo=0 then begin
          try
            if QL_AjusA.Locate('Anio;Estacion',VarArrayOf([Q_AuxiEntero2.AsInteger,Q_AuxiEntero1.AsInteger]),[]) then
              xVtaAju:=QL_AjusADIFERENCIA.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        if Q_AuxiEntero1.AsInteger=1 then begin
          Series1.AddXY(Q_AuxiEntero2.AsInteger,{Q_AuxiReal1.AsFloat}xVta,IntToStr(Q_AuxiEntero2.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=2 then begin
          Series2.AddXY(Q_AuxiEntero2.AsInteger,{Q_AuxiReal1.AsFloat}xVta,IntToStr(Q_AuxiEntero2.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=3 then begin
          Series3.AddXY(Q_AuxiEntero2.AsInteger,{Q_AuxiReal1.AsFloat}xVta,IntToStr(Q_AuxiEntero2.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=4 then begin
          Series4.AddXY(Q_AuxiEntero2.AsInteger,{Q_AuxiReal1.AsFloat}xVta,IntToStr(Q_AuxiEntero2.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=6 then begin
          Series5.AddXY(Q_AuxiEntero2.AsInteger,{Q_AuxiReal1.AsFloat}xVta,IntToStr(Q_AuxiEntero2.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=8 then begin
          Series6.AddXY(Q_AuxiEntero2.AsInteger,{Q_AuxiReal1.AsFloat}xVta,IntToStr(Q_AuxiEntero2.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=9 then begin
          Series7.AddXY(Q_AuxiEntero2.AsInteger,{Q_AuxiReal1.AsFloat}xVta,IntToStr(Q_AuxiEntero2.AsInteger));
        end
        else if Q_AuxiEntero1.AsInteger=10 then begin
          Series8.AddXY(Q_AuxiEntero2.AsInteger,{Q_AuxiReal1.AsFloat}xVta,IntToStr(Q_AuxiEntero2.AsInteger));
        end
      end;
      xTotEst[Q_AuxiEntero1.AsInteger]:= xTotEst[Q_AuxiEntero1.AsInteger]+{Q_AuxiReal1.AsFloat}xVta;
      xLtsTotales:=xLtsTotales+xVta{Q_AuxiReal1.AsFloat};
      Q_Auxi.Next;
      FAVANCE.AvanzaPosicion;
    end;
    FAVANCE.Close;
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    if GBFecha.Visible then
      Q_AuxiDate1.FieldKind:=fkInternalCalc
    else if GBMes.Visible then begin
      Q_AuxiEntero2.FieldKind:=fkInternalCalc;
      Q_AuxiEntero3.FieldKind:=fkInternalCalc;
      i:=0;
    end
    else
      Q_AuxiEntero2.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select sum(c.Cantidad) as Real1,');

    if GBFecha.Visible then begin
      Q_Auxi.SQL.Add(' c.Fecha as Date1 ');
      Q_Auxi.SQL.Add('From DGASDLIQC c');
      Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    end
    else if GBMes.Visible then begin
      Q_Auxi.SQL.Add(' Extract(month from Fecha) as Entero2, Extract(year from Fecha) as Entero3 ');
      Q_Auxi.SQL.Add('From DGASDLIQC c');
      Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(MesDiaToFecha(VgMesIni,1))+'"');
      Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha(VgMesFin))+'"');

      QL_AjusT.Close;
      QL_AjusT.SQL.Clear;
      QL_AjusT.SQL.Add('select sum(coalesce(Diferencia,0)) as Diferencia,');
      QL_AjusT.SQL.Add('Extract(month from Fecha) as Mes, Extract(year from Fecha) as Anio');
      QL_AjusT.SQL.Add('From DGASAJUD2 ');
      QL_AjusT.SQL.Add('Where Fecha>="'+FechaToStrSQL(MesDiaToFecha(VgMesIni,1))+'"');
      QL_AjusT.SQL.Add('  and Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha(VgMesFin))+'"');
    end
    else begin
      Q_Auxi.SQL.Add(' Extract(year from Fecha) as Entero2');
      Q_Auxi.SQL.Add('From DGASDLIQC c');
      Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');

      QL_AjusAT.Close;
      QL_AjusAT.SQL.Clear;
      QL_AjusAT.SQL.Add('select sum(coalesce(Diferencia,0)) as Diferencia, ');
      QL_AjusAT.SQL.Add('  Extract(year from Fecha) as Anio');
      QL_AjusAT.SQL.Add('From DGASAJUD2');
      QL_AjusAT.SQL.Add('Where Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      QL_AjusAT.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    end;
    Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado='+QuotedStr('Si')+')');
//    if not CBTodas.Checked then begin
//      Q_Auxi.SQL.Add('  and c.Estacion='+IntToStr(estacion));
//      QL_AjusT.SQL.Add('  and Estacion='+IntToStr(estacion));
//      QL_AjusAT.SQL.Add('  and Estacion='+IntToStr(estacion));
//    end;
    if GBFecha.Visible then begin
      Q_Auxi.SQL.Add('  group by Date1');
      QL_AjusT.SQL.Add('group by Anio,Mes');
    end
    else if GBMes.Visible then begin
      Q_Auxi.SQL.Add('  group by Entero3,Entero2');
      QL_AjusT.SQL.Add('group by Anio,Mes');
      QL_AjusT.Prepare;
      QL_AjusT.Open;
    end
    else begin
      Q_Auxi.SQL.Add('  group by Entero2');
      QL_AjusT.SQL.Add('group by Anio,Mes');
      QL_AjusAT.SQL.Add('group by Anio');
      QL_AjusAT.Prepare;
      QL_AjusAT.Open;
    end;
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    Q_Auxi.First;

    FAVANCE.PreparaAvance('Calculando Datos.',True,Q_Auxi.RecordCount);
    if GBMes.Enabled then begin
      Inc(i);
    end;
    while not Q_Auxi.Eof do begin
      xVtaAju:=0;
      if GBFecha.Visible then begin
        if xModo=0 then begin
          try
            Q_Auxi2.Close;
            Q_Auxi2Real1.FieldKind:=fkInternalCalc;
            Q_Auxi2.SQL.Clear;
            Q_Auxi2.SQL.Add('select sum(coalesce(diferencia,0)) as Real1 from DGASAJUD2');
            Q_Auxi2.SQL.Add('where fecha='+QuotedStr(FechaToStrSQL(Q_AuxiDate1.AsDateTime)));
//            if not CBTodas.Checked then
//              Q_Auxi2.SQL.Add('  and estacion='+IntToStr(estacion));
//            Q_Auxi2.SQL.Add('  and combustible='+IntToStr(Q_AuxiEntero1.AsInteger));
            Q_Auxi2.Prepare;
            Q_Auxi2.Open;
            xVtaAju:=Q_Auxi2Real1.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
        end;
        xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime);
        if xDias>31 then begin
          if (Q_AuxiDate1.AsDateTime=VgFechaIni) or (Q_AuxiDate1.AsDateTime=VgFechaFin) then
            xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime)
          else
            xFecha:='';
        end;
        Series10.AddXY(Q_AuxiDate1.AsDateTime,Q_AuxiReal1.AsFloat-xVtaAju,xfecha{FechaPaq(Q_AuxiDate1.AsDateTime)})
      end
      else if GBMes.Visible then begin
        if xModo=0 then begin
          if QL_AjusT.Locate('Anio;Mes',VarArrayOf([Q_AuxiEntero3.AsInteger,Q_AuxiEntero2.AsInteger]),[]) then
            xVtaAju:=QL_AjusTDIFERENCIA.AsFloat;
        end;
//        if xcomb<>Q_AuxiEntero1.AsInteger then
          Inc(i);
        Inc(xDias);
        Series10.AddXY({Q_AuxiEntero2.AsInteger}i,Q_AuxiReal1.AsFloat-xVtaAju,DameMes(Q_AuxiEntero2.AsInteger)+IntToStr(Q_AuxiEntero3.AsInteger));
      end
      else begin
        Inc(xDias);
        if xModo=0 then begin
          if QL_AjusAT.Locate('Anio',Q_AuxiEntero2.AsInteger,[]) then
            xVtaAju:=QL_AjusATDIFERENCIA.AsFloat;
        end;
        Series10.AddXY(Q_AuxiEntero2.AsInteger,Q_AuxiReal1.AsFloat-xVtaAju,DameMes(Q_AuxiEntero2.AsInteger));
      end;
      if (Q_AuxiReal1.AsFloat-xVtaAju) > TotalMayor then begin
        TotalMayor := (Q_AuxiReal1.AsFloat-xVtaAju);
      end;
      if Q_AuxiDate1.AsDateTime > FechaMayor then begin
        FechaMayor := Q_AuxiDate1.AsDateTime;
      end;
      Q_Auxi.Next;
      FAVANCE.AvanzaPosicion;
    end;
    FAVANCE.Close;

    Chart1.LeftAxis.Minimum := 0;
    Chart1.LeftAxis.Maximum := TotalMayor+100;
    Q_Auxi.Close;

//    if not CBTodas.Checked then
//      Chart1.Title.Text.Add(DBLookupComboBox2.Text+'          Promedio:'+FormatoMoneda(DivideFloat(xLtsTotales,xDias)))
//    else
      Chart1.Title.Text.Add('Todas las Estaciones          Promedio:'+FormatoMoneda(DivideFloat(xLtsTotales,xDias)));

    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiStr10.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Clave as Entero1, Nombre as Str10 from DGASESTS');
      Q_Auxi.SQL.Add('where not(clave in(5,7))');
      Q_Auxi.SQL.Add('Order by Clave');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      Series1.Title:=' ';
      Series2.Title:=' ';
      Series3.Title:=' ';
      Series4.Title:=' ';
      Series5.Title:=' ';
      Series6.Title:=' ';
      Series7.Title:=' ';
      Series8.Title:=' ';
//      Series9.Title:=' ';
      While not Q_Auxi.Eof do begin
        if Q_AuxiEntero1.AsInteger=1 then
          Series1.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11)+' '+FormatoMoneda(xTotEst[Q_AuxiEntero1.AsInteger])
        else if Q_AuxiEntero1.AsInteger=2 then
          Series2.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11)+' '+FormatoMoneda(xTotEst[Q_AuxiEntero1.AsInteger])
        else if Q_AuxiEntero1.AsInteger=3 then
          Series3.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11)+' '+FormatoMoneda(xTotEst[Q_AuxiEntero1.AsInteger])
        else if Q_AuxiEntero1.AsInteger=4 then
          Series4.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11)+' '+FormatoMoneda(xTotEst[Q_AuxiEntero1.AsInteger])
        else if Q_AuxiEntero1.AsInteger=6 then
          Series5.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11)+' '+FormatoMoneda(xTotEst[Q_AuxiEntero1.AsInteger])
        else if Q_AuxiEntero1.AsInteger=8 then
          Series6.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11)+' '+FormatoMoneda(xTotEst[Q_AuxiEntero1.AsInteger])
        else if Q_AuxiEntero1.AsInteger=9 then
          Series7.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11)+' '+FormatoMoneda(xTotEst[Q_AuxiEntero1.AsInteger])
        else if Q_AuxiEntero1.AsInteger=10 then
          Series8.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11)+' '+FormatoMoneda(xTotEst[Q_AuxiEntero1.AsInteger]);
//        else if Q_AuxiEntero1.AsInteger=9 then begin
//          Series9.Title:=copy(dmgas.Q_AuxiStr10.AsString,5,length(dmgas.Q_AuxiStr10.AsString)-11);
//        end;

        Q_Auxi.Next;
      end;
    finally
      Q_Auxi.close;
    end;
  end;
end;

procedure TFLIQGRF04.ActionSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFLIQGRF04.DesactivarCantidades1Click(Sender: TObject);
begin
  Series1.Marks.Visible := not Series1.Marks.Visible;
  Series2.Marks.Visible := not Series2.Marks.Visible;
  Series3.Marks.Visible := not Series3.Marks.Visible;
  Series4.Marks.Visible := not Series4.Marks.Visible;
  Series5.Marks.Visible := not Series5.Marks.Visible;
  Series6.Marks.Visible := not Series6.Marks.Visible;
  Series7.Marks.Visible := not Series7.Marks.Visible;
  Series8.Marks.Visible := not Series8.Marks.Visible;
  Series10.Marks.Visible := not Series10.Marks.Visible;
end;

procedure TFLIQGRF04.PopupMenuDesCantPopup(Sender: TObject);
begin
  if Series1.Marks.Visible then
    DesactivarCantidades1.Caption := 'Desactivar Cantidades'
  else
    DesactivarCantidades1.Caption := 'Activar Cantidades';
end;

procedure TFLIQGRF04.BitBtn1Click(Sender: TObject);
begin
  with TPrintDialog.Create(nil) do begin
    try
      if Execute then begin
        Chart1.Gradient.Visible:=False;
        Chart1.PrintLandscape;
        Chart1.Gradient.Visible:=True;
      end;
    finally
      Free;
    end;
  end;
//  Chart1.Gradient.Visible:=False;
//  Chart1.PrintLandscape;
//  Chart1.Gradient.Visible:=True;
end;

end.
