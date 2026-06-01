unit ULIQTURCN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,
  Mask,db,dbtables, variants;

type
  TFLIQTURCN = class(TForm)
    Panel3: TPanel;
    MainMenu1: TMainMenu;
    Editar1: TMenuItem;
    Guardar1: TMenuItem;
    Panel1: TPanel;
    BbGuardar: TBitBtn;
    BbSalir: TBitBtn;
    Salir2: TMenuItem;
    N2: TMenuItem;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText4: TDBText;
    Label4: TLabel;
    DBText5: TDBText;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBText2: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    QL_CajrV: TQuery;
    QL_CajrVCLAVE: TIntegerField;
    QL_CajrVNOMBRE: TStringField;
    DSQL_CajrV: TDataSource;
    QL_CajrC: TQuery;
    DSQL_CajrC: TDataSource;
    QL_CajrCCLAVE: TIntegerField;
    QL_CajrCNOMBRE: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    QL_Desp: TQuery;
    QL_DespCLAVE: TIntegerField;
    QL_DespNOMBRE: TStringField;
    QL_DespCTACNT: TStringField;
    QL_DespESTACION: TIntegerField;
    DSQL_Desp: TDataSource;
    procedure Salir1Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QL_DespFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    swgrid    :boolean;
    Procedure PreparaForma;
    procedure EliminaCaptura;
  end;

var
  FLIQTURCN :TFLIQTURCN;

implementation

uses ULIBGRAL, DDMGEN, UAVANCE, ULIBDATABASE, DDMGAS, DDMGASQ, ULIQTURC;

{$R *.DFM}

procedure TFLIQTURCN.EliminaCaptura;
begin
  with DMGAS do begin
    if T_Turc.State=dsInsert then
      T_Turc.Cancel;
  end;
end;

procedure TFLIQTURCN.PreparaForma;
begin
  with DMGAS,DMGEN,DMGASQ do begin
    QL_Desp.Close;
    QL_Desp.Prepare;
    QL_Desp.Open;
    if CajeroActual=0 then
      raise Exception.Create('El usuario no es cajero en esta Estación de Servicio');
    if CajaEsFacturacionOWeb(TipoCajaActual) then
      DBEdit1.ReadOnly:=true;

    if LocalizaQuery(QT_Cajr,'Usuario;Caja',VarArrayOf([UsuarioActivo,CajaActual])) then;

    try
      QL_CajrV.Close;
      QL_CajrV.ParamByName('pestacion').AsInteger:=EstacionActual;
      QL_CajrV.Prepare;
      QL_CajrV.Open;
      QL_CajrC.Close;
      QL_CajrC.ParamByName('pestacion').AsInteger:=EstacionActual;
      QL_CajrC.Prepare;
      QL_CajrC.Open;

      T_Turc.Active:=true;
      T_Turc.insert;
      T_TurcEstacion.AsInteger:=EstacionActual;
      T_TurcCaja.AsInteger:=CajaActual;
      T_TurcCajero.AsInteger:=CajeroActual;
      T_TurcAuxiliar1.AsString:=ExtraeElemStrSep(VarGasAuxiliarValesDefault,1,';');
      T_TurcAuxiliar2.AsString:=ExtraeElemStrSep(VarGasAuxiliarCuponesDefault,1,';');//VarGasAuxiliarCuponesDefault;
      T_TurcFecha.AsDateTime:=FechaTrabajo;
      if LocalizaQuery(QL_CajrV,'Nombre',ExtraeElemStrSep(VarGasAuxiliarValesDefault,1,';')) then
        DBLookUpComboBox1.KeyValue:=QL_CajrVNombre.AsString;
      if LocalizaQuery(QL_CajrC,'Nombre',CajeroActual) then
        DBLookUpComboBox2.KeyValue:=QL_CajrCNombre.AsString;
      if VarGasManejaJefeTurno='Si' then
      begin
        T_TurcJEFE_TURNO.AsInteger:=QL_DespClave.AsInteger;
        DBLookupComboBox3.KeyValue:=QL_DespClave.AsInteger;
      end
      else begin
        DBLookupComboBox3.Visible:=False;
        Label8.Visible:=False;
      end;
    except
      EliminaCaptura;
      raise;
    end;
  end;
end;

procedure TFLIQTURCN.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQTURCN.Guardar1Click(Sender: TObject);
var
  xEjercicio:integer;
begin
  with DMGAS,DMGEN,DMGASQ,FLIQTURC do begin
    try
      try
        if ExtraeElemStrSep(DBEdit1.Text,3,'/')<>'' then
          xEjercicio:=StrToInt(ExtraeElemStrSep(DBEdit1.Text,3,'/'));
        if xEjercicio<>EjercicioActivo then
          raise Exception.Create('El Año seleccionado es diferente al Ejercicio Activo');
        if T_TurcFecha.AsDateTime>FechaTrabajo then
          raise Exception.Create('Fecha del Turno no debe ser mayor a la Fecha de Trabajo del día');
        if FechaToMes(T_TurcFecha.AsDateTime)<>MesGasActual then
          raise Exception.Create('Mes del Turno es diferente al Mes de Trabajo');
        if (T_TurcTurno.AsInteger>=1)and(not QT_Turca.IsEmpty) then
          raise Exception.Create('Existe turno abierto de otro día');
        if VarGasPolizaLiqDia='Si' then begin
          with DMGAS do begin
            Q_Auxi.Close;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC');
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
            Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
            Q_Auxi.SQL.Add('  and Contabilizado="Si" ');
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if Q_AuxiEntero1.AsInteger>0 then
              raise Exception.Create('Dia ya está contabilizado');
          end;
        end;
        QL_Turc.First;        
        T_Turc.post;
        RefrescaDataBase(DBGAS1);
        RefrescaQuery(DMGASQ.QT_Turca);
      except
        EliminaCaptura;
        raise;
      end;
    finally
      FLIQTURCN.Close;
    end;
  end;
end;

procedure TFLIQTURCN.Cancelar1Click(Sender: TObject);
begin
  with DMGAS,DMGEN do begin
    if MensajeConf('Abandonar Apertura?')=mrYes then begin
      try
        EliminaCaptura;
      finally
        close;
      end;
    end;
  end;
end;

procedure TFLIQTURCN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with DMGAS,DMGEN do begin
    if T_Turc.state in [dsEdit,dsInsert] then begin
      if MensajeConf('¿Salir sin Guardar Turno?')=mrNo then
        CanClose:=false;
    end;
    if CanClose then begin
      try
        EliminaCaptura;
      except
      end;
    end;
  end;
end;

procedure TFLIQTURCN.QL_DespFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=QL_DespEstacion.AsInteger=DMGAS.T_TurcESTACION.AsInteger;
end;

end.
