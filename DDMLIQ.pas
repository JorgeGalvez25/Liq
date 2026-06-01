unit DDMLIQ;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, RxMemDS, Master_Intf, DDM_KIOS;

type
  TDMLIQ = class(TDataModule)
    T_Tran: TTable;
    T_TranTIPOVENTA: TStringField;
    T_TranESTACION: TIntegerField;
    T_TranFOLIO: TIntegerField;
    T_TranISLA: TIntegerField;
    T_TranBOMBA: TIntegerField;
    T_TranFECHA: TDateTimeField;
    T_TranTURNO: TIntegerField;
    T_TranHORA: TDateTimeField;
    T_TranCLIENTE: TIntegerField;
    T_TranVEHICULO: TIntegerField;
    T_TranCOMBUSTIBLE: TIntegerField;
    T_TranPRECIO: TFloatField;
    T_TranLITROS: TFloatField;
    T_TranIMPORTECMB: TFloatField;
    T_TranIMPORTEOTR: TFloatField;
    T_TranTOTAL: TFloatField;
    T_TranESTATUS: TStringField;
    T_TranDESPACHADOR: TIntegerField;
    T_TranINDICE: TIntegerField;
    T_TranKILOMETRAJE: TIntegerField;
    T_TranPOSCARGA: TIntegerField;
    T_TranTASAIVA: TFloatField;
    T_TranTURNOLIQ: TIntegerField;
    DS_Tran: TDataSource;
    T_Liqg: TTable;
    T_LiqgESTACION: TIntegerField;
    T_LiqgFOLIO: TIntegerField;
    T_LiqgCAJA: TIntegerField;
    T_LiqgFECHA: TDateTimeField;
    T_LiqgTURNO: TIntegerField;
    T_LiqgDESPACHADOR: TIntegerField;
    T_LiqgTOTGAS: TFloatField;
    T_LiqgTOTALMA: TFloatField;
    T_LiqgTOTGRAL: TFloatField;
    T_LiqgAPLICADO: TStringField;
    T_LiqgCAMBIA_SALDOINI: TStringField;
    T_LiqgTOTPAGO: TFloatField;
    DS_Liqg: TDataSource;
    T_Dliqc: TTable;
    DS_Dliqc: TDataSource;
    T_DliqcESTACION: TIntegerField;
    T_DliqcFOLIO: TIntegerField;
    T_DliqcBOMBA: TIntegerField;
    T_DliqcISLA: TIntegerField;
    T_DliqcCOMBUSTIBLE: TIntegerField;
    T_DliqcFECHA: TDateTimeField;
    T_DliqcTURNO: TIntegerField;
    T_DliqcLEC_ANT: TFloatField;
    T_DliqcLEC_ACT: TFloatField;
    T_DliqcCANTIDAD: TFloatField;
    T_DliqcPRECIO_CIVA: TFloatField;
    T_DliqcIMPORTE: TFloatField;
    T_DliqcAPLICADO: TStringField;
    T_Dliqa: TTable;
    DS_Dliqa: TDataSource;
    T_DliqaESTACION: TIntegerField;
    T_DliqaFOLIO: TIntegerField;
    T_DliqaPRODUCTO: TIntegerField;
    T_DliqaISLA: TIntegerField;
    T_DliqaFECHA: TDateTimeField;
    T_DliqaTURNO: TIntegerField;
    T_DliqaSALD_INI: TFloatField;
    T_DliqaENTRADAS: TFloatField;
    T_DliqaDEVOL: TFloatField;
    T_DliqaVENTA: TFloatField;
    T_DliqaPRECIO_CIVA: TFloatField;
    T_DliqaIMPORTE: TFloatField;
    T_Dliqp: TTable;
    DS_Dliqp: TDataSource;
    T_DliqpESTACION: TIntegerField;
    T_DliqpFOLIO: TIntegerField;
    T_DliqpCLAVE_PAGO: TStringField;
    T_DliqpIMPORTE: TFloatField;
    T_DliqcDescCombustible: TStringField;
    T_LiqgFechaPaq: TStringField;
    T_DliqpDescripcionPago: TStringField;
    T_DliqaNombreProducto: TStringField;
    T_DliqaSALD_FIN: TFloatField;
    T_DliqaAPLICADO: TStringField;
    T_DliqaCALCULADO: TStringField;
    T_Pval: TTable;
    T_PvalESTACION: TIntegerField;
    T_PvalCAJA: TIntegerField;
    T_PvalFECHA: TDateTimeField;
    T_PvalTURNO: TIntegerField;
    T_PvalINDICE: TIntegerField;
    T_PvalCLIENTE: TIntegerField;
    T_PvalCANTIDAD: TIntegerField;
    T_PvalTOTAL: TFloatField;
    T_PvalFACTURADO: TStringField;
    T_PvalSERIEFAC: TStringField;
    T_PvalFOLIOFAC: TIntegerField;
    DS_Pval: TDataSource;
    T_Vale: TTable;
    DS_Vale: TDataSource;
    T_Dval: TTable;
    DS_Dval: TDataSource;
    T_ValeESTACION: TIntegerField;
    T_ValeCAJA: TIntegerField;
    T_ValeFECHA: TDateTimeField;
    T_ValeTURNO: TIntegerField;
    T_ValeINDICE: TIntegerField;
    T_ValeINDICEVALE: TIntegerField;
    T_ValeIMPORTE: TFloatField;
    T_DvalESTACION: TIntegerField;
    T_DvalCAJA: TIntegerField;
    T_DvalFECHA: TDateTimeField;
    T_DvalTURNO: TIntegerField;
    T_DvalINDICE: TIntegerField;
    T_DvalINDICEVALE: TIntegerField;
    T_DvalPRODUCTO: TIntegerField;
    T_DvalIMPORTE: TFloatField;
    T_PvalINDICEVALE: TIntegerField;
    QB_Liqg: TQuery;
    QB_LiqgESTACION: TIntegerField;
    QB_LiqgFOLIO: TIntegerField;
    QB_LiqgISLA: TIntegerField;
    QB_LiqgCAJA: TIntegerField;
    QB_LiqgFECHA: TDateTimeField;
    QB_LiqgTURNO: TIntegerField;
    QB_LiqgDESPACHADOR: TIntegerField;
    QB_LiqgTOTGAS: TFloatField;
    QB_LiqgTOTALMA: TFloatField;
    QB_LiqgTOTGRAL: TFloatField;
    QB_LiqgAPLICADO: TStringField;
    QB_LiqgCAMBIA_SALDOINI: TStringField;
    QB_LiqgTOTPAGO: TFloatField;
    T_DliqpFECHA: TDateTimeField;
    T_DliqpTURNO: TIntegerField;
    T_DliqpAPLICADO: TStringField;
    T_PvalESTACIONFAC: TIntegerField;
    T_ValeFACTURADO: TStringField;
    T_ValeESTACIONFAC: TIntegerField;
    T_ValeSERIEFAC: TStringField;
    T_ValeFOLIOFAC: TIntegerField;
    T_DvalFACTURADO: TStringField;
    T_DvalESTACIONFAC: TIntegerField;
    T_DvalSERIEFAC: TStringField;
    T_DvalFOLIOFAC: TIntegerField;
    T_LiqgTotalGasAlma: TFloatField;
    T_Lect: TTable;
    T_LectESTACION: TIntegerField;
    T_LectFECHA: TDateTimeField;
    T_LectTURNO: TIntegerField;
    T_LectUSUARIO: TStringField;
    DS_Lect: TDataSource;
    T_Dlec: TTable;
    T_DlecESTACION: TIntegerField;
    T_DlecFECHA: TDateTimeField;
    T_DlecTURNO: TIntegerField;
    T_DlecMANGUERA: TIntegerField;
    T_DlecLECTURAINIC: TFloatField;
    DS_Dlec: TDataSource;
    T_LectDescripTurno: TStringField;
    T_DlecDEVOLUCION: TFloatField;
    T_DliqcDEVOLUCION: TFloatField;
    T_DliqcDevolucionCalc: TIntegerField;
    T_Dtpag: TTable;
    DS_Dtpag: TDataSource;
    T_DtpagESTACION: TIntegerField;
    T_DtpagFOLIO: TIntegerField;
    T_DtpagCLAVE_PAGO: TStringField;
    T_DtpagINDICE: TIntegerField;
    T_DtpagCLIENTE: TIntegerField;
    T_DtpagNOMBRE: TStringField;
    T_DtpagREFERENCIA: TStringField;
    T_DtpagIMPORTE: TFloatField;
    T_DliqpDesglosa: TStringField;
    T_DliqpINDICE: TIntegerField;
    T_DvalSUBCLAVE: TIntegerField;
    T_DvalCLIENTE: TIntegerField;
    T_DvalDescripcion: TStringField;
    Memo1: TMemo;
    T_DvalTipo: TStringField;
    T_DvalCANTIDAD: TFloatField;
    T_PvalSUBCODIGO: TIntegerField;
    T_LiqgCALC: TStringField;
    T_LiqgISLA: TIntegerField;
    T_ValeCLIENTE: TIntegerField;
    T_ValeDESPACHADOR: TIntegerField;
    T_ValeSUBCODIGO: TIntegerField;
    T_DvalSUBCODIGO: TIntegerField;
    T_DliqpClasePago: TStringField;
    TL_Desp: TTable;
    DSTL_Desp: TDataSource;
    TL_DespCLAVE: TIntegerField;
    TL_DespNOMBRE: TStringField;
    T_LiqgNombreDespachador: TStringField;
    T_ValeNombreDesp: TStringField;
    T_PvalNombreCliente: TStringField;
    T_PvalFECHAFACTURA: TDateTimeField;
    T_DliqcPosCarga: TIntegerField;
    T_DlecPOSCARGA: TIntegerField;
    T_DlecCOMBUSTIBLE: TIntegerField;
    T_DlecNombreCombustible: TStringField;
    T_ValeFOLIOVOLUMETRICO: TIntegerField;
    T_ValeISLA: TIntegerField;
    T_LiqgLiquidacionStr: TStringField;
    TM_Dliqc: TRxMemoryData;
    TM_DliqcCombustible: TIntegerField;
    TM_DliqcImporte: TFloatField;
    TM_DliqcNombre: TStringField;
    DSTM_Dliqc: TDataSource;
    T_LiqgRECOLECCION_PARCIAL: TFloatField;
    T_LiqgLIQUIDAGLOBAL: TStringField;
    T_Dliqe: TTable;
    DS_Dliqe: TDataSource;
    T_DliqeESTACION: TIntegerField;
    T_DliqeFOLIO: TIntegerField;
    T_DliqeCLAVE_PAGO: TStringField;
    T_DliqeINDICE: TIntegerField;
    T_DliqeDENOMINACION: TFloatField;
    T_DliqeCANTIDAD: TFloatField;
    T_DliqeIMPORTE: TFloatField;
    T_DliqcIEPS_POR_LITRO: TFloatField;
    T_DliqcIMPORTE_IEPS: TFloatField;
    T_LiqgTOTAL_IEPS: TFloatField;
    T_DliqcImp_IEPS: TFloatField;
    T_DliqpTP_KIOSKO: TIntegerField;
    T_LiqgBLOQUEADO: TStringField;
    T_DliqpCLAVE_PAGO_ENTERO: TIntegerField;
    T_DliqPc: TTable;
    T_DliqPcESTACION: TIntegerField;
    T_DliqPcFOLIO: TIntegerField;
    T_DliqPcCLAVE_PAGO: TStringField;
    T_DliqPcINDICE: TIntegerField;
    T_DliqPcNOCLIENTE: TIntegerField;
    T_DliqPcIMPORTE: TFloatField;
    DS_DliqPc: TDataSource;
    T_DliqPcNombreCliente: TStringField;
    T_DliqcIMPORTE_SP: TFloatField;
    T_Dliqcd: TTable;
    T_DliqcdESTACION: TIntegerField;
    T_DliqcdFOLIO: TIntegerField;
    T_DliqcdBOMBA: TIntegerField;
    T_DliqcdCOMBUSTIBLE: TIntegerField;
    T_DliqcdPRECIO: TFloatField;
    T_DliqcdIMPORTE: TFloatField;
    DS_Dliqcd: TDataSource;
    T_DliqcdNombreComb: TStringField;
    T_DliqcImporte_Final: TFloatField;
    T_ValePRECIO: TFloatField;
    T_DvalPRECIO: TFloatField;
    T_DliqCp: TTable;
    T_DliqCpESTACION: TIntegerField;
    T_DliqCpTURNO: TIntegerField;
    T_DliqCpPOSCARGA: TIntegerField;
    T_DliqCpCOMBUSTIBLE: TIntegerField;
    T_DliqCpFECHAHORA: TDateTimeField;
    T_DliqCpPRECIO: TFloatField;
    T_DliqCpLITROS: TFloatField;
    T_DliqCpIMPORTE: TFloatField;
    DS_DliqCp: TDataSource;
    T_LiqgTOTPAGOALMA: TFloatField;
    T_DliqcCONSIGNACION: TFloatField;
    T_Desc: TTable;
    T_DescESTACION: TIntegerField;
    T_DescFECHA: TDateTimeField;
    T_DescTURNO: TIntegerField;
    T_DescTOTAL: TFloatField;
    T_DescDESCUENTO: TFloatField;
    T_DescContabilizado: TStringField;
    Ds_Desc: TDataSource;
    T_Descd: TTable;
    T_DescdESTACION: TIntegerField;
    T_DescdFECHA: TDateTimeField;
    T_DescdTURNO: TIntegerField;
    T_DescdISLA: TIntegerField;
    T_DescdCOMBUSTIBLE: TIntegerField;
    T_DescdNombreCombustible: TStringField;
    T_DescdLITROS: TFloatField;
    T_DescdPRECIO: TFloatField;
    T_DescdIMPORTE: TFloatField;
    T_DescdDESCUENTO: TFloatField;
    T_DescdTOTAL: TFloatField;
    T_LiqgTOTDESCT: TFloatField;
    T_DliqcDIFLECTURAS: TFloatField;
    procedure T_LiqgAfterInsert(DataSet: TDataSet);
    procedure T_LiqgCalcFields(DataSet: TDataSet);
    procedure T_LiqgISLAValidate(Sender: TField);
    procedure T_DliqcAfterPost(DataSet: TDataSet);
    procedure T_DliqpAfterPost(DataSet: TDataSet);
    procedure T_DliqaAfterPost(DataSet: TDataSet);
    procedure T_DliqaAfterInsert(DataSet: TDataSet);
    procedure T_DliqaSALD_FINChange(Sender: TField);
    procedure T_PvalAfterPost(DataSet: TDataSet);
    procedure T_DvalAfterPost(DataSet: TDataSet);
    procedure T_ValeAfterPost(DataSet: TDataSet);
    procedure T_ValeBeforeInsert(DataSet: TDataSet);
    procedure T_ValeBeforePost(DataSet: TDataSet);
    procedure T_DvalBeforePost(DataSet: TDataSet);
    procedure T_PvalBeforePost(DataSet: TDataSet);
    procedure T_DvalAfterDelete(DataSet: TDataSet);
    procedure T_ValeAfterDelete(DataSet: TDataSet);
    procedure T_PvalAfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure T_DliqaPRODUCTOValidate(Sender: TField);
    procedure T_LectCalcFields(DataSet: TDataSet);
    procedure T_LectAfterInsert(DataSet: TDataSet);
    procedure T_LectBeforePost(DataSet: TDataSet);
    procedure T_DlecMANGUERAValidate(Sender: TField);
    procedure T_DliqcAfterInsert(DataSet: TDataSet);
    procedure T_DliqpAfterInsert(DataSet: TDataSet);
    procedure T_DliqcCalcFields(DataSet: TDataSet);
    procedure T_DvalCalcFields(DataSet: TDataSet);
    procedure T_DliqpBeforePost(DataSet: TDataSet);
    procedure T_DtpagAfterInsert(DataSet: TDataSet);
    procedure T_DtpagCLIENTEChange(Sender: TField);
    procedure T_DvalSUBCLAVEValidate(Sender: TField);
    procedure T_DvalIMPORTEChange(Sender: TField);
    procedure T_PvalCLIENTEValidate(Sender: TField);
    procedure T_ValeAfterInsert(DataSet: TDataSet);
    procedure T_LiqgISLAChange(Sender: TField);
    procedure T_DvalPRODUCTOChange(Sender: TField);
    procedure T_DvalCANTIDADChange(Sender: TField);
    procedure T_ValeISLAChange(Sender: TField);
    procedure T_ValeISLAValidate(Sender: TField);
    procedure T_DliqcLEC_ACTChange(Sender: TField);
    procedure T_DliqcDEVOLUCIONChange(Sender: TField);
    procedure T_DliqaBeforePost(DataSet: TDataSet);
    procedure T_DliqeAfterInsert(DataSet: TDataSet);
    procedure T_DliqeCANTIDADChange(Sender: TField);
    procedure T_DliqeAfterPost(DataSet: TDataSet);
    procedure T_DliqeBeforeInsert(DataSet: TDataSet);
    procedure T_PvalBeforeInsert(DataSet: TDataSet);
    procedure T_PvalBeforeEdit(DataSet: TDataSet);
    procedure T_ValeBeforeEdit(DataSet: TDataSet);
    procedure T_DvalBeforeInsert(DataSet: TDataSet);
    procedure T_DvalBeforeEdit(DataSet: TDataSet);
    procedure T_LiqgFECHAChange(Sender: TField);
    procedure T_DliqcImp_IEPSGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure T_DliqcIEPS_POR_LITROGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure T_DliqpAfterScroll(DataSet: TDataSet);
    procedure T_ValeBeforeDelete(DataSet: TDataSet);
    procedure T_DvalBeforeDelete(DataSet: TDataSet);
    procedure T_DliqPcAfterInsert(DataSet: TDataSet);
    procedure T_DliqaENTRADASChange(Sender: TField);
    procedure T_DliqaSALD_FINValidate(Sender: TField);
    procedure T_DliqcdCalcFields(DataSet: TDataSet);
    procedure T_ValeFOLIOVOLUMETRICOSetText(Sender: TField;
      const Text: String);
    procedure T_DliqpCalcFields(DataSet: TDataSet);
    procedure T_DliqcBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    swrefrescavales:boolean;
  public
    { Public declarations }
    SwLiqAutom:boolean; SwAjustadorAutomaticoLiq,
    SwCalculaResumen:boolean;
    VarLiqIndiceTurc:word;
    VarLiqKeyPress:Char;
    VarLiqTipoCmbDef:word;
    VarLiqTeclaAceites:string;
    VarLiqTurnoRestringido:Boolean;
    VarLiqModoReclasificar:Boolean;
    VarLiqTotalVales:Double;
    VarLiqNuevosPagos:Boolean;
    VarLiqUltimoDesp:integer;
    VarLiqUltimaIsla:integer;
    VarLiqCombustibleVolumetrico:integer;
    VarLiqIslaVolumetrico:integer;
    TotalDLIQE:double;
    SwInsertaEfectivo:boolean;
    SwLecturaTiposdePagos:Boolean;
    swValidaValesResguardo:Boolean;
    clavePagoTI:string;
    estTicket:string;
    lecturaModificada,calculandoLiq:Boolean;
    procedure AbreTablasLiqT(xTablas:String);
    procedure TotalVales;
    function ClaveCmb(var xTecla:char):word;
    function TotPagosLiqOk:Boolean;
    function TotAceitePagosLiqOk:Boolean;
    function SaldoFinalOk:Boolean;
    function LecturaActualOk:Boolean;
    function TotalDesgloseOk:Boolean;
    function CostoProductoInv(xAlma,xProd:Integer;xFechaIni,xFechaFin:TDateTime):real;
    function CostoCombustibleInv(xAlma,xCombustible:Integer;xFechaIni,xFechaFin:TDateTime):real;
    function TurnoEsRestringido(xTurno:Integer=0;xFecha:TDateTime=0):Boolean;
    procedure CalculaResumenCombustible;
    procedure CalculaResumenPrecios;
    Procedure InsertaDenominaciones;
    procedure TotalizaLiqe;
    function DeterminaFactorDeAjuste(AEstacion:Integer;AFechaIni,AFechaFin:TDateTime;ACombustible,AIsla,ATurno:Integer):Double;
    function DeterminaFactorDeAjusteMultiEsts(AEstaciones:string;AFechaIni,AFechaFin:TDateTime;ACombustible,AIsla,ATurno:Integer):Double;
    function GetImporteAjustadoIsla(const AEstacion:Integer;const AFecha:TDateTime;const AIsla, ATurno:Integer):Double;
    function GetLitrosAjustadosIsla(const AEstacion:Integer;const AFecha:TDateTime;const AIsla, ATurno:Integer):Double;
    function GetHayAjusteEnElDia(const AEstacion:integer;const AFecha:TDateTime):Boolean;
    function GetPosCargaIGAS(const AEstacion, ABomba:Integer):Integer;
    function ValidaDerechoReportesConsultas(const ASIST:string): Boolean;
    procedure ValidarFolioVolumetricoPublicoGeneral;

    function ObtenerUltimoPrecioAplicado(xFecha:TDateTime; xTurno, xCombustible:Integer):real;
    procedure ActualizaTablasDescuentos;
    procedure DesaplicaDescuentos;
    function CalculaImporteLiquidacion(turno, combustible, posCarga:integer; fecha:TDateTime; lecturaIni, lecturaFin:real):real;
    function ValidaMultiplesPreciosLiquidacion(turno, combustible, posCarga:integer; fecha:TDateTime):Boolean;
    function TruncarNDecimales(valorOriginal: Double; CantidadDecimales: Integer): Double;
  end;

