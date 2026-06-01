unit ULIQMENU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Menus, Buttons, Grids, DBGrids, ImgList,
  ToolWin, ActnList, DBCtrls, WinSkinData, jpeg,Registry, cxintl,
  cxIntlPrintSys3, Master_Intf, DDM_KIOS, dxGDIPlusClasses, acPNG;

  const
     VersionBDGasolinera = '4.3.8.0';
     VersionBDAdmon = '4.3.10.0';
type
  TFLIQMENU = class(TForm)
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Archivos1: TMenuItem;
    StatusBar1: TStatusBar;
    Salir1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    AcercaDe1: TMenuItem;
    tURNOS1: TMenuItem;
    Panel1: TPanel;
    Bevel1: TBevel;
    DBText2: TDBText;
    Bevel3: TBevel;
    DBText3: TDBText;
    Bevel4: TBevel;
    DBText4: TDBText;
    DBText1: TDBText;
    Bevel2: TBevel;
    Cupones1: TMenuItem;
    ToolButton2: TToolButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Reportes1: TMenuItem;
    ToolButton1: TToolButton;
    Liquidaciones1: TMenuItem;
    RecepcindeLiquidaciones1: TMenuItem;
    ToolButton4: TToolButton;
    ValesdeCrdito1: TMenuItem;
    CapturadeVales1: TMenuItem;
    N2: TMenuItem;
    ResumendeVentasporCombustible1: TMenuItem;
    ValesPendientesdeFacturar1: TMenuItem;
    Consultas1: TMenuItem;
    ValesdeCrdito2: TMenuItem;
    ResumendeVentasporDespachador1: TMenuItem;
    ResumenMensualTiposPago: TMenuItem;
    RelacindeDesglosedeDocumentos1: TMenuItem;
    ReportedeSaldosReales1: TMenuItem;
    Herramientas1: TMenuItem;
    ProcesoDiario1: TMenuItem;
    TurnosdeLiquidacin1: TMenuItem;
    N1: TMenuItem;
    ResumendeLiquidaciones2: TMenuItem;
    ResumendeVentasporCombustible2: TMenuItem;
    ResumendeVentasporDespachador2: TMenuItem;
    ResumenMensualporTiposdePago1: TMenuItem;
    N3: TMenuItem;
    ResumdeLiquidacionesCosto1: TMenuItem;
    ResumendeLiquidacionesCosto1: TMenuItem;
    DesglosedePagos1: TMenuItem;
    ReportedeFaltantesySobrantes1: TMenuItem;
    ReporteAuxiliardeLiquidaciones1: TMenuItem;
    N4: TMenuItem;
    VerificadordeValesContabilidad1: TMenuItem;
    ResumenporTipodePagoGeneral1: TMenuItem;
    ResumendeVentasporProductos1: TMenuItem;
    TransaccionesdeTarjetas1: TMenuItem;
    SkinData1: TSkinData;
    PopupMenu1: TPopupMenu;
    CambiarUsuario1: TMenuItem;
    PopupMenu2: TPopupMenu;
    SkinActivo: TMenuItem;
    N5: TMenuItem;
    AplicacinDirectadeVales1: TMenuItem;
    CancelacindeCargosporValesdeCrdito1: TMenuItem;
    RelacindeValesFacturados1: TMenuItem;
    RelacindeCuponesRecuperadosporCliente1: TMenuItem;
    N6: TMenuItem;
    VerificacindeCargosDirectos1: TMenuItem;
    RelacindeValesporDespachador1: TMenuItem;
    ReportedeSaldosRealesporAntigedad1: TMenuItem;
    ReportesEspecias1: TMenuItem;
    ReportedeAntigedaddeSaldosResumido1: TMenuItem;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    Image1: TImage;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    Panel3: TPanel;
    Image3: TImage;
    cxIntlPrintSys31: TcxIntlPrintSys3;
    cxIntl1: TcxIntl;
    ResumendeVentasporDespachadorJefedeTurno1: TMenuItem;
    ActionList1: TActionList;
    Turnos: TAction;
    Liquidaciones: TAction;
    ValesDeCredito: TAction;
    RecupCupones: TAction;
    ConsultaValesCred: TAction;
    ConsultaTransTarjetas: TAction;
    ResumenLiquidaciones: TAction;
    ResumenLiquidacionesCosto: TAction;
    ReportedeVentasporTarjetaBancaria1: TMenuItem;
    Image2: TImage;
    AnalisisporDespachador1: TMenuItem;
    Grficas1: TMenuItem;
    Combustibles: TMenuItem;
    AceitesyDerivados1: TMenuItem;
    iposdePago1: TMenuItem;
    Diferencias1: TMenuItem;
    HojadeTrabajo1: TMenuItem;
    Ventasenlitrosdecombustiblesporestacin1: TMenuItem;
    Ventasenimportesdecombustiblesyaceitesporestacin1: TMenuItem;
    ReportedeVentasenLitrosMultiestacin1: TMenuItem;
    Reportededocumentosyvalespendientes1: TMenuItem;
    ReporteEjemplo1: TMenuItem;
    Resumendeventasdetallado1: TMenuItem;
    Reportedecuponesrecuperadosporclientediario1: TMenuItem;
    RelacindeFacturasdeCuponesPendientesdeRecuperar1: TMenuItem;
    RecepcionVales: TMenuItem;
    ReporteFacturasCuponesDetallado: TMenuItem;
    ReporteDescuentos: TMenuItem;
    procedure Salir1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AcercaDe1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure CuponesContabilidad1Click(Sender: TObject);
    procedure Combustibles1Click(Sender: TObject);
    procedure Productos1Click(Sender: TObject);
    procedure ResumendeVentasporCombustible1Click(Sender: TObject);
    procedure ValesPendientesdeFacturar1Click(Sender: TObject);
    procedure Verificador1Click(Sender: TObject);
    procedure ResumendeVentasporDespachador1Click(Sender: TObject);
    procedure ResumenMensualTiposPagoClick(Sender: TObject);
    procedure RelacindeDesglosedeDocumentos1Click(Sender: TObject);
    procedure ReportedeSaldosReales1Click(Sender: TObject);
    procedure ProcesoDiario1Click(Sender: TObject);
    procedure TurnosdeLiquidacin1Click(Sender: TObject);
    procedure ResumendeLiquidaciones2Click(Sender: TObject);
    procedure ResumendeVentasporCombustible2Click(Sender: TObject);
    procedure ResumendeVentasporDespachador2Click(Sender: TObject);
    procedure ResumenMensualporTiposdePago1Click(Sender: TObject);
    procedure ResumdeLiquidacionesCosto1Click(Sender: TObject);
    procedure DesglosedePagos1Click(Sender: TObject);
    procedure ReportedeFaltantesySobrantes1Click(Sender: TObject);
    procedure VerificadordeValesContabilidad1Click(Sender: TObject);
    procedure ResumenporTipodePagoGeneral1Click(Sender: TObject);
    procedure ResumendeVentasporProductos1Click(Sender: TObject);
    procedure CambiarUsuario1Click(Sender: TObject);
    procedure SkinActivoClick(Sender: TObject);
    procedure AplicacinDirectadeVales1Click(Sender: TObject);
    procedure CancelacindeCargosporValesdeCrdito1Click(Sender: TObject);
    procedure RelacindeValesFacturados1Click(Sender: TObject);
    procedure RelacindeCuponesRecuperadosporCliente1Click(Sender: TObject);
    procedure VerificacindeCargosDirectos1Click(Sender: TObject);
    procedure RelacindeValesporDespachador1Click(Sender: TObject);
    procedure ReportedeSaldosRealesporAntigedad1Click(Sender: TObject);
    procedure ReportedeAntigedaddeSaldosResumido1Click(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure ResumendeVentasporDespachadorJefedeTurno1Click(
      Sender: TObject);
    procedure TurnosExecute(Sender: TObject);
    procedure LiquidacionesExecute(Sender: TObject);
    procedure ValesDeCreditoExecute(Sender: TObject);
    procedure RecupCuponesExecute(Sender: TObject);
    procedure ConsultaValesCredExecute(Sender: TObject);
    procedure ConsultaTransTarjetasExecute(Sender: TObject);
    procedure ResumenLiquidacionesExecute(Sender: TObject);
    procedure ResumenLiquidacionesCostoExecute(Sender: TObject);
    procedure ResumendeLiquidaciones3Click(Sender: TObject);
    procedure ReportedeVentasporCombustible1Click(Sender: TObject);
    procedure ReportedeVentasporDespachador1Click(Sender: TObject);
    procedure ResumenMensual1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ReportedeVentasporTarjetaBancaria1Click(Sender: TObject);
    procedure ReporteComparativoVtasRealesvsAjustadas1Click(
      Sender: TObject);
    procedure AnalisisporDespachador1Click(Sender: TObject);
    procedure CombustiblesClick(Sender: TObject);
    procedure AceitesyDerivados1Click(Sender: TObject);
    procedure iposdePago1Click(Sender: TObject);
    procedure Diferencias1Click(Sender: TObject);
    procedure HojadeTrabajo1Click(Sender: TObject);
    procedure Ventasenlitrosdecombustiblesporestacin1Click(
      Sender: TObject);
    procedure Ventasenimportesdecombustiblesyaceitesporestacin1Click(
      Sender: TObject);
    procedure ReportedeVentasenLitrosMultiestacin1Click(Sender: TObject);
    procedure Reportededocumentosyvalespendientes1Click(Sender: TObject);
    procedure VentasdeCombustibles1Click(Sender: TObject);
    procedure Resumendeventasdetallado1Click(Sender: TObject);
    procedure Reportedecuponesrecuperadosporclientediario1Click(
      Sender: TObject);
    procedure RelacindeFacturasdeCuponesPendientesdeRecuperar1Click(
      Sender: TObject);
    procedure RecepcionValesClick(Sender: TObject);
    procedure ReporteFacturasCuponesDetalladoClick(Sender: TObject);
    procedure ReporteDescuentosClick(Sender: TObject);
    procedure ResumendeLiquidacionesCosto1Click(Sender: TObject);
    procedure ReporteAuxiliardeLiquidaciones1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    ParametrosSuite:string;
    procedure IniciaBaseDeDatos;
    procedure IniciaSistema;
    procedure DespliegaTitulo;
  end;

var
  FLIQMENU: TFLIQMENU;

implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, DDMCFG,          
  UGENPASS, ULIBDATABASE, ULIBLICENCIAS, UAcercaDe, DDMCNT, DDMGAS,
  DDMGASQ, UGENCLIE, DDMGEN_VTAS, ULIQTURC, ULIQRCUP, ULIQREP01P, ULIQLIQG,
  ULIQPVAL, UGASPREC, UGASPROD, ULIQREP05P, ULIQREP06P, ULIQREP07P,
  ULIQVERIVAL, ULIQCONS01, ULIQSPLASH, ULIQREP08P, ULIQREP10P, ULIQREP11P,
  ULIQREP12, ULIQREP12P, ULIQAJUD, ULIQREP13P, ULIQLIQGDESG, ULIQREP15P,
  ULIQREP19P, ULIQREP20P, DDMCUP, ULIQREP21P, ULIQCONS02, ULIQRCUP2,
  DDMCONS, DDMLIQ, ULIQPVALGEN, ULIQPVALCAN, ULIQREP23P, ULIQREP24P,
  ULIQPVALVER, ULIQREP27P, ULIQREP28P, ULIQREP29, ULIQREP29P, DDMCXC,
  ULIQREP31P, ULIQPVALK, UAutoriza, ULIQREP35P, ULIQREP36P,
  ULIQREP37P, ULIQGRF01P, ULIQGRF02P, ULIQGRF03P, ULIQREP38P, ULIQREP39P,ULIQREP43P,
  ULIQGRF04P, UAcercaDeIGAS, ULIQGRF05P, ULIQREP40P, ULIQREP41P, DDMXML,ULIQREP42P,
  fClientForm, DDMPBD, DDMClienteServicios, DDMGENT, ULIQREPESP01P, DDM_FACNET,
  ULIQRECVALE, UGENSENTINEL, ULIQREP44P, DDMGASNET, ULIQREP45P, ULIQREP46P, DDM_PUNTOS,
  ULIQREP18P;

{$R *.DFM}

procedure TFLIQMENU.DespliegaTitulo;
begin
  if EnDemostracion then
    Caption:=idSistNombre+' ImagenSoft '+VersionGasolinera+' -  [DEMO]'
  else
    Caption:=idSistNombre+' ImagenSoft '+VersionGasolinera+' - '+DMGASQ.QT_EstsNombre.AsString;
  if DMGAS.SwServiciosMaster then
    Caption:=Caption+' [TargetURL Master = '+DMGAS.VarGasTargetURL_Master+']';
end;

procedure TFLIQMENU.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQMENU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN,DMGAS,DMGEN_VTAS,DMCONS do begin
    try
      LiberaConexion(ConexionActiva);
      DBGEN1.close;
      DBGEN2.close;
      DBGAS1.close;
      DBGAS2.close;
      DBVentas1.Close;
      DBVentas2.close;
      DBGASCON.Close;
    except
    end;
  end;
end;

procedure TFLIQMENU.IniciaBaseDeDatos;
begin
  with DMGEN,DMGAS do begin
    Screen.Cursor:=crHourGlass;
    try
      if ParamCount>=1 then
        VsAliasDef:=ParamStr(1);
      if VsAliasDef='' then
        raise Exception.Create('No se definió "Alias" de Base de Datos Administración');

      ConectaDBMaestra(VSAliasDef);
      ConectaDataBase2(VSAliasDef);

      IniciaGen(idLiq);
      IniciaGen2(ReviGen,'GAS;LIQ;PVG;KIO;IGTA;CNT;INV;CXC');

    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TFLIQMENU.IniciaSistema;
var
 xusuario,xpass,xcomp:string;
 xPassOk:boolean;
begin
  with DMGEN,DMGAS do begin
    FLIQSPLASH.Close;
    FLIQSPLASH.Free;
    Application.CreateForm(TFGENPASS,FGENPASS);
    FGENPASS.PreparaForma(VsPCName);
    xPassOk:=FALSE;
    try
      if UpperCase(ParamStr(2))='SUITE' then begin
        ParametrosSuite:=ParamStr(3);
        xusuario:=ExtraeElemStrSep(ParametrosSuite,1,';');
        xpass:=ExtraeElemStrSep(ParametrosSuite,2,';');
        xcomp:=ExtraeElemStrSep(ParametrosSuite,3,';');
        case UsuarioValido(xusuario,xpass) of
          0:begin
              xPassOk:=true;
              PassUsuarioActivo:=xpass;
              if xcomp<>'' then begin
                IniciaComputadora(xcomp);
                SkinData1.Active:=TRUE;
                SkinActivo.Checked:=TRUE;
              end;
            end;
          1,2,3:begin
              xPassOk:=FALSE;
            end;
        end;
      end;
      if not xPassOk then begin
        if FGENPASS.ShowModal=mrCancel then
          Abort;
        if FGENPASS.Computadora<>'' then begin
          IniciaComputadora(FGENPASS.Computadora);
          SkinData1.Active:=TRUE;
          //SkinData1.Active:=VarComp('EfectoVisual')='Si';
          SkinActivo.Checked:=VarComp('EfectoVisual')='Si';
        end;
      end;
    finally
      FGENPASS.Free;
    end;

    if VarComp('AliasVentas')='' then
      raise Exception.Create('No se configuró "Alias" de Ventas');
    DMGEN_VTAS.ConectaDataBaseVentas(VarComp('AliasVentas'));
    DMGEN_VTAS.IniciaVentas(DDMGEN_VTAS.ReviGenVtas);
    DMCXC.LeeVarCxc;
//    DMGEN_VTAS.IniciaVentas('*');
    if VarComp('AliasGasolinera')='' then
      raise Exception.Create('No se configuró "Alias" de Gasolinera');
    DMGAS.ConectaDataBaseGas(VarComp('AliasGasolinera'));
//    DMGAS.ReviGas(ReviGenGas);
    IniciaGasolinera;
    cargaCombustibles;
    with DMGASQ do begin
      AbreTablasGasQ('Ests;Isla;Turn;Dtrn;Desp');
      DMGAS.LeeVarGas;
    end;
    if VarComp('ServiciosMaster')='Si' then begin
      DMGAS.SwServiciosMaster:=True;
      if VarComp('TargetURLMaster')<>'' then
        VarGasTargetURL_Master:=VarComp('TargetURLMaster');
    end;
    DMGAS.CargaConfiguracionConsola;
    if DMGAS.SwServiciosMaster then begin
      //inicia servicios
      try
        _NumeroEstacionVolumetrico:=GetNumeroEstacionVolumetricos;
      except
        on e:Exception do
          raise Exception.Create(e.Message);
      end;
    end;
    AbreQuery(QT_Empr);
    StatusBar1.Panels[0].text:=QT_EmprRazonSocial.AsString;
    StatusBar1.Panels[1].text:='Usuario: '+UsuarioActivo;
    if ActivaFechaTrabajo then
      StatusBar1.Panels[2].text:='Fecha de Trabajo: '+FechaPaq(FechaTrabajo)
    else Abort;
    StatusBar1.Panels[3].text:='PC: '+VsPCName;

    AbreQuery(QT_Sist);
    if LocalizaQuery(QT_Sist,'ClaveSis',idLiq) then
      ActualizaMenus(MainMenu1);
    if UsuarioActivo<>idSuper then begin
      ActualizaAccesos(MainMenu1,ToolBar1);
    end;
    if not ActivaEjercicio(idLiq) then
      Abort;

    if ActivaEjercicio(idLiq) then
      DBLookupComboBox1.KeyValue:=EjercicioActivo
    else Abort;
    DMCXC.LeeVarCxc;
    RegistraConexion(true);

    DMCNT.SubMod04_ContaElect:=SubModuloActivo(idCnt,VersionGen,idSMCntCONTELEC);
    if (DebugHook > 0) then
      DMCNT.SubMod04_ContaElect:=True;
    if DMCNT.SubMod04_ContaElect then begin
      Application.CreateForm(TDMClienteServicios,DMClienteServicios);
      DMClienteServicios.ROCliente.TargetURL:='http://'+DMGEN.VarGenTargetURLAdmonCFDI;
      if LocalizaTabla(DMGENT.T_Sucl,'CLAVE',DMGEN_VTAS.SucursalActual) then
        if not((VariableDeMemo(DMGENT.T_SuclVARIABLES,'TimeOutADMINCFDI'))='') then
          DMClienteServicios.ROCliente.Timeout:=StrToInt(VariableDeMemo(DMGENT.T_SuclVARIABLES,'TimeOutADMINCFDI'));
      if (not (VarGenAliasAdmonCFDI='')) and (VarGenExportarXMLLiqCxc = 'Si') then begin
        try
          DMXML.ConectaDBMaestra(VarGenAliasAdmonCFDI);
          DMXML.AbreTablas;
        except
        end;
      end;
    end;

    with DMCUP do begin
      try
        SwSubModuloCupFACELE:=False;
        if (VarComp('FACELEActivo')='Si') and (VarGenExportarXMLLiqCxc = 'Si') then begin
          SwSubModuloCupFACELE:=DMGEN.SubModuloActivo(idCup,VersionGas,idSMCupFACELE);
          if (DebugHook > 0) then
            SwSubModuloCupFACELE:=True;
          if SwSubModuloCupFACELE then begin
            try
              Application.CreateForm(TClientForm, ClientForm);
              ClientForm.ROChannel.TargetURL:=VarGasTargetURL_FACELE;
              ClientForm.ROChannel.Timeout:=DMGAS.GetTimeOutFacele;
              ClientForm.ROChannel.Connected:=True;
              StatusBar1.Panels[4].Text:='Facturación Electrónica Activada ['+VarGasTargetURL_FACELE+']';
//              _DatosEmisorEstacion:=DMGEN_VTAS.LLenaDatosEmisorFACELE(EstacionActual);                  //IMPLEMENTAR SOLO SI SE REALIZARÁN FACTURAS O DATOS CON EL EMISOR
//              if _DatosEmisorEstacion=nil then
//                MensajeWarn('No se han encontrado los datos del Emisor para Facturación Electrónica.');
            except
              on e:exception do
                MensajeInfo('No se puede Conectar con el Servidor de FACELE. '+VarGasTargetURL_FACELE);
            end;
            //Reforma Fiscal 2012
            SwSubModuloCupReforma2012:=False;
            SwSubModuloCupReforma2012:=DMGEN.SubModuloActivo(idCup,VersionGas,idSMCupReforma2012);
            if (DebugHook > 0) then
              SwSubModuloCupReforma2012:=True;
            //Fin Reforma Fiscal 2012
          end;
        end;
      except
      end;
    end;

    DespliegaTitulo;
    if DMCONS.AliasConsolaEsts<>'' then begin
      try
        DMCONS.ConectaBaseDatos;
      except
        DMCONS.AliasConsolaEsts:='';
      end;
    end;
    try
      if QT_EmprSERIEKEY.AsInteger<405 then
        DMCUP.SwSubModuloCupReformas2008:=DMGEN.SubModuloActivo(idCup,VersionGas,idSMCupRef2008)
      else
        DMCUP.SwSubModuloCupReformas2008:=True;
    except
    end;
      
    if DMGEN.QT_EmprSERIEKEY.AsInteger=637 then dmgen.VarGenConcatenarNombre:='Si';

    RecepcionVales.Visible := (DMGEN.QT_EmprSERIEKEY.AsInteger = SentinelPoliforum);

    if VariableDeMemo(DMGAS.T_EstsCONSOLA,'TargetURLMasterNET')<>EmptyStr then begin
      DMGASNET.IdTCPClientNET.Host:=ExtraeElemStrSep(VariableDeMemo(DMGAS.T_EstsCONSOLA,'TargetURLMasterNET'),1,':');
      DMGASNET.IdTCPClientNET.Port:=StrToIntDef(ExtraeElemStrSep(VariableDeMemo(DMGAS.T_EstsCONSOLA,'TargetURLMasterNET'),2,':'),0);
    end;

    if VariableDeMemo(DMGAS.T_EstsCONSOLA,'SocketFacturacion')<>EmptyStr then begin
      DMGASNET.ServerFacturacion.Host:=ExtraeElemStrSep(VariableDeMemo(DMGAS.T_EstsCONSOLA,'SocketFacturacion'),1,':');
      DMGASNET.ServerFacturacion.Port:=StrToIntDef(ExtraeElemStrSep(VariableDeMemo(DMGAS.T_EstsCONSOLA,'SocketFacturacion'),2,':'),0);
    end;

    if VariableDeMemo(DMGAS.T_EstsCONSOLA,'TargetURLFACELEI')<>EmptyStr then begin
      DM_FACNET.IdTCPClientFacelei.Host:=ExtraeElemStrSep(VariableDeMemo(DMGAS.T_EstsCONSOLA,'TargetURLFACELEI'),1,':');
      DM_FACNET.IdTCPClientFacelei.Port:=StrToIntDef(ExtraeElemStrSep(VariableDeMemo(DMGAS.T_EstsCONSOLA,'TargetURLFACELEI'),2,':'),0);
    end;

    if (DebugHook <= 0) then
      DMCONS.ValidadCCAlIniciarModulo;

    //Descuentos
    ReporteDescuentos.Visible:=((DMGAS.ValidaModulo(idDesc)) or ((DMGAS.VarGasSistemaGulfActivo = 'Si') or (DM_PUNTOS.LicenciaEsValidaPuntos)));

    if not (ValidadMigationHistory(VersionBDGasolinera)) then begin
      Application.MessageBox('Se requiere actualizar base de datos Gasolinera a la versión: ' + VersionBDGasolinera,'Error',0);
      Application.Terminate;
    end;
     if not (DMGEN.ValidadMigationHistory(VersionBDAdmon)) then begin
      Application.MessageBox('Se requiere actualizar base de datos Admon a la versión: ' + VersionBDAdmon,'Error',0);
      Application.Terminate;
    end;
  end;
end;

procedure TFLIQMENU.FormShow(Sender: TObject);
begin
  idSist:=idLiq;
  IniciaAmbiente;
  IniciaBaseDeDatos;
  IniciaSistema;
  ErrorInic:=false;

  SkinActivo.Checked := SkinData1.Active;    
  if dmgas.SwServiciosMaster then begin
    ReportedeVentasporTarjetaBancaria1.Visible:=True;
  end
  else begin
    ReportedeVentasporTarjetaBancaria1.Visible:=False;
  end;
  
  if DMGEN.QT_EmprSERIEKEY.AsInteger=637 then begin
    Grficas1.Visible:=False;
    Diferencias1.Visible:=False;
  end;
end;

procedure TFLIQMENU.FormActivate(Sender: TObject);
begin
  if ErrorInic then
    Application.Terminate;
  SwCalcFields:=true;

  StatusBar1.Panels[2].text:='Fecha de Trabajo: '+FechaPaq(FechaTrabajo);
end;

procedure TFLIQMENU.AcercaDe1Click(Sender: TObject);
begin
  with DMGEN do begin
    Application.CreateForm(TFAcercaDeIGAS,FAcercaDeIGAS);
    try
      FAcercaDeIGAS.ProductName.Caption:=idSistNombre+' IMAGEN';
      FAcercaDeIGAS.Version.Caption:='Versión '+'4.3.10.0'+' Revisión ' + ReviGen;
      FAcercaDeIGAS.Copyright.Caption:=AcercaDeDerechosGas;
      FAcercaDeIGAS.Comments.Caption:=AcercaDeComentarioGas;
      FAcercaDeIGAS.ShowModal;
    finally
      FAcercaDeIGAS.Free;
    end;
  end;
end;

procedure TFLIQMENU.DBLookupComboBox1Click(Sender: TObject);
begin
  PonEjercicioActivo(DMGEN.QT_EjerAno.AsInteger);
  DespliegaTitulo;
end;

procedure TFLIQMENU.CuponesContabilidad1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP01P,FLIQREP01P);
  try
    FLIQREP01P.ShowModal;
  finally
    FLIQREP01P.Free;
  end;
