unit ULIQCONS03;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids, Db, DBTables,
  Menus, ComCtrls, RxMemDS;

type
  TFLIQCONS03 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BbSalir: TBitBtn;
    BbImprimir: TBitBtn;
    DBNavigator1: TDBNavigator;
    BbPrever: TBitBtn;
    Label9: TLabel;
    ComboBox1: TComboBox;
    QL_Vale: TQuery;
    DSQL_Vale: TDataSource;
    PopupMenu1: TPopupMenu;
    FiltrarCliente: TMenuItem;
    FiltrarFecha: TMenuItem;
    DBLookupComboBox2: TDBLookupComboBox;
    N1: TMenuItem;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBText2: TDBText;
    DBText3: TDBText;
    ListView2: TListView;
    ListView1: TListView;
    DBText1: TDBText;
    Panel7: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox3: TCheckBox;
    QL_ValeESTACION: TIntegerField;
    QL_ValeCAJA: TIntegerField;
    QL_ValeFECHA: TDateTimeField;
    QL_ValeTURNO: TIntegerField;
    QL_ValeINDICE: TIntegerField;
    QL_ValeINDICEVALE: TIntegerField;
    QL_ValeIMPORTE: TFloatField;
    QL_ValeFACTURADO: TStringField;
    QL_ValeESTACIONFAC: TIntegerField;
    QL_ValeSERIEFAC: TStringField;
    QL_ValeFOLIOFAC: TIntegerField;
    QL_ValeCLIENTE: TIntegerField;
    QL_ValeDESPACHADOR: TIntegerField;
    QL_ValeSUBCODIGO: TIntegerField;
    QL_ValeFOLIOVOLUMETRICO: TIntegerField;
    QL_ValeISLA: TIntegerField;
    Panel8: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    QL_Dval: TQuery;
    QL_DvalPRODUCTO: TIntegerField;
    QL_DvalSUBCLAVE: TIntegerField;
    QL_DvalIMPORTE: TFloatField;
    QL_DvalCANTIDAD: TFloatField;
    DSQL_Dval: TDataSource;
    QL_ValeNombreCliente: TStringField;
    QL_ValeNombreDespachador: TStringField;
    QL_DvalNombreCombustible: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox4: TCheckBox;
    QL_Vale2: TQuery;
    QL_Vale2ISLA: TIntegerField;
    QL_Vale2IMPORTE: TFloatField;
    QL_DvalSubClaveStr: TStringField;
    CheckBox1: TCheckBox;
    TT_Auxi: TRxMemoryData;
    TT_AuxiCombustible: TIntegerField;
    TT_AuxiNombreCombustible: TStringField;
    TT_AuxiCantidad: TFloatField;
    TT_AuxiImporte: TFloatField;
    procedure BbCalcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BbSalirClick(Sender: TObject);
    procedure BbImprimirClick(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox2Change(Sender: TObject);
    procedure FiltrarClienteClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure QL_DvalCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    pEstacion,
    pCaja,
    pTurno:integer;
    pFecha:Tdatetime;
    procedure RefrescaTabla;
    procedure CalculaResumen;
  end;

var
  FLIQCONS03: TFLIQCONS03;
  pCliente:Integer;
  pFecha:TDateTime;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMGENQ, DDMGEN_VTAS, DDMGAS,
  DDMCUP, UGENCLIEB;


{$R *.DFM}

procedure TFLIQCONS03.RefrescaTabla;
begin
  with DMGEN,DMGAS do begin
    QL_Vale.Close;
    QL_Vale.SQL.Clear;
    QL_Vale.SQL.Add('Select m.* from DGASVALE m');
    QL_Vale.SQL.Add(' Where m.Estacion='+IntToStr(pEstacion));
    QL_Vale.SQL.Add('   and m.Caja='+IntToStr(pCaja));
    QL_Vale.SQL.Add('   and m.Fecha>="'+FechaToStrSQL(pFecha)+'"');
    QL_Vale.SQL.Add('   and m.Turno='+IntToStr(pTurno));
    QL_Vale.SQL.Add('   and m.Importe>0.001 ');
    if not CheckBox3.Checked then
      QL_Vale.SQL.Add(' and m.Isla='+IntToStr(DBLookupComboBox1.KeyValue));
    if not CheckBox4.Checked then
      QL_Vale.SQL.Add(' and m.Despachador='+IntToStr(DBLookupComboBox2.KeyValue));
    if FiltrarCliente.Checked then
      QL_Vale.SQL.Add(' and m.Cliente='+InttoStr(pCliente));
    QL_Vale.SQL.Add('and exists');
    QL_Vale.SQL.Add('(select d.* from dgasdval d');
    QL_Vale.SQL.Add('where d.estacion= m.estacion');
    QL_Vale.SQL.Add('and d.caja= m.caja');
    QL_Vale.SQL.Add('and d.fecha = m.fecha');
    QL_Vale.SQL.Add('and d.turno= m.turno');
    QL_Vale.SQL.Add('and d.indice= m.indice');
    QL_Vale.SQL.Add('and d.indicevale= m.indicevale)');

    Case ComboBox1.ItemIndex of
      0:QL_Vale.SQL.Add('Order by m.Cliente');
      1:QL_Vale.SQL.Add('Order by m.Isla');
      2:QL_Vale.SQL.Add('Order by m.Despachador');
      3:QL_Vale.SQL.Add('Order by m.Importe desc');
    end;
    QL_Vale.Prepare;
    QL_Vale.Open;
    QL_Dval.Close;
    QL_Dval.Prepare;
    QL_Dval.Open;
    CalculaResumen;
  end;
end;


procedure TFLIQCONS03.CalculaResumen;
var tot:array[1..2] of double;
    li:Tlistitem;
    i:word;
begin
  with DMGEN,DMGAS do begin
    try
      TT_Auxi.Active:=true;
      if not TT_Auxi.IsEmpty then
        TT_Auxi.EmptyTable;
      QL_Vale.First;
      while not QL_Vale.Eof do begin
        QL_Dval.Close;
        QL_Dval.Prepare;
        QL_Dval.Open;
        while not QL_Dval.Eof do begin
          if TT_Auxi.Locate('Combustible',QL_DvalProducto.AsInteger,[]) then begin
            TT_Auxi.Edit;
            TT_AuxiCantidad.AsFloat:=TT_AuxiCantidad.AsFloat+QL_DvalCantidad.AsFloat;
            TT_AuxiImporte.AsFloat:=TT_AuxiImporte.AsFloat+QL_DvalImporte.AsFloat;
          end
          else begin
            TT_Auxi.Insert;
            TT_AuxiCombustible.AsInteger:=QL_DvalProducto.AsInteger;
            TT_AuxiNombreCombustible.AsString:=QL_DvalNombreCombustible.AsString;
            TT_AuxiCantidad.AsFloat:=QL_DvalCantidad.AsFloat;
            TT_AuxiImporte.AsFloat:=QL_DvalImporte.AsFloat;
          end;
          TT_Auxi.Post;
          QL_Dval.Next;
        end;
        QL_Vale.Next;
      end;
    finally
      for i:=1 to 2 do
        tot[i]:=0;
      ListView1.Items.Clear;
      TT_Auxi.First;
      with ListView1 do begin
        while not TT_Auxi.Eof do begin
          li:=Items.Add;
          li.Caption:='';
          li.SubItems.Add(TT_AuxiNombreCombustible.AsString);
          li.SubItems.Add(FormatoMoneda(TT_AuxiCantidad.AsFloat));
          Li.SubItems.Add(FormatoMoneda(TT_AuxiImporte.AsFloat));
          tot[1]:=tot[1]+TT_AuxiCantidad.AsFloat;
          tot[2]:=tot[2]+TT_AuxiImporte.AsFloat;
          TT_Auxi.Next;
        end;
        li:=Items.Add;
        li:=Items.Add;
        li.Caption:='';
        li.SubItems.Add('Total');
        for i:=1 to 2 do begin
          li.SubItems.Add(FormatoMoneda(tot[i]));
        end;
      end;
    end;
// RESUMEN POR ISLAS
    QL_Vale2.Close;
    QL_Vale2.SQL.Clear;
    QL_Vale2.SQL.Add('Select m.Isla, Sum(m.importe) as importe from DGASVALE m');
    QL_Vale2.SQL.Add(' Where m.Estacion='+IntToStr(pEstacion));
    QL_Vale2.SQL.Add('   and m.Caja='+IntToStr(pCaja));
    QL_Vale2.SQL.Add('   and m.Fecha>="'+FechaToStrSQL(pFecha)+'"');
    QL_Vale2.SQL.Add('   and m.Turno='+IntToStr(pTurno));
    QL_Vale2.SQL.Add('   and m.Importe>0.001 ');
    if not CheckBox3.Checked then
      QL_Vale2.SQL.Add(' and m.Isla='+IntToStr(DBLookupComboBox1.KeyValue));
    if not CheckBox4.Checked then
      QL_Vale2.SQL.Add(' and m.Despachador='+IntToStr(DBLookupComboBox2.KeyValue));
    if FiltrarCliente.Checked then
      QL_Vale2.SQL.Add(' and m.Cliente='+InttoStr(pCliente));
    QL_Vale2.SQL.Add('and exists');
    QL_Vale2.SQL.Add('(select d.* from dgasdval d');
    QL_Vale2.SQL.Add('where d.estacion= m.estacion');
    QL_Vale2.SQL.Add('and d.caja= m.caja');
    QL_Vale2.SQL.Add('and d.fecha = m.fecha');
    QL_Vale2.SQL.Add('and d.turno= m.turno');
    QL_Vale2.SQL.Add('and d.indice= m.indice');
    QL_Vale2.SQL.Add('and d.indicevale= m.indicevale)');

    QL_Vale2.SQL.Add('Group by m.Isla');
    QL_Vale2.SQL.Add('Order by m.Isla');
    QL_Vale2.Prepare;
    QL_Vale2.Open;
    for i:=1 to 2 do
      tot[i]:=0;
    ListView2.Items.Clear;
    QL_Vale2.DisableControls;
    with ListView2 do begin
      while not QL_Vale2.Eof do begin
        li:=Items.Add;
        li.Caption:='';
        li.SubItems.Add(IntToClaveNum(QL_Vale2Isla.AsInteger,2));
        Li.SubItems.Add(FormatoMoneda(QL_Vale2Importe.AsFloat));
        tot[1]:=tot[1]+QL_Vale2Importe.AsFloat;
        QL_Vale2.Next;
      end;
      li:=Items.Add;
      li:=Items.Add;
      li.Caption:='';
      li.SubItems.Add('Total');
      for i:=1 to 1 do begin
        li.SubItems.Add(FormatoMoneda(tot[i]));
      end;
    end;
  end;
end;

procedure TFLIQCONS03.BbCalcularClick(Sender: TObject);
begin
{  with DMGENQ,DMGEN,DMGEN_VTAS,DMGAS do begin
    try
      BbCalcular.SetFocus;
      BbSalir.Enabled:=false;
      VgFechaIni:=StrToDate(MaskEdit1.text);
      VgFechaFin:=StrToDate(MaskEdit2.text);
      if not FechaEnEjercicio(VgFechaIni,idGas) then
        raise Exception.Create('Fecha inicial no es del Ejercicio');
      if not FechaEnEjercicio(VgFechaFin,idGas) then
        raise Exception.Create('Fecha final no es del Ejercicio');
      if VgFechaIni>VgFechaFin then
        raise Exception.Create('Periodo Inválido');
      RefrescaTabla;
    finally
      Label4.Enabled:=true;
      Edit1.Enabled:=true;
      SBbuscar.Enabled:=true;
      BbCalcular.Enabled:=false;
      BbSalir.Enabled:=true;
      BbSalir.SetFocus;
    end;
  end;}
end;

procedure TFLIQCONS03.FormShow(Sender: TObject);
begin
  with DMGAS do begin
    T_Isla.Active:=true;
    T_Desp.Active:=true;
    DBLookupComboBox1.KeyValue:=T_IslaIsla.AsInteger;
    DBLookupComboBox2.KeyValue:=T_DespClave.AsInteger;
    ComboBox1.ItemIndex:=0;
    RefrescaTabla;
  end;
end;


procedure TFLIQCONS03.BbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQCONS03.BbImprimirClick(Sender: TObject);
begin
{  Application.CreateForm(TFLIQCONS01I,FLIQCONS01I);
  try
    QL_Tran.DisableControls;
    QL_Vale.DisableControls;
    QL_Dval.DisableControls;
    QL_Tran2.DisableControls;
    FLIQCONS01I.PreparaReporte;
    if Sender = BbPrever then
      FLIQCONS01I.QuickRep1.Preview
    else
      FLIQCONS01I.QuickRep1.Print;
  finally
    FLIQCONS01I.Free;
    QL_Tran.EnableControls;
    QL_Vale.EnableControls;
    QL_Dval.EnableControls;
    QL_Tran2.EnableControls;
  end;}
end;

procedure TFLIQCONS03.Panel1Enter(Sender: TObject);
begin
{  QL_Vale.Close;
  QL_Vale2.Close;
  QL_Dval.Close;
  TT_Auxi.Active:=false;
  Listview1.Items.Clear;
  Listview2.Items.Clear;}
end;

procedure TFLIQCONS03.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN do begin
    QL_Vale.Close;
    QL_Vale2.Close;
    QL_Dval.Close;
  end;
end;

procedure TFLIQCONS03.ComboBox2Change(Sender: TObject);
begin
  RefrescaTabla;
end;

procedure TFLIQCONS03.FiltrarClienteClick(Sender: TObject);
begin
  if Sender=CheckBox1 then begin
    FiltrarCliente.Checked:=CheckBox1.Checked;
  end
  else begin
    FiltrarCliente.Checked:=not FiltrarCliente.Checked;
    CheckBox1.Checked:=FiltrarCliente.Checked;
  end;
  pCliente:=QL_ValeCliente.AsInteger;
  RefrescaTabla;
end;

procedure TFLIQCONS03.DBLookupComboBox1Click(Sender: TObject);
begin
  RefrescaTabla;
end;

procedure TFLIQCONS03.DBLookupComboBox2Click(Sender: TObject);
begin
  RefrescaTabla;
end;

procedure TFLIQCONS03.CheckBox3Click(Sender: TObject);
begin
  DBLookUpComboBox1.Enabled:=not CheckBox3.Checked;
  Refrescatabla;
end;

procedure TFLIQCONS03.CheckBox4Click(Sender: TObject);
begin
  DBLookUpComboBox2.Enabled:=not CheckBox4.Checked;
  Refrescatabla;
end;

procedure TFLIQCONS03.QL_DvalCalcFields(DataSet: TDataSet);
begin
  QL_DvalSubClaveStr.AsString:='';
  if QL_DvalSubclave.AsInteger>0 then QL_DvalSubClaveStr.AsString:=IntToClaveNum(QL_DvalSubClave.AsInteger,3);
end;

end.