Const
  NoDenom=13;
  denominaciones:array [1..NoDenom] of double=(1000.00,500.00,200.00,100.00,50.00,20.00,10.00,5.00,2.00,1.00,0.50,0.20,0.10);

var
  DMLIQ: TDMLIQ;

implementation

uses DDMGAS, DDMGASQ, ULIBGRAL, ULIBDATABASE, DDMGEN_VTAS, DDMGEN, DDMCUP,
  DDMCONS, UIMGENCRYP, UAutoriza, UGEN_NET, DDMGASNET, DDM_PUNTOS{, UFAGCARGANDO};


{$R *.DFM}

procedure TDMLIQ.AbreTablasLiqT(xTablas:string);
var i,ne:word;
    Tabla:string;
begin
  ne:=NoElemStrSep(xTablas,';');
  for i:=1 to ne do begin
    Tabla:=Mayusculas(ExtraeElemStrSep(xTablas,i,';'));
    if (Tabla='LIQG') or(Tabla='*') then T_Liqg.Active :=true;
    if (Tabla='DLIQC')or(Tabla='*') then T_Dliqc.Active:=true;
    if (Tabla='DLIQA')or(Tabla='*') then T_Dliqa.Active:=true;
    if (Tabla='DLIQP')or(Tabla='*') then T_Dliqp.Active:=true;
    if (Tabla='DTPAG')or(Tabla='*') then T_Dtpag.Active:=true;
    if (Tabla='PVAL') or(Tabla='*') then T_Pval.Active :=true;
    if (Tabla='VALE') or(Tabla='*') then T_Vale.Active :=true;
    if (Tabla='DVAL') or(Tabla='*') then T_Dval.Active :=true;
  end;
end;

procedure TDMLIQ.T_LiqgAfterInsert(DataSet: TDataSet);
begin
  with DMGAS,DMGASQ do begin
    T_LiqgEstacion.AsInteger:=QT_TurcaEstacion.AsInteger;
    T_LiqgCaja.AsInteger:=CajaActual;
    T_LiqgFecha.AsDateTime:=QT_TurcaFecha.AsDateTime;
    T_LiqgTurno.AsInteger:=QT_TurcaTurno.AsInteger;
    T_LiqgFolio.AsInteger:=Consecutivo(T_Liqg.TableName,'Folio','Estacion',T_LiqgEstacion.AsInteger);
    T_LiqgDespachador.AsInteger:=1;
    T_LiqgAplicado.AsString:='No';
    T_LiqgCalc.AsString:='No';
    T_LiqgCambia_SaldoIni.AsString:='No';
    T_LiqgLIQUIDAGLOBAL.AsString:='No';
    T_LiqgBLOQUEADO.AsString := 'No';
  end;
end;

procedure TDMLIQ.T_LiqgCalcFields(DataSet: TDataSet);
begin
  T_LiqgFechaPaq.AsString:=FechaPaq(T_LiqgFecha.AsDateTime);
  T_LiqgTotalGasAlma.AsFloat:=T_LiqgTotGas.AsFloat+T_LiqgTotAlma.AsFloat;
  T_LiqgLiquidacionStr.AsString:=IntToClaveNum(T_LiqgEstacion.AsInteger,2)+'-'+IntToClaveNum(T_LiqgIsla.AsInteger,2)+'-'+IntToClaveNum(T_LiqgFolio.AsInteger,6);
end;

procedure TDMLIQ.T_LiqgISLAValidate(Sender: TField);
begin
  with DMGAS do begin
    if not LocalizaTabla(TL_Isla,'Estacion;Isla',VarArrayOf([T_LiqgEstacion.AsInteger,T_LiqgIsla.AsInteger])) then
      raise Exception.Create('No existe Isla en esta Estación');
    QB_Liqg.Close;
    QB_Liqg.ParamByName('pestacion').AsInteger:=T_LiqgEstacion.AsInteger;
    QB_Liqg.ParamByName('pfecha').AsDateTime:=T_LiqgFecha.AsDateTime;
    QB_Liqg.ParamByName('pturno').AsInteger:=T_LiqgTurno.AsInteger;
    QB_Liqg.Prepare;
    QB_Liqg.Open;
    if LocalizaQuery(QB_Liqg,'Isla',T_LiqgIsla.AsInteger) then
      raise Exception.Create('Isla ya fue capturada en este turno');
  end;
end;

procedure TDMLIQ.T_DliqcAfterPost(DataSet: TDataSet);
begin
  CalculaResumenCombustible;
  CalculaResumenPrecios;
  T_Liqg.Refresh;
  T_Dliqc.Refresh;
  T_Liqg.Edit;
end;

procedure TDMLIQ.T_DliqpAfterPost(DataSet: TDataSet);
begin
  T_Liqg.Refresh;
  T_Dliqp.Refresh;
  T_Liqg.Edit;
end;

procedure TDMLIQ.T_DliqaAfterPost(DataSet: TDataSet);
begin
  T_Dliqa.Refresh;
  if T_Liqg.State in [dsInsert,dsEdit] then
    T_Liqg.Post;
  T_Liqg.Refresh;
  T_Liqg.Edit;
//  T_Liqg.Cancel;
//  T_Liqg.Edit;
//  TotalAceites;
end;

procedure TDMLIQ.T_DliqaAfterInsert(DataSet: TDataSet);
begin
  with DMGASQ do begin
    T_DliqaTurno.AsInteger:=T_LiqgTurno.AsInteger;
    T_DliqaFecha.AsDateTime:=T_LiqgFecha.AsDateTime;
    T_DliqaIsla.AsInteger:=T_LiqgIsla.AsInteger;
    T_DliqaCalculado.AsString:='No';
    T_DliqaProducto.ReadOnly:=T_DliqaCalculado.AsString='Si';
    T_DliqaSald_Ini.ReadOnly:=true;
    T_DliqaVenta.ReadOnly:=T_DliqaCalculado.AsString='Si';
    T_DliqaPrecio_Civa.ReadOnly:=T_DliqaCalculado.AsString='Si';
    T_DliqaImporte.ReadOnly:=T_DliqaCalculado.AsString='Si';
  end;
end;

procedure TDMLIQ.T_DliqaSALD_FINChange(Sender: TField);
var venta:real;
begin
  with DMGAS,DMCUP do begin
    if T_DliqaCalculado.AsString='No' then begin
      Venta:=T_DliqaSald_Ini.AsFloat+T_DliqaEntradas.AsFloat-
                            T_DliqaDevol.AsFloat-T_DliqaSald_Fin.AsFloat;
      T_DliqaVenta.AsFloat:=venta;
      if LocalizaTabla(T_Prod,'Clave',T_DliqaProducto.AsInteger) then begin
        if limpiastr(T_ProdUnidad.AsString)<>'%' then
            T_DliqaPrecio_Civa.AsFloat:=PrecioProductoFecha(T_ProdClave.asinteger,T_DliqaFecha.AsDateTime);
        T_DliqaImporte.AsFloat:=AjustaFloat(T_DliqaVenta.AsFloat*T_DliqaPrecio_Civa.AsFloat,2);
      end;
    end;
  end;
end;

procedure TDMLIQ.T_PvalAfterPost(DataSet: TDataSet);
begin
//  TotalVales;
end;

procedure TDMLIQ.T_DvalAfterPost(DataSet: TDataSet);
begin
  RefrescaDataBase(DMGAS.DBGAS2);
//  TotalVales;
end;