end;

procedure TFLIQMENU.Combustibles1Click(Sender: TObject);
begin
  Application.CreateForm(TFGASPREC,FGASPREC);
  try
    FGASPREC.PreparaForma;
    FGASPREC.ShowModal;
  finally
    FGASPREC.Free;
  end;
end;

procedure TFLIQMENU.Productos1Click(Sender: TObject);
begin
  Application.CreateForm(TFGASPROD,FGASPROD);
  try
    FGASPROD.ShowModal;
  finally
    FGASPROD.Free;
  end;
end;

procedure TFLIQMENU.ResumendeVentasporCombustible1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP06P,FLIQREP06P);
  try
    FLIQREP06P.PreparaForma(0);
    FLIQREP06P.ShowModal;
  finally
    FLIQREP06P.Free;
  end;
end;

procedure TFLIQMENU.ValesPendientesdeFacturar1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP07P,FLIQREP07P);
  try
    FLIQREP07P.ShowModal;
  finally
    FLIQREP07P.Free;
  end;
end;

procedure TFLIQMENU.Verificador1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQVERIVAL,FLIQVERIVAL);
  try
    FLIQVERIVAL.ShowModal;
  finally
    FLIQVERIVAL.Free;
  end;
end;

procedure TFLIQMENU.ResumendeVentasporDespachador1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP08P,FLIQREP08P);
  try
    FLIQREP08P.PreparaForma(0);
    FLIQREP08P.ShowModal;
  finally
    FLIQREP08P.Free;
  end;
