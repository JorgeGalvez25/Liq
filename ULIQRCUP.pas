unit ULIQRCUP;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Buttons, Menus, DBActns,
  ActnList, db, dbtables, ImgList, ComCtrls, ToolWin, dxNavBarStyles,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxClasses;

type
  TFLIQRCUP = class(TForm)
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
    QL_Isla: TQuery;
    DS_Isla: TDataSource;
    QL_IslaISLA: TIntegerField;
    QL_IslaDescIsla: TStringField;
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
    procedure QL_IslaCalcFields(DataSet: TDataSet);

  private
  public
    pFecha:TdateTime;
    pTurno:word;
    procedure ChecaFiltroRcup;
    procedure PreparaForma;
    procedure RefrescaTabla;
  end;

var
  FLIQRCUP: TFLIQRCUP;

implementation

uses DDMCUP, DDMGAS, DDMGASQ, ULIBDATABASE, ULIBGRAL, DDMLIQ, DDMPVG,DDMGEN;

{$R *.DFM}

procedure TFLIQRCUP.RefrescaTabla;
begin
  with DMGAS,DMCUP do begin
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

      if CheckBox2.Checked then Q_Auxi.SQL.Add('  and isla_pvg='+IntToStr(DBLookupComboBox2.KeyValue));

      Q_Auxi.Active:=true;

      StaticText1.Caption:='Cant: '+IntToStr(Q_AuxiEntero1.asinteger)+'         $ '+FormatFloat('###,##0.00',Q_AuxiReal1.asfloat);
    finally
      Q_Auxi.Active:=False;
    end;
  end;
end;

procedure TFLIQRCUP.ChecaFiltroRcup;
begin
  with DMCUP do begin
    DBLookUpComboBox1.Enabled:=CheckBox1.Checked;
    SwFiltroSerie:=CheckBox1.Checked;
    T_Rcup.Filtered:=SwFiltroSerie;

    if T_Rcup.UpdatesPending then T_Rcup.CancelUpdates;

    if SwFiltroSerie then begin
      T_Rcup.Filter:='Serie='+inttostr(Q_SercClave.asinteger);
      T_Rcup.Filtered:=CheckBox1.checked;
    end;
  end;
end;

procedure TFLIQRCUP.PreparaForma;
begin
  with DMGASQ,DMPVG,DMGAS,DMCUP do begin
    RefrescaQuery(QT_Turca);

    if QT_Turca.IsEmpty then raise Exception.Create('No existe turno abierto');

    //En caso de existir mas de un turno abierto es necesario localizarlo
    if pTurno>0 then LocalizaQuery(QT_TurcA,'Turno;Fecha',VarArrayOf([pTurno,pFecha]));

    caption:='Recuperacion de Cupones - '+QT_TurcaDescripTurno.AsString;

    if (CajeroActual<>QT_TurcaCajero.AsInteger) then begin
      if LocalizaQuery(QT_Cajr,'Clave',CajeroActual) then
        if pos(QT_CajrNombre.AsString,VarGasAuxiliarCuponesDefault)<=0 then
          raise Exception.Create('Usuario no tiene permiso para Capturar Cupones');
    end;

    //Configuraciones
    Q_Serc.Active:=true;
    ChecaFiltroRcup;
    T_Cupo.Active:=true;
    T_Rcup.Active:=true;
    T_Rrcu.Active:=true;
    QT_TurcT.active:=true;

    CheckBox1.Checked:=false;
    DBLookUpComboBox1.KeyValue:=Q_SercClave.AsInteger;

    //Selecciona ISLA
    QL_Isla.Close;
    QL_Isla.SQL.Clear;
    QL_Isla.SQL.Add('select isla from dgasisla');
    QL_Isla.SQL.Add('where estacion='+IntToStr(QT_TurcAESTACION.AsInteger));
    QL_Isla.SQL.Add('  and activa='+QuotedStr('Si'));
    QL_Isla.Prepare;
    QL_Isla.open;
    DBLookupComboBox2.KeyValue:=QL_IslaISLA.AsInteger;
  end;
end;

procedure TFLIQRCUP.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFLIQRCUP.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idEnter then with DMCUP do begin
    if T_Rcup.State in [dsInsert,dsEdit]then begin
      if DBGrid1.selectedfield.fieldname = 'CUPON' then begin
        if T_RcupFOLIOVOLUMETRICO.AsInteger <=0 then T_RcupFOLIOVOLUMETRICO.FocusControl
        else if T_RcupISLA_PVG.AsInteger<=0 then T_RcupISLA_PVG.FocusControl
        else begin
          T_Rcup.Post;
          T_Rcup.Append;
          T_RcupCUPON.FocusControl;
        end;
      end
      else if DBGrid1.selectedfield.fieldname = 'FOLIOVOLUMETRICO' then begin
        if T_RcupCUPON.AsInteger<=0 then T_RcupCUPON.FocusControl
        else begin
          T_Rcup.Post;
          T_Rcup.Append;
          T_RcupCUPON.FocusControl;
        end;
      end
      else if DBGrid1.selectedfield.fieldname = 'ISLA_PVG' then begin
        if T_RcupCUPON.AsInteger<=0 then T_RcupCUPON.FocusControl
        else if T_RcupFOLIOVOLUMETRICO.AsInteger <=0 then T_RcupFOLIOVOLUMETRICO.FocusControl
        else begin
          T_Rcup.Post;
          T_Rcup.Append;
          T_RcupCUPON.FocusControl;
        end;
      end
    end;
  end;
