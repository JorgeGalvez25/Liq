unit ULIQTRAN2;

interface

uses Variants, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, DBTables, Menus, StdCtrls, Buttons,
  ComCtrls, Mask;

type
  TFLIQTRAN2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    QL_Tran2: TQuery;
    QL_Tran2TIPOVENTA: TStringField;
    QL_Tran2ESTACION: TIntegerField;
    QL_Tran2FOLIO: TIntegerField;
    QL_Tran2ISLA: TIntegerField;
    QL_Tran2BOMBA: TIntegerField;
    QL_Tran2FECHA: TDateTimeField;
    QL_Tran2TURNO: TIntegerField;
    QL_Tran2HORA: TDateTimeField;
    QL_Tran2CLIENTE: TIntegerField;
    QL_Tran2VEHICULO: TIntegerField;
    QL_Tran2COMBUSTIBLE: TIntegerField;
    QL_Tran2PRECIO: TFloatField;
    QL_Tran2LITROS: TFloatField;
    QL_Tran2IMPORTECMB: TFloatField;
    QL_Tran2IMPORTEOTR: TFloatField;
    QL_Tran2TOTAL: TFloatField;
    QL_Tran2ESTATUS: TStringField;
    QL_Tran2DESPACHADOR: TIntegerField;
    QL_Tran2INDICE: TIntegerField;
    QL_Tran2KILOMETRAJE: TIntegerField;
    QL_Tran2POSCARGA: TIntegerField;
    QL_Tran2TASAIVA: TFloatField;
    QL_Tran2TURNOLIQ: TIntegerField;
    DSQL_Tran2: TDataSource;
    PopupMenu1: TPopupMenu;
    AgregaraTurnoActual1: TMenuItem;
    QL_Tran: TQuery;
    DSQL_Tran: TDataSource;
    PopupMenu2: TPopupMenu;
    QuitarTransaccindeesteTurno1: TMenuItem;
    PasaUna: TSpeedButton;
    AgregarlasdelMismoTurno1: TMenuItem;
    TraspasarTodas1: TMenuItem;
    TraspasarTodas2: TMenuItem;
    PasaTodas: TSpeedButton;
    Panel5: TPanel;
    QL_Isla: TQuery;
    Panel6: TPanel;
    ListView1: TListView;
    ListView2: TListView;
    Panel7: TPanel;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    ComboBox1: TComboBox;
    QL_Isla2: TQuery;
    QL_Isla2ISLA: TIntegerField;
    QL_Isla2IMPORTE: TFloatField;
    QL_Isla2CANTIDAD: TIntegerField;
    QL_Islas: TQuery;
    QL_IslasISLA: TIntegerField;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    QL_TranTIPOVENTA: TStringField;
    QL_TranESTACION: TIntegerField;
    QL_TranFOLIO: TIntegerField;
    QL_TranISLA: TIntegerField;
    QL_TranBOMBA: TIntegerField;
    QL_TranFECHA: TDateTimeField;
    QL_TranTURNO: TIntegerField;
    QL_TranHORA: TDateTimeField;
    QL_TranCLIENTE: TIntegerField;
    QL_TranVEHICULO: TIntegerField;
    QL_TranCOMBUSTIBLE: TIntegerField;
    QL_TranPRECIO: TFloatField;
    QL_TranLITROS: TFloatField;
    QL_TranIMPORTECMB: TFloatField;
    QL_TranIMPORTEOTR: TFloatField;
    QL_TranTOTAL: TFloatField;
    QL_TranESTATUS: TStringField;
    QL_TranDESPACHADOR: TIntegerField;
    QL_TranINDICE: TIntegerField;
    QL_TranKILOMETRAJE: TIntegerField;
    QL_TranPOSCARGA: TIntegerField;
    QL_TranTASAIVA: TFloatField;
    QL_TranTURNOLIQ: TIntegerField;
    QL_TranFACTURADO: TStringField;
    QL_TranESTACIONFAC: TIntegerField;
    QL_TranSERIEFAC: TStringField;
    QL_TranFOLIOFAC: TIntegerField;
    QL_TranENLINEA: TStringField;
    QL_TranFOLIOFUERALINEA: TIntegerField;
    QL_TranMODOCARGA: TStringField;
    QL_TranFECHAFACTURA: TDateTimeField;
    QL_TranSUBCODIGO: TIntegerField;
    Label5: TLabel;
    Edit1: TEdit;
    BbCalcular: TBitBtn;
    QL_IslaISLA: TIntegerField;
    QL_IslaCANTIDAD: TIntegerField;
    QL_IslaIMPORTE: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BbCalcularClick(Sender: TObject);
    procedure PasaTodasClick(Sender: TObject);
    procedure PasaUnaClick(Sender: TObject);
  private
    { Private declarations }
    TotalTran,
    TotalTran2:real;
    pTurno:word;
  public
    { Public declarations }
    procedure PreparaForma;
    procedure RefrescaTablas;
  end;