end;

procedure TFLIQMENU.ResumenMensualTiposPagoClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP10P,FLIQREP10P);
  try
    FLIQREP10P.PreparaForma(0);
    FLIQREP10P.ShowModal;
  finally
    FLIQREP10P.Free;
  end;
end;

procedure TFLIQMENU.RelacindeDesglosedeDocumentos1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP11P,FLIQREP11P);
  try
    FLIQREP11P.ShowModal;
  finally
    FLIQREP11P.Free;
  end;
end;

procedure TFLIQMENU.ReportedeSaldosReales1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP12P,FLIQREP12P);
  try
    FLIQREP12P.ShowModal;
  finally
    FLIQREP12P.Free;
  end;
end;

procedure TFLIQMENU.ProcesoDiario1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQAJUD,FLIQAJUD);
  try
    FLIQAJUD.PreparaForma;
    FLIQAJUD.ShowModal;
  finally
    FLIQAJUD.Free;
  end;
end;

procedure TFLIQMENU.TurnosdeLiquidacin1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQTURC,FLIQTURC);
  try
    FLIQTURC.PreparaForma(0);
    FLIQTURC.ShowModal;
  finally
    FLIQTURC.Free;
  end;
end;

procedure TFLIQMENU.ResumendeLiquidaciones2Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP05P,FLIQREP05P);
  try
    FLIQREP05P.PreparaForma(0);
    FLIQREP05P.ShowModal;
  finally
    FLIQREP05P.Free;
  end;
