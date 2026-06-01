unit ULIQTURCPOLI;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,
  Mask,db,dbtables, DDMGEN, ImgList, DBActns, ActnList;

type
  TFLIQTURCPOLI = class(TForm)
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    MainMenu1: TMainMenu;
    Editar1: TMenuItem;
    Cancelar1: TMenuItem;
    Guardar1: TMenuItem;
    Panel1: TPanel;
    BbGuardar: TBitBtn;
    BbCancelar: TBitBtn;
    BbSalir: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    N1: TMenuItem;
    Salir2: TMenuItem;
    DBText4: TDBText;
    ActionList1: TActionList;
    InsertarRenglon: TDataSetInsert;
    EliminarRenglon: TDataSetDelete;
    CancelarCambios: TDataSetCancel;
    InicioDpol: TDataSetFirst;
    FinDpol: TDataSetLast;
    BitBtn1: TBitBtn;
    TT_Auxi: TTable;
    TT_AuxiCarAbo: TStringField;
    TT_AuxiCuenta: TStringField;
    TT_AuxiCcosto: TIntegerField;
    TT_AuxiImporte: TFloatField;
    PopupMenu1: TPopupMenu;
    DesglocedeDepsitos1: TMenuItem;
    TT_AuxiIndice: TIntegerField;
    QL_Tcmb: TQuery;
    QL_TcmbCLAVE: TIntegerField;
    QL_TcmbCUENTACNT: TStringField;
    QL_TcmbCUENTACNTIVA: TStringField;
    QL_Tpag: TQuery;
    QL_TcmbNOMBRE: TStringField;
    QL_TpagCLAVE: TStringField;
    QL_TpagDESCRIPCION: TStringField;
    QL_TpagCUENTACNT: TStringField;
    QL_TpagCLASE: TStringField;
    procedure Guardar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2DblClick(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GroupBox2Enter(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DesglocedeDepsitos1Click(Sender: TObject);
    procedure TT_AuxiAfterInsert(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
    FechaPoliza:TDateTime;
    xcuentacaja,
    xcuentacup,
    xcuentavales,
    xcuentaivacup:string[16];
    xcuentapp,
    xcuentaivapp:string[16];
    totsub,totiva,total:real;
    xindice:integer;
  public
    { Public declarations }
    swgrid    :boolean;
    Procedure PreparaForma(xfec:TDateTime);
    Procedure SetAltaPoliza;
    Procedure SetModifPoliza;
    Procedure EliminaCaptura;
    procedure CreaTablaTemp;
  end;

var
  FLIQTURCPOLI :TFLIQTURCPOLI;

implementation

uses DDMCNT, ULIBGRAL, UGEN_NET, UCNTPOLIConc,
     UCNTPOLIF, UCNTPOLICNF, DDMCXC, UAVANCE, ULIBDATABASE, DDMBNC, DDMCXP,
  DDMRGS, DDMIVA, DDMGENQ, DDMGENP, DDMGAS, DDMGASQ, DDMGENT, UDepositos,
  DDMGEN_VTAS, ULIQTURC;

{$R *.DFM}

procedure TFLIQTURCPOLI.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Indice', ftInteger, 0, True);
      Add('CarAbo', ftString, 1, True);
      Add('Cuenta', ftString, 16, True);
      Add('Ccosto', ftInteger, 0, True);
      Add('Importe', ftFloat,0, false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'Indice', [ixPrimary, ixUnique]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.Active:=true;
    xindice:=0;
  end;
end;

Procedure TFLIQTURCPOLI.EliminaCaptura;
begin
  with DMGEN,DMCNT do begin
    ApagaSwitchs('SwDocumActivo;SwEnlaceActivo;SwCalcFields');
    try
      if T_Poli.State=dsInsert then begin
        T_Poli.cancel;
        CancelaUpdates(DBGEN2,T_Poli);
      end
      else if T_Poli.State=dsEdit then begin
        T_Poli.cancel;
        CancelaUpdates(DBGEN2,T_Poli);
        IniciaUpdates(DBGEN2,T_Poli);
        T_Poli.delete;
        AplicaUpdates(DBGEN2,T_Poli);
      end;
      CancelaDocAccion;
    finally
      RecuperaSwitchs;
    end;
  end;
end;

Procedure TFLIQTURCPOLI.SetAltaPoliza;
var xtpol:string[2];
begin
  with DMGEN,DMCNT do begin
    if T_Poli.State<>dsBrowse then
      raise Exception.Create('Error en Captura: SetAlta');
    try
      IniciaUpdates(DBGEN2,T_Poli);
      T_Poli.insert;
      T_PoliFecha.AsDateTime:=FechaPoliza;
      xtpol:=VariableDeMemo(DMGASQ.QT_CajaVarIni,'TipoPolizaLiquidacion');
      if xtpol<>'' then
        T_PoliTipoPoliza.AsString:=xtpol
      else
        T_PoliTipoPoliza.AsString:=QT_DocuClaveDoc.AsString;
      DBLookUpComboBox1.KeyValue:=T_PoliTipoPoliza.AsString;
      T_PoliNoPoliza.asinteger:=Consecutivo(T_Poli,'NoPoliza','Mes;TipoPoliza',VarArrayOf([T_PoliMes.AsString,T_PoliTipoPoliza.AsString]));
      T_PoliFormulo.asstring:=UsuarioActivo;
      T_PoliReviso.asstring:=VarCntReviso;
      T_PoliAutorizo.asstring:=VarCntAutorizo;
      BbGuardar.Enabled:=false;
      BbCancelar.Enabled:=false;
      Guardar1.Enabled:=false;
      Cancelar1.Enabled:=false;
      DBGrid1.DataSource:=nil;
      swgrid:=false;
    except
      ErrorMsg:='Poliza '+IntToClaveDocu(T_PoliNoPoliza.AsInteger,idPoli)+' ya existe';
      raise;
    end;
  end;
end;

procedure TFLIQTURCPOLI.SetModifPoliza;
begin
  with DMCNT,DMGEN do begin
    if T_Poli.State<>dsInsert then begin
      if T_Poli.State<>dsEdit then
        raise Exception.Create('Error en Captura: SetModifPoliza')
      else exit;
    end;
    T_DPol.DisableControls;
    try
      try
        T_Poli.Post;
        AplicaUpdates(DBGEN2,T_Poli);
        ActualizaDocAccion(T_PoliClaveStr.AsString);
        IniciaUpdates(DBGEN2,T_Poli);
        T_Poli.edit;
        BbCancelar.Enabled:=true;
        Guardar1.Enabled:=true;
        Cancelar1.Enabled:=true;
        DBGrid1.DataSource:=DS_Dpol;
      except
        ErrorMsg:='Poliza '+IntToClaveDocu(T_PoliNoPoliza.AsInteger,idPoli)+' ya existe';
        raise;
      end;
    finally
      T_DPol.EnableControls;
    end;
  end;
end;

procedure TFLIQTURCPOLI.Guardar1Click(Sender: TObject);
begin
  with DMCNT,DMGEN,DMGAS do begin
    if not TotPolizaOk then begin
      MensajeErr('Sumas no coinciden');
      DBGrid1.setfocus;
      exit;
    end;
    Statusbar1.Panels[0].text:='Guardando Póliza';
    try
      try
        T_Turc.Edit;
        T_TurcContabilizado.AsString:='Si';
        T_TurcTipoPoliza.AsString:=T_PoliTipoPoliza.AsString;
        T_TurcNoPoliza.AsInteger:=T_PoliNoPoliza.AsInteger;
        T_Turc.Post;

        T_PoliDocumOrigen.AsString:=idLiqg;
        T_Poli.Post;

        AplicaUpdates(DBGEN2,T_Poli);
        AplicaPoliza(T_PoliMes.asstring,T_PoliTipoPoliza.asstring,T_PoliNoPoliza.asinteger,true);
        FinalizaDocAccion;
//
        if VarGasPolizaLiqDia='Si' then begin
          with DMGAS do begin
            Q_Auxi.Close;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Update DGASTURC Set Contabilizado="Si", TipoPoliza="**" ');
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
            Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
            Q_Auxi.SQL.Add('  and Turno<'+IntToStr(T_TurcTurno.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.ExecSQL;
          end;
        end;

        FCNTPOLIF.PreparaForma('I',T_PoliTipoPoliza.asstring,true);
        FCNTPOLIF.ImprimeForma;
        FCNTPOLIF.LiberaForma;

        if ((DMCNT.SubMod04_ContaElect)and(DMGEN.varGenDesactivarEnvioDeXMLAlGenerarPoliza='No')) then begin
          if VarGenExportarXMLLiqCxc = 'Si' then begin
            try
              AplicaPoliza(FechaToMes(T_TurcFECHA.AsDateTime),T_TurcTIPOPOLIZA.AsString,T_TurcNOPOLIZA.AsInteger,False);
              ExportarCFDIFctContado(T_TurcESTACION.AsInteger,T_TurcFECHA.AsDateTime,T_TurcTURNO.AsInteger,T_TurcTIPOPOLIZA.AsString,T_TurcNOPOLIZA.AsInteger,T_TurcCAJA.AsInteger);
              AplicaPoliza(FechaToMes(T_TurcFECHA.AsDateTime),T_TurcTIPOPOLIZA.AsString,T_TurcNOPOLIZA.AsInteger,True);
            except
              on e:Exception do begin
                MensajeErr(e.Message);
              end;
            end;
          end;
        end;

      except
        CancelaUpdates(DBGEN2,T_Poli);
        CancelaDocAccion;
        raise;
      end;
    finally
      Statusbar1.Panels[0].text:='';
      Close;
    end;
  end;
end;

procedure TFLIQTURCPOLI.PreparaForma(xfec:tDateTime);
begin
  with DMCNT,DMGEN do begin
    DMCNT.AbreTablasCnt('POLI;DPOL');
    try
      FechaPoliza:=xfec;
      SetDocumentoDflt('*');
      SetAltaPoliza;
    except
      EliminaCaptura;
      raise;
    end;
  end;
end;

procedure TFLIQTURCPOLI.FormShow(Sender: TObject);
begin
  with DMGEN,DMCNT,DMCXC do begin
    InicializaTemp(TT_Auxi);
    DBEdit3.SetFocus;
  end;
end;

procedure TFLIQTURCPOLI.DBLookupComboBox1Enter(Sender: TObject);
begin
  with DMGEN do begin
    DBLookupComboBox1.KeyValue:=QT_DocuClaveDoc.asstring;
  end;
end;

procedure TFLIQTURCPOLI.DBGrid1EditButtonClick(Sender: TObject);
begin
  with DMGEN,DMCNT do begin
    if DBGrid1.SelectedField=T_DPolConcepto1 then begin
      FCNTPOLIConc.ShowModal;
    end;
  end;
end;

procedure TFLIQTURCPOLI.DBEdit2Enter(Sender: TObject);
begin
  with DMCNT,DMGEN do begin
    T_PoliNoPoliza.asinteger:=Consecutivo(T_Poli,'NoPoliza','Mes;TipoPoliza',VarArrayOf([T_PoliMes.AsString,T_PoliTipoPoliza.AsString]));
  end;
end;

procedure TFLIQTURCPOLI.DBEdit2DblClick(Sender: TObject);
begin
  with DMCNT,DMGEN do begin
    T_PoliNoPoliza.asinteger:=Consecutivo(T_Poli,'NoPoliza','Mes;TipoPoliza',VarArrayOf([T_PoliMes.AsString,T_PoliTipoPoliza.AsString]));
  end;
end;

procedure TFLIQTURCPOLI.DBEdit5Exit(Sender: TObject);
begin
  swgrid:=true;
end;

procedure TFLIQTURCPOLI.DBEdit6Enter(Sender: TObject);
begin
  with DMCNT do begin
    if swgrid then begin
      DBGrid1.SetFocus;
      DBGrid1.SelectedField:=T_DPolCuenta;
    end;
  end;
end;

procedure TFLIQTURCPOLI.DBGrid1Exit(Sender: TObject);
begin
  with DMCNT do begin
    if T_Dpol.state in [dsInsert,dsEdit] then begin
      try
        T_Dpol.post;
      except
        DbGrid1.SetFocus;
        raise;
      end;
    end;
  end;
end;

procedure TFLIQTURCPOLI.GroupBox1Enter(Sender: TObject);
begin
  with DMCNT,DMGEN do begin
    if T_Poli.state=dsedit then
      DBEdit4.setfocus
    else if T_Poli.state<>dsinsert then begin
      try
        IniciaDocAccion(idDocu,'',AccNuevo);
        SetAltaPoliza;
      except
        Close;
      end;
    end;
  end;
end;

procedure TFLIQTURCPOLI.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with DMCNT,DMGEN do begin
    if T_Poli.state=dsEdit then begin
      if MensajeConf('Salir sin Guardar Póliza ?')=mrNo then
        CanClose:=false;
    end;
    if CanClose then
      EliminaCaptura;
  end;
end;

procedure TFLIQTURCPOLI.GroupBox2Enter(Sender: TObject);
begin
  with DMGEN do begin
    try
      SetModifPoliza;
    except
      EliminaCaptura;
      DBEdit3.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQTURCPOLI.Cancelar1Click(Sender: TObject);
begin
  with DMCNT,DMGEN do begin
    if MensajeConf('Abandonar Póliza ?')=mrYes then begin
      try
        EliminaCaptura;
      finally
        Close;
      end;
    end;
  end;
end;

procedure TFLIQTURCPOLI.DBGrid1Enter(Sender: TObject);
begin
  with DMCNT,DMGEN do begin
    try
      SetModifPoliza;
      if T_Dpol.IsEmpty then
        BitBtn1.SetFocus;
    except
      EliminaCaptura;
      DBEdit3.SetFocus;
      raise;
    end;
    swgrid:=false;
  end;
end;

procedure TFLIQTURCPOLI.BitBtn1Click(Sender: TObject);
var xsubtot,
    xtot,xiva:real;
    xccostostr,
    xctaalmacen,
    xctaivaalmacen,
    xctaivacupones,
    xctaivatarjetas,
    xctaOrdenC,
    xctaOrdenA,
    xctaIvaOrdenC,
    xctaIvaOrdenA:string;
    xccosto:integer;
begin
  with DMCNT,DMGEN,DMGENT,DMGAS,FLIQTURC do begin
    T_DPol.DisableControls;
    try
      CreaTablaTemp;
      TT_Auxi.Active:=true;
      if not LocalizaTabla(TT_Caja,'Estacion;Caja',VarArrayOf([QL_TurcEstacion.asinteger,QL_TurcCaja.asinteger])) then
        raise Exception.Create('No encuentro caja '+IntToStr(QL_TurcCaja.asinteger));
      xctaalmacen:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CuentaAlmacen'));
      xctaivaalmacen:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CuentaIvaAlmacen'));
      xctaivacupones:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CuentaIvaCupones'));
      xctaivatarjetas:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CuentaIvaTarjetas'));
      xctaOrdenC:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CuentaOrdenCupC'));
      xctaOrdenA:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CuentaOrdenCupA'));
      xccostostr:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CentroCosto'));
      xctaIvaOrdenC:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CuentaIvaOrdenCupC'));
      xctaIvaOrdenA:=FiltraStrNum(VariableDeMemo(DMGASQ.QT_CajaVarIni,'CuentaIvaOrdenCupA'));
      if xccostostr<>'' then begin
        if StrToIntdef(xccostostr,-1)=-1 then xccosto:=0
        else xccosto:=StrToInt(xccostostr);
      end;

// Venta de Combustibles
      QL_Tcmb.Close;
      QL_Tcmb.SQL.Clear;
      QL_Tcmb.SQL.Add('Select Clave,Nombre, CuentaCnt, CuentaCntIva  from DGASTCMB');
      QL_Tcmb.SQL.Add(' Where Clave in (Select distinct Combustible from DGASDLIQC');
      QL_Tcmb.SQL.Add('                  Where Estacion=:pestacion and Fecha=:pfecha ');
      if VarGasPolizaLiqDia='No' then begin
        QL_Tcmb.SQL.Add('and Turno=:pturno)');
        QL_Tcmb.ParamByName('pturno').AsInteger:=QL_TurcTurno.AsInteger;
      end
      else
        QL_Tcmb.SQL.Add(')');
      QL_Tcmb.SQL.Add(' Order by Clave');
      QL_Tcmb.ParamByName('pestacion').AsInteger:=QL_TurcEstacion.AsInteger;
      QL_Tcmb.ParamByName('pfecha').AsDateTime:=QL_TurcFecha.AsDateTime;
      QL_Tcmb.Prepare;
      QL_Tcmb.Open;
      while not QL_Tcmb.Eof do begin
        Q_Auxi.close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('select sum(Importe) as Real1 from DGASDLIQC');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSql(QL_TurcFecha.AsDatetime)+'"');
        if VarGasPolizaLiqDia='No' then
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
        Q_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_TcmbClave.AsInteger));
        Q_Auxi.Open;
        xtot:=Q_AuxiReal1.AsFloat;
        xsubtot:=AjustaFloat(DivideFloat(xtot,1+GetTasaIVAdeCombustible(QL_TurcESTACION.AsInteger,QL_TcmbCLAVE.AsInteger,QL_TurcFECHA.AsDateTime)/100),2);
        xiva:=xtot-xsubtot;

//Validaciones de Cuentas
        if not LocalizaTabla(T_Ctas,'NoCuenta',QL_TcmbCuentaCnt.AsString) then
          raise Exception.Create('No existe Cuenta Contable de '+QL_TcmbNombre.AsString+': '+QL_TcmbCuentaCnt.AsString);
        if T_CtasAcepta.AsString<>'Si' then
          raise Exception.Create('Cuenta Contable de '+QL_TcmbNombre.AsString+' no Acepta Movimiento: '+QL_TcmbCuentaCnt.AsString);
        if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
          raise Exception.Create('No se configuró Centro de Costo ');
//Venta
        TT_Auxi.Insert;
        TT_AuxiCarAbo.AsString:='A';
        TT_AuxiCuenta.AsString:=QL_TcmbCuentaCnt.AsString;
        if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
        else TT_AuxiCcosto.AsInteger:=xccosto;
        TT_AuxiImporte.AsFloat:=xsubtot;
        TT_Auxi.Post;
//Iva

        if not LocalizaTabla(T_Ctas,'NoCuenta',QL_TcmbCuentaCntIva.AsString) then
          raise Exception.Create('No existe Cuenta de Iva de '+QL_TcmbNombre.AsString+': '+QL_TcmbCuentaCntIva.AsString);
        if T_CtasAcepta.AsString<>'Si' then
          raise Exception.Create('Cuenta de Iva de '+QL_TcmbNombre.AsString+' no Acepta Movimiento: '+QL_TcmbCuentaCntIva.AsString);
        if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
          raise Exception.Create('No se configuró Centro de Costo ');

        TT_Auxi.Insert;
        TT_AuxiCarAbo.AsString:='A';
        TT_AuxiCuenta.AsString:=QL_TcmbCuentaCntIva.AsString;
        if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
        else TT_AuxiCcosto.AsInteger:=xccosto;
        TT_AuxiImporte.AsFloat:=xiva;
        TT_Auxi.Post;
        QL_Tcmb.Next;
      end;

// Venta de Productos de Almacen
        if not LocalizaTabla(T_Ctas,'NoCuenta',xctaalmacen) then
          raise Exception.Create('No existe Cuenta de Productos de Almacen: '+xctaalmacen);
        if T_CtasAcepta.AsString<>'Si' then
          raise Exception.Create('Cuenta de Productos de Almacen no Acepta Movimiento: '+xctaalmacen);
        if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
          raise Exception.Create('No se configuró Centro de Costo ');
        if T_CtasCentroCosto.AsString='No' then xccosto:=0;

        Q_Auxi.close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('select sum(Importe) as Real1 from DGASDLIQA');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSql(QL_TurcFecha.AsDatetime)+'"');
        if VarGasPolizaLiqDia='No' then
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
        Q_Auxi.Open;
        xtot:=Q_AuxiReal1.AsFloat;
        T_Prod.Active:=True;
        xsubtot:=AjustaFloat(DivideFloat(xtot,1+GetTasaIVAdeProducto(QL_TurcESTACION.AsInteger,T_ProdCLAVE.AsInteger,QL_TurcFECHA.AsDateTime)/100),2);
        xiva:=xtot-xsubtot;
// venta de productos de almacen
        TT_Auxi.Insert;
        TT_AuxiCarAbo.AsString:='A';
        TT_AuxiCuenta.AsString:=xctaalmacen;
        if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
        else TT_AuxiCcosto.AsInteger:=xccosto;
        TT_AuxiImporte.AsFloat:=xsubtot;
// iva de almacen

        if not LocalizaTabla(T_Ctas,'NoCuenta',xctaivaalmacen) then
          raise Exception.Create('No existe Cuenta de Iva para Productos de Almacén: '+xctaivaalmacen);
        if T_CtasAcepta.AsString<>'Si' then
          raise Exception.Create('Cuenta no Acepta Movimiento: '+xctaivaalmacen);
        if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
          raise Exception.Create('No se configuró Centro de Costo ');

        TT_Auxi.Post;
        TT_Auxi.Insert;
        TT_AuxiCarAbo.AsString:='A';
        TT_AuxiCuenta.AsString:=xctaivaalmacen;
        if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
        else TT_AuxiCcosto.AsInteger:=xccosto;
        TT_AuxiImporte.AsFloat:=xiva;
        TT_Auxi.Post;

// Ingresos
      QL_Tpag.Close;
      QL_Tpag.SQL.Clear;
      QL_Tpag.SQL.Add('Select Clave, Descripcion,Clase,CuentaCnt  from DGASTPAG');
      QL_Tpag.SQL.Add('  where Clave in (Select distinct Clave_Pago from DGASDLIQP');
      QL_Tpag.SQL.Add('                   Where Estacion=:pestacion and Fecha=:pfecha');
      if VarGasPolizaLiqDia='No' then begin
        QL_Tpag.SQL.Add('and Turno=:pturno)');
        QL_Tpag.ParamByName('pturno').AsInteger:=QL_TurcTurno.AsInteger;
      end
      else
        QL_Tpag.SQL.Add(')');
      QL_Tpag.SQL.Add('Order by Clave');
      QL_Tpag.ParamByName('pestacion').AsInteger:=QL_TurcEstacion.AsInteger;
      QL_Tpag.ParamByName('pfecha').AsDateTime:=QL_TurcFecha.AsDateTime;
      QL_Tpag.Prepare;
      QL_Tpag.Open;
      while not QL_Tpag.Eof do begin
        Q_Auxi.close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('select sum(Importe) as Real1 from DGASDLIQP');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSql(QL_TurcFecha.AsDatetime)+'"');
        if VarGasPolizaLiqDia='No' then
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
        Q_Auxi.SQL.Add('  and Clave_Pago="'+QL_TpagClave.AsString+'"');
        Q_Auxi.Open;
        xtot:=Q_AuxiReal1.AsFloat;
        xsubtot:=AjustaFloat(DivideFloat(xtot,1+GetTasaIVAdeCombustible(QL_TurcESTACION.AsInteger,1,QL_TurcFECHA.AsDateTime)/100),2);
        xiva:=xtot-xsubtot;
        //
        if not LocalizaTabla(T_Ctas,'NoCuenta',QL_TpagCuentaCnt.AsString) then
          raise Exception.Create('No existe Cuenta para el Tipo Pago '+QL_TpagDescripcion.AsString+': '+QL_TpagCuentaCnt.AsString);
        if T_CtasAcepta.AsString<>'Si' then
          raise Exception.Create('Cuenta para el Tipo Pago '+QL_TpagDescripcion.AsString+' no Acepta Movimiento: '+QL_TpagCuentaCnt.AsString);
        if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
          raise Exception.Create('No se configuró Centro de Costo ');

//Pago Cupones
        if QL_TpagClase.AsString=idClaseCupones then begin
          TT_Auxi.Insert;
          TT_AuxiCarAbo.AsString:='C';
          TT_AuxiCuenta.AsString:=QL_TpagCuentaCnt.AsString;
          if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
          else TT_AuxiCcosto.AsInteger:=xccosto;
          TT_AuxiImporte.AsFloat:=xsubtot;
          TT_Auxi.Post;

//Cuentas de Orden
          if (xctaOrdenC<>'')and(xctaOrdenA<>'')and
             (xctaIvaOrdenC<>'')and(xctaIvaOrdenA<>'') then begin
            if not LocalizaTabla(T_Ctas,'NoCuenta',xctaOrdenC) then
              raise Exception.Create('No existe Cuenta de Orden: '+xctaOrdenC);
            if T_CtasAcepta.AsString<>'Si' then
              raise Exception.Create('Cuenta no Acepta Movimiento: '+xctaOrdenC);
            if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
              raise Exception.Create('No se configuró Centro de Costo ');

            if not LocalizaTabla(T_Ctas,'NoCuenta',xctaOrdenA) then
              raise Exception.Create('No existe Cuenta de Orden: '+xctaOrdenA);
            if T_CtasAcepta.AsString<>'Si' then
              raise Exception.Create('Cuenta no Acepta Movimiento: '+xctaOrdenA);
            if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
              raise Exception.Create('No se configuró Centro de Costo ');
//
            if not LocalizaTabla(T_Ctas,'NoCuenta',xctaIvaOrdenC) then
              raise Exception.Create('No existe Cuenta Iva de Orden: '+xctaIvaOrdenC);
            if T_CtasAcepta.AsString<>'Si' then
              raise Exception.Create('Cuenta no Acepta Movimiento: '+xctaIvaOrdenC);
            if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
              raise Exception.Create('No se configuró Centro de Costo ');

            if not LocalizaTabla(T_Ctas,'NoCuenta',xctaIvaOrdenA) then
              raise Exception.Create('No existe Cuenta Ivade Orden: '+xctaIvaOrdenA);
            if T_CtasAcepta.AsString<>'Si' then
              raise Exception.Create('Cuenta no Acepta Movimiento: '+xctaIvaOrdenA);
            if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
              raise Exception.Create('No se configuró Centro de Costo ');


            TT_Auxi.Insert;
            TT_AuxiCarAbo.AsString:='C';
            TT_AuxiCuenta.AsString:=xctaOrdenC;
            if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
            else TT_AuxiCcosto.AsInteger:=xccosto;
            TT_AuxiImporte.AsFloat:=xsubtot;
            TT_Auxi.Post;

            TT_Auxi.Insert;
            TT_AuxiCarAbo.AsString:='C';
            TT_AuxiCuenta.AsString:=xctaIvaOrdenC;
            if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
            else TT_AuxiCcosto.AsInteger:=xccosto;
            TT_AuxiImporte.AsFloat:=xiva;
            TT_Auxi.Post;


            TT_Auxi.Insert;
            TT_AuxiCarAbo.AsString:='A';
            TT_AuxiCuenta.AsString:=xctaOrdenA;
            if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
            else TT_AuxiCcosto.AsInteger:=xccosto;
            TT_AuxiImporte.AsFloat:=xsubtot;
            TT_Auxi.Post;

            TT_Auxi.Insert;
            TT_AuxiCarAbo.AsString:='A';
            TT_AuxiCuenta.AsString:=xctaIvaOrdenA;
            if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
            else TT_AuxiCcosto.AsInteger:=xccosto;
            TT_AuxiImporte.AsFloat:=xiva;
            TT_Auxi.Post;

          end;

//Iva Cupones
          if not LocalizaTabla(T_Ctas,'NoCuenta',xctaivacupones) then
            raise Exception.Create('No existe Cuenta de Iva para Cupones: '+xctaivacupones);
          if T_CtasAcepta.AsString<>'Si' then
            raise Exception.Create('Cuenta no Acepta Movimiento: '+xctaivacupones);
          if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
            raise Exception.Create('No se configuró Centro de Costo ');

          TT_Auxi.Insert;
          TT_AuxiCarAbo.AsString:='C';
          TT_AuxiCuenta.AsString:=xctaivacupones;
          if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
          else TT_AuxiCcosto.AsInteger:=xccosto;
          TT_AuxiImporte.AsFloat:=xiva;
          TT_Auxi.Post;
        end
        else
//Pago Tarjetas
          if QL_TpagClase.AsString=idClaseTarjIntCre then begin
            TT_Auxi.Insert;
            TT_AuxiCarAbo.AsString:='C';
            TT_AuxiCuenta.AsString:=QL_TpagCuentaCnt.AsString;
            if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
            else TT_AuxiCcosto.AsInteger:=xccosto;
            TT_AuxiImporte.AsFloat:=xsubtot;
            TT_Auxi.Post;

  //Iva Tarjetas
            if not LocalizaTabla(T_Ctas,'NoCuenta',xctaivatarjetas) then
              raise Exception.Create('No existe Cuenta de Iva para Tarjetas: '+xctaivatarjetas);
            if T_CtasAcepta.AsString<>'Si' then
              raise Exception.Create('Cuenta no Acepta Movimiento: '+xctaivatarjetas);
            if (T_CtasCentroCosto.AsString='Si')and(xccosto=0) then
              raise Exception.Create('No se configuró Centro de Costo ');

            TT_Auxi.Insert;
            TT_AuxiCarAbo.AsString:='C';
            TT_AuxiCuenta.AsString:=xctaivatarjetas;
            if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
            else TT_AuxiCcosto.AsInteger:=xccosto;
            TT_AuxiImporte.AsFloat:=xiva;
            TT_Auxi.Post;
          end
          else begin
            TT_Auxi.Insert;
            TT_AuxiCarAbo.AsString:='C';
            TT_AuxiCuenta.AsString:=QL_TpagCuentaCnt.AsString;
            if T_CtasCentroCosto.AsString='No' then TT_AuxiCCosto.AsInteger:=0
            else TT_AuxiCcosto.AsInteger:=xccosto;
            TT_AuxiImporte.AsFloat:=xtot;
            TT_Auxi.Post;
          end;
        QL_Tpag.Next;
      end;

      // INSERTA DPOL
      TT_Auxi.First;
      FAvance.PreparaAvance('Procesando Póliza',true,TT_Auxi.RecordCount);
      while not TT_Auxi.Eof do begin
        if abs(TT_AuxiImporte.asfloat)>0.001 then begin
          T_Dpol.Insert;
          T_DpolCuenta.AsString:=TT_AuxiCuenta.AsString;
          T_DpolCarAbo.AsString:=TT_AuxiCarAbo.AsString;
          T_DpolAfectaCC.AsString:='No';
          if TT_AuxiCcosto.AsInteger>0 then begin
            T_DpolAfectaCC.AsString:='Si';
            T_DpolCentroCosto.AsInteger:=TT_AuxiCcosto.AsInteger;
          end;
          if TT_AuxiCarAbo.AsString='C' then begin
            T_DpolImpCargo.AsFloat:=AjustaFloat(TT_AuxiImporte.AsFloat,2);
          end
          else begin
            T_DpolImpAbono.AsFloat:=AjustaFloat(TT_AuxiImporte.AsFloat,2);
          end;
          T_DpolConcepto1.AsString:=T_PoliConcepto1.AsString;
          T_DpolConcepto2.AsString:=T_PoliConcepto2.AsString;
          T_Dpol.Post;
        end;
        FAvance.AvanzaPosicion;
        TT_Auxi.Next;
      end;

      BbGuardar.Enabled:=true;
      BbGuardar.SetFocus;
    finally
      if T_DPol.State=dsInsert then
        T_Dpol.Cancel;
      FAvance.Close;
      TT_Auxi.close;
      QL_Tcmb.Close;
      QL_Tpag.Close;
      BitBtn1.Enabled:=false;
      T_DPol.EnableControls;
    end;
  end;
end;

procedure TFLIQTURCPOLI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with DMGEN do begin
    try
      if TT_Auxi.Exists then
        EliminaTemp(TT_Auxi);
    except
    end;
  end;
end;

procedure TFLIQTURCPOLI.DesglocedeDepsitos1Click(Sender: TObject);
var xconce1,xconce2:string[40];
    xcuenta:string[16];
    xImporte:real;
begin
  with DMCNT do begin
    if T_DpolCarAbo.AsString<>'C' then
      raise Exception.Create('Solo se permiten Depósitos');
    xcuenta:=T_DpolCuenta.asstring;
    ximporte:=T_DpolImpCargo.AsFloat;
    xconce1:=T_DpolConcepto1.AsString;
    xconce2:=T_DpolConcepto2.AsString;
    Application.CreateForm(TFDepositos,FDepositos);
    try
      FDepositos.PreparaForma(xcuenta,ximporte);
      if FDepositos.ShowModal=mrOk then with FDepositos do begin
        if (abs(ximporte-TotalDesgloce)<=0.001)and(TT_Auxi.RecordCount>1) then begin
          TT_Auxi.First;
          T_Dpol.Edit;
          T_DpolCuenta.AsString:=TT_AuxiCuenta.AsString;
          T_DpolImpCargo.AsFloat:=TT_AuxiImporte.AsFloat;
          T_Dpol.Post;
          TT_Auxi.Next;
          while not TT_Auxi.Eof do begin
            T_Dpol.Insert;
            T_DpolCuenta.AsString:=TT_AuxiCuenta.AsString;
            T_DpolConcepto1.AsString:=xconce1;
            T_DpolConcepto2.AsString:=xconce2;
            T_DpolImpCargo.AsFloat:=TT_AuxiImporte.AsFloat;
            T_Dpol.Post;
            TT_Auxi.Next;
          end;
        end;
      end;
    finally
      with FDepositos do begin
        EliminaTemp(TT_Auxi);
        Free;
      end;
    end;
  end;
end;

procedure TFLIQTURCPOLI.TT_AuxiAfterInsert(DataSet: TDataSet);
begin
  inc(xindice);
  TT_AuxiIndice.AsInteger:=xindice;
end;

procedure TFLIQTURCPOLI.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DMCNT,DMGEN do begin
    if key=idF2 then begin
      if DBGrid1.SelectedField=T_DPolImpCargo then begin
        CuadraPoliza('C');
      end;
      if DBGrid1.SelectedField=T_DPolImpAbono then begin
        CuadraPoliza('A');
      end;
    end;
  end;
end;

procedure TFLIQTURCPOLI.DBEdit2Exit(Sender: TObject);
begin
  with DMGEN,DMCNT do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select NoPoliza as Entero1 from DCNTPOLI');
      Q_Auxi.SQL.Add('Where Mes='+QuotedStr(DMCNT.T_PoliMes.AsString));
      Q_Auxi.SQL.Add('  and TipoPoliza='+QuotedStr(DMCNT.T_PoliTipoPoliza.AsString));
      Q_Auxi.SQL.Add('  and NoPoliza='+Trim(DBEdit2.Text));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger>0 then begin
        MensajeInfo('El folio proporcionado ya existe, se asignará el consecutivo.');
        T_PoliNoPoliza.AsInteger:=Consecutivo(T_Poli,'NoPoliza','Mes;TipoPoliza',VarArrayOf([T_PoliMes.AsString,T_PoliTipoPoliza.AsString]));
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

end.