var
  FLIQTRAN2: TFLIQTRAN2;

implementation

uses DDMGAS, DDMLIQ, DDMGASQ, ULIBDATABASE, ULIBGRAL, DDMGEN;

{$R *.DFM}

procedure TFLIQTRAN2.PreparaForma;
begin
  with DMGAS do begin
    ComboBox1.Items.Clear;
    ComboBox1.Items.Add('Todas las Islas');
    ComboBox2.Items.Clear;
    ComboBox2.Items.Add('Todas las Islas');
    QL_Islas.Close;
    QL_Islas.Prepare;
    QL_Islas.Open;
    while not QL_Islas.Eof do begin
      ComboBox1.Items.Add('Isla - '+InttoClaveNum(QL_IslasIsla.AsInteger,2));
      ComboBox2.Items.Add('Isla - '+InttoClaveNum(QL_IslasIsla.AsInteger,2));
      QL_Islas.Next;
    end;
    ComboBox1.ItemIndex:=0;
    ComboBox2.ItemIndex:=0;
  end;
end;

procedure TFLIQTRAN2.RefrescaTablas;
var xstr:string;
    li:Tlistitem;
    cant:word;
begin
  with DMGAS,DMGASQ do begin
    QL_Tran.Close;
    QL_Tran.SQL.Clear;
    QL_Tran.SQL.Add('select * from DGASTRAN');
    QL_Tran.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
    QL_Tran.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaIni)+'"');
    QL_Tran.SQL.Add('  and (TurnoLiq=0 or TurnoLiq is Null) ');
    QL_Tran.SQL.Add('  and Estatus="A" ');
    QL_Tran.SQL.Add('  and Despachador<>0 ');
    QL_Tran.SQL.Add('  and tipoventa<>'+QuotedStr('CO'));
    xstr:=ComboBox1.Items[ComboBox1.ItemIndex];
    if ComboBox1.ItemIndex>0 then
      QL_Tran.SQL.Add('and Isla='+ExtraeElemStrSep(xstr,2,'-'));
    QL_Tran.SQL.Add('Order by Hora');
    QL_Tran.Prepare;
    QL_Tran.Open;
//
    QL_Tran2.Close;
    QL_Tran2.SQL.Clear;
    QL_Tran2.SQL.Add('select * from DGASTRAN');
    QL_Tran2.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
    QL_Tran2.SQL.Add('  and Fecha="'+FechaToStrSQL(VgFechaFin)+'"');
    QL_Tran2.SQL.Add('  and Turno='+IntToStr(pTurno));
    QL_Tran2.SQL.Add('  and Estatus="A" ');
    QL_Tran2.SQL.Add('  and Despachador<>0 ');
    QL_Tran2.SQL.Add('  and tipoventa<>'+QuotedStr('CO'));
    xstr:=ComboBox2.Items[ComboBox2.ItemIndex];
    if ComboBox2.ItemIndex>0 then
      QL_Tran2.SQL.Add('and Isla='+ExtraeElemStrSep(xstr,2,'-'));
    QL_Tran2.SQL.Add('Order by Hora');
    QL_Tran2.Prepare;
    QL_Tran2.Open;

