unit ULIQRCUP2R;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Buttons, Menus, DBActns,
  ActnList, db, dbtables, ImgList, ComCtrls, ToolWin, dxNavBarStyles,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxClasses;

type
  TFLIQRCUP2R = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    PopupMenu1: TPopupMenu;
    Eliminar1: TMenuItem;
    Modificar1: TMenuItem;
    ActionList1: TActionList;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetInsert1: TDataSetInsert;
    Insertar1: TMenuItem;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    DBText1: TDBText;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBarIni: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1Item7: TdxNavBarItem;
    dxNavBar1Item8: TdxNavBarItem;
    T_Rcup: TQuery;
    T_RcupESTACION: TIntegerField;
    T_RcupCAJA: TIntegerField;
    T_RcupFECHA: TDateTimeField;
    T_RcupTURNO: TIntegerField;
    T_RcupSERIE: TIntegerField;
    T_RcupIMPORTE: TFloatField;
    T_RcupDescSerie: TStringField;
    T_RcupTURNO_PVG: TIntegerField;
    T_RcupLIQUIDADO: TStringField;
    T_RcupHORA: TDateTimeField;
    T_RcupISLA_PVG: TIntegerField;
    USQL_Rcup: TUpdateSQL;
    DS_Rcup: TDataSource;
    DS_Rrcu: TDataSource;
    USQL_Rrcu: TUpdateSQL;
    T_Rrcu: TQuery;
    T_RrcuESTACION: TIntegerField;
    T_RrcuCAJA: TIntegerField;
    T_RrcuFECHA: TDateTimeField;
    T_RrcuTURNO: TIntegerField;
    T_RrcuSERIE: TIntegerField;
    T_RrcuCANTIDAD: TIntegerField;
    T_RrcuIMPORTE: TFloatField;
    T_RcupCUPON: TFloatField;
    T_RcupFOLIOVOLUMETRICO: TIntegerField;
    T_RcupCOMBUSTIBLE: TIntegerField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1Enter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxNavBarIniClick(Sender: TObject);
    procedure dxNavBar1Item5Click(Sender: TObject);
    procedure dxNavBar1Item7Click(Sender: TObject);
    procedure dxNavBar1Item8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure T_RcupAfterDelete(DataSet: TDataSet);
    procedure T_RcupAfterOpen(DataSet: TDataSet);
    procedure T_RcupAfterPost(DataSet: TDataSet);
    procedure T_RcupBeforePost(DataSet: TDataSet);
    procedure T_RcupBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ChecaFiltroRcup;
    procedure PreparaForma;
  end;

var
  FLIQRCUP2R: TFLIQRCUP2R;

implementation

uses DDMCUP, DDMGAS, DDMGASQ, ULIBDATABASE, ULIBGRAL,DDMGEN, ULIQTURC;

{$R *.DFM}

procedure TFLIQRCUP2R.ChecaFiltroRcup;
begin
  with DMCUP do begin
    Label1.Enabled:=CheckBox1.Checked;
    DBLookUpComboBox1.Enabled:=CheckBox1.Checked;
    SwFiltroSerie:=CheckBox1.Checked;
    T_Rcup.Filtered:=SwFiltroSerie;
    if T_Rcup.UpdatesPending then
      T_Rcup.CancelUpdates;
    if SwFiltroSerie then begin
      T_Rcup.Filter:='Serie='+inttostr(Q_SercClave.asinteger);
      T_Rcup.Filtered:=CheckBox1.checked;
    end;
  end;
end;

procedure TFLIQRCUP2R.PreparaForma;
begin
  with FLIQTURC,DMGAS,DMCUP,DMGASQ do begin
//    if QT_Turca.IsEmpty then
//      raise Exception.Create('No existe turno abierto');
    caption:='Recuperacion de Cupones - '+QL_TurcDescripTurno.AsString;
    if (CajeroActual<>QL_TurcCAJERO.AsInteger) then begin
      if LocalizaQuery(QT_Cajr,'Clave',CajeroActual) then
        if Pos(QT_CajrNombre.AsString,VarGasAuxiliarCuponesDefault)<=0 then
          raise Exception.Create('Usuario no tiene permiso para Capturar Cupones');
    end;
    Q_Serc.Active:=true;
    ChecaFiltroRcup;
    T_Cupo.Active:=true;
    T_Rcup.Active:=true;
    T_Rrcu.Active:=true;
    QT_TurcT.active:=true;
    DBLookUpComboBox1.KeyValue:=Q_SercClave.AsInteger;
  end;
