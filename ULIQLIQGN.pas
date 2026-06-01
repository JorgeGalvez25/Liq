unit ULIQLIQGN;

interface

uses Variants, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,
  Mask,db,dbtables, DDMGEN, ImgList, DBActns, ActnList, cxControls,
  cxContainer, cxEdit, cxLabel, dxGDIPlusClasses, Master_Intf,DDM_KIOS,
  DDMServicios, ServiciosTiempoAireRO_Intf;

type
  TFLIQLIQGN = class(TForm)
    MainMenu1: TMainMenu;
    Editar1: TMenuItem;                                                                                                                                  
    Cancelar1: TMenuItem;
    Guardar1: TMenuItem;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    InsertarRengln1: TMenuItem;
    BorrarRengln1: TMenuItem;
    CancelarCambios1: TMenuItem;
    N1: TMenuItem;
    Salir2: TMenuItem;
    N2: TMenuItem;
    ActionList1: TActionList;
    Inicio22: TMenuItem;
    Fin22: TMenuItem;
    PopupMenu2: TPopupMenu;
    InsertarRenglon2: TMenuItem;
    EliminarRenglon2: TMenuItem;
    CancelarCambios2: TMenuItem;
    MenuItem4: TMenuItem;
    Inicio3: TMenuItem;
    Fin3: TMenuItem;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetCancel1: TDataSetCancel;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetInsert2: TDataSetInsert;
    DataSetDelete2: TDataSetDelete;
    DataSetCancel2: TDataSetCancel;
    DataSetFirst2: TDataSetFirst;
    DataSetLast2: TDataSetLast;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    BbGuardar: TBitBtn;
    BbCancelar: TBitBtn;
    BbSalir: TBitBtn;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    DataSetInsert3: TDataSetInsert;
    DataSetDelete3: TDataSetDelete;
    DataSetCancel3: TDataSetCancel;
    DataSetFirst3: TDataSetFirst;
    DataSetLast3: TDataSetLast;
    QL_Desp: TQuery;
    QL_DespCLAVE: TIntegerField;
    QL_DespNOMBRE: TStringField;
    DSQL_Desp: TDataSource;
    QL_DespCTACNT: TStringField;
    QL_DespESTACION: TIntegerField;
    DBText5: TDBText;
    Bevel1: TBevel;
    Panel2: TPanel;
    N3: TMenuItem;
    DesglosedeDocumentos1: TMenuItem;
    QL_Liqg: TQuery;
    QL_LiqgLIQUIDACIONES: TIntegerField;
    ActualizarTiposdePago1: TMenuItem;
    Panel3: TPanel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel6: TPanel;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    N4: TMenuItem;
    CargarPagosdeCupones1: TMenuItem;
    CargarPagosdeTarjetas1: TMenuItem;
    QL_Dtur2: TQuery;
    QL_Dtur2ESTACION: TIntegerField;
    QL_Dtur2FECHA: TDateTimeField;
    QL_Dtur2TURNO: TIntegerField;
    QL_Dtur2ISLA: TIntegerField;
    QL_Dtur2POSCARGA: TIntegerField;
    QL_Dtur2COMBUSTIBLE: TIntegerField;
    QL_Dtur2INICIAL_LITROS: TFloatField;
    QL_Dtur2FINAL_LITROS: TFloatField;
    QL_Dtur2TOTALLITROS: TFloatField;
    CargarPagosdeVales1: TMenuItem;
    QL_Turnd: TQuery;
    QL_TurndFECHA: TDateTimeField;
    QL_TurndTURNO: TIntegerField;
    QL_TurndPOSCARGA: TIntegerField;
    QL_TurndTOTAL01: TFloatField;
    QL_TurndTOTAL02: TFloatField;
    QL_Bomb2: TQuery;
    QL_Bomb2MANGUERA: TIntegerField;
    QL_Bomb2POSCARGA: TIntegerField;
    QL_Bomb2COMBUSTIBLE: TIntegerField;
    QL_Bomb2ISLA: TIntegerField;
    QL_Bomb2CON_PRECIO: TIntegerField;
    QL_Bomb2CON_POSICION: TIntegerField;
    QL_Bomb2CON_DIGITOAJUSTE: TIntegerField;
    QL_Bomb2IMPRESORA: TIntegerField;
    QL_Bomb2ACTIVO: TStringField;
    QL_Bomb2IMPRIMEAUTOM: TStringField;
    PopupMenu4: TPopupMenu;
    CalcularResumenCombustible1: TMenuItem;
    N5: TMenuItem;
    CargarProductos1: TMenuItem;
    QL_Prod: TQuery;
    QL_ProdCLAVE: TIntegerField;
    DesglosedeEfectivo1: TMenuItem;
    Panel7: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    QL_TurndTOTAL03: TFloatField;
    QL_TurndTOTAL04: TFloatField;
    QL_Bomb2CAMPOLECTURA: TStringField;
    DesglosedePagosconCheques1: TMenuItem;
    QL_Isla: TQuery;
    QL_IslaISLA: TIntegerField;
    QL_Cupo: TQuery;
    QL_CupoIMPORTE: TFloatField;
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
    QL_TranFACTURADO: TStringField;
    QL_TranESTACIONFAC: TIntegerField;
    QL_TranSERIEFAC: TStringField;
    QL_TranFOLIOFAC: TIntegerField;
    QL_TranENLINEA: TStringField;
    QL_TranFOLIOFUERALINEA: TIntegerField;
    QL_TranMODOCARGA: TStringField;
    QL_TranFECHAFACTURA: TDateTimeField;
    QL_TranSUBCODIGO: TIntegerField;
    QL_TranFOLIOVOLUMETRICO: TIntegerField;
    QL_TranESTADOCUENTA: TIntegerField;
    QL_TranIMPRESO: TStringField;
    QL_TranCHOFER: TIntegerField;
    QL_TranTIPOPAGO: TIntegerField;
    QL_TranGRUPO: TIntegerField;
    QL_TranID_PREAUTORIZACION: TIntegerField;
    QL_TranBITACORA: TStringField;
    Q_Clie: TQuery;
    QL_TranUpdate: TUpdateSQL;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    LFuncion: TLabel;
    ImgRef2008: TImage;
    GroupBox1: TGroupBox;
    DBGrid4: TDBGrid;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Label12: TLabel;
    DBText9: TDBText;
    Lbl2Ref2008: TcxLabel;
    Lbl3Ref2008: TcxLabel;
    Lbl1Ref2008: TcxLabel;
    GroupBox3: TGroupBox;
    DBGrid5: TDBGrid;
    TabSheet5: TTabSheet;
    DBGrid6: TDBGrid;
    QL_ProdESTACION: TIntegerField;
    procedure Salir1Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GroupBox2Enter(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure InsertarRenglon2Click(Sender: TObject);
    procedure EliminarRenglon2Click(Sender: TObject);
    procedure CancelarCambios2Click(Sender: TObject);
    procedure Inicio2Click(Sender: TObject);
    procedure Inicio3Click(Sender: TObject);
    procedure Fin2Click(Sender: TObject);
    procedure Fin3Click(Sender: TObject);
    procedure DBGrid3Exit(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DataSetDelete2Execute(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure QL_DespFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure DesglosedeDocumentos1Click(Sender: TObject);
    procedure ActualizarTiposdePago1Click(Sender: TObject);
    procedure Panel3Enter(Sender: TObject);
    procedure CargarPagosdeCupones1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CargarProductos1Click(Sender: TObject);
    procedure Panel3Exit(Sender: TObject);
    procedure DesglosedeEfectivo1Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure Panel6Exit(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DesglosedePagosconCheques1Click(Sender: TObject);
  private
    { Private declarations }
    SwNuevo:Boolean;
    procedure SubModuloRef2008(xactivo: Boolean);
    procedure ChecaFechaInicio(xactivo: Boolean);
    procedure CalculaIEPS;
    function productoTiempoAire: Integer;
    function ObtenerVentasTAFecha(fecha: TDateTime; pVenta: Integer): ListaVentaRO;
    function ObtenerCantVentasTA(fecha: TDateTime; pVenta: Integer): Integer;
    function ObtenerMontoVentasTA(fecha: TDateTime; pVenta, est, turno, isla: Integer): Double;
    function ValidaEstatusLiq:Boolean;
    procedure PreparaTurno(swFecha:TDateTime);
    procedure GuardaTurno;
    procedure CerrarTurno;
    function VerificaTurno(swFecha:TDateTime; swTurno:Integer):Boolean;
    procedure HacerAjusteAutomatico(swFecha:TDateTime);
    procedure ValidarCupones;
    procedure DuplicaVtasTInteligente;
    procedure pagoNegativoTInte;
    procedure VerificaFDeposito;
    function ImporteSobrePrecios:Double;
    function ObtenerVentasTAGasoPay(xEstacion:Integer;xFechaTurno:TDateTime;xTurno:Integer;xIsla:Integer):Double;
    procedure CalculaVentasConsignacion;

  public
    { Public declarations }
    procedure CalculaDiferenciaLectura;
    Procedure PreparaForma(xNuevo:Boolean);
    Procedure SetAltaDocu;
    Procedure SetModificaDocu;
    Procedure EliminaCaptura;
  end;

var
  FLIQLIQGN :TFLIQLIQGN;
  ImporteTajetaBancaria : Double;
  ClaveTarjetaBancaria  : Integer;
  xMontoTarjetaPuntos   : Double;
  xClavePagoPtos        : Integer;
  acumEzzyGas:Double;


implementation

uses ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMGENQ,DDMLIQ, ULIQLIQG, DDMGAS,
  DDMGASQ, UGASPRODB, ULIQDESGLO, ULIQDTPAG, DDMCONS, ULIQDLIQE, DDMCUP,
  Math, UAutoriza, ULIQLIQGNPC, DDMPVG, DDMAJUS, DDM_PUNTOS;

{$R *.DFM}

Procedure TFLIQLIQGN.EliminaCaptura;
begin
  with DMGEN,DMLIQ,DMGAS do begin
    try
      if T_Liqg.State=dsInsert then begin
        T_Liqg.cancel;
        CancelaUpdates(DBGAS2,T_Liqg);
      end
      else if T_Liqg.State=dsEdit then begin
        if SwNuevo then begin
          try
            T_Liqg.cancel;
            T_Liqg.delete;
            AplicaUpdates(DBGAS2,T_Liqg);
            RefrescaDataBase(DBGAS2);
          except
            on e:Exception do begin
              MensajeErr(e.Message);
            end;
          end;
        end
        else begin
          T_Liqg.cancel;
          CancelaUpdates(DBGAS2,T_Liqg);
          IniciaUpdates(DBGAS2,T_Liqg);
          T_Liqg.Edit;
          T_LiqgAplicado.AsString:='Si';
          T_Liqg.Post;
          AplicaUpdates(DBGAS2,T_Liqg);
        end;
      end;
      CancelaDocAccion;
    except
      on e:Exception do begin
        MensajeErr(e.Message);
        Exit;
      end;
    end;
  end;
end;

Procedure TFLIQLIQGN.SetAltaDocu;
begin
  with DMGEN,DMLIQ,DMGASQ,DMGAS do begin
    if T_Liqg.State<>dsBrowse then
      raise Exception.Create('Error en Captura: SetAltaDocu');
    try
      IniciaDocAccion(idLiqg,'',AccNuevo);
      IniciaUpdates(DBGAS2,T_Liqg);
      T_Liqg.insert;
      if DMCUP.SwSubModuloCupReformas2008 then
        ChecaFechaInicio(DMCUP.SwCalculaIEPS);
      BbGuardar.Enabled:=false;
      BbCancelar.Enabled:=false;                          
      Guardar1.Enabled:=false;
      Cancelar1.Enabled:=false;
      DBGrid1.DataSource:=nil;
      DBGrid2.DataSource:=nil;
      DBGrid3.DataSource:=nil;
    except
      ErrorMsg:='Liquidación '+IntToClaveDocu(T_LiqgFolio.AsInteger,idLiqg)+' ya existe';
      FLIQLIQGN.Close;
    end;
  end;
end;

procedure TFLIQLIQGN.SetModificaDocu;
var swerr,
    swcargaautom,
    swpago1,
    swpago2,
    swpago3,
    swpago4,
    swpago5,
    swpago6,
    SwPagoFeria:boolean;
    //xposant,
    xp,i,xt, xcont, xindice:integer;
    xtotal:real;
    xtippago:Integer;
    _ListaLiqAceiteKiosco:TListaLiquidacionAceites;
    _LiqAceiteKiosco:TLiquidacionAceite;
    _Kiosco:Integer;
    _ListaAcumTipoPago:TListaAcumTipoPago;
    _ListaAcumTipoPagoCheq:TListaAcumTipoPagoCheq;
    _AcumTipoPago:TAcumTipoPago;
    _totalCuponesFeria:double;
    _CampoLectura:String;
    AConexion:Boolean;
    AJarreos: Double;
    AImporte: Double;
    claveProdTA, cantVentasTA : Integer;
    ventasTA : ListaVentaRO;
    pVenta : Integer;
    montoVentaTA: Double;
    conexion:Boolean;
    totalPromo: Double;
    swValorOriginal:Boolean;
    Despachador:TDespachador;
    xTieneTiposPagoKiosko:Boolean;

    pListaTransacciones:TListaTransaccionGas;
    xcontTran:Integer;

    Msj:string;
    _ErrorActualizacion:TStringList;


    xTipoPagoIgasEzzyGas:Integer;
    real1:Double;
    LecturaActual:Double;

    function CalculaDevolucionesLecturas(xMang:Integer):Real;
    begin
      with DMGAS, DMLIQ do begin
        try
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('SELECT coalesce(DEVOLUCION,0) as Real1 FROM DGASDLEC');
          Q_Auxi.SQL.Add('WHERE ESTACION='+IntToStr(T_LiqgESTACION.AsInteger));
          Q_Auxi.SQL.Add('  AND FECHA='+QuotedStr(FechaToStrSQL(T_LiqgFECHA.AsDateTime)));
          Q_Auxi.SQL.Add('  AND TURNO='+IntToStr(T_LiqgTURNO.AsInteger));
          Q_Auxi.SQL.Add('  AND MANGUERA='+IntToStr(xMang));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          Result:=Q_AuxiReal1.AsFloat;
        finally
          Q_Auxi.Close;
        end;
      end;
    end;

    function TieneTiposPagoKiosko:Boolean;
    begin
      Result := False;
      with DMGAS do begin
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('SELECT COUNT(*) AS ENTERO1 FROM DGASTPAG WHERE TP_KIOSKO IS NOT NULL');
        Q_Auxi.Prepare;
        Q_Auxi.Open;

        Result := Q_AuxiEntero1.AsInteger > 0;
      end;
    end;

    function ObtieneTipoPagoLiquidaciones(xTipoPagoKiosko:Integer; xEsCombustible:Boolean):Integer;
    var xNot:string;
    begin
      Result := 0;
      xNot := EmptyStr;

      if xEsCombustible then xNot := 'NOT';

      with DMGAS do begin
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('SELECT FIRST 1 CAST(CLAVE AS INTEGER) AS ENTERO1 FROM DGASTPAG WHERE TP_KIOSKO=:TP_KIOSKO AND CLASE '+xNot+' IN(''Efectivo Aceites'',''Cupón Aceites'',''Tarjeta Prepago Aceites'',''Tarjeta Crédito Aceites'',''Vale de Crédito Aceites'')');
        Q_Auxi.ParamByName('TP_KIOSKO').AsInteger := xTipoPagoKiosko;
        Q_Auxi.Prepare;
        Q_Auxi.Open;

        if Q_Auxi.RecordCount > 0 then
          Result := Q_AuxiEntero1.AsInteger;
      end;
    end;
begin
  XMontoTarjetaPuntos:=0;
  xClavePagoPtos:=40;
  with DMLIQ,DMGEN,DMGAS do begin
    swerr:=false;
    if SwNuevo then begin
      if T_Liqg.State<>dsInsert then begin
        if T_Liqg.State<>dsEdit then
          raise Exception.Create('Error en Captura: SetModificaDocu')
        else exit;
      end;
    end;
    T_Dliqp.DisableControls;
    T_Dliqa.DisableControls;
    T_Dliqp.DisableControls;
    try
      calculandoLiq:=true;
      try
        if SwNuevo then begin
          if (DMGAS.SwServiciosMaster) and (DMGEN.QT_EmprSERIEKEY.AsInteger=637) then begin
            try
              Despachador:=GetDespachadorTurno(T_LiqgFECHA.AsDateTime,T_LiqgTURNO.AsInteger,T_LiqgISLA.AsInteger);
              if QL_Desp.Locate('Clave',Despachador.Clave,[]) then
                T_LiqgDESPACHADOR.AsInteger:=Despachador.Clave;
            except
            end;
          end;

          T_LiqgDespachador.AsInteger:=QL_DespClave.AsInteger;
          T_Liqg.Post;

          AplicaUpdates(DBGAS2,T_Liqg);
          ActualizaDocAccion(T_LiqgLiquidacionStr.AsString);

          QL_Liqg.Close;
          QL_Liqg.ParamByName('pestacion').AsInteger:=T_LiqgEstacion.AsInteger;
          QL_Liqg.ParamByName('pisla').AsInteger:=T_LiqgIsla.AsInteger;
          QL_Liqg.Prepare;
          QL_Liqg.Open;

          if VarGasRestringirLiquidaciones='Si' then begin
            DBGrid2.Columns[2].ReadOnly:=QL_LiqgLiquidaciones.AsInteger>0;
            T_DliqcLec_Ant.ReadOnly:=QL_LiqgLiquidaciones.AsInteger>0;
          end
          else begin
            DBGrid2.Columns[2].ReadOnly:=false;
            T_DliqcLec_Ant.ReadOnly:=false;
          end;
        end
        else begin
          IniciaUpdates(DBGAS2,T_Liqg);
          T_Liqg.Edit;
          T_LiqgAplicado.AsString:='No';
          T_Liqg.Post;
          AplicaUpdates(DBGAS2,T_Liqg);

          if VarGasRestringirLiquidaciones='Si' then begin
            DBGrid2.Columns[2].ReadOnly:=true;
            T_DliqcLec_Ant.ReadOnly:=true;
          end
          else begin
            DBGrid2.Columns[2].ReadOnly:=false;
            T_DliqcLec_Ant.ReadOnly:=false;
          end;

          CalculaResumenCombustible;
        end;

        RefrescaDataBase(DBGAS2);
        T_Liqg.Refresh;
        T_Dliqc.Active:=true;                                           
        T_Dliqc.Refresh;
        IniciaUpdates(DBGAS2,T_Liqg);
        T_Liqg.edit;
        // Carga lecturas finales
        if SwNuevo then begin
          swcargaautom:=false;

          if (SwLiqAutom) then begin
            QL_Dtur2.Active:=false;
            QL_Dtur2.ParamByName('pestacion').AsInteger:=T_LiqgEstacion.AsInteger;
            QL_Dtur2.ParamByName('pfecha').AsDateTime:=T_LiqgFecha.AsDateTime;
            QL_Dtur2.ParamByName('pturno').AsInteger:=T_LiqgTurno.AsInteger;
            QL_Dtur2.ParamByName('pisla').AsInteger:=T_LiqgIsla.AsInteger;
            QL_Dtur2.Active:=true;

            if (VarGasLiquidarConLecturasDeTurnosAdministrativos) then begin
              with DMCONS.QL_Bomb do begin
                if not Active then begin
                  Close;
                  Open;
                end;
              end;
            end;

            T_Dliqc.First;
            while not T_Dliqc.Eof do begin
              if QL_Dtur2.Locate('PosCarga;Combustible', VarArrayOf([T_DliqcPosCarga.AsInteger,T_DliqcCombustible.AsInteger]),[]) then begin
                try
                  swcargaautom:=true;
                  T_Dliqc.Edit;

                  T_DliqcDEVOLUCION.AsFloat:=CalculaDevolucionesLecturas(T_DliqcBOMBA.AsInteger);
                  if T_DliqcDEVOLUCION.AsFloat<=0 then
                  	T_DliqcDEVOLUCION.AsFloat:=DMCONS.JarreoTurno(T_DliqcFECHA.AsDateTime,T_DliqcTURNO.AsInteger,T_DliqcPosCarga.AsInteger, T_DliqcCOMBUSTIBLE.AsInteger,T_DliqcBOMBA.AsInteger );
                    //Se añade una validación para tomar las lecturas desde la
                    //base de datos de consola ya que el punto de venta alteraba
                    //las lecturas finales de las bombas
                    if(VarGasLiquidarConLecturasDeTurnosAdministrativos) then begin

                      if DMCONS.QL_Bomb.Locate('PosCarga;Manguera',VarArrayOf([T_DliqcPosCarga.AsInteger,T_DliqcBOMBA.AsInteger]),[]) then begin
                        _CampoLectura := DMCONS.QL_BombCAMPOLECTURA.AsString;
                        if Trim(_CampoLectura)='' then
                          _CampoLectura:='TOTAL'+IntToClaveNum(DMCONS.QL_BombCOMBUSTIBLE.AsInteger,2);
                      end;

                      DMCONS.Q_Auxi.Close;
                      DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
                      DMCONS.Q_Auxi.SQL.Clear;
                      DMCONS.Q_Auxi.SQL.Add('select ' + _CampoLectura +  ' as Real1');
                      DMCONS.Q_Auxi.SQL.Add('from DPVGTURND');
                      DMCONS.Q_Auxi.SQL.Add('where');
                      DMCONS.Q_Auxi.SQL.Add('fecha = :PFECHA');
                      DMCONS.Q_Auxi.SQL.Add('and turno = :PTURNO');
                      DMCONS.Q_Auxi.SQL.Add('and poscarga = :PPOSCARGA');
                      DMCONS.Q_Auxi.ParamByName('PFECHA').AsDateTime := T_DLiqcFECHA.AsDateTime;
                      DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_DLiqcTURNO.AsInteger;
                      DMCONS.Q_Auxi.ParamByName('PPOSCARGA').AsInteger := T_DliqcPosCarga.AsInteger;
                      DMCONS.Q_Auxi.Prepare;
                      DMCONS.Q_Auxi.Open;

                      //Quita decimales
                      if (VarGasQuitarDecimalesEnCapturaLecturaFinalLiq='Si')
                      then T_DliqcLec_Act.AsFloat:=AjustaFloat(DMCONS.Q_AuxiReal1.AsFloat,0)
                      else T_DliqcLec_Act.AsFloat:=DMCONS.Q_AuxiReal1.AsFloat;

                    end else begin
                      //QUITAR DECIMALES
                      if (VarGasQuitarDecimalesEnCapturaLecturaFinalLiq='Si')
                      then T_DliqcLec_Act.AsFloat:=AjustaFloat(QL_Dtur2Final_Litros.AsFloat,0)
                      else T_DliqcLec_Act.AsFloat:=QL_Dtur2Final_Litros.AsFloat;
                    end;
                  CalculaVentasConsignacion;
                  CalculaDiferenciaLectura;
                  T_Dliqc.Post;
                except
                  if (T_Dliqc.State=dsEdit) then T_Dliqc.Cancel;
                end;
              end;
              T_Dliqc.Next;
            end;
          end;
          // Fin lect
          if not swcargaautom then with DMCONS do begin
            if not DMGAS.SwServiciosMaster then begin
              if (AliasConsolaEsts<>'')and(DBGASCON.Connected) then begin // hay volumetrico
                QL_Bomb.Active:=true;
                try
                  QL_Turnd.Active:=false;
                  QL_Turnd.ParamByName('pfecha').AsDateTime:=T_LiqgFecha.AsDateTime;
                  QL_Turnd.ParamByName('pturno').AsInteger:=T_LiqgTurno.AsInteger;
                  QL_Turnd.Active:=true;

                  T_Dliqc.First;
                  while not T_Dliqc.Eof do begin
                    if QL_Turnd.Locate('PosCarga',T_DliqcPosCarga.AsInteger,[]) then begin
                      xtotal:=0;
                      if QL_Bomb.Locate('PosCarga;Manguera',VarArrayOf([QL_TurndPOSCARGA.AsInteger,T_DliqcBOMBA.AsInteger]),[]) then begin
                        _CampoLectura := QL_BombCAMPOLECTURA.AsString;
                        if Trim(_CampoLectura)='' then
                          _CampoLectura:='TOTAL'+IntToClaveNum(QL_BombCOMBUSTIBLE.AsInteger,2);
                        xtotal:=QL_Turnd.FieldByName(_CampoLectura).AsFloat;
                      end
                      else begin
                        xtotal:=QL_TurndTotal01.AsFloat;
                        QL_Bomb.First;
                        while (not QL_Bomb.Eof)and(QL_BombPosCarga.AsInteger<>T_DliqcPosCarga.AsInteger) do
                          QL_Bomb.Next;
                        if (QL_BombPosCarga.AsInteger=T_DliqcPosCarga.AsInteger)and(QL_BombCombustible.AsInteger<>T_DliqcCombustible.AsInteger) then
                          xtotal:=QL_TurndTotal02.AsFloat;
                      end;
                      //CAMBIO PARA TOTALIZAR DISPENSARIOS Y EVITAR LECTURAS INICIALES
                      for i := 1 to Length(IntToStr(DMCONS.LimiteLectura)) do begin
                        if (StrToInt(Copy(IntToStr(DMCONS.LimiteLectura),1,1))<=0) or ((i>1) and (StrToInt(Copy(IntToStr(DMCONS.LimiteLectura),i,1))<>0))  then begin
                          MensajeWarn('Variable volumétricos "LimiteLectura" contiene un valor que puede afectar a la generación correcta de la liquidación.'+#13+
                          'Si no se sabe el límite del dispensario se recomienda el valor por default "1000000000".');
                          Break;
                        end;
                      end;
                      if DMCONS.LimiteLectura < T_DliqcLEC_ANT.AsFloat then begin
                        T_Dliqc.Edit;
                        T_DliqcLEC_ANT.AsFloat := T_DliqcLEC_ANT.AsFloat - DMCONS.LimiteLectura;
                      end;
                      //FIN LECTURAS INICIALES
                      //CAMBIO PARA TOTALIZAR DISPENSARIOS Y EVITAR LECTURAS FINALES
                      DMCONS.Q_Auxi.Close;
                      DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
                      DMCONS.Q_Auxi.SQL.Clear;
                      DMCONS.Q_Auxi.SQL.Add('select sum(volumen) as Real1');
                      DMCONS.Q_Auxi.SQL.Add('from dpvgmovi');
                      DMCONS.Q_Auxi.SQL.Add('where');
                      DMCONS.Q_Auxi.SQL.Add('fecha = :PFECHA');
                      DMCONS.Q_Auxi.SQL.Add('and combustible = :PCOMBUSTIBLE');
                      DMCONS.Q_Auxi.SQL.Add('and poscarga = :PPOSCARGA');
                      DMCONS.Q_Auxi.SQL.Add('and turno = :PTURNO');
                      DMCONS.Q_Auxi.ParamByName('PFECHA').AsDateTime := T_LiqgFECHA.AsDateTime;
                      DMCONS.Q_Auxi.ParamByName('PCOMBUSTIBLE').AsInteger := T_DliqcCOMBUSTIBLE.AsInteger;
                      DMCONS.Q_Auxi.ParamByName('PPOSCARGA').AsInteger := T_DliqcPosCarga.AsInteger;
                      DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_LiqgTURNO.AsInteger;
                      DMCONS.Q_Auxi.Prepare;
                      DMCONS.Q_Auxi.Open;
                      if (T_DliqcLEC_ANT.AsFloat + DMCONS.Q_AuxiReal1.AsFloat)>=DMCONS.LimiteLectura then
                        xtotal := xtotal + DMCONS.LimiteLectura;
                      DMCONS.Q_Auxi.Close;
                      //FIN LECTURAS FINALES
                      if (xtotal>0.01) then begin
                        try
                          T_Dliqc.Edit;

                          //QUITAR DECIMALES
                          if (VarGasQuitarDecimalesEnCapturaLecturaFinalLiq='Si')
                          then T_DliqcLec_Act.AsFloat:=AjustaFloat(xtotal,0)
                          else T_DliqcLec_Act.AsFloat:=xtotal;

                          //DEVOLUCION
                          swValorOriginal:=DBGrid1.Columns[6].ReadOnly;
                          if not swValorOriginal then
                            swValorOriginal:=T_DliqcDEVOLUCION.ReadOnly;

                          if swValorOriginal then begin
                            DBGrid1.Columns[6].ReadOnly:=False;
                            T_DliqcDEVOLUCION.ReadOnly:=False;
                          end;

                          T_DliqcDEVOLUCION.AsFloat:=CalculaDevolucionesLecturas(T_DliqcBOMBA.AsInteger);
                          if T_DliqcDEVOLUCION.AsFloat<=0 then
                            T_DliqcDEVOLUCION.AsFloat:=JarreoTurno(T_DliqcFECHA.AsDateTime,T_DliqcTURNO.AsInteger,T_DliqcPosCarga.AsInteger, T_DliqcCOMBUSTIBLE.AsInteger,T_DliqcBOMBA.AsInteger );

                          //IMPORTE SOBRE PRECIO
                          T_DliqcIMPORTE_SP.AsFloat:=AjustaFloat(ImporteSobrePrecios,2);
                          CalculaVentasConsignacion;
                          CalculaDiferenciaLectura;
                          T_Dliqc.Post;

                          if swValorOriginal then begin
                            DBGrid1.Columns[6].ReadOnly:=True;
                            T_DliqcDEVOLUCION.ReadOnly:=True;
                          end;

                        except
                          on e:exception do begin
                            if T_Dliqc.State=dsEdit then
                              T_Dliqc.Cancel;
                            raise Exception.Create(e.Message);
                          end;
                        end;
                      end;
                    end;
                    T_Dliqc.Next;
                  end;
                finally
                  QL_Bomb.Active:=false;
                  QL_Turnd.Active:=false;
                end;
              end;
            end
            else begin
              try
                DMCONS.LimiteLectura := StrToInt64Def(GetValorVariableConsola('LimiteLectura'),1000000000);

                for i := 1 to Length(IntToStr(DMCONS.LimiteLectura)) do begin
                  if (StrToInt(Copy(IntToStr(DMCONS.LimiteLectura),1,1))<=0) or ((i>1) and (StrToInt(Copy(IntToStr(DMCONS.LimiteLectura),i,1))<>0))  then begin
                    MensajeWarn('Variable volumétricos "LimiteLectura" contiene un valor que puede afectar a la generación correcta de la liquidación.'+#13+
                    'Si no se sabe el límite del dispensario se recomienda el valor por default "1000000000".');
                    Break;
                  end;
                end;

              T_Dliqc.First;
                while not T_Dliqc.Eof do begin
                  try
                    xtotal:=0;
                    xtotal:=GetLecturasPosicion(T_DliqcCOMBUSTIBLE.AsInteger,T_DliqcBOMBA.AsInteger,T_DliqcPosCarga.AsInteger,T_LiqgTURNO.AsInteger,T_LiqgFECHA.AsDateTime);
                        //NOTA: Debido al manejo de un cuarto combustible,
                        //se optó por realizar la búsqueda de la lectura a través de la clave
                        //de la manguera. Ya que el combustible cuatro es agrupado con
                        //otro combustible y no es posible obtener el campo lectura
                        //en el cual se almacenó el movimiento originalmente.
                    GetJarreosTurno(T_LiqgFECHA.AsDateTime, T_LiqgTURNO.AsInteger, T_DliqcPosCarga.AsInteger, T_DliqcCOMBUSTIBLE.AsInteger, T_DliqcBOMBA.AsInteger, AJarreos, AImporte);
                  except
                    on e:Exception do
                      raise Exception.Create(e.Message);
                  end;
                  //CAMBIO PARA TOTALIZAR DISPENSARIOS LECTURAS INICIALES
                  if DMCONS.LimiteLectura < T_DliqcLEC_ANT.AsFloat then begin
                    T_Dliqc.Edit;
                    T_DliqcLEC_ANT.AsFloat := T_DliqcLEC_ANT.AsFloat - DMCONS.LimiteLectura;
                  end;
                  //FIN LECTURAS INICIALES
                  //CAMBIO PARA TOTALIZAR DISPENSARIOS LECTURAS FINALES
                  DMCONS.Q_Auxi.Close;
                  DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
                  DMCONS.Q_Auxi.SQL.Clear;
                  DMCONS.Q_Auxi.SQL.Add('select sum(volumen) as Real1');
                  DMCONS.Q_Auxi.SQL.Add('from dpvgmovi');
                  DMCONS.Q_Auxi.SQL.Add('where');
                  DMCONS.Q_Auxi.SQL.Add('fecha = :PFECHA');
                  DMCONS.Q_Auxi.SQL.Add('and combustible = :PCOMBUSTIBLE');
                  DMCONS.Q_Auxi.SQL.Add('and poscarga = :PPOSCARGA');
                  DMCONS.Q_Auxi.SQL.Add('and turno = :PTURNO');
                  DMCONS.Q_Auxi.ParamByName('PFECHA').AsDateTime := T_LiqgFECHA.AsDateTime;
                  DMCONS.Q_Auxi.ParamByName('PCOMBUSTIBLE').AsInteger := T_DliqcCOMBUSTIBLE.AsInteger;
                  DMCONS.Q_Auxi.ParamByName('PPOSCARGA').AsInteger := T_DliqcPosCarga.AsInteger;
                  DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_LiqgTURNO.AsInteger;
                  DMCONS.Q_Auxi.Prepare;
                  DMCONS.Q_Auxi.Open;

                  if (T_DliqcLEC_ANT.AsFloat + DMCONS.Q_AuxiReal1.AsFloat)>=DMCONS.LimiteLectura then
                    xtotal := xtotal + DMCONS.LimiteLectura;

                  DMCONS.Q_Auxi.Close;

                  //FIN LECTURAS FINALES
                  if (xtotal>0.01) then begin
                    try
                      T_Dliqc.Edit;
                      //QUITAR DECIMALES
                    if (VarGasQuitarDecimalesEnCapturaLecturaFinalLiq='Si')
                    then T_DliqcLec_Act.AsFloat:=AjustaFloat(xtotal,0)
                    else T_DliqcLec_Act.AsFloat:=xtotal;

                      swValorOriginal:=T_DliqcDEVOLUCION.ReadOnly;

                      if swValorOriginal then begin
                        DBGrid1.Columns[6].ReadOnly:=False;
                        T_DliqcDEVOLUCION.ReadOnly:=False;
                      end;

                      if (AJarreos>0)
                      then T_DliqcDEVOLUCION.AsFloat:=AJarreos
                      else T_DliqcDEVOLUCION.AsFloat:=CalculaDevolucionesLecturas(T_DliqcBOMBA.AsInteger);

                      if swValorOriginal then begin
                        DBGrid1.Columns[6].ReadOnly:=True;
                        T_DliqcDEVOLUCION.ReadOnly:=True;
                      end;

                    //IMPORTE SOBRE PRECIO
                      T_DliqcIMPORTE_SP.AsFloat:=AjustaFloat(ImporteSobrePrecios,2);
                      CalculaVentasConsignacion;
                      CalculaDiferenciaLectura;
                      T_Dliqc.Post;
                    except
                      on e:Exception do begin
                      if (T_Dliqc.State=dsEdit) then T_Dliqc.Cancel;
                        raise Exception.Create(e.Message);
                      end;
                    end;
                  end;


                  T_Dliqc.Next;
                end;
              finally
                xtotal:=0;
              end;
              T_DliqCp.Active:=True;
            end;
          end;
        end;
// Carga Pagos
        swpago1:=false; swpago2:=false; swpago3:=false; swpago4:=false; swpago5:=false; swpago6:=false; SwPagoFeria:=False;
        T_Dliqp.First;
        while (not T_Dliqp.Eof)and((not swpago1)or(not swpago2)or(not swpago3)or(not swpago4)or(not swpago5)or(not swpago6)) do begin
          if (T_DliqpCLAVE_PAGO.AsString=VarGasTPagoTI) and (T_DliqpClasePago.AsString='Otros') then
            pagoNegativoTInte;
          if (T_DliqpClasePago.AsString=idClaseCupones)and(SwNuevo) then begin
            Q_Auxi.Active:=false;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASRCUP');
            Q_Auxi.SQL.Add('where estacion='+IntToStr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and caja='+IntToStr(T_LiqgCaja.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turno='+IntToStr(T_LiqgTurno.asinteger));
            Q_Auxi.SQL.Add('  and Isla_pvg='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:= real1;
            T_Dliqp.Post;
            swpago1:=true;
          end;
          if ((T_DliqpClasePago.AsString=idClaseTarjIntCre)or
             (T_DliqpClasePago.AsString=idClaseTarjeta))and(SwNuevo)  then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
            Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
            Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('  and estatus="A"');
            Q_Auxi.SQL.Add('  and Cliente in (Select NoClie from DGASSALD where TipoTarjeta="CR")');
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:= real1;
            T_Dliqp.Post;
            swpago2:=true;
          end;
          if (T_DliqpClasePago.AsString=idClaseTarjIntPre) and (SwNuevo)then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
            Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
            Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('  and estatus="A"');
            Q_Auxi.SQL.Add('  and Cliente in (Select NoClie from DGASSALD where TipoTarjeta="PP")');
            if CteEzzyGas>0 then
              Q_Auxi.SQL.Add('and Cliente<>'+IntToStr(CteEzzyGas));
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:= real1;
            T_Dliqp.Post;
            swpago3:=true;
          end;
          if (T_DliqpClasePago.AsString=idClaseTarjIntME)and(SwNuevo) then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
            Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
            Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('  and estatus="A"');
            Q_Auxi.SQL.Add('  and Cliente in (Select NoClie from DGASSALD where TipoTarjeta="ME")');
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:= real1;
            T_Dliqp.Post;
            swpago5:=true;
          end;

          if (T_DliqpClasePago.AsString=idClaseCredito)and(SwNuevo) then begin
            Q_Auxi.Active:=false;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASVALE');
            Q_Auxi.SQL.Add('where estacion='+IntToStr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and caja='+IntToStr(T_LiqgCaja.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turno='+IntToStr(T_LiqgTurno.asinteger));
            Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('  and FolioVolumetrico > 0');
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:= real1;
            T_Dliqp.Post;
            swpago4:=true;
          end;

          if (T_DliqpClasePago.AsString=idClaseCreditoAceites)and(SwNuevo) then begin
            Q_Auxi.Active:=false;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASVALE');
            Q_Auxi.SQL.Add('where estacion='+IntToStr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and caja='+IntToStr(T_LiqgCaja.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turno='+IntToStr(T_LiqgTurno.asinteger));
            Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('  and FolioVolumetrico is null');
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:= real1;
            T_Dliqp.Post;
            swpago4:=true;
          end;

          if (T_DliqpClasePago.AsString=idClaseEzzygas)and(SwNuevo) then begin
            Q_Auxi.Active:=false;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select coalesce(sum(importe_pagado),0) as real1 from EZZYTRANS');
            Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('and fecha_turno="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('and turno='+inttostr(T_LiqgTurno.asinteger));
            Q_Auxi.SQL.Add('and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('and status=5');  // Estatus 5 significa pagado
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:= real1;
            acumEzzyGas:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Post;
            swpago6:=true;
          end;
          T_Dliqp.Next;
        end;
        // Agregar las venta que se realizan en el KIOSKO
        if (DMGEN.SistemaActivo2(idTablet)) or (DMGEN.SistemaActivo2(idKio)) then begin
          if SwServiciosMaster then begin
            // Carga Aceites y Derivados
            if T_LiqgLIQUIDAGLOBAL.AsString='No' then begin
              if SwNuevo then begin
                _ListaLiqAceiteKiosco:=GetLiquidacionesAceite(T_LiqgESTACION.AsInteger,T_LiqgFECHA.AsDateTime,
                                                              T_LiqgISLA.AsInteger,T_LiqgTURNO.AsInteger,False,AConexion);
                for i:=0 to _ListaLiqAceiteKiosco.Count-1 do begin
                  _LiqAceiteKiosco:=_ListaLiqAceiteKiosco[i];
                  if T_Dliqa.Locate('Estacion;Turno;Producto',VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgTurno.asinteger,_LiqAceiteKiosco.Producto]),[]) then begin
                    T_Dliqa.Edit;
                    T_DliqaSALD_FIN.AsFloat:=T_DliqaSALD_FIN.AsFloat-_LiqAceiteKiosco.Cantidad;
                    T_Dliqa.Post;
                  end
                  else begin
                    try
                      T_Dliqa.Insert;
                      T_DliqaESTACION.AsInteger:=T_LiqgESTACION.AsInteger;
                      T_DliqaFOLIO.AsInteger:=T_LiqgFOLIO.AsInteger;
                      T_DliqaPRODUCTO.AsInteger:=_LiqAceiteKiosco.Producto;
                      T_DliqaISLA.AsInteger:=T_LiqgISLA.AsInteger;
                      T_DliqaFECHA.AsDateTime:=T_LiqgFECHA.AsDateTime;
                      T_DliqaTURNO.AsInteger:=T_LiqgTURNO.AsInteger;
                      T_DliqaENTRADAS.AsFloat:=_LiqAceiteKiosco.Cantidad;
                      T_DliqaSALD_FIN.AsFloat:=0;
                      T_DliqaVENTA.AsFloat:=_LiqAceiteKiosco.Cantidad;
                      T_Dliqa.Post;
                    except
                      T_Dliqa.Cancel;
                    end;
                  end;
                end;
//                if _ListaLiqAceiteKiosco<>nil then
//                  _ListaLiqAceiteKiosco.Free;
              end;
            end;
            // Cargar los Tipos de Pagos de Combustible
            ImporteTajetaBancaria := 0;
            ClaveTarjetaBancaria := 0;
            with DMGAS do begin
              if SwNuevo then begin
                try
                  _Kiosco:=GetKioscoIsla(T_LiqgISLA.AsInteger);
                  if VarGasExportarTipoPago = 'No' then begin
                    _ListaAcumTipoPago:=GetAcumuladosVentasPorTipoPagoLiquidables(T_LiqgFECHA.AsDateTime,_Kiosco,T_LiqgTURNO.AsInteger,'Si');
                    for i:=0 to _ListaAcumTipoPago.Count-1 do begin
                      _AcumTipoPago:=_ListaAcumTipoPago[i];
                      xtippago:=_AcumTipoPago.TipoPagoGas;
                      if _AcumTipoPago.TipoPago = 8 then begin
                        ImporteTajetaBancaria := _AcumTipoPago.Importe;
                        ClaveTarjetaBancaria := _AcumTipoPago.TipoPagoGas;
                      end;
                      if xtippago= 0 then
                        xtippago:=1;
                      if _AcumTipoPago.TipoPago=99 then begin
                        XMontoTarjetaPuntos:= _AcumTipoPago.Importe;
                        xClavePagoPtos:= _AcumTipoPago.TipoPagoGas;
                      end;
  //                    if T_Dliqp.Locate('Estacion;Turno;Clave_pago',VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgTurno.asinteger,IntToClaveNum(xtippago,2)]),[]) then begin
                      if T_Dliqp.Locate('Estacion;Turno;Clave_pago',VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgTurno.asinteger,IntToStr(xtippago)]),[]) then begin
                        if (T_DliqpClasePago.AsString<>'Vale de Crédito') and (T_DliqpClasePago.AsString<>'Cupón') and (T_DliqpClasePago.AsString<>'Tarjeta Prepago')
                         and (T_DliqpClasePago.AsString<>'Tarjeta Crédito') and (T_DliqpClasePago.AsString<>'Ezzygas') then begin
                          T_Dliqp.Edit;
                          T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat+_AcumTipoPago.Importe;
                          T_Dliqp.Post;
                          if xtippago = 98 then begin
                            _ListaAcumTipoPagoCheq :=GetAcumuladosVentasPorTipoPagoCheques(T_LiqgFECHA.AsDateTime, _Kiosco, T_LiqgTURNO.AsInteger);
                            xindice:=0;
                            for xcont := 0 to _ListaAcumTipoPagoCheq.Count-1 do begin
                              if _ListaAcumTipoPagoCheq.Items[xcont].NoClie<>0 then begin
                                try
                                  Inc(xindice);
                                  T_DliqPc.Insert;
                                  T_DliqPcCLAVE_PAGO.AsString :=T_DliqpCLAVE_PAGO.AsString;
                                  T_DliqPcINDICE.AsInteger    :=xindice;
                                  T_DliqPcNOCLIENTE.AsInteger :=_ListaAcumTipoPagoCheq.Items[xcont].NoClie;
                                  T_DliqPcIMPORTE.AsFloat     :=_ListaAcumTipoPagoCheq.Items[xcont].Importe;
                                  T_DliqPc.Post;
                                except
                                  on e:Exception do begin
                                    T_DliqPc.Cancel;
                                    MensajeWarn(e.Message);
                                  end;
                                end;
                              end
                              else
                                MensajeWarn('Se encuentran clientes con clave "0" '+#13+'favor de verificar los datos de pagos con cheques, importe: '+FloatToStr(_ListaAcumTipoPagoCheq.Items[xcont].Importe));
                            end;
                          end;
                        end;
                      end;
                    end;

                    _totalCuponesFeria:=0;

                    //Si _Kiosco es igual a 0 entonces la isla no se encuentra en DGASKIOSCO por lo cual no la usa el kiosco.
                    //De haberse enviado como parametro _Kiosco con valor 0 al método GetTotalFeriaCuponesTurno, master delphi lo hubiera interpretado como una consulta para liquidación global
                    if _Kiosco > 0 then
                      _totalCuponesFeria:=GetTotalFeriaCuponesTurno(T_LiqgESTACION.AsInteger,_Kiosco,T_LiqgFECHA.AsDateTime,T_LiqgTURNO.AsInteger,AConexion);

                    if _totalCuponesFeria>0 then begin
                      T_Dliqp.First;
                      while (not T_Dliqp.Eof)and((not SwPagoFeria)) do begin
                        if (T_DliqpClasePago.AsString=idClaseCuponFeria)and(SwNuevo) then begin
                          T_Dliqp.Edit;
                          try
                            SwLecturaTiposdePagos := True;
                            T_DliqpIMPORTE.ReadOnly := False;
                            T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat+_totalCuponesFeria*-1;
                          finally
                            SwLecturaTiposdePagos := False;
                          end;
                          T_Dliqp.Post;
                          SwPagoFeria:=True;
                        end;
                        T_Dliqp.Next;
                      end;
                    end;

                    if VarLiqTPagoPromoKiosco<>'' then begin
                      totalPromo:=GetTotalPromoKiosco(T_LiqgFECHA.AsDateTime, T_LiqgTURNO.AsInteger, T_LiqgISLA.AsInteger);
                      if T_Dliqp.Locate('Estacion;Turno;Clave_pago',VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgTurno.asinteger,VarLiqTPagoPromoKiosco]),[]) then begin
                        T_Dliqp.Edit;
                        T_DliqpIMPORTE.AsFloat:=totalPromo;
                        T_Dliqp.Post;
                      end;

                      if T_Dliqp.Locate('Estacion;Turno;Clave_pago',VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgTurno.asinteger,'01']),[]) then begin
                        T_Dliqp.Edit;
                        T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat-totalPromo;
                        T_Dliqp.Post;
                      end;
                    end;

                    with DM_KIOSK, DMPVG do begin
                      pListaTransacciones := GetTransaccionesFueraLinea(T_LiqgEstacion.AsInteger,'CR',T_LiqgFecha.AsDateTime,T_LiqgFecha.AsDateTime, T_LiqgTurno.AsInteger,T_LiqgDESPACHADOR.AsInteger);
                      if pListaTransacciones.Count>0 then begin
                        try
                          T_Tran.Active:=True;
                          for xcontTran := 0 to pListaTransacciones.Count-1 do begin
                            RefrescaQuery(T_Tran);
                            IniciaUpdates(DBGAS1,T_Tran);
                            T_Tran.Insert;
                            T_TranTipoVenta.AsString:=pListaTransacciones.Items[xcontTran].TipoVenta;
                            T_TranEstacion.AsInteger:=T_LiqgEstacion.AsInteger;
                            T_TranFecha.AsDateTime:=pListaTransacciones.Items[xcontTran].Fecha;
                            T_TranTurno.AsInteger:=pListaTransacciones.Items[xcontTran].Turno;
                            T_TranCliente.AsInteger:=pListaTransacciones.Items[xcontTran].Cliente;
                            T_TranVehiculo.AsInteger:=pListaTransacciones.Items[xcontTran].Vehiculo;
                            T_TranCHOFER.AsInteger:=pListaTransacciones.Items[xcontTran].Chofer;
                            T_TranFolio.AsInteger:=DMGAS.Consecutivo('DGASTRAN','Folio','TipoVenta;Estacion',VarArrayOf([T_TranTipoVenta.asstring,T_TranEstacion.asinteger]));
                            T_TranSubCodigo.AsInteger:=pListaTransacciones.Items[xcontTran].SubCodigo;
                            T_TranPOSCARGA.AsInteger    := pListaTransacciones.Items[xcontTran].PosCarga;
                            T_TranCOMBUSTIBLE.AsInteger := pListaTransacciones.Items[xcontTran].Combustible;
                            T_TranPrecio.AsFloat:=pListaTransacciones.Items[xcontTran].Precio;
                            T_TranLitros.AsFloat:=pListaTransacciones.Items[xcontTran].Litros;
                            T_TranImporteCMB.AsFloat:=pListaTransacciones.Items[xcontTran].ImporteCMB;
                            T_TranEstatus.AsString:='A';
                            T_TranHora.AsDateTime:=GetFechaHoraServidor;
                            if T_TarjTipoMonto.AsString='Litros' then begin
                              T_TranBITACORA.AsString:=T_TranBITACORA.AsString+'/'+FloatToStr(T_TranLitros.AsFloat);
                            end
                            else begin
                               T_TranBITACORA.AsString:=T_TranBITACORA.AsString+'/'+FloatToStr(T_TranIMPORTECMB.AsFloat);
                            end;
                            T_Tran.post;
                            AplicaUpdates(DBGAS1,T_Tran);
                          end;

                          if not CambiaEstadoTransaccionesFueraLinea(pListaTransacciones,Msj) then begin
                            MensajeErr('Error al momento de actualizar transacciones fuera de linea, favor de verlo con su administrador de sistemas');
                            try
                              _ErrorActualizacion:=TStringList.Create;
                              _ErrorActualizacion.Add(Msj);
                              _ErrorActualizacion.SaveToFile('C:\ImagenCo\Tmp\ErrorActualizacionTransaccion'+FormatDateTime('DD-MM-YYY hh-mm AM/PM',Now)+'.txt');
                              _ErrorActualizacion.Free;
                            except
                              _ErrorActualizacion.Free;
                            end;
                          end;
                        finally
                          pListaTransacciones.Free;
                          T_Tran.Active:=False;
                        end;
                      end;
                    end;
                  end else begin
                    //Acumulamos tipos de pago volumétricos
                    _ListaAcumTipoPago:=GetAcumTipoPagoVolumetrico(T_LiqgFECHA.AsDateTime,T_LiqgTURNO.AsInteger,T_LiqgISLA.AsInteger);
                    xTieneTiposPagoKiosko := TieneTiposPagoKiosko;
                    for i:=0 to _ListaAcumTipoPago.Count-1 do begin
                      _AcumTipoPago:=_ListaAcumTipoPago[i];
                      xtippago:=_AcumTipoPago.TipoPago;
                      if _AcumTipoPago.TipoPago = 8 then begin
                        ImporteTajetaBancaria := _AcumTipoPago.Importe;
                        ClaveTarjetaBancaria := _AcumTipoPago.TipoPago;
                      end;
                      if xtippago= 0 then
                        xtippago:=1;

                      _totalCuponesFeria:=0;

                      //Si _Kiosco es igual a 0 entonces la isla no se encuentra en DGASKIOSCO por lo cual no la usa el kiosco.
                      //De haberse enviado como parametro _Kiosco con valor 0 al método GetTotalFeriaCuponesTurno, master delphi lo hubiera interpretado como una consulta para liquidación global
                      if _Kiosco > 0 then
                        _totalCuponesFeria:=GetTotalFeriaCuponesTurno(T_LiqgESTACION.AsInteger,_Kiosco,T_LiqgFECHA.AsDateTime,T_LiqgTURNO.AsInteger,AConexion);

                      if _totalCuponesFeria>0 then begin
                        T_Dliqp.First;
                        while (not T_Dliqp.Eof)and((not SwPagoFeria)) do begin
                          if (T_DliqpClasePago.AsString=idClaseCuponFeria)and(SwNuevo) then begin
                            T_Dliqp.Edit;
                            try
                              SwLecturaTiposdePagos := True;
                              T_DliqpIMPORTE.ReadOnly := False;
                              T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat+_totalCuponesFeria*-1;
                            finally
                              SwLecturaTiposdePagos := False;
                            end;
                            T_Dliqp.Post;
                            SwPagoFeria:=True;
                          end;
                          T_Dliqp.Next;
                        end;
                      end;

                      if xTieneTiposPagoKiosko then begin
                        if T_Dliqp.Locate('TP_KIOSKO', xtippago, []) then begin
                          if (T_DliqpClasePago.AsString<>'Vale de Crédito') and (T_DliqpClasePago.AsString<>'Cupón') and (T_DliqpClasePago.AsString<>'Tarjeta Prepago')
                           and (T_DliqpClasePago.AsString<>'Tarjeta Crédito') and (T_DliqpClasePago.AsString<>'Ezzygas') then begin
                            T_Dliqp.Edit;
                            T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat+_AcumTipoPago.Importe;
                            T_Dliqp.Post;
                          end;
                        end;
                      end else begin
                        if T_Dliqp.Locate('Estacion;Turno;Clave_pago',VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgTurno.asinteger,IntToStr(xtippago)]),[]) then begin
                          if (T_DliqpClasePago.AsString<>'Vale de Crédito') and (T_DliqpClasePago.AsString<>'Cupón') and (T_DliqpClasePago.AsString<>'Tarjeta Prepago')
                          and (T_DliqpClasePago.AsString<>'Tarjeta Crédito') and (T_DliqpClasePago.AsString<>'Ezzygas') then begin
                            T_Dliqp.Edit;

                            if (T_DliqpClasePago.AsString = idClaseCuponFeria) then begin
                              T_DliqpIMPORTE.ReadOnly := False;
                              T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat + _AcumTipoPago.Importe * -1;
                              T_DliqpIMPORTE.ReadOnly := True;
                            end
                            else T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat+_AcumTipoPago.Importe;

                            T_Dliqp.Post;
                          end;
                        end;
                      end;
                    end;

                    //Acumulamos tipos de pago de aceites
                    for i:=0 to _ListaLiqAceiteKiosco.Count-1 do begin
                      _LiqAceiteKiosco := _ListaLiqAceiteKiosco[i];
                      xtippago := _LiqAceiteKiosco.TipoPago;
                      if xtippago= 0 then
                        xtippago:=1;

                      if xTieneTiposPagoKiosko then
                        xtippago := ObtieneTipoPagoLiquidaciones(xtippago,False);

                      if T_Dliqp.Locate('Clave_pago', xtippago, []) then begin
                        T_Dliqp.Edit;
                        T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat+_LiqAceiteKiosco.Importe;
                        T_Dliqp.Post;
                      end;
                    end;
                  end;
                finally
                  if _ListaAcumTipoPago<>nil then
                    _ListaAcumTipoPago.Free;
                end;
              end
              else begin
                // Validar el importe de las tarjetas
                T_Turc.Open;
                T_Dliqp.First;
                ImporteTajetaBancaria:=0;
                while not T_Dliqp.Eof do begin
                  if T_DliqpCLAVE_PAGO.AsInteger = 3{ ClaveTarjetaBancaria} then begin
                    ImporteTajetaBancaria:=T_DliqpImporte.AsFloat;
                    Break;
                  end;
                  T_Dliqp.Next;
                end;

                while not T_Dliqp.Eof do begin
                  if T_DliqpCLAVE_PAGO.AsInteger = 40{ ClaveTarjetaBancaria} then begin
                    xMontoTarjetaPuntos := T_DliqpImporte.AsFloat;
                    xClavePagoPtos      := T_DliqpCLAVE_PAGO.AsInteger;
                    Break;
                  end;
                  T_Dliqp.Next;
                end;
              end;
            end;
          end;

          //Consulta descuentos si se manejan descuentos reales. Con la licencia de puntos se pueden realizar descuentos reales.
          if not(DMGAS.ValidaModulo(idDesc)) and (DM_PUNTOS.LicenciaEsValidaPuntos) then begin  //
            DMCONS.Q_Auxi.Close;
            DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
            DMCONS.Q_Auxi.SQL.Clear;
            DMCONS.Q_Auxi.SQL.Add('SELECT SUM(DESCUENTO) AS Real1 FROM DPVGMOVI');
            DMCONS.Q_Auxi.SQL.Add('WHERE TIPOPAGO=:PTIPOPAGO');
            DMCONS.Q_Auxi.SQL.Add('AND FECHATURNO=:PFECHATURNO');
            DMCONS.Q_Auxi.SQL.Add('AND TURNO=:PTURNO');
            DMCONS.Q_Auxi.SQL.Add('AND POSCARGA IN (SELECT DISTINCT POSCARGA FROM DPVGBOMB WHERE ISLA=:PISLA)');
            DMCONS.Q_Auxi.ParamByName('PTIPOPAGO').AsInteger := 95;
            DMCONS.Q_Auxi.ParamByName('PFECHATURNO').AsDateTime := T_LiqgFECHA.AsDateTime;
            DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_LiqgTURNO.AsInteger;
            DMCONS.Q_Auxi.ParamByName('PISLA').AsInteger := T_LiqgISLA.AsInteger;
            DMCONS.Q_Auxi.Prepare;
            DMCONS.Q_Auxi.Open;
            if (DMCONS.Q_AuxiReal1.AsFloat)>0 then begin
              T_Dliqp.First;
              while not T_Dliqp.Eof do begin
                if T_DliqpClasePago.AsString = 'Descuento' then begin
                  T_Dliqp.Edit;
                  T_DliqpIMPORTE.AsFloat:=DMCONS.Q_AuxiReal1.AsFloat * -1;
                  T_Dliqp.Post;
                  Break;
                end;
                T_Dliqp.Next
              end;
            end;
            DMCONS.Q_Auxi.Close;
          end;

          //Consulta descuentos si manejan sistema Gulf.
          if DMGAS.VarGasSistemaGulfActivo = 'Si' then begin  //
            DMCONS.Q_Auxi.Close;
            DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
            DMCONS.Q_Auxi.SQL.Clear;
            DMCONS.Q_Auxi.SQL.Add('SELECT SUM(DESCUENTO) AS Real1 FROM DPVGMOVI');
            DMCONS.Q_Auxi.SQL.Add('WHERE FECHATURNO=:PFECHATURNO');
            DMCONS.Q_Auxi.SQL.Add('AND TURNO=:PTURNO');
            DMCONS.Q_Auxi.SQL.Add('AND POSCARGA IN (SELECT DISTINCT POSCARGA FROM DPVGBOMB WHERE ISLA=:PISLA)');
            DMCONS.Q_Auxi.ParamByName('PFECHATURNO').AsDateTime := T_LiqgFECHA.AsDateTime;
            DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_LiqgTURNO.AsInteger;
            DMCONS.Q_Auxi.ParamByName('PISLA').AsInteger := T_LiqgISLA.AsInteger;
            DMCONS.Q_Auxi.Prepare;
            DMCONS.Q_Auxi.Open;
            if (DMCONS.Q_AuxiReal1.AsFloat)>0 then begin
              T_Dliqp.First;
              while not T_Dliqp.Eof do begin
                if T_DliqpClasePago.AsString = 'Descuento' then begin
                  T_Dliqp.Edit;
                  T_DliqpIMPORTE.AsFloat:=DMCONS.Q_AuxiReal1.AsFloat * -1;
                  T_Dliqp.Post;
                  Break;
                end;
                T_Dliqp.Next
              end;
            end;
            DMCONS.Q_Auxi.Close;
          end;
         // Fin del Agregado de las ventas que se realizaron en el KIOSKO.


         //si manejan algun sistema TABLET O KIOSKO JUNTO CON EL CAJERO,
           T_Dliqp.First;
          while not T_Dliqp.Eof do begin
            if (T_DliqpClasePago.AsString = 'Contado Interlogic') and(SwNuevo) then begin
              DMCONS.Q_Auxi.Close;
              DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
              DMCONS.Q_Auxi.SQL.Clear;
              DMCONS.Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS Real1 FROM DPVGMOVI');
              DMCONS.Q_Auxi.SQL.Add('WHERE FECHATURNO=:PFECHATURNO');
              DMCONS.Q_Auxi.SQL.Add('AND TIPOPAGO=:PTIPOPAGO');
              DMCONS.Q_Auxi.SQL.Add('AND TURNO=:PTURNO');
              DMCONS.Q_Auxi.SQL.Add('AND POSCARGA IN (SELECT DISTINCT POSCARGA FROM DPVGBOMB WHERE ISLA=:PISLA)');
              DMCONS.Q_Auxi.ParamByName('PFECHATURNO').AsDateTime := T_LiqgFECHA.AsDateTime;
              DMCONS.Q_Auxi.ParamByName('PTIPOPAGO').AsInteger := T_DliqpCLAVE_PAGO_ENTERO.AsInteger;
              DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_LiqgTURNO.AsInteger;
              DMCONS.Q_Auxi.ParamByName('PISLA').AsInteger := T_LiqgISLA.AsInteger;
              DMCONS.Q_Auxi.Prepare;
              DMCONS.Q_Auxi.Open;
              if (DMCONS.Q_AuxiReal1.AsFloat)>0 then begin
                T_Dliqp.Edit;
                T_DliqpIMPORTE.AsFloat:=DMCONS.Q_AuxiReal1.AsFloat ;
                T_Dliqp.Post;
              end;
              DMCONS.Q_Auxi.Close;
            Break;
            end;
            T_Dliqp.Next
          end;
          //Agregar Tarjeta interlogic buscando en DPVGMOVI
          T_Dliqp.First;
          while not T_Dliqp.Eof do begin
            if (T_DliqpClasePago.AsString = 'Tarjeta Interlogic')and(SwNuevo) then begin
              DMCONS.Q_Auxi.Close;
              DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
              DMCONS.Q_Auxi.SQL.Clear;
              DMCONS.Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS Real1 FROM DPVGMOVI');
              DMCONS.Q_Auxi.SQL.Add('WHERE FECHATURNO=:PFECHATURNO');
              DMCONS.Q_Auxi.SQL.Add('AND TIPOPAGO=:PTIPOPAGO');
              DMCONS.Q_Auxi.SQL.Add('AND TURNO=:PTURNO');
              DMCONS.Q_Auxi.SQL.Add('AND POSCARGA IN (SELECT DISTINCT POSCARGA FROM DPVGBOMB WHERE ISLA=:PISLA)');
              DMCONS.Q_Auxi.ParamByName('PFECHATURNO').AsDateTime := T_LiqgFECHA.AsDateTime;
              DMCONS.Q_Auxi.ParamByName('PTIPOPAGO').AsInteger := T_DliqpCLAVE_PAGO_ENTERO.AsInteger;
              DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_LiqgTURNO.AsInteger;
              DMCONS.Q_Auxi.ParamByName('PISLA').AsInteger := T_LiqgISLA.AsInteger;
              DMCONS.Q_Auxi.Prepare;
              DMCONS.Q_Auxi.Open;
              if (DMCONS.Q_AuxiReal1.AsFloat)>0 then begin
                T_Dliqp.Edit;
                T_DliqpIMPORTE.AsFloat:=DMCONS.Q_AuxiReal1.AsFloat ;
                T_Dliqp.Post;
              end;
              DMCONS.Q_Auxi.Close;
              Break;
            end;
            T_Dliqp.Next
          end;
          T_Dliqp.First;

        end else begin
          //Agregar aqui un else el cual obtenga solo lo de interlogic esto para que si no tienes ni tablet ni kiosko los tipos de pago de interlogic seguiran siendo validos.
          //Agregar Contado interlogic buscando en DPVGMOVI
          T_Dliqp.First;
          while not T_Dliqp.Eof do begin
            if (T_DliqpClasePago.AsString = 'Contado Interlogic') and(SwNuevo) then begin
              DMCONS.Q_Auxi.Close;
              DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
              DMCONS.Q_Auxi.SQL.Clear;
              DMCONS.Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS Real1 FROM DPVGMOVI');
              DMCONS.Q_Auxi.SQL.Add('WHERE FECHATURNO=:PFECHATURNO');
              DMCONS.Q_Auxi.SQL.Add('AND TIPOPAGO=:PTIPOPAGO');
              DMCONS.Q_Auxi.SQL.Add('AND TURNO=:PTURNO');
              DMCONS.Q_Auxi.SQL.Add('AND POSCARGA IN (SELECT DISTINCT POSCARGA FROM DPVGBOMB WHERE ISLA=:PISLA)');
              DMCONS.Q_Auxi.ParamByName('PFECHATURNO').AsDateTime := T_LiqgFECHA.AsDateTime;
              DMCONS.Q_Auxi.ParamByName('PTIPOPAGO').AsInteger := T_DliqpCLAVE_PAGO_ENTERO.AsInteger;
              DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_LiqgTURNO.AsInteger;
              DMCONS.Q_Auxi.ParamByName('PISLA').AsInteger := T_LiqgISLA.AsInteger;
              DMCONS.Q_Auxi.Prepare;
              DMCONS.Q_Auxi.Open;
              if (DMCONS.Q_AuxiReal1.AsFloat)>0 then begin
                T_Dliqp.Edit;
                T_DliqpIMPORTE.AsFloat:=DMCONS.Q_AuxiReal1.AsFloat ;
                T_Dliqp.Post;
              end;
              DMCONS.Q_Auxi.Close;
            Break;
            end;
            T_Dliqp.Next
          end;
          //Agregar Tarjeta interlogic buscando en DPVGMOVI
          T_Dliqp.First;
          while not T_Dliqp.Eof do begin
            if (T_DliqpClasePago.AsString = 'Tarjeta Interlogic')and(SwNuevo) then begin
              DMCONS.Q_Auxi.Close;
              DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
              DMCONS.Q_Auxi.SQL.Clear;
              DMCONS.Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS Real1 FROM DPVGMOVI');
              DMCONS.Q_Auxi.SQL.Add('WHERE FECHATURNO=:PFECHATURNO');
              DMCONS.Q_Auxi.SQL.Add('AND TIPOPAGO=:PTIPOPAGO');
              DMCONS.Q_Auxi.SQL.Add('AND TURNO=:PTURNO');
              DMCONS.Q_Auxi.SQL.Add('AND POSCARGA IN (SELECT DISTINCT POSCARGA FROM DPVGBOMB WHERE ISLA=:PISLA)');
              DMCONS.Q_Auxi.ParamByName('PFECHATURNO').AsDateTime := T_LiqgFECHA.AsDateTime;
              DMCONS.Q_Auxi.ParamByName('PTIPOPAGO').AsInteger := T_DliqpCLAVE_PAGO_ENTERO.AsInteger;
              DMCONS.Q_Auxi.ParamByName('PTURNO').AsInteger := T_LiqgTURNO.AsInteger;
              DMCONS.Q_Auxi.ParamByName('PISLA').AsInteger := T_LiqgISLA.AsInteger;
              DMCONS.Q_Auxi.Prepare;
              DMCONS.Q_Auxi.Open;
              if (DMCONS.Q_AuxiReal1.AsFloat)>0 then begin
                T_Dliqp.Edit;
                T_DliqpIMPORTE.AsFloat:=DMCONS.Q_AuxiReal1.AsFloat ;
                T_Dliqp.Post;
              end;
              DMCONS.Q_Auxi.Close;
              Break;
            end;
            T_Dliqp.Next
          end;
          T_Dliqp.First;
        end;
        // Insertar venta de TIEMPO AIRE
        try
          pVenta := StrToIntDef(DMGEN.VarComp('PuntoVentaTA'),-1);
          montoVentaTA := 0;

          if pVenta <> -1
          then montoVentaTA := ObtenerMontoVentasTA(T_LiqgFECHA.AsDateTime, pVenta, T_LiqgESTACION.AsInteger, T_LiqgTURNO.AsInteger, T_LiqgISLA.AsInteger)
          else montoVentaTA := 0;
        except
          montoVentaTA := 0.0;
        end;

        montoVentaTA := montoVentaTA + ObtenerVentasTAGasoPay(T_LiqgESTACION.AsInteger, T_LiqgFECHA.AsDateTime, T_LiqgTURNO.AsInteger, T_LiqgISLA.AsInteger);

        if montoVentaTA > 0.05 then begin
          claveProdTA := Self.productoTiempoAire;

          if claveProdTA > 0 then begin
            try
              if T_Dliqa.Locate('Producto',claveProdTA,[])
              then T_Dliqa.Edit
              else T_Dliqa.Insert;

              T_DliqaESTACION.AsInteger := T_LiqgESTACION.AsInteger;
              T_DliqaFOLIO.AsInteger := T_LiqgFOLIO.AsInteger;
              T_DliqaPRODUCTO.AsInteger := claveProdTA;
              T_DliqaISLA.AsInteger := T_LiqgISLA.AsInteger;
              T_DliqaFECHA.AsDateTime := T_LiqgFECHA.AsDateTime;
              T_DliqaTURNO.AsInteger := T_LiqgTURNO.AsInteger;
              T_DliqaENTRADAS.AsFloat := montoVentaTA;
              T_DliqaSALD_FIN.AsFloat := 0;
              T_DliqaVENTA.AsFloat := montoVentaTA;
              T_DliqaNombreProducto.AsString := 'Tiempo Aire';
              T_DliqaIMPORTE.AsFloat := montoVentaTA;
              T_Dliqa.Post;
            except
              T_Dliqa.Cancel;
            end;
          end;
        end;
        


        //Fina de los pagos
        BbGuardar.Enabled:=true;
        BbCancelar.Enabled:=true;
        Guardar1.Enabled:=true;
        Cancelar1.Enabled:=true;
        DBGrid1.DataSource:=DS_Dliqc;
        DBGrid2.DataSource:=DS_Dliqa;
        DBGrid3.DataSource:=DS_Dliqp;
        T_Dliqp.First;
        T_Dliqa.First;
        T_Dliqc.First;
      except
        on e:Exception do
          raise Exception.Create(e.Message);
      end;
    finally
      calculandoLiq:=False;;
      T_Dliqp.EnableControls;
      T_Dliqa.EnableControls;
      T_Dliqp.EnableControls;
    end;
  end;
