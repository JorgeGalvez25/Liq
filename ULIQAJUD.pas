unit ULIQAJUD;

interface

uses Variants, UFIBCLASS2,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Buttons, Db, DBTables,
  DBActns, ActnList, ComCtrls, ToolWin;

type
  TFLIQAJUD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    MesBox1: TComboBox;
    TL_Ajud: TTable;
    TL_AjudEstacion: TIntegerField;
    TL_AjudFECHA: TDateTimeField;
    TL_AjudAPLICADO: TStringField;
    TL_AjudTOTAL: TFloatField;
    Panel6: TPanel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DSL_Ajud: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    TL_Ajud2: TTable;
    TL_Ajud2ESTACION: TIntegerField;
    TL_Ajud2FECHA: TDateTimeField;
    TL_Ajud2COMBUSTIBLE: TIntegerField;
    TL_Ajud2VOLUMEN: TFloatField;
    TL_Ajud2VENTA: TFloatField;
    TL_Ajud2DIFERENCIA: TFloatField;
    TL_Ajud2PRECIO: TFloatField;
    TL_Ajud2TOTAL: TFloatField;
    DSL_Ajud2: TDataSource;
    TL_Ajud2NombreCombustible: TStringField;
    StaticText2: TStaticText;
    TL_AjudTURNO: TIntegerField;
    Label2: TLabel;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    TL_AjudBLOQUEADO: TStringField;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    TBAjusta: TToolButton;
    TL_Ajud2TURNO: TIntegerField;
    procedure ToolButton1Click(Sender: TObject);
    procedure TL_AjudFECHAValidate(Sender: TField);
    procedure TL_Ajud2AfterInsert(DataSet: TDataSet);
    procedure DBGrid2Enter(Sender: TObject);
    procedure MesBox1Change(Sender: TObject);
    procedure TL_Ajud2AfterPost(DataSet: TDataSet);
    procedure ToolButton2Click(Sender: TObject);
    procedure TL_AjudAfterInsert(DataSet: TDataSet);
    procedure TL_AjudAfterEdit(DataSet: TDataSet);
    procedure TL_AjudAfterDelete(DataSet: TDataSet);
    procedure TL_AjudAfterPost(DataSet: TDataSet);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure TBAjustaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TL_AjudFECHAChange(Sender: TField);
  private
    { Private declarations }
    SwBotonIns,
    SwBotonDel,SwBloqueos:boolean;
    tipoLiq:Integer;
  public
    { Public declarations }
    procedure PreparaForma;
    procedure RefrescaTabla;
    procedure Totaliza;
  end;

  TADIQuery=class(TIMGQuery)
    public
      Constructor Create(SQL:String); overload;
  end;

var
  FLIQAJUD: TFLIQAJUD;

implementation

uses DDMGEN, DDMGASQ, DDMGAS,
     ULIBGRAL, UGEN_NET,  ULIBDATABASE, ULIQREP18P;

{$R *.DFM}

procedure TFLIQAJUD.PreparaForma;
begin
  with DMGEN do begin
    SwBotonIns:=false;
    SwBotonDel:=false;
    SwBloqueos := False;
    IniciaMesBox(MesBox1,MesIniEjercicio(MesInicial(idLiq)),MesFinEjercicio,VgMes,false);
    RefrescaTabla;
    DMGAS.Q_Auxi.Close;
    DMGAS.Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    DMGAS.Q_Auxi.SQL.Clear;
    DMGAS.Q_Auxi.SQL.Add('SELECT TIPOLIQ AS ENTERO1 FROM DGENEMPR');
    DMGAS.Q_Auxi.Open;
    tipoLiq:=DMGAS.Q_AuxiEntero1.AsInteger;
    if tipoLiq=2 then
      DBGrid1.Columns[1].ReadOnly:=False;
  end;
end;

