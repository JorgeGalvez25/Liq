unit ULIQSALI;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,
  Mask,db,dbtables, ImgList, DBActns, ActnList;

type
  TFLIQSALI = class(TForm)
    Panel3: TPanel;
    MainMenu1: TMainMenu;
    Editar1: TMenuItem;
    Cancelar1: TMenuItem;
    Guardar1: TMenuItem;
    Panel1: TPanel;
    BbGuardar: TBitBtn;
    BbCancelar: TBitBtn;
    BbSalir: TBitBtn;
    GroupBox1: TGroupBox;
    Detalle1: TMenuItem;
    InsertaRengln1: TMenuItem;
    BorraRenglon: TMenuItem;
    PopupMenu1: TPopupMenu;
    InsertarRengln1: TMenuItem;
    BorrarRengln1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    CancelarCambios1: TMenuItem;
    CancelaCambios1: TMenuItem;
    N1: TMenuItem;
    Salir2: TMenuItem;
    N3: TMenuItem;
    Inicio1: TMenuItem;
    Fin1: TMenuItem;
    DBNavigator1: TDBNavigator;
    N2: TMenuItem;
    Inicio2: TMenuItem;
    Fin2: TMenuItem;
    Label4: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    BbCalcular: TBitBtn;
    procedure Salir1Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBEdit2DblClick(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit5DblClick(Sender: TObject);
    procedure DBEdit4DblClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure BbCancelarClick(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit8DblClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure BbCalcularClick(Sender: TObject);
  private
    { Private declarations }
    TipoDef    : string[2];
    swgrid     : boolean;
  public
    { Public declarations }
    swGraboSalidaAjuste:boolean;
    Procedure PreparaForma(xtipo:string);
    Procedure SetAltaDocu;
    Procedure SetModificaDocu;
    Procedure EliminaCaptura;
  end;

var
  FLIQSALI :TFLIQSALI;

implementation

uses DDMGEN, DDMINV, ULIBGRAL, UGEN_NET, ULIBDATABASE, USelecTexto, DDMGENQ, UAVANCE,  DDMGENP,
  DDMGEN_VTAS, UGENPRODB, UGENPROVB, DDMGENT, UGENCCOSB, UINVIFIS,
  UINVSALIF;


{$R *.DFM}

Procedure TFLIQSALI.EliminaCaptura;
begin
  with DMGEN,DMINV,DMGEN_VTAS do begin
    if T_Sali.State=dsInsert then begin
      T_Sali.cancel;
      CancelaUpdates(DBVentas2,T_Sali);
    end
    else if T_Sali.State=dsEdit then begin
      if T_Movs.State in [dsInsert,dsEdit] then
        T_Movs.cancel;
      T_Sali.cancel;
      CancelaUpdates(DBVentas2,T_Sali);
      IniciaUpdates(DBVentas2,T_Sali);
      T_Sali.delete;
      AplicaUpdates(DBVentas2,T_Sali);
      T_Sali.Refresh;
    end;
    CancelaDocAccion;
  end;
end;

procedure TFLIQSALI.PreparaForma(xtipo:string);
begin
  with DMINV,DMGEN do begin
    try
      QT_Docu.Close;
      QT_Docu.ParamByName('tipodoc').AsString:=idSali;
      QT_Docu.Prepare;
      QT_Docu.Open;
      SetDocumentoDflt('*');
      if xtipo<>'' then
        TipoDef:=xtipo
      else
      TipoDef:=QT_DocuClaveDoc.AsString;
      DBLookUpCombobox2.KeyValue:=FINVIFIS.QL_IfisAlmacen.AsInteger;
      SetAltaDocu;
    except
      EliminaCaptura;
      raise;
    end;
  end;
end;

Procedure TFLIQSALI.SetAltaDocu;
begin
  with DMGEN,DMINV,DMGEN_VTAS do begin
    if T_Sali.State<>dsBrowse then
      raise Exception.Create('Error en Captura: SetAltaDocu');
    SwCalcFields:=false;
    try
      try
        IniciaUpdates(DBVentas2,T_Sali);
        T_Sali.Insert;
        T_SaliFecha.AsDateTime:=FINVIFIS.QL_IfisFecha.AsDateTime;
        DBEdit3.ReadOnly:=True;
        T_SaliDocumOrigen.AsString:=idIfis;
        T_SaliAlmacen.AsInteger:=FINVIFIS.QL_IfisAlmacen.AsInteger;
        T_SaliSucursal.AsInteger:=FINVIFIS.QL_IfisSucursal.AsInteger;
        T_SaliConcepto1.AsString:=Copy(FINVIFIS.QL_Ifisobservaciones.AsString,1,40);
        T_SaliConcepto2.AsString:=Copy(FINVIFIS.QL_Ifisobservaciones.AsString,41,20);
        T_SaliEntrego.AsString:=FINVIFIS.QL_IfisRealizo.AsString;
        T_SaliRecibio.AsString:=FINVIFIS.QL_IfisCapturo.AsString;
        T_SaliTipoSal.AsString:=TipoDef;
        DBLookUpComboBox2.KeyValue:=AlmacenActivo;
        DBLookUpComboBox2.ReadOnly:=True;
        DBLookUpComboBox1.KeyValue:=TipoDef;
        BbGuardar.Enabled:=false;
        BbCancelar.Enabled:=false;
        Guardar1.Enabled:=false;
        Cancelar1.Enabled:=false;
        DBGrid1.DataSource:=nil;
        swgrid:=false;
        DBEdit2.ReadOnly:=false;
        DBLookUpComboBox1.ReadOnly:=false;
      except
        ErrorMsg:='Salida '+T_SaliClaveStr.AsString+' ya existe';
        raise;
      end;
    finally
      SwCalcFields:=true;
    end;
  end;
end;

procedure TFLIQSALI.SetModificaDocu;
begin
  with DMINV,DMGEN,DMGEN_VTAS do begin
    if T_Sali.State=dsEdit then
      exit;
    if T_Sali.State<>dsInsert then begin
      if T_Sali.State<>dsEdit then
        raise Exception.Create('Error en Captura: SetModificaDocu')
      else exit;
    end;
    T_Movs.DisableControls;
    try
      try
        VgFecha:=T_SaliFecha.AsDateTime;
        if Not T_Turd.Locate('Sucursal;Fecha;TipoDoc',VarArrayOf([T_SaliSucursal.AsInteger,T_SaliFecha.AsDateTime,T_SaliDocumOrigen.AsString]),[]) then begin
          T_Turd.Insert;
          T_TurdSucursal.AsInteger:=T_SaliSucursal.AsInteger;
          T_TurdFecha.AsDateTime:=T_SaliFecha.AsDateTime;
          T_TurdTipodoc.AsString:=idIfis; (*  T_SaliDocumOrigen.AsString; *)
          T_TurdEstatus.AsString:='A';
          T_TurdContabilizado.AsString:='No';
          T_TurdTipoPoliza.AsString:='';
          T_TurdNoPoliza.AsString:='';
          T_TurdOperaciones.AsInteger:=0;
          T_TurdImporteMN.AsFloat:=0;
          T_Turd.Post;
        end;
        T_Sali.Post;
        AplicaUpdates(DBVentas2,T_Sali);
        ActualizaDocAccion(T_SaliClaveStr.AsString);
        T_Sali.Refresh;
        IniciaUpdates(DBVentas2,T_Sali);
        T_Sali.Edit;
        BbGuardar.Enabled:=true;
        BbCancelar.Enabled:=true;
        Guardar1.Enabled:=true;
        Cancelar1.Enabled:=true;
        DBGrid1.DataSource:=DS_Movs;
        DBEdit2.ReadOnly:=True;
        DBEdit3.ReadOnly:=true
      except
        ErrorMsg:='Salida '+T_SaliTipoSal.AsString+'-'+IntToClaveNum(T_SaliFolio.AsInteger,6);
        raise;
      end;
    finally
      T_Movs.EnableControls;
    end;
  end;
end;

procedure TFLIQSALI.Salir1Click(Sender: TObject);
begin
  FINVIFISAS.Close;
  swGraboSalidaAjuste:=False;
end;

procedure TFLIQSALI.Guardar1Click(Sender: TObject);
begin
  with DMINV,DMGEN,DMGEN_VTAS do begin
    Screen.Cursor:=crHourGlass;
    try
      try
        if T_Movs.State in [dsInsert,dsEdit] then
          T_Movs.Cancel;
        T_SaliEstatus.AsString:='A';
        T_Sali.Post;
        AplicaUpdates(DBVentas2,T_Sali);
        if T_SaliFecha.AsDateTime=FechaCosteo then begin
          T_Sali.Refresh;
          IniciaUpdates(DBVentas2,T_Sali);
          T_Sali.Edit;
          T_SaliCosteado.AsString:='Si';
          T_Sali.Post;
          AplicaUpdates(DBVentas2,T_Sali);
        end;
        FinalizaDocAccion;
        FINVSALIF.PreparaForma('I',IntToStr(0),true);
        FINVSALIF.ImprimeForma;
      except
        CancelaUpdates(DBVentas2,T_Sali);
        CancelaDocAccion;
        raise;
      end;
    finally
      Screen.Cursor:=crDefault;
      FINVIFISAS.Close;
      swGraboSalidaAjuste:=True;
    end;
  end;
end;

procedure TFLIQSALI.FormShow(Sender: TObject);
begin
  with DMGEN,DMINV,DMGENT do begin
    QT_Ccos.Close;
    QT_Ccos.Prepare;
    QT_Ccos.Open;
    DBLookUpComboBox1.SetFocus;
    Caption:='Salida Nueva por Ajuste [Sucursal: '+DMGEN_VTAS.Q_SuclDescNombre.AsString+']';
  end;
end;

procedure TFLIQSALI.DBGrid1Enter(Sender: TObject);
begin
  DBEdit6.SetFocus;
end;

procedure TFLIQSALI.GroupBox1Enter(Sender: TObject);
begin
  with DMINV,DMGEN do begin
    if T_Sali.state=dsedit then
      DBEdit6.setfocus
    else if (T_Sali.state<>dsinsert) then begin
      try
        IniciaDocAccion(idDocu,'',AccNuevo);
        SetAltaDocu;
      except
        FINVIFISAS.Close;
      end;
    end;
  end;
end;

procedure TFLIQSALI.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with DMINV,DMGEN,DMGENT,DMGEN_VTAS do begin
    if (T_Sali.state=dsEdit)and(not T_Movs.IsEmpty) then begin
      if MensajeConf('Salir sin Guardar '+idDocuName+' ?')=mrNo then
        CanClose:=false;
    end;
    if CanClose then begin
      try
        EliminaCaptura;
      except
      end;
    end;
  end;
end;

procedure TFLIQSALI.DBLookupComboBox1Enter(Sender: TObject);
begin
  with DMGEN do
    if not DBLookupComboBox1.ReadOnly then
      DBLookupComboBox1.KeyValue:=QT_DocuClaveDoc.asstring
    else DBEdit8.SetFocus;
end;

procedure TFLIQSALI.DBEdit2DblClick(Sender: TObject);
begin
  with DMGEN,DMINV do begin
    if not DBEdit2.ReadOnly then
      T_SaliFolio.AsInteger:=Consecutivo(T_Sali,'Folio','Sucursal;TipoSal',VarArrayOf([T_SaliSucursal.AsInteger,T_SaliTipoSal.AsString]))
    else
      DBEdit8.SetFocus;
  end;
end;

procedure TFLIQSALI.DBEdit2Enter(Sender: TObject);
begin
  if DBEdit2.ReadOnly then
    DBEdit8.SetFocus;
end;

procedure TFLIQSALI.DBEdit5Exit(Sender: TObject);
begin
  AgregaListaStrTemp(DBEdit5.Text);
end;

procedure TFLIQSALI.DBEdit5DblClick(Sender: TObject);
begin
  DBEdit5.Text:=SeleccionaStrTemp(DBEdit5.text);
end;

procedure TFLIQSALI.DBEdit4DblClick(Sender: TObject);
begin
  DBEdit4.Text:=SeleccionaStrTemp(DBEdit4.text);
end;

procedure TFLIQSALI.DBEdit4Exit(Sender: TObject);
begin
  AgregaListaStrTemp(DBEdit4.Text);
end;

procedure TFLIQSALI.DBEdit3Enter(Sender: TObject);
begin
  DBLookUpComboBox1.SetFocus;
end;

procedure TFLIQSALI.BbCancelarClick(Sender: TObject);
begin
  with DMINV,DMGEN,DMGEN_VTAS do begin
    if MensajeConf('Abandonar '+idDocuName+' ?')=mrYes then begin
      try
        EliminaCaptura;
        Close;
        swGraboSalidaAjuste:=False;
      finally
      end;
    end;
  end;
end;

procedure TFLIQSALI.GroupBox1Exit(Sender: TObject);
begin
  with DMGEN do begin
    try
      SetModificaDocu;
      DBEdit8.SetFocus;
    except
      EliminaCaptura;
      DBEdit2.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQSALI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN do
    QT_Ccos.Close;
end;

procedure TFLIQSALI.DBEdit8DblClick(Sender: TObject);
begin
  with DMGEN,DMINV do begin
    if FGENCCOSB.ShowModal=mrOk then begin
      DBEdit8.Text:=IntToClaveNum(FGENCCOSB.CveCentroCosto,3);
    end;
  end;
end;

procedure TFLIQSALI.DBEdit1Exit(Sender: TObject);
begin
  DBEdit6.SetFocus;
end;

procedure TFLIQSALI.Edit1Enter(Sender: TObject);
begin
  DBEdit1.SetFocus;
end;

procedure TFLIQSALI.DBEdit9Enter(Sender: TObject);
begin
  DBEdit1.SetFocus;
end;

procedure TFLIQSALI.BbCalcularClick(Sender: TObject);
var xcont      : integer;
    diferencia : double;
    xsaldo     : TSaldoInv;
begin
  with DMINV do begin
    try
      xcont:=0;
      T_Difs.First;
      FAvance.PreparaAvance('Preparando reporte...',true,T_Difs.RecordCount);
      while not T_Difs.eof do begin
        SaldoInvProd('A',0,T_IfisAlmacen.AsInteger,T_DifsProducto.AsString,T_IfisFecha.AsDateTime,T_IfisFecha.AsDateTime,xsaldo);
        if xsaldo.SaldoFinUni>T_DifsCantidad.AsFloat then begin
          diferencia:=xsaldo.SaldoFinUni-T_DifsCantidad.AsFloat;
          inc(xcont);
          T_Movs.Insert;
          T_MovsSucursal.AsInteger:=T_SaliSucursal.AsInteger;
          T_MovsTipoMov.AsString:=T_SaliTipoSal.AsString;
          T_MovsFolio.AsInteger:=T_SaliFolio.AsInteger;
          T_MovsIndice.AsInteger:=xcont;
          T_MovsAlmacen.AsInteger:=T_SaliAlmacen.AsInteger;
          T_MovsFecha.AsDateTime:=T_SaliFecha.AsDateTime;
          T_MovsMes.AsString:=FechaToMes(T_MovsFecha.AsDateTime);
          T_MovsProducto.AsString:=T_DifsProducto.AsString;
          T_MovsCantidad.AsFloat:=Diferencia;
          T_MovsAplicado.AsString:='No';
          T_MovsCosteado.AsString:='No';
          T_Movs.Post;
        end;
        T_Difs.Next;
        FAvance.AvanzaPosicion;
      end;
    finally
      FAvance.Close;
    end;
  end;
  BbGuardar.SetFocus;
end;

end.