end;

procedure TFLIQLIQGN.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQLIQGN.Guardar1Click(Sender: TObject);
var
  swFecha:TDateTime;
  swTurno:Integer;
  swPrecioAnt:Real;
begin
  with DMLIQ,DMGEN,DMGAS do begin
    if not LecturaActualOk then begin
      MensajeErr('Falta Lectura Final de Combustibles');
      PageControl1.ActivePageIndex:=0;
      DBGrid1.SetFocus;
      exit;
    end;
    if not SaldoFinalOk then begin
      MensajeErr('Falta Saldo Final en Productos');
      PageControl1.ActivePageIndex:=1;
      DBGrid2.setfocus;
      exit;
    end;
    if not TotPagosLiqOk then begin
      MensajeErr('Total de Pagos no coincide con la Liquidación');
      PageControl1.ActivePageIndex:=2;
      DBGrid3.setfocus;
      exit;
    end;
    if not TotAceitePagosLiqOk then begin
      MensajeErr('Total de Pagos de Aceites y Derivados no coincide con la Liquidación');
      PageControl1.ActivePageIndex:=2;
      DBGrid3.setfocus;
      exit;
    end;
    if not TotalDesgloseOk then begin
      MensajeErr('Desglose de Documentos no es igual al Importe del Pago');
      PageControl1.ActivePageIndex:=2;
      DBGrid3.setfocus;
      exit;
    end;
    // Validar las lecturas para que no sean mayor la lectura inicial que la final
    T_Dliqc.First;
    while not T_Dliqc.Eof do begin
      if T_DliqcLEC_ANT.AsFloat> T_DliqcLEC_ACT.AsFloat then begin
        MensajeErr('Lectura inicial mayor a lectura final, favor de verificarla.');
        PageControl1.ActivePageIndex:=0;
        DBGrid1.SetFocus;
        exit;
      end;

      if T_DliqcCANTIDAD.AsFloat < 0 then begin
        MensajeErr('Cantidad de combustible se encuentra negativa.');
        PageControl1.ActivePageIndex:=0;
        DBGrid1.SetFocus;
        exit;
      end;

      T_Dliqc.Next;
    end;

    // Valida si esta configurado que se abran los turnos automaticos.
    if VarLiqTurnosAuto='Si' then ValidarCupones;
    VerificaFDeposito;

    if ( not(DMGAS.ValidaModulo(idDesc)) and (DM_PUNTOS.LicenciaEsValidaPuntos)) or (DMGAS.VarGasSistemaGulfActivo = 'Si') then   // Solo si se manejan descuentos reales o tiene el sistema Gulf activo
      ActualizaTablasDescuentos;

    try
      try
        T_LiqgAplicado.AsString:='Si';
        T_Liqg.Post;
        AplicaUpdates(DBGAS2,T_Liqg);
        TM_Dliqc.EmptyTable;
        FinalizaDocAccion;
      except
        CancelaUpdates(DBGAS2,T_Liqg);
        CancelaDocAccion;
        raise;
      end;
    finally
      if SwNuevo then begin
        // Valida si esta configurado que se abran los turnos automaticos.
        if VarLiqTurnosAuto='Si' then begin
          if ValidaEstatusLiq then begin
            with DMGASQ,DMGAS do begin
              swFecha:=QT_TurcAFECHA.AsDateTime;
              swTurno:=QT_TurcaTurno.AsInteger;
              CerrarTurno;
              if not VerificaTurno(swFecha,swTurno) then begin
                if swTurno>=DMGAS.VarGasMaximoTurnosLiq then begin
                  swPrecioAnt:=0;
                  HacerAjusteAutomatico(swFecha);
                  PreparaTurno(swFecha+1);
                end
                else PreparaTurno(swFecha);

                GuardaTurno;
                MensajeInfo('Nuevo turno abierto: '+DMGASQ.QT_TurcADescripTurno.AsString);
                FLIQLIQGN.Caption:='Nueva Liquidación'+LLenaStr(DMGASQ.QT_TurcADescripTurno.AsString,'D',100,' ');
              end;
            end;
          end;
        end;
        PageControl1.ActivePageIndex:=0;
        DBEdit1.SetFocus;
      end
      else begin
        if VarLiqTurnosAuto='Si' then begin
          if ValidaEstatusLiq then begin
            CerrarTurno;
          end;
        end;
        FLIQLIQGN.Close;
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.PreparaForma(xNuevo:Boolean);
begin
  with DMGEN,DMGAS,DMLIQ do begin

    if VarGasDiferenciaLectura then begin
        DBGrid1.Columns[5].Visible := True;
    end
    else
      DBGrid1.Columns[5].Visible := False;

    SubModuloRef2008(DMCUP.SwSubModuloCupReformas2008);
    TM_Dliqc.Active:=true;
    TM_Dliqc.SortOnFields('Combustible',true,false);
    SwCalculaResumen:=false;
    DBGrid1.ReadOnly:=VarLiqTurnoRestringido;
    DBGrid2.ReadOnly:=VarLiqTurnoRestringido;
    SwNuevo:=xNuevo;
    if SwNuevo
    then SetAltaDocu
    else SetModificaDocu;
  end;