end;

procedure TFLIQRCUP2R.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with DMCUP do begin
    if T_Rcup.state in [dsInsert,dsEdit] then begin
      try
        T_Rcup.Post;
      except
        canclose:=false;
        raise;
      end;
    end;
  end;
end;

procedure TFLIQRCUP2R.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if key=idEnter then with DMCUP do begin
//    if T_Rcup.State in [dsInsert,dsEdit] then
//      T_Rcup.Post;
//    T_Rcup.Append;
//  end;
end;

procedure TFLIQRCUP2R.DBGrid1Enter(Sender: TObject);
begin
//  with DMCUP do begin
//    if not (T_Rcup.State in [dsInsert,dsEdit]) then
//      T_Rcup.Append;
//  end;
end;

procedure TFLIQRCUP2R.SpeedButton2Click(Sender: TObject);
begin
  DMCUP.T_Rcup.Refresh;
end;

procedure TFLIQRCUP2R.BitBtn2Click(Sender: TObject);
begin
  with DMCUP do
    TotalizaRcup;
end;

procedure TFLIQRCUP2R.DBLookupComboBox1Click(Sender: TObject);
begin
  ChecaFiltroRcup;
end;

procedure TFLIQRCUP2R.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMCUP.T_Rcup.Filtered:=false;
end;

procedure TFLIQRCUP2R.dxNavBarIniClick(Sender: TObject);
begin
  with DMCUP do
    T_Rcup.First;
end;

procedure TFLIQRCUP2R.dxNavBar1Item5Click(Sender: TObject);
begin
  with DMCUP do
    T_Rcup.Prior;
end;

procedure TFLIQRCUP2R.dxNavBar1Item7Click(Sender: TObject);
begin
  with DMCUP do
    T_Rcup.Next;
end;

procedure TFLIQRCUP2R.dxNavBar1Item8Click(Sender: TObject);
begin
  with DMCUP do
    T_Rcup.Last;
end;

procedure TFLIQRCUP2R.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFLIQRCUP2R.T_RcupAfterDelete(DataSet: TDataSet);
begin
  T_Rcup.ApplyUpdates;
  T_Rcup.CommitUpdates;
  DMCUP.TotalizaRcup;
end;

procedure TFLIQRCUP2R.T_RcupAfterOpen(DataSet: TDataSet);
var xstr:string;
begin
  with DMGAS do begin
    xstr:='0';
    T_RcupCupon.DisplayFormat:=LLenaStr(xstr,'D',dgCupo,'0');
    T_RcupCupon.EditFormat:=LLenaStr(xstr,'D',dgCupo,'0');
  end;
end;

procedure TFLIQRCUP2R.T_RcupAfterPost(DataSet: TDataSet);
var xestatus:string[1];
    xest,xcaj,xtur:integer;
    xfec:tdatetime;
begin
  try
    T_Rcup.ApplyUpdates;
    T_Rcup.CommitUpdates;
    DMCUP.TotalizaRcup;
  except
    try
      DMCUP.SP_Cupo_Estatus.ParamByName('P_Serie').asinteger:=T_RcupSerie.AsInteger;
      DMCUP.SP_Cupo_Estatus.ParamByName('P_Folio').asinteger:=T_RcupCupon.AsInteger;
      DMCUP.SP_Cupo_Estatus.ExecProc;
      xestatus:=DMCUP.SP_Cupo_Estatus.ParamByName('R_Estatus').asstring;
      if xestatus='R' then begin
        xest:=DMCUP.SP_Cupo_Estatus.ParamByName('R_Estacion').asinteger;
        xcaj:=DMCUP.SP_Cupo_Estatus.ParamByName('R_Caja').asinteger;
        xfec:=DMCUP.SP_Cupo_Estatus.ParamByName('R_Fecha').asdatetime;
        xtur:=DMCUP.SP_Cupo_Estatus.ParamByName('R_Turno').asinteger;
        MensajeErr('Cupón recuperado en Estacion:'+inttostr(xest)+
                   ' Caja:'+inttostr(xcaj)+' Fecha:'+fechapaq(xfec)+
                   ' Turno:'+inttostr(xtur));
      end;
    finally
      T_Rcup.CancelUpdates;
      T_Rcup.Active:=false;
      T_Rcup.Active:=true;
    end;
  end;