end;

procedure TFLIQRCUP.DBGrid1Enter(Sender: TObject);
begin
  with DMCUP do begin
    if not (T_Rcup.State in [dsInsert,dsEdit]) then
      T_Rcup.Append;
  end;
end;

procedure TFLIQRCUP.SpeedButton2Click(Sender: TObject);
begin
  RefrescaQuery(DMCUP.T_Rcup);
end;

procedure TFLIQRCUP.BitBtn2Click(Sender: TObject);
begin
  with DMCUP do
    TotalizaRcup;
end;

procedure TFLIQRCUP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMCUP do begin
    T_Rcup.Active:=false;
    T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno';
    T_Rcup.Filtered:=false;
  end;
end;

procedure TFLIQRCUP.RegresarCupnaPuntodeVenta1Click(Sender: TObject);
begin
  with DMGASQ,DMGAS,DMLIQ,DMCUP do begin
    if not LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',VarArrayOf([QT_TurcaEstacion.asinteger,QT_TurcaFecha.asdatetime,QT_TurcaTurno.asinteger])) then
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

procedure TFLIQRCUP.CheckBox2Click(Sender: TObject);
begin
  with DMGAS,DMCUP do begin
    if T_Rcup.State=dsInsert then
      T_Rcup.Cancel;
    if T_Rcup.State=dsEdit then
      T_Rcup.Cancel;
    if CheckBox2.Checked then begin
      DbLookUpComboBox2.Visible:=true;
      DbLookUpComboBox2.Enabled:=true;
      DBLookUpComboBox2.KeyValue:=QL_IslaISLA.AsInteger;
      T_Rcup.Active:=false;
      if not CheckBox2.Checked then
        T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno'
      else
        T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno'+
                       ' and r.isla_pvg='+IntToStr(QL_IslaISLA.asinteger);
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

procedure TFLIQRCUP.DBLookupComboBox2Click(Sender: TObject);
begin
  with DMCUP do begin
    T_Rcup.Active:=false;
    T_Rcup.SQL[2]:='and r.fecha=:fecha and r.turno=:turno and r.isla_pvg='+IntToStr(DBLookupComboBox2.KeyValue);

    RefrescaTabla;
  end;
end;

procedure TFLIQRCUP.FormShow(Sender: TObject);
begin
  DBGrid1.SetFocus;
  ChecaFiltroRcup;
end;

procedure TFLIQRCUP.DBLookupComboBox1Click(Sender: TObject);
begin
  ChecaFiltroRcup;
end;

procedure TFLIQRCUP.dxNavBar1ImpoClick(Sender: TObject);
begin
  with DMGASQ,DMGAS,DMLIQ,DMCUP do begin
    CheckBox2.Checked:=false;
    if not LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',VarArrayOf([QT_TurcaEstacion.asinteger,QT_TurcaFecha.asdatetime,QT_TurcaTurno.asinteger])) then
      if not DMGEN.SistemaActivo2('KIO') then
        raise Exception.Create('No existe turno registrado en Punto de Venta');
    Q_Auxi.Active:=false;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('update dgasrcup set caja='+IntToStr(QT_TurcaCaja.asinteger)+',');
    Q_Auxi.SQL.Add('                    liquidado="Si"');
    Q_Auxi.SQL.Add('where liquidado="No"');
    Q_Auxi.SQL.Add('  and estacion='+IntToStr(QT_TurcaEstacion.asinteger));
    Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(QT_TurcaFecha.asdatetime)+'"');
    Q_Auxi.SQL.Add('  and turno<='+IntToStr(QT_TurcaTurno.asinteger));
    Q_Auxi.ExecSQL;

    Q_Auxi.Active:=false;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('update dgasrcup set caja='+IntToStr(QT_TurcaCaja.asinteger)+',');
    Q_Auxi.SQL.Add('                    liquidado="Si"');
    Q_Auxi.SQL.Add('where liquidado="No"');
    Q_Auxi.SQL.Add('  and estacion='+IntToStr(QT_TurcaEstacion.asinteger));
    Q_Auxi.SQL.Add('  and fecha<"'+FechaToStrSQL(QT_TurcaFecha.asdatetime)+'"');
    Q_Auxi.ExecSQL;
    RefrescaTabla;
    TotalizaRcup;
  end;
end;

procedure TFLIQRCUP.dxNavBar1Item7Click(Sender: TObject);
begin
  with DMCUP do begin
    T_Rcup.Prior;
  end;
end;

procedure TFLIQRCUP.dxNavBar1Item8Click(Sender: TObject);
begin
  with DMCUP do begin
    T_Rcup.Next;
  end;
end;

procedure TFLIQRCUP.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFLIQRCUP.dxNavBar1Item9Click(Sender: TObject);
begin
  with DMCUP do begin
    T_Rcup.Last;
  end;
end;

procedure TFLIQRCUP.dxNavBar1Item6Click(Sender: TObject);
begin
  with DMCUP do begin
    T_Rcup.First;
  end;
end;

procedure TFLIQRCUP.QL_IslaCalcFields(DataSet: TDataSet);
begin
  QL_IslaDescIsla.AsString:='Isla '+IntToClaveNum(QL_IslaISLA.AsInteger,3);
end;

end.

