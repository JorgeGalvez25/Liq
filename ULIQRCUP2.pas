unit ULIQRCUP2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, DBCtrls, Buttons, Menus, DBActns,
  ActnList, db, dbtables, ImgList, ComCtrls, ToolWin, dxNavBarStyles,
  dxNavBarCollns, dxNavBarBase, dxNavBar, cxClasses;

type
  TFLIQRCUP2 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ChecaFiltroRcup;
    procedure PreparaForma;
  end;

var
  FLIQRCUP2: TFLIQRCUP2;

implementation

uses DDMCUP, DDMGAS, DDMGASQ, ULIBDATABASE, ULIBGRAL,DDMGEN;

{$R *.DFM}

procedure TFLIQRCUP2.ChecaFiltroRcup;
begin
  with DMCUP do begin
    Label1.Enabled:=CheckBox1.Checked;
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

procedure TFLIQRCUP2.PreparaForma;
begin
  with DMGAS,DMCUP,DMGASQ do begin
    if QT_Turca.IsEmpty then raise Exception.Create('No existe turno abierto');

    caption:='Recuperacion de Cupones - '+QT_TurcaDescripTurno.AsString;

    if (CajeroActual<>QT_TurcaCajero.AsInteger) then begin
      if LocalizaQuery(QT_Cajr,'Clave',CajeroActual) then
        if pos(QT_CajrNombre.AsString,VarGasAuxiliarCuponesDefault)<=0  then
          raise Exception.Create('Usuario no tiene permiso para Capturar Cupones');
    end;

    Q_Serc.Active:=true;
    ChecaFiltroRcup;
    T_Cupo.Active:=true;
    T_Rcup.Active:=true;
    T_Rrcu.Active:=true;
    QT_TurcT.active:=true;

    DBLookUpComboBox1.KeyValue:=Q_SercClave.AsInteger;
    //importar desde el kiosco
    with DMCUP do begin
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
      T_Rcup.Active:=false;
      T_Rcup.Active:=true;
      TotalizaRcup;
    end;
  end;
end;

procedure TFLIQRCUP2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFLIQRCUP2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFLIQRCUP2.DBGrid1Enter(Sender: TObject);
begin
  with DMCUP do begin
    if not (T_Rcup.State in [dsInsert,dsEdit]) then T_Rcup.Append;
  end;
end;

procedure TFLIQRCUP2.SpeedButton2Click(Sender: TObject);
begin
  DMCUP.T_Rcup.Refresh;
end;

procedure TFLIQRCUP2.BitBtn2Click(Sender: TObject);
begin
  DMCUP.TotalizaRcup;
end;

procedure TFLIQRCUP2.DBLookupComboBox1Click(Sender: TObject);
begin
  ChecaFiltroRcup;
end;

procedure TFLIQRCUP2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMCUP.T_Rcup.Filtered:=false;
end;

procedure TFLIQRCUP2.dxNavBarIniClick(Sender: TObject);
begin
  DMCUP.T_Rcup.First;
end;

procedure TFLIQRCUP2.dxNavBar1Item5Click(Sender: TObject);
begin
  DMCUP.T_Rcup.Prior;
end;

procedure TFLIQRCUP2.dxNavBar1Item7Click(Sender: TObject);
begin
  DMCUP.T_Rcup.Next;
end;

procedure TFLIQRCUP2.dxNavBar1Item8Click(Sender: TObject);
begin
  DMCUP.T_Rcup.Last;
end;

procedure TFLIQRCUP2.BitBtn1Click(Sender: TObject);
begin
  close;
end;

end.

