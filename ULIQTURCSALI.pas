unit ULIQTURCSALI;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,
  Mask,db,dbtables, ImgList, DBActns, ActnList;

type
  TFLIQTURCSALI = class(TForm)
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
    Panel5: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    BbCalcular: TBitBtn;
    QL_Tcmb: TQuery;
    QL_TcmbCLAVE: TIntegerField;
    QL_TcmbNOMBRE: TStringField;
    QL_TcmbTIPO: TStringField;
    QL_TcmbABREVIA: TStringField;
    QL_TcmbUNIDAD: TStringField;
    QL_TcmbTECLARAPIDA: TStringField;
    QL_TcmbCUENTACNT: TStringField;
    QL_TcmbCUENTACNTIVA: TStringField;
    QL_TcmbCODIGO: TStringField;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit8: TDBEdit;
    DBText1: TDBText;
    QL_Prod: TQuery;
    QL_ProdCLAVE: TIntegerField;
    QL_ProdDESCRIPCION: TStringField;
    QL_ProdUNIDAD: TStringField;
    QL_ProdPRECIO: TFloatField;
    QL_ProdCLAVEIVA: TIntegerField;
    QL_ProdPRECIO_CIVA: TFloatField;
    QL_ProdCODIGO: TStringField;
    ChbCmb: TCheckBox;
    ChbProd: TCheckBox;
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
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    TipoDef    : string[2];
    swgrid     : boolean;
    ModoProc   :integer;
  public
    { Public declarations }
    Procedure PreparaForma(xtipo:string;xmodo:integer);
    Procedure SetAltaDocu;
    Procedure SetModificaDocu;
    Procedure EliminaCaptura;
  end;

var
  FLIQTURCSALI :TFLIQTURCSALI;

implementation

uses DDMGEN, DDMINV, ULIBGRAL, UGEN_NET, ULIBDATABASE, USelecTexto,UAVANCE,
     DDMGENT,ULIQTURC, DDMGAS, DDMGEN_VTAS, UINVSALIF, UGENCCOSB;


{$R *.DFM}

Procedure TFLIQTURCSALI.EliminaCaptura;
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
    if TT_AuxiS.Exists then
      EliminaTemp(TT_AuxiS);
    CancelaDocAccion;
  end;
end;

procedure TFLIQTURCSALI.PreparaForma(xtipo:string;xmodo:integer);
begin
  with DMINV,DMGEN,DMGAS,DMGEN_VTAS,FLIQTURC do begin
    ModoProc:=xmodo;
    try
      T_Sali.Active:=true;
      T_Movs.Active:=true;
      T_Turd.Active:=true;
      T_Ests.Active:=true;
      AbreQuery(DMGEN_VTAS.Q_Sucl);
      AbreQuery(DMGEN_VTAS.Q_Alma);
      CreaListaAlmacenes;
      AbreListaAlmacenes;
      SetDocumentoDflt('*');
      if xtipo<>'' then
        TipoDef:=xtipo
      else
        TipoDef:=QT_DocuClaveDoc.AsString;
      DBLookUpComboBox1.KeyValue:=TipoDef;
      if T_Ests.Locate('Clave',QL_TurcEstacion.AsInteger,[]) then
        DBLookUpCombobox2.KeyValue:=T_EstsAlmacen.AsInteger
      else
        DBLookUpCombobox2.KeyValue:=1;
      if DMGAS.VarLiqGenerarSalidaAlmacenIslas='Si' then begin
        ChbCmb.Checked:=True;
        ChbProd.Checked:=False;
        ChbCmb.Enabled:=False;
        ChbProd.Enabled:=False;
      end;
      SetAltaDocu;
    except
      EliminaCaptura;
      raise;
    end;
  end;
end;

