unit ULIQGRF09;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, GanttCh, TeeProcs, Chart, StdCtrls, Buttons,
  ExtCtrls, DB, DBTables, RxMemDS, Grids, DBGrids, ImgList, ActnList, Menus,
  DateUtils;

type
  TFLIQGRF09 = class(TForm)
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
    Imprimir1: TMenuItem;
    QL_Ajus: TQuery;
    QL_AjusDIFERENCIA: TFloatField;
    QL_AjusMES: TSmallintField;
    QL_AjusANIO: TSmallintField;
    QL_AjusA: TQuery;
    QL_AjusADIFERENCIA: TFloatField;
    QL_AjusAANIO: TSmallintField;
    TM_Fecha1: TRxMemoryData;
    TM_Fecha1Litros: TFloatField;
    TM_Fecha1FechaStr: TStringField;
    TM_Fecha1Indice: TIntegerField;
    TM_Fecha1Fecha: TDateTimeField;
    TM_Fecha2: TRxMemoryData;
    TM_Fecha2Indice: TIntegerField;
    TM_Fecha2FechaStr: TStringField;
    TM_Fecha2Fecha: TDateTimeField;
    TM_Fecha2Litros: TFloatField;
    PrintDialog1: TPrintDialog;
    procedure ActionSalirExecute(Sender: TObject);
    procedure DesactivarCantidades1Click(Sender: TObject);
    procedure PopupMenuDesCantPopup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaForma(xModo:Integer; swAnio:string);
  end;

var
  FLIQGRF09: TFLIQGRF09;

implementation

uses ULIQGRF09P, ULIBGRAL, ULIBDATABASE, Printers, DDMGAS, UAVANCE;

{$R *.dfm}

