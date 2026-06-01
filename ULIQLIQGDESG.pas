unit ULIQLIQGDESG;

interface

uses Variants, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,db,
  Mask, DBTables, ToolWin, ImgList, DBActns, ActnList;

type
  TFLIQLIQGDESG = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    ActionList1: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetCancel1: TDataSetCancel;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetPost1: TDataSetPost;
    QL_Liqg: TQuery;
    DSL_Liqg: TDataSource;
    QL_LiqgISLA: TIntegerField;
    QL_LiqgFOLIO: TIntegerField;
    QL_LiqgFECHA: TDateTimeField;
    QL_LiqgDESPACHADOR: TIntegerField;
    QL_Desp: TQuery;
    QL_DespCLAVE: TIntegerField;
    QL_DespNOMBRE: TStringField;
    QL_LiqgNombreDespachador: TStringField;
    QL_LiqgFechaPaq: TStringField;
    QL_LiqgTOTPAGO: TFloatField;
    QL_LiqgESTACION: TIntegerField;
    DSL_Dliqp: TDataSource;
    TL_Dtpag: TTable;
    DSL_Dtpag: TDataSource;
    TL_DtpagESTACION: TIntegerField;
    TL_DtpagFOLIO: TIntegerField;
    TL_DtpagCLAVE_PAGO: TStringField;
    TL_DtpagINDICE: TIntegerField;
    TL_DtpagCLIENTE: TIntegerField;
    TL_DtpagNOMBRE: TStringField;
    TL_DtpagREFERENCIA: TStringField;
    TL_DtpagIMPORTE: TFloatField;
    QL_LiqgTOTGAS: TFloatField;
    QL_LiqgTOTALMA: TFloatField;
    QL_LiqgTOTGRAL: TFloatField;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Insertar1: TMenuItem;
    Eliminar1: TMenuItem;
    Modificar1: TMenuItem;
    N1: TMenuItem;
    Guardar1: TMenuItem;
    Cancelar1: TMenuItem;
    QL_LiqgCAJA: TIntegerField;
    QL_LiqgTURNO: TIntegerField;
    QL_LiqgAPLICADO: TStringField;
    QL_LiqgCAMBIA_SALDOINI: TStringField;
    TL_Dliqp: TTable;
    TL_DliqpESTACION: TIntegerField;
    TL_DliqpFOLIO: TIntegerField;
    TL_DliqpCLAVE_PAGO: TStringField;
    TL_DliqpFECHA: TDateTimeField;
    TL_DliqpTURNO: TIntegerField;
    TL_DliqpIMPORTE: TFloatField;
    TL_DliqpAPLICADO: TStringField;
    TL_DliqpINDICE: TIntegerField;
    TL_DliqpDesglosa: TStringField;
    Label3: TLabel;
    DBText1: TDBText;
    TL_DliqpDescripcionPago: TStringField;
    Label4: TLabel;
    Sp1: TSpeedButton;
    MaskEdit3: TMaskEdit;
    StaticText2: TStaticText;
    SpeedButton1: TSpeedButton;
    BbPrever: TBitBtn;
    BbImprimir: TBitBtn;
    Label5: TLabel;
    TL_DliqpImporteDesp: TFloatField;
    procedure Salir1Click(Sender: TObject);
    procedure QL_LiqgCalcFields(DataSet: TDataSet);
    procedure TL_DtpagAfterInsert(DataSet: TDataSet);
    procedure TL_DliqpBeforePost(DataSet: TDataSet);
    procedure TL_DtpagCLIENTEChange(Sender: TField);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure TL_DtpagBeforeInsert(DataSet: TDataSet);
    procedure DBGrid3Exit(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure TL_DtpagAfterPost(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BbPreverClick(Sender: TObject);
    procedure TL_DliqpCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Totaliza;
  public
    { Public declarations }
    procedure RefrescaTabla;
    procedure PreparaForma;
  end;

var
  FLIQLIQGDESG: TFLIQLIQGDESG;
  xtotal:real;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET,ULIBPRINT, ULIBDATABASE, DDMGAS, DDMGASQ, DDMCUP, DDMGENQ, UFormaPreverTxt,
  DDMLIQ, DDMGEN_VTAS, UGENCLIEB, ULIQLIQIDesglo;

{$R *.DFM}


procedure TFLIQLIQGDESG.Totaliza;
var bm:TBookMark;
begin
  try
    TL_Dtpag.DisableControls;
    bm:=TL_Dtpag.GetBookmark;
    TL_Dtpag.First;
    xTotal:=0;
    while not TL_Dtpag.Eof do begin
      xTotal:=xTotal+TL_DtpagImporte.AsFloat;
      TL_Dtpag.Next;
    end;
  finally
    StaticText2.Caption:=FormatoMoneda(xTotal);
    TL_Dtpag.GotoBookmark(bm);
    TL_Dtpag.FreeBookmark(bm);
    TL_Dtpag.EnableControls;
  end;
end;

procedure TFLIQLIQGDESG.RefrescaTabla;
begin
  with DMGEN,DMGASQ,DMGAS,DMLIQ do begin
    QL_Desp.Close;
    QL_Desp.ParamByName('pestacion').asinteger:=EstacionActual;
    QL_Desp.Prepare;
    QL_Desp.Open;
    QL_Liqg.close;
    QL_Liqg.ParamByName('pEstacion').asinteger:=EstacionActual;
    QL_Liqg.ParamByName('pCaja').asinteger:=CajaActual;
    QL_Liqg.ParamByName('pFecha').AsDateTime:=VgFechaIni;
    QL_Liqg.Open;
    TL_Dliqp.Active:=true;
    TL_Dtpag.Active:=true;
  end;
end;

procedure TFLIQLIQGDESG.PreparaForma;
begin
  with DMGAS,DMGASQ do begin
    T_Tpag.Active:=true;
    T_Ests.Active:=true;
  end;
end;

procedure TFLIQLIQGDESG.Salir1Click(Sender: TObject);
begin
  with DMGAS do begin
    RefrescaDataBase(DBGAS1);
    RefrescaDataBase(DBGAS2);
    Close;
  end;
end;

procedure TFLIQLIQGDESG.QL_LiqgCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_LiqgFechaPaq.AsString:=FechaPaq(QL_LiqgFecha.AsDateTime);
  end;
end;

procedure TFLIQLIQGDESG.TL_DtpagAfterInsert(DataSet: TDataSet);
var i:integer;
begin
  if (TL_DtpagIndice.AsInteger<1) then begin
    i:=TL_DliqpIndice.AsInteger;
    inc(i);
    SetEditorInsert(TL_Dliqp);
    TL_DtpagIndice.AsInteger:=i;
    TL_DliqpIndice.AsInteger:=i;
  end;
end;

procedure TFLIQLIQGDESG.TL_DliqpBeforePost(DataSet: TDataSet);
begin
  if (TL_DliqpIndice.AsInteger<1)and(TL_DliqpDesglosa.AsString='Si') then begin
    SetEditOrInsert(TL_Dliqp);
    TL_DliqpIndice.AsInteger:=1;
  end;
end;

procedure TFLIQLIQGDESG.TL_DtpagCLIENTEChange(Sender: TField);
begin
  with DMGEN_VTAS do begin
    if TL_DtpagNombre.AsString='' then begin
      QB_Clie.Close;
      QB_Clie.ParamByName('pNoClie').AsInteger:=TL_DtpagCliente.AsInteger;
      QB_Clie.Prepare;
      QB_Clie.Open;
      if not QB_Clie.IsEmpty then
        TL_DtpagNombre.AsString:=QB_ClieNombre.AsString;
    end;
  end;
end;

procedure TFLIQLIQGDESG.DBGrid3DblClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if FGENCLIEB.ShowModal=mrOk then begin
      SetEditOrInsert(TL_Dtpag);
      TL_DtpagCliente.AsInteger:=FGENCLIEB.ClaveClie;
      TL_DtpagNombre.AsString:=FGENCLIEB.NombreClie;
      DBGrid3.SelectedIndex:=2;
    end;
  end;
end;

procedure TFLIQLIQGDESG.DBGrid1Enter(Sender: TObject);
begin
  if Sender = DBGrid1 then
    DBNavigator1.DataSource:=DSL_Liqg;
  if Sender = DBGrid2 then
    DBNavigator1.DataSource:=DSL_Dliqp;
  if Sender = DBGrid3 then begin
    if TL_DliqpDesglosa.AsString='No' then begin
      MensajeErr('No puede desglosar este Tipo de Pago');
      DBGrid2.SetFocus;
    end
    else begin
      DBNavigator1.DataSource:=DSL_Dtpag;
      Totaliza;
    end;
  end;
end;

procedure TFLIQLIQGDESG.FormShow(Sender: TObject);
begin
  MaskEdit3.EditMask:=MaskFecha2;
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  if not DMGAS.SwMochila then begin
    DBGrid1.Columns[4].Visible:=false;
    DBGrid1.Columns[5].Visible:=false;
    DBGrid1.Columns[6].Visible:=false;
  end;
end;

procedure TFLIQLIQGDESG.Sp1Click(Sender: TObject);
begin
   VgFechaIni:=StrToDate(MaskEdit3.text);
   RefrescaTabla;
end;

procedure TFLIQLIQGDESG.Panel1Enter(Sender: TObject);
begin
  QL_Liqg.Close;
  TL_Dliqp.Close;
  TL_Dtpag.Close;
end;

procedure TFLIQLIQGDESG.TL_DtpagBeforeInsert(DataSet: TDataSet);
begin
  SetEditorInsert(TL_Dliqp);
end;

procedure TFLIQLIQGDESG.DBGrid3Exit(Sender: TObject);
begin
  if TL_DliqpDesglosa.AsString='Si' then begin
    if (TL_Dtpag.State=dsInsert)and(TL_DtpagImporte.Asfloat<0.001) then
      TL_Dtpag.Cancel;
    if TL_Dtpag.State in [dsEdit,dsInsert] then
      TL_Dtpag.Post;
    Totaliza;
    if abs(TL_DliqpImporte.AsFloat-xTotal)>0.001 then begin
      MensajeInfo('Total desglosado no es igual al Importe del Pago');
    end;
    StaticText2.Caption:='';
  end;
end;

procedure TFLIQLIQGDESG.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF2 then begin
    if DBGrid3.SelectedField=TL_DtpagImporte then begin
      SetEditOrInsert(TL_Dtpag);
      TL_DtpagImporte.AsFloat:=0;
      TL_Dtpag.Post;
      Totaliza;
      TL_Dtpag.Edit;
      TL_DtpagImporte.AsFloat:=TL_DliqpImporte.AsFloat-xTotal;
      Totaliza;
    end;
  end;
  if key=idEnter then begin
    DBGrid2.SetFocus;
    if TL_Dliqp.State in [dsEdit] then
      TL_Dliqp.Post;
  end;
end;

procedure TFLIQLIQGDESG.MaskEdit3Exit(Sender: TObject);
begin
  Sp1Click(Sender);
end;

procedure TFLIQLIQGDESG.TL_DtpagAfterPost(DataSet: TDataSet);
begin
  if (TL_DtpagImporte.IsNull)or(TL_DtpagImporte.AsFloat<0.001) then
    TL_Dtpag.Delete;
  Totaliza;
end;

procedure TFLIQLIQGDESG.SpeedButton1Click(Sender: TObject);
begin
  Totaliza;
end;

procedure TFLIQLIQGDESG.BbPreverClick(Sender: TObject);
var bm:TbookMark;
begin
  with DMLIQ do begin
    T_Liqg.Active:=true;
    T_Dliqp.Active:=true;
    T_Dtpag.Active:=true;
    if not LocalizaTabla(T_Liqg,'Estacion;Folio',
                          VarArrayOf([QL_LiqgEstacion.AsInteger,QL_LiqgFolio.AsInteger])) then
      raise Exception.Create('No encuentro liquidación '+QL_LiqgFolio.AsString);
    try
      QL_Liqg.DisableControls;
      bm:=QL_Liqg.GetBookmark;
      Application.CreateForm(TFLIQLIQGIDesglo,FLIQLIQGIDesglo);
      try
        FLIQLIQGIDesglo.PreparaReporte;
        if (Sender=BbImprimir) then
          FLIQLIQGIDesglo.QuickRep1.Print
        else
          FLIQLIQGIDesglo.QuickRep1.Preview;
      finally
        FLIQLIQGIDesglo.Free;
      end;
    finally
      QL_Liqg.GotoBookmark(bm);
      QL_Liqg.FreeBookmark(bm);
      QL_Liqg.EnableControls;
    end;
  end;
end;

procedure TFLIQLIQGDESG.TL_DliqpCalcFields(DataSet: TDataSet);
begin
  if (TL_DliqpDesglosa.asstring='Si')or(DMGAS.SwMochila) then
    TL_DliqpImporteDesp.AsFloat:=TL_DliqpImporte.AsFloat;
end;

end.
