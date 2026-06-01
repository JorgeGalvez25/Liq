unit ULIQUTIL01;

interface

uses Variants, Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,db,
  Mask, DBTables, ToolWin, ImgList, DBActns, ActnList;

type
  TFLIQUTIL01 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    ActionList1: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetCancel1: TDataSetCancel;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetPost1: TDataSetPost;
    PopupMenu1: TPopupMenu;
    Guardar1: TMenuItem;
    Cancelar1: TMenuItem;
    Insertar1: TMenuItem;
    Eliminar1: TMenuItem;
    Inicio1: TMenuItem;
    Fin1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    DataSetPost2: TDataSetPost;
    DataSetCancel2: TDataSetCancel;
    DataSetInsert2: TDataSetInsert;
    DataSetDelete2: TDataSetDelete;
    DataSetFirst2: TDataSetFirst;
    DataSetLast2: TDataSetLast;
    DataSetPost3: TDataSetPost;
    DataSetCancel3: TDataSetCancel;
    DataSetInsert3: TDataSetInsert;
    DataSetDelete3: TDataSetDelete;
    DataSetFirst3: TDataSetFirst;
    DataSetLast3: TDataSetLast;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    Label4: TLabel;
    DataSetEdit1: TDataSetEdit;
    DBGrid3: TDBGrid;
    Panel10: TPanel;
    Panel11: TPanel;
    DBGrid2: TDBGrid;
    Memo1: TMemo;
    N3: TMenuItem;
    ImportardeOtrafecha1: TMenuItem;
    Label1: TLabel;
    MaskEdit3: TMaskEdit;
    Label3: TLabel;
    StaticText5: TStaticText;
    TL_Pval: TTable;
    TL_Vale: TTable;
    Table3: TTable;
    DSTL_Pval: TDataSource;
    DSTL_Vale: TDataSource;
    DataSource3: TDataSource;
    TL_PvalSUBCODIGO: TIntegerField;
    TL_PvalCANTIDAD: TIntegerField;
    TL_PvalTOTAL: TFloatField;
    TL_PvalFACTURADO: TStringField;
    TL_PvalCLIENTE: TIntegerField;
    TL_ValeIMPORTE: TFloatField;
    TL_ValeCLIENTE: TIntegerField;
    TL_ValeSUBCODIGO: TIntegerField;
    procedure Salir1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TbPreverClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid3Exit(Sender: TObject);
    procedure DBGrid3ColEnter(Sender: TObject);
    procedure MaskEdit3DblClick(Sender: TObject);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure TL_PvalFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaForma;
    procedure CargaTeclasRapidas;
  end;

var
  FLIQUTIL01: TFLIQUTIL01;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET,ULIBPRINT, ULIBDATABASE, DDMGAS, DDMGASQ, DDMCUP, DDMGENQ, UFormaPreverTxt,
  DDMLIQ, UGENCLIEB, ULIQPVALI, UGASPRODB, UGASTCMBB;

{$R *.DFM}

procedure TFLIQUTIL01.CargaTeclasRapidas;
begin
  with DMGAS do begin
    Memo1.Lines.Clear;
    T_Tcmb.Active:=true;
    T_TCmb.First;
    while not T_Tcmb.Eof do begin
//      if (T_TcmbTipo.AsString=idTipoCmb)and(LimpiaStr(T_TcmbTeclaRapida.AsString)<>'') then
      if (LimpiaStr(T_TcmbTeclaRapida.AsString)<>'') then
        Memo1.Lines.Add(T_TcmbTeclaRapida.AsString+' - '+T_TcmbNombre.AsString);
      T_Tcmb.Next;
    end;
    Memo1.Lines.Add('');
    Memo1.Lines.Add('F2 - Detalle de Productos');
  end;
end;

procedure TFLIQUTIL01.PreparaForma;
begin
  with DMGEN,DMCUP,DMGAS,DMGASQ,DMLIQ do begin
    if not VarLiqModoReclasificar then begin
{      if not VsAccesoRemoto then
        RefrescaQuery(QT_Turca);}
      if QT_Turca.IsEmpty then
        raise Exception.Create('No existe turno abierto');
      if (CajeroActual<>QT_TurcaCajero.AsInteger) then begin
        if LocalizaQuery(QT_Cajr,'Clave',CajeroActual) then
          if QT_CajrNombre.AsString<>VarGasAuxiliarValesDefault then
            raise Exception.Create('Usuario no tiene permiso para Capturar Vales');
      end;
  //
      T_Turc.Active:=true;
      if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',VarArrayOf([QT_TurcaEstacion.AsInteger,QT_TurcaCaja.AsInteger,
                                                                      QT_TurcaFecha.AsDateTime,QT_TurcaTurno.AsInteger])) then
        raise Exception.Create('No puedo localizar turno');
    end;