procedure TDMLIQ.T_ValeAfterPost(DataSet: TDataSet);
var xclave:word;
begin
  with DMGAS do begin
    if (T_ValeImporte.IsNull)or(T_ValeImporte.AsFloat<0.001) then begin
      T_Vale.Refresh;
      T_Vale.Delete;
      exit;
    end;

    if (T_ValeFolioVolumetrico.AsInteger > 0) then begin
      with DMGAS do begin
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASVALE');
        Q_Auxi.SQL.Add('where FolioVolumetrico='+inttostr(T_ValeFolioVolumetrico.AsInteger));
        Q_Auxi.SQL.Add('  and Estacion='+inttostr(T_ValeEstacion.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;

        if Q_AuxiEntero1.AsInteger>1 then begin
          MensajeInfo('Folio de ticket volumétrico ya fue capturado');
          T_Vale.Refresh;
          T_Vale.Delete;
          exit;
        end;

        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASCUPO');
        Q_Auxi.SQL.Add('where FolioVolumetrico='+inttostr(T_ValeFolioVolumetrico.AsInteger));
        Q_Auxi.SQL.Add('  and Estacionrecup='+IntToStr(T_ValeEstacion.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;

        if Q_AuxiEntero1.AsInteger>1 then begin
          MensajeInfo('Folio de ticket volumétrico está relacionado a cupón');
          T_Vale.Refresh;
          T_Vale.Delete;
          exit;
        end;

        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTRAN');
        Q_Auxi.SQL.Add('where FolioVolumetrico='+inttostr(T_ValeFolioVolumetrico.AsInteger));
        Q_Auxi.SQL.Add('  and Estacion='+inttostr(T_ValeEstacion.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;

        if Q_AuxiEntero1.AsInteger>1 then begin
          MensajeInfo('Folio de ticket volumétrico está relacionado a transacción');
          T_Vale.Refresh;
          T_Vale.Delete;
          exit;
        end;
      end;
    end;

    SwRefrescaVales:=false;
    try
      while not T_Dval.IsEmpty do
        T_Dval.Delete;
    finally
      SwRefrescaVales:=true;
    end;
    if T_ValeDespachador.AsInteger>0 then
      VarLiqUltimoDesp:=T_ValeDespachador.AsInteger;
    if T_ValeIsla.AsInteger>0 then
      VarLiqUltimaIsla:=T_ValeIsla.AsInteger;
    T_Pval.Refresh;
    T_Pval.Edit;
    T_PvalIndiceVale.AsInteger:=T_ValeIndiceVale.AsInteger;

    if T_Dval.RecordCount>0 then
      T_PvalTOTAL.AsFloat := T_ValeIMPORTE.AsFloat
    else
      T_PvalTOTAL.AsFloat := 0;

    T_Pval.Post;
    T_Pval.Refresh;
    if ((DMCONS.AliasConsolaEsts<>'')and(VarGasFolioVolumetricoVales='Si')and(not T_ValeFolioVolumetrico.IsNull))or((DMCUP._ticket<>nil)and(not T_ValeFolioVolumetrico.IsNull)) then begin
      T_Dval.Insert;
      T_DvalProducto.AsInteger:=VarLiqCombustibleVolumetrico;
    end
    else begin
      if not T_ValeFOLIOVOLUMETRICO.IsNull then begin
        xclave:=ClaveCmb(VarLiqKeyPress);
        T_Dval.Insert;
        if xclave>0 then
          T_DvalProducto.AsInteger:=xclave
        else
          T_DvalProducto.AsInteger:=1;
      end;
    end;
    if not T_ValeFOLIOVOLUMETRICO.IsNull then begin
    T_DvalImporte.AsFloat:=T_ValeImporte.AsFloat;
    T_DvalPRECIO.AsFloat:=T_ValePRECIO.AsFloat;
    T_Dval.Post;
    end;
//
  end;
end;

procedure TDMLIQ.T_ValeBeforeInsert(DataSet: TDataSet);
begin
  if not T_Vale.IsEmpty then
    Abort;
  
  if DMGAS.swTurnoLectura then
    Abort;
  if T_Pval.State=dsInsert then begin
    T_Pval.Post;
    T_Pval.Refresh;
  end;
end;

procedure TDMLIQ.T_ValeBeforePost(DataSet: TDataSet);
var ss,ss2,ests:string;
 xtag:integer;
 _desencrip:string;
 _importe:Real;
begin
  with DMGAS do begin
    if (VarCupResguardoEfectivo='Si') and (swValidaValesResguardo) then begin
      try
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASRESGPES');
        Q_Auxi.SQL.Add('where Fecha='+QuotedStr(FechaToStrSQL(T_PvalFECHA.AsDateTime)));
        Q_Auxi.SQL.Add('  and Indice_Val='+IntToStr(T_PvalINDICE.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger>0 then begin
          MensajeErr('Cliente no se puede modificar'+#13+'Para modificarlo entrar a "Resguardo de Efectivo"');
          T_Vale.Cancel;
          Abort;
        end;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;
  xtag:=0;
  if not DMGAS.SwServiciosMaster then begin
    if (not T_ValeFolioVolumetrico.IsNull)and(DMCONS.AliasConsolaEsts<>'') then begin
      // onvalidate
      with DMCONS do begin
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('select max(folio) as Entero1 from dpvgmovi');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if not((Length(IntToStr(Q_AuxiEntero1.AsInteger))=8) and (Length(IntToStr(T_ValeFolioVolumetrico.AsInteger))=8)) then begin
          ss:=T_ValeFolioVolumetrico.AsString;
          if DMLIQ.estTicket<>'' then begin
            ests:=IntToStr(T_ValeESTACION.AsInteger);
            while length(ests)>2 do
              delete(ests,1,1);
            if DMLIQ.estTicket<>ests then begin
              ests:=T_EstsIbNumeroEstacion.AsString;
              while length(ests)>2 do
                delete(ests,1,1);
              if DMLIQ.estTicket<>ests then begin
                T_Vale.cancel;
                MensajeInfo('Ticket no es de esta estación de Servicio');
                Abort;
              end;
            end;
          end
          else if length(ss)=9 then begin
            T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,3,7));
            ss2:=copy(ss,1,2);
            T_EstsIb.Active:=true;
            ests:=T_EstsIbNumeroEstacion.AsString;
            while length(ests)>2 do
              delete(ests,1,1);
            if ss2<>ests then begin
              ests:=IntToStr(T_ValeESTACION.AsInteger);
              while length(ests)>2 do
                delete(ests,1,1);
              if ss2<>ests then begin
                T_Vale.cancel;
                raise Exception.Create('Ticket no es de esta Estación de Servicio');
              end;
            end;
          end
          else if length(ss)=8 then begin
            T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,2,7));
            ss2:=copy(ss,1,1);
            ests:=IntToStr(T_ValeESTACION.AsInteger);
  //            ests:=_NumeroEstacionVolumetrico;
            while length(ests)>1 do
              delete(ests,1,1);
            if ss2<>ests then begin
              ests:=T_EstsIbNumeroEstacion.AsString;
              while length(ests)>1 do
                delete(ests,1,1);
              if ss2<>ests then begin
                T_Vale.cancel;
                raise Exception.Create('Ticket no es de esta Estación de Servicio');
              end;
            end;
          end;
        end;

        ValidarFolioVolumetricoPublicoGeneral;

        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_AuxiEntero2.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1,sum(tag) as Entero2 from DPVGMOVI');
        Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
  //      Q_Auxi.SQL.Add('  and (Tag=0 or Impreso="No") ');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger<1 then
          raise Exception.Create('Folio de Ticket Volumétrico no existe');
        if Q_AuxiEntero2.AsInteger>0 then
          xtag:=1
        else
          xtag:=0;
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DPVGMOVI');
        Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
        Q_Auxi.SQL.Add('  and Facturado="Si" ');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger>0 then with DMGEN, DMGAS do begin
    //Revisa si fue facturado en facturas de contado:
          Q_Auxi.Close;
          Q_AuxiStr2.FieldKind:=fkInternalCalc;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select TipoFac as Str2, Folio as Entero1 from DGASFACGD');
          Q_Auxi.SQL.Add('where Estacion='+inttostr(EstacionActual)); //T_FacgEstacion.AsInteger));
          Q_Auxi.SQL.Add('  and FolioTicket='+inttostr(T_ValeFolioVolumetrico.AsInteger)); //T_FacgDFolioTicket.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if not Q_Auxi.IsEmpty then
            raise Exception.Create('Folio ya fue facturado en Factura Contado: '+Q_AuxiStr2.AsString+'-'+IntToClaveNum(Q_AuxiEntero1.AsInteger,6))
          else begin
    //Revisa si esta en facturas de credito:
            Q_Auxi.Close;
            Q_AuxiStr2.FieldKind:=fkInternalCalc;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select TipoFac as Str2, Folio as Entero1 from DGASFACRD');
            Q_Auxi.SQL.Add('where Estacion='+inttostr(EstacionActual));
            Q_Auxi.SQL.Add('  and FolioTicket='+inttostr(T_ValeFolioVolumetrico.AsInteger)); //T_FacgDFolioTicket.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if not Q_Auxi.IsEmpty then
              raise Exception.Create('Folio ya fue facturado en Factura Crédito: '+Q_AuxiStr2.AsString+'-'+IntToClaveNum(Q_AuxiEntero1.AsInteger,6))
            else begin
    //Resvisa si esta capturado en un vale de credito pendiente de facturar:
              Q_Auxi.Close;
              Q_AuxiDate1.FieldKind:=fkInternalCalc;
              Q_AuxiEntero1.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select Fecha as Date1, Cliente as Entero1 from DGASVALE');
              Q_Auxi.SQL.Add('where Estacion='+inttostr(EstacionActual));
              Q_Auxi.SQL.Add('  and FolioVolumetrico='+inttostr(T_ValeFolioVolumetrico.AsInteger)); //T_FacgDFolioTicket.AsInteger));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              if not Q_Auxi.IsEmpty then
                raise Exception.Create('Folio ya fue capturado en un Vale Fecha:'+FechaPaq(Q_AuxiDate1.AsDateTime)+' Cliente: '+IntToClaveNum(Q_AuxiEntero1.AsInteger,5))
              else
                raise Exception.Create('Folio ya fue facturado');
            end;
          end;
        end;
        (*
        if Q_AuxiEntero1.AsInteger>0 then
          raise Exception.Create('Folio de Ticket Volumétrico ya fue facturado')
        else begin
        end *)
      end;
      with DMGAS do begin
        try
          Q_Auxi.Close;
          Q_AuxiStr2.FieldKind:=fkInternalCalc;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Tipoventa as Str2, Folio as Entero1 from DGASTRAN');
          Q_Auxi.SQL.Add('where Estacion='+inttostr(T_ValeESTACION.AsInteger));
          Q_Auxi.SQL.Add('  and FolioVolumetrico='+inttostr(T_ValeFolioVolumetrico.AsInteger));
          Q_Auxi.SQL.Add('  and Estatus='+QuotedStr('A'));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if not Q_Auxi.IsEmpty then
            raise Exception.Create('Folio ya fue capturado en una transacción de flotilla: '+Q_AuxiStr2.AsString+'-'+IntToClaveNum(Q_AuxiEntero1.AsInteger,6))
        finally
          Q_Auxi.Close;
        end;
      end;
      // onchange
      with DMCONS do begin
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_AuxiEntero2.FieldKind:=fkInternalCalc;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_AuxiReal2.FieldKind:=fkInternalCalc;
        Q_AuxiReal3.FieldKind:=fkInternalCalc;
        Q_AuxiDate1.FieldKind:=fkInternalCalc;
        Q_AuxiStr20.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Combustible as Entero1, PosCarga as Entero2,Volumen as Real1, Importe as Real2, Precio as Real3, Fecha as Date1, HexHash as Str20  from DPVGMOVI');
        Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if xtag>0 then begin
          if Q_AuxiStr20.AsString='' then
            T_ValeImporte.AsFloat:=0.00
          else begin
            try
              if not DMCONS.T_EstsIb.Active then
                DMCONS.T_EstsIb.Open;
              _desencrip:=DesencriptaCadena(DMCONS.T_EstsIbNUMEROESTACION.AsString,Q_AuxiStr20.AsString);
            except
              on e:Exception do  begin
                T_ValeImporte.AsFloat:=0.00;
                raise Exception.Create(e.Message);
              end;
            end;
            _importe:=StrToFloatDef(_desencrip,-1);
            if _importe<>-1 then
              T_ValeImporte.AsFloat:=StrToFloat(DesencriptaCadena(DMCONS.T_EstsIbNUMEROESTACION.AsString,Q_AuxiStr20.AsString))
            else
              T_ValeImporte.AsFloat:=0.00;
          end;
        end
        else
          T_ValeImporte.AsFloat:=Q_AuxiReal2.AsFloat;
        T_ValePRECIO.AsFloat:=Q_AuxiReal3.AsFloat;
        VarLiqCombustibleVolumetrico:=Q_AuxiEntero1.AsInteger;
        VarLiqIslaVolumetrico:=0;
        DMGAS.T_Bomb.Active:=true;
        if DMGAS.T_Bomb.Locate('Estacion;PosCarga',VarArrayOf([DMGAS.EstacionActual,Q_AuxiEntero2.AsInteger]),[]) then
          VarLiqIslaVolumetrico:=DMGAS.T_BombIsla.AsInteger;
        if VarLiqIslaVolumetrico>0 then T_ValeIsla.AsInteger:=VarLiqIslaVolumetrico;
        Q_Auxi.Close;

        try
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('UPDATE DPVGMOVI SET TIPOPAGO=:TIPOPAGO WHERE FOLIO=:FOLIO');
          Q_Auxi.ParamByName('TIPOPAGO').AsInteger := 10;
          Q_Auxi.ParamByName('FOLIO').AsInteger    := T_ValeFolioVolumetrico.AsInteger;
          Q_Auxi.ExecSQL;
        finally
          Q_Auxi.Close;
        end;
      end;
    end;
  end
  else begin
    if (not T_ValeFolioVolumetrico.IsNull) then begin
      with DMCUP,DMGAS do begin
        // onvalidate
        if not((Length(IntToStr(GetMaximoFolioMovimiento))=8) and (Length(IntToStr(T_ValeFolioVolumetrico.AsInteger))=8)) then begin
          ss:=T_ValeFolioVolumetrico.AsString;
          if DMLIQ.estTicket<>'' then begin
            ests:=_NumeroEstacionVolumetrico;
            while length(ests)>2 do
              delete(ests,1,1);
            if DMLIQ.estTicket<>ests then begin
              ests:=IntToStr(T_ValeESTACION.AsInteger);
              while length(ests)>2 do
                delete(ests,1,1);
              if DMLIQ.estTicket<>ests then begin
                T_Vale.cancel;
                MensajeInfo('Ticket no es de esta estación de Servicio');
                Abort;
              end;
            end;
          end
          else if length(ss)=9 then begin
            T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,3,7));
            ss2:=copy(ss,1,2);
            ests:=_NumeroEstacionVolumetrico;
            while length(ests)>2 do
              delete(ests,1,1);
            if ss2<>ests then begin
                ests:=IntToStr(T_ValeESTACION.AsInteger);
                while length(ests)>2 do
                  delete(ests,1,1);
                if ss2<>ests then begin
                  T_Vale.cancel;
                  raise Exception.Create('Ticket no es de esta Estación de Servicio');
                end;
            end;
          end
          else if length(ss)=8 then begin
            T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,2,7));
            ss2:=copy(ss,1,1);
            ests:=IntToStr(T_ValeESTACION.AsInteger);
  //            ests:=_NumeroEstacionVolumetrico;
            while length(ests)>1 do
              delete(ests,1,1);
            if ss2<>ests then begin
              ests:=_NumeroEstacionVolumetrico;
              while length(ests)>1 do
                delete(ests,1,1);
              if ss2<>ests then begin
                T_Vale.cancel;
                raise Exception.Create('Ticket no es de esta Estación de Servicio');
              end;
            end;
          end;
        end;

        ValidarFolioVolumetricoPublicoGeneral;

        if _ticket<>nil then begin
          if _ticket.Folio<>T_ValeFOLIOVOLUMETRICO.AsInteger then
            _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
        end
        else
          _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
        if _ticket=nil then
          raise Exception.Create('Folio de Ticket Volumétrico no existe');
        if _ticket.Tag=1 then
          xtag:=1
        else
          xtag:=0;
        if _ticket.Facturado='Si'  then with DMGEN, DMGAS do begin
          //Revisa si fue facturado en facturas de contado:
          Q_Auxi.Close;
          Q_AuxiStr2.FieldKind:=fkInternalCalc;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select TipoFac as Str2, Folio as Entero1 from DGASFACGD');
          Q_Auxi.SQL.Add('where Estacion='+inttostr(EstacionActual)); //T_FacgEstacion.AsInteger));
          Q_Auxi.SQL.Add('  and FolioTicket='+inttostr(T_ValeFolioVolumetrico.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if not Q_Auxi.IsEmpty then
            raise Exception.Create('Folio ya fue facturado en Factura Contado: '+Q_AuxiStr2.AsString+'-'+IntToClaveNum(Q_AuxiEntero1.AsInteger,6))
          else begin
            //Revisa si esta en facturas de credito:
            Q_Auxi.Close;
            Q_AuxiStr2.FieldKind:=fkInternalCalc;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select TipoFac as Str2, Folio as Entero1 from DGASFACRD');
            Q_Auxi.SQL.Add('where Estacion='+inttostr(EstacionActual));
            Q_Auxi.SQL.Add('  and FolioTicket='+inttostr(T_ValeFolioVolumetrico.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if not Q_Auxi.IsEmpty then
              raise Exception.Create('Folio ya fue facturado en Factura Crédito: '+Q_AuxiStr2.AsString+'-'+IntToClaveNum(Q_AuxiEntero1.AsInteger,6))
            else begin
              //Resvisa si esta capturado en un vale de credito pendiente de facturar:
              Q_Auxi.Close;
              Q_AuxiDate1.FieldKind:=fkInternalCalc;
              Q_AuxiEntero1.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select Fecha as Date1, Cliente as Entero1 from DGASVALE');
              Q_Auxi.SQL.Add('where Estacion='+inttostr(EstacionActual));
              Q_Auxi.SQL.Add('  and FolioVolumetrico='+inttostr(T_ValeFolioVolumetrico.AsInteger));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              if not Q_Auxi.IsEmpty then
                raise Exception.Create('Folio ya fue capturado en un Vale Fecha:'+FechaPaq(Q_AuxiDate1.AsDateTime)+' Cliente: '+IntToClaveNum(Q_AuxiEntero1.AsInteger,5))
              else
                raise Exception.Create('Folio ya fue facturado');
            end;
          end;
        end;
        // onchange
        with DMGAS do begin
          if _ticket<>nil then begin
            if _ticket.Folio<>T_ValeFOLIOVOLUMETRICO.AsInteger then
              _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
          end
          else
            _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
          if _ticket=nil then
            raise Exception.Create('Folio de Ticket Volumétrico no existe');
//          Q_Auxi.SQL.Add('Select Combustible as Entero1, PosCarga as Entero2,Volumen as Real1, Importe as Real2, Fecha as Date1 from DPVGMOVI');
          if xtag=1 then begin
//            T_ValeFOLIOVOLUMETRICO.AsString:='';
            T_ValeIMPORTE.AsFloat:=StrToFloatDef(DesencriptaCadena(_NumeroEstacionVolumetrico,_ticket.HexHash),0);
//            if T_ValeIMPORTE.AsFloat<0.001 then
//              T_ValeImporte.AsFloat:=0.00;
          end
          else
            T_ValeImporte.AsFloat:=_ticket.Importe;
          T_ValePRECIO.AsFloat:=_ticket.Precio;
          VarLiqCombustibleVolumetrico:=_ticket.Combustible;
          VarLiqIslaVolumetrico:=0;
          DMGAS.T_Bomb.Active:=true;
          if DMGAS.T_Bomb.Locate('Estacion;PosCarga',VarArrayOf([DMGAS.EstacionActual,_ticket.PosCarga]),[]) then
            VarLiqIslaVolumetrico:=DMGAS.T_BombIsla.AsInteger;
          if VarLiqIslaVolumetrico>0 then T_ValeIsla.AsInteger:=VarLiqIslaVolumetrico;
        end;
        with DMGAS do begin
          try
            Q_Auxi.Close;
            Q_AuxiStr2.FieldKind:=fkInternalCalc;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select Tipoventa as Str2, Folio as Entero1 from DGASTRAN');
            Q_Auxi.SQL.Add('where Estacion='+inttostr(T_ValeESTACION.AsInteger));
            Q_Auxi.SQL.Add('  and FolioVolumetrico='+inttostr(T_ValeFOLIOVOLUMETRICO.AsInteger));
            Q_Auxi.SQL.Add('  and Estatus='+QuotedStr('A'));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if not Q_Auxi.IsEmpty then
              raise Exception.Create('Folio ya fue capturado en una transacción de flotilla: '+Q_AuxiStr2.AsString+'-'+IntToClaveNum(Q_AuxiEntero1.AsInteger,6))
          finally
            Q_Auxi.Close;
          end;
        end;
        SetCambiaTipoPagoTicket(T_ValeFOLIOVOLUMETRICO.AsInteger,9);
      end;
    end;
  end;
  with DMGAS do begin
    if T_Vale.State=dsInsert then begin
      T_ValeIndiceVale.AsInteger:=T_PvalIndiceVale.AsInteger+1;
    end
  end;
  if T_ValeImporte.AsFloat<0.001 then begin
    if T_Vale.State=dsInsert then begin
      Exit;
//      T_Vale.Cancel;
//      Abort;
    end
    else begin
      if T_Vale.state=dsEdit then
       // T_Vale.Delete;
      exit;
    end;
  end;
  if DMGAS.VarGasValidarCreditoClienteEnVales='Si' then
  if ((DMGAS.CreditoDisponible(T_PvalCliente.asinteger,date)-T_ValeImporte.AsFloat)<0) then begin
    MensajeInfo('El importe del vale excede el saldo disponible del cliente');
    Abort;
  end;
end;

procedure TDMLIQ.ValidarFolioVolumetricoPublicoGeneral;
var
  FolioVolPGCancelable, FacturaCancelada:Boolean;
  error:string;
begin
  FolioVolPGCancelable := DMGASNET.FolioVolumetricoPublicoGeneralCancelableMaster(T_ValeFOLIOVOLUMETRICO.AsInteger,error);
  if error<>EmptyStr then begin
    MensajeInfo(error);
    T_Vale.Cancel;
    Abort;
  end
  else begin
    if FolioVolPGCancelable then begin
      if (MensajeConf(Concat('Folio volumétrico ya fue facturado a público en general',#13,'¿Desea cancelar la factura?')) = mrYes) then begin
        FacturaCancelada:=DMGASNET.CancelarFacturaPublicoGeneralMaster(T_ValeFOLIOVOLUMETRICO.AsInteger,10,error);

        if not(error=EmptyStr) then begin
          MensajeInfo(error);
          T_Vale.Cancel;
          Abort;
        end;
        if (FacturaCancelada) then begin
          try
            DMCONS.Q_Auxi.Close;
            DMCONS.Q_Auxi.SQL.Clear;
            DMCONS.Q_Auxi.SQL.Add('UPDATE DPVGMOVI SET Facturado= :FACTURADO, RFC= :RFC');
            DMCONS.Q_Auxi.SQL.Add('  WHERE Folio= :FOLIO');
            DMCONS.Q_Auxi.Params[0].AsString := 'No';
            DMCONS.Q_Auxi.Params[1].AsString := EmptyStr;
            DMCONS.Q_Auxi.Params[2].AsInteger := T_ValeFOLIOVOLUMETRICO.AsInteger;
            DMCONS.Q_Auxi.ExecSQL;

            MensajeInfo('Factura cancelada con éxito');
          except
            on e:Exception do
              MensajeErr('Ocurrió un error al liberar folio volumétrico.');
          end;
        end else
        begin
          MensajeInfo('No fue posible cancelar factura del folio volumétrico');
          T_Vale.Cancel;
          Abort;
        end;
      end
      else begin
        T_Vale.Cancel;
        Abort;
      end;
    end;
  end;
end;

procedure TDMLIQ.T_DvalBeforePost(DataSet: TDataSet);
begin
  with DMGAS do begin
    if (T_Vale.IsEmpty) then begin
      MensajeInfo('Debe capturar primero el vale');
      Abort;
    end;

    if (VarCupResguardoEfectivo='Si') and (swValidaValesResguardo) then begin
      try
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASRESGPES');
        Q_Auxi.SQL.Add('where Fecha='+QuotedStr(FechaToStrSQL(T_PvalFECHA.AsDateTime)));
        Q_Auxi.SQL.Add('  and Indice_Val='+IntToStr(T_PvalINDICE.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger>0 then begin
          MensajeErr('Cliente no se puede modificar'+#13+'Para modificarlo entrar a "Resguardo de Efectivo"');
          T_Dval.Cancel;
          Abort;
        end;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;
  if (T_DvalImporte.IsNull)or(T_DvalImporte.AsFloat<0.001) then begin
    if T_Dval.State=dsInsert then T_Dval.Cancel
    else if T_Dval.State=dsEdit then T_Dval.Delete
  end;
end;

procedure TDMLIQ.T_PvalBeforePost(DataSet: TDataSet);
begin
  with DMGAS,DMGASQ do begin
    if T_Pval.state=dsInsert then begin
      if T_PvalCliente.IsNull then T_Pval.Cancel;
      inc(VarLiqIndiceTurc);
      T_PvalIndice.AsInteger:=VarLiqIndiceTurc;
      T_PvalIndiceVale.AsInteger:=0;
      if T_PvalSubCodigo.IsNull then T_PvalSubCodigo.AsInteger:=0;
    end;
  end;
end;

procedure TDMLIQ.TotalVales;
var bm:TBookMark;
    MaxInd:integer;
    TotalVales:double;
begin
  with DMGAS do begin
    try
      T_Pval.DisableControls;
      bm:=T_Pval.GetBookmark;
      T_Pval.First;
      MaxInd:=0; TotalVales:=0;
      while not T_Pval.Eof do begin
        if T_PvalIndiceVale.AsInteger>MaxInd then
          MaxInd:=T_PvalIndiceVale.AsInteger;
        TotalVales:=TotalVales+T_PvalTotal.AsFloat;
        T_Pval.Next;
      end;
      T_Turc.Edit;
      T_TurcIndice_Pval.AsInteger:=MaxInd;
      T_TurcTotalVales.AsFloat:=TotalVales;
    finally
      T_Pval.GotoBookmark(bm);
      T_Pval.FreeBookmark(bm);
      T_Pval.EnableControls;
    end;
  end;
end;

procedure TDMLIQ.T_DvalAfterDelete(DataSet: TDataSet);
begin
  if SwRefrescaVales then
    RefrescaDataBase(DMGAS.DBGAS2);
end;

procedure TDMLIQ.T_ValeAfterDelete(DataSet: TDataSet);
begin
  RefrescaDataBase(DMGAS.DBGAS2);
//  TotalVales;
end;

procedure TDMLIQ.T_PvalAfterDelete(DataSet: TDataSet);
begin
  RefrescaDataBase(DMGAS.DBGAS2);
//  TotalVales;
end;

function TDMLIQ.ClaveCmb(var xTecla:char):word;
begin
  with DMGAS do begin
    ClaveCmb:=0;
    T_TCmb.Active:=true;
    T_TCmb.First;
    while not T_TCmb.Eof do begin
      if Uppercase(xTecla)=Uppercase(StrToChar(T_TcmbTeclaRapida.AsString)) then begin
        ClaveCmb:=T_TcmbClave.AsInteger;
        break;
      end;
      T_Tcmb.Next;
    end;
  end;
end;

procedure TDMLIQ.DataModuleCreate(Sender: TObject);
begin
  SwRefrescaVales:=true;
  SwInsertaEfectivo:=False;
  VarLiqTipoCmbDef:=1;
  VarLiqTeclaAceites:='F2';
  VarLiqTurnoRestringido:=false;
  VarLiqModoReclasificar:=false;
  VarLiqNuevosPagos:=false;
  VarLiqUltimoDesp:=0;
  SwAjustadorAutomaticoLiq:=True;
  SwLecturaTiposdePagos:= False;
  swValidaValesResguardo:=True;
end;

function TDMLIQ.TotPagosLiqOk:Boolean;
var
  importeDesc: Real;
begin
  if T_Dliqc.state in [dsEdit,dsInsert] then
    T_Dliqc.post;
  if T_Dliqa.state in [dsEdit,dsInsert] then
    T_Dliqa.post;
  if T_Dliqp.state in [dsEdit,dsInsert] then
    T_Dliqp.post;

  result:=abs((T_LiqgTotGas.AsFloat+T_LiqgTotAlma.AsFloat)-T_LiqgTotPago.AsFloat)<0.005;

  if (not(DMGAS.ValidaModulo(idDesc)) and (DM_PUNTOS.LicenciaEsValidaPuntos)) or (DMGAS.VarGasSistemaGulfActivo = 'Si') then begin  // Solo si se manejan descuentos reales o tiene sistema Gulf
    T_Dliqp.First;
    while not T_Dliqp.Eof do begin
      if T_DliqpClasePago.AsString = 'Descuento' then begin
        importeDesc := T_DliqpIMPORTE.AsFloat * -1;
        result:=abs((T_LiqgTotGas.AsFloat+T_LiqgTotAlma.AsFloat)-(T_LiqgTotPago.AsFloat+importeDesc))<0.005; // Se resta importe de clase de pago "Descuento" debido a que este importe es negativo, por lo cual en realidad lo suma al total de pago
        T_LiqgTOTDESCT.AsFloat := importeDesc;
        Break;
end;
      T_Dliqp.Next
    end;
  end;
end;

function TDMLIQ.TotAceitePagosLiqOk:Boolean;
begin
  if T_Dliqc.state in [dsEdit,dsInsert] then
    T_Dliqc.post;
  if T_Dliqa.state in [dsEdit,dsInsert] then
    T_Dliqa.post;
  if T_Dliqp.state in [dsEdit,dsInsert] then
    T_Dliqp.post;
  result:=Abs(T_LiqgTotAlma.AsFloat-T_LiqgTotPagoAlma.AsFloat)<0.005;
end;

function TDMLIQ.SaldoFinalOk:Boolean;
var bm:tbookmark;
begin
  result:=true;
  try
    T_Dliqa.DisableControls;
    bm:=T_Dliqa.GetBookmark;
    T_Dliqa.First;
    while not T_Dliqa.Eof do begin
      if (T_DliqaSald_Fin.IsNull) then begin
        result:=false;
        break;
      end;
      T_Dliqa.Next;
    end;
  finally
    T_Dliqa.EnableControls;
    T_Dliqa.GotoBookmark(bm);
    T_Dliqa.FreeBookmark(bm);
  end;
end;

function TDMLIQ.LecturaActualOk:Boolean;
var bm:tbookmark;
begin
  result:=true;
  try
    T_DLiqc.DisableControls;
    bm:=T_DLiqc.GetBookmark;
    T_DLiqc.First;
    while not T_DLiqc.Eof do begin
      if (T_DLiqcLec_Act.IsNull) then begin
        bm:=T_DLiqc.GetBookmark;
        result:=false;
        break;
      end;
      T_Dliqc.Next;
    end;
  finally
    T_DLiqc.EnableControls;
    T_DLiqc.GotoBookmark(bm);
    T_DLiqc.FreeBookmark(bm);
  end;
end;

procedure TDMLIQ.T_DliqaPRODUCTOValidate(Sender: TField);
begin
  with DMGAS do begin
    if not LocalizaTabla(T_Prod,'Clave',T_DliqaProducto.AsInteger) then
      raise Exception.Create('No existe clave de producto');
  end;
end;

procedure TDMLIQ.T_LectCalcFields(DataSet: TDataSet);
begin
  T_LectDescripTurno.asstring:='Turno: '+IntToClaveNum(T_LectTurno.AsInteger,2)+'  Fecha: '+FechaPaq(T_LectFecha.AsDateTime);
end;

procedure TDMLIQ.T_LectAfterInsert(DataSet: TDataSet);
begin
  WITH DMGEN,DMGAS do begin
    T_LectEstacion.AsInteger:=EstacionActual;
    T_LectFecha.AsDateTime:=FechaTrabajo;
    T_LectUsuario.AsString:=UsuarioActivo;
  end;
end;

procedure TDMLIQ.T_LectBeforePost(DataSet: TDataSet);
begin
  with DMGAS do begin
//    if not T_Dlec.IsEmpty then begin
//      Q_Auxi.Close;
//      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
//      Q_Auxi.SQL.Clear;
//      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASLIQG');
//      Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_LectEstacion.AsInteger));
//      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_LectFecha.AsDateTime)+'"');
//      Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_LectTurno.AsInteger));
//      Q_Auxi.Prepare;
//      Q_Auxi.Open;
//      if Q_AuxiEntero1.AsInteger>0 then
//        raise Exception.Create('Ya existe Liquidación');
//    end;
    if not T_Dlec.IsEmpty then begin
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Delete From  DGASDLEC');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_LectEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_LectFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_LectTurno.AsInteger));
      Q_Auxi.SQL.Add('  and (LecturaInic<0 or LecturaInic is Null)');
      Q_Auxi.SQL.Add('  and (Devolucion<0 or Devolucion is Null)');
      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;
    end;
  end;
end;

procedure TDMLIQ.T_DlecMANGUERAValidate(Sender: TField);
begin
  with DMGAS do begin
    if not LocalizaTabla(T_Bomb,'Estacion;Manguera',VarArrayOf([T_DlecEstacion.AsInteger,T_DlecManguera.AsInteger])) then
      raise Exception.Create('No existe Manguera en esta Estación');
  end;
end;

procedure TDMLIQ.T_DliqcAfterInsert(DataSet: TDataSet);
begin
  T_Dliqc.Cancel;
end;

procedure TDMLIQ.T_DliqpAfterInsert(DataSet: TDataSet);
begin
  if not VarLiqNuevosPagos then T_Dliqp.Cancel;
end;

procedure TDMLIQ.T_DliqcCalcFields(DataSet: TDataSet);
begin
  if T_DliqcDevolucion.AsFloat>0.001 then
    T_DliqcDevolucionCalc.AsFloat:=T_DliqcDevolucion.AsFloat
  else
    T_DliqcDevolucionCalc.AsString:='';
  if (DMCUP.SwSubModuloCupReformas2008) and(DMGAS.VarCupCalcularIEPS='Si') then
    T_DliqcImp_IEPS.AsFloat:=AjustaFloat(T_DliqcIEPS_POR_LITRO.AsFloat*T_DliqcCANTIDAD.AsFloat,2);
  if (T_DliqcESTACION.AsInteger>0)and(T_DliqcBOMBA.AsInteger>0) then
    T_DliqcPosCarga.AsInteger := GetPosCargaIGAS(T_DliqcESTACION.AsInteger,T_DliqcBOMBA.AsInteger)
  else
    T_DliqcPosCarga.AsInteger := 0;
  T_DliqcImporte_Final.AsFloat:=T_DliqcIMPORTE.AsFloat-T_DliqcIMPORTE_SP.AsFloat;

end;

procedure TDMLIQ.T_DvalCalcFields(DataSet: TDataSet);
begin
  with DMCUP,DMGAS do begin
    if LocalizaTabla(T_Tcmb,'Clave',T_DvalProducto.AsInteger) then
      T_DvalDescripcion.AsString:=T_TcmbNombre.AsString;
    if (T_DvalTipo.AsString=idTipoAceites)and(not T_DvalSubClave.IsNull) then
      if LocalizaTabla(T_Prod,'Clave',T_DvalSubClave.AsInteger) then
        T_DvalDescripcion.AsString:=T_ProdDescripcion.AsString;
  end;
end;

procedure TDMLIQ.T_DliqpBeforePost(DataSet: TDataSet);
begin
  with DMGAS do begin
    if (T_DliqpIndice.AsInteger<1)and(T_DliqpDesglosa.AsString='Si') then
      T_DliqpIndice.AsInteger:=1;
    T_DliqpCLAVE_PAGO_ENTERO.AsInteger:=StrToIntDef(T_DliqpCLAVE_PAGO.AsString,0);
  end;
end;

procedure TDMLIQ.T_DtpagAfterInsert(DataSet: TDataSet);
var i:integer;
begin
  if (T_DtpagIndice.AsInteger<1) then begin
    i:=T_DliqpIndice.AsInteger;
    inc(i);
    T_DtpagIndice.AsInteger:=i;
    T_DliqpIndice.AsInteger:=i;
  end;
end;

procedure TDMLIQ.T_DtpagCLIENTEChange(Sender: TField);
begin
  with DMGEN_VTAS do begin
    if T_DtpagNombre.AsString='' then begin
      QB_Clie.Close;
      QB_Clie.ParamByName('pNoClie').AsInteger:=T_DtpagCliente.AsInteger;
      QB_Clie.Prepare;
      QB_Clie.Open;
      if not QB_Clie.IsEmpty then
        T_DtpagNombre.AsString:=QB_ClieNombre.AsString;
    end;
  end;
end;

function TDMLIQ.TotalDesgloseOk:Boolean;
var xtot:real;
begin
  result:=true;
  try
    T_Dliqp.DisableControls;
    xtot:=0;
    while not T_Dliqp.Eof do begin
      if T_DliqpDesglosa.AsString='Si' then begin
        if not T_Dtpag.IsEmpty then begin
          T_Dtpag.First;
          while not T_Dtpag.Eof do begin
            xtot:=xtot+T_DtpagImporte.AsFloat;
            T_Dtpag.Next;
          end;
          if abs(xtot-T_DliqpImporte.AsFloat)>0.001 then begin
            result:=false;
            exit;
          end;
        end;
      end;
      T_Dliqp.Next;
    end;
  finally
    T_Dliqp.EnableControls;
  end;
end;


procedure TDMLIQ.T_DvalSUBCLAVEValidate(Sender: TField);
begin
  with DMGAS,DMCUP do begin
    if (T_DvalSubClave.IsNull) then
      exit;
    if (T_DvalTipo.AsString=idTipoCmb) then begin
      raise Exception.Create('No se aceptan Clave de Productos en Combustible');
    end
    else begin
      if not T_DvalSubClave.IsNull then begin
        if not LocalizaTabla(T_Prod,'Clave',T_DvalSubClave.AsInteger) then
          raise Exception.Create('No existe clave de producto')
        else begin
          T_DvalDescripcion.AsString:=T_ProdDescripcion.AsString;
          T_DvalCantidad.AsFloat:=AjustaFloat(DivideFloat(T_DvalImporte.AsFloat,PrecioProductoFecha(T_ProdClave.asinteger,T_DvalFecha.AsDateTime)),2);
        end;
      end;
    end;
  end;
end;

procedure TDMLIQ.T_DvalIMPORTEChange(Sender: TField);
var xprecio,xtasa,
    xcantidad:real;
begin
  with DMGAS,DMCUP,DMLIQ do begin
    if not DMGAS.SwServiciosMaster then begin
      if (T_Dval.state=dsEdit)and(not T_ValeFolioVolumetrico.IsNull) then begin
        with DMCONS do
        begin
          try
            Q_Auxi.Close;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(tag) as Entero1 from DPVGMOVI');
            Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            if Q_AuxiEntero1.AsInteger<0.01 then begin
              T_Dval.Cancel;
              raise Exception.Create('No puede modificar Ticket Volumétrico');
            end;
          finally
            Q_Auxi.Close;
          end;
        end;
      end;
      if T_DvalTipo.AsString=idTipoCmb then begin
        if( T_ValeFolioVolumetrico.IsNull) then begin
          if VarGasPreciosPorEstacion<>'Si' then
            DamePrecioFecha(T_DvalProducto.Asinteger,T_DvalFecha.asdatetime,xprecio,xtasa)
          else
            DamePrecioFechaEst(T_ValeESTACION.AsInteger,T_DvalProducto.Asinteger,T_DvalFecha.asdatetime,xprecio,xtasa);
          xcantidad:=dividefloat(T_DvalImporte.asfloat,xprecio);
          T_DvalCantidad.AsFloat:=AjustaFloat(xcantidad,4);
        end
        else begin
          with DMCONS do begin
            try
              Q_Auxi.Close;
              Q_AuxiReal1.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select Precio as Real1 from DPVGMOVI');
              Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFOLIOVOLUMETRICO.AsInteger));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              T_DvalCantidad.AsFloat:=AjustaFloat(DivideFloat(T_DvalIMPORTE.AsFloat,Q_AuxiReal1.AsFloat),4);
            finally
              Q_Auxi.close;
            end;
          end;
        end;
      end;
    end
    else begin
      if (T_Dval.state=dsEdit)and(not T_ValeFolioVolumetrico.IsNull) then begin
        with DMGAS do
        begin
          try
            if _ticket<>nil then begin
              if _ticket.Folio<>T_ValeFOLIOVOLUMETRICO.AsInteger then
                _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
            end
            else
              _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
            if _ticket=nil then
              raise Exception.Create('Folio de Ticket Volumétrico no existe');
            if _ticket.Tag<0.01 then begin
              T_Dval.Cancel;
              raise Exception.Create('No puede modificar Ticket Volumétrico');
            end;
          finally
          end;
        end;
      end;
      if T_DvalTipo.AsString=idTipoCmb then begin
        if( T_ValeFolioVolumetrico.IsNull) then begin
          if VarGasPreciosPorEstacion<>'Si' then
            DamePrecioFecha(T_DvalProducto.Asinteger,T_DvalFecha.asdatetime,xprecio,xtasa)
          else
            DamePrecioFechaEst(T_ValeESTACION.AsInteger,T_DvalProducto.Asinteger,T_DvalFecha.asdatetime,xprecio,xtasa);
          xcantidad:=dividefloat(T_DvalImporte.asfloat,xprecio);
          T_DvalCantidad.AsFloat:=AjustaFloat(xcantidad,4);
        end
        else begin
          with DMGAS do begin
            try
              if _ticket<>nil then begin
                if _ticket.Folio<>T_ValeFOLIOVOLUMETRICO.AsInteger then
                  _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
              end
              else
                _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
              if _ticket=nil then
                raise Exception.Create('Folio de Ticket Volumétrico no existe');
              T_DvalCantidad.AsFloat:=AjustaFloat(DivideFloat(T_DvalIMPORTE.AsFloat,_ticket.Precio),4);
            finally
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure TDMLIQ.T_PvalCLIENTEValidate(Sender: TField);
begin
  with DMGEN_VTAS do begin
    if T_PvalCliente.AsInteger<>0 then begin
      if not LocalizaTabla(TV_Clie,'NoClie',T_PvalCliente.asinteger) then begin
//        raise Exception.Create('Cliente no existe');
        MensajeInfo('Cliente no existe');
        Abort;
      end;
      if TV_ClieCREDITO.AsString <> 'Si' then begin
//        raise Exception.Create('Cliente no tiene Crédito');
        MensajeInfo('Cliente no tiene Crédito');
        Abort;
      end;
      if DMGAS.VarGasValidarCreditoClienteEnVales='Si' then
        if (DMGAS.CreditoDisponible(T_PvalCliente.asinteger,date)<=0) then begin
          MensajeInfo('Cliente agotó su crédito');
          Abort;
        end;
    end;
  end;
end;

procedure TDMLIQ.T_ValeAfterInsert(DataSet: TDataSet); 
var     LVarLiqIslaVolumetrico : Integer;
begin
  if (T_ValeDespachador.AsInteger<1)and(VarLiqUltimoDesp>0)and(DMGAS.VarGasIslaVales='No') then
    T_ValeDespachador.AsInteger:=VarLiqUltimoDesp;

  if (T_ValeIsla.Asinteger<1) then begin
    DMCONS.Q_Auxi.Close;
    DMCONS.Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    DMCONS.Q_AuxiEntero2.FieldKind:=fkInternalCalc;
    DMCONS.Q_AuxiReal1.FieldKind:=fkInternalCalc;
    DMCONS.Q_AuxiReal2.FieldKind:=fkInternalCalc;
    DMCONS.Q_AuxiReal3.FieldKind:=fkInternalCalc;
    DMCONS.Q_AuxiDate1.FieldKind:=fkInternalCalc;
    DMCONS.Q_AuxiStr20.FieldKind:=fkInternalCalc;
    DMCONS.Q_Auxi.SQL.Clear;
    DMCONS.Q_Auxi.SQL.Add('Select Combustible as Entero1, PosCarga as Entero2,Volumen as Real1, Importe as Real2, Precio as Real3, Fecha as Date1, HexHash as Str20  from DPVGMOVI');
    DMCONS.Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
    DMCONS.Q_Auxi.Prepare;
    DMCONS.Q_Auxi.Open;
//    if(DMCUP._ticket = nil) or (DMCUP._ticket.Folio.asInteger <> T_ValeFOLIOVOLUMETRICO.AsInteger) then begin
//      DMCUP._ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
//    end;
    LVarLiqIslaVolumetrico:=0;
    DMGAS.T_Bomb.Active:=true;
//    if DMGAS.T_Bomb.Locate('Estacion;PosCarga',VarArrayOf([DMGAS.EstacionActual,DMCUP._ticket.PosCarga.AsInteger]),[]) then begin
    if DMGAS.T_Bomb.Locate('Estacion;PosCarga',VarArrayOf([DMGAS.EstacionActual,DMCONS.Q_AuxiEntero2.AsInteger]),[]) then begin
      LVarLiqIslaVolumetrico:=DMGAS.T_BombIsla.AsInteger;
    end;
    if LVarLiqIslaVolumetrico>0 then begin
      T_ValeIsla.AsInteger:=LVarLiqIslaVolumetrico;
    end;
  end;
  if (T_ValeIsla.Asinteger<1)and(VarLiqUltimaIsla>0)and(DMGAS.VarGasIslaVales='Si') then   begin
    T_ValeIsla.AsInteger:=VarLiqUltimaIsla;
  end;
end;

function TDMLIQ.CostoProductoInv(xAlma,xProd:Integer;xFechaIni,xFechaFin:TDateTime):real;
var xclave:string;
begin
  with DMGAS,DMGEN_VTAS do begin
    CostoProductoInv:=0;
    if not LocalizaTabla(DMGAS.T_Prod,'Clave',xProd) then
      raise Exception.Create('No Existe clave de producto');
    xclave:=DMGAS.T_ProdCodigo.AsString;
    if xclave='' then
      raise Exception.Create('Producto no tiene Código de Almacén');
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_AuxiReal2.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Sum(ImporteMn) as Real1, Sum(Cantidad) as Real2 from DINVMOVS');
    Q_Auxi.SQL.Add('where Almacen='+IntToStr(xAlma));
    Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(xFechaIni)+'"');
    Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(xFechaFin)+'"');
    Q_Auxi.SQL.Add('  and Producto="'+xclave+'"');
    Q_Auxi.SQL.Add('  and DocumOrigen="TURC" ');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    CostoProductoInv:=DivideFloat(Q_AuxiReal1.AsFloat,Q_AuxiReal2.AsFloat);
  end;
end;

function TDMLIQ.CostoCombustibleInv(xAlma,xCombustible:Integer;xFechaIni,xFechaFin:TDateTime):real;
var xclave:string;
begin
  with DMGAS,DMGEN_VTAS do begin
    CostoCombustibleInv:=0;
    if not LocalizaTabla(DMGAS.T_Tcmb,'Clave',xCombustible) then
      raise Exception.Create('No Existe Clave de Combustible');
    if T_TcmbTipo.AsString<>idTipoCmb then
      exit;
    xclave:=DMGAS.T_TcmbCodigo.AsString;
    if xclave='' then
      raise Exception.Create('Combustible no tiene Código de Almacén');
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_AuxiReal2.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Sum(ImporteMn) as Real1, sum(Cantidad) as Real2 from DINVMOVS');
    Q_Auxi.SQL.Add('where Almacen='+IntToStr(xAlma));
    Q_Auxi.SQL.Add('  and Fecha>="'+FechaToStrSQL(xFechaIni)+'"');
    Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(xFechaFin)+'"');
    Q_Auxi.SQL.Add('  and Producto="'+xclave+'"');
    Q_Auxi.SQL.Add('  and DocumOrigen="TURC" ');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    CostoCombustibleInv:=DivideFloat(Q_AuxiReal1.AsFloat,Q_AuxiReal2.AsFloat);
  end;
end;


procedure TDMLIQ.T_LiqgISLAChange(Sender: TField);
begin
  with DMGASQ ,DMGAS do begin
    SwLiqAutom:=false;
    if T_LiqgISLA.AsInteger>0 then
    begin
      if not LocalizaTabla(TL_Isla,'Estacion;Isla',VarArrayOf([EstacionActual,T_LiqgISLA.AsInteger])) then
        raise Exception.Create('Isla '+IntToClaveNum(T_LiqgISLA.AsInteger,3)+' No Existe en esta Estacion.');
    end;        
    try
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('Select count(*) as Entero1');
      Q_Auxi.SQL.Add(' from DGASLIQG');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(CajaActual));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QT_TurcaFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno='+InttoStr(QT_TurcaTurno.AsInteger));
      Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgISLA.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger>0 then
        raise Exception.Create('Isla '+IntToClaveNum(T_LiqgISLA.AsInteger,3)+' ya Fue Liquidada.');

    finally

    end;
    if LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',
        VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgFecha.asdatetime,T_LiqgTurno.asinteger])) then
    begin
      if LocalizaTabla(T_Dtur,'Isla',T_LiqgIsla.asinteger) then begin
        T_LiqgDespachador.AsInteger:=T_DturDespachador.asinteger;
        SwLiqAutom:=true;
      end;
    end;
  end;
end;

procedure TDMLIQ.T_DvalPRODUCTOChange(Sender: TField);
begin
  if (T_ValeFOLIOVOLUMETRICO.AsInteger=0)and(T_DvalTipo.AsString=idTipoCmb) then begin
    MensajeInfo('Producto inválido');
    T_Dval.Cancel;
    Abort;
  end;

  if (T_Dval.state=dsEdit)and(not T_ValeFolioVolumetrico.IsNull) then begin
    T_Dval.Cancel;
    raise Exception.Create('No puede modificar Ticket Volumétrico');
  end;
end;

procedure TDMLIQ.T_DvalCANTIDADChange(Sender: TField);
begin
  if not DMGAS.SwServiciosMaster then begin
    if (T_Dval.state=dsEdit)and(not T_ValeFolioVolumetrico.IsNull) then begin
      with DMCONS do  begin
        try
          Q_Auxi.Close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(tag) as Entero1 from DPVGMOVI');
          Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if Q_AuxiEntero1.AsInteger<0.01 then begin
            T_Dval.Cancel;
            raise Exception.Create('No puede modificar Ticket Volumétrico');
          end;
        finally
          Q_Auxi.Close;
        end;
      end;
    end;
  end
  else begin
    if (T_Dval.state=dsEdit)and(not T_ValeFolioVolumetrico.IsNull) then begin
      with DMCUP,DMGAS do  begin
        try
          if _ticket<>nil then begin
            if _ticket.Folio<>T_ValeFOLIOVOLUMETRICO.AsInteger then
              _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
          end
          else
            _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
          if _ticket=nil then
            raise Exception.Create('Folio de Ticket Volumétrico no existe');
          if _ticket.Tag<0.01 then begin
            T_Dval.Cancel;
            raise Exception.Create('No puede modificar Ticket Volumétrico');
          end;
        finally
        end;
      end;
    end;
  end;
end;

procedure TDMLIQ.T_ValeISLAChange(Sender: TField);
begin
  with DMGAS do begin
    if VarGasIslaVales='Si' then begin
      if LocalizaTabla(T_Turn,'Estacion;Fecha;Turno',
          VarArrayOf([T_ValeEstacion.asinteger,T_ValeFecha.asdatetime,T_ValeTurno.asinteger])) then
       begin
         if LocalizaTabla(T_Dtur,'Isla',T_ValeIsla.asinteger) then
           if T_ValeDespachador.IsNull then T_ValeDespachador.AsInteger:=T_DturDespachador.asinteger
           else
         else begin
           if DMGEN.QT_EmprSERIEKEY.AsInteger<>637 then
            MensajeInfo('Isla no esta activa en este turno.');
         end;
      end
      else
        if T_ValeDespachador.IsNull then T_ValeDespachador.AsInteger:=VarLiqUltimoDesp;
    end;
  end;
end;

procedure TDMLIQ.T_ValeISLAValidate(Sender: TField);
begin
  with DMGAS do begin
    if not LocalizaTabla(TL_Isla,'Estacion;Isla',VarArrayOf([T_ValeEstacion.AsInteger,T_ValeIsla.AsInteger])) then
      raise Exception.Create('No existe Isla en esta Estación');
  end;
end;

function TDMLIQ.TurnoEsRestringido(xTurno:Integer=0;xFecha:TDateTime=0):Boolean;
begin
  with DMGAS,DMGASQ do begin
    Result:=False;

    RefrescaQuery(QT_Turca);

    if QT_Turca.IsEmpty then Exit;

    //En caso de existir mas de un turno abierto es necesario localizarlo
    if xTurno>0 then LocalizaQuery(QT_TurcA,'Turno;Fecha',VarArrayOf([xTurno,xFecha]));

    if VarGasRestringirLiquidaciones='No' then Exit;

    Q_Auxi.Close;
    Q_AuxiDate1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Max(Fecha) as Date1 from DGASTURC');
    Q_Auxi.SQL.Add('where Estacion='+IntToStr(QT_TurcaEstacion.AsInteger));
    Q_Auxi.SQL.Add('  and Caja='+IntToStr(QT_TurcaCaja.AsInteger));
    Q_Auxi.SQL.Add('  and Estatus="C" ');
    Q_Auxi.Prepare;
    Q_Auxi.Open;

    if QT_TurcaFecha.AsDateTime<Q_AuxiDate1.AsDateTime then
      Result:=True
    else begin
      if QT_TurcaFecha.AsDateTime=Q_AuxiDate1.AsDateTime then begin
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Max(Turno) as Entero1 from DGASTURC');
        Q_Auxi.SQL.Add('where Estacion='+IntToStr(QT_TurcaEstacion.AsInteger));
        Q_Auxi.SQL.Add('  and Caja='+IntToStr(QT_TurcaCaja.AsInteger));
        Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QT_TurcaFecha.AsDateTime)+'"');
        Q_Auxi.SQL.Add('  and Estatus="C" ');
        Q_Auxi.Prepare;
        Q_Auxi.Open;

        if QT_TurcaTurno.AsInteger<Q_AuxiEntero1.AsInteger then Result:=True
      end;
    end;
  end;
