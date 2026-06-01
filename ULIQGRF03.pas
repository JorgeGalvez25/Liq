unit ULIQGRF03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, GanttCh, TeeProcs, Chart, StdCtrls, Buttons,
  ExtCtrls, DB, DBTables, RxMemDS, Grids, DBGrids, ImgList, ActnList, Menus,
  DateUtils, QRPDFFilt;

type
  TFLIQGRF03 = class(TForm)
    ScrollBox1: TScrollBox;
    Chart1: TChart;
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
    Q_Productos: TQuery;
    Q_ProductosFECHA: TDateTimeField;
    Q_ProductosIMPORTE: TFloatField;
    Series1: TPieSeries;
    Imprimir1: TMenuItem;
    QRPDFFilter1: TQRPDFFilter;
    PrintDialog1: TPrintDialog;
    procedure ActionSalirExecute(Sender: TObject);
    procedure DesactivarCantidades1Click(Sender: TObject);
    procedure PopupMenuDesCantPopup(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    { Private declarations }
    Colores : array [0..46] of Integer;
    procedure CargaColores;
  public
    { Public declarations }
    procedure PreparaForma(xModo:Integer);
  end;

var
  FLIQGRF03: TFLIQGRF03;

implementation

uses ULIQGRF03P, ULIBGRAL, ULIBDATABASE, Printers, DDMGAS, UAVANCE;

{$R *.dfm}

procedure TFLIQGRF03.PreparaForma(xModo:Integer);
var
  estacion : word;
  impCupon, impCuponFeria, xVta, xVtaAju : Double;
  i : Integer;

begin
  CargaColores;
  Chart1.Title.Text.Clear;
  if xModo=1 then //03-12-15
    Chart1.Title.Text.Add('Ventas por Tipos de Pago*')
  else
    Chart1.Title.Text.Add('Ventas por Tipos de Pago');
  with FLIQGRF03P, DMGAS do begin
    estacion:=DBLookupComboBox2.KeyValue;
    if not CBTodas.Checked then
      Chart1.Title.Text.Add(DBLookupComboBox2.Text)
    else
      Chart1.Title.Text.Add('Todas las Estaciones');
    if GBFecha.Visible then
      Chart1.Title.Text.Add(RangoFecha(VgFechaIni,VgFechaFin))
    else if GBMes.Visible then
      Chart1.Title.Text.Add('Del mes: '+FLIQGRF03P.MesBox1.Text+' al mes: '+FLIQGRF03P.MesBox2.Text)
    else
      Chart1.Title.Text.Add('Del año: '+FLIQGRF03P.AnioBox1.Text+' al año: '+FLIQGRF03P.AnioBox2.Text);

    Q_Auxi.Close;
    Q_AuxiStr2.FieldKind := fkInternalCalc;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
//    Q_Auxi.SQL.Add('Select p.clave_pago as Str2, sum(p.Importe) as Real1');
//    Q_Auxi.SQL.Add('from DGASDLIQP p');
//    Q_Auxi.SQL.Add('Where p.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
//    Q_Auxi.SQL.Add('  and p.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
//    Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=p.estacion and m.folio=p.folio and m.aplicado='+QuotedStr('Si')+')');
//    if not CBTodas.Checked then
//      Q_Auxi.SQL.Add('  and p.Estacion='+IntToStr(estacion));
//    Q_Auxi.SQL.Add(' group by p.clave_pago');
//    Q_Auxi.SQL.Add(' having sum(p.Importe)<>0');
//    Q_Auxi.SQL.Add(' order by Real1 desc');
    Q_Auxi.SQL.Add('select t.clave as Str2, (coalesce((Select coalesce(sum(p.Importe),0) as Real1');
    Q_Auxi.SQL.Add('from DGASDLIQP p');
    Q_Auxi.SQL.Add('Where p.Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
    Q_Auxi.SQL.Add('  and p.Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    Q_Auxi.SQL.Add('  and exists(select m.* from dgasliqg m where m.estacion=p.estacion and m.folio=p.folio and m.aplicado='+QuotedStr('Si')+')');
    if not CBTodas.Checked then
      Q_Auxi.SQL.Add('  and p.Estacion='+IntToStr(estacion));
    Q_Auxi.SQL.Add('  and p.clave_pago=t.clave');
    Q_Auxi.SQL.Add(' group by p.clave_pago');
    Q_Auxi.SQL.Add(' having sum(p.Importe)<>0');
    Q_Auxi.SQL.Add(' order by Real1 desc),0)) as Real1 from DGASTPAG t where t.activo='+QuotedStr('Si')+' order by Real1 desc, t.clave');
    Q_Auxi.Prepare;
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    Q_Auxi.First;
    if Q_AuxiStr2.AsString='' then
      raise Exception.Create('No se encontraron resultados con los parámetros proporcionados.');
    impCupon := 0;
    impCuponFeria := 0;
    T_Tpag.Active := True;
    FAVANCE.PreparaAvance('Generando gráfica.',True,Q_Auxi.RecordCount);
    while not Q_Auxi.Eof do begin
      if T_Tpag.Locate('CLAVE',Q_AuxiStr2.AsString,[]) then begin
        if T_TpagCLASE.AsString = 'Cupón Feria' then
          impCuponFeria := impCuponFeria + Q_AuxiReal1.AsFloat;
        if T_TpagCLASE.AsString = 'Cupón' then
          impCupon := impCupon + Q_AuxiReal1.AsFloat;
      end;
      Q_Auxi.Next;
      FAVANCE.AvanzaPosicion;
    end;
    FAVANCE.Close;
    Q_Auxi.First;
    impCupon := impCupon - Abs(impCuponFeria);
    i := 0;
    FAVANCE.PreparaAvance('Generando gráfica.',True,Q_Auxi.RecordCount);
    xVtaAju:=0;
    if xModo=0 then begin
      Q_Auxi2.Close;
      Q_Auxi2Real1.FieldKind:=fkInternalCalc;
      Q_Auxi2.SQL.Clear;
      Q_Auxi2.SQL.Add('select sum(coalesce(Total,0)) as Real1');
      Q_Auxi2.SQL.Add('From DGASAJUD2');
      Q_Auxi2.SQL.Add('Where Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
      Q_Auxi2.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
      if not CBTodas.Checked then
        Q_Auxi2.SQL.Add('  and Estacion='+IntToStr(estacion));
      Q_Auxi2.Prepare;
      Q_Auxi2.Open;
      xVtaAju:=Q_Auxi2Real1.AsFloat;
    end;
    while not Q_Auxi.Eof do begin
//      if Q_AuxiReal1.AsFloat>0 then begin
        if T_Tpag.Locate('CLAVE',Q_AuxiStr2.AsString,[]) then begin
          xVta:=Q_AuxiReal1.AsFloat;
          if T_TpagCLASE.AsString = 'Cupón Feria' then begin
            Q_Auxi.Next;
            FAVANCE.AvanzaPosicion;
            Continue;
          end;
          if T_TpagCLASE.AsString = 'Cupón' then
            Series1.AddXY(i,impCupon,T_TpagDESCRIPCION.AsString,Colores[i])
          else begin
            if T_TpagCLASE.AsString = 'Efectivo' then begin
              if xModo=0 then begin
                xVta:=xVta-xVtaAju;
              end;
            end;
            Series1.AddXY(i,xVta{Q_AuxiReal1.AsFloat},T_TpagDESCRIPCION.AsString,Colores[i]);
          end;
        end;
//      end;
      Q_Auxi.Next;
      FAVANCE.AvanzaPosicion;
      i := i + 1;
    end;
    Q_Auxi.Close;
    T_Tpag.Active := False;
    FAVANCE.Close;
  end;
end;

procedure TFLIQGRF03.ActionSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFLIQGRF03.DesactivarCantidades1Click(Sender: TObject);
begin
  Series1.Marks.Visible := not Series1.Marks.Visible;
end;

procedure TFLIQGRF03.PopupMenuDesCantPopup(Sender: TObject);
begin
  if Series1.Marks.Visible then
    DesactivarCantidades1.Caption := 'Desactivar Cantidades'
  else
    DesactivarCantidades1.Caption := 'Activar Cantidades';
end;

procedure TFLIQGRF03.CargaColores;
begin
  Colores[0] := $0000FF;
  Colores[1] := $008000;
  Colores[2] := $00FFFF;
  Colores[3] := $FF0000;
  Colores[4] := $FFFFFF;
  Colores[5] := $808080;
  Colores[6] := $FF00FF;
  Colores[7] := $808000;
  Colores[8] := $800000;
  Colores[9] := $000080;
  Colores[10] := $00FF00;
  Colores[11] := $008080;
  Colores[12] := $800080;
  Colores[13] := $C0C0C0;
  Colores[14] := $FFFF00;
  Colores[15] := $000000;
  Colores[16] := $5C5CCD;
  Colores[17] := $2FFFAD;
  Colores[18] := $00A5FF;
  Colores[19] := $CC6633;
  Colores[20] := $3C14DC;
  Colores[21] := $578B2E;
  Colores[22] := $ED9564;
  Colores[23] := $3F85CD;
  Colores[24] := $98FB98;
  Colores[25] := $6BB7BD;
  Colores[26] := $8B008B;
  Colores[27] := $CD5A6A;
  Colores[28] := $4F4F2F;
  Colores[29] := $E1E4FF;

  Colores[30] := $00274558;
  Colores[31] := $001A6817;
  Colores[32] := $002E1867;
  Colores[33] := $00B04840;
  Colores[34] := $000012B9;
  Colores[35] := $00839BCF;
  Colores[36] := $008000FF;
  Colores[37] := $00ACE4E8;
  Colores[38] := $00A781A4;
  Colores[39] := $00150189;
  Colores[40] := clSilver;
  Colores[41] := $00F0E40F;
  Colores[42] := $0057D8DB;
  Colores[43] := $005E2D5E;
  Colores[44] := $0073B3B5;
  Colores[45] := $00459C49;
  Colores[46] := $00FD8EAA;
end;

procedure TFLIQGRF03.Imprimir1Click(Sender: TObject);
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