end;

procedure TFLIQMENU.ResumendeVentasporCombustible2Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP06P,FLIQREP06P);
  try
    FLIQREP06P.PreparaForma(0);
    FLIQREP06P.ShowModal;
  finally
    FLIQREP06P.Free;
  end;
end;

procedure TFLIQMENU.ResumendeVentasporDespachador2Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP08P,FLIQREP08P);
  try
    FLIQREP08P.PreparaForma(0);
    FLIQREP08P.ShowModal;
  finally
    FLIQREP08P.Free;
  end;
end;

procedure TFLIQMENU.ResumenMensualporTiposdePago1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP10P,FLIQREP10P);
  try
    FLIQREP10P.PreparaForma(0);
    FLIQREP10P.ShowModal;
  finally
    FLIQREP10P.Free;
  end;
end;

procedure TFLIQMENU.ResumdeLiquidacionesCosto1Click(Sender: TObject);
begin
  if not(DMGAS.ValidaModulo(idDesc)) and not(DMGAS.VarGasSistemaGulfActivo = 'Si') and not(DM_PUNTOS.LicenciaEsValidaPuntos) then begin
    try
      Application.CreateForm(TFLIQREP13P,FLIQREP13P);
      FLIQREP13P.PreparaForma(0);
      FLIQREP13P.ShowModal;
    finally
      FLIQREP13P.Free;
    end;
  end
  else begin
    try
      Application.CreateForm(TFLIQREP46P,FLIQREP46P);
      FLIQREP46P.PreparaForma(0);
      FLIQREP46P.ShowModal;
    finally
      FLIQREP46P.Free;
    end;
  end;