end;

procedure TDMLIQ.CalculaResumenCombustible;
var bm:tbookmark;
begin
  if SwCalculaResumen then
    exit;
  try
    SwCalculaResumen:=true;
    TM_Dliqc.EmptyTable;
    bm:=T_Dliqc.GetBookmark;
    try
      T_Dliqc.First;
      while not T_Dliqc.Eof do begin
        if TM_Dliqc.Locate('Combustible',T_DliqcCombustible.AsInteger,[]) then begin
          TM_Dliqc.Edit;
          TM_DliqcImporte.AsFloat:=TM_DliqcImporte.AsFloat+T_DliqcImporte.AsFloat;
        end
        else begin
          TM_Dliqc.Insert;
          TM_DliqcCombustible.AsInteger:=T_DliqcCombustible.AsInteger;
          TM_DliqcImporte.AsFloat:=T_DliqcImporte.AsFloat;
        end;
        TM_Dliqc.Post;
        T_Dliqc.Next;
      end;
    finally
      T_Dliqc.GotoBookmark(bm);
      T_Dliqc.FreeBookmark(bm);
    end;
  finally
    SwCalculaResumen:=false;
  end;
end;

procedure TDMLIQ.T_DliqcLEC_ACTChange(Sender: TField);
begin
  if (not calculandoLiq) and (T_DliqcLEC_ACT.AsInteger>0) then
    lecturaModificada:=True;
