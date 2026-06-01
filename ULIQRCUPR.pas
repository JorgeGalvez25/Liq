unit ULIQRCUPR;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Buttons, Menus, DBActns,
  ActnList, db, dbtables, ImgList, ComCtrls, ToolWin, dxNavBarStyles,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxClasses;

type
  TFLIQRCUPR = class(TForm)
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
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    DBText1: TDBText;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    N1: TMenuItem;
    ImportarCuponesdePuntodeVenta1: TMenuItem;
    RegresarCupnaPuntodeVenta1: TMenuItem;
    CheckBox2: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    StaticText1: TStaticText;
    Bevel1: TBevel;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel3: TPanel;
    Panel5: TPanel;
    dxNavBar1: TdxNavBar;
    dxreccupgroup: TdxNavBarGroup;
    dxediciongroup: TdxNavBarGroup;
    dxsalirgroup: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBar1Item4: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1Item7: TdxNavBarItem;
    dxNavBar1Item8: TdxNavBarItem;
    dxNavBar1Item9: TdxNavBarItem;
    dxNavBar1Item10: TdxNavBarItem;
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
    T_Rrcu: TQuery;
    T_RrcuESTACION: TIntegerField;
    T_RrcuCAJA: TIntegerField;
    T_RrcuFECHA: TDateTimeField;
    T_RrcuTURNO: TIntegerField;
    T_RrcuSERIE: TIntegerField;
    T_RrcuCANTIDAD: TIntegerField;
    T_RrcuIMPORTE: TFloatField;
    USQL_Rrcu: TUpdateSQL;
    USQL_Rcup: TUpdateSQL;
    DS_Rrcu: TDataSource;
    DS_Rcup: TDataSource;
    T_RcupCUPON: TFloatField;
    T_RcupFOLIOVOLUMETRICO: TIntegerField;
    T_RcupCOMBUSTIBLE: TIntegerField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1Enter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RegresarCupnaPuntodeVenta1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure dxNavBar1ImpoClick(Sender: TObject);
    procedure dxNavBar1Item7Click(Sender: TObject);
    procedure dxNavBar1Item8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dxNavBar1Item9Click(Sender: TObject);
    procedure dxNavBar1Item6Click(Sender: TObject);
    procedure T_RcupAfterDelete(DataSet: TDataSet);
    procedure T_RcupAfterOpen(DataSet: TDataSet);
    procedure T_RcupAfterPost(DataSet: TDataSet);
    procedure T_RcupBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ChecaFiltroRcup;
    procedure PreparaForma;
    procedure RefrescaTabla;
  end;

var
  FLIQRCUPR: TFLIQRCUPR;

implementation

uses DDMCUP, DDMGAS, DDMGASQ, ULIBDATABASE, ULIBGRAL, DDMLIQ, DDMPVG,DDMGEN,
  ULIQTURC;

{$R *.DFM}