end;

procedure TFLIQMENU.DesglosedePagos1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQLIQGDESG,FLIQLIQGDESG);
  try
    FLIQLIQGDESG.PreparaForma;
    FLIQLIQGDESG.ShowModal;
  finally
    FLIQLIQGDESG.Free;
  end;
end;

procedure TFLIQMENU.ReportedeFaltantesySobrantes1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP15P,FLIQREP15P);
  try
    FLIQREP15P.PreparaForma;
    FLIQREP15P.ShowModal;
  finally
    FLIQREP15P.Free;
  end;
end;

procedure TFLIQMENU.VerificadordeValesContabilidad1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP19P,FLIQREP19P);
  try
    FLIQREP19P.ShowModal;
  finally
    FLIQREP19P.Free;
  end;
end;

procedure TFLIQMENU.ResumenporTipodePagoGeneral1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP20P,FLIQREP20P);
  try
    FLIQREP20P.PreparaForma(0);
    FLIQREP20P.ShowModal;
  finally
    FLIQREP20P.Free;
  end;
end;

procedure TFLIQMENU.ResumendeVentasporProductos1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP21P,FLIQREP21P);
  try
    FLIQREP21P.PreparaForma(0);
    FLIQREP21P.ShowModal;
  finally
    FLIQREP21P.Free;
  end;