end;

procedure TFLIQRCUP2R.T_RcupBeforePost(DataSet: TDataSet);
begin
  with FLIQTURC,DMGASQ do begin
    if T_RcupIsla_pvg.AsInteger=0 then
      if DMGAS.T_Dtur.Active then
        if not DMGAS.T_Dtur.IsEmpty then
          T_RcupIsla_pvg.AsInteger:=DMGAS.T_DturIsla.AsInteger;
    if T_RcupLiquidado.AsString='' then
      T_RcupLiquidado.AsString:='Si';
    if T_RcupTurno_Pvg.AsInteger=0 then
      T_RcupTurno_Pvg.AsInteger:=T_RcupTurno.AsInteger;
    if T_Rcup.State=dsInsert then begin
//      if not DMCUP.swFiltroSerie then begin
//        try
//          DMCUP.vValidaCupon:=false;
//          T_RcupCupon.AsInteger:=DMCUP.vFolioCupon;
//        finally
//          DMCUP.vValidaCupon:=true;
//        end;
//      end;
      if idSist<>idPvg then begin
        T_RcupEstacion.AsInteger:=QL_TurcESTACION.AsInteger;
        T_RcupCaja.AsInteger:=QL_TurcCAJA.AsInteger;
        T_RcupFecha.AsDateTime:=QL_TurcFECHA.AsDateTime;
        T_RcupTurno.AsInteger:=QL_TurcTURNO.AsInteger;
      end;
    end;
    (*
    if not T_Cupo.Locate('Folio;Serie',VarArrayOf([T_RcupCupon.asinteger,T_RcupSerie.asinteger]),[]) then
      raise Exception.Create('Folio no existe');
    T_RcupImporte.AsFloat:=AjustaFloat(T_CupoImporte.AsFloat,2);
    *)
    if DiasEntre(DMCUP.T_CupoFechaVenta.AsDateTime,T_RcupFecha.AsDateTime)>DMGAS.VarGasDiasCuponesVenc then
      raise Exception.Create('Cupón está vencido');
    if DMCUP.T_CupoFechaVenta.AsDateTime>T_RcupFecha.AsDateTime then
      raise Exception.Create('La Fecha de Recuperación no debe ser anterior a la Fecha de Venta');
    with DMGAS do if GrupoActual<>'' then begin
      if not DMCUP.T_Cupo.Locate('Folio;Serie',VarArrayOf([T_RcupCupon.asinteger,T_RcupSerie.asinteger]),[]) then
        raise Exception.Create('Cupón no existe');
      if GrupoActual<>DMCUP.T_CupoGrupoEstacion.AsString then
        raise Exception.Create('Cupón es de otro Grupo o Empresa');
    end;
  end;
end;

procedure TFLIQRCUP2R.T_RcupBeforeDelete(DataSet: TDataSet);
begin
  with DMCUP do begin
    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('UPDATE DGASCUPO SET FOLIOVOLUMETRICO=null,');
    Q_Auxi.SQL.Add('  COMBUSTIBLE=null,');
    Q_Auxi.SQL.Add('  IMPORTE_DESP=null,');
    Q_Auxi.SQL.Add('  HORA=null');
    Q_Auxi.SQL.Add('  WHERE SERIE=:SERIE');
    Q_Auxi.SQL.Add('  AND FOLIO=:FOLIO');
    Q_Auxi.ParamByName('SERIE').AsInteger:=T_RcupSERIE.AsInteger;
    Q_Auxi.ParamByName('FOLIO').AsInteger:=T_RcupCUPON.AsInteger;
    Q_Auxi.ExecSQL;
    Q_Auxi.Close;
  end;
end;

end.

