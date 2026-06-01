unit ULIQGRF06;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, GanttCh, TeeProcs, Chart, StdCtrls, Buttons,
  ExtCtrls, DB, DBTables, RxMemDS, Grids, DBGrids, ImgList, ActnList, Menus,
  DateUtils;

type
  TFLIQGRF06 = class(TForm)
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
    ScrollBox1: TScrollBox;
    cht1: TChart;
    Series1: TPieSeries;
    Series2: TLineSeries;
    PrintDialog1: TPrintDialog;
    procedure ActionSalirExecute(Sender: TObject);
    procedure DesactivarCantidades1Click(Sender: TObject);
    procedure PopupMenuDesCantPopup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Colores : array [1..3] of Integer;
    procedure CargaColores;
  public
    { Public declarations }
    procedure PreparaForma(xModo:Integer);
  end;

var
  FLIQGRF06: TFLIQGRF06;

implementation

uses ULIQGRF06P, ULIBGRAL, ULIBDATABASE, Printers, DDMGAS, UAVANCE;

{$R *.dfm}

procedure TFLIQGRF06.PreparaForma(xModo:Integer);
var
  xLtsTotales:double;
  xVta,xVtaAju:double;

begin
  CargaColores;
  cht1.Title.Text.Clear;
  if xModo=1 then //03-12-15
    cht1.Title.Text.Add('Ventas por tipo de combustible en litros*')
  else
    cht1.Title.Text.Add('Ventas por tipo de combustible en litros');
  with FLIQGRF06P, DMGAS do begin
    dmgas.Q_Auxi.Close;
    dmgas.Q_AuxiReal1.FieldKind:=fkInternalCalc;
    dmgas.Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    dmgas.Q_Auxi.SQL.Clear;
    dmgas.Q_Auxi.SQL.Add('Select c.combustible as Entero1, sum(c.Cantidad) as Real1');
    cht1.BottomAxis.Title.Caption:='Fecha';
//      dmgas.Q_Auxi.SQL.Add(' c.Fecha as Date1 ');
    dmgas.Q_Auxi.SQL.Add('From DGASDLIQC c');
    dmgas.Q_Auxi.SQL.Add('Where c.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    dmgas.Q_Auxi.SQL.Add('  and c.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    dmgas.Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=c.estacion and m.folio=c.folio and m.aplicado='+QuotedStr('Si')+')');
    dmgas.Q_Auxi.SQL.Add('  group by Entero1');
    dmgas.Q_Auxi.Prepare;
    dmgas.Q_Auxi.Open;
    dmgas.Q_Auxi.First;
    if dmgas.Q_AuxiEntero1.AsInteger=0 then
      raise Exception.Create('No se encontraron resultados con los parámetros proporcionados.');
    xLtsTotales:=0;
    FAVANCE.PreparaAvance('Calculando Datos.',True,Q_Auxi.RecordCount);
    TM_Datos.Active:=False;
    TM_Datos.Active:=True;
    while not Q_Auxi.Eof do begin
      xVta:=Q_AuxiReal1.AsFloat;
      xVtaAju:=0;
      if xModo=0 then begin
        try
          Q_Auxi2.Close;
          Q_Auxi2Real1.FieldKind:=fkInternalCalc;
          Q_Auxi2.SQL.Clear;
          Q_Auxi2.SQL.Add('select sum(coalesce(diferencia,0)) as Real1 from DGASAJUD2');
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
        Series1.AddXY(Q_AuxiEntero1.AsInteger,xVta,'Magna: '+FormatoMoneda(xVta),Colores[Q_AuxiEntero1.AsInteger]);
      end;
      if Q_AuxiEntero1.AsInteger=2 then begin
        Series1.AddXY(Q_AuxiEntero1.AsInteger,xVta,'Premium: '+FormatoMoneda(xVta),Colores[Q_AuxiEntero1.AsInteger]);
      end;
      if Q_AuxiEntero1.AsInteger=3 then begin
        Series1.AddXY(Q_AuxiEntero1.AsInteger,xVta,'Diesel: '+FormatoMoneda(xVta),Colores[Q_AuxiEntero1.AsInteger]);
      end;
      xLtsTotales:=xLtsTotales+xVta{Q_AuxiReal1.AsFloat};
      Q_Auxi.Next;
      FAVANCE.AvanzaPosicion;
    end;
    FAVANCE.Close;
//    cht1.LeftAxis.Minimum := 0;
//    cht1.LeftAxis.Maximum := TotalMayor+100;
    Q_Auxi.Close;
    cht1.Title.Text.Add('Todas las Estaciones');
    if GBFecha.Visible then
      cht1.Title.Text.Add(RangoFecha(VgFechaIni,VgFechaFin))
    else if GBMes.Visible then
      cht1.Title.Text.Add('Del mes: '+FLIQGRF06P.MesBox1.Text+' al mes: '+FLIQGRF06P.MesBox2.Text)
    else
      cht1.Title.Text.Add('Del año: '+FLIQGRF06P.AnioBox1.Text+' al año: '+FLIQGRF06P.AnioBox2.Text);
  end;
end;

procedure TFLIQGRF06.ActionSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFLIQGRF06.DesactivarCantidades1Click(Sender: TObject);
begin
  Series1.Marks.Visible := not Series1.Marks.Visible;
//  Series2.Marks.Visible := not Series2.Marks.Visible;
//  Series3.Marks.Visible := not Series3.Marks.Visible;
//  Series4.Marks.Visible := not Series4.Marks.Visible;
end;

procedure TFLIQGRF06.PopupMenuDesCantPopup(Sender: TObject);
begin
  if Series1.Marks.Visible then
    DesactivarCantidades1.Caption := 'Desactivar Cantidades'
  else
    DesactivarCantidades1.Caption := 'Activar Cantidades';
end;

procedure TFLIQGRF06.BitBtn1Click(Sender: TObject);
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
//  cht1.Gradient.Visible:=False;
//  cht1.PrintLandscape;
//  cht1.Gradient.Visible:=True;
end;

procedure TFLIQGRF06.CargaColores;
begin
  Colores[1] := clGreen;
  Colores[2] := clRed;
  Colores[3] := clBlack;
end;

end.