end;

procedure TFLIQLIQGN.FormShow(Sender: TObject);
begin
  with DMLIQ,DMGASQ do begin
    if VarLiqTurnoRestringido then
      PageControl1.ActivePageIndex:=2
    else
      PageControl1.ActivePageIndex:=0;
    FLIQLIQGN.Caption:=Caption+LLenaStr(QT_TurcADescripTurno.AsString,'D',100,' ');
    if SwNuevo then begin
      if DMGAS.VarLiqTurnosAuto='Si' then
        DBEdit3.ReadOnly:=True;
      DBEdit1.SetFocus
    end
    else begin
      DBEdit1.ReadOnly:=true;
      DBEdit3.ReadOnly:=true;
      DBEdit5.ReadOnly:=true;
      if VarLiqTurnoRestringido then DBGrid3.SetFocus
      else DBGrid1.SetFocus;
    end;
    clavePagoTI:='';
  end;
end;

procedure TFLIQLIQGN.DBGrid1Exit(Sender: TObject);
begin
  with DMGEN,DMLIQ do begin
    if T_Dliqc.state in [dsInsert] then begin
      try
        T_Dliqc.Cancel;
      except
        DbGrid1.SetFocus;
        raise;
      end;
    end;
    DBNavigator1.DataSource:=nil;
  end;