end;

procedure TFLIQMENU.CambiarUsuario1Click(Sender: TObject);
begin
  with DMGEN,DMGAS do begin
    IniciaAmbiente;
    Application.CreateForm(TFGENPASS,FGENPASS);
    try
      FGENPASS.PreparaForma(VsPCName);
      if FGENPASS.ShowModal=mrCancel then
        Abort;
      if FGENPASS.Computadora<>'' then
        IniciaComputadora(FGENPASS.Computadora);
    finally
      FGENPASS.Free;
    end;

    if VarComp('AliasVentas')='' then
      raise Exception.Create('No se configuró "Alias" de Ventas');
    DMGEN_VTAS.ConectaDataBaseVentas(VarComp('AliasVentas'));

    if VarComp('AliasGasolinera')='' then
      raise Exception.Create('No se configuró "Alias" de Gasolinera');
    DMGAS.ConectaDataBaseGas(VarComp('AliasGasolinera'));

    IniciaGasolinera;
    DMGAS.CargaConfiguracionConsola;


    AbreQuery(QT_Empr);
    StatusBar1.Panels[0].text:=QT_EmprRazonSocial.AsString;
    StatusBar1.Panels[1].text:='Usuario: '+UsuarioActivo;
    if ActivaFechaTrabajo then
      StatusBar1.Panels[2].text:='Fecha de Trabajo: '+FechaPaq(FechaTrabajo)
    else Abort;
    StatusBar1.Panels[3].text:='PC: '+VsPCName;

    AbreQuery(QT_Sist);
    if LocalizaQuery(QT_Sist,'ClaveSis',idLiq) then
      ActualizaMenus(MainMenu1);
    if UsuarioActivo<>idSuper then begin
      ActualizaAccesos(MainMenu1,ToolBar1);
    end;
    if not ActivaEjercicio(idLiq) then
      Abort;

    if ActivaEjercicio(idLiq) then
      DBLookupComboBox1.KeyValue:=EjercicioActivo
    else Abort;

    RegistraConexion(true);
    with DMGASQ do begin
      AbreTablasGasQ('Ests;Isla;Turn;Dtrn;Desp');
      DMGAS.LeeVarGas;
    end;

    if DMCONS.AliasConsolaEsts<>'' then begin
      try
        DMCONS.ConectaBaseDatos;
      except
        DMCONS.AliasConsolaEsts:='';
      end;
    end;
    DespliegaTitulo;
  end;
end;

procedure TFLIQMENU.SkinActivoClick(Sender: TObject);
begin
  SkinActivo.Checked:=not SkinActivo.Checked;
  SkinData1.Active:=SkinActivo.Checked;
end;

procedure TFLIQMENU.AplicacinDirectadeVales1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQPVALGEN,FLIQPVALGEN);
  try
    FLIQPVALGEN.PreparaForma;
    FLIQPVALGEN.ShowModal;
  finally
    FLIQPVALGEN.Free;
  end;
end;

procedure TFLIQMENU.CancelacindeCargosporValesdeCrdito1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQPVALCAN,FLIQPVALCAN);
  try
    FLIQPVALCAN.ShowModal;
  finally
    FLIQPVALCAN.Free;
  end;
end;

procedure TFLIQMENU.RelacindeValesFacturados1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP23P,FLIQREP23P);
  try
    FLIQREP23P.ShowModal;
  finally
    FLIQREP23P.Free;
  end;
end;

procedure TFLIQMENU.RelacindeCuponesRecuperadosporCliente1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP24P,FLIQREP24P);
  try
    FLIQREP24P.ShowModal;
  finally
    FLIQREP24P.Free;
  end;
end;

procedure TFLIQMENU.VerificacindeCargosDirectos1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQPVALVER,FLIQPVALVER);
  try
    FLIQPVALVER.ShowModal;
  finally
    FLIQPVALVER.Free;
  end;
end;

procedure TFLIQMENU.RelacindeValesporDespachador1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP27P,FLIQREP27P);
  try
    FLIQREP27P.ShowModal;
  finally
    FLIQREP27P.Free;
  end;
end;

procedure TFLIQMENU.ReportedeSaldosRealesporAntigedad1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP28P,FLIQREP28P);
  try
    FLIQREP28P.ShowModal;
  finally
    FLIQREP28P.Free;
  end;
end;

procedure TFLIQMENU.ReportedeAntigedaddeSaldosResumido1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP29P,FLIQREP29P);
  try
    FLIQREP29P.ShowModal;
  finally
    FLIQREP29P.Free;
  end;