procedure TFLIQGRF09.PreparaForma(xModo:Integer; swAnio:string);
var
  estacion:word;
  xDias, xProm1,xProm2:Integer;
  xLtsTots1,xLtsTots2, xMitad:Real;
  xFecha,xAnio1,xAnio2,xAnioTmp:string;
  i:Integer;
  xMes:string;
  xVta:Real;
  xVtaAju:Real;
  xFecIniAnt,xFecFinAnt:string;

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
  if xModo=1 then
    Chart1.Title.Text.Add('Comparativo de  ventas en importe de combustible y derivados por estación*')
  else
    Chart1.Title.Text.Add('Comparativo de  ventas en importe de combustible y derivados por estación');
  if not FLIQGRF09P.GBMes.Visible then begin
    xFecha:=DateToStr(VgFechaIni);
    xFecha:=Copy(xFecha,(Length(xFecha)-1)-2,4);
    Series1.Title:=xFecha;
    xAnio1:=xFecha;
    Series2.Title:=swAnio;
    xAnio2:=swAnio;
    xFecha:=DateToStr(VgFechaIni);
    xFecha:=Copy(xFecha,0,6)+swAnio;
    xFecIniAnt:=xFecha;
    if Copy(xFecha,4,2)='02' then begin
      if (StrToInt(swAnio) mod 4)<>0 then begin
        if Copy(xFecha,1,2)='29' then begin
          xFecIniAnt:='01/03/'+swAnio;
        end;
      end;
    end;
    xFecha:=DateToStr(VgFechaFin);
    xFecha:=Copy(xFecha,0,6)+swAnio;
    xFecFinAnt:=xFecha;
    if Copy(xFecha,4,2)='02' then begin
      if (StrToInt(swAnio) mod 4)<>0 then begin
        if Copy(xFecha,1,2)='29' then begin
          xFecFinAnt:='28/02/'+swAnio;
        end;
      end;
    end;
  end
  else begin
    xFecha:=DateToStr(MesDiaToFecha(VgMesIni,1));
    xFecha:=Copy(xFecha,(Length(xFecha)-1)-2,4);
    Series1.Title:=xFecha;
    xAnio1:=xFecha;
    Series2.Title:=swAnio;
    xAnio2:=swAnio;
    xFecha:=DateToStr(MesDiaToFecha(VgMesIni,1));
    xFecha:=Copy(xFecha,0,6)+swAnio;
    xFecIniAnt:=xFecha;
    xFecha:=DateToStr(MesDiaMaxToFecha(VgMesFin));
    xFecha:=Copy(xFecha,0,6)+swAnio;
    xFecFinAnt:=xFecha;
    if Copy(xFecha,4,2)='02' then begin
      if (StrToInt(swAnio) mod 4)<>0 then begin
        if Copy(xFecha,1,2)='29' then begin
          xFecFinAnt:='28/02/'+swAnio;
        end;
      end;
    end;
  end;
  with FLIQGRF09P, DMGAS do begin
    estacion:=DBLookupComboBox2.KeyValue;
    xDias:=DiasEntre(VgFechaIni, VgFechaFin)+1;
    dmgas.Q_Auxi.Close;
    dmgas.Q_AuxiReal1.FieldKind:=fkInternalCalc;
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
    dmgas.Q_Auxi.SQL.Add('Select sum(c.Importe) as Real1,');
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
      QL_Ajus.SQL.Add('select sum(coalesce(Total,0)) as Diferencia,');
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
      QL_AjusA.SQL.Add('select sum(coalesce(Total,0)) as Diferencia,');
      QL_AjusA.SQL.Add('  Extract(year from Fecha) as Anio');
      QL_AjusA.SQL.Add('From DGASAJUD2 ');
      QL_AjusA.SQL.Add('Where Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      QL_AjusA.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    end;
    dmgas.Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado='+QuotedStr('Si')+')');
    if not CBTodas.Checked then begin
      dmgas.Q_Auxi.SQL.Add('  and c.Estacion='+IntToStr(estacion));
      QL_Ajus.SQL.Add('  and Estacion='+IntToStr(estacion));
      QL_AjusA.SQL.Add('  and Estacion='+IntToStr(estacion));
    end;
    if GBFecha.Visible then begin
      dmgas.Q_Auxi.SQL.Add('  group by Date1');
    end
    else if GBMes.Visible then begin
      dmgas.Q_Auxi.SQL.Add('  group by Entero3,Entero2');
      QL_Ajus.SQL.Add('  group by Anio,Mes');
      QL_Ajus.Prepare;
      QL_Ajus.Open;
    end
    else begin
      dmgas.Q_Auxi.SQL.Add('  group by Entero2');
      QL_AjusA.SQL.Add('  group by Anio');
      QL_AjusA.Prepare;
      QL_AjusA.Open;
    end;
    dmgas.Q_Auxi.Prepare;
    dmgas.Q_Auxi.Open;
    dmgas.Q_Auxi.First;
    if dmgas.Q_Auxi.RecordCount<=0 then
      raise Exception.Create('No se encontraron resultados con los parámetros proporcionados.');
    xLtsTots1:=0;
    xLtsTots2:=0;
    FAVANCE.PreparaAvance('Calculando Datos.',True,Q_Auxi.RecordCount);
    i:=0;
    if GBMes.Visible then begin
      Inc(i);
      xMes:='';
    end;
    xProm1:=0;
    xProm2:=0;
    TM_Fecha1.Active:=False;
    TM_Fecha1.Active:=True;
    TM_Fecha2.Active:=False;
    TM_Fecha2.Active:=True;
    while not Q_Auxi.Eof do begin
      xVta:=Q_AuxiReal1.AsFloat;
      xVtaAju:=0;
      if GBFecha.Visible then begin
        if xModo=0 then begin
          try
            Q_Auxi2.Close;
            Q_Auxi2Real1.FieldKind:=fkInternalCalc;
            Q_Auxi2.SQL.Clear;
            Q_Auxi2.SQL.Add('select sum(coalesce(Total,0)) as Real1 from DGASAJUD2');
            Q_Auxi2.SQL.Add('where fecha='+QuotedStr(FechaToStrSQL(Q_AuxiDate1.AsDateTime)));
            if not CBTodas.Checked then
              Q_Auxi2.SQL.Add('  and estacion='+IntToStr(estacion));
            Q_Auxi2.Prepare;
            Q_Auxi2.Open;
            xVtaAju:=Q_Auxi2Real1.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        try
          Q_Auxi2.Close;
          Q_Auxi2Real1.FieldKind:=fkInternalCalc;
          Q_Auxi2.sql.Clear;
          Q_Auxi2.SQL.Add('Select sum(a.Importe) as Real1 From DGASDLIQA a');
          Q_Auxi2.SQL.Add('Where a.Fecha='+QuotedStr(FechaToStrSQL(Q_AuxiDate1.AsDateTime)));
          if not CBTodas.Checked then
            Q_Auxi2.SQL.Add('  and estacion='+IntToStr(estacion));
          Q_Auxi2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
          Q_Auxi2.Prepare;
          Q_Auxi2.Open;
          xVta:=xVta+Q_Auxi2Real1.AsFloat;
        finally
          Q_Auxi2.Close;
        end;
        xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime);
        if xDias>31 then begin
          if (Q_AuxiDate1.AsDateTime=VgFechaIni) or (Q_AuxiDate1.AsDateTime=VgFechaFin) then
            xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime)
          else
            xFecha:='';
        end;
        Inc(i);
        xFecha:=copy(xFecha,0,length(xFecha)-5);
        Series1.AddXY(i,xVta,xfecha);
        TM_Fecha1.Append;
        TM_Fecha1Indice.AsInteger:=i;