end;

procedure TFLIQLIQGN.DBGrid1Enter(Sender: TObject);
begin
  with DMLIQ,DMGEN,DMGAS do begin
    try
      if T_Liqg.State=dsInsert then
        SetModificaDocu;
      Case PageControl1.ActivePageIndex of
        0:begin
            DBNavigator1.DataSource:=DS_Dliqc;
            T_Dliqc.First;
            T_DliqcDevolucion.ReadOnly:=VarGasCapturarDevoluciones='No';
            DBgrid1.SelectedIndex:=4;
            LFuncion.Caption:='F2 Cuadrar Combustibles';
          end;
        1:begin
            DBNavigator1.DataSource:=DS_Dliqa;
            if not T_Dliqa.IsEmpty then
              if DMGAS.VarLiqRestringirLiquidaciones='Si' then
                DBgrid2.SelectedIndex:=6
              else
                DBgrid2.SelectedIndex:=5;
            T_Dliqa.First;
            LFuncion.Caption:='F2 Cuadrar Productos';
          end;
        2:begin
            DBNavigator1.DataSource:=DS_Dliqp;
            T_Dliqp.First;
            DBgrid3.SelectedIndex:=1;
            LFuncion.Caption:='F2 Cuadrar Saldo';
          end;
      end;
    except
      EliminaCaptura;
      DBEdit1.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQLIQGN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with DMLIQ,DMGEN do begin
    if T_Liqg.state=dsEdit then begin
      if MensajeConf('¿Desea salir sin guardar '+idDocuName+'?')=mrNo then
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