//Listas
    QL_Isla.Close;
    QL_Isla.ParamByName('pestacion').AsInteger:=EstacionActual;
    QL_Isla.ParamByName('pfecha').AsDateTime:=VgFechaIni;
    QL_Isla.Prepare;
    QL_Isla.Open;
    with Listview1 do begin
      Listview1.Items.Clear;
      totaltran:=0; cant:=0;
      while not QL_Isla.Eof do begin
        li:=Items.Add;
        li.Caption:='';
        li.SubItems.Add(IntToClaveNum(QL_IslaIsla.AsInteger,2));
        li.SubItems.Add(FormatFloat('##0',QL_IslaCantidad.AsInteger));
        Li.SubItems.Add(FormatoMoneda(QL_IslaImporte.AsFloat));
        TotalTran:=TotalTran+QL_IslaImporte.AsFloat;
        cant:=cant+QL_IslaCantidad.AsInteger;
        QL_Isla.Next;
      end;
      li:=Items.Add;
      li:=Items.Add;
      li.Caption:='';
      li.SubItems.Add('Total');
      Li.SubItems.Add(FormatFloat('##0',cant));
      Li.SubItems.Add(FormatoMoneda(TotalTran));
    end;
//Lista 2
    QL_Isla2.Close;
    QL_Isla2.ParamByName('pestacion').AsInteger:=EstacionActual;
    QL_Isla2.ParamByName('pfecha').AsDateTime:=VgFechaFin;
    QL_Isla2.Prepare;
    QL_Isla2.Open;
    with ListView2 do begin
      ListView2.Items.Clear;
      TotalTran2:=0;  cant:=0;
      while not QL_Isla2.Eof do begin
        li:=Items.Add;
        li.Caption:='';
        li.SubItems.Add(IntToClaveNum(QL_Isla2Isla.AsInteger,2));
        li.SubItems.Add(FormatFloat('##0',QL_Isla2Cantidad.AsInteger));
        Li.SubItems.Add(FormatoMoneda(QL_Isla2Importe.AsFloat));
        TotalTran2:=Totaltran2+QL_Isla2Importe.AsFloat;
        cant:=cant+QL_Isla2Cantidad.AsInteger;
        QL_Isla2.Next;
      end;
      li:=Items.Add;
      li:=Items.Add;
      li.Caption:='';
      li.SubItems.Add('Total');
      Li.SubItems.Add(FormatFloat('##0',cant));
      Li.SubItems.Add(FormatoMoneda(totaltran2));
    end;
  end;
end;

procedure TFLIQTRAN2.FormShow(Sender: TObject);
begin
  with DMGAS,DMGASQ,DMLIQ do begin
    MaskEdit3.EditMask:=MaskFecha2;
    MaskEdit4.EditMask:=MaskFecha2;
    MaskEdit3.Text:=FechaToFormato(VgFechaIni);
    MaskEdit4.Text:=FechaToFormato(VgFechaFin);
    T_Tran.active:=true;
    MaskEdit3.SetFocus;
  end;
end;

procedure TFLIQTRAN2.ComboBox2Change(Sender: TObject);
begin
  RefrescaTablas;
end;

procedure TFLIQTRAN2.BbCalcularClick(Sender: TObject);
begin
  with DMGEN do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if StrToIntDef(Edit1.Text,-1)=-1 then
      raise Exception.Create('Turno incorrecto');
    pTurno:=StrToInt(Edit1.Text);
    RefrescaTablas;
  end;
end;

procedure TFLIQTRAN2.PasaTodasClick(Sender: TObject);
begin
  with DMGASQ,DMLIQ do begin
    if QL_Tran.State <> dsinactive then begin
      QL_Tran.First;
      while not QL_Tran.Eof do begin
        if LocalizaTabla(T_Tran,'TipoVenta;Estacion;Folio',
           VarArrayOf([QL_TranTipoVenta.asstring,QL_TranEstacion.asinteger,QL_TranFolio.asinteger])) then
        begin
          T_Tran.Edit;
          T_TranTurno.AsInteger:=pTurno;
          T_TranFecha.AsDateTime:=VgFechaFin;
          T_Tran.Post;
        end;
        QL_Tran.Next;
      end;
      RefrescaTablas;
    end;
  end;
end;

procedure TFLIQTRAN2.PasaUnaClick(Sender: TObject);
begin
  with DMGASQ,DMLIQ do begin
    if LocalizaTabla(T_Tran,'TipoVenta;Estacion;Folio',
       VarArrayOf([QL_TranTipoVenta.asstring,QL_TranEstacion.asinteger,QL_TranFolio.asinteger])) then
    begin
      T_Tran.Edit;
      T_TranTurno.AsInteger:=pTurno;
      T_TranFecha.AsDateTime:=VgFechaFin;
      T_Tran.Post;
      RefrescaTablas;
    end;
  end;
end;

end.