end;

procedure TFLIQMENU.Image3DblClick(Sender: TObject);
var
        Registro : TRegistry;
        KeyName: String;
        ValueStr: String;
begin
  {se debe hacer un uses de la unit Registry}
  Registro := TRegistry.Create;
  try
    Registro.RootKey := HKEY_CLASSES_ROOT;
    KeyName := 'htmlfile\shell\open\command';
    if Registro.OpenKey(KeyName, False) then
    begin
      ValueStr := Registro.ReadString('');
      Registro.CloseKey;
      WinExec(PChar(ValueStr+' www.igas.com.mx'),SW_SHOWNORMAL);
      //Label1.Caption:=ValueStr;
    end
    else
      ShowMessage('No posee explorador de HTML predeterminado');
  finally
    Registro.Free;
  end;
end;

procedure TFLIQMENU.ResumendeVentasporDespachadorJefedeTurno1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP31P,FLIQREP31P);
  try
    FLIQREP31P.PreparaForma(0);
    FLIQREP31P.ShowModal;
  finally
    FLIQREP31P.Free;
  end;
end;

procedure TFLIQMENU.TurnosExecute(Sender: TObject);
begin
  Application.CreateForm(TFLIQTURC,FLIQTURC);
  try
    FLIQTURC.PreparaForma(0);
    FLIQTURC.ShowModal;
  finally
    FLIQTURC.Free;
  end;
end;

procedure TFLIQMENU.LiquidacionesExecute(Sender: TObject);
begin
  Application.CreateForm(TFLIQLIQG,FLIQLIQG);
  try
    DMLIQ.VarLiqTurnoRestringido:=DMLIQ.TurnoEsRestringido;
    
    FLIQLIQG.pTurno:=0;
    FLIQLIQG.PreparaForma;
    FLIQLIQG.ShowModal;
  finally
    FLIQLIQG.Free;
  end;
end;

procedure TFLIQMENU.ValesDeCreditoExecute(Sender: TObject);
begin
  if (DMGEN.SistemaActivo2(idTablet)) or (DMGEN.SistemaActivo2(idKio)) then begin
    Application.CreateForm(TFLIQPVALK,FLIQPVALK);
    try
      FLIQPVALK.PreparaForma;
      FLIQPVALK.ShowModal;
    finally
      FLIQPVALK.Free;
    end;
  end
  else begin
    Application.CreateForm(TFLIQPVAL,FLIQPVAL);
    try
      FLIQPVAL.PreparaForma;
      FLIQPVAL.ShowModal;
    finally
      FLIQPVAL.Free;
    end;
  end;
end;

procedure TFLIQMENU.RecupCuponesExecute(Sender: TObject);
begin
   with DMGEN do begin
    if SistemaActivo(idPvg) then begin
      Application.CreateForm(TFLIQRCUP,FLIQRCUP);
      try
        FLIQRCUP.PreparaForma;
        FLIQRCUP.ShowModal;
      finally
        FLIQRCUP.Free;
      end;
    end
    else begin
      Application.CreateForm(TFLIQRCUP2,FLIQRCUP2);
      try
        FLIQRCUP2.PreparaForma;
        FLIQRCUP2.ShowModal;
      finally
        FLIQRCUP2.Free;
      end;
    end;
  end;
end;

procedure TFLIQMENU.ConsultaValesCredExecute(Sender: TObject);
begin
  Application.CreateForm(TFLIQCONS01,FLIQCONS01);
  try
    FLIQCONS01.ShowModal;
  finally
    FLIQCONS01.Free;
  end;
end;

procedure TFLIQMENU.ConsultaTransTarjetasExecute(Sender: TObject);
begin
  Application.CreateForm(TFLIQCONS02,FLIQCONS02);
  try
    FLIQCONS02.ShowModal;
  finally
    FLIQCONS02.Free;
  end;
end;

procedure TFLIQMENU.ResumenLiquidacionesExecute(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP05P,FLIQREP05P);
  try
    FLIQREP05P.PreparaForma(0);
    FLIQREP05P.ShowModal;
  finally
    FLIQREP05P.Free;
  end;
end;

procedure TFLIQMENU.ResumenLiquidacionesCostoExecute(Sender: TObject);
begin
  if not(DMGAS.ValidaModulo(idDesc)) and not(DMGAS.VarGasSistemaGulfActivo = 'Si') and not(DM_PUNTOS.LicenciaEsValidaPuntos) then begin
    try
      Application.CreateForm(TFLIQREP13P,FLIQREP13P);
      FLIQREP13P.PreparaForma(0);
      FLIQREP13P.ShowModal;
    finally
      FLIQREP13P.Free;
    end;
  end
  else begin
    try
      Application.CreateForm(TFLIQREP46P,FLIQREP46P);
      FLIQREP46P.PreparaForma(0);
      FLIQREP46P.ShowModal;
    finally
      FLIQREP46P.Free;
    end;
  end;
end;

procedure TFLIQMENU.ResumendeLiquidaciones3Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP05P,FLIQREP05P);
  try
    FLIQREP05P.PreparaForma(1);
    FLIQREP05P.ShowModal;
  finally
    FLIQREP05P.Free;
  end;
end;

procedure TFLIQMENU.ReportedeVentasporCombustible1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP06P,FLIQREP06P);
  try
    FLIQREP06P.PreparaForma(1);
    FLIQREP06P.ShowModal;
  finally
    FLIQREP06P.Free;
  end;
end;

procedure TFLIQMENU.ReportedeVentasporDespachador1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP08P,FLIQREP08P);
  try
    FLIQREP08P.PreparaForma(1);
    FLIQREP08P.ShowModal;
  finally
    FLIQREP08P.Free;
  end;
end;

procedure TFLIQMENU.ResumenMensual1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP10P,FLIQREP10P);
  try
    FLIQREP10P.PreparaForma(1);
    FLIQREP10P.ShowModal;
  finally
    FLIQREP10P.Free;
  end;
end;