Procedure TFLIQTURCSALI.SetAltaDocu;
begin
  with DMGEN,DMINV,DMGEN_VTAS,DMGAS,FLIQTURC do begin
    if T_Sali.State<>dsBrowse then
      raise Exception.Create('Error en Captura: SetAltaDocu');
    SwCalcFields:=false;
    try
      try
        IniciaUpdates(DBVentas2,T_Sali);
        T_Sali.Insert;
        CreaTablaTemporalSaldos;        
        T_SaliFecha.AsDateTime:=QL_TurcFecha.AsDateTime;
        DBEdit3.ReadOnly:=True;
        T_SaliDocumOrigen.AsString:=idTurc;
        T_SaliAlmacen.AsInteger:=T_EstsAlmacen.AsInteger;
        DBLookUpComboBox2.KeyValue:=T_SaliAlmacen.AsInteger;
        T_SaliSucursal.AsInteger:=T_EstsSucursal.AsInteger;
        T_SaliCentroCosto.AsString:='';
        T_SaliRequisicion.AsString:='';
        T_SaliConcepto1.AsString:='VENTA DE COMBUSTIBLE DEL DIA ';
        T_SaliConcepto2.AsString:=FechaAlf(QL_TurcFecha.AsDateTime);
        T_SaliEntrego.AsString:=QL_TurcNombreCajero.AsString;
        T_SaliRecibio.AsString:=QL_TurcNombreCajero.AsString;
        T_SaliTipoSal.AsString:=TipoDef;
        BbGuardar.Enabled:=false;
        BbCancelar.Enabled:=false;
        Guardar1.Enabled:=false;
        Cancelar1.Enabled:=false;
        FLIQTURCSALI.DBGrid1.DataSource:=nil;
        swgrid:=false;
        DBEdit2.ReadOnly:=false;
      except
        ErrorMsg:='Salida '+T_SaliClaveStr.AsString+' ya existe';
        raise;
      end;
    finally
      SwCalcFields:=true;
    end;
  end;
end;

procedure TFLIQTURCSALI.SetModificaDocu;
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
        T_Sali.Post;
        AplicaUpdates(DBVentas2,T_Sali);
        ActualizaDocAccion(T_SaliClaveStr.AsString);
        T_Sali.Refresh;
        IniciaUpdates(DBVentas2,T_Sali);
        T_Sali.Edit;
        BbCancelar.Enabled:=true;
        Cancelar1.Enabled:=true;
        if T_Movs.RecordCount>0 then begin
          Guardar1.Enabled:=true;
          BbGuardar.Enabled:=true;
        end;
        FLIQTURCSALI.DBGrid1.DataSource:=DS_Movs;
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

procedure TFLIQTURCSALI.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQTURCSALI.Guardar1Click(Sender: TObject);
begin
  with DMINV,DMGEN,DMGAS,DMGEN_VTAS do begin
    Screen.Cursor:=crHourGlass;
    try
      try
        if T_Movs.State in [dsInsert,dsEdit] then
          T_Movs.Cancel;
        T_SaliEstatus.AsString:='A';
        if T_SaliCentroCosto.AsString='' then
          T_SaliCentroCosto.AsInteger:=0;
        T_Sali.Post;
        AplicaUpdates(DBVentas2,T_Sali);
        if T_SaliFecha.AsDateTime=FechaCosteo then begin
          try
            T_Sali.Refresh;
            IniciaUpdates(DBVentas2,T_Sali);
            T_Sali.Edit;
            T_SaliCosteado.AsString:='Si';
            T_Sali.Post;
            AplicaUpdates(DBVentas2,T_Sali);
            T_Sali.Refresh;
          except
            CancelaUpdates(DBVentas2,T_Sali);
            raise;
          end;
       end;
        with DMGAS do begin
          T_Turc.Active:=true;
          T_Turc.Edit;
          T_TurcSalida_Almacen.AsString:=IntToClaveNum(T_SaliSucursal.AsInteger,2)+T_SaliTipoSal.AsString+IntToClaveNum(T_SaliFolio.AsInteger,6);
          T_Turc.Post;
          T_Turc.Refresh;
          RefrescaDataBase(DMGAS.DBGAS1);
          RefrescaDataBase(DMGAS.DBGAS2);
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
      if TT_AuxiS.Exists then
        EliminaTemp(TT_AuxiS);
      Screen.Cursor:=crDefault;
      FLIQTURCSALI.Close;
    end;
  end;
end;

procedure TFLIQTURCSALI.FormShow(Sender: TObject);
begin
  with DMGEN,DMINV,DMGENT do begin
    QT_Ccos.Close;
    QT_Ccos.Prepare;
    QT_Ccos.Open;
    DBEdit2.SetFocus;
  end;
end;

procedure TFLIQTURCSALI.DBGrid1Enter(Sender: TObject);
begin
  DBEdit6.SetFocus;
end;