//  Indice
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Max(Indice) as Entero1 from DGASPVAL');
    Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
    Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
    Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
    Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    T_Turc.Edit;
    T_TurcIndice_Pval.AsInteger:=Q_AuxiEntero1.AsInteger;
    T_Turc.Post;
    T_Turc.Edit;
    AbreTablasLiqT('PVAL;VALE;DVAL');
    CargaTeclasRapidas;
    VarLiqIndiceTurc:=T_TurcIndice_Pval.AsInteger;
  end;
end;

procedure TFLIQUTIL01.Salir1Click(Sender: TObject);
begin
  with DMGAS do begin
    RefrescaDataBase(DBGAS1);
    RefrescaDataBase(DBGAS2);
    Close;
  end;
end;

procedure TFLIQUTIL01.SpeedButton2Click(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    try
      T_Pval.DisableControls;
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Delete from DGASPVAL');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
      Q_Auxi.SQL.Add('  and Total<0.001');
      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;
    finally
      T_Pval.EnableControls;
      RefrescaDataBase(DBGAS1);
      RefrescaDataBase(DBGAS2);
    end;
  end;
end;

procedure TFLIQUTIL01.DBGrid1DblClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if DBGrid1.SelectedField=T_PvalCliente then begin
      if FGENCLIEB.ShowModal=mrOk then begin
        SetEditOrInsert(T_Pval);
        T_PvalCliente.AsInteger:=FGENCLIEB.ClaveClie;
        DBGrid1.SetFocus;
      end;
    end;
  end;
end;

procedure TFLIQUTIL01.DBGrid1Exit(Sender: TObject);
begin
  with DMLIQ do begin
    if T_PvalCliente.AsInteger>0 then
      if T_PvalSubCodigo.IsNull then T_PvalSubCodigo.AsInteger:=0;
    if T_Pval.State=dsInsert then
      if (T_PvalCliente.AsInteger>0)and(T_PvalCantidad.AsInteger>0) then
        T_Pval.Post
      else
    else if T_Pval.State=dsEdit then
      T_Pval.Post;
  end;
end;

procedure TFLIQUTIL01.DBGrid1ColExit(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    if (DBgrid1.SelectedField=T_PvalCliente) then
       DBGrid2.SetFocus;

{      if  VarGasUtilizarReferencia='No' then
        DBGrid2.SetFocus;
    end;
    if VarGasUtilizarReferencia='Si' then begin
      if DBgrid1.SelectedField=T_PvalSubCodigo then
          DBGrid2.SetFocus;
    end;}
  end;
end;

procedure TFLIQUTIL01.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DMLIQ do begin
    if Key=idEnter then begin
      DBgrid1.SetFocus;
      DBGrid1.SelectedIndex:=0;
      T_Pval.Append;
    end;
    if Key=idF2 then begin
      if T_Vale.state=dsInsert then
        T_Vale.Post;
      T_Dval.Insert;
      T_DvalProducto.AsInteger:=4;
      DBGrid3.SelectedIndex:=1;
      DBGrid3.SetFocus;
    end;
  end;
end;

procedure TFLIQUTIL01.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  with DMLIQ do begin
   VarLiqKeyPress:=Key;
   if ClaveCmb(VarLiqKeyPress)>0 then
     T_Vale.Post;
  end;
end;

procedure TFLIQUTIL01.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DMLIQ do begin
    if Key=idEnter then begin
      if T_Dval.state=dsInsert then
        T_Dval.Post;
      DBgrid2.SetFocus;
      T_Vale.Append;
    end;
  end;
end;

procedure TFLIQUTIL01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMLIQ,DMGAS do begin
    if T_Turc.State=dsEdit then begin
      T_TurcIndice_Pval.AsInteger:=VarLiqIndiceTurc;
      T_Turc.Post;
    end;
  end;
end;

procedure TFLIQUTIL01.TbPreverClick(Sender: TObject);
var bm:tbookmark;
begin
  with DMLIQ do begin
    try
      T_Pval.DisableControls;
      bm:=T_Pval.GetBookmark;
      Application.CreateForm(TFLIQPVALI,FLIQPVALI);
      try
        FLIQPVALI.PreparaReporte;
        if sender=TBImprimir then
          FLIQPVALI.QuickRep1.Print
        else
          FLIQPVALI.QuickRep1.Preview;
      finally
        FLIQPVALI.Free;
      end;
    finally
      T_Pval.GotoBookmark(bm);
      T_Pval.FreeBookmark(bm);
      T_Pval.EnableControls;
    end;
  end;
end;

procedure TFLIQUTIL01.FormShow(Sender: TObject);
begin
  with DMLIQ,DMGAS do begin
    if VarLiqModoReclasificar then
      FLIQPVAL.Caption:=FLIQPVAL.Caption+'  [Reclasificación de Vales]';
    if VarGasUtilizarReferencia='Si' then begin
      DBGrid1.Columns[1].Width:= 35;
      DBGrid1.Columns[2].Width:=185;
    end
    else begin
      DBGrid1.Columns[1].Visible:=False;
      DBGrid1.Columns[2].Width:=220;
    end;
  end;
end;

procedure TFLIQUTIL01.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with DMLIQ,DMGAS do begin
    if (VarLiqModoReclasificar) then begin
      if abs(T_TurcTotalVales.AsFloat-VarLiqTotalVales)>0.001 then begin
        CanClose:=False;
        raise Exception.Create('No puede cambiar el Total de Vales: $'+FormatoMoneda(VarLiqTotalVales));
      end;
    end;
  end;
end;

procedure TFLIQUTIL01.DBGrid3DblClick(Sender: TObject);
begin
  with DMLIQ do begin
    if DBGrid3.SelectedField=T_DvalProducto then begin
      if FGASTCMBB.ShowModal=mrOk then begin
        SetEditorInsert(T_Dval);
        T_DvalProducto.asinteger:=FGASTCMBB.ClaveComb;
      end;
    end;
    if DBGrid3.SelectedField=T_DvalSubClave then begin
      if FGASPRODB.ShowModal=mrOk then begin
        SetEditorInsert(T_Dval);
        T_DvalSubClave.AsInteger:=FGASPRODB.ClaveProd;
      end;
    end;
  end;
end;

procedure TFLIQUTIL01.DBGrid3Exit(Sender: TObject);
begin
  with DMLIQ do begin
    if T_Dval.State=dsEdit then
      T_Dval.Post;
  end;
end;

procedure TFLIQUTIL01.DBGrid3ColEnter(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    if (DBGrid3.SelectedIndex=1)and(T_DvalTipo.AsString=idTipoCmb) then
      DBGrid3.SelectedIndex:=4;
  end;
end;

procedure TFLIQUTIL01.MaskEdit3DblClick(Sender: TObject);
begin
  if FGENCLIEB.ShowModal=mrOK then with DMGEN do begin
    MaskEdit3.Text:=InttoClaveCata(FGENCLIEB.ClaveClie,idClie);
    MaskEdit3Exit(Sender);
  end;
end;

procedure TFLIQUTIL01.MaskEdit3Enter(Sender: TObject);
begin
  MaskEdit3.Text:='';
end;

procedure TFLIQUTIL01.MaskEdit3Exit(Sender: TObject);
begin
  with DMGENQ,DMGEN_VTAS do begin
    if MaskEdit3.Text='' then
      exit;
    try
      if not BuscaQuery(QB_Clie,'pNoClie',StrtoInt(MaskEdit3.text)) then
        raise Exception.Create('No existe Cliente');
      MaskEdit3.Text:=LlenaStr(MaskEdit3.Text,'D',6,'0');
      StaticText5.Caption:=QB_ClieNombre.AsString;
    except
      MaskEdit3.SetFocus;
      raise;
    end;
  end; 
end;

procedure TFLIQUTIL01.TL_PvalFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=(TL_PvalFacturado.AsString='No')and(TL_PvalCliente.AsInteger=StrToInt(MaskEdit3.Text));
end;

end.