procedure TFLIQRCUPR.RefrescaTabla;
begin
  with DMGAS,DMCUP,FLIQRCUPR do begin
    T_Rcup.Active:=false;
    T_Rcup.Active:=true;
    try
      Q_Auxi.Active:=false;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select count(*) as Entero1, Sum(Importe) as Real1 from DGASRCUP');
      Q_Auxi.SQL.Add('where estacion='+IntToStr(T_RcupEstacion.asinteger));
      Q_Auxi.SQL.Add('  and caja='+IntToStr(T_RcupCaja.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(T_RcupFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and turno='+IntToStr(T_RcupTurno.asinteger));
      if CheckBox2.Checked then
        Q_Auxi.SQL.Add('  and isla_pvg='+IntToStr(T_DturIsla.asinteger));
      Q_Auxi.Active:=true;
      StaticText1.Caption:='Cant: '+IntToStr(Q_AuxiEntero1.asinteger)+
                           '         $ '+FormatFloat('###,##0.00',Q_AuxiReal1.asfloat);
    finally
      Q_Auxi.Active:=false;
    end;
  end;
end;

procedure TFLIQRCUPR.ChecaFiltroRcup;
begin
  with DMCUP,FLIQRCUPR do begin
    if DMGAS.VarGasSerieEnBarrasCupones='No' then begin
      T_Rcup.Filtered:=false;
    end
    else begin
      DBLookUpComboBox1.Enabled:=CheckBox1.Checked;
      SwFiltroSerie:=CheckBox1.Checked;
      T_Rcup.Filtered:=SwFiltroSerie;
    end;
    if T_Rcup.UpdatesPending then
      T_Rcup.CancelUpdates;
    if SwFiltroSerie then begin
      T_Rcup.Filter:='Serie='+inttostr(Q_SercClave.asinteger);
      T_Rcup.Filtered:=CheckBox1.checked;
    end;
  end;
end;

procedure TFLIQRCUPR.PreparaForma;
begin
  with FLIQTURC,DMGASQ,DMPVG,DMGAS,DMCUP,FLIQRCUPR do begin
    T_Rcup.Close;
    T_Rcup.ParamByName('Estacion').AsInteger:=QL_TurcESTACION.AsInteger;
    T_Rcup.ParamByName('Caja').AsInteger:=QL_TurcCAJA.AsInteger;
    T_Rcup.ParamByName('Fecha').AsDateTime:=QL_TurcFECHA.AsDateTime;
    T_Rcup.ParamByName('Turno').AsInteger:=QL_TurcTURNO.AsInteger;
    T_Rcup.Prepare;
    T_Rcup.Open;

    T_Rrcu.Close;
    T_Rrcu.ParamByName('Estacion').AsInteger:=QL_TurcESTACION.AsInteger;
    T_Rrcu.ParamByName('Caja').AsInteger:=QL_TurcCAJA.AsInteger;
    T_Rrcu.ParamByName('Fecha').AsDateTime:=QL_TurcFECHA.AsDateTime;
    T_Rrcu.ParamByName('Turno').AsInteger:=QL_TurcTURNO.AsInteger;
    T_Rrcu.Prepare;
    T_Rrcu.Open;


    RefrescaQuery(QT_Turca);
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
    if VarGasSerieEnBarrasCupones='No' then begin
      CheckBox1.Checked:=false;
      CheckBox1.Visible:=false;
      DBLookUpComboBox1.Visible:=false;
    end
    else begin
      CheckBox1.Checked:=false;
      DBLookUpComboBox1.KeyValue:=Q_SercClave.AsInteger;
    end;
    if LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',VarArrayOf([QL_TurcESTACION.asinteger,QL_TurcFECHA.asdatetime,QL_TurcTURNO.asinteger])) then begin
      T_Dtur.Active:=true;
      DBLookUpComboBox2.KeyValue:=T_DturISLA.AsInteger;
    end
    else begin
      CheckBox2.Enabled:=false;
      DBLookUpComboBox2.Enabled:=false;
    end;
  end;
end;

procedure TFLIQRCUPR.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//  with DMCUP do begin
    if T_Rcup.state in [dsInsert,dsEdit] then begin
      try
        T_Rcup.Post;
      except
        canclose:=false;
        raise;
      end;
    end;
//  end;
end;

procedure TFLIQRCUPR.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if key=idEnter then with DMCUP do begin
//    if T_Rcup.State in [dsInsert,dsEdit] then
//      T_Rcup.Post;
//    T_Rcup.Append;
//  end;
end;

procedure TFLIQRCUPR.DBGrid1Enter(Sender: TObject);
begin
//  with DMCUP do begin
//    if not (T_Rcup.State in [dsInsert,dsEdit]) then
//      T_Rcup.Append;
//  end;
end;

procedure TFLIQRCUPR.SpeedButton2Click(Sender: TObject);
begin
  RefrescaQuery(T_Rcup);
end;

procedure TFLIQRCUPR.BitBtn2Click(Sender: TObject);
begin
  with DMCUP do
    TotalizaRcup;
end;

procedure TFLIQRCUPR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMCUP do begin
    T_Rcup.Active:=false;
    T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno';
    T_Rcup.Filtered:=false;
  end;
end;

procedure TFLIQRCUPR.RegresarCupnaPuntodeVenta1Click(Sender: TObject);
begin
  with FLIQTURC,DMGASQ,DMGAS,DMLIQ,DMCUP,FLIQRCUPR do begin
    if not LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',VarArrayOf([QL_TurcESTACION.asinteger,QL_TurcFECHA.asdatetime,QL_TurcTURNO.asinteger])) then
      raise Exception.Create('No existe turno registrado en Punto de Venta');
    Q_Auxi.Active:=false;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('update dgasrcup set liquidado="No", caja=100');
    Q_Auxi.SQL.Add('where estacion='+IntToStr(T_RcupEstacion.asinteger));
    Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_RcupFecha.asdatetime)+'"');
    Q_Auxi.SQL.Add('  and turno='+IntToStr(T_RcupTurno.asinteger));
    Q_Auxi.SQL.Add('  and serie='+IntToStr(T_RcupSerie.asinteger));
    Q_Auxi.SQL.Add('  and cupon='+IntToStr(T_RcupCupon.asinteger));
    Q_Auxi.ExecSQL;

    RefrescaTabla;
    TotalizaRcup;
  end;
end;

procedure TFLIQRCUPR.CheckBox2Click(Sender: TObject);
begin
  with DMGAS,DMCUP,FLIQRCUPR do begin
    if T_Rcup.State=dsInsert then
      T_Rcup.Cancel;
    if T_Rcup.State=dsEdit then
      T_Rcup.Cancel;
    if CheckBox2.Checked then begin
      DbLookUpComboBox2.Visible:=true;
      DbLookUpComboBox2.Enabled:=true;
      DBLookUpComboBox2.KeyValue:=T_DturISLA.AsInteger;
      T_Rcup.Active:=false;
      if not CheckBox2.Checked then
        T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno'
      else
        T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno'+
                       ' and r.isla_pvg='+IntToStr(T_DturIsla.asinteger);
      T_Rcup.Active:=true;
    end
    else begin
      DbLookUpComboBox2.Visible:=false;
      DbLookUpComboBox2.Enabled:=false;
      T_Rcup.Active:=false;
      T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno';
      T_Rcup.Active:=true;
    end;
    RefrescaTabla;
  end;
end;

procedure TFLIQRCUPR.DBLookupComboBox2Click(Sender: TObject);
begin
//  with DMCUP do begin
    T_Rcup.Active:=false;
    T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno'+
                     ' and r.isla_pvg='+IntToStr(DMGAS.T_DturIsla.asinteger);
    RefrescaTabla;
//  end;
end;

procedure TFLIQRCUPR.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
  ChecaFiltroRcup;
end;

procedure TFLIQRCUPR.DBLookupComboBox1Click(Sender: TObject);
begin
  ChecaFiltroRcup;
end;

procedure TFLIQRCUPR.dxNavBar1ImpoClick(Sender: TObject);
begin
//  with DMGASQ,DMGAS,DMLIQ,DMCUP do begin
//    CheckBox2.Checked:=false;
//    if not LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',VarArrayOf([QT_TurcaEstacion.asinteger,QT_TurcaFecha.asdatetime,QT_TurcaTurno.asinteger])) then
//      raise Exception.Create('No existe turno registrado en Punto de Venta');
//    Q_Auxi.Active:=false;
//    Q_Auxi.SQL.Clear;
//    Q_Auxi.SQL.Add('update dgasrcup set caja='+IntToStr(QT_TurcaCaja.asinteger)+',');
//    Q_Auxi.SQL.Add('                    liquidado="Si"');
//    Q_Auxi.SQL.Add('where liquidado="No"');
//    Q_Auxi.SQL.Add('  and estacion='+IntToStr(QT_TurcaEstacion.asinteger));
//    Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(QT_TurcaFecha.asdatetime)+'"');
//    Q_Auxi.SQL.Add('  and turno<='+IntToStr(QT_TurcaTurno.asinteger));
//    Q_Auxi.ExecSQL;
//
//    Q_Auxi.Active:=false;
//    Q_Auxi.SQL.Clear;
//    Q_Auxi.SQL.Add('update dgasrcup set caja='+IntToStr(QT_TurcaCaja.asinteger)+',');
//    Q_Auxi.SQL.Add('                    liquidado="Si"');
//    Q_Auxi.SQL.Add('where liquidado="No"');
//    Q_Auxi.SQL.Add('  and estacion='+IntToStr(QT_TurcaEstacion.asinteger));
//    Q_Auxi.SQL.Add('  and fecha<"'+FechaToStrSQL(QT_TurcaFecha.asdatetime)+'"');
//    Q_Auxi.ExecSQL;
//    RefrescaTabla;
//    TotalizaRcup;
//  end;
end;

procedure TFLIQRCUPR.dxNavBar1Item7Click(Sender: TObject);
begin
//  with DMCUP do begin
    T_Rcup.Prior;
//  end;
end;

procedure TFLIQRCUPR.dxNavBar1Item8Click(Sender: TObject);
begin
//  with DMCUP do begin
    T_Rcup.Next;
//  end;
end;

procedure TFLIQRCUPR.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFLIQRCUPR.dxNavBar1Item9Click(Sender: TObject);
begin
//  with DMCUP do begin
    T_Rcup.Last;
//  end;
end;

procedure TFLIQRCUPR.dxNavBar1Item6Click(Sender: TObject);
begin
//  with DMCUP do begin
    T_Rcup.First;
//  end;
end;

procedure TFLIQRCUPR.T_RcupAfterDelete(DataSet: TDataSet);
begin
  T_Rcup.ApplyUpdates;
  T_Rcup.CommitUpdates;
  DMCUP.TotalizaRcup;
end;

procedure TFLIQRCUPR.T_RcupAfterOpen(DataSet: TDataSet);
var xstr:string;
begin
  with DMGAS do begin
    xstr:='0';
    T_RcupCupon.DisplayFormat:=LLenaStr(xstr,'D',dgCupo,'0');
    T_RcupCupon.EditFormat:=LLenaStr(xstr,'D',dgCupo,'0');
  end;
end;

procedure TFLIQRCUPR.T_RcupAfterPost(DataSet: TDataSet);
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

procedure TFLIQRCUPR.T_RcupBeforePost(DataSet: TDataSet);
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
      if idSist<>idPvg then begin
        T_RcupEstacion.AsInteger:=QL_TurcESTACION.AsInteger;
        T_RcupCaja.AsInteger:=QL_TurcCAJA.AsInteger;
        T_RcupFecha.AsDateTime:=QL_TurcFECHA.AsDateTime;
        T_RcupTurno.AsInteger:=QL_TurcTURNO.AsInteger;
      end;
    end;
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

end.