//        TM_Fecha1Fecha.AsDateTime:=Q_AuxiDate1.AsDateTime;
        TM_Fecha1FechaStr.AsString:=xFecha;
        TM_Fecha1Litros.AsFloat:=xVta;
        TM_Fecha1.Post;
        Inc(xProm1);

        TM_Fecha2.Append;
        TM_Fecha2Indice.AsInteger:=i;
        xFecha:=DateToStr(Q_AuxiDate1.AsDateTime);
        xFecha:=Copy(xFecha,0,6)+swAnio;
//        TM_Fecha2Fecha.AsDateTime:=StrToDateTime(xFecha);
//        xFecha:=copy(xFecha,0,length(xFecha)-5);
        TM_Fecha2FechaStr.AsString:=xFecha;
        if Copy(xFecha,4,2)='02' then begin
          if (StrToInt(swAnio) mod 4)<>0 then begin
            if Copy(xFecha,1,2)='29' then begin
              Series2.AddXY(i,0);
              xProm2:=xProm2-1;
            end;
          end;
        end;
        TM_Fecha2Litros.AsFloat:=0;
        TM_Fecha2.Post;
        Inc(xProm2);

      end
      else if GBMes.Visible then begin
        if xMes<>(Q_AuxiEntero3.AsString+Q_AuxiEntero2.AsString) then begin
          xMes:=Q_AuxiEntero3.AsString+Q_AuxiEntero2.AsString;
          Inc(i);
        end;
        if xModo=0 then begin
          try
            if QL_Ajus.Locate('Anio;Mes',VarArrayOf([Q_AuxiEntero3.AsInteger,Q_AuxiEntero2.AsInteger]),[]) then
              xVtaAju:=QL_AjusDIFERENCIA.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        try
          Q_Auxi2.Close;
          Q_Auxi2Real1.FieldKind:=fkInternalCalc;
          Q_Auxi2.SQL.Clear;
          Q_Auxi2.SQL.Add('Select sum(a.Importe) as Real1 ');
          Q_Auxi2.SQL.Add('From DGASDLIQA a');
          Q_Auxi2.SQL.Add('Where a.Fecha>="'+FechaToStrSQL(MesDiaToFecha((Q_AuxiEntero3.AsString+IntToClaveNum(Q_AuxiEntero2.AsInteger,2)),1))+'"');
          Q_Auxi2.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha((Q_AuxiEntero3.AsString+IntToClaveNum(Q_AuxiEntero2.AsInteger,2))))+'"');
          if not CBTodas.Checked then
            Q_Auxi2.SQL.Add('  and a.estacion='+IntToStr(estacion));
          Q_Auxi2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
          Q_Auxi2.Prepare;
          Q_Auxi2.Open;
          xVta:=xVta+Q_Auxi2Real1.AsFloat;
        finally
          Q_Auxi2.Close;
        end;
        Series1.AddXY(i,xVta,DameMes(Q_AuxiEntero2.AsInteger){+IntToStr(Q_AuxiEntero3.AsInteger)});
      end
      else begin
        if xModo=0 then begin
          try
            if QL_AjusA.Locate('Anio',DMGAS.Q_AuxiEntero2.AsInteger,[]) then
              xVtaAju:=QL_AjusADIFERENCIA.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        try
          Q_Auxi2.Close;
          Q_Auxi2Real1.FieldKind:=fkInternalCalc;
          Q_Auxi2.SQL.Clear;
          Q_Auxi2.SQL.Add('Select sum(a.Importe) as Real1 ');
          Q_Auxi2.SQL.Add('From DGASDLIQA a');
          Q_Auxi2.SQL.Add('Where a.Fecha>="'+FechaToStrSQL(MesDiaToFecha((Q_AuxiEntero2.AsString+'01'),1))+'"');
          Q_Auxi2.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha((Q_AuxiEntero2.AsString+'12')))+'"');
          if not CBTodas.Checked then
            Q_Auxi2.SQL.Add('  and a.estacion='+IntToStr(estacion));
          Q_Auxi2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
          Q_Auxi2.Prepare;
          Q_Auxi2.Open;
          xVta:=xVta+Q_Auxi2Real1.AsFloat;
        finally
          Q_Auxi2.Close;
        end;
        Series1.AddXY(Q_AuxiEntero2.AsInteger,xVta{Q_AuxiReal1.AsFloat},' '{IntToStr(Q_AuxiEntero2.AsInteger)});
      end;
      xLtsTots1:=xLtsTots1+xVta;
      if not GBFecha.Visible then begin
        Inc(xProm1);
        Inc(xProm2);
      end;
      Q_Auxi.Next;
      FAVANCE.AvanzaPosicion;
    end;
    FAVANCE.Close;

    dmgas.Q_Auxi.Close;
    dmgas.Q_AuxiReal1.FieldKind:=fkInternalCalc;
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
    dmgas.Q_Auxi.SQL.Add('Select sum(c.Importe) as Real1,');

    if GBFecha.Visible then begin
      Chart1.BottomAxis.Title.Caption:='Fecha';
      dmgas.Q_Auxi.SQL.Add(' c.Fecha as Date1 ');
      dmgas.Q_Auxi.SQL.Add('From DGASDLIQC c');
      dmgas.Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(StrToDate(xFecIniAnt))+'"');
      dmgas.Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(StrToDate(xFecFinAnt))+'"');
    end
    else if GBMes.Visible then begin
      Chart1.BottomAxis.Title.Caption:='Mes';
      xDias:=0;
      dmgas.Q_Auxi.SQL.Add(' Extract(month from Fecha) as Entero2, Extract(year from Fecha) as Entero3 ');
      dmgas.Q_Auxi.SQL.Add('From DGASDLIQC c');
      dmgas.Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(StrToDate(xFecIniAnt))+'"');
      dmgas.Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(StrToDate(xFecFinAnt))+'"');

      QL_Ajus.Close;
      QL_Ajus.SQL.Clear;
      QL_Ajus.SQL.Add('select sum(coalesce(Total,0)) as Diferencia,');
      QL_Ajus.SQL.Add(' Extract(month from Fecha) as Mes, Extract(year from Fecha) as Anio ');
      QL_Ajus.SQL.Add('From DGASAJUD2');
      QL_Ajus.SQL.Add('Where Fecha>="'+FechaToStrSQL(StrToDate(xFecIniAnt))+'"');
      QL_Ajus.SQL.Add('  and Fecha<="'+FechaToStrSQL(StrToDate(xFecFinAnt))+'"');
    end
    else if GBAnual.visible then begin
      Chart1.BottomAxis.Title.Caption:='Año';
      xDias:=0;
      dmgas.Q_Auxi.SQL.Add(' Extract(year from Fecha) as Entero2 ');
      dmgas.Q_Auxi.SQL.Add('From DGASDLIQC c');
      dmgas.Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(StrToDate(xFecIniAnt))+'"');
      dmgas.Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(StrToDate(xFecFinAnt))+'"');

      QL_AjusA.Close;
      QL_AjusA.SQL.Clear;
      QL_AjusA.SQL.Add('select sum(coalesce(Total,0)) as Diferencia,');
      QL_AjusA.SQL.Add('  Extract(year from Fecha) as Anio');
      QL_AjusA.SQL.Add('From DGASAJUD2 ');
      QL_AjusA.SQL.Add('Where Fecha>="'+FechaToStrSQL(StrToDate(xFecIniAnt))+'"');
      QL_AjusA.SQL.Add('  and Fecha<="'+FechaToStrSQL(StrToDate(xFecFinAnt))+'"');
    end;
    dmgas.Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado='+QuotedStr('Si')+')');
    if not CBTodas.Checked then begin
      dmgas.Q_Auxi.SQL.Add('  and c.Estacion='+IntToStr(estacion));
      QL_Ajus.SQL.Add('  and Estacion='+IntToStr(estacion));
      QL_AjusA.SQL.Add('  and Estacion='+IntToStr(estacion));
    end;
    if GBFecha.Visible then begin
      dmgas.Q_Auxi.SQL.Add('  group by Date1');
    end
    else if GBMes.Visible then begin
      dmgas.Q_Auxi.SQL.Add('  group by Entero3,Entero2');
      QL_Ajus.SQL.Add('  group by Anio,Mes');
      QL_Ajus.Prepare;
      QL_Ajus.Open;
    end
    else begin
      dmgas.Q_Auxi.SQL.Add('  group by Entero2');
      QL_AjusA.SQL.Add('  group by Anio');
      QL_AjusA.Prepare;
      QL_AjusA.Open;
    end;
    dmgas.Q_Auxi.Prepare;
    dmgas.Q_Auxi.Open;
    dmgas.Q_Auxi.First;