procedure TFLIQTURCSALI.GroupBox1Enter(Sender: TObject);
begin
  with DMINV,DMGEN do begin
    if T_Sali.state=dsedit then
      DBEdit6.setfocus
    else if (T_Sali.state<>dsinsert) then begin
      try
        IniciaDocAccion(idDocu,'',AccNuevo);
        SetAltaDocu;
      except
        Close;
      end;
    end;
  end;
end;

procedure TFLIQTURCSALI.FormCloseQuery(Sender: TObject;
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

procedure TFLIQTURCSALI.DBLookupComboBox1Enter(Sender: TObject);
begin
  with DMGEN do
    if not DBLookupComboBox1.ReadOnly then
      DBLookupComboBox1.KeyValue:=QT_DocuClaveDoc.asstring
    else DBEdit8.SetFocus;
end;

procedure TFLIQTURCSALI.DBEdit2DblClick(Sender: TObject);
begin
  with DMGEN,DMINV do begin
    if not DBEdit2.ReadOnly then
      T_SaliFolio.AsInteger:=Consecutivo(T_Sali,'Folio','Sucursal;TipoSal',VarArrayOf([T_SaliSucursal.AsInteger,T_SaliTipoSal.AsString]))
    else
      DBEdit8.SetFocus;
  end;
end;

procedure TFLIQTURCSALI.DBEdit2Enter(Sender: TObject);
begin
  if DBEdit2.ReadOnly then
    DBEdit8.SetFocus;
end;

procedure TFLIQTURCSALI.DBEdit5Exit(Sender: TObject);
begin
  AgregaListaStrTemp(DBEdit5.Text);
end;

procedure TFLIQTURCSALI.DBEdit5DblClick(Sender: TObject);
begin
  DBEdit5.Text:=SeleccionaStrTemp(DBEdit5.text);
end;

procedure TFLIQTURCSALI.DBEdit4DblClick(Sender: TObject);
begin
  DBEdit4.Text:=SeleccionaStrTemp(DBEdit4.text);
end;

procedure TFLIQTURCSALI.DBEdit4Exit(Sender: TObject);
begin
  AgregaListaStrTemp(DBEdit4.Text);
end;

procedure TFLIQTURCSALI.DBEdit3Enter(Sender: TObject);
begin
  DBLookUpComboBox1.SetFocus;
end;

procedure TFLIQTURCSALI.BbCancelarClick(Sender: TObject);
begin
  with DMINV,DMGEN,DMGEN_VTAS do begin
    if MensajeConf('Abandonar '+idDocuName+' ?')=mrYes then begin
      try
        EliminaCaptura;
        Close;
      finally
      end;
    end;
  end;
end;

procedure TFLIQTURCSALI.GroupBox1Exit(Sender: TObject);
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

procedure TFLIQTURCSALI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN do
    QT_Ccos.Close;
end;

procedure TFLIQTURCSALI.DBEdit8DblClick(Sender: TObject);
begin
  with DMGEN,DMINV do begin
    if FGENCCOSB.ShowModal=mrOk then begin
      DBEdit8.Text:=IntToClaveNum(FGENCCOSB.CveCentroCosto,3);
    end;
  end;
end;

procedure TFLIQTURCSALI.DBEdit1Exit(Sender: TObject);
begin
  DBEdit6.SetFocus;
end;

procedure TFLIQTURCSALI.Edit1Enter(Sender: TObject);
begin
  DBEdit1.SetFocus;
end;

procedure TFLIQTURCSALI.DBEdit9Enter(Sender: TObject);
begin
  DBEdit1.SetFocus;
end;

procedure TFLIQTURCSALI.BbCalcularClick(Sender: TObject);
var xcont      : integer;
    xsaldo     : TSaldoInv;
    cantidad   : double;
    swsaldonegativo:Boolean;
begin
  with DMINV,DMGAS,FLIQTURC do begin
    xcont:=0;
    BbGuardar.Enabled:=False;
    if ChbCmb.Checked then begin
      try
        QL_Tcmb.Close;
        QL_Tcmb.Prepare;
        QL_Tcmb.Open;
        FAvance.PreparaAvance('Generando Salida de Combustibles...',true,QL_Tcmb.RecordCount);
        swsaldonegativo:=False;
        while not QL_Tcmb.Eof do begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Sum(Cantidad) as Real1 from DGASDLIQC');
          Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
          if VarGasPolizaLiqDia='No' then
            Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
          Q_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_TcmbClave.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if Q_AuxiReal1.AsFloat<0.001 then begin
            QL_Tcmb.Next;
            Continue;
          end;
          cantidad:=Q_AuxiReal1.AsFloat;
          if ModoProc=0 then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1 from DGASAJUD2');
            Q_Auxi.SQL.Add('Where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
            Q_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_TcmbClave.AsInteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDatetime)+'"');
            if VarGasPolizaLiqDia='No' then
              Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTURNO.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            Cantidad:=Cantidad-Q_AuxiReal1.AsFloat;
          end;
          SaldoInvProd('A',0,T_SaliAlmacen.AsInteger,QL_TcmbCodigo.AsString,T_SaliFecha.AsDateTime,T_SaliFecha.AsDateTime,xsaldo,true);
{LIN.COM.}if (xsaldo.SaldoFinUni>cantidad) or (DMGEN_VTAS.T_EmprVtasPERMITESALDONEGATIVO.AsString='Si')then begin
            if xsaldo.SaldoFinUni<=cantidad then begin
              if VarLiqRestringirSalidaAlmacen='Si' then begin
                swsaldonegativo:=True;
                raise Exception.Create('No existe saldo para el Combustible: '+IntToStr(QL_TcmbCodigo.AsInteger)+#13+' Saldo: '+FloatToStr(xsaldo.SaldoFinUni)+' Cantidad Req.: '+FloatToStr(cantidad))
              end
              else
                MensajeWarn('No existe saldo para el Combustible: '+IntToStr(QL_TcmbCodigo.AsInteger)+#13+' Saldo: '+FloatToStr(xsaldo.SaldoFinUni)+' Cantidad Req.: '+FloatToStr(cantidad));
            end;
            if cantidad>0 then begin
              inc(xcont);
              T_Movs.Insert;
              T_MovsSucursal.AsInteger:=T_SaliSucursal.AsInteger;
              T_MovsTipoMov.AsString:=T_SaliTipoSal.AsString;
              T_MovsFolio.AsInteger:=T_SaliFolio.AsInteger;
              T_MovsIndice.AsInteger:=xcont;
              T_MovsAlmacen.AsInteger:=T_SaliAlmacen.AsInteger;
              T_MovsFecha.AsDateTime:=T_SaliFecha.AsDateTime;
              T_MovsMes.AsString:=FechaToMes(T_MovsFecha.AsDateTime);
              T_MovsProducto.AsString:=QL_TcmbCodigo.AsString;
              T_MovsCantidad.AsFloat:=cantidad;
              T_MovsAplicado.AsString:='No';
              T_MovsCosteado.AsString:='No';
              T_Movs.Post;
            end;

{LIN.COM.}end
{LIN.COM.}else begin
            BbGuardar.Enabled:=False;
            T_Movs.Cancel;
            if VarLiqRestringirSalidaAlmacen='Si' then begin
                swsaldonegativo:=True;
              raise Exception.Create('No existe saldo para el Combustible: '+IntToStr(QL_TcmbCodigo.AsInteger)+#13+' Saldo: '+FloatToStr(xsaldo.SaldoFinUni)+' Cantidad Req.: '+FloatToStr(cantidad))
            end
            else
              MensajeErr('No existe saldo para el Combustible: '+QL_TcmbCodigo.AsString+#13+' Saldo: '+FloatToStr(xsaldo.SaldoFinUni)+' Cantidad Req.: '+FloatToStr(cantidad));
{LIN.COM.}  //MensajeInfo('No existe saldo para el Combustible: '+IntToStr(QL_TcmbCodigo.AsInteger));
{LIN.COM.}end;
          QL_Tcmb.Next;
          FAvance.AvanzaPosicion;
        end;
      finally
        BbCalcular.Enabled:=false;
        FAvance.Close;
      end;
    end;
//Productos
    if ChbProd.Checked then begin
      try
        xcont:=0;
        QL_Prod.Close;
        QL_Prod.Prepare;
        QL_Prod.Open;
        FAvance.PreparaAvance('Generando Salida de Productos...',true,QL_Prod.RecordCount);
        while not QL_Prod.Eof do begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Sum(Venta) as Real1 from DGASDLIQA');
          Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
          if VarGasPolizaLiqDia='No' then
            Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
          Q_Auxi.SQL.Add('  and Producto='+IntToStr(QL_ProdClave.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if Q_AuxiReal1.AsFloat>0.0001 then begin
            SaldoInvProd('A',0,T_SaliAlmacen.AsInteger,QL_ProdCodigo.AsString,T_SaliFecha.AsDateTime,T_SaliFecha.AsDateTime,xsaldo,true);
            if (QL_ProdUnidad.AsString = 'SERVICIO') then
              MensajeWarn('Servicio no será considerado en la salida: ' + QL_ProdCodigo.AsString + ' - ' + QL_ProdDESCRIPCION.AsString +#13
                + 'Cantidad Reportada: ' + FloatToStr(Q_AuxiReal1.AsFloat))
            else begin
  {LIN.COM.}  if (xsaldo.SaldoFinUni>=Q_AuxiReal1.AsFloat) or (DMGEN_VTAS.T_EmprVtasPERMITESALDONEGATIVO.AsString='Si') then begin
                if xsaldo.SaldoFinUni<Q_AuxiReal1.AsFloat then begin
                  if VarLiqRestringirSalidaAlmacen='Si' then begin
                    swsaldonegativo:=True;
                    raise Exception.Create('No existe saldo para el Producto: '+QL_ProdCodigo.AsString+#13+' Saldo: '+FloatToStr(xsaldo.SaldoFinUni)+' Cantidad Req.: '+FloatToStr(Q_AuxiReal1.AsFloat))
                  end
                  else
                    MensajeWarn('No existe saldo para el Producto: '+QL_ProdCodigo.AsString+#13+' Saldo: '+FloatToStr(xsaldo.SaldoFinUni)+' Cantidad Req.: '+FloatToStr(Q_AuxiReal1.AsFloat));
                end;
                if Q_AuxiReal1.AsFloat>0 then begin
                  inc(xcont);
                  T_Movs.Insert;
                  T_MovsSucursal.AsInteger:=T_SaliSucursal.AsInteger;
                  T_MovsTipoMov.AsString:=T_SaliTipoSal.AsString;
                  T_MovsFolio.AsInteger:=T_SaliFolio.AsInteger;
                  T_MovsIndice.AsInteger:=xcont;
                  T_MovsAlmacen.AsInteger:=T_SaliAlmacen.AsInteger;
                  T_MovsFecha.AsDateTime:=T_SaliFecha.AsDateTime;
                  T_MovsMes.AsString:=FechaToMes(T_MovsFecha.AsDateTime);
                  T_MovsProducto.AsString:=QL_ProdCodigo.AsString;
                  T_MovsCantidad.AsFloat:=Q_AuxiReal1.AsFloat;
                  T_MovsAplicado.AsString:='No';
                  T_MovsCosteado.AsString:='No';
                  T_Movs.Post;
                end;
  {LIN.COM.}  end
  {LIN.COM.}  else begin
                   //BbGuardar.Enabled:=False;
                T_Movs.Cancel;
                if VarLiqRestringirSalidaAlmacen='Si' then begin
                  swsaldonegativo:=True;
                  raise Exception.Create('No existe saldo para el Producto: '+QL_ProdCodigo.AsString+#13+' Saldo: '+FloatToStr(xsaldo.SaldoFinUni)+' Cantidad Req.: '+FloatToStr(Q_AuxiReal1.AsFloat))
                end
                else
                  MensajeErr('No existe saldo para el Producto: '+QL_ProdCodigo.AsString+#13+' Saldo: '+FloatToStr(xsaldo.SaldoFinUni)+' Cantidad Req.: '+FloatToStr(Q_AuxiReal1.AsFloat));
  {LIN.COM.}        //MensajeInfo('No existe saldo para el Producto: '+QL_ProdCodigo.AsString);
  {LIN.COM.}  end;
            end;
{LIN.COM.}end;
          QL_Prod.Next;
          FAvance.AvanzaPosicion;
        end;
      finally
        BbCalcular.Enabled:=false;
        FAvance.Close;
      end;
    end;
    if (T_Movs.RecordCount>0) and (not swsaldonegativo) then begin
      BbGuardar.Enabled:=True;
      BbGuardar.SetFocus;
    end
    else
      BbGuardar.Enabled:=False;
  end;
end;

procedure TFLIQTURCSALI.FormDestroy(Sender: TObject);
begin
  with DMGEN_VTAS do begin
    if TT_AuxiS.Exists then
      EliminaTemp(TT_AuxiS);
  end;
end;

end.
