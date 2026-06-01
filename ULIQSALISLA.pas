unit ULIQSALISLA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxNavBarCollns, dxNavBarStyles,
  cxClasses, dxNavBarBase, dxNavBar, StdCtrls, Buttons,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, DBCtrls, DBTables, Menus;

type
  TFLIQSALISLA = class(TForm)
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    BitBtn1: TBitBtn;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1StyleItem1: TdxNavBarStyleItem;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBar1Item4: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    DBNavigator1: TDBNavigator;
    Q_Sali: TQuery;
    Q_SaliESTACION: TIntegerField;
    Q_SaliFECHA: TDateTimeField;
    Q_SaliTURNO: TIntegerField;
    Q_SaliISLA: TIntegerField;
    Q_SaliSALIDA: TStringField;
    DS_Sali: TDataSource;
    Q_SaliCAJA: TIntegerField;
    MainMenu1: TMainMenu;
    A1: TMenuItem;
    G1: TMenuItem;
    E1: TMenuItem;
    I1: TMenuItem;
    P1: TMenuItem;
    S1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Q_SaliSerieSalida: TStringField;
    Q_SaliFolioSalida: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure dxNavBar1Item1Click(Sender: TObject);
    procedure dxNavBar1Item2Click(Sender: TObject);
    procedure dxNavBar1Item3Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure Q_SaliCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure PreparaForma;
    procedure RefrescaTabla;
    { Public declarations }
  end;

var
  FLIQSALISLA: TFLIQSALISLA;

implementation

uses
  ULIQSALISLAN, DDMGAS, DDMGEN, UGEN_NET, ULIBDATABASE, ULIQTURC,
  ULIBGRAL, DDMINV, DDMGEN_VTAS, UINVSALIF;

{$R *.dfm}

procedure TFLIQSALISLA.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQSALISLA.dxNavBar1Item1Click(Sender: TObject);
var
  xtipo:String;
begin
  with DMGAS, DMGEN, FLIQTURC do begin
    Application.CreateForm(TFLIQSALISLAN,FLIQSALISLAN);
    try
      SetTipoDocumento(idSali);
      IniciaDocAccion(idDocu,'',AccNuevo);
      if not LocalizaTabla(TT_Caja,'Estacion;Caja',VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger])) then begin
        MensajeInfo('No encuentro caja '+IntToStr(QL_TurcCaja.asinteger));
        CancelaDocAccion;
        Exit;
      end;
      xtipo:=FiltraStrNum(VariableDeMemo(DMGAS.TT_CajaVarIni,'TipoDefSali'));

      FLIQSALISLAN.PreparaForma(xtipo,0);
      FLIQSALISLAN.ShowModal;
    finally
      FLIQSALISLAN.Free;
      FLIQSALISLA.RefrescaTabla;
    end;
  end;
end;

procedure TFLIQSALISLA.PreparaForma;
begin
  RefrescaTabla;
end;

procedure TFLIQSALISLA.RefrescaTabla;
begin
  with FLIQTURC, DMGAS do begin
    Q_Sali.Close;
    Q_Sali.SQL.Clear;
    Q_Sali.SQL.Add('SELECT * FROM DGASTURCSALI');
    Q_Sali.SQL.Add('WHERE ESTACION='+IntToStr(QL_TurcEstacion.AsInteger));
    Q_Sali.SQL.Add('AND FECHA='+QuotedStr(FechaToStrSQL(QL_TurcFecha.AsDateTime)));
    Q_Sali.SQL.Add('AND CAJA='+IntToStr(QL_TurcCAJA.AsInteger));
    if VarGasPolizaLiqDia='No' then
      Q_Sali.SQL.Add('AND TURNO='+IntToStr(QL_TurcTurno.AsInteger));
    Q_Sali.Prepare;
    Q_Sali.Open;
  end;
end;

procedure TFLIQSALISLA.dxNavBar1Item2Click(Sender: TObject);
begin
  with DMINV,DMGEN_VTAS,DMGEN,DMGAS, FLIQTURC do begin
    if Q_Sali.IsEmpty then begin
      MensajeInfo('No hay salida de almacén seleccionada');
      Exit;
    end;
    if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',
           VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger,QL_TurcFecha.asdatetime,QL_TurcTurno.asinteger])) then
    if QL_TurcFecha.AsDateTime<FechaCosteo then begin
      MensajeInfo('Movimientos anteriores a la fecha de costeo: '+FechaPaq(FechaCosteo)+' no se pueden eliminar.');
      Exit;
    end;



    try
      ChecaDerechoDocu(drEliminar,idSali,QL_TurcFecha.AsDateTime);
      if MensajeConf('¿Desea borrar esta salida?')=mrYes then begin
        if not LocalizaTabla(T_Sali,'Sucursal;TipoSal;Folio',
                         VarArrayOf([StrToInt(Copy(Q_SaliSALIDA.AsString,1,2)),
                                     Q_SaliSerieSalida.AsString,
                                     Q_SaliFolioSalida.AsInteger])) then begin
          MensajeInfo('No se puedo localizar la salida a borrar, consulte con su asesor de soporte.');
          Exit;
        end;
        try
          if T_SaliCosteado.AsString='Si' then begin
