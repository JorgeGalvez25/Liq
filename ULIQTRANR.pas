unit ULIQTRANR;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, Db, DBTables, Menus, StdCtrls, Buttons,
  ComCtrls;

type
  TFLIQTRANR = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    QL_Tran: TQuery;
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
    DSL_Tran: TDataSource;
    PopupMenu1: TPopupMenu;
    AgregaraTurnoActual1: TMenuItem;
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
    DSL_Tran2: TDataSource;
    PopupMenu2: TPopupMenu;
    QuitarTransaccindeesteTurno1: TMenuItem;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    AgregarlasdelMismoTurno1: TMenuItem;
    TraspasarTodas1: TMenuItem;
    TraspasarTodas2: TMenuItem;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Panel5: TPanel;
    QL_Isla2: TQuery;
    QL_Isla2ISLA: TIntegerField;
    QL_Isla2IMPORTE: TFloatField;
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
    QL_Isla: TQuery;
    QL_IslaISLA: TIntegerField;
    QL_IslaIMPORTE: TFloatField;
    QL_Isla2CANTIDAD: TIntegerField;
    QL_IslaCANTIDAD: TIntegerField;
    QL_Islas: TQuery;
    QL_IslasISLA: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure TraspasarTodas2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
    TotalTran,
    TotalTran2:real;
  public
    { Public declarations }
    procedure PreparaForma;
    procedure RefrescaTablas;
  end;

var
  FLIQTRANR: TFLIQTRANR;

implementation

uses DDMGAS, DDMLIQ, DDMGASQ, ULIBDATABASE, ULIBGRAL, DDMGEN, ULIQTURC;

{$R *.DFM}

procedure TFLIQTRANR.PreparaForma;
begin
  with DMGAS do begin
    ComboBox1.Items.Clear;
    ComboBox1.Items.Add('Todas las Islas');
    ComboBox2.Items.Clear;
    ComboBox2.Items.Add('Todas las Islas');
    QL_Islas.Close;
    QL_Islas.ParamByName('PESTACION').AsInteger:=EstacionActual;
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

procedure TFLIQTRANR.RefrescaTablas;
var xstr:string;
    li:Tlistitem;
    cant:word;
begin
  with DMGAS,DMGASQ do begin
    QL_Tran.Close;
    QL_Tran.SQL.Clear;
    QL_Tran.SQL.Add('select * from DGASTRAN');
    QL_Tran.SQL.Add('Where Estacion='+IntToStr(FLIQTURC.QL_TurcESTACION.AsInteger));
    QL_Tran.SQL.Add('  and Fecha="'+FechaToStrSQL(FLIQTURC.QL_TurcFECHA.AsDateTime)+'"');
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
    QL_Tran2.SQL.Add('Where Estacion='+IntToStr(FLIQTURC.QL_TurcESTACION.AsInteger));
    QL_Tran2.SQL.Add('  and Fecha="'+FechaToStrSQL(FLIQTURC.QL_TurcFECHA.AsDateTime)+'"');
    QL_Tran2.SQL.Add('  and TurnoLiq='+IntToStr(FLIQTURC.QL_TurcTURNO.AsInteger));
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

    QL_Isla2.Close;
    QL_Isla2.ParamByName('pestacion').AsInteger:=FLIQTURC.QL_TurcESTACION.AsInteger;
    QL_Isla2.ParamByName('pfecha').AsDateTime:=FLIQTURC.QL_TurcFECHA.AsDateTime;
    QL_Isla2.ParamByName('pturno').AsInteger:=FLIQTURC.QL_TurcTURNO.AsInteger;
    QL_Isla2.Prepare;
    QL_Isla2.Open;
    with ListView1 do begin
      ListView1.Items.Clear;
      TotalTran:=0;  cant:=0;
      while not QL_Isla2.Eof do begin
        li:=Items.Add;
        li.Caption:='';
        li.SubItems.Add(IntToClaveNum(QL_Isla2Isla.AsInteger,2));
        li.SubItems.Add(FormatFloat('##0',QL_Isla2Cantidad.AsInteger));
        Li.SubItems.Add(FormatoMoneda(QL_Isla2Importe.AsFloat));
        TotalTran:=Totaltran+QL_Isla2Importe.AsFloat;
        cant:=cant+QL_Isla2Cantidad.AsInteger;
        QL_Isla2.Next;
      end;
      li:=Items.Add;
      li:=Items.Add;
      li.Caption:='';
      li.SubItems.Add('Total');
      Li.SubItems.Add(FormatFloat('##0',cant));
      Li.SubItems.Add(FormatoMoneda(totaltran));
    end;
    
    //Lista 2
    QL_Isla.Close;
    QL_Isla.ParamByName('pestacion').AsInteger:=FLIQTURC.QL_TurcESTACION.AsInteger;
    QL_Isla.ParamByName('pfecha').AsDateTime:=FLIQTURC.QL_TurcFECHA.AsDateTime;
    QL_Isla.Prepare;
    QL_Isla.Open;
    with Listview2 do begin
      Listview2.Items.Clear;
      totaltran2:=0; cant:=0;
      while not QL_Isla.Eof do begin
        li:=Items.Add;
        li.Caption:='';
        li.SubItems.Add(IntToClaveNum(QL_IslaIsla.AsInteger,2));
        li.SubItems.Add(FormatFloat('##0',QL_IslaCantidad.AsInteger));
        Li.SubItems.Add(FormatoMoneda(QL_IslaImporte.AsFloat));
        TotalTran2:=TotalTran2+QL_IslaImporte.AsFloat;
        cant:=cant+QL_IslaCantidad.AsInteger;
        QL_Isla.Next;
      end;
      li:=Items.Add;
      li:=Items.Add;
      li.Caption:='';
      li.SubItems.Add('Total');
      Li.SubItems.Add(FormatFloat('##0',cant));
      Li.SubItems.Add(FormatoMoneda(TotalTran2));
    end;
  end;
end;

procedure TFLIQTRANR.FormShow(Sender: TObject);
begin
  with DMGAS,DMGASQ,DMLIQ do begin
    T_Tran.active:=true;
    RefrescaTablas;
    DBGrid2.SetFocus;
  end;
end;

procedure TFLIQTRANR.TraspasarTodas2Click(Sender: TObject);
var i:word;
begin

end;

procedure TFLIQTRANR.ComboBox2Change(Sender: TObject);
begin
  RefrescaTablas;
end;

end.