procedure TFLIQLIQGN.GroupBox2Enter(Sender: TObject);
begin
  with DMGEN do begin
    try
      SetModificaDocu;
    except
      EliminaCaptura;
      DBEdit1.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQLIQGN.Cancelar1Click(Sender: TObject);
begin
  with DMLIQ,DMGEN do begin
    if MensajeConf('¿Desea abandonar '+idDocuName+'?')=mrYes then begin
      try
        EliminaCaptura;
      finally
        DBEdit1.SetFocus;
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.DBGrid2Exit(Sender: TObject);
begin
  with DMGEN,DMLIQ do begin
    try
      if T_Dliqa.state=dsEdit then
        T_Dliqa.post
      else if T_Dliqa.State=dsInsert then
        T_Dliqa.Cancel;
    except
      DbGrid2.SetFocus;
      raise;
    end;
    DBNavigator1.DataSource:=nil;
  end;
end;

procedure TFLIQLIQGN.InsertarRenglon2Click(Sender: TObject);
begin
  with DMLIQ do begin
    try
      T_Dliqa.Insert;
    except
      try
        T_Dliqa.Post;
        T_Dliqa.Insert;
      except
        raise;
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.EliminarRenglon2Click(Sender: TObject);
begin
  with DMLIQ do begin
    try
      if T_Dliqa.state<>dsInsert then
        T_Dliqa.Delete
      else
        T_Dliqa.Cancel;
    except
      raise;
    end;
  end;
end;

procedure TFLIQLIQGN.CancelarCambios2Click(Sender: TObject);
begin
  with DMLIQ do begin
    try
      if T_Dliqp.state in [dsInsert,dsEdit] then
        T_Dliqp.Cancel;
    except
      raise;
    end;
  end;
end;