//            if T_SaliEstatus.AsString='A' then begin
//              IniciaUpdates(DBGEN2,T_Sali);
//              T_Sali.Edit;
//              T_SaliCosteado.AsString:='No';
//              T_Sali.Post;
//              AplicaUpdates(DBGEN2,T_Sali);
//              T_Sali.Refresh;
//            end;
            MensajeInfo('La salida no se puede eliminar, se encuentra costeada.');
            Exit;
          end;
          T_Sali.Refresh;
          IniciaUpdates(DBGEN2,T_Sali);
          T_Sali.Edit;
          T_SaliEstatus.AsString:='C';
          T_SaliTotal.AsFloat:=0;
          T_SaliIndice.AsInteger:=0;
          T_Sali.Post;
          AplicaUpdates(DBGEN2,T_Sali);
          T_Sali.Refresh;

          IniciaUpdates(DBGEN2,T_Sali);
          T_Sali.Delete;
          AplicaUpdates(DBGEN2,T_Sali);
          T_Sali.Refresh;
          RefrescaDataBase(DMGEN_VTAS.DBVentas1);
          RefrescaDataBase(DMGEN_VTAS.DBVentas2);

          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('DELETE FROM DGASTURCSALI');
          Q_Auxi.SQL.Add('WHERE ESTACION='+IntToStr(Q_SaliEstacion.AsInteger));
          Q_Auxi.SQL.Add('AND FECHA='+QuotedStr(FechaToStrSQL(Q_SaliFecha.AsDateTime)));
          Q_Auxi.SQL.Add('AND CAJA='+IntToStr(Q_SaliCAJA.AsInteger));
          if VarGasPolizaLiqDia='No' then
            Q_Auxi.SQL.Add('AND TURNO='+IntToStr(Q_SaliTurno.AsInteger));
          Q_Auxi.SQL.Add('AND ISLA='+IntToStr(Q_SaliIsla.AsInteger));
          Q_Auxi.ExecSQL;

          RefrescaDataBase(DMGAS.DBGAS1);
          RefrescaDataBase(DMGAS.DBGAS2);
        except
          CancelaUpdates(DBGEN2,T_Sali);
          raise;
        end;
      end;
    finally
      FLIQSALISLA.RefrescaTabla;
    end
  end
end;

procedure TFLIQSALISLA.dxNavBar1Item3Click(Sender: TObject);
begin
  with DMINV,DMGAS,DMGEN do begin
    try
      if Q_Sali.IsEmpty then begin
        MensajeInfo('No hay salida de almacén seleccionada');
        Exit;
      end;
      idDocu:=idSali;
      T_Sali.Active:=true;
      T_Movs.Active:=true;
      if not LocalizaTabla(T_Sali,'Sucursal;TipoSal;Folio',
                       VarArrayOf([StrToInt(Copy(Q_SaliSALIDA.AsString,1,2)),
                                   Q_SaliSerieSalida.AsString,
                                   Q_SaliFolioSalida.AsInteger])) then
        raise Exception.Create('No puedo localizar salida a borrar');
      if Sender = dxNavBar1Item4 then
        FINVSALIF.PreparaForma('V',IntToStr(0),false)
      else FINVSALIF.PreparaForma('I',IntToStr(0),true);
      FINVSALIF.ImprimeForma;
    finally
      idDocu:=idLiqg;
    end;
  end;
end;

procedure TFLIQSALISLA.I1Click(Sender: TObject);
begin
  with DMINV,DMGAS,DMGEN do begin
    try
      if Q_Sali.IsEmpty then begin
        MensajeInfo('No hay salida de almacén seleccionada');
        Exit;
      end;
      idDocu:=idSali;
      T_Sali.Active:=true;
      T_Movs.Active:=true;
      if not LocalizaTabla(T_Sali,'Sucursal;TipoSal;Folio',
                       VarArrayOf([StrToInt(Copy(Q_SaliSALIDA.AsString,1,2)),
                                   Q_SaliSerieSalida.AsString,
                                   Q_SaliFolioSalida.AsInteger])) then
        raise Exception.Create('No puedo localizar salida a borrar');
      if Sender = P1 then
        FINVSALIF.PreparaForma('V',IntToStr(0),false)
      else FINVSALIF.PreparaForma('I',IntToStr(0),true);
      FINVSALIF.ImprimeForma;
    finally
      idDocu:=idLiqg;
    end;
  end;
end;

procedure TFLIQSALISLA.Q_SaliCalcFields(DataSet: TDataSet);
begin
  Q_SaliSerieSalida.AsString:=copy(Q_SaliSALIDA.AsString,3,2);
  Q_SaliFolioSalida.AsInteger:=StrToIntDef(Copy(Q_SaliSALIDA.AsString,5,6),0);
end;

end.