//    if dmgas.Q_AuxiEntero1.AsInteger=0 then
//      raise Exception.Create('No se encontraron resultados con los parámetros proporcionados.');
    FAVANCE.PreparaAvance('Calculando Datos.',True,Q_Auxi.RecordCount);
    i:=0;
    if GBMes.Visible then begin
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
            Q_Auxi2.SQL.Add('select sum(coalesce(Total,0)) as Real1 from DGASAJUD2');
            Q_Auxi2.SQL.Add('where fecha='+QuotedStr(FechaToStrSQL(Q_AuxiDate1.AsDateTime)));
            if not CBTodas.Checked then
              Q_Auxi2.SQL.Add('  and estacion='+IntToStr(estacion));
            Q_Auxi2.Prepare;
            Q_Auxi2.Open;
            xVtaAju:=Q_Auxi2Real1.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        try
          Q_Auxi2.Close;
          Q_Auxi2Real1.FieldKind:=fkInternalCalc;
          Q_Auxi2.sql.Clear;
          Q_Auxi2.SQL.Add('Select sum(a.Importe) as Real1 From DGASDLIQA a');
          Q_Auxi2.SQL.Add('Where a.Fecha='+QuotedStr(FechaToStrSQL(Q_AuxiDate1.AsDateTime)));
          if not CBTodas.Checked then
            Q_Auxi2.SQL.Add('  and estacion='+IntToStr(estacion));
          Q_Auxi2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
          Q_Auxi2.Prepare;
          Q_Auxi2.Open;
          xVta:=xVta+Q_Auxi2Real1.AsFloat;
        finally
          Q_Auxi2.Close;
        end;
        xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime);
        if xDias>31 then begin
          if (Q_AuxiDate1.AsDateTime=StrToDateTime(xFecIniAnt)) or (Q_AuxiDate1.AsDateTime=StrToDateTime(xFecFinAnt)) then
            xFecha:=FechaPaq(Q_AuxiDate1.AsDateTime)
          else
            xFecha:='';
        end;
        Inc(i);
        xFecha:=copy(xFecha,0,length(xFecha)-5);
        Series2.AddXY(i,xVta,xfecha);
        if TM_Fecha2.Locate('FechaStr',DateToStr(Q_AuxiDate1.AsDateTime),[]) then begin
          TM_Fecha2.Edit;
          TM_Fecha2Litros.AsFloat:=xVta;
          TM_Fecha2.Post;
        end
        else begin
          TM_Fecha2.Append;
          TM_Fecha2Indice.AsInteger:=i;