procedure TFLIQMENU.N7Click(Sender: TObject);
begin
  if not(DMGAS.ValidaModulo(idDesc)) and not(DMGAS.VarGasSistemaGulfActivo = 'Si') and not(DM_PUNTOS.LicenciaEsValidaPuntos) then begin
    try
      Application.CreateForm(TFLIQREP13P,FLIQREP13P);
      FLIQREP13P.PreparaForma(1);
      FLIQREP13P.ShowModal;
    finally
      FLIQREP13P.Free;
    end;
  end
  else begin
    try
      Application.CreateForm(TFLIQREP46P,FLIQREP46P);
      FLIQREP46P.PreparaForma(1);
      FLIQREP46P.ShowModal;
    finally
      FLIQREP46P.Free;
    end;
  end;
end;

procedure TFLIQMENU.ReportedeVentasporTarjetaBancaria1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP36P,FLIQREP36P);
  try
    FLIQREP36P.PreparaForma;
    FLIQREP36P.ShowModal;
  finally
    FLIQREP36P.Free;
  end;
end;

procedure TFLIQMENU.ReporteComparativoVtasRealesvsAjustadas1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP35P,FLIQREP35P);
  try
    FLIQREP35P.PreparaForma;
    FLIQREP35P.ShowModal;
  finally
    FLIQREP35P.Free;
  end;
end;

procedure TFLIQMENU.AnalisisporDespachador1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP37P,FLIQREP37P);
  try
    FLIQREP37P.ShowModal;
  finally
    FLIQREP37P.Free;
  end;
end;

procedure TFLIQMENU.CombustiblesClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF01P,FLIQGRF01P);
  try
    FLIQGRF01P.PreparaForma(0);
    FLIQGRF01P.ShowModal;
  finally
    FLIQGRF01P.Free;
  end;
end;

procedure TFLIQMENU.AceitesyDerivados1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF02P,FLIQGRF02P);
  try
    FLIQGRF02P.PreparaForma(0);
    FLIQGRF02P.ShowModal;
  finally
    FLIQGRF02P.Free;
  end;
end;

procedure TFLIQMENU.iposdePago1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF03P,FLIQGRF03P);
  try
    FLIQGRF03P.PreparaForma(0);
    FLIQGRF03P.ShowModal;
  finally
    FLIQGRF03P.Free;
  end;
end;

procedure TFLIQMENU.Diferencias1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP38P,FLIQREP38P);
  try
    FLIQREP38P.PreparaForma(0);
    FLIQREP38P.ShowModal;
  finally
    FLIQREP38P.Free;
  end;
end;

procedure TFLIQMENU.HojadeTrabajo1Click(Sender: TObject);
var bar: Integer;
begin
  Application.CreateForm(TFLIQREP39P,FLIQREP39P);
  try
    FLIQREP39P.ShowModal;
  finally
    FLIQREP39P.Free;
  end;
end;

procedure TFLIQMENU.VentasdeCombustibles1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF04P,FLIQGRF04P);
  try
    FLIQGRF04P.ShowModal;
  finally
    FLIQGRF04P.Free;
  end;
end;

procedure TFLIQMENU.Ventasenimportesdecombustiblesyaceitesporestacin1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF05P,FLIQGRF05P);
  try
    FLIQGRF05P.PreparaForma(0);
    FLIQGRF05P.ShowModal;
  finally
    FLIQGRF05P.Free;
  end;
end;

procedure TFLIQMENU.ReportedeVentasenLitrosMultiestacin1Click(
  Sender: TObject);
begin
  //FALTA
  Application.CreateForm(TFLIQREP40P,FLIQREP40P);
  try
    FLIQREP40P.PreparaForma(0);
    FLIQREP40P.ShowModal;
  finally
    FLIQREP40P.Free;
  end;
end;

procedure TFLIQMENU.Reportededocumentosyvalespendientes1Click(
  Sender: TObject);
begin
  //FALTA
  Application.CreateForm(TFLIQREP41P,FLIQREP41P);
  try
    FLIQREP41P.ShowModal;
  finally
    FLIQREP41P.Free;
  end;
end;

procedure TFLIQMENU.Ventasenlitrosdecombustiblesporestacin1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF04P,FLIQGRF04P);
  try
    FLIQGRF04P.PreparaForma(0);
    FLIQGRF04P.ShowModal;
  finally
    FLIQGRF04P.Free;
  end;
end;

procedure TFLIQMENU.Resumendeventasdetallado1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREPESP01P,FLIQREPESP01P);
  try
    FLIQREPESP01P.ShowModal;
  finally
    FLIQREPESP01P.Free;
  end;
end;

procedure TFLIQMENU.Reportedecuponesrecuperadosporclientediario1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP42P,FLIQREP42P);
  try
    FLIQREP42P.ShowModal;
  finally
    FLIQREP42P.Free;
  end;
end;

procedure TFLIQMENU.RelacindeFacturasdeCuponesPendientesdeRecuperar1Click(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP43P,FLIQREP43P);
  try
    FLIQREP43P.ShowModal;
  finally
    FLIQREP43P.Free;
  end;
end;

procedure TFLIQMENU.RecepcionValesClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQRECVALE,FLIQRECVALE);
  try
    try
      FLIQRECVALE.PreparaForma;
      FLIQRECVALE.ShowModal;
    except
      on e:Exception do MensajeInfo(e.Message);
    end;
  finally
    FLIQRECVALE.Free;
  end;
end;

procedure TFLIQMENU.ReporteFacturasCuponesDetalladoClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP44P,FLIQREP44P);
  try
    FLIQREP44P.ShowModal;
  finally
    FLIQREP44P.Free;
  end;
end;

procedure TFLIQMENU.ReporteDescuentosClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP45P,FLIQREP45P);
  try
    FLIQREP45P.ShowModal;
  finally
    FLIQREP45P.Free;
  end;
end;

procedure TFLIQMENU.ResumendeLiquidacionesCosto1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP13P,FLIQREP13P);
  try
    FLIQREP13P.ShowModal;
  finally
    FLIQREP13P.Free;
  end;
end;

procedure TFLIQMENU.ReporteAuxiliardeLiquidaciones1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP18P,FLIQREP18P);
  try
    FLIQREP18P.ShowModal;
  finally
    FLIQREP18P.Free;
  end;
end;

end.