end;

procedure TDMLIQ.T_DliqcDEVOLUCIONChange(Sender: TField);
begin
//  CalculaResumenCombustible;
end;

procedure TDMLIQ.T_DliqaBeforePost(DataSet: TDataSet);
begin
  if T_DliqaSald_Fin.IsNull then T_DliqaSald_Fin.AsFloat:=0;
end;

procedure TDMLIQ.T_DliqeAfterInsert(DataSet: TDataSet);
var i:integer;
begin

end;

procedure TDMLIQ.InsertaDenominaciones;
var i:integer;
begin
  for i:=1 to NoDenom do begin
    if not LocalizaTabla(T_Dliqe,'Estacion;Folio;Clave_Pago;Indice',VarArrayOf([T_DliqpESTACION.AsInteger,T_DliqpFOLIO.AsInteger,T_DliqpCLAVE_PAGO.AsInteger,i])) then begin
      T_Dliqe.Insert;
      T_DliqeESTACION.AsInteger:=T_DliqpESTACION.AsInteger;
      T_DliqeFOLIO.AsInteger:=T_DliqpFOLIO.AsInteger;
      T_DliqeCLAVE_PAGO.AsInteger:=T_DliqpCLAVE_PAGO.AsInteger;
      T_DliqeDENOMINACION.AsFloat:=denominaciones[i];
      T_DliqeCANTIDAD.AsFloat:=0;
      T_DliqeIMPORTE.AsFloat:=0;
      T_DliqeINDICE.AsInteger:=i;
      T_Dliqe.Post;
    end;
  end;
