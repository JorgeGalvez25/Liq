unit ULIQPVALCAN;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids, Db, DBTables,
  Menus, ComCtrls, RxMemDS, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TFLIQPVALCAN = class(TForm)
    Panel4: TPanel;
    QL_Pval: TQuery;
    DSTT_Auxi: TDataSource;
    Bevel2: TBevel;
    DBText2: TDBText;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BbSalir: TBitBtn;
    BbCancelar: TBitBtn;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    QL_PvalESTACIONFAC: TIntegerField;
    QL_PvalSERIEFAC: TStringField;
    QL_PvalFOLIOFAC: TIntegerField;
    QL_PvalTOTAL: TFloatField;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    MaskEdit2: TMaskEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    BbCalcular: TBitBtn;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Edit3: TEdit;
    TT_Auxi: TRxMemoryData;
    TT_AuxiESTACIONFAC: TIntegerField;
    TT_AuxiSERIEFAC: TStringField;
    TT_AuxiFOLIOFAC: TIntegerField;
    TT_AuxiTOTAL: TFloatField;
    PopupMenu1: TPopupMenu;
    EliminarRegistro1: TMenuItem;
    Label4: TLabel;
    StaticText1: TStaticText;
    BbPrever: TBitBtn;
    BbImprimir: TBitBtn;
    QL_PvalFECHAFACTURA: TDateTimeField;
    QL_PvalCLIENTE: TIntegerField;
    TT_AuxiFECHAFACTURA: TDateTimeField;
    TT_AuxiCLIENTE: TIntegerField;
    TT_AuxiNombreCliente: TStringField;
    TT_AuxiCargo: TStringField;
    QL_Docu: TQuery;
    QL_DocuCLAVEDOC: TStringField;
    QL_DocuDESCRIPCION: TStringField;
    QL_DocuClaveDescripcion: TStringField;
    DSQL_Docu: TDataSource;
    Label5: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1FECHAFACTURA: TcxGridDBColumn;
    cxGrid1DBTableView1CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1NombreCliente: TcxGridDBColumn;
    cxGrid1DBTableView1Cargo: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure BbSalirClick(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure BbCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BbCalcularClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
    procedure EliminarRegistro1Click(Sender: TObject);
    procedure BbPreverClick(Sender: TObject);
    procedure QL_DocuCalcFields(DataSet: TDataSet);
    procedure GroupBox1Enter(Sender: TObject);
  private
    { Private declarations }
    procedure RefrescaTabla;
    procedure Total;
  public
    { Public declarations }
  end;

var
  FLIQPVALCAN: TFLIQPVALCAN;
  folioini,
  foliofin:integer;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMGENQ, DDMGEN_VTAS, DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, DDMCXC, ULIQPVALCANI;

{$R *.DFM}

procedure TFLIQPVALCAN.Total;
var tot:double;
    bm:tbookmark;
begin
  try
    TT_Auxi.DisableControls;
    bm:=TT_Auxi.GetBookmark;
    TT_Auxi.first; tot:=0;
    while not TT_Auxi.Eof do begin
      tot:=tot+TT_AuxiTotal.AsFloat;
      TT_Auxi.Next;
    end;
  finally
    TT_Auxi.GotoBookmark(bm);
    TT_Auxi.FreeBookmark(bm);
    StaticText1.Caption:=FormatoMoneda(tot);
    StaticText1.Refresh;
    TT_Auxi.EnableControls;
  end;
end;

procedure TFLIQPVALCAN.RefrescaTabla;
var i:integer;
    tot:double;
begin
  with DMGENQ,DMGEN,DMGEN_VTAS,DMGAS do begin
    try
      BbCancelar.Enabled:=false;
      BbSalir.Enabled:=false;
      QL_Pval.Close;
      QL_Pval.SQL.Clear;
      QL_Pval.SQL.Add('Select EstacionFac,SerieFac,FolioFac,Cliente,FechaFactura,sum(total) as Total');
      QL_Pval.SQL.Add('from DGASPVAL');
      QL_Pval.SQL.Add(' Where EstacionFac='+IntToStr(EstacionActual));
      QL_Pval.SQL.Add('  and SerieFac="'+DBLookupComboBox2.KeyValue+'"');
//      QL_Pval.SQL.Add('  and SerieFac="'+VarGasTipoMovCargoVales+'"');
      QL_Pval.SQL.Add('  and FechaFactura>="'+FechaToStrSQL(VgFechaIni)+'"');
      QL_Pval.SQL.Add('  and FechaFactura<="'+FechaToStrSQL(VgFechaFin)+'"');
      if CheckBox1.Checked then begin
        QL_Pval.SQL.Add('  and FolioFac>='+InttoStr(FolioIni));
        QL_Pval.SQL.Add('  and FolioFac<='+IntToStr(FolioFin));
      end;
      QL_Pval.SQL.Add('Group by estacionfac,seriefac,foliofac,cliente,fechafactura');
      QL_Pval.SQL.Add('Order by foliofac');
      QL_Pval.Prepare;
      QL_Pval.Open;
      tot:=0;
      TT_Auxi.Active:=true;
      try
        TT_Auxi.DisableControls;
        while not QL_Pval.Eof do begin
          TT_Auxi.Insert;
          for i:=0 to QL_Pval.FieldCount-1 do begin
            TT_Auxi.FieldByName(QL_Pval.Fields[i].FieldName).AsVariant:=QL_Pval.Fields[i].AsVariant;
          end;
          tot:=tot+TT_AuxiTotal.AsFloat;
          TT_Auxi.Post;
          QL_Pval.Next;
        end;
        TT_Auxi.SortOnFields('FolioFac',true,false);
      finally
        TT_Auxi.EnableControls;
        StaticText1.Caption:=FormatoMoneda(tot);
        StaticText1.Refresh;
      end;
    finally
      BbCancelar.Enabled:=false;
      BbSalir.Enabled:=true;
      BbSalir.SetFocus;
    end;
  end;
end;


procedure TFLIQPVALCAN.FormShow(Sender: TObject);
begin
  MaskEdit1.EditMask:=MaskFecha2;
  MaskEdit2.EditMask:=MaskFecha2;
  MaskEdit1.Text:=FechaToFormato(VgFechaIni);
  MaskEdit2.Text:=FechaToFormato(VgFechaFin);
  BbCancelar.Enabled:=false;
  MaskEdit1.SetFocus;
  QL_Docu.Close;
  QL_Docu.Prepare;
  QL_Docu.Open;
  if QL_Docu.Locate('ClaveDoc',DMGAS.VarGasTipoMovCargoVales,[]) then;
  DBLookUpComboBox2.KeyValue:=QL_DocuClaveDoc.AsString;
end;


procedure TFLIQPVALCAN.BbSalirClick(Sender: TObject);
begin
  Close;
end;


procedure TFLIQPVALCAN.Panel1Enter(Sender: TObject);
begin
  BbCancelar.Enabled:=False;
  TT_Auxi.Close;
end;

procedure TFLIQPVALCAN.BbCancelarClick(Sender: TObject);
var xsuc,i,j:integer;
    xtipomov:string;
begin
  with DMCXC,DMGEN_VTAS,DMLIQ,DMGAS do begin
    try
      TT_Auxi.First;
      i:=0;
      j:=TT_Auxi.RecordCount;
      xtipomov:=DBLookUpComboBox2.KeyValue;
      FAvance.PreparaAvance('Cancelando Vales de Crédito...',true,TT_Auxi.RecordCount);
      while not TT_Auxi.Eof do begin
        StatusBar1.Panels[0].Text:='Cliente: '+IntToClaveNum(TT_AuxiCliente.AsInteger,5);
        StatusBar1.Refresh;
        //Eliminar el Cargo en CXC
        try
          DBVentas1.StartTransaction;
          xsuc:=T_EstsSucursal.AsInteger;
          if xsuc<1 then xsuc:=1;
          if LocalizaTabla(T_Carg,'Sucursal;TipoMov;Folio;Indice',
                           VarArrayOf([xSuc,
                                       TT_AuxiSerieFac.AsString,
                                       TT_AuxiFolioFac.AsInteger,
                                       1])) then
          begin
            AplicaCargo(T_CargSucursal.AsInteger,T_CargTipoMov.asstring,T_CargFolio.asinteger,T_CargIndice.AsInteger,false);
            T_Carg.Refresh;
            T_Carg.Delete;
            T_Carg.Refresh;
          end;
          DBVentas1.Commit
        except
          on e:Exception do begin
            DBVentas1.Rollback;
            TT_Auxi.Next;
            Continue;
          end;
//          raise;
        end;
        try
          DBGAS2.StartTransaction;
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Update DGASPVAL Set Facturado="No" ');
          Q_Auxi.SQL.Add(' Where EstacionFac='+IntToStr(TT_AuxiEstacionFac.AsInteger));
          Q_Auxi.SQL.Add('   and SerieFac="'+TT_AuxiSerieFac.AsString+'"');
          Q_Auxi.SQL.Add('   and FolioFac='+IntToStr(TT_AuxiFolioFac.AsInteger));
          Q_Auxi.SQL.Add('   and Cliente='+IntToStr(TT_AuxiCliente.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.ExecSQL;
          DBGAS2.Commit;
        except
          DBGAS2.Rollback;
          raise;
        end;
        Inc(i);
        FAvance.AvanzaPosicion;
        TT_Auxi.Next;
      end;
    finally
      StatusBar1.Panels[0].Text:='';
      FAvance.Close;
      BbCancelar.Enabled:=false;
      if i<j then begin
        MensajeInfo('Los cargos que se muestra No fueron Cancelados debido a que tiene Abonos Aplicados');
        TT_Auxi.Close;
        TT_Auxi.Open;
        BbCalcularClick(Sender);
      end
      else
        MensajeInfo('Proceso terminado...');
    end;
  end;
end;

procedure TFLIQPVALCAN.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Pval.close;
    TT_Auxi.Close;
  end;
end;

procedure TFLIQPVALCAN.BbCalcularClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMGASQ do begin
    VgFechaIni:=StrToDate(MaskEdit1.text);
    VgFechaFin:=StrToDate(MaskEdit2.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    if CheckBox1.Checked then begin
      folioini:=StrtoInt(Edit2.Text);
      foliofin:=StrToInt(Edit3.Text);
      if Folioini>folioFin then
        raise Exception.Create('Rango de Folio Inválido');
    end;
    RefrescaTabla;
    if TT_Auxi.RecordCount>0 then
      BbCancelar.Enabled:=true;
  end;
end;

procedure TFLIQPVALCAN.CheckBox1Click(Sender: TObject);
begin
  Label2.Enabled:=CheckBox1.Checked;
  Edit2.Enabled:=CheckBox1.Checked;
  Label3.Enabled:=CheckBox1.Checked;
  Edit3.Enabled:=CheckBox1.Checked;
  if CheckBox1.Checked then Edit2.SetFocus;
end;

procedure TFLIQPVALCAN.Edit2Exit(Sender: TObject);
begin
  if BbCancelar.Focused then begin
    with Sender as TEdit do begin
      if StrToIntDef(Text,-1)=-1 then
        raise Exception.Create('Folio no válido')
      else
        Text:=IntToClaveNum(StrToInt(Text),6);
    end;
  end;
end;

procedure TFLIQPVALCAN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFLIQPVALCAN.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  TT_auxiCargo.AsString:=TT_AuxiSerieFac.AsString+'-'+IntToClaveNum(TT_AuxiFolioFac.AsInteger,6);
end;

procedure TFLIQPVALCAN.EliminarRegistro1Click(Sender: TObject);
var i:word;
begin
{  if DBGrid1.SelectedRows.Count>0 then begin
    with DBGrid1.DataSource.DataSet do begin
      for i:=0 to DBGrid1.SelectedRows.Count-1 do begin
        GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
        with DBGrid1.DataSource.DataSet do
          delete;
      end;
    end;
    Total;
  end;}
  if cxGrid1DBTableView1.Controller.SelectedRowCount>0 then begin
    with cxGrid1DBTableView1.DataController do begin
      DeleteSelection;
    end;
    Total;
  end;
end;

procedure TFLIQPVALCAN.BbPreverClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQPVALCANI,FLIQPVALCANI);
  try
    TT_Auxi.DisableControls;
    FLIQPVALCANI.PreparaReporte;
    if sender=BbImprimir then
      FLIQPVALCANI.QuickRep1.Print
    else
      FLIQPVALCANI.QuickRep1.Preview;
  finally
    FLIQPVALCANI.Free;
    TT_Auxi.EnableControls;
  end;
end;

procedure TFLIQPVALCAN.QL_DocuCalcFields(DataSet: TDataSet);
begin
  QL_DocuClaveDescripcion.AsString:=QL_DocuClaveDoc.AsString+' '+QL_DocuDescripcion.AsString;
end;

procedure TFLIQPVALCAN.GroupBox1Enter(Sender: TObject);
begin
//  BbCancelar.Enabled := False;
end;

end.