//          TM_Fecha2Fecha.AsDateTime:=Q_AuxiDate1.AsDateTime;
          TM_Fecha2FechaStr.AsString:=xFecha;
          TM_Fecha2Litros.AsFloat:=xVta;
          TM_Fecha2.Post;
          Inc(xProm2);

          TM_Fecha1.Append;
          TM_Fecha1Indice.AsInteger:=i;
          xFecha:=DateToStr(VgFechaIni);
          xFecha:=Copy(xFecha,(Length(xFecha)-1)-2,4);

          xAnioTmp:=DateToStr(Q_AuxiDate1.AsDateTime);
          xAnioTmp:=Copy(xAnioTmp,0,6)+xFecha;
          if Copy(xAnioTmp,4,2)='02' then begin
            if (StrToInt(xFecha) mod 4)<>0 then begin
              if Copy(xAnioTmp,1,2)='29' then begin
                xProm1:=xProm1-1;
              end;
            end;
          end;
//          TM_Fecha1Fecha.AsDateTime:=StrToDateTime(xAnioTmp);
          xFecha:=copy(xAnioTmp,0,length(xAnioTmp)-5);
          TM_Fecha1FechaStr.AsString:=xFecha;
          TM_Fecha1Litros.AsFloat:=0;
          TM_Fecha1.Post;
          Inc(xProm1);
        end;
      end
      else if GBMes.Visible then begin
        if xMes<>(Q_AuxiEntero3.AsString+Q_AuxiEntero2.AsString) then begin
          xMes:=Q_AuxiEntero3.AsString+Q_AuxiEntero2.AsString;
          Inc(i);
        end;
        if xModo=0 then begin
          try
            if QL_Ajus.Locate('Anio;Mes',VarArrayOf([Q_AuxiEntero3.AsInteger,Q_AuxiEntero2.AsInteger]),[]) then
              xVtaAju:=QL_AjusDIFERENCIA.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        try
          Q_Auxi2.Close;
          Q_Auxi2Real1.FieldKind:=fkInternalCalc;
          Q_Auxi2.SQL.Clear;
          Q_Auxi2.SQL.Add('Select sum(a.Importe) as Real1 ');
          Q_Auxi2.SQL.Add('From DGASDLIQA a');
          Q_Auxi2.SQL.Add('Where a.Fecha>="'+FechaToStrSQL(MesDiaToFecha((Q_AuxiEntero3.AsString+IntToClaveNum(Q_AuxiEntero2.AsInteger,2)),1))+'"');
          Q_Auxi2.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha((Q_AuxiEntero3.AsString+IntToClaveNum(Q_AuxiEntero2.AsInteger,2))))+'"');
          if not CBTodas.Checked then
            Q_Auxi2.SQL.Add('  and a.estacion='+IntToStr(estacion));
          Q_Auxi2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
          Q_Auxi2.Prepare;
          Q_Auxi2.Open;
          xVta:=xVta+Q_Auxi2Real1.AsFloat;
        finally
          Q_Auxi2.Close;
        end;

        Series2.AddXY(i,xVta,DameMes(Q_AuxiEntero2.AsInteger){+IntToStr(Q_AuxiEntero3.AsInteger)});
      end
      else begin
        if xModo=0 then begin
          try
            if QL_AjusA.Locate('Anio',Q_AuxiEntero2.AsInteger,[]) then
              xVtaAju:=QL_AjusADIFERENCIA.AsFloat;
          finally
            Q_Auxi2.Close;
          end;
          xVta:=xVta-xVtaAju;
        end;
        try
          Q_Auxi2.Close;
          Q_Auxi2Real1.FieldKind:=fkInternalCalc;
          Q_Auxi2.SQL.Clear;
          Q_Auxi2.SQL.Add('Select sum(a.Importe) as Real1 ');
          Q_Auxi2.SQL.Add('From DGASDLIQA a');
          Q_Auxi2.SQL.Add('Where a.Fecha>="'+FechaToStrSQL(MesDiaToFecha((Q_AuxiEntero2.AsString+'01'),1))+'"');
          Q_Auxi2.SQL.Add('  and a.Fecha<="'+FechaToStrSQL(MesDiaMaxToFecha((Q_AuxiEntero2.AsString+'12')))+'"');
          if not CBTodas.Checked then
            Q_Auxi2.SQL.Add('  and a.estacion='+IntToStr(estacion));
          Q_Auxi2.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=a.estacion and m.folio=a.folio and m.aplicado='+Quotedstr('Si')+')');
          Q_Auxi2.Prepare;
          Q_Auxi2.Open;
          xVta:=xVta+Q_Auxi2Real1.AsFloat;
        finally
          Q_Auxi2.Close;
        end;
        Series2.AddXY(Q_AuxiEntero2.AsInteger,xVta{Q_AuxiReal1.AsFloat},' '{IntToStr(Q_AuxiEntero2.AsInteger)});
      end;
      xLtsTots2:=xLtsTots2+xVta;
      Q_Auxi.Next;
      FAVANCE.AvanzaPosicion;
    end;
    FAVANCE.Close;

    Chart1.LeftAxis.Minimum := 0;
    xMitad:=0;
    if GBAnual.Visible then begin
      if xLtsTots1>xLtsTots2 then begin
        xMitad:=xLtsTots1+(DivideFloat(xLtsTots1,2));
      end
      else begin
        xMitad:=xLtsTots1+(DivideFloat(xLtsTots2,2));
      end;
      Chart1.LeftAxis.Maximum :=xMitad;
    end
    else begin
      if xLtsTots1>xLtsTots2 then
        Chart1.LeftAxis.Maximum := xLtsTots1+100
      else
        Chart1.LeftAxis.Maximum := xLtsTots2+100;
    end;
    Q_Auxi.Close;

    if not CBTodas.Checked then
      Chart1.Title.Text.Add(DBLookupComboBox2.Text)
    else
      Chart1.Title.Text.Add('Todas las Estaciones');
    Chart1.Title.Text.Add('Promedio '+xAnio1+': '+FormatoMoneda(DivideFloat(xLtsTots1,xProm1)));
    Chart1.Title.Text.Add('Promedio '+xAnio2+': '+FormatoMoneda(DivideFloat(xLtsTots2,xProm2)));
  end;
end;

procedure TFLIQGRF09.ActionSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFLIQGRF09.DesactivarCantidades1Click(Sender: TObject);
begin
  Series1.Marks.Visible := not Series1.Marks.Visible;
  Series2.Marks.Visible := not Series2.Marks.Visible;
end;

procedure TFLIQGRF09.PopupMenuDesCantPopup(Sender: TObject);
begin
  if Series1.Marks.Visible then
    DesactivarCantidades1.Caption := 'Desactivar Cantidades'
  else
    DesactivarCantidades1.Caption := 'Activar Cantidades';
end;

procedure TFLIQGRF09.BitBtn1Click(Sender: TObject);
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