procedure TFLIQAJUD.RefrescaTabla;
var feci,fecf:TDateTime;
begin
  with DMGEN,DMGASQ,DMGAS do begin
    feci:=MesDiaToFecha(ElementoActualMesBox(MesBox1),1);
    fecf:=MesDiaMaxToFecha(ElementoActualMesBox(MesBox1));
    TL_Ajud.Active:=false;
    TL_Ajud.Filter:='Estacion='+IntToStr(EstacionActual)+
                    ' and Fecha>='''+FechaToFormato(feci)+''' and Fecha<='''+FechaToFormato(fecf)+'''';
    TL_Ajud.Filtered:=true;
    TL_Ajud.Active:=true;
    TL_Ajud2.Active:=true;
    VgMes:=FechaToMes(fecf);
    Totaliza;
  end;
end;

procedure TFLIQAJUD.Totaliza;
var BM:TBookMark;
    total:real;
begin
  TL_Ajud.DisableControls;
  BM:=TL_Ajud.GetBookMark;
  total:=0;
  try
    TL_Ajud.First;
    while not TL_Ajud.eof do begin
      if TL_AjudAplicado.AsString='Si' then
        total:=total+TL_AjudTotal.AsFloat;
      TL_Ajud.Next;
    end;
    StaticText2.Caption:=FormatoMoneda(total);
  finally
    TL_Ajud.EnableControls;
    TL_Ajud.GotoBookmark(BM);
    TL_Ajud.FreeBookmark(BM);
  end;
end;

procedure TFLIQAJUD.ToolButton1Click(Sender: TObject);
begin
  with DMGAS do begin
    if TL_Ajud.State<>dsBrowse then
      exit;
    SwBotonIns:=true;
    try
      TL_Ajud.Append;
    finally
      SwBotonIns:=false;
    end;
    TL_AjudEstacion.asinteger:=EstacionActual;
    TL_AjudFecha.AsDateTime:=MesDiaMaxToFecha(ElementoActualMesBox(MesBox1));
    if tipoLiq<>2 then
      TL_AjudTurno.AsInteger:=VarGasAuxiliarLiq;
    DBGrid1.SetFocus;
  end;
end;

procedure TFLIQAJUD.TL_AjudFECHAValidate(Sender: TField);
begin
  with DMGAS do begin
    if FechaToMes(TL_AjudFecha.asdatetime)<>ElementoActualMesBox(MesBox1) then
      raise Exception.Create('Fecha no es del mes actual');
  end;
end;

procedure TFLIQAJUD.TL_Ajud2AfterInsert(DataSet: TDataSet);
begin
  TL_Ajud2.Cancel;
end;

procedure TFLIQAJUD.DBGrid2Enter(Sender: TObject);
var xcant:integer;
begin
  with DMGAS do begin
    if TL_Ajud.State=dsInsert then
      TL_Ajud.Post;
    TL_Ajud.Refresh;
    if TL_Ajud.IsEmpty then
      exit;
    if TL_AjudAplicado.AsString='No' then begin
      if FechaToMes(TL_AjudFecha.asdatetime)<>ElementoActualMesBox(MesBox1) then
        raise Exception.Create('Fecha no es del mes actual');
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASLIQG');
      Q_Auxi.SQL.Add('where Estacion='+inttostr(TL_AjudEstacion.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(TL_AjudFecha.asdatetime)+'"');
      Q_Auxi.Prepare;
      Q_Auxi.open;
      xcant:=Q_AuxiEntero1.AsInteger;
      Q_Auxi.Close;
      if xcant=0 then begin
        TL_Ajud2.Refresh;
        while not TL_Ajud2.IsEmpty do
          TL_Ajud2.Delete;
        raise Exception.Create('No hay Liquidaciones este día');
      end;
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC T, DGASCAJA C');
      Q_Auxi.SQL.Add('where T.Estacion='+inttostr(TL_AjudEstacion.asinteger));
      Q_Auxi.SQL.Add('  and T.Fecha="'+FechaToStrSql(TL_AjudFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and T.Estatus="A"');
      Q_Auxi.SQL.Add('  and T.Estacion=C.Estacion');
      Q_Auxi.SQL.Add('  and T.Caja=C.Caja');
      Q_Auxi.SQL.Add('  and C.Tipo="Liquidacion"');
      Q_Auxi.Prepare;
      Q_Auxi.open;
      xcant:=Q_AuxiEntero1.AsInteger;
      Q_Auxi.Close;
      if xcant>0 then begin
        TL_Ajud2.Refresh;
        while not TL_Ajud2.IsEmpty do
          TL_Ajud2.Delete;
        raise Exception.Create('Hay Turnos de Liquidación Abiertos en esta Fecha');
      end;
      TL_Ajud.Edit;
      TL_AjudAplicado.AsString:='Si';
      TL_Ajud.Post;
      TL_Ajud2.Refresh;
    end;
  end;
end;

procedure TFLIQAJUD.MesBox1Change(Sender: TObject);
begin
  RefrescaTabla;
end;

procedure TFLIQAJUD.TL_Ajud2AfterPost(DataSet: TDataSet);
begin
  TL_Ajud.Refresh;
  Totaliza;
end;

procedure TFLIQAJUD.ToolButton2Click(Sender: TObject);
begin
  if TL_Ajud.State<>dsBrowse then
    exit;
  if MensajeConf('Desea Eliminar Registro?')=mrYes then begin
    SwBotonDel:=true;
    try
      TL_Ajud.Edit;
      TL_AjudAplicado.AsString:='No';
      TL_Ajud.Post;
      TL_Ajud.Refresh;
      TL_Ajud.Delete;
    finally
      SwBotonDel:=false;
    end;
  end;
end;

procedure TFLIQAJUD.TL_AjudAfterInsert(DataSet: TDataSet);
begin
  if not SwBotonIns then
    TL_Ajud.Cancel
  else begin
    TL_AjudBLOQUEADO.AsString := 'Si';
  end;
end;

procedure TFLIQAJUD.TL_AjudAfterEdit(DataSet: TDataSet);
begin
  if (TL_AjudAplicado.AsString='Si')and(not SwBotonDel)and(not SwBloqueos) then begin
    TL_Ajud.Cancel;
    raise Exception.Create('No se puede cambiar fecha');
  end;
end;

procedure TFLIQAJUD.TL_AjudAfterDelete(DataSet: TDataSet);
begin
  Totaliza;
end;

procedure TFLIQAJUD.TL_AjudAfterPost(DataSet: TDataSet);
begin
  Totaliza;
end;

procedure TFLIQAJUD.DBGrid1ColEnter(Sender: TObject);
begin
  if DBGrid1.SelectedIndex=1 then
    Label2.Visible:=true;
end;

procedure TFLIQAJUD.DBGrid1ColExit(Sender: TObject);
begin
  if DBGrid1.SelectedIndex=1 then
    Label2.Visible:=false;
end;

procedure TFLIQAJUD.DBGrid1Exit(Sender: TObject);
begin
  Label2.Visible:=false;
end;

procedure TFLIQAJUD.ToolButton3Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP18P,FLIQREP18P);
  try
    FLIQREP18P.ShowModal;
  finally
    FLIQREP18P.Free;
  end;
end;

procedure TFLIQAJUD.ToolButton7Click(Sender: TObject);
begin
  if TL_Ajud.State<>dsBrowse then
    exit;
  if MensajeConf('Desea Desbloquear Fecha '+FechaPaq(TL_AjudFECHA.AsDateTime)+'?')=mrYes then begin
    try
      SwBloqueos:=True;
      try
        TL_Ajud.Edit;
        TL_AjudBLOQUEADO.AsString := 'No';
        TL_Ajud.Post;
      except
        TL_Ajud.Cancel;
      end;
    finally
      TL_Ajud.Refresh;
      SwBloqueos:=False;
    end;
  end;
end;

procedure TFLIQAJUD.ToolButton6Click(Sender: TObject);
begin
  if TL_Ajud.State<>dsBrowse then
    exit;
  if MensajeConf('Desea Bloquear Fecha '+FechaPaq(TL_AjudFECHA.AsDateTime)+'?')=mrYes then begin
    try
      SwBloqueos:=True;
      try
        TL_Ajud.Edit;
        TL_AjudBLOQUEADO.AsString := 'Si';
        TL_Ajud.Post;
      except
        TL_Ajud.Cancel;
      end;
    finally
      TL_Ajud.Refresh;
      SwBloqueos:=False;
    end;
  end;
end;

procedure TFLIQAJUD.TBAjustaClick(Sender: TObject);
var
  xPagosEfectivo:array[1..4]of Real;
  i:Integer;
  xTotalEfectivo:Real;
  xPorc:Real;
  xLtsAjustados:Real;
  xLtsVendidos:Real;
  Q_Hist:TADIQuery;
begin
  with DMGAS do begin
    try
      for i:= 1 to 4 do
        xPagosEfectivo[i]:=0;
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('select d.Turno as Entero1,coalesce(Sum(d.importe),0) as Real1 from DGASDLIQP d');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(TL_AjudEstacion.asinteger));
      Q_Auxi.SQL.Add('  and d.fecha='+QuotedStr(FechaToStrSQL(TL_AjudFECHA.AsDateTime)));
      Q_Auxi.SQL.Add('  and exists (select t.* from DGASTPAG t');
      Q_Auxi.SQL.Add('              where t.clave=d.clave_pago');
      Q_Auxi.SQL.Add('                and t.Clase='+QuotedStr('Efectivo')+')');
      Q_Auxi.SQL.Add('  and d.Aplicado='+QuotedStr('Si'));
      Q_Auxi.SQL.Add('group by turno');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      i:=0;
      xTotalEfectivo:=0;
      while not Q_Auxi.Eof do begin
        Inc(i);
        xTotalEfectivo:=xTotalEfectivo+Q_AuxiReal1.AsFloat;
        xPagosEfectivo[Q_AuxiEntero1.AsInteger]:=xPagosEfectivo[Q_AuxiEntero1.AsInteger]+Q_AuxiReal1.AsFloat;
        Q_Auxi.Next;
      end;
      try
        Q_Hist:=TADIQuery.Create('select coalesce(sum(Ajuste),0) as Ajustes from Historia where Fecha='+QuotedStr(FechaToStrSQL(TL_AjudFECHA.AsDateTime)));
        Q_Hist.ExecQuery;
        xLtsAjustados:=Q_Hist.FN('AJUSTES').AsFloat;
      finally
        Q_Hist.Free;
      end;

      if (TL_Ajud2.state in[dsInsert,dsEdit]) then
        TL_Ajud2.Cancel;

      xLtsVendidos:=0;
      TL_Ajud2.First;
      while not TL_Ajud2.Eof do begin
        xLtsVendidos:=xLtsVendidos+TL_Ajud2VENTA.AsFloat;
        TL_Ajud2.Next;
      end;
      i:=0;
      TL_Ajud2.First;
      while (not TL_Ajud2.Eof) and (i<=3) do begin
        Inc(i);
//        xPorc:=AjustaFloat(DivideFloat(xPagosEfectivo[TL_AjudTURNO.AsInteger]*100,xTotalEfectivo),2);
        xPorc:=AjustaFloat(DivideFloat(TL_Ajud2VENTA.AsFloat*100,xLtsVendidos),2);
        try
          TL_Ajud2.Edit;
          TL_Ajud2VOLUMEN.AsFloat:=AjustaFloat((xLtsAjustados*DivideFloat(xPorc,100)),2);
          TL_Ajud2.Post;
        except
          TL_Ajud2.Cancel;
        end;
        TL_Ajud2.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQAJUD.FormShow(Sender: TObject);
begin
  TBAjusta.Visible:= DMGEN.VarComp('RutaAjusta')<>'';
end;

{ TADIQuery }

constructor TADIQuery.Create(SQL: String);
var
  pRuta:string;
begin
  pRuta:=DMGEN.VarComp('RutaAjusta') + 'Ajusta.fdb';
  inherited Create(SQL, pRuta);
end;

procedure TFLIQAJUD.TL_AjudFECHAChange(Sender: TField);
begin
  if tipoLiq=2 then begin
    with DMGAS do begin
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT COALESCE(MAX(TURNO),0)+1 AS ENTERO1 FROM DGASAJUD WHERE ESTACION='+IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('AND FECHA='+QuotedStr(FechaToStrSQL(TL_AjudFECHA.AsDateTime)));
      Q_Auxi.Open;
      TL_AjudTURNO.AsInteger:=Q_AuxiEntero1.AsInteger;
    end;
  end;
end;

end.