end;

procedure TDMLIQ.T_DliqeCANTIDADChange(Sender: TField);
begin
  T_DliqeIMPORTE.AsFloat:=AjustaFloat(T_DliqeDENOMINACION.AsFloat*T_DliqeCANTIDAD.AsFloat,2);
end;

procedure TDMLIQ.TotalizaLiqe;
var bm:TBookMark;
begin
  with DMGAS,DMLIQ do begin
    try
      T_Dliqe.DisableControls;
      bm:=T_Dliqe.GetBookmark;
      T_Dliqe.First;
      TotalDLIQE:=0;
      while not T_Dliqe.Eof do begin
        TotalDLIQE:=TotalDLIQE+T_DliqeIMPORTE.AsFloat;
        T_Dliqe.Next;
      end;
    finally
      T_Dliqe.GotoBookmark(bm);
      T_Dliqe.FreeBookmark(bm);
      T_Dliqe.EnableControls;
    end;
  end;
end;

procedure TDMLIQ.T_DliqeAfterPost(DataSet: TDataSet);
begin
  TotalizaLiqe;
end;

procedure TDMLIQ.T_DliqeBeforeInsert(DataSet: TDataSet);
begin
  if not SwInsertaEfectivo then
    abort;
end;

procedure TDMLIQ.T_PvalBeforeInsert(DataSet: TDataSet);
begin
  if DMGAS.swTurnoLectura then
    Abort;
end;