procedure TFLIQLIQGN.Inicio2Click(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqp.First;
  end;
end;

procedure TFLIQLIQGN.Inicio3Click(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqa.First;
  end;
end;

procedure TFLIQLIQGN.Fin2Click(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqp.Last;
  end;
end;

procedure TFLIQLIQGN.Fin3Click(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqa.Last;
  end;
end;

procedure TFLIQLIQGN.DBGrid3Exit(Sender: TObject);
begin
  with DMGEN,DMLIQ do begin
    if T_Dliqp.state in [dsInsert,dsEdit] then begin
      try
        T_Dliqp.post;
      except
        DbGrid3.SetFocus;
        raise;
      end;
    end;
    DBNavigator1.DataSource:=nil;
  end;
end;

procedure TFLIQLIQGN.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DMGAS,DMLIQ do begin
    if (T_DliqpClasePago.AsString <> 'Descuento') and (T_DliqpClasePago.AsString <> 'Ventas con Descuento') then begin
      DBGrid3.Columns[1].ReadOnly := False;
      if DMGEN.QT_EmprSERIEKEY.AsInteger<>637 then begin //25-11-15
        if key=idF2 then begin
          try
            if not (T_Dliqp.state in [dsEdit,dsInsert]) then
              T_Dliqp.edit;
            T_DliqpImporte.AsFloat:=0;
            T_Dliqp.Post;
            T_Dliqp.edit;
            T_DliqpImporte.AsFloat:=AjustaFloat((T_LiqgTotGas.asfloat+T_LiqgTotAlma.AsFloat)-T_LiqgTotPago.AsFloat,2);
          except
            raise;
          end;
        end;
      end;
    end
    else begin
      DBGrid3.Columns[1].ReadOnly := True;
    end;

  end;
end;

procedure TFLIQLIQGN.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var bm:Tbookmark;
begin
  with DMGAS,DMLIQ do begin
    if key=idF2 then begin
      try
        bm:=T_Dliqc.GetBookmark;
        T_Dliqc.DisableControls;
        T_Dliqc.First;
        while not T_Dliqc.Eof do begin
          SetEditorInsert(T_Dliqc);
          if T_DliqcLec_Act.IsNull then begin
            T_DliqcLec_Act.AsFloat:=T_DliqcLec_Ant.AsFloat;
          end;
          T_DLiqc.Next;
        end;
      finally
        T_Dliqc.GotoBookmark(bm);
        T_Dliqc.FreeBookmark(bm);
        T_Dliqc.EnableControls;
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.DBLookupComboBox2Exit(Sender: TObject);
begin
  with DMLIQ do begin
    if not T_Dliqc.IsEmpty then begin
      T_Liqg.Refresh;
      T_Liqg.Edit;
    end;
  end;
end;

procedure TFLIQLIQGN.DataSetDelete2Execute(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqa.Delete;
  end;
end;

procedure TFLIQLIQGN.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var bm:TBookMark;
begin
  with DMGAS,DMLIQ do begin
    if key=idF2 then begin
      try
        if not (T_Dliqa.state in [dsEdit,dsInsert]) then
          T_Dliqa.edit;
        T_DliqaSald_Fin.AsFloat:=T_DliqaSald_Ini.AsFloat;
        T_Dliqa.Post;
        T_Dliqa.edit;
      except
        raise;
      end;
    end;
    if key=idF2 then begin
      try
        bm:=T_Dliqa.GetBookmark;
        T_Dliqa.DisableControls;
        T_Dliqa.First;
        while not T_Dliqa.Eof do begin
          T_Dliqa.edit;
          if T_DliqaSald_Fin.IsNull then begin
            T_DliqaSald_Fin.AsFloat:=T_DliqaSald_Ini.AsFloat;
            T_Dliqa.Post;
          end;
          T_Dliqa.Next;
        end;
      finally
        T_Dliqa.GotoBookmark(bm);
        T_Dliqa.FreeBookmark(bm);
        T_Dliqa.EnableControls;
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.DBLookupComboBox2Enter(Sender: TObject);
begin
  with DMGEN,DMLIQ do begin
    try
      SetModificaDocu;
      if (SwLiqAutom)and(SistemaActivo(idPVG)) then
    except
      DBEdit1.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQLIQGN.QL_DespFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=QL_DespEstacion.AsInteger=DMLIQ.T_LiqgEstacion.AsInteger;
end;

procedure TFLIQLIQGN.DBEdit1Change(Sender: TObject);
begin
  QL_Desp.Close;
  QL_Desp.Prepare;
  QL_Desp.Open;
end;

procedure TFLIQLIQGN.DBGrid2DblClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if DBGrid2.SelectedField=T_DliqaProducto then begin
      if FGASPRODB.ShowModal=mrOk then begin
        SetEditOrInsert(T_Dliqa);
        T_DliqaProducto.AsInteger:=FGASPRODB.ClaveProd;
        DBGrid2.SetFocus;
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.DBGrid2ColEnter(Sender: TObject);
begin
  with DMLIQ do begin
    try
      DBGrid2.Columns[2].ReadOnly:=False;
      DBGrid2.Columns[3].ReadOnly:=False;
      DBGrid2.Columns[4].ReadOnly:=False;
      DBGrid2.Columns[5].ReadOnly:=False;
      DBGrid2.Columns[6].ReadOnly:=False;
      DBGrid2.Columns[7].ReadOnly:=False;
      DBGrid2.Columns[8].ReadOnly:=False;
      if DMGAS.VarLiqRestringirLiquidaciones='Si' then begin
        DBGrid2.Columns[2].ReadOnly:=True;
        DBGrid2.Columns[3].ReadOnly:=True;
        DBGrid2.Columns[4].ReadOnly:=True;
        DBGrid2.Columns[5].ReadOnly:=True;
        DBGrid2.Columns[6].ReadOnly:=True;
        DBGrid2.Columns[7].ReadOnly:=True;
        DBGrid2.Columns[8].ReadOnly:=True;
        ChecaDerechoEspecialAutor3(idLiq,aeModificaAceitLiq);
        if FAutoriza.PassOk then begin
          DBGrid2.Columns[3].ReadOnly:=False;
        end;
        ChecaDerechoEspecialAutor3(idLiq,aeModificaAceiINFtLiq);
        if FAutoriza.PassOk then begin
          DBGrid2.Columns[5].ReadOnly:=False;
        end;
      end;
    except
      on e:Exception do begin
        MensajeErr(e.Message);
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.DesglosedeDocumentos1Click(Sender: TObject);
begin
  with DMGAS, DMLIQ do begin
    if T_DliqpDesglosa.AsString='Si' then begin
      T_Dliqp.Edit;
      FLIQDTPAG.ShowModal;
    end;
  end;
end;

procedure TFLIQLIQGN.ActualizarTiposdePago1Click(Sender: TObject);
var bm:tBookMark;
begin
  with DMGAS,DMLIQ do begin
    try
      T_Dliqp.DisableControls;
      bm:=T_Dliqp.GetBookmark;
      VarLiqNuevosPagos:=true;
      T_Tpag.Open;
      T_Tpag.First;
      while not T_Tpag.Eof do begin
        if not LocalizaTabla(T_Dliqp,'Clave_Pago',T_TpagClave.AsString) then begin
          T_Dliqp.Append;
          T_DliqpClave_Pago.AsString:=T_TpagClave.AsString;
          T_DliqpFecha.AsDateTime   :=T_Liqgfecha.AsDateTime;
          T_DliqpTurno.AsInteger    :=T_LiqgTurno.AsInteger;
          T_DliqpTP_KIOSKO.AsInteger:=T_TpagTP_KIOSKO.AsInteger;
          T_Dliqp.Post;
        end;
        T_TPag.Next;
      end;
    finally
      T_Dliqp.GotoBookmark(bm);
      T_Dliqp.FreeBookmark(bm);
      T_Dliqp.EnableControls;
      VarLiqNuevosPagos:=false;
    end;
  end;
end;

procedure TFLIQLIQGN.Panel3Enter(Sender: TObject);
begin
  with DMLIQ,DMGEN do begin
    DBEdit1.ReadOnly:=false;
    if DMGAS.VarLiqTurnosAuto<>'Si' then
      DBEdit3.ReadOnly:=false;
    DBEdit5.ReadOnly:=false;
    if (T_Liqg.state<>dsinsert)and(T_Liqg.state<>dsedit) then begin
      try
        SetAltaDocu;
      except
        FLIQLIQGN.Close;
      end;
    end
    else if T_Liqg.State=dsEdit then begin
      DBEdit1.ReadOnly:=true;
      DBEdit3.ReadOnly:=true;
      DBEdit5.ReadOnly:=true;
      DBLookUpComboBox2.SetFocus;
    end
  end;
end;

procedure TFLIQLIQGN.CargarPagosdeCupones1Click(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    if T_DliqpClasePago.AsString=idClaseCupones then begin
      Q_Auxi.Active:=false;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASRCUP');
      Q_Auxi.SQL.Add('where estacion='+IntToStr(T_LiqgEstacion.asinteger));
      Q_Auxi.SQL.Add('  and caja='+IntToStr(T_LiqgCaja.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(T_LiqgFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and turno='+IntToStr(T_LiqgTurno.asinteger));
      Q_Auxi.SQL.Add('  and Isla_pvg='+IntToStr(T_LiqgIsla.asinteger));
      Q_Auxi.Active:=true;
      T_Dliqp.Edit;
      T_DliqpImporte.Asfloat:=Q_AuxiReal1.AsFloat;
      T_Dliqp.Post;
    end;
    if T_DliqpClasePago.AsString=idClaseTarjIntCre then begin
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
      Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
      Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
      Q_Auxi.SQL.Add('  and estatus="A"');
      Q_Auxi.SQL.Add('  and Cliente in (Select NoClie from DGASSALD where TipoTarjeta="CR")');
      Q_Auxi.Active:=true;
      T_Dliqp.Edit;
      T_DliqpImporte.Asfloat:=Q_AuxiReal1.AsFloat;
      T_Dliqp.Post;
    end;
    if T_DliqpClasePago.AsString=idClaseTarjIntPre then begin
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
      Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
      Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
      Q_Auxi.SQL.Add('  and estatus="A"');
      Q_Auxi.SQL.Add('  and Cliente in (Select NoClie from DGASSALD where TipoTarjeta="PP")');
      Q_Auxi.Active:=true;
      T_Dliqp.Edit;
      T_DliqpImporte.Asfloat:=Q_AuxiReal1.AsFloat;
      T_Dliqp.Post;
    end;
    if (T_DliqpClasePago.AsString=idClaseCredito) then begin
      Q_Auxi.Active:=false;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASVALE');
      Q_Auxi.SQL.Add('where estacion='+IntToStr(T_LiqgEstacion.asinteger));
      Q_Auxi.SQL.Add('  and caja='+IntToStr(T_LiqgCaja.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(T_LiqgFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and turno='+IntToStr(T_LiqgTurno.asinteger));
      Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
      Q_Auxi.SQL.Add('  and FolioVolumetrico > 0');
      Q_Auxi.Active:=true;
      T_Dliqp.Edit;
      T_DliqpImporte.Asfloat:=Q_AuxiReal1.AsFloat;
      T_Dliqp.Post;
    end;

    if (T_DliqpClasePago.AsString=idClaseCreditoAceites) then begin
      Q_Auxi.Active:=false;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASVALE');
      Q_Auxi.SQL.Add('where estacion='+IntToStr(T_LiqgEstacion.asinteger));
      Q_Auxi.SQL.Add('  and caja='+IntToStr(T_LiqgCaja.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSql(T_LiqgFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and turno='+IntToStr(T_LiqgTurno.asinteger));
      Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
      Q_Auxi.SQL.Add('  and FolioVolumetrico is null');
      Q_Auxi.Active:=true;
      T_Dliqp.Edit;
      T_DliqpImporte.Asfloat:=Q_AuxiReal1.AsFloat;
      T_Dliqp.Post;
    end;

    // para las tarjetas bancarias
    if (T_DliqpCLAVE_PAGO.AsInteger = ClaveTarjetaBancaria) then begin
      T_Dliqp.Edit;
      T_DliqpIMPORTE.AsFloat := ImporteTajetaBancaria;
      T_Dliqp.Post;
    end;
  end;
end;

procedure TFLIQLIQGN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  DMLIQ.TM_Dliqc.EmptyTable;
end;

procedure TFLIQLIQGN.CargarProductos1Click(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    QL_Prod.Close;
    QL_Prod.Prepare;
    QL_Prod.Open;
    while not QL_Prod.Eof do begin
      if QL_ProdESTACION.AsInteger=T_LiqgESTACION.AsInteger then
        if not T_Dliqa.Locate('Producto',QL_ProdCLAVE.AsInteger,[]) then begin
          T_Dliqa.Insert;
          T_DliqaProducto.AsInteger:=QL_ProdClave.AsInteger;
          T_Dliqa.Post;
        end;
      QL_Prod.Next;
    end;
  end;
end;

procedure TFLIQLIQGN.Panel3Exit(Sender: TObject);
begin
  if DBEdit1.Text='' then
   DBEdit1.SetFocus;
end;

procedure TFLIQLIQGN.DesglosedeEfectivo1Click(Sender: TObject);
begin
  with DMGAS, DMLIQ do begin
    if (T_DliqpDesglosa.AsString='Si') then begin
      T_Dliqp.Edit;
      SwInsertaEfectivo:=true;
      InsertaDenominaciones;
      SwInsertaEfectivo:=false;
      FLIQDLIQE.ShowModal;
    end;
  end;
end;

procedure TFLIQLIQGN.PopupMenu3Popup(Sender: TObject);
begin
  with DMLIQ do begin
    if T_DliqpClasePago.AsString='Efectivo' then
      DesglosedeEfectivo1.Enabled:=True
    else
      DesglosedeEfectivo1.Enabled:=False;
    if T_DliqpCLAVE_PAGO.AsString='98' then
      DesglosedePagosconCheques1.Enabled:=True
    else
      DesglosedePagosconCheques1.Enabled:=False;
  end;
end;

procedure TFLIQLIQGN.SubModuloRef2008(xactivo: Boolean);
begin
  ImgRef2008.Visible:=not xactivo;
  Lbl1Ref2008.Visible:=not xactivo;
  Lbl2Ref2008.Visible:=not xactivo;
  Lbl3Ref2008.Visible:=not xactivo;
end;

procedure TFLIQLIQGN.ChecaFechaInicio(xactivo: Boolean);
begin
  ImgRef2008.Visible:=not xactivo;
  if not xactivo then
    Lbl1Ref2008.Caption:='Fecha Inicio IEPS '+DateToStr(DMGAS.VarGasFechaInicioIEPS);
  Lbl1Ref2008.Visible:=not xactivo;
  Lbl2Ref2008.Visible:=not xactivo;
  Lbl3Ref2008.Visible:=not xactivo;
end;

procedure TFLIQLIQGN.CalculaIEPS;
begin
  with DMLIQ do begin
    T_Dliqc.First;
    while not T_Dliqc.Eof do begin
      T_Dliqc.Edit;
      T_DliqcIEPS_POR_LITRO.AsFloat:=DMCUP.DameIEPS(T_DliqcCOMBUSTIBLE.AsInteger,T_DliqcFECHA.AsDateTime);
      T_Dliqc.Post;
      T_Dliqc.Next;
    end;
  end;
end;

procedure TFLIQLIQGN.Panel6Exit(Sender: TObject);
begin
  with DMLIQ do begin
    if T_Liqg.State=dsInsert then
      SetModificaDocu;
  end;
end;

procedure TFLIQLIQGN.DBGrid1ColEnter(Sender: TObject);
begin
  with DMLIQ, DMGAS do begin
    try
       DBGrid1.Columns[3].ReadOnly:=False;
      DBGrid1.Columns[4].ReadOnly:=False;

      if VarGasDiferenciaLectura then
        DBGrid1.Columns[5].ReadOnly:=True;

      DBGrid1.Columns[6].ReadOnly:=False;
      DBGrid1.Columns[7].ReadOnly:=False;
      DBGrid1.Columns[8].ReadOnly:=False;
      DBGrid1.Columns[9].ReadOnly:=False;
      DBGrid1.Columns[10].ReadOnly:=False;
      if DMGAS.VarLiqRestringirLiquidaciones='Si' then begin
        DBGrid1.Columns[3].ReadOnly:=True;
        DBGrid1.Columns[4].ReadOnly:=True;
        DBGrid1.Columns[5].ReadOnly:=True;
        DBGrid1.Columns[6].ReadOnly:=True;
        DBGrid1.Columns[7].ReadOnly:=True;
        DBGrid1.Columns[8].ReadOnly:=True;
        DBGrid1.Columns[9].ReadOnly:=True;
        DBGrid1.Columns[10].ReadOnly:=True;
        ChecaDerechoEspecialAutor3(idLiq,aeModificaCombuLiq);
        if FAutoriza.PassOk then begin
          DBGrid1.Columns[4].ReadOnly:=False;
          DBGrid1.Columns[6].ReadOnly:=False;
        end;
      end;
    except
      on e:Exception do begin
        MensajeErr(e.Message);
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.DBGrid1ColExit(Sender: TObject);
begin
  if DMGAS.VarLiqRestringirLiquidaciones='Si' then begin
    DBGrid1.Columns[3].ReadOnly:=True;
    DBGrid1.Columns[4].ReadOnly:=True;
  end;
end;

function TFLIQLIQGN.ObtenerCantVentasTA(fecha: TDateTime;
  pVenta: Integer): Integer;
var
  servicio  : TDMServicios;
  idEmpresa : Integer;
  cantVentasTA  : Integer;
begin
  servicio := TDMServicios.Create(Self);
  idEmpresa := 1;

  cantVentasTA := servicio.VentaObtenerCantidadVentas(idEmpresa, pVenta, fecha, fecha);
  Result := cantVentasTA;
end;

function TFLIQLIQGN.ObtenerMontoVentasTA(fecha: TDateTime; pVenta, est,
  turno, isla: Integer): Double;
var
  servicio   : TDMServicios;
  idEmpresa  : Integer;
  montoVenta : Double;
begin
  servicio := TDMServicios.Create(Self);
  idEmpresa := 1;

  montoVenta := servicio.VentaObtenerMontoVentas(idEmpresa, pVenta, fecha, fecha, True, est, turno, isla);
  Result := montoVenta;
end;

function TFLIQLIQGN.ObtenerVentasTAFecha(fecha: TDateTime;
  pVenta: Integer): ListaVentaRO;
var
  servicio  : TDMServicios;
  idEmpresa : Integer;
  ventasTA  : ListaVentaRO;
begin
  servicio := TDMServicios.Create(Self);
  idEmpresa := 1;

  ventasTA := servicio.VentaObtenerLista(idEmpresa, 0, pVenta, 0, fecha, fecha, 0);
  Result := ventasTA;
end;

function TFLIQLIQGN.productoTiempoAire: Integer;
var
  claseTA : Integer;
  bd : TDatabase;
begin
  Result := 0;
  claseTA := 0;

  try
    with DMGEN do begin
      QT_Clas.close;
      QT_Clas.ParamByName('CLAVECATA').AsString := 'PROG';
      QT_Clas.prepare;
      QT_Clas.Open;

      while not QT_Clas.Eof do begin
        if  Mayusculas(LimpiaStr(QT_ClasDESCRIPCION.AsString)) = 'TIEMPO AIRE' then begin
          claseTA := QT_ClasCLAVECLASIF.AsInteger;

          Break;
        end;

        QT_Clas.Next;
      end;

      QT_Clas.Close;
    end;

    if (claseTA <> 0) and (DMGAS.T_Prod.Locate('LINEA', claseTA, [])) then
      Result := DMGAS.T_ProdCLAVE.AsInteger;
  except
    Result := 0;
  end;
end;


procedure TFLIQLIQGN.DesglosedePagosconCheques1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQLIQGNPC,FLIQLIQGNPC);
  try
    FLIQLIQGNPC.ShowModal;
  finally
    FLIQLIQGNPC.Free;
  end;
end;

function TFLIQLIQGN.ValidaEstatusLiq: Boolean;
var
  xResult:Boolean;
begin
  with DMGAS, DMGASQ do begin
    try
      xResult:=True;
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('Select count(*) as Entero1 from DGASLIQG');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));

      QL_Isla.Close;
      QL_Isla.ParamByName('pestacion').AsInteger:=EstacionActual;
      QL_Isla.Prepare;
      QL_Isla.Open;
      QL_Isla.First;
      Q_Auxi.SQL.Add('  and (Isla='+IntToStr(QL_IslaISLA.AsInteger));
      QL_Isla.Next;
      while not QL_Isla.Eof do begin
        Q_Auxi.SQL.Add('       or Isla='+IntToStr(QL_IslaISLA.AsInteger));
        QL_Isla.Next;
      end;
      Q_Auxi.SQL.Add('       )');
      Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(QT_TurcAFECHA.AsDateTime)));
      Q_Auxi.SQL.Add('  and Turno='+InttoStr(QT_TurcATURNO.AsInteger));
      Q_Auxi.SQL.Add('  and LiquidaGlobal='+QuotedStr('No'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
    finally
      if Q_AuxiEntero1.AsInteger<QL_Isla.RecordCount then begin
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Add('Select count(*) as Entero1');
        Q_Auxi.SQL.Add(' from DGASLIQG');
        Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QT_TurcAFECHA.AsDateTime)+'"');
        Q_Auxi.SQL.Add('  and Turno='+InttoStr(QT_TurcATURNO.AsInteger));
        Q_Auxi.SQL.Add('  and LiquidaGlobal='+QuotedStr('Si'));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger<=0 then begin
          xResult:=False;
        end;
      end;
      Q_Auxi.Close;
    end;
    Result:=xResult;
  end;
end;

procedure TFLIQLIQGN.PreparaTurno(swFecha:TDateTime);
begin
  with DMGAS,DMGEN,DMGASQ do begin
    if CajeroActual=0 then begin
      MensajeErr('El usuario no es cajero en esta Estación de Servicio');
      Close;
    end;
    if LocalizaQuery(QT_Cajr,'Usuario;Caja',VarArrayOf([UsuarioActivo,CajaActual])) then;

    try
      T_Turc.Active:=true;
      T_Turc.insert;
      T_TurcEstacion.AsInteger:=EstacionActual;
      T_TurcCaja.AsInteger:=CajaActual;
      T_TurcCajero.AsInteger:=CajeroActual;
      T_TurcAuxiliar1.AsString:=ExtraeElemStrSep(VarGasAuxiliarValesDefault,1,';');;
      T_TurcAuxiliar2.AsString:=ExtraeElemStrSep(VarGasAuxiliarCuponesDefault,1,';');
      T_TurcFecha.AsDateTime:=swFecha;
      if VarGasManejaJefeTurno='Si' then begin
        T_TurcJEFE_TURNO.AsInteger:=1;//QL_DespClave.AsInteger;
      end;
    except
      with DMGAS do begin
        if T_Turc.State=dsInsert then
          T_Turc.Cancel;
      end;
      raise;
    end;
  end;
end;

procedure TFLIQLIQGN.GuardaTurno;
begin
  with DMGAS,DMGEN,DMGASQ do begin
    try
      if T_TurcFecha.AsDateTime>FechaTrabajo then
        raise Exception.Create('Fecha del Turno no debe ser mayor a la Fecha de Trabajo del día');
      if (T_TurcTurno.AsInteger>=1)and(not QT_Turca.IsEmpty) then
        raise Exception.Create('Existe turno abierto de otro día');
      if VarGasPolizaLiqDia='Si' then begin
        with DMGAS do begin
          Q_Auxi.Close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC');
          Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
          Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
          Q_Auxi.SQL.Add('  and Contabilizado="Si" ');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if Q_AuxiEntero1.AsInteger>0 then
            raise Exception.Create('Dia ya está contabilizado');
        end;
      end;
      T_Turc.post;
      RefrescaDataBase(DBGAS1);
      RefrescaQuery(DMGASQ.QT_Turca);
    except
      with DMGAS do begin
        if T_Turc.State=dsInsert then
          T_Turc.Cancel;
      end;
      raise;
    end;
  end;
end;

procedure TFLIQLIQGN.CerrarTurno;
var LClaseCred,
    LClaseCupo,
    LClaseTarj:TStringList;
    i:word;

  procedure LimpiaValesEnCeroEnPval;
  begin
    with DMGAS do begin
      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DGASPVAL SET FACTURADO="No"');
        Q_Auxi.SQL.Add('WHERE CANTIDAD=0 AND TOTAL=0 AND FACTURADO="Si"');
        Q_Auxi.ExecSQL;

        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('DELETE FROM DGASPVAL');
        Q_Auxi.SQL.Add('WHERE CANTIDAD=0 AND TOTAL=0 AND FACTURADO="No"');
        Q_Auxi.ExecSQL;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;

begin
  with DMGEN,DMGAS,DMLIQ do begin
    T_Turc.Active:=True;
    if T_Turc.Locate('Estacion;Caja;Fecha;Turno',VarArrayOf([DMGASQ.QT_TurcAESTACION.AsInteger, DMGASQ.QT_TurcACAJA.AsInteger,DMGASQ.QT_TurcAFECHA.AsDateTime,DMGASQ.QT_TurcATURNO.AsInteger]),[]) then;
    if T_TurcEstatus.AsString<>'A' then
      raise Exception.Create('Turno no se encuentra abierto.');
    if CajeroActual<>T_TurcCajero.AsInteger then begin
      MensajeErr('Usuario no es el Cajero del turno');
      ChecaDerechoEspecialAutor2(idCup,aeUsuarioCajeroSupervisor,True);
      if not FAutoriza.PassOk then
        exit;
    end;
    ApagaSwitchs('SwCalcFields');
    LClaseCred:=TStringList.Create;
    LClaseCupo:=TStringList.Create;
    LClaseTarj:=TStringList.Create;
    try
//        VerificarVales;
      if VarGasValidarValesyCupones='Si' then begin
        T_Tpag.Active:=true;
        T_Tpag.First;
        while not T_Tpag.Eof do begin
          if (T_TpagClase.AsString=idClaseCredito) or (T_TpagClase.AsString=idClaseCreditoAceites) then
            LClaseCred.Add(T_TpagClave.AsString)
          else
            if (T_TpagClase.AsString=idClaseCupones) or (T_TpagClase.AsString=idClaseCuponesAceites) then
              LClaseCupo.Add(T_TpagClave.AsString)
            else
              if (T_TpagClase.AsString=idClaseTarjFloIn)or(T_TpagClase.AsString=idClaseTarjeta)or(T_TpagClase.AsString=idClaseTarjIntCre)or(T_TpagClase.AsString=idClaseTarjIntPre)or(T_TpagClase.AsString=idClaseTarjIntCreAceites)or(T_TpagClase.AsString=idClaseTarjIntPreAceites) then
                LClaseTarj.Add(T_TpagClave.AsString);
          T_Tpag.Next;
        end;
        // valida cupones no liquidados de turnos anteriores
        if SistemaActivo(idPvg) then begin
          try
            Q_Auxi.Active:=false;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('select count(*) as Entero1 from DGASRCUP');
            Q_Auxi.SQL.Add('where liquidado="No"');
            Q_Auxi.SQL.Add('  and estacion='+IntToStr(T_TurcESTACION.asinteger));
            Q_Auxi.SQL.Add('  and fecha<"'+FechaToStrSQL(T_TurcFECHA.asdatetime)+'"');
            Q_Auxi.Active:=true;
            if Q_AuxiEntero1.AsInteger>0 then
              raise Exception.Create('No se puede cerrar: Hay cupones sin liquidar de dias anteriores');
          finally
            Q_Auxi.Active:=false;
          end;
        end;
        if LClaseCred.Count>0 then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDLIQP');
          Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.asinteger));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
          Q_Auxi.SQL.Add('  and (Clave_Pago="'+LClaseCred[0]+'" ');
          for i:=1 to LClaseCred.Count-1 do begin
            Q_Auxi.SQL.Add(' or Clave_Pago="'+LClaseCred[i]+'"');
          end;
          Q_Auxi.SQL.Add(')');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if abs(Q_AuxiReal1.AsFloat-T_TurcTotalVales.AsFloat)>0.01 then
            raise Exception.Create('Total de Vales de Credito diferente al Total Liquidado');
        end;
        if LClaseCupo.Count>0 then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDLIQP');
          Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.asinteger));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
          Q_Auxi.SQL.Add('  and (Clave_Pago="'+LClaseCupo[0]+'"');
          for i:=1 to LClaseCupo.Count-1 do begin
            Q_Auxi.SQL.Add(' or Clave_Pago="'+LClaseCupo[i]+'"');
          end;
          Q_Auxi.SQL.Add(')');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if abs(Q_AuxiReal1.AsFloat-T_TurcTotalCupRecup.AsFloat)>0.1 then
            raise Exception.Create('Total de Cupones diferente al Total Liquidado');
        end;
        //Valida que el total de transacciones en tarjetas sea igual a los pagos tipo tarjetas
        if LClaseTarj.Count>0 then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDLIQP');
          Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.asinteger));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
          Q_Auxi.SQL.Add('  and (Clave_Pago="'+LClaseTarj[0]+'" ');
          for i:=1 to LClaseTarj.Count-1 do begin
            Q_Auxi.SQL.Add(' or Clave_Pago="'+LClaseTarj[i]+'"');
          end;
          Q_Auxi.SQL.Add(')');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          
          if abs(Q_AuxiReal1.AsFloat-T_TurcTotalTran.AsFloat)>0.01 then
            raise Exception.Create('Total de Transacciones de Tarjetas diferente al Total Liquidado');
        end;
      end;
      try
        T_Turc.Edit;
        T_TurcEstatus.AsString:='C';
        T_TurcHoraFin.AsDateTime:=Date+Time;
        T_Turc.Post;

        VarLiqTurnoRestringido:=False;

        RefrescaQuery(DMGASQ.QT_Turca);
      except
        if T_Turc.State=dsInsert then T_Turc.Cancel;
        raise;
      end;
    finally
      RecuperaSwitchs;
      LimpiaValesEnCeroEnPval;
      LClaseCred.Free;
      LClaseCupo.Free;
      LClaseTarj.Free;
    end;
  end;
end;

function TFLIQLIQGN.VerificaTurno(swFecha: TDateTime; swTurno:Integer): Boolean;
begin
  with DMGASQ do begin
    QT_Turc.close;
    QT_Turc.ParamByName('pEstacion').asinteger:=DMGAS.EstacionActual;
    QT_Turc.ParamByName('pCaja').asinteger:=DMGAS.CajaActual;
    QT_Turc.ParamByName('pFecha').asdatetime:=swFecha;
    QT_Turc.open;
    if not QT_Turc.IsEmpty then begin
      QT_Turc.Last;
      swTurno:=swTurno+1;
    end
    else swTurno:=1;
  end;
  with DMGAS do begin
    Result:=True;
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select coalesce(count(*),0) as Entero1 from DGASTURC');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('and ((Fecha='+QuotedStr(FechaToStrSQL(swFecha))+' and turno>'+IntToStr(swTurno)+') or (Fecha>'+QuotedStr(FechaToStrSQL(swFecha))+'))');
      Q_Auxi.SQL.Add('and TipoCaja='+QuotedStr('Liquidacion'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger<=0 then
        Result:=False
      else
        Result:=True;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQLIQGN.HacerAjusteAutomatico(swFecha:TDateTime);
var
  swTurno:Integer;
  swEfectivo:Double;
begin
  with DMGAS do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind := fkInternalCalc;
      Q_AuxiReal1.FieldKind   := fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('select d.Turno as Entero1,coalesce(Sum(d.importe),0) as Real1 from DGASDLIQP d');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('  and d.fecha='+QuotedStr(FechaToStrSQL(swFecha)));
      Q_Auxi.SQL.Add('  and exists (select t.* from DGASTPAG t');
      Q_Auxi.SQL.Add('              where t.clave=d.clave_pago');
      Q_Auxi.SQL.Add('                and t.Clase='+QuotedStr('Efectivo')+')');
      Q_Auxi.SQL.Add('  and d.Aplicado='+QuotedStr('Si'));
      Q_Auxi.SQL.Add('group by turno');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      swEfectivo:=0;
      while not Q_Auxi.eof do begin
        if swEfectivo<Q_AuxiReal1.AsFloat then begin
          swTurno:=Q_AuxiEntero1.AsInteger;
          swEfectivo:=Q_AuxiReal1.AsFloat;
        end;
        Q_Auxi.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
    if DMGEN.VarComp('AliasAuxiliar')<>'' then begin
      with DMAJUS do begin
        try
          DBAJUS1.close;
          DBAJUS1.AliasName:=DMGEN.VarComp('AliasAuxiliar');
          DBAJUS1.open;

          //checa ajuste
          if not LocalizaTabla(TL_Ajud,'ESTACION;FECHA',VarArrayOf([EstacionActual,swFecha])) then begin
            if TL_Ajud.State<>dsBrowse then
              exit;
            try
              TL_Ajud.Append;
              TL_AjudEstacion.asinteger:=EstacionActual;
              TL_AjudFecha.AsDateTime:=swFecha;
              TL_AjudTurno.AsInteger:=swTurno;
              TL_Ajud.Post;
            except
            end;
          end;
          TL_Ajud.Refresh;
          if TL_AjudAPLICADO.AsString<>'Si' then begin
            TL_Ajud.Edit;
            TL_AjudAplicado.AsString:='Si';
            TL_Ajud.Post;
          end;
          if not TL_Ajud2.Active then
            TL_Ajud2.Open;
          TL_Ajud2.Refresh;
          TL_Ajud2.First;
          while not TL_Ajud2.Eof do begin
            try
              Q_AuxiAjus.Close;
              Q_AuxiAjus.SQL.Clear;
              Q_AuxiAjusReal1.FieldKind:=fkInternalCalc;
              Q_AuxiAjus.SQL.Add('select coalesce(ajuste,0) as Real1 from dame_ajuste_admin_global('+QuotedStr(FechaToStrSQL(T_TurcFECHA.AsDateTime))+','+TL_Ajud2COMBUSTIBLE.AsString+')');
              Q_AuxiAjus.Prepare;
              Q_AuxiAjus.Open;
              if not Q_AuxiAjus.IsEmpty then begin
                TL_Ajud2.Edit;
                TL_Ajud2VOLUMEN.AsFloat:=TL_Ajud2VENTA.AsFloat-Q_AuxiAjusReal1.AsFloat;
                TL_Ajud2.Post;
              end;
            finally
              Q_AuxiAjus.Close;
            end;
            TL_Ajud2.Next;
          end;
          DBAJUS1.Close;
        except
          on e:Exception do begin
            MensajeWarn('Error al intentar Ajuste Automático.'+#10#13+e.Message);
          end;
        end;
      end;
      with DMGAS do begin
        try
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('update DGASLIQG set Bloqueado='+QuotedStr('Si'));
          Q_Auxi.SQL.Add('where Estacion='+IntToStr(EstacionActual));
          Q_Auxi.SQL.Add('  and Fecha='+QuotedStr(FechaToStrSQL(swFecha)));
          Q_Auxi.sql.Add('  and caja='+IntToStr(CajaActual));
          Q_Auxi.SQL.Add('  and Turno='+IntToStr(swTurno));
          Q_Auxi.ExecSQL;                                  
        finally
          Q_Auxi.Close;
        end;
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.ValidarCupones;
var
  LClaseCred,
  LClaseCupo,
  LClaseTarj:TStringList;
  i:word;
  xtotaltmp:Real;
  montoTarjetaBancaria :Double;

  function obtenerCuponesIsla(estacion, isla, turno: Integer; fecha: TDateTime):Real;
  begin
    Result := 0;
    try
      QL_Cupo.Close;
      QL_Cupo.ParamByName('estacion').AsInteger := estacion;
      QL_Cupo.ParamByName('fecha').AsDate := fecha;
      QL_Cupo.ParamByName('isla').AsInteger := isla;
      QL_Cupo.paramByName('pturno').AsInteger:=turno;
      QL_Cupo.Prepare;
      QL_Cupo.Open;
      Result := QL_CupoIMPORTE.AsFloat;
    finally
      QL_Cupo.Close;
    end;
  end;

  function obtenerValesIsla(estacion, isla, turno: Integer; fecha: TDateTime):Real;
  begin
    Result := 0;
    with DMGAS do begin
      try
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.sql.clear;
        Q_Auxi.SQL.Add('select coalesce(sum(importe),0) as Real1 from dgasvale');
        Q_Auxi.SQL.Add('where estacion = '+IntToStr(estacion));
        Q_Auxi.SQL.Add('  and fecha = '+QuotedStr(FechaToStrSQL(fecha)));
        Q_Auxi.SQL.Add('  and isla = '+IntToStr(isla));
        Q_Auxi.SQL.Add('  and Turno= '+IntToStr(turno));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        Result := Q_AuxiReal1.AsFloat;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;

  function obtenerCreditosIsla(estacion, isla, turno: Integer; fecha : TDateTime):Real;
  begin
    Result := 0;
    with DMGAS do begin
      try
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.sql.clear;
        Q_Auxi.SQL.Add('select coalesce(sum(total),0) as Real1 from dgastran');
        Q_Auxi.SQL.Add('where estacion = '+IntToStr(estacion));
        Q_Auxi.SQL.Add('  and fecha = '+QuotedStr(FechaToStrSQL(fecha)));
        Q_Auxi.SQL.Add('  and isla = '+IntToStr(isla));
        Q_Auxi.SQL.Add('  and Turno= '+IntToStr(turno));
        Q_Auxi.SQL.Add('  and TipoVenta in (' + quotedstr('CR') + ',' + quotedstr('PP') + ')');
        if CteEzzyGas>0 then
          Q_Auxi.SQL.Add('and Cliente<>'+IntToStr(CteEzzyGas));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        Result := Q_AuxiReal1.AsFloat;
      finally
        Q_Auxi.Close;
      end;   
    end;
  end;

begin
  with DMGEN,DMGAS,DMLIQ do begin
  //        VerificarVales;
    if VarGasValidarValesyCupones='Si' then begin
      T_Turc.Open;
      T_Tpag.Active:=true;
      T_Tpag.First;
      LClaseCred:=TStringList.Create;
      LClaseCupo:=TStringList.Create;
      LClaseTarj:=TStringList.Create;
      while not T_Tpag.Eof do begin
        if (T_TpagClase.AsString=idClaseCredito) or (T_TpagClase.AsString=idClaseCreditoAceites) then
          LClaseCred.Add(T_TpagClave.AsString)
        else
          if (T_TpagClase.AsString=idClaseCupones) or (T_TpagClase.AsString=idClaseCuponesAceites) then
            LClaseCupo.Add(T_TpagClave.AsString)
          else
            if (T_TpagClase.AsString=idClaseTarjFloIn)or(T_TpagClase.AsString=idClaseTarjeta)or(T_TpagClase.AsString=idClaseTarjIntCre)or(T_TpagClase.AsString=idClaseTarjIntPre)or(T_TpagClase.AsString=idClaseTarjIntCreAceites)or(T_TpagClase.AsString=idClaseTarjIntPreAceites) then
              LClaseTarj.Add(T_TpagClave.AsString);

        T_Tpag.Next;
      end;
      // valida cupones no liquidados de turnos anteriores
      if SistemaActivo(idPvg) then begin
        try
          Q_Auxi.Active:=false;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('select count(*) as Entero1 from DGASRCUP');
          Q_Auxi.SQL.Add('where liquidado="No"');
          Q_Auxi.SQL.Add('  and estacion='+IntToStr(T_TurcESTACION.asinteger));
          Q_Auxi.SQL.Add('  and fecha<"'+FechaToStrSQL(T_TurcFECHA.asdatetime)+'"');
          Q_Auxi.Active:=true;
          if Q_AuxiEntero1.AsInteger>0 then
            raise Exception.Create('No se puede cerrar: Hay cupones sin liquidar de dias anteriores');
        finally
          Q_Auxi.Active:=false;
        end;
      end;
      xtotaltmp:=0;
      if LClaseCred.Count>0 then begin
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDLIQP');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.asinteger));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
        Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
        Q_Auxi.SQL.Add('  and (Clave_Pago="'+LClaseCred[0]+'" ');
        for i:=1 to LClaseCred.Count-1 do begin
          Q_Auxi.SQL.Add(' or Clave_Pago="'+LClaseCred[i]+'"');
        end;
        Q_Auxi.SQL.Add(')');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        xtotaltmp:=Q_AuxiReal1.AsFloat;
        T_Dliqp.First;
        while not T_Dliqp.Eof do begin
          if T_DliqpCLAVE_PAGO.AsString=LClaseCred[0] then begin
            xtotaltmp:=T_DliqpImporte.AsFloat;
            T_Dliqp.Next;
            continue;
          end;
          for i:=1 to LClaseCred.Count-1 do begin
            if T_DliqpCLAVE_PAGO.AsString=LClaseCred[i] then begin
              xtotaltmp:=T_DliqpImporte.AsFloat;
              break;
            end;
          end;
          T_Dliqp.Next;
        end;
        if (abs(xtotaltmp-obtenerValesIsla(T_LiqgESTACION.asinteger, T_LiqgISLA.AsInteger, T_Liqgturno.AsInteger, T_LiqgFECHA.AsDateTime))>0.01) then
          raise Exception.Create('Total de Vales de Credito diferente al Total Liquidado');
      end;
      xtotaltmp:=0;
      if LClaseCupo.Count>0 then begin
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Sum(Importe) as Real1 from DGASDLIQP');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.asinteger));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
        Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
        Q_Auxi.SQL.Add('  and (Clave_Pago="'+LClaseCupo[0]+'"');
        for i:=1 to LClaseCupo.Count-1 do begin
          Q_Auxi.SQL.Add(' or Clave_Pago="'+LClaseCupo[i]+'"');
        end;
        Q_Auxi.SQL.Add(')');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        xtotaltmp:=Q_AuxiReal1.AsFloat;
        T_Dliqp.First;
        while not T_Dliqp.Eof do begin
          if T_DliqpCLAVE_PAGO.AsString=LClaseCupo[0] then begin
            xtotaltmp:=T_DliqpImporte.AsFloat;
            T_Dliqp.Next;
            continue;
          end;
          for i:=1 to LClaseCupo.Count-1 do begin
            if T_DliqpCLAVE_PAGO.AsString=LClaseCupo[i] then begin
              xtotaltmp:=T_DliqpImporte.AsFloat;
              break;
            end;
          end;
          T_Dliqp.Next;
        end;
        if (abs(xtotaltmp-obtenerCuponesIsla(T_LiqgESTACION.asinteger, T_LiqgISLA.AsInteger, T_Liqgturno.AsInteger, T_LiqgFECHA.AsDateTime))>0.1) then
          raise Exception.Create('Total de Cupones diferente al Total Liquidado');
      end;
    //Valida que el total de transacciones en tarjetas sea igual a los pagos tipo tarjetas
      xtotaltmp:=0;
      if LClaseTarj.Count>0 then begin
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Sum(ImporteCMB) as Real1 from DGASTRAN');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_LiqgESTACION.asinteger));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_LiqgFECHA.AsDateTime)+'"');
        Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_Liqgturno.AsInteger));
        Q_Auxi.SQL.Add('  and Isla=' + IntToStr(T_LiqgISLA.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        xtotaltmp:=Q_AuxiReal1.AsFloat;
        T_Dliqp.First;
        xtotaltmp:=0;
        while not T_Dliqp.Eof do begin
          if T_DliqpCLAVE_PAGO.AsString=LClaseTarj[0] then begin
            xtotaltmp := xtotaltmp + T_DliqpImporte.AsFloat;
            T_Dliqp.Next;
            continue;
          end;
          for i:=1 to LClaseTarj.Count-1 do begin
            if T_DliqpCLAVE_PAGO.AsString=LClaseTarj[i] then begin
              xtotaltmp := xtotaltmp + T_DliqpImporte.AsFloat;
              break;
            end;
          end;
          T_Dliqp.Next;
        end;
        if (abs(xtotaltmp-obtenerCreditosIsla(T_LiqgESTACION.asinteger, T_LiqgISLA.AsInteger, T_Liqgturno.AsInteger, T_LiqgFECHA.AsDateTime))>0.01) then
          raise Exception.Create('Total de Transacciones de Tarjetas diferente al Total Liquidado');
      end;

      LClaseCred.Free;
      LClaseCupo.Free;
      LClaseTarj.Free;

      // Validar el importe de las tarjetas
      T_Dliqp.First;
      while not T_Dliqp.Eof do begin
        if T_DliqpCLAVE_PAGO.AsInteger = 3{ ClaveTarjetaBancaria} then begin
          xtotaltmp:=T_DliqpImporte.AsFloat;
        end;
        T_Dliqp.Next;
      end;

      if (Abs(xtotaltmp - ImporteTajetaBancaria) > 0.01) then
        raise Exception.Create('Total de transacciones con Tarjetas Bancarias diferente al Total Liquidado');

      //Validar el tipo de pago ptos
      if T_Dliqp.Locate('Clave_Pago',xClavePagoPtos,[]) then begin
        if Abs(XMontoTarjetaPuntos-T_DliqpIMPORTE.AsFloat) > 0.01 then begin
          raise Exception.Create('Total de transacciones con Tarjetas de Puntos diferente al Total Liquidado');
        end;
      end;
      if T_Dliqp.Locate('Clave_Pago',96,[]) then begin
        if Abs(acumEzzyGas-T_DliqpIMPORTE.AsFloat) > 0.01 then begin
          raise Exception.Create('Total de transacciones EzzyGas diferente al Total Liquidado');
        end;
      end;
    end;
  end;
end;

procedure TFLIQLIQGN.DuplicaVtasTInteligente;
var
  i:Integer;
begin
  with DMGAS,DMPVG do begin
    try
      if (NoElemStrSep(VarGasCteTICteTIOri,';')=2) and (VarGasTPagoTI<>'') then begin
        QL_Tran.Close;
        QL_Tran.ParamByName('PNOCLIE').AsInteger:=StrToInt(ExtraeElemStrSep(VarGasCteTICteTIOri,1,';'));
        QL_Tran.Prepare;
        QL_Tran.Open;
        QL_Tran.First;
        Q_Clie.Close;
        Q_Clie.SQL.Clear;
        Q_Clie.SQL.Add('INSERT INTO DGASTRAN (FOLIO,TIPOVENTA,ESTACION,ISLA,BOMBA,FECHA,TURNO,HORA,CLIENTE,ESTATUS,VEHICULO, '+
                                  'COMBUSTIBLE,PRECIO,LITROS,IMPORTECMB,TOTAL,DESPACHADOR,KILOMETRAJE,POSCARGA,TURNOLIQ,FOLIOVOLUMETRICO,SUBCODIGO,CHOFER) '+
                                  'VALUES (:FOLIO,:TIPOVENTA,:ESTACION,:ISLA,:BOMBA,:FECHA,:TURNO,:HORA,:CLIENTE,:ESTATUS,'+
                                  '(SELECT FIRST 1 VEHIC FROM DGASTARJ WHERE NOCLIE='+ExtraeElemStrSep(VarGasCteTICteTIOri,2,';')+' ORDER BY VEHIC),'+
                                  ':COMBUSTIBLE,:PRECIO,:LITROS,:IMPORTECMB,:TOTAL,:DESPACHADOR,:KILOMETRAJE,:POSCARGA,:TURNOLIQ,:FOLIOVOLUMETRICO,:SUBCODIGO,:CHOFER)');
        while not QL_Tran.Eof do begin
          Q_Clie.Close;
          Q_Clie.ParamByName('FOLIO').AsInteger            := Consecutivo('DGASTRAN','Folio','TipoVenta;Estacion',VarArrayOf([QL_TranTIPOVENTA.asstring,QL_TranESTACION.asinteger]));;
          Q_Clie.ParamByName('TIPOVENTA').AsString         := QL_TranTIPOVENTA.AsString;
          Q_Clie.ParamByName('ESTACION').AsInteger         := QL_TranESTACION.AsInteger;
          Q_Clie.ParamByName('ISLA').AsInteger             := QL_TranISLA.AsInteger;
          Q_Clie.ParamByName('BOMBA').AsInteger            := QL_TranBOMBA.AsInteger;
          Q_Clie.ParamByName('FECHA').AsDateTime           := QL_TranFECHA.AsDateTime;
          Q_Clie.ParamByName('TURNO').AsInteger            := QL_TranTURNO.AsInteger;
          Q_Clie.ParamByName('HORA').AsDateTime            := QL_TranHORA.AsDateTime;
          Q_Clie.ParamByName('CLIENTE').AsInteger          := StrToInt(ExtraeElemStrSep(VarGasCteTICteTIOri,2,';'));
          Q_Clie.ParamByName('ESTATUS').AsString           := 'A';
          Q_Clie.ParamByName('COMBUSTIBLE').AsInteger      := QL_TranCOMBUSTIBLE.AsInteger;
          Q_Clie.ParamByName('PRECIO').AsFloat             := QL_TranPRECIO.AsFloat;
          Q_Clie.ParamByName('LITROS').AsFloat             := QL_TranLITROS.AsFloat;
          Q_Clie.ParamByName('IMPORTECMB').AsFloat         := QL_TranIMPORTECMB.AsFloat;
          Q_Clie.ParamByName('TOTAL').AsFloat              := QL_TranTOTAL.AsFloat;
          Q_Clie.ParamByName('DESPACHADOR').AsInteger      := QL_TranDESPACHADOR.AsInteger;
          Q_Clie.ParamByName('KILOMETRAJE').AsInteger      := QL_TranKILOMETRAJE.AsInteger;
          Q_Clie.ParamByName('POSCARGA').AsInteger         := QL_TranPOSCARGA.AsInteger;
          Q_Clie.ParamByName('TURNOLIQ').AsInteger         := QL_TranTURNOLIQ.AsInteger;
          Q_Clie.ParamByName('FOLIOVOLUMETRICO').AsInteger := QL_TranFOLIOVOLUMETRICO.AsInteger;
          Q_Clie.ParamByName('SUBCODIGO').AsInteger        := QL_TranSUBCODIGO.AsInteger;
          Q_Clie.ParamByName('CHOFER').AsInteger           := QL_TranCHOFER.AsInteger;
          Q_Clie.ExecSQL;
          QL_Tran.Edit;
          QL_TranFACTURADO.AsString:='Si';
          QL_Tran.Post;
          QL_Tran.Next;
        end;
      end;
    except
      on e:Exception do
        raise Exception.Create('Error: '+e.Message);
    end;
  end;
end;

procedure TFLIQLIQGN.pagoNegativoTInte;
begin
  with DMGAS,DMLIQ do begin
    if (VarGasCteTICteTIOri<>'') and (VarGasTPagoTI<>'') then begin
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
      Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
      Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
      Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
      Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
      Q_Auxi.SQL.Add('  and estatus="A"');
      Q_Auxi.SQL.Add('  and Cliente = '+ExtraeElemStrSep(VarGasCteTICteTIOri,1,';'));
      Q_Auxi.Active:=true;
      T_DliqpImporte.ReadOnly:=False;
      T_Dliqp.Edit;
      T_DliqpImporte.Asfloat:={T_DliqpImporte.Asfloat-}Q_AuxiReal1.AsFloat*-1;
      T_Dliqp.Post;
      T_DliqpImporte.ReadOnly:=True;
      clavePagoTI:=T_DliqpCLAVE_PAGO.AsString;
    end;
  end;
end;

procedure TFLIQLIQGN.VerificaFDeposito;
var
  TotalFichas,TotalEfectivo:Double;
begin
  with DMGAS,DMLIQ do begin
    TotalFichas:=0;
    TotalEfectivo:=0;
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT SUM(TOTAL_ISLA) AS REAL1 FROM DGASTURCFD WHERE ESTACION=:ESTACION AND');
    Q_Auxi.SQL.Add('CAJA=:CAJA AND FECHA=:FECHA AND TURNO=:TURNO AND ISLA=:ISLA');
    Q_Auxi.ParamByName('ESTACION').AsInteger:=T_LiqgESTACION.AsInteger;
    Q_Auxi.ParamByName('CAJA').AsInteger:=T_LiqgCAJA.AsInteger;
    Q_Auxi.ParamByName('FECHA').AsDateTime:=T_LiqgFECHA.AsDateTime;
    Q_Auxi.ParamByName('TURNO').AsInteger:=T_LiqgTURNO.AsInteger;
    Q_Auxi.ParamByName('ISLA').AsInteger:=T_LiqgISLA.AsInteger;
    Q_Auxi.Open;
    TotalFichas:=Q_AuxiReal1.AsFloat;

    Q_Auxi.Close;
    Q_AuxiStr2.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT CLAVE AS STR2 FROM DGASTPAG WHERE CLASE=''Efectivo'' AND LIQUIDACION=''Si'' AND ACTIVO=''Si''');
    Q_Auxi.Open;
    while not Q_Auxi.Eof do begin
      LocalizaTabla(T_Dliqp,'CLAVE_PAGO',Q_AuxiStr2.AsString);
      TotalEfectivo:=TotalEfectivo+T_DliqpIMPORTE.AsFloat;
      Q_Auxi.Next;
    end;
    if TotalFichas>TotalEfectivo then
      raise Exception.Create('Total de ficha de depósito supera al importe de efectivo de la liquidación.'+#13#10+
                             'Favor de revisar las fichas de depósito o el efectivo de la liquidación.');
  end;
end;

function TFLIQLIQGN.ImporteSobrePrecios:Double;
var
  Importe0:Double;
begin
  with DMCONS, DMLIQ do begin
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_AuxiReal2.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT SUM(VOLUMEN) AS REAL1, SUM(IMPORTE) AS REAL2 FROM DPVGMOVI WHERE FECHATURNO=:FECHATURNO');
    Q_Auxi.SQL.Add('AND TURNO=:TURNO AND POSCARGA=:POSCARGA AND COMBUSTIBLE=:COMBUSTIBLE AND PRECIO<>:PRECIO');
    Q_Auxi.ParamByName('FECHATURNO').AsDateTime:=T_DliqcFECHA.AsDateTime;
    Q_Auxi.ParamByName('TURNO').AsInteger:=T_DliqcTURNO.AsInteger;
    Q_Auxi.ParamByName('POSCARGA').AsInteger:=T_DliqcPosCarga.AsInteger;
    Q_Auxi.ParamByName('COMBUSTIBLE').AsInteger:=T_DliqcCOMBUSTIBLE.AsInteger;
    Q_Auxi.ParamByName('PRECIO').AsFloat:=T_DliqcPRECIO_CIVA.AsFloat;
    Q_Auxi.Open;
    Importe0:=Q_AuxiReal1.AsFloat*T_DliqcPRECIO_CIVA.AsFloat;
    Result:=Importe0-Q_AuxiReal2.AsFloat;
  end;
end;

function TFLIQLIQGN.ObtenerVentasTAGasoPay(xEstacion:Integer;xFechaTurno:TDateTime;xTurno:Integer;xIsla:Integer):Double;
begin
  Result:=0;
  with DMGAS do begin
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT SUM(IMPORTE) AS REAL1 FROM DGASTAEGASOPAY');
    Q_Auxi.SQL.Add('WHERE ESTACION = '+IntToStr(xEstacion));
    Q_Auxi.SQL.Add('AND FECHATURNO = '+QuotedStr(FechaToStrSQL(xFechaTurno)));
    Q_Auxi.SQL.Add('AND TURNO = '+IntToStr(xTurno));
    Q_Auxi.SQL.Add('AND ISLA = '+IntToStr(xIsla));
    Q_Auxi.Prepare;
    Q_Auxi.Open;

    Result := Q_AuxiReal1.AsFloat;
  end;        
end;

procedure TFLIQLIQGN.CalculaVentasConsignacion;
begin
  with DMCONS do begin
    Q_Auxi.Close;
    Q_AuxiREAL1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT SUM(VOLUMEN) AS REAL1 FROM DPVGMOVI WHERE FECHATURNO=:FECHATURNO');
    Q_Auxi.SQL.Add('AND TURNO=:TURNO AND POSCARGA=:POSCARGA AND COMBUSTIBLE=:COMBUSTIBLE AND MANGUERA=:MANGUERA AND CONSIGNACION=:CONSIGNACION');
    Q_Auxi.ParamByName('FECHATURNO').AsDateTime:=DMLIQ.T_DliqcFECHA.AsDateTime;
    Q_Auxi.ParamByName('TURNO').AsInteger:=DMLIQ.T_DliqcTURNO.AsInteger;
    Q_Auxi.ParamByName('POSCARGA').AsInteger:=DMLIQ.T_DliqcPosCarga.AsInteger;
    Q_Auxi.ParamByName('COMBUSTIBLE').AsInteger:=DMLIQ.T_DliqcCOMBUSTIBLE.AsInteger;
    Q_Auxi.ParamByName('MANGUERA').AsInteger:=DMLIQ.T_DliqcBOMBA.AsInteger;
    Q_Auxi.ParamByName('CONSIGNACION').AsString:='Si';
    Q_Auxi.Prepare;
    Q_Auxi.Open;

    DMLIQ.T_DliqcCONSIGNACION.AsFloat:= Q_AuxiREAL1.AsFloat;

  end;
end;

procedure TFLIQLIQGN.CalculaDiferenciaLectura;
var
  diferencia:string;
begin
  with DMCONS do begin
    Q_Auxi.Close;
    Q_AuxiREAL1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT SUM(DIFLECTURAS) AS REAL1 FROM DPVGMOVI WHERE FECHATURNO=:FECHATURNO');
    Q_Auxi.SQL.Add('AND TURNO=:TURNO AND POSCARGA=:POSCARGA AND COMBUSTIBLE=:COMBUSTIBLE AND MANGUERA=:MANGUERA');
    Q_Auxi.ParamByName('FECHATURNO').AsDateTime:=DMLIQ.T_DliqcFECHA.AsDateTime;
    Q_Auxi.ParamByName('TURNO').AsInteger:=DMLIQ.T_DliqcTURNO.AsInteger;
    Q_Auxi.ParamByName('POSCARGA').AsInteger:=DMLIQ.T_DliqcPosCarga.AsInteger;
    Q_Auxi.ParamByName('COMBUSTIBLE').AsInteger:=DMLIQ.T_DliqcCOMBUSTIBLE.AsInteger;
    Q_Auxi.ParamByName('MANGUERA').AsInteger:=DMLIQ.T_DliqcBOMBA.AsInteger;
    Q_Auxi.Prepare;
    Q_Auxi.Open;

    DMLIQ.T_DliqcDIFLECTURAS.AsFloat :=  TruncarNDecimales(DMCONS.Q_AuxiREAL1.AsFloat,4) ;
  end;
end;

end.