procedure TDMLIQ.T_PvalBeforeEdit(DataSet: TDataSet);
begin
  if DMGAS.swTurnoLectura then
    Abort;
  with DMGAS do begin
    if (VarCupResguardoEfectivo='Si') and (swValidaValesResguardo) then begin
      try
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASRESGPES');
        Q_Auxi.SQL.Add('where Fecha='+QuotedStr(FechaToStrSQL(T_PvalFECHA.AsDateTime)));
        Q_Auxi.SQL.Add('  and Indice_Val='+IntToStr(T_PvalINDICE.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger>0 then begin
          MensajeErr('Cliente no se puede modificar'+#13+'Para modificarlo entrar a "Resguardo de Efectivo"');
          Abort;
        end;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;
end;

procedure TDMLIQ.T_ValeBeforeEdit(DataSet: TDataSet);
begin
  if DMGAS.swTurnoLectura then
    Abort;
  
end;

procedure TDMLIQ.T_DvalBeforeInsert(DataSet: TDataSet);
begin
  if DMGAS.swTurnoLectura then
    Abort;
end;

procedure TDMLIQ.T_DvalBeforeEdit(DataSet: TDataSet);
begin
  if DMGAS.swTurnoLectura then
    Abort;
end;

procedure TDMLIQ.T_LiqgFECHAChange(Sender: TField);
begin
  with DMGAS do begin
    DMCUP.SwCalculaIEPS:=T_LiqgFECHA.AsDateTime>=VarGasFechaInicioIEPS;
  end;
end;

procedure TDMLIQ.T_DliqcImp_IEPSGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text:= 'IEPS = '+FormatFloat(T_DliqcImp_IEPS.DisplayFormat,T_DliqcImp_IEPS.AsFloat);
end;

procedure TDMLIQ.T_DliqcIEPS_POR_LITROGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:= 'IEPS/Lts. = '+FormatFloat(T_DliqcIEPS_POR_LITRO.DisplayFormat,T_DliqcIEPS_POR_LITRO.AsFloat);
end;

procedure TDMLIQ.T_DliqpAfterScroll(DataSet: TDataSet);
begin
  if not SwLecturaTiposdePagos then
    T_DliqpIMPORTE.ReadOnly:=T_DliqpClasePago.AsString='Cupón Feria'
  else
    T_DliqpIMPORTE.ReadOnly := False;
  if T_DliqpClasePago.AsString<>'Cupón Feria' then
    T_DliqpIMPORTE.ReadOnly:=(DMGAS.VarGasTPagoTI<>'') and (DMGAS.VarGasTPagoTI=T_DliqpCLAVE_PAGO.AsString);
end;

function TDMLIQ.DeterminaFactorDeAjuste(AEstacion: Integer; AFechaIni,
  AFechaFin: TDateTime; ACombustible, AIsla, ATurno: Integer): Double;
begin
  with DMGAS do begin
    try
      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Add('SELECT COALESCE(');
        Q_Auxi.SQL.Add('  ((SUM(IMPORTE)*100)/');
        Q_Auxi.SQL.Add('  (SELECT SUM(IMPORTE) FROM DGASDLIQC');
        Q_Auxi.SQL.Add('   WHERE ESTACION=:pEstacion');
        Q_Auxi.SQL.Add('     AND FECHA>=:pFechaIni');
        Q_Auxi.SQL.Add('     AND FECHA<=:pFechaFin');
        Q_Auxi.SQL.Add('     AND TURNO='+IntToStr(ATurno));
        if ACombustible>0 then
          Q_Auxi.SQL.Add('    AND COMBUSTIBLE='+IntToStr(ACombustible));
        Q_Auxi.SQL.Add('      ))');
        Q_Auxi.SQL.Add('  ,0)AS Real1 FROM DGASDLIQC');
        Q_Auxi.SQL.Add('  WHERE ESTACION=:pEstacion');
        Q_Auxi.SQL.Add('    AND FECHA>=:pFechaIni');
        Q_Auxi.SQL.Add('    AND FECHA<=:pFechaFin');
        if ACombustible>0 then
          Q_Auxi.SQL.Add('    AND COMBUSTIBLE='+IntToStr(ACombustible));
        if AIsla>0 then
          Q_Auxi.SQL.Add('    AND ISLA='+IntToStr(AIsla));
        if ATurno>0 then
          Q_Auxi.SQL.Add('    AND TURNO='+IntToStr(ATurno));
        Q_Auxi.ParamByName('pEstacion').AsInteger:=AEstacion;
        Q_Auxi.ParamByName('pFechaIni').AsDateTime:=AFechaIni;
        Q_Auxi.ParamByName('pFechaFin').AsDateTime:=AFechaFin;
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_Auxi.IsEmpty then
          Result:=0
        else
          Result:=DivideFloat(Q_AuxiReal1.AsFloat,100);
      finally
        Q_Auxi.Close;
      end;
    except
      Result:=0
    end;
  end;
end;

function TDMLIQ.DeterminaFactorDeAjusteMultiEsts(AEstaciones: String;
  AFechaIni, AFechaFin: TDateTime; ACombustible, AIsla,
  ATurno: Integer): Double;
begin
  with DMGAS do begin
    try
      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Add('SELECT COALESCE(');
        Q_Auxi.SQL.Add('  ((SUM(IMPORTE)*100)/');
        Q_Auxi.SQL.Add('  (SELECT SUM(IMPORTE) FROM DGASDLIQC');
        Q_Auxi.SQL.Add('   WHERE FECHA>=:pFechaIni');
        if (AEstaciones<>'*')and(LimpiaStr(AEstaciones)<>'') then
          Q_Auxi.SQL.Add(' and Estacion in ('+AEstaciones+')');
        Q_Auxi.SQL.Add('    AND FECHA<=:pFechaFin');
        Q_Auxi.SQL.Add('     AND TURNO='+IntToStr(ATurno));
        if ACombustible>0 then
          Q_Auxi.SQL.Add('    AND COMBUSTIBLE='+IntToStr(ACombustible));
        Q_Auxi.SQL.Add('      ))');
        Q_Auxi.SQL.Add('  ,0)AS Real1 FROM DGASDLIQC');
        Q_Auxi.SQL.Add('  WHERE FECHA>=:pFechaIni');
        Q_Auxi.SQL.Add('    AND FECHA<=:pFechaFin');
        if (AEstaciones<>'*')and(LimpiaStr(AEstaciones)<>'') then
          Q_Auxi.SQL.Add(' and Estacion in ('+AEstaciones+')');
        if ACombustible>0 then
          Q_Auxi.SQL.Add('    AND COMBUSTIBLE='+IntToStr(ACombustible));
        if AIsla>0 then
          Q_Auxi.SQL.Add('    AND ISLA='+IntToStr(AIsla));
        if ATurno>0 then
          Q_Auxi.SQL.Add('    AND TURNO='+IntToStr(ATurno));
        Q_Auxi.ParamByName('pFechaIni').AsDateTime:=AFechaIni;
        Q_Auxi.ParamByName('pFechaFin').AsDateTime:=AFechaFin;
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_Auxi.IsEmpty then
          Result:=0
        else
          Result:=DivideFloat(Q_AuxiReal1.AsFloat,100);
      finally
        Q_Auxi.Close;
      end;
    except
      Result := 0;
    end;
  end;
end;

function TDMLIQ.GetImporteAjustadoIsla(const AEstacion: Integer;
  const AFecha: TDateTime; const AIsla, ATurno: Integer): Double;
var
  i:integer;
  AjuImp,_FactorAjusteReal:Double;
begin
  with DMGAS do begin
    Result := 0;
    for i:=1 to 4 do begin
      //determina ajuste
      try
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select coalesce(Sum(d.Total),0) as Real1 from DGASAJUD2 d,DGASAJUD m');
        Q_Auxi.SQL.Add('where m.estacion=d.estacion');
        Q_Auxi.SQL.Add('  and m.fecha=d.fecha');
        Q_Auxi.SQL.Add('  and m.turno=d.turno');        
        Q_Auxi.SQL.Add('  and d.Estacion='+inttostr(AEstacion));
        Q_Auxi.SQL.Add('  and d.fecha='+QuotedStr(FechaToStrSql(AFecha)));
        Q_Auxi.SQL.Add('  and d.Combustible='+inttostr(i));
        if ATurno>0 then
          Q_Auxi.SQL.Add('  and m.Turno='+IntToStr(ATurno));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        AjuImp := Q_AuxiReal1.AsFloat;
        if AjuImp>0.001 then begin
          _FactorAjusteReal:=DeterminaFactorDeAjuste(AEstacion,AFecha,AFecha,i,AIsla,ATurno);
          if _FactorAjusteReal>0.001 then begin
            Result := Result+ AjustaFloat(AjuImp*_FactorAjusteReal,2);
          end
          else
            Result := Result+ AjustaFloat(AjuImp*0,2);
        end
        else
          Result := Result + 0;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;
end;

function TDMLIQ.GetLitrosAjustadosIsla(const AEstacion: Integer;
  const AFecha: TDateTime; const AIsla, ATurno: Integer): Double;
var
  i:integer;
  AjuLts,_FactorAjusteReal:Double;
begin
  with DMGAS do begin
    Result := 0;
    for i:=1 to 4 do begin
      //determina ajuste
      try
        Q_Auxi.Close;
        Q_AuxiReal1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select coalesce(Sum(Diferencia),0) as Real1 from DGASAJUD2');
        Q_Auxi.SQL.Add('where Estacion='+inttostr(AEstacion));
        Q_Auxi.SQL.Add('  and fecha='+QuotedStr(FechaToStrSql(AFecha)));
        Q_Auxi.SQL.Add('  and turno='+IntToStr(ATurno));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        AjuLts := Q_AuxiReal1.AsFloat;
        _FactorAjusteReal:=DeterminaFactorDeAjuste(AEstacion,AFecha,AFecha,0,AIsla,ATurno);
        if _FactorAjusteReal>0.001 then begin
          Result := Result + AjustaFloat(AjuLts*_FactorAjusteReal,2);
        end
        else
          Result := Result + AjustaFloat(AjuLts*0,2);
      finally
        Q_Auxi.Close;
      end;
    end;
  end;
end;

function TDMLIQ.GetHayAjusteEnElDia(const AEstacion: integer;
  const AFecha: TDateTime): Boolean;
begin
  with DMGAS do begin
    try
       try
         Q_Auxi.Close;
         Q_AuxiEntero1.FieldKind := fkInternalCalc;
         Q_Auxi.SQL.Clear;
         Q_Auxi.SQL.Add('SELECT COALESCE(COUNT(*),0) AS Entero1 FROM DGASAJUD');
         Q_Auxi.SQL.Add('WHERE ESTACION=:ESTACION');
         Q_Auxi.SQL.Add('  AND FECHA=:FECHA');
         Q_Auxi.ParamByName('ESTACION').AsInteger := AEstacion;
         Q_Auxi.ParamByName('FECHA').AsDateTime   := AFecha;
         Q_Auxi.Prepare;
         Q_Auxi.Open;
         if Q_Auxi.IsEmpty then
           Result := False
         else if Q_AuxiEntero1.AsInteger>0 then
           Result := True
         else
           Result := False;
       finally
         Q_Auxi.Close;
       end;
    except
      Result := False;
    end;
  end;
end;

function TDMLIQ.GetPosCargaIGAS(const AEstacion, ABomba: Integer): Integer;
begin
  with DMGAS do begin
    try
       Result := 0;
       try
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_AuxiEntero1.FieldKind := fkInternalCalc;
          Q_Auxi.SQL.Add('SELECT POSCARGA as Entero1 FROM DGASBOMB');
          Q_Auxi.SQL.Add('WHERE ESTACION=:ESTACION');
          Q_Auxi.SQL.Add('  AND MANGUERA=:MANGUERA');
          Q_Auxi.ParamByName('ESTACION').AsInteger := AEstacion;
          Q_Auxi.ParamByName('MANGUERA').AsInteger := ABomba;
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if not Q_Auxi.IsEmpty then
            Result := Q_AuxiEntero1.AsInteger
          else
            Result := 0;
       finally
         Q_Auxi.Close;
       end;
    except
      Result := 0;
    end;  
  end;
end;

procedure TDMLIQ.T_ValeBeforeDelete(DataSet: TDataSet);
begin
  with DMGAS do begin
    if (VarCupResguardoEfectivo='Si') and (swValidaValesResguardo) then begin
      try
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASRESGPES');
        Q_Auxi.SQL.Add('where Fecha='+QuotedStr(FechaToStrSQL(T_PvalFECHA.AsDateTime)));
        Q_Auxi.SQL.Add('  and Indice_Val='+IntToStr(T_PvalINDICE.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger>0 then begin
          MensajeErr('Cliente no se puede modificar'+#13+'Para modificarlo entrar a "Resguardo de Efectivo"');
          Abort;
        end;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;
end;

procedure TDMLIQ.T_DvalBeforeDelete(DataSet: TDataSet);
begin
  with DMGAS do begin
    if (VarCupResguardoEfectivo='Si') and (swValidaValesResguardo) then begin
      try
        Q_Auxi.Close;
        Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASRESGPES');
        Q_Auxi.SQL.Add('where Fecha='+QuotedStr(FechaToStrSQL(T_PvalFECHA.AsDateTime)));
        Q_Auxi.SQL.Add('  and Indice_Val='+IntToStr(T_PvalINDICE.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if Q_AuxiEntero1.AsInteger>0 then begin
          MensajeErr('Cliente no se puede modificar'+#13+'Para modificarlo entrar a "Resguardo de Efectivo"');
          Abort;
        end;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;
end;

function TDMLIQ.ValidaDerechoReportesConsultas(const ASIST:string): Boolean;
begin
  try
    ChecaDerechoEspecialAutor2(ASIST,aeReportesEstaciones,True);
    if not FAutoriza.PassOk then
      Result:=False
    else
      Result:=true;
  except
    Result:=False
  end;
end;

procedure TDMLIQ.T_DliqPcAfterInsert(DataSet: TDataSet);
begin
  T_DliqPcESTACION.AsInteger:=T_DliqpESTACION.AsInteger;
  T_DliqPcFOLIO.AsInteger:=T_DliqpFOLIO.AsInteger;
  T_DliqPcCLAVE_PAGO.AsInteger:=T_DliqpCLAVE_PAGO.AsInteger;
end;

procedure TDMLIQ.T_DliqaENTRADASChange(Sender: TField);
begin
  T_DliqaSALD_FIN.AsFloat:=T_DliqaSALD_INI.AsFloat+T_DliqaEntradas.AsFloat-T_DliqaVENTA.AsFloat;
end;

procedure TDMLIQ.T_DliqaSALD_FINValidate(Sender: TField);
begin
  if T_DliqaSALD_FIN.AsFloat<0 then   {637 sentinel de jag}
    MensajeWarn('Cantidad en inventario final debe ser mayor o igual a cero');
end;

procedure TDMLIQ.CalculaResumenPrecios;
var
  litros:real;
  precio:real;
  lecturaAnterior:real;

  precioAnt:Double;
  resultAcum:Double;

  totalLectura:integer;
  _CampoLectura:string;

  totalLitros:Double;
  resultActual:Double;

  importeTotal:Double;

begin
  with DMCONS do begin
    if (not T_Dliqcd.Locate('ESTACION;FOLIO;BOMBA',VarArrayOf([T_DliqcESTACION.AsInteger,T_DliqcFOLIO.AsInteger,T_DliqcBOMBA.AsInteger]),[])) and (T_DliqcLEC_ACT.AsFloat>0) then begin

      totalLectura := 0;
      lecturaAnterior := T_DliqcLEC_ANT.AsFloat;

           try
            //Se implementa esta consulta directamente al totalizador de la bomba
            //debido a que solo valida si el tipo de combustible es igual a 1/2/3,
            //siendo que algunos clientes manejan el combustible 4 para algunas posiciones de carga
            DMCONS.QL_Bomb.Active:=true;
            if DMCONS.QL_Bomb.Locate('PosCarga;Manguera',VarArrayOf([T_DliqcPosCarga.AsInteger,T_DliqcBOMBA.AsInteger]),[]) then begin
              _CampoLectura := DMCONS.QL_BombCAMPOLECTURA.AsString;
              if Trim(_CampoLectura)='' then
                _CampoLectura:='TOTAL'+IntToClaveNum(DMCONS.QL_BombCOMBUSTIBLE.AsInteger,2);
            end;
            if (_CampoLectura = 'TOTAL01') then totalLectura := 1;
            if (_CampoLectura = 'TOTAL02') then totalLectura := 2;
            if (_CampoLectura = 'TOTAL03') then totalLectura := 3;

        finally
          DMCONS.Q_Auxi.Close;
        end;


        try
          DMCONS.Q_Auxi.Close;
          DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
          DMCONS.Q_AuxiReal2.FieldKind := fkInternalCalc;
          DMCONS.Q_AuxiReal3.FieldKind := fkInternalCalc;
          DMCONS.Q_AuxiReal4.FieldKind := fkInternalCalc;
          DMCONS.Q_AuxiReal5.FieldKind := fkInternalCalc;
          DMCONS.Q_AuxiReal6.FieldKind := fkInternalCalc;

          DMCONS.Q_Auxi.SQL.Clear;
          DMCONS.Q_Auxi.SQL.Add('SELECT PRECIO1 As Real1, TOTAL01 As Real2, PRECIO2 As Real3, TOTAL02 As Real4, PRECIO3 As Real5, TOTAL03 As Real6 FROM DPVGTURNDD');
          DMCONS.Q_Auxi.SQL.Add('WHERE FECHATURNO = :FECHATURNO');
          DMCONS.Q_Auxi.SQL.Add('AND TURNO = :TURNO');
          DMCONS.Q_Auxi.SQL.Add('AND POSCARGA = :POSCARGA');
          //para tomar el ultimo
          //DMCONS.Q_Auxi.SQL.Add('ORDER BY FECHAHORA DESC');

          DMCONS.Q_Auxi.ParamByName('FECHATURNO').AsDateTime := T_LiqgFECHA.AsDateTime;
          DMCONS.Q_Auxi.ParamByName('TURNO').AsInteger := T_LiqgTURNO.AsInteger;
          DMCONS.Q_Auxi.ParamByName('POSCARGA').AsInteger :=  T_DliqcPosCarga.AsInteger;
          DMCONS.Q_Auxi.Prepare;
          DMCONS.Q_Auxi.Open;

          //Calcula importe con base a precio
          if (DMCONS.Q_Auxi.RecordCount > 0) then begin

            DMCONS.Q_Auxi.First;
            while not(DMCONS.Q_Auxi.Eof) do begin
              //Precios
              if (T_DliqcCOMBUSTIBLE.AsInteger = 1) then precio:=DMCONS.Q_AuxiReal1.AsFloat;
              if (T_DliqcCOMBUSTIBLE.AsInteger = 2) then precio:=DMCONS.Q_AuxiReal3.AsFloat;
              if (T_DliqcCOMBUSTIBLE.AsInteger = 3) then precio:=DMCONS.Q_AuxiReal5.AsFloat;

              //Litros
              if (T_DliqcCOMBUSTIBLE.AsInteger = 1) then litros:=DMCONS.Q_AuxiReal2.AsFloat;
              if (T_DliqcCOMBUSTIBLE.AsInteger = 2) then litros:=DMCONS.Q_AuxiReal4.AsFloat;
              if (T_DliqcCOMBUSTIBLE.AsInteger = 3) then litros:=DMCONS.Q_AuxiReal6.AsFloat;

              //resta de los litros
              totalLitros := litros - lecturaAnterior;

              if totalLitros <= 0 then begin
                totalLitros := 0;
                resultActual :=0;
              end else begin
                resultActual := totalLitros * precio;

                if LocalizaTabla(T_Dliqcd,'ESTACION;FOLIO;BOMBA;COMBUSTIBLE;PRECIO',VarArrayOf([T_DliqcESTACION.AsInteger,T_DliqcFOLIO.AsInteger,T_DliqcBOMBA.AsInteger,T_DliqcCOMBUSTIBLE.AsInteger,AjustaFloat(precio, 2)])) then begin
                  importeTotal := T_DliqcdIMPORTE.AsFloat + resultActual;
                  T_Dliqcd.Edit;
                  T_DliqcdIMPORTE.AsFloat:=AjustaFloat(importeTotal,2);
                  T_Dliqcd.Post;
                end else begin
                  T_Dliqcd.Insert;
                  T_DliqcdESTACION.AsInteger:=T_DliqcESTACION.AsInteger;
                  T_DliqcdFOLIO.AsInteger:=T_DliqcFOLIO.AsInteger;
                  T_DliqcdBOMBA.AsInteger:=T_DliqcBOMBA.AsInteger;
                  T_DliqcdCOMBUSTIBLE.AsInteger:=T_DliqcCOMBUSTIBLE.AsInteger;
                  T_DliqcdPRECIO.AsFloat:=AjustaFloat(precio, 2);
                  T_DliqcdIMPORTE.AsFloat:=AjustaFloat(resultActual,2);
                  T_Dliqcd.Post;
                  Q_Auxi.Next;
      end;
    end;
              //Convierte lectura actual en anterior
              lecturaAnterior := litros;


              DMCONS.Q_Auxi.Next;
  end;

end;

          finally
          DMCONS.Q_Auxi.Close;
        end;
    end;
  end;
end;

procedure TDMLIQ.T_DliqcdCalcFields(DataSet: TDataSet);
begin
  case T_DliqcdCOMBUSTIBLE.AsInteger of
    1:T_DliqcdNombreComb.AsString:=_NOMBRESCOMBUSTIBLES[1];
    2:T_DliqcdNombreComb.AsString:=_NOMBRESCOMBUSTIBLES[2];
    3:T_DliqcdNombreComb.AsString:=_NOMBRESCOMBUSTIBLES[3];
  end;
end;

procedure TDMLIQ.T_ValeFOLIOVOLUMETRICOSetText(Sender: TField;
  const Text: String);
begin
  estTicket:='';
  //VALIDACION AL LEER TICKETS CON LA ESTACIÓN AL INICIO
  if (Length(Text) > 9) //Ticket impreso con MasterNET
  then begin
    estTicket:=Copy(Text,1,2);
    T_ValeFOLIOVOLUMETRICO.AsInteger := StrToIntDef(Copy(Text, 3, 8), 0)
  end
  else T_ValeFOLIOVOLUMETRICO.AsInteger := StrToIntDef(Text, 0);
end;

procedure TDMLIQ.T_DliqpCalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_AuxiStr40.FieldKind := fkInternalCalc;
    Q_AuxiStr2.FieldKind := fkInternalCalc;
    Q_AuxiStr50.FieldKind := fkInternalCalc;
    Q_Auxi.SQL.Add('Select DESCRIPCION As Str40, DESGLOSA As Str2, CLASE As Str50 From DGASTPAG Where CLAVE=:CLAVE');
    Q_Auxi.ParamByName('CLAVE').AsString := T_DliqpCLAVE_PAGO.AsString;
    Q_Auxi.Prepare;
    Q_Auxi.Open;

    if Q_Auxi.RecordCount > 0 then begin
      T_DliqpDescripcionPago.AsString := Q_AuxiStr40.AsString;
      T_DliqpDesglosa.AsString := Q_AuxiStr2.AsString;
      T_DliqpClasePago.AsString := Q_AuxiStr50.AsString;
    end else begin
      T_DliqpDescripcionPago.AsString := EmptyStr;
      T_DliqpDesglosa.AsString := EmptyStr;
      T_DliqpClasePago.AsString := EmptyStr;
    end;
  end;
end;

function TDMLIQ.CalculaImporteLiquidacion(turno, combustible, posCarga:integer; fecha:TDateTime; lecturaIni, lecturaFin:real):real;
var
  litros:real;
  precio:real;
  lecturaAnterior:real;
  totalLectura:integer;
  _CampoLectura:string;

  totalLitros:Double;
  resultActual:Double;
  
begin
  result := 0;
  lecturaAnterior := lecturaIni;
  totalLectura := 0;
  //Valida
  if not((lecturaFin-lecturaIni)>0.005) then Exit;

  //Consulta configuración de totales
  try
      //Se implementa esta consulta directamente al totalizador de la bomba
      //debido a que solo valida si el tipo de combustible es igual a 1/2/3,
      //siendo que algunos clientes manejan el combustible 4 para algunas posiciones de carga
      DMCONS.QL_Bomb.Active:=true;
      if DMCONS.QL_Bomb.Locate('PosCarga;Manguera',VarArrayOf([T_DliqcPosCarga.AsInteger,T_DliqcBOMBA.AsInteger]),[]) then begin
        _CampoLectura := DMCONS.QL_BombCAMPOLECTURA.AsString;
        if Trim(_CampoLectura)='' then
          _CampoLectura:='TOTAL'+IntToClaveNum(DMCONS.QL_BombCOMBUSTIBLE.AsInteger,2);
      end;
      if (_CampoLectura = 'TOTAL01') then totalLectura := 1;
      if (_CampoLectura = 'TOTAL02') then totalLectura := 2;
      if (_CampoLectura = 'TOTAL03') then totalLectura := 3;

  finally
    DMCONS.Q_Auxi.Close;
  end;

  //Consulta lecturas por cambio de precio
  try
    DMCONS.Q_Auxi.Close;
    DMCONS.Q_AuxiReal1.FieldKind := fkInternalCalc;
    DMCONS.Q_AuxiReal2.FieldKind := fkInternalCalc;
    DMCONS.Q_AuxiReal3.FieldKind := fkInternalCalc;
    DMCONS.Q_AuxiReal4.FieldKind := fkInternalCalc;
    DMCONS.Q_AuxiReal5.FieldKind := fkInternalCalc;
    DMCONS.Q_AuxiReal6.FieldKind := fkInternalCalc;

    DMCONS.Q_Auxi.SQL.Clear;
    DMCONS.Q_Auxi.SQL.Add('SELECT PRECIO1 As Real1, TOTAL01 As Real2, PRECIO2 As Real3, TOTAL02 As Real4, PRECIO3 As Real5, TOTAL03 As Real6 FROM DPVGTURNDD');
    DMCONS.Q_Auxi.SQL.Add('WHERE FECHATURNO = :FECHATURNO');
    DMCONS.Q_Auxi.SQL.Add('AND TURNO = :TURNO');
    DMCONS.Q_Auxi.SQL.Add('AND POSCARGA = :POSCARGA');

    DMCONS.Q_Auxi.ParamByName('FECHATURNO').AsDateTime := fecha;
    DMCONS.Q_Auxi.ParamByName('TURNO').AsInteger := turno;
    DMCONS.Q_Auxi.ParamByName('POSCARGA').AsInteger := posCarga;
    DMCONS.Q_Auxi.Prepare;
    DMCONS.Q_Auxi.Open;

    //Calcula importe con base a precio
    if (DMCONS.Q_Auxi.RecordCount > 0) then begin

      DMCONS.Q_Auxi.First;
      while not(DMCONS.Q_Auxi.Eof) do begin
        //Precios
        if (combustible = 1) then precio:=DMCONS.Q_AuxiReal1.AsFloat;
        if (combustible = 2) then precio:=DMCONS.Q_AuxiReal3.AsFloat;
        if (combustible = 3) then precio:=DMCONS.Q_AuxiReal5.AsFloat;

        //Litros
        if (totalLectura = 1) then litros:=DMCONS.Q_AuxiReal2.AsFloat;
        if (totalLectura = 2) then litros:=DMCONS.Q_AuxiReal4.AsFloat;
        if (totalLectura = 3) then litros:=DMCONS.Q_AuxiReal6.AsFloat;


        //resta de los litros
        totalLitros := litros - lecturaAnterior;

        if totalLitros < 0 then begin
          totalLitros := 0;
          resultActual :=0;
        end else begin
          resultActual := totalLitros * precio;
        end;


        //Calculo
        result := result + resultActual;

        //Convierte lectura actual en anterior
        lecturaAnterior := litros;

        DMCONS.Q_Auxi.Next;
      end;
    end;
  finally
    DMCONS.Q_Auxi.Close;
  end;
end;

function TDMLIQ.ValidaMultiplesPreciosLiquidacion(turno, combustible, posCarga:integer; fecha:TDateTime):Boolean;
var
  campoFB:string;
  lectura:Double;
  preciosMultiples:Boolean;
begin
  preciosMultiples := False;

  //Establece campo de consulta
  campoFB := 'PRECIO' + IntToStr(combustible);
  
  with DMCONS do begin
    try
      //Consulta precios en el turno del combustible
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind := fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT ' + campoFB + ' As Real1 FROM DPVGTURNDD');
      Q_Auxi.SQL.Add('WHERE FECHATURNO = :FECHATURNO');
      Q_Auxi.SQL.Add('AND TURNO = :TURNO');
      Q_Auxi.SQL.Add('AND POSCARGA = :POSCARGA');
      Q_Auxi.SQL.Add('ORDER BY ' + campoFB);

      Q_Auxi.ParamByName('FECHATURNO').AsDateTime := fecha;
      Q_Auxi.ParamByName('TURNO').AsInteger := turno;
      Q_Auxi.ParamByName('POSCARGA').AsInteger := posCarga;
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      if Q_Auxi.RecordCount > 1 then begin
        lectura := -1;
        DMCONS.QL_Bomb.Active:=true;
        if DMCONS.QL_Bomb.Locate('PosCarga;Manguera',VarArrayOf([T_DliqcPosCarga.AsInteger,T_DliqcBOMBA.AsInteger]),[]) then begin
          campoFB := DMCONS.QL_BombCAMPOLECTURA.AsString;
          if Trim(campoFB)='' then
            campoFB:='TOTAL'+IntToClaveNum(DMCONS.QL_BombCOMBUSTIBLE.AsInteger,2);
        end;
//        campoFB := 'TOTAL0' + IntToStr(combustible);

        //Validamos si lecturas son diferentes
        //Es decir, si realmente hubo ventas con ambos precios
        Q_Auxi2.Close;
        Q_Auxi2Real1.FieldKind := fkInternalCalc;
        Q_Auxi2.SQL.Clear;
        Q_Auxi2.SQL.Add('SELECT ' + campoFB + ' As Real1 FROM DPVGTURNDD');
        Q_Auxi2.SQL.Add('WHERE FECHATURNO = :FECHATURNO');
        Q_Auxi2.SQL.Add('AND TURNO = :TURNO');
        Q_Auxi2.SQL.Add('AND POSCARGA = :POSCARGA');
//        Q_Auxi2.SQL.Add('GROUP BY ' + campoFB);
        Q_Auxi2.SQL.Add('ORDER BY ' + campoFB);

        Q_Auxi2.ParamByName('FECHATURNO').AsDateTime := fecha;
        Q_Auxi2.ParamByName('TURNO').AsInteger := turno;
        Q_Auxi2.ParamByName('POSCARGA').AsInteger := posCarga;
        Q_Auxi2.Prepare;
        Q_Auxi2.Open;

        preciosMultiples := Q_Auxi2.RecordCount > 1;
      end;
    finally
      Result := preciosMultiples;
      Q_Auxi.Close;
    end;
  end;
end;

function TDMLIQ.ObtenerUltimoPrecioAplicado(xFecha:TDateTime; xTurno, xCombustible:Integer):real;
var
   horaFinal:TDateTime;
   horaFinTurno, minutoFinTurno:Integer;
begin
  with DMCONS do begin
    //Se consulta directamente desde la tabla DPVGTURN de la BD Consola
    //para consultar el último precio aplicado en base a la fecha administrativa
    //ya que la consulta anterior sólo traía el precio inicial del turno
    DMCONS.Q_Auxi.Close;
    DMCONS.Q_AuxiDate1.FieldKind := fkInternalCalc;
    DMCONS.Q_Auxi.SQL.Clear;
    DMCONS.Q_Auxi.SQL.Add('SELECT FECHAHORAINICIAL As Date1 FROM DPVGTURN');
    DMCONS.Q_Auxi.SQL.Add('WHERE FECHA = :FECHA');
    DMCONS.Q_Auxi.SQL.Add('AND TURNO = :TURNO');

    DMCONS.Q_Auxi.ParamByName('FECHA').AsDateTime := xFecha;
    DMCONS.Q_Auxi.ParamByName('TURNO').AsInteger := xTurno;
    DMCONS.Q_Auxi.Prepare;
    DMCONS.Q_Auxi.Open;
  end;
  with DMGAS do begin
    //Obtener último precio aplicado antes de que finalizara el turno
    if GetPreciosPorEstacion<>'Si' then begin
      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiReal1.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Text := 'SELECT FIRST 1 PRECIO AS Real1 FROM DGASPREC '+
                       'WHERE COMBUSTIBLE=:Combustible '+
                        '  AND HORA_APLICA<=:Hora_aplica '+
                       '  AND APLICADO=:Aplicado ' +
                       '  ORDER BY HORA_APLICA DESC ';
        Q_Auxi.ParamByName('Combustible').AsInteger  := xCombustible;
        IF DMCONS.Q_AuxiDate1.AsDateTime = 0 then
          Q_Auxi.ParamByName('Hora_aplica').AsDateTime := xfecha
        ELSE
          Q_Auxi.ParamByName('Hora_aplica').AsDateTime := DMCONS.Q_AuxiDate1.AsDateTime;
        Q_Auxi.ParamByName('Aplicado').AsString := 'Si';
        Q_Auxi.Prepare;
        Q_Auxi.Open;


        if not Q_Auxi.IsEmpty then
          Result := Q_AuxiReal1.AsFloat
        else
          Result := 0;
      finally
        Q_Auxi.Close;
      end;
    end
    else begin
      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiReal1.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Text := 'SELECT COALESCE(PRECIO,0) AS Real1 FROM DGASPRECEST '+
                       'WHERE ESTACION=:Estacion '+
                       '  AND COMBUSTIBLE=:Combustible '+
                       '  AND HORA_APLICA<=:Hora_aplica '+
                       '  ORDER BY HORA_APLICA DESC ';
        Q_Auxi.ParamByName('Estacion').AsInteger     := EstacionActual;
        Q_Auxi.ParamByName('Combustible').AsInteger  := xCombustible;
        Q_Auxi.ParamByName('Hora_aplica').AsDateTime := DMCONS.Q_AuxiDate1.AsDateTime;
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        if not Q_Auxi.IsEmpty then
          Result := Q_AuxiReal1.AsFloat
        else
          Result := 0;
      finally
        Q_Auxi.Close;
      end;
    end;
  end;
end;

procedure TDMLIQ.T_DliqcBeforePost(DataSet: TDataSet);
var
     importeOriginal:Double;
     cantidadTotal:Double;
begin
  if ((T_DliqcLec_Act.AsFloat > 0) and (T_DliqcAPLICADO.AsString='No')) then begin
    //CANTIDAD                                                                                                /////
    if (DMGAS.VarGasDiferenciaLectura) then //SE HACE LA VALIDACION PARA EL CAMPO DIFERENCIA DE LECTURAS
      T_DliqcCANTIDAD.AsFloat := Trunc((T_DliqcLEC_ACT.AsFloat - T_DliqcLEC_ANT.AsFloat - T_DliqcDEVOLUCION.AsFloat - T_DliqcCONSIGNACION.AsFloat - T_DliqcDIFLECTURAS.AsFloat) * 1000 + 0.5 ) / 1000
    else
      T_DliqcCANTIDAD.AsFloat := Trunc((T_DliqcLEC_ACT.AsFloat - T_DliqcLEC_ANT.AsFloat - T_DliqcDEVOLUCION.AsFloat - T_DliqcCONSIGNACION.AsFloat) * 1000 + 0.5) / 1000;

    //Si el combustible tuvo cambio de precio en el turno, se promedia
    if (ValidaMultiplesPreciosLiquidacion(T_LiqgTURNO.AsInteger, T_DliqcCOMBUSTIBLE.AsInteger, T_DliqcPosCarga.AsInteger, T_LiqgFECHA.AsDateTime)) then begin
      //IMPORTE
      T_DliqcIMPORTE.AsFloat:=CalculaImporteLiquidacion(T_LiqgTURNO.AsInteger, T_DliqcCOMBUSTIBLE.AsInteger, T_DliqcPosCarga.AsInteger, T_LiqgFECHA.AsDateTime, T_DliqcLEC_ANT.AsFloat, T_DliqcLec_Act.AsFloat);

      //GUARDAMOS EL IMPORTE TOTAL ASÍ COMO LA CANTIDAD TOTAL
      importeOriginal:= AjustaFloat(T_DliqcIMPORTE.AsFloat,2);
      cantidadTotal:=T_DliqcCANTIDAD.AsFloat+T_DliqcDEVOLUCION.AsFloat+T_DliqcCONSIGNACION.AsFloat;

      //PRECIO
      if (T_DliqcCANTIDAD.AsFloat>0) and (not lecturaModificada)then begin

        T_DliqcPRECIO_CIVA.AsFloat:=Trunc((T_DliqcIMPORTE.AsFloat/(T_DliqcCANTIDAD.AsFloat+T_DliqcDEVOLUCION.AsFloat+T_DliqcCONSIGNACION.AsFloat))*1000+0.5)/1000;

        if(Ajustafloat(cantidadTotal,2) = AjustaFloat(T_DliqcCANTIDAD.AsFloat,2))then begin
          T_DliqcIMPORTE.AsFloat:=AjustaFloat(importeOriginal,2);
          T_DliqcCANTIDAD.AsFloat:= AjustaFloat((T_DliqcIMPORTE.AsFloat/AjustaFloat(T_DliqcPRECIO_CIVA.AsFloat,2)),4);
        end else begin
        T_DliqcIMPORTE.AsFloat:=Trunc(T_DliqcCANTIDAD.AsFloat*T_DliqcPRECIO_CIVA.ASFloat*100+0.5)/100;
        end;

      end
      else if lecturaModificada then begin
        T_DliqcPRECIO_CIVA.AsFloat:=ObtenerUltimoPrecioAplicado(T_LiqgFECHA.AsDateTime, T_LiqgTURNO.AsInteger,T_DliqcCOMBUSTIBLE.AsInteger);
        T_DliqcIMPORTE.AsFloat:=Trunc(T_DliqcCANTIDAD.AsFloat*T_DliqcPRECIO_CIVA.ASFloat*100+0.5)/100;
      end
      else T_DliqcPRECIO_CIVA.AsFloat:=0;
    end
    else begin
      //PRECIO
      T_DliqcPRECIO_CIVA.AsFloat:=ObtenerUltimoPrecioAplicado(T_LiqgFECHA.AsDateTime, T_LiqgTURNO.AsInteger,T_DliqcCOMBUSTIBLE.AsInteger);
      //IMPORTE
      T_DliqcIMPORTE.AsFloat:=Trunc(T_DliqcCANTIDAD.AsFloat*T_DliqcPRECIO_CIVA.ASFloat*100+0.5)/100;
    end;
  end;
  lecturaModificada:=False;
end;

procedure TDMLIQ.ActualizaTablasDescuentos;
var
  totDesc, totImp : Double;
begin
  T_Desc.Active := True;
  T_Descd.Active := True;
  totImp:=0;
  totDesc:=0;

  if LocalizaTabla(T_Desc,'ESTACION;FECHA;TURNO',VarArrayOf([T_LiqgESTACION.AsInteger, T_LiqgFECHA.AsDateTime, T_LiqgTURNO.AsInteger]))then begin
    T_Descd.First;
    with DMCONS do begin
      while not T_Descd.Eof do begin
        if T_DescdISLA.AsInteger = T_LiqgISLA.AsInteger then begin
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_AuxiReal2.FieldKind:=fkInternalCalc;
          Q_AuxiReal3.FieldKind:=fkInternalCalc;
          Q_AuxiReal4.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Add('SELECT COMBUSTIBLE, ROUND(AVG(PRECIO),2) AS REAL1, COALESCE(SUM(VOLUMEN),0) AS REAL2, COALESCE(SUM(IMPORTE),0) AS REAL3,');
          Q_Auxi.SQL.Add('COALESCE(SUM(DESCUENTO),0) AS REAL4 FROM DPVGMOVI WHERE FECHATURNO=:FECHATURNO AND TURNO=:TURNO AND COMBUSTIBLE=:COMBUSTIBLE');
          Q_Auxi.SQL.Add('AND POSCARGA IN (SELECT DISTINCT POSCARGA FROM DPVGBOMB WHERE ISLA=:ISLA)');
          Q_Auxi.SQL.Add('GROUP BY COMBUSTIBLE');
          Q_Auxi.ParamByName('FECHATURNO').AsDateTime:=T_DescFECHA.AsDateTime;
          Q_Auxi.ParamByName('TURNO').AsInteger:=T_DescTURNO.AsInteger;
          Q_Auxi.ParamByName('COMBUSTIBLE').AsInteger:=T_DescdCOMBUSTIBLE.AsInteger;
          Q_Auxi.ParamByName('ISLA').AsInteger:=T_DescdISLA.AsInteger;
          Q_Auxi.Open;

          T_Descd.Edit;
          T_DescdLITROS.AsFloat:=Q_AuxiReal2.AsFloat;
          T_DescdPRECIO.AsFloat:=Q_AuxiReal1.AsFloat;
          T_DescdIMPORTE.AsFloat:=Q_AuxiReal3.AsFloat;
          T_DescdDESCUENTO.AsFloat:=Q_AuxiReal4.AsFloat;
          T_DescdTOTAL.AsFloat:=Q_AuxiReal3.AsFloat-Q_AuxiReal4.AsFloat;
          T_Descd.Post;

          totImp:=totImp+(Q_AuxiReal3.AsFloat-Q_AuxiReal4.AsFloat);
          totDesc:=totDesc+Q_AuxiReal4.AsFloat;
        end;
        T_Descd.Next;
      end;
    end;
    
    T_Desc.Edit;
    T_DescTOTAL.AsFloat:=T_DescTOTAL.AsFloat+totImp;
    T_DescDESCUENTO.AsFloat:=T_DescDESCUENTO.AsFloat+totDesc;
    T_Desc.Post;
  end;
end;

procedure TDMLIQ.DesaplicaDescuentos;
var
  sumTotDet, sumDescDet: Double;
begin
  with DMGAS do begin
    try
      Q_Auxi.Close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_AuxiReal2.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT COALESCE(SUM(DESCUENTO),0) AS Real1, COALESCE(SUM(TOTAL),0) AS Real2 FROM DGASDESCD');
      Q_Auxi.SQL.Add('WHERE ESTACION=:ESTACION');
      Q_Auxi.SQL.Add('AND FECHA=:FECHA');
      Q_Auxi.SQL.Add('AND TURNO=:TURNO');
      Q_Auxi.SQL.Add('AND ISLA=:ISLA');
      Q_Auxi.ParamByName('ESTACION').AsInteger := T_LiqgESTACION.AsInteger;
      Q_Auxi.ParamByName('FECHA').AsDateTime := T_LiqgFECHA.AsDateTime;
      Q_Auxi.ParamByName('TURNO').AsInteger := T_LiqgTURNO.AsInteger;
      Q_Auxi.ParamByName('ISLA').AsInteger := T_LiqgISLA.AsInteger;
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      sumDescDet := Q_AuxiReal1.AsFloat;
      sumTotDet := Q_AuxiReal2.AsFloat;

      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('UPDATE DGASDESC SET TOTAL=TOTAL-:TOTAL, DESCUENTO=DESCUENTO-:DESCUENTO');
      Q_Auxi.SQL.Add('WHERE ESTACION=:ESTACION');
      Q_Auxi.SQL.Add('AND FECHA=:FECHA');
      Q_Auxi.SQL.Add('AND TURNO=:TURNO');
      Q_Auxi.ParamByName('TOTAL').AsFloat := sumTotDet;
      Q_Auxi.ParamByName('DESCUENTO').AsFloat := sumDescDet;
      Q_Auxi.ParamByName('ESTACION').AsInteger := T_LiqgESTACION.AsInteger;
      Q_Auxi.ParamByName('FECHA').AsDateTime := T_LiqgFECHA.AsDateTime;
      Q_Auxi.ParamByName('TURNO').AsInteger := T_LiqgTURNO.AsInteger;
      Q_Auxi.ExecSQL;

      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('UPDATE DGASDESCD SET LITROS = 0,PRECIO = 0,IMPORTE = 0,DESCUENTO = 0,TOTAL = 0');
      Q_Auxi.SQL.Add('WHERE ESTACION = :ESTACION');
      Q_Auxi.SQL.Add('AND FECHA = :FECHA');
      Q_Auxi.SQL.Add('AND TURNO = :TURNO');
      Q_Auxi.SQL.Add('AND ISLA = :ISLA');
      Q_Auxi.ParamByName('ESTACION').AsInteger := T_LiqgESTACION.AsInteger;
      Q_Auxi.ParamByName('FECHA').AsDateTime := T_LiqgFECHA.AsDateTime;
      Q_Auxi.ParamByName('TURNO').AsInteger := T_LiqgTURNO.AsInteger;
      Q_Auxi.ParamByName('ISLA').AsInteger := T_LiqgISLA.AsInteger;
      Q_Auxi.ExecSQL;
    except
      on e: Exception do
        MensajeInfo(e.Message);
    end;
  end;
end;

function TDMLIQ.TruncarNDecimales(valorOriginal: Double; CantidadDecimales: Integer): Double;
var
  resultado: Double;
  factor: Extended;
begin
  //UltimaFuncionLlamada:='TruncarNDecimales';
  factor:=  Exp(cantidadDecimales * Ln(10));
  resultado := valorOriginal * factor;
  resultado := Trunc(resultado);
  resultado := resultado / factor;
  Result:= resultado;
end ;


end.
