unit ULIQTURCcpol;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Buttons, ComCtrls, DBCtrls;

type
  TFLIQTURCcpol = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    StaticText3: TStaticText;
    QL_Dliqc: TQuery;
    QL_DliqcESTACION: TIntegerField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcFECHA: TDateTimeField;
    QL_DliqcTURNO: TIntegerField;
    QL_DliqcSubtotalComb: TFloatField;
    QL_DliqcIvaComb: TFloatField;
    QL_DliqcFechaAlfa: TStringField;
    QL_DliqcCostoComb: TFloatField;
    QL_Dliqa: TQuery;
    QL_DliqaESTACION: TIntegerField;
    QL_DliqaPRODUCTO: TIntegerField;
    QL_DliqaFECHA: TDateTimeField;
    QL_DliqaTURNO: TIntegerField;
    QL_DliqaCANTIDAD: TFloatField;
    QL_DliqaSubtotalProd: TFloatField;
    QL_DliqaIvaProd: TFloatField;
    QL_DliqaCostoComb: TFloatField;
    QL_DliqaCombustible: TIntegerField;
    QL_DliqcProducto: TIntegerField;
    QL_DliqaIMPORTEPROD: TFloatField;
    QL_DliqaCostoProd: TFloatField;
    QL_DliqcImporteProd: TFloatField;
    QL_DliqcSubtotalProd: TFloatField;
    QL_DliqcIvaProd: TFloatField;
    QL_DliqcCostoProd: TFloatField;
    QL_DliqaImporteComb: TFloatField;
    QL_DliqaSubTotalComb: TFloatField;
    QL_DliqaIvaComb: TFloatField;
    QL_DliqcIvaCombProd: TFloatField;
    QL_DliqaIvaCombProd: TFloatField;
    QL_DliqaFechaAlfa: TStringField;
    QL_Dliqp: TQuery;
    QL_DliqpESTACION: TIntegerField;
    QL_DliqpFECHA: TDateTimeField;
    QL_DliqpTURNO: TIntegerField;
    QL_DliqpCLAVEPAGO: TStringField;
    QL_DliqcClavePago: TIntegerField;
    QL_DliqcImportePago: TFloatField;
    QL_DliqaClavePago: TIntegerField;
    QL_DliqaImportePago: TFloatField;
    QL_DliqpCombustible: TIntegerField;
    QL_DliqpProducto: TIntegerField;
    QL_DliqpImporteComb: TFloatField;
    QL_DliqpImporteProd: TFloatField;
    QL_DliqpSubtotalComb: TFloatField;
    QL_DliqpSubtotalProd: TFloatField;
    QL_DliqpIvaComb: TFloatField;
    QL_DliqpIvaProd: TFloatField;
    QL_DliqpFechaAlfa: TStringField;
    QL_DliqpCantidad: TFloatField;
    QL_DliqpCostoComb: TFloatField;
    QL_DliqpCostoProd: TFloatField;
    QL_DliqpIvaCombProd: TFloatField;
    QL_Rcup: TQuery;
    QL_RcupESTACION: TIntegerField;
    QL_RcupFECHA: TDateTimeField;
    QL_RcupTURNO: TIntegerField;
    QL_RcupIMPORTECUPON: TFloatField;
    QL_RcupCuentaCntCupones: TStringField;
    QL_DliqcImporteCupon: TFloatField;
    QL_DliqcCuentaCntCupones: TStringField;
    QL_DliqaImporteCupon: TFloatField;
    QL_DliqaCuentaCntCupones: TStringField;
    QL_DliqpImporteCupon: TFloatField;
    QL_DliqpCuentaCntCupones: TStringField;
    QL_RcupCombustible: TIntegerField;
    QL_RcupProducto: TIntegerField;
    QL_RcupImporteComb: TFloatField;
    QL_RcupImporteProd: TFloatField;
    QL_RcupSubtotalComb: TFloatField;
    QL_RcupSubtotalProd: TFloatField;
    QL_RcupIvaComb: TFloatField;
    QL_RcupIvaProd: TFloatField;
    QL_RcupFechaAlfa: TStringField;
    QL_RcupCantidad: TFloatField;
    QL_RcupCostoComb: TFloatField;
    QL_RcupCostoProd: TFloatField;
    QL_RcupIvaCombProd: TFloatField;
    QL_RcupImportePago: TFloatField;
    QL_RcupClavePago: TIntegerField;
    QL_DliqcNoClienteCupon: TIntegerField;
    QL_DliqaNoClienteCupon: TIntegerField;
    QL_DliqpNoClienteCupon: TIntegerField;
    QL_RcupNOCLIENTECUPON: TIntegerField;
    QL_DliqcCANTIDADPREV: TFloatField;
    QL_DliqcIMPORTEPREV: TFloatField;
    QL_DliqcCantidad: TFloatField;
    QL_DliqcImporteComb: TFloatField;
    QL_DliqpIMPORTEPREV: TFloatField;
    QL_DliqpImportePago: TFloatField;
    QL_DliqcCuentaDespachador: TStringField;
    QL_DliqaCuentaDespachador: TStringField;
    QL_RcupCuentaDespachador: TStringField;
    QL_DliqpFOLIO: TIntegerField;
    QL_DliqpDespachador: TIntegerField;
    QL_DliqpCuentaDespachador: TStringField;
    QL_Pval: TQuery;
    QL_PvalESTACION: TIntegerField;
    QL_PvalCAJA: TIntegerField;
    QL_PvalFECHA: TDateTimeField;
    QL_PvalTURNO: TIntegerField;
    QL_PvalIMPORTEVALE: TFloatField;
    QL_PvalCuentaDespachador: TStringField;
    QL_PvalCombustible: TIntegerField;
    QL_PvalProducto: TIntegerField;
    QL_PvalImporteComb: TFloatField;
    QL_PvalImporteProd: TFloatField;
    QL_PvalSubtotalComb: TFloatField;
    QL_PvalSubtotalProd: TFloatField;
    QL_PvalIvaComb: TFloatField;
    QL_PvalIvaProd: TFloatField;
    QL_PvalFechaAlfa: TStringField;
    QL_PvalCantidad: TFloatField;
    QL_PvalImportePago: TFloatField;
    QL_PvalCostoComb: TFloatField;
    QL_PvalCostoProd: TFloatField;
    QL_PvalIvaCombProd: TFloatField;
    QL_PvalClavePago: TIntegerField;
    QL_PvalNOCLIENTEVALE: TIntegerField;
    QL_PvalCuentaCntVales: TStringField;
    QL_DliqcNoClienteVale: TIntegerField;
    QL_DliqcCuentaCntVales: TStringField;
    QL_DliqaNoClienteVale: TIntegerField;
    QL_DliqaCuentaCntVales: TStringField;
    QL_DliqpNoClienteVale: TIntegerField;
    QL_DliqpCuentaCntVales: TStringField;
    QL_RcupNoClienteVale: TIntegerField;
    QL_PvalNoClienteCupon: TIntegerField;
    QL_PvalImporteCupon: TFloatField;
    QL_DliqcImporteVale: TFloatField;
    QL_DliqaImporteVale: TFloatField;
    QL_DliqpImporteVale: TFloatField;
    QL_RcupImporteVale: TFloatField;
    QL_DliqaLineaAceites: TIntegerField;
    QL_DliqcLineaAceites: TIntegerField;
    QL_DliqpLineaAceites: TIntegerField;
    QL_RcupLineaAceites: TIntegerField;
    QL_PvalLineaAceites: TIntegerField;
    QL_Tran: TQuery;
    QL_TranESTACION: TIntegerField;
    QL_TranFECHA: TDateTimeField;
    QL_TranTURNO: TIntegerField;
    QL_TranNOCLIENTETARJETA: TIntegerField;
    QL_DliqcNoClienteTarjeta: TIntegerField;
    QL_DliqaNoClienteTarjeta: TIntegerField;
    QL_DliqpNoClienteTarjeta: TIntegerField;
    QL_RcupNoClienteTarjeta: TIntegerField;
    QL_PvalNoClienteTarjeta: TIntegerField;
    QL_TranNoClienteVale: TIntegerField;
    QL_TranIMPORTETARJETA: TFloatField;
    QL_DliqcImporteTarjeta: TIntegerField;
    QL_DliqaImporteTarjeta: TIntegerField;
    QL_DliqpImporteTarjeta: TIntegerField;
    QL_RcupImporteTarjeta: TIntegerField;
    QL_PvalImporteTarjeta: TIntegerField;
    QL_TranClavePago: TIntegerField;
    QL_TranCostoComb: TFloatField;
    QL_TranImportePago: TFloatField;
    QL_TranCantidad: TFloatField;
    QL_TranFechaAlfa: TStringField;
    QL_TranIvaProd: TFloatField;
    QL_TranIvaComb: TFloatField;
    QL_TranSubtotalProd: TFloatField;
    QL_TranSubtotalComb: TFloatField;
    QL_TranImporteProd: TFloatField;
    QL_TranImporteComb: TFloatField;
    QL_TranProducto: TIntegerField;
    QL_TranCuentaDespachador: TStringField;
    QL_TranIvaCombProd: TFloatField;
    QL_TranCostoProd: TFloatField;
    QL_TranNoClienteCupon: TIntegerField;
    QL_TranImporteCupon: TFloatField;
    QL_TranLineaAceites: TIntegerField;
    QL_TranImporteVale: TIntegerField;
    QL_TranCuentaCntTarjeta: TStringField;
    QL_DliqcCuentaCntTarjeta: TStringField;
    QL_DliqaCuentaCntTarjeta: TStringField;
    QL_DliqpCuentaCntTarjeta: TStringField;
    QL_RcupCuentaCntTarjeta: TStringField;
    QL_PvalCuentaCntTarjeta: TStringField;
    QL_TranCOMBUSTIBLE: TIntegerField;
    QL_TranTipoTarjeta: TStringField;
    QL_TranImporteTarjetaCR: TFloatField;
    QL_TranImporteTarjetaPP: TFloatField;
    QL_PvalTipoTarjeta: TStringField;
    QL_PvalImporteTarjetaCR: TFloatField;
    QL_PvalImporteTarjetaPP: TFloatField;
    QL_RcupTipoTarjeta: TStringField;
    QL_RcupImporteTarjetaCR: TFloatField;
    QL_RcupImporteTarjetaPP: TFloatField;
    QL_DliqpTipoTarjeta: TStringField;
    QL_DliqpImporteTarjetaCR: TFloatField;
    QL_DliqpImporteTarjetaPP: TFloatField;
    QL_DliqaTipoTarjeta: TStringField;
    QL_DliqaImporteTarjetaCR: TFloatField;
    QL_DliqaImporteTarjetaPP: TFloatField;
    QL_DliqcTipoTarjeta: TStringField;
    QL_DliqcImporteTarjetaCR: TFloatField;
    QL_DliqcImporteTarjetaPP: TFloatField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    StaticText1: TStaticText;
    QL_PvalCOMBUSTIBLEVALE: TIntegerField;
    QL_PvalPRODUCTOVALE: TIntegerField;
    QL_PvalCANTIDADVALE: TFloatField;
    QL_DliqcCombustibleVale: TIntegerField;
    QL_DliqcProductoVale: TIntegerField;
    QL_DliqcCantidadVale: TFloatField;
    QL_DliqaCombustibleVale: TIntegerField;
    QL_DliqaProductoVale: TIntegerField;
    QL_DliqaCantidadVale: TFloatField;
    QL_DliqpCombustibleVale: TIntegerField;
    QL_DliqpProductoVale: TIntegerField;
    QL_DliqpCantidadVale: TFloatField;
    QL_RcupCombustibleVale: TIntegerField;
    QL_RcupProductoVale: TIntegerField;
    QL_RcupCantidadVale: TFloatField;
    QL_TranCombustibleVale: TIntegerField;
    QL_TranProductoVale: TIntegerField;
    QL_TranCantidadVale: TFloatField;
    QL_PvalGrupoCliente: TIntegerField;
    QL_DliqcGrupoCliente: TIntegerField;
    QL_DliqaGrupoCliente: TIntegerField;
    QL_DliqpGrupoCliente: TIntegerField;
    QL_TranGrupoCliente: TIntegerField;
    QL_RcupGrupoCliente: TIntegerField;
    QL_PvalCuentaCntCupones: TStringField;
    QL_RcupCuentaCntVales: TStringField;
    QL_TranCuentaCntVales: TStringField;
    QL_TranCuentaCntCupones: TStringField;
    QL_TranImporteTarjetaME: TFloatField;
    QL_DliqcImporteTarjetaME: TFloatField;
    QL_DliqaImporteTarjetaME: TFloatField;
    QL_DliqpImporteTarjetaME: TFloatField;
    QL_RcupImporteTarjetaME: TFloatField;
    QL_PvalImporteTarjetaME: TFloatField;
    QL_DliqcSubtotCombAntIEPS: TFloatField;
    QL_DliqcIEPSCOMB: TFloatField;
    QL_DliqaSubtotCombAntIEPS: TFloatField;
    QL_DliqaIEPSComb: TFloatField;
    QL_DliqpSubtotCombAntIEPS: TFloatField;
    QL_DliqpIEPSComb: TFloatField;
    QL_TranSubtotCombAntIEPS: TFloatField;
    QL_TranIEPSComb: TFloatField;
    QL_RcupSubtotCombAntIEPS: TFloatField;
    QL_RcupIEPSComb: TFloatField;
    QL_PvalSubtotCombAntIEPS: TFloatField;
    QL_PvalIEPSComb: TFloatField;
    QL_RcupCOMBUSTIBLECUPON: TIntegerField;
    QL_DliqcCombustibleCupon: TIntegerField;
    QL_DliqaCombustibleCupon: TIntegerField;
    QL_DliqpCombustibleCupon: TIntegerField;
    QL_TranCombustibleCupon: TIntegerField;
    QL_PvalCombustibleCupon: TIntegerField;
    QL_RcupIEPSCupon: TFloatField;
    QL_RcupCantidadCupon: TFloatField;
    QL_RcupSubtotCupAntIEPS: TFloatField;
    QL_RcupIvaCupon: TFloatField;
    QL_RcupSubtotalCupon: TFloatField;
    QL_DliqcCantidadCupon: TFloatField;
    QL_DliqcIEPSCupon: TFloatField;
    QL_DliqcSubtotCupAntIEPS: TFloatField;
    QL_DliqcIvaCupon: TFloatField;
    QL_DliqcSubtotalCupon: TFloatField;
    QL_DliqaCantidadCupon: TFloatField;
    QL_DliqaIEPSCupon: TFloatField;
    QL_DliqaSubtotCupAntIEPS: TFloatField;
    QL_DliqaIvaCupon: TFloatField;
    QL_DliqaSubtotalCupon: TFloatField;
    QL_DliqpCantidadCupon: TFloatField;
    QL_DliqpIEPSCupon: TFloatField;
    QL_DliqpSubtotCupAntIEPS: TFloatField;
    QL_DliqpIvaCupon: TFloatField;
    QL_DliqpSubtotalCupon: TFloatField;
    QL_TranCantidadCupon: TFloatField;
    QL_TranIEPSCupon: TFloatField;
    QL_TranSubtotCupAntIEPS: TFloatField;
    QL_TranIvaCupon: TFloatField;
    QL_TranSubtotalCupon: TFloatField;
    QL_PvalCantidadCupon: TFloatField;
    QL_PvalIEPSCupon: TFloatField;
    QL_PvalSubtotCupAntIEPS: TFloatField;
    QL_PvalIvaCupon: TFloatField;
    QL_PvalSubtotalCupon: TFloatField;
    QL_PvalCuentaClienteAux: TStringField;
    QL_RcupCuentaClienteAux: TStringField;
    QL_TranCuentaClienteAux: TStringField;
    QL_DliqcCuentaClienteAux: TIntegerField;
    QL_DliqaCuentaClienteAux: TIntegerField;
    QL_DliqpCuentaClienteAux: TIntegerField;
    QL_DliqaDespachador: TIntegerField;
    QL_TranDESPACHADOR: TIntegerField;
    QL_RcupDespachador: TIntegerField;
    QL_PvalDespachador: TIntegerField;
    QL_PvalIEPSValeComb: TFloatField;
    QL_PvalSubtotValeAntIEPS: TFloatField;
    QL_PvalIvaValeComb: TFloatField;
    QL_PvalSubtotalValeComb: TFloatField;
    QL_RcupIEPSValeComb: TFloatField;
    QL_RcupSubtotValeAntIEPS: TFloatField;
    QL_RcupIvaValeComb: TFloatField;
    QL_RcupSubtotalValeComb: TFloatField;
    QL_TranIEPSValeComb: TFloatField;
    QL_TranSubtotValeAntIEPS: TFloatField;
    QL_TranIvaValeComb: TFloatField;
    QL_TranSubtotalValeComb: TFloatField;
    QL_DliqpIEPSValeComb: TFloatField;
    QL_DliqpSubtotValeAntIEPS: TFloatField;
    QL_DliqpIvaValeComb: TFloatField;
    QL_DliqpSubtotalValeComb: TFloatField;
    QL_DliqaIEPSValeComb: TFloatField;
    QL_DliqaSubtotValeAntIEPS: TFloatField;
    QL_DliqaIvaValeComb: TFloatField;
    QL_DliqaSubtotalValeComb: TFloatField;
    QL_DliqcIEPSValeComb: TFloatField;
    QL_DliqcSubtotValeAntIEPS: TFloatField;
    QL_DliqcIvaValeComb: TFloatField;
    QL_DliqcSubtotalValeComb: TFloatField;
    QL_DliqcFOLIO: TIntegerField;
    QL_DliqcDespachador: TIntegerField;
    QL_DliqaFOLIO: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure QL_DliqcCalcFields(DataSet: TDataSet);
    procedure QL_DliqaCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QL_DliqpCalcFields(DataSet: TDataSet);
    procedure QL_RcupCalcFields(DataSet: TDataSet);
    procedure QL_PvalCalcFields(DataSet: TDataSet);
    procedure QL_TranCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    pdocu:string;
    pnum,
    pcve:integer;
    xTasaIva:array[1..10] of real;
    xCostoCmb:array[1..10] of real;
    xAjusteCant:array[1..10] of real;
    xAjusteImpo:array[1..10] of real;
    ListaProd:TStrings;
    TpagCupon:integer;
    TpagEfectivo:integer;
    AjusteTotal:real;
    xTurnoAux:integer;
    xSwAux:Boolean;
    xAlmacen:integer;
  public
    { Public declarations }
    procedure PreparaForma(xdocu:string;xnum:integer);
    function DameCuentaAuxiCliente(xcliente:Integer):string;
  end;

var
  FLIQTURCcpol: TFLIQTURCcpol;

implementation

uses DDMCFG, DDMGEN, ULIBGRAL, ULIBDATABASE, UGENPOLIautom, DDMGENQ,
  UGEN_NET, DDMCNT, DDMCUP, DDMGAS, DDMLIQ, DDMGEN_VTAS;

{$R *.DFM}

procedure TFLIQTURCcpol.PreparaForma(xdocu:string;xnum:integer);
var i:integer;
    lin:string;
    costo:real;
begin
  with DMCFG,DMGAS,DMCUP do begin
    Q_Cpold.Close;
    Q_Cpold.ParamByName('pdocumento').AsString:=xdocu;
    Q_Cpold.ParamByName('pnumero').AsInteger:=xnum;
    Q_Cpold.Prepare;
    Q_Cpold.Open;
    DBLookupComboBox1.KeyValue:=Q_CpoldClave.AsInteger;
    xSwAux:=true;
    xTurnoAux:=1;
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Turno as Entero1 from DGASAJUD');
    Q_Auxi.SQL.Add('Where Estacion='+IntToStr(T_TurcEstacion.asinteger));
    Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.asdatetime)+'"');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    xTurnoAux:=Q_AuxiEntero1.AsInteger;
    xAlmacen:=1;
    if LocalizaTabla(T_Ests,'Clave',T_TurcEstacion.AsInteger) then
      xAlmacen:=T_EstsAlmacen.AsInteger;
    for i:=1 to 10 do begin
      xTasaIva[i]:=0;
      xCostoCmb[i]:=0;
      xAjusteCant[i]:=0;
      xAjusteImpo[i]:=0;
    end;
    AjusteTotal:=0;
    TpagEfectivo:=0;
    TpagCupon:=0;

    // Tipo de Pago Cupones
    T_Tpag.Active:=true;
    T_Tpag.First;
    while not T_Tpag.Eof do begin
      if (TpagCupon=0) and (T_TpagClase.AsString='Cupón') then
        TpagCupon:=T_TpagClave.AsInteger;
      if (TpagEfectivo=0) and (T_TpagClase.AsString='Efectivo') then
        TpagEfectivo:=T_TpagClave.AsInteger;
      T_Tpag.Next;
    end;

    // Tipos de Combustible
    T_Tcmb.Active:=true;
    T_Tcmb.First;
    while not T_Tcmb.Eof do begin
      i:=T_TcmbClave.AsInteger;
      if i in [1..10] then begin
        PrecioCombustibleFecha(T_TcmbClave.AsInteger,T_TurcFecha.asdatetime);
        xTasaIva[i]:=PrecTasaIva;
        Costo:=PrecCosto;
        if VarGasCostoCombustiblesAlma='Si' then Costo:=DMLIQ.CostoCombustibleInv(xAlmacen,T_TcmbClave.AsInteger,T_TurcFecha.asdatetime,T_TurcFecha.AsDateTime);
        xCostoCmb[i]:=Costo;
      end;
      T_Tcmb.Next;
    end;

    // Lista de Productos
    ListaProd:=TStringList.Create;
    T_Prod.Active:=true;
    T_Prod.First;
    while not T_Prod.Eof do begin
      PrecioProductoFecha(T_ProdClave.AsInteger,T_TurcFecha.asdatetime);
      Costo:=PreaCosto;
      if VarGasCostoProductosAlma='Si' then
        Costo:=DMLIQ.CostoProductoInv(xAlmacen,T_ProdClave.AsInteger,T_TurcFecha.asdatetime,T_TurcFecha.AsDateTime);
      lin:=inttostr(T_ProdClave.AsInteger)+' // '+
           FormatoNumero(PreaTasaIva,10,2)+' // '+
           FormatoNumero(Costo,10,2)+'//A//';
      ListaProd.Add(lin);
      T_Prod.Next;
    end;

    // Calculo de Ajuste
    if (T_TurcTurno.asinteger=xTurnoAux)or(VarGasPolizaLiqDia='Si') then begin
      T_Tcmb.First;
      while not T_Tcmb.Eof do begin
        i:=T_TcmbClave.AsInteger;
        if i in [1..10] then begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_AuxiReal2.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(Diferencia) as Real1, sum(Total) as Real2 from DGASAJUD2');
          Q_Auxi.SQL.Add('Where Estacion='+IntToStr(T_TurcEstacion.asinteger));
          Q_Auxi.SQL.Add('  and Combustible='+IntToStr(i));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.asdatetime)+'"');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          xAjusteCant[i]:=Q_AuxiReal1.AsFloat;
          xAjusteImpo[i]:=Q_AuxiReal2.AsFloat;
          AjusteTotal:=AjusteTotal+Q_AuxiReal2.AsFloat;
        end;
        T_Tcmb.Next;
      end;
    end;



    // Resto
    pdocu:=xdocu;
    pnum:=xnum;

    if VarGasPolizaLiqDia='No' then
      StaticText1.Caption:=T_TurcDescripTurno.asstring
    else
      StaticText1.Caption:='Fecha: '+FechaPaq(T_TurcFecha.AsDateTime);

    QL_Dliqc.Close;
    QL_Dliqc.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_Dliqc.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_Dliqc.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else
      QL_Dliqc.SQL.Delete(3);
    QL_Dliqc.Prepare;
    QL_Dliqc.open;
    if QL_Dliqc.IsEmpty then
      raise Exception.Create('No Hay Movimientos en el Turno');

    QL_Dliqa.Close;
    QL_Dliqa.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_Dliqa.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_Dliqa.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else
      QL_Dliqa.SQL.Delete(3);
    QL_Dliqa.Prepare;
    QL_Dliqa.open;

    QL_Dliqp.Close;
    QL_Dliqp.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_Dliqp.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_Dliqp.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else
      QL_Dliqp.SQL.Delete(3);
    QL_Dliqp.Prepare;
    QL_DLiqp.open;

    QL_Rcup.Close;
    QL_Rcup.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_Rcup.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_Rcup.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else
      QL_Rcup.SQL.Delete(7);
    QL_Rcup.Prepare;
    QL_Rcup.open;

    QL_PVal.Close;
    QL_PVal.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_Pval.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_Pval.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else
      QL_Pval.SQL.Delete(3);
    QL_Pval.Prepare;
    QL_Pval.open;

    QL_Tran.Close;
    QL_Tran.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_Tran.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_Tran.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else
      QL_Tran.SQL.Delete(3);
    QL_Tran.Prepare;
    QL_Tran.open;
    if not LocalizaTabla(T_Cpol,'Documento;Numero',VarArrayOf([xdocu,xnum])) then
      raise Exception.Create('No existe configuración de póliza: '+xdocu+'-'+inttoclavenum(xnum,2));
  end;
end;

procedure TFLIQTURCcpol.QL_DliqcCalcFields(DataSet: TDataSet);
var i:integer;
    xtasa,costo:real;
begin
  with DMCUP,DMGAS do begin
    i:=QL_DliqcCombustible.AsInteger;
    if QL_DliqcTurno.AsInteger=xTurnoAux then
      QL_DliqcCantidad.AsFloat:=QL_DliqcCantidadPrev.AsFloat-xAjusteCant[i]
    else
      QL_DliqcCantidad.AsFloat:=QL_DliqcCantidadPrev.AsFloat;
    if QL_DliqcTurno.AsInteger=xTurnoAux then
      QL_DliqcImporteComb.AsFloat:=AjustaFloat(QL_DliqcImportePrev.AsFloat-xAjusteImpo[i],2)
    else
      QL_DliqcImporteComb.AsFloat:=AjustaFloat(QL_DliqcImportePrev.AsFloat,2);
    QL_DliqcIEPSCOMB.AsFloat:=AjustaFloat(QL_DliqcCantidad.AsFloat*DameIEPS(QL_DliqcCOMBUSTIBLE.AsInteger,QL_DliqcFECHA.AsDateTime),2);
    QL_DliqcCostoComb.AsFloat:=AjustaFloat(xCostoCmb[i]*QL_DliqcCantidad.AsFloat,2);
    QL_DliqcFechaAlfa.AsString:=FechaAlf(QL_DLiqcFecha.asdatetime);
    xtasa:=xTasaIva[i];
    QL_DliqcSubtotCombAntIEPS.AsFloat:=AjustaFloat((QL_DliqcImporteComb.AsFloat-QL_DliqcIEPSCOMB.AsFloat)/(1+xtasa/100),2);
    QL_DliqcIvaComb.AsFloat:=AjustaFloat(QL_DliqcImporteComb.AsFloat-QL_DliqcSubtotCombAntIEPS.AsFloat-QL_DliqcIEPSCOMB.AsFloat,2);
    QL_DliqcSubtotalComb.AsFloat:=AjustaFloat(QL_DliqcSubtotCombAntIEPS.AsFloat+QL_DliqcIEPSCOMB.AsFloat,2);
    QL_DliqcIvaCombProd.AsFloat:=AjustaFloat(QL_DliqcIvaComb.AsFloat,2);
    QL_DliqcSubtotalProd.AsFloat:=0;
    QL_DliqcIvaProd.AsFloat:=0;
    QL_DliqcCostoProd.AsFloat:=0;
    QL_DliqcImporteProd.AsFloat:=0;
    QL_DliqcProducto.AsInteger:=0;
    QL_DliqcClavePago.AsInteger:=0;
    QL_DliqcImportePago.AsInteger:=0;
    QL_DliqcImporteCupon.AsInteger:=0;
    QL_DliqcImporteVale.AsInteger:=0;
    QL_DliqcNoClienteCupon.AsInteger:=0;
    QL_DliqcLineaAceites.AsInteger:=0;
    QL_DliqcNoClienteTarjeta.AsInteger:=0;
    QL_DliqcImporteTarjeta.AsInteger:=0;
    QL_DliqcTipoTarjeta.AsString:='';
    QL_DliqcImporteTarjetaCR.AsFloat:=0;
    QL_DliqcImporteTarjetaPP.AsFloat:=0;
    QL_DliqcImporteTarjetaME.AsFloat:=0;
    QL_DliqcCombustibleVale.AsInteger:=0;
    QL_DliqcProductoVale.AsInteger:=0;
    QL_DliqcCantidadVale.AsInteger:=0;
    QL_DliqcGrupoCliente.AsInteger:=0;
    QL_DliqcCombustibleCupon.AsInteger:=0;
    QL_DliqcCantidadCupon.AsFloat:=0;
    QL_DliqcIEPSCupon.AsFloat:=0;
    QL_DliqcSubtotCupAntIEPS.AsFloat:=0;
    QL_DliqcIvaCupon.AsFloat:=0;
    QL_DliqcSubtotalCupon.AsFloat:=0;
    QL_DliqcCuentaClienteAux.AsInteger:=0;
    QL_DliqcIEPSValeComb.AsFloat:=0;
    QL_DliqcSubtotValeAntIEPS.AsFloat:=0;
    QL_DliqcIvaValeComb.AsFloat:=0;
    QL_DliqcSubtotalValeComb.AsFloat:=0;
  end;
end;

procedure TFLIQTURCcpol.BitBtn1Click(Sender: TObject);
var num,i:integer;
    lista:TStrings;
    ss,val:string;
begin
  with DMGEN,DMCFG,DMCNT,DMGAS do begin
    if not LocalizaTabla(T_Cpold,'Documento;Numero;Clave',
                     VarArrayOf([Q_CpoldDocumento.Asstring,Q_CpoldNumero.AsInteger,Q_CpoldClave.Asinteger])) then
      raise Exception.Create('No existe Configuración');
    pcve:=T_CpoldClave.AsInteger;
    BitBtn1.Enabled:=false;
    lista:=TStringList.Create;
    try
      T_Calc.Active:=false;
      T_Calc.DatabaseName :=VsLocalDir;
      T_Calc.TableName := pdocu+IntToClaveNum(pnum,2);
      T_Calc.CreateTable;
      try
        T_Calc.Active:=true;
        // DLIQC
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Dliqc.RecordCount;
        StaticText3.Visible:=true;
        num:=0;
        while not QL_Dliqc.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Dliqc.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Dliqc.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // DLIQA
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Dliqa.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_Dliqa.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Dliqa.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Dliqa.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // DLIQP
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Dliqp.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_Dliqp.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Dliqp.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Dliqp.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // RCUP
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Rcup.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_Rcup.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Rcup.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Rcup.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // PVAL
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Pval.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_Pval.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Pval.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Pval.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // TRAN
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Tran.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_Tran.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Tran.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Tran.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;


        Application.CreateForm(TFGENPOLIautom,FGENPOLIautom);
        try
          SetTipoDocumento(idPoli);
          IniciaDocAccion(idDocu,'',AccNuevo);
          FGENPOLIautom.PreparaForma(pDocu,pNum,pcve,QL_DliqcFecha.asdatetime);
          FGENPOLIautom.showmodal;
          if FGENPOLIautom.polizaok then begin
            T_Turc.Edit;
            T_TurcContabilizado.AsString:='Si';
            T_TurcTipoPoliza.AsString:=T_PoliTipoPoliza.AsString;
            T_TurcNoPoliza.AsInteger:=T_PoliNoPoliza.AsInteger;
            T_Turc.Post;
            if VarGasPolizaLiqDia='Si' then begin
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
        finally
          SetTipoDocumento(idLiqg);
          FGENPOLIautom.Free;
        end;
      finally
        T_Calc.Close;
        T_Calc.DeleteTable;
      end;
    finally
      lista.Free;
      Close;
    end;
  end;
end;

procedure TFLIQTURCcpol.QL_DliqaCalcFields(DataSet: TDataSet);
var i,xprod:integer;
    lin,ss,lin2:string;
    xtasa,xcosto:real;
begin
  with DMCUP do begin
    QL_DliqaFechaAlfa.AsString:=FechaAlf(QL_DLiqaFecha.asdatetime);
    for i:=0 to listaprod.Count-1 do begin
      lin:=listaprod[i];
      ss:=ExtraeElemStr(lin,1);
      xprod:=StrToIntDef(ss,0);
      if xprod=QL_DliqaProducto.asinteger then begin
        ss:=ExtraeElemStr(lin,2);
        xtasa:=StrToFloat(ss);
        ss:=ExtraeElemStr(lin,3);
        xcosto:=0;
        if ExtraeElemStr(lin,4)='A' then xcosto:=StrToFloat(ss);
        QL_DliqaCostoProd.AsFloat:=AjustaFloat(xCosto*QL_DliqaCantidad.AsFloat,2);
        lin2:=ExtraeElemStr(lin,1)+'//'+ExtraeElemStr(lin,2)+'//'+ExtraeElemStr(lin,3)+'//A//';
        listaprod[i]:=lin2;
        QL_DliqaSubtotalProd.AsFloat:=AjustaFloat(QL_DliqaImporteProd.AsFloat/(1+xtasa/100),2);
        QL_DliqaIvaProd.AsFloat:=AjustaFloat(QL_DliqaImporteProd.AsFloat-QL_DliqaSubtotalProd.AsFloat,2);
        QL_DliqaIvaCombProd.AsFloat:=AjustaFloat(QL_DliqaImporteProd.AsFloat-QL_DliqaSubtotalProd.AsFloat,2);
        QL_DliqaSubtotalComb.AsFloat:=0;
        QL_DliqaIvaComb.AsFloat:=0;
        QL_DliqaCostoComb.AsFloat:=0;
        QL_DliqaImporteComb.AsFloat:=0;
        QL_DliqaCombustible.AsInteger:=0;
        QL_DliqaClavePago.AsInteger:=0;
        QL_DliqaImportePago.AsInteger:=0;
        QL_DliqaImporteCupon.AsInteger:=0;
        QL_DliqaNoClienteCupon.AsInteger:=0;
        QL_DliqaImporteVale.AsInteger:=0;
        QL_DliqaNoClienteTarjeta.AsInteger:=0;
        QL_DliqaImporteTarjeta.AsInteger:=0;
        QL_DliqaTipoTarjeta.AsString:='';
        QL_DliqaImporteTarjetaCR.AsFloat:=0;
        QL_DliqaImporteTarjetaPP.AsFloat:=0;
        QL_DliqaImporteTarjetaME.AsFloat:=0;
        QL_DliqaCombustibleVale.AsInteger:=0;
        QL_DliqaProductoVale.AsInteger:=0;
        QL_DliqaCantidadVale.AsInteger:=0;
        QL_DliqaGrupoCliente.AsInteger:=0;
        QL_DliqaSubtotCombAntIEPS.AsFloat:=0;
        QL_DliqaIEPSComb.AsFloat:=0;
        QL_DliqaCombustibleCupon.AsInteger:=0;
        QL_DliqaCantidadCupon.AsFloat:=0;
        QL_DliqaIEPSCupon.AsFloat:=0;
        QL_DliqaSubtotCupAntIEPS.AsFloat:=0;
        QL_DliqaIvaCupon.AsFloat:=0;
        QL_DliqaSubtotalCupon.AsFloat:=0;
        QL_DliqaCuentaClienteAux.AsInteger:=0;
        QL_DliqaIEPSValeComb.AsFloat:=0;
        QL_DliqaSubtotValeAntIEPS.AsFloat:=0;
        QL_DliqaIvaValeComb.AsFloat:=0;
        QL_DliqaSubtotalValeComb.AsFloat:=0;
      end;
    end;
  end;
end;

procedure TFLIQTURCcpol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ListaProd.Free;
end;

procedure TFLIQTURCcpol.QL_DliqpCalcFields(DataSet: TDataSet);
begin
  with DMCUP,DMGAS do begin
    QL_DliqpImportePago.AsFloat:=QL_DliqpImportePrev.AsFloat;
    if (QL_DliqpClavePago.AsInteger=TpagEfectivo)and(QL_DliqpTurno.AsInteger=xTurnoAux)and(xSwAux) then begin
      QL_DliqpImportePago.AsFloat:=AjustaFloat(QL_DliqpImportePago.AsFloat-AjusteTotal,2);
      xSwAux:=false;
    end
    else
      QL_DliqpImportePago.AsFloat:=AjustaFloat(QL_DliqpImportePago.AsFloat,2);
    QL_DliqpFechaAlfa.AsString:=FechaAlf(QL_DLiqpFecha.asdatetime);
    QL_DliqpSubtotalComb.AsFloat:=0;
    QL_DliqpIvaComb.AsFloat:=0;
    QL_DliqpCostoComb.AsFloat:=0;
    QL_DliqpImporteComb.AsFloat:=0;
    QL_DliqpCombustible.AsInteger:=0;
    QL_DliqpSubtotalProd.AsFloat:=0;
    QL_DliqpIvaProd.AsFloat:=0;
    QL_DliqpCostoProd.AsFloat:=0;
    QL_DliqpImporteProd.AsFloat:=0;
    QL_DliqpProducto.AsInteger:=0;
    QL_DliqpIvaCombProd.AsFloat:=0;
    QL_DliqpImporteCupon.AsFloat:=0;
    QL_DliqpNoClienteCupon.AsInteger:=0;
    QL_DliqpImporteVale.AsInteger:=0;
    QL_DliqpLineaAceites.AsInteger:=0;
    QL_DliqpNoClienteTarjeta.AsInteger:=0;
    QL_DliqpImporteTarjeta.AsInteger:=0;
    QL_DliqpTipoTarjeta.AsString:='';
    QL_DliqpImporteTarjetaCR.AsFloat:=0;
    QL_DliqpImporteTarjetaPP.AsFloat:=0;
    QL_DliqpImporteTarjetaME.AsFloat:=0;
    QL_DliqpCombustibleVale.AsInteger:=0;
    QL_DliqpProductoVale.AsInteger:=0;
    QL_DliqpCantidadVale.AsInteger:=0;
    QL_DliqpGrupoCliente.AsInteger:=0;
    QL_DliqpSubtotCombAntIEPS.AsFloat:=0;
    QL_DliqpIEPSComb.AsFloat:=0;
    QL_DliqpCombustibleCupon.AsInteger:=0;
    QL_DliqpCantidadCupon.AsFloat:=0;
    QL_DliqpIEPSCupon.AsFloat:=0;
    QL_DliqpSubtotCupAntIEPS.AsFloat:=0;
    QL_DliqpIvaCupon.AsFloat:=0;
    QL_DliqpSubtotalCupon.AsFloat:=0;
    QL_DliqpCuentaClienteAux.AsInteger:=0;
    QL_DliqpIEPSValeComb.AsFloat:=0;
    QL_DliqpSubtotValeAntIEPS.AsFloat:=0;
    QL_DliqpIvaValeComb.AsFloat:=0;
    QL_DliqpSubtotalValeComb.AsFloat:=0;
  end;
end;

procedure TFLIQTURCcpol.QL_RcupCalcFields(DataSet: TDataSet);
var prec,tasa:real;
begin
  with DMCUP do begin
    QL_RcupFechaAlfa.AsString:=FechaAlf(QL_RcupFecha.asdatetime);
    QL_RcupSubtotalComb.AsFloat:=0;
    QL_RcupIvaComb.AsFloat:=0;
    QL_RcupCostoComb.AsFloat:=0;
    QL_RcupImporteComb.AsFloat:=0;
    QL_RcupCombustible.AsInteger:=0;
    QL_RcupSubtotalProd.AsFloat:=0;
    QL_RcupIvaProd.AsFloat:=0;
    QL_RcupCostoProd.AsFloat:=0;
    QL_RcupImporteProd.AsFloat:=0;
    QL_RcupProducto.AsInteger:=0;
    QL_RcupIvaCombProd.AsFloat:=0;
    QL_RcupImportePago.AsFloat:=0;
    QL_RcupClavePago.AsInteger:=TpagCupon;
    QL_RcupImporteVale.AsInteger:=0;
    QL_RcupLineaAceites.AsInteger:=0;
    QL_RcupNoClienteTarjeta.AsInteger:=0;
    QL_RcupImporteTarjeta.AsInteger:=0;
    QL_RcupTipoTarjeta.AsString:='';
    QL_RcupImporteTarjetaCR.AsFloat:=0;
    QL_RcupImporteTarjetaPP.AsFloat:=0;
    QL_RcupImporteTarjetaME.AsFloat:=0;
    QL_RcupCombustibleVale.AsInteger:=0;
    QL_RcupProductoVale.AsInteger:=0;
    QL_RcupCantidadVale.AsInteger:=0;
    QL_RcupSubtotCombAntIEPS.AsFloat:=0;
    QL_RcupIEPSComb.AsFloat:=0;
    DMCUP.DamePrecioFecha(QL_RcupCOMBUSTIBLECUPON.AsInteger,QL_RcupFECHA.AsDateTime,prec,tasa);
    QL_RcupCantidadCupon.AsFloat:=AjustaFloat(DivideFloat(QL_RcupIMPORTECUPON.AsFloat,prec),3);
    QL_RcupIEPSCupon.AsFloat:=AjustaFloat(QL_RcupCantidadCupon.AsFloat*DameIEPS(QL_RcupCOMBUSTIBLECUPON.AsInteger,QL_RcupFECHA.AsDateTime),2);
    QL_RcupSubtotCupAntIEPS.AsFloat:=AjustaFloat((QL_RcupIMPORTECUPON.AsFloat-QL_RcupIEPSCupon.AsFloat)/(1+tasa/100),2);
    QL_RcupIvaCupon.AsFloat:=AjustaFloat(QL_RcupIMPORTECUPON.AsFloat-QL_RcupSubtotCupAntIEPS.AsFloat-QL_RcupIEPSCupon.AsFloat,2);
    QL_RcupSubtotalCupon.AsFloat:=AjustaFloat(QL_RcupSubtotCupAntIEPS.AsFloat+QL_RcupIEPSCupon.AsFloat,2);
    QL_RcupCuentaClienteAux.AsString:=DameCuentaAuxiCliente(QL_RcupNOCLIENTECUPON.AsInteger);
    QL_RcupDespachador.AsInteger:=0;
    QL_RcupIEPSValeComb.AsFloat:=0;
    QL_RcupSubtotValeAntIEPS.AsFloat:=0;
    QL_RcupIvaValeComb.AsFloat:=0;
    QL_RcupSubtotalValeComb.AsFloat:=0;
  end;
end;

procedure TFLIQTURCcpol.QL_PvalCalcFields(DataSet: TDataSet);
var prec,tasa:real;
begin
  with DMCUP do begin
    QL_PvalFechaAlfa.AsString:=FechaAlf(QL_PvalFecha.asdatetime);
    QL_PvalSubtotalComb.AsFloat:=0;
    QL_PvalIvaComb.AsFloat:=0;
    QL_PvalCostoComb.AsFloat:=0;
    QL_PvalImporteComb.AsFloat:=0;
    QL_PvalCombustible.AsInteger:=0;
    QL_PvalSubtotalProd.AsFloat:=0;
    QL_PvalIvaProd.AsFloat:=0;
    QL_PvalCostoProd.AsFloat:=0;
    QL_PvalImporteProd.AsFloat:=0;
    QL_PvalProducto.AsInteger:=0;
    QL_PvalIvaCombProd.AsFloat:=0;
    QL_PvalImportePago.AsFloat:=0;
    QL_PvalCantidad.AsFloat:=0;
    QL_PvalNoClienteCupon.AsInteger:=0;
    QL_PvalImporteCupon.AsFloat:=0;
    QL_PvalClavePago.AsInteger:=TpagCupon;
    QL_PvalLineaAceites.AsInteger:=0;
    QL_PvalNoClienteTarjeta.AsInteger:=0;
    QL_PvalImporteTarjeta.AsInteger:=0;
    QL_PvalTipoTarjeta.AsString:='';
    QL_PvalImporteTarjetaCR.AsFloat:=0;
    QL_PvalImporteTarjetaPP.AsFloat:=0;
    QL_PvalImporteTarjetaME.AsFloat:=0;
    QL_PvalSubtotCombAntIEPS.AsFloat:=0;
    QL_PvalIEPSComb.AsFloat:=0;
    QL_PvalCombustibleCupon.AsInteger:=0;
    QL_PvalCantidadCupon.AsFloat:=0;
    QL_PvalIEPSCupon.AsFloat:=0;
    QL_PvalSubtotCupAntIEPS.AsFloat:=0;
    QL_PvalIvaCupon.AsFloat:=0;
    QL_PvalSubtotalCupon.AsFloat:=0;
    QL_PvalCuentaClienteAux.AsString:=DameCuentaAuxiCliente(QL_PvalNOCLIENTEVALE.AsInteger);
    QL_PvalDespachador.AsInteger:=0;
    if QL_PvalPRODUCTOVALE.AsInteger>0 then begin
      QL_PvalIEPSValeComb.AsFloat:=0;
      QL_PvalSubtotValeAntIEPS.AsFloat:=0;
      QL_PvalIvaValeComb.AsFloat:=0;
      QL_PvalSubtotalValeComb.AsFloat:=0;
    end
    else begin
      QL_PvalIEPSValeComb.AsFloat:=0;
      DMCUP.DamePrecioFecha(QL_PvalCOMBUSTIBLEVALE.AsInteger,QL_PvalFECHA.AsDateTime,prec,tasa);
      QL_PvalIEPSValeComb.AsFloat:=AjustaFloat(QL_PvalCANTIDADVALE.AsFloat*DameIEPS(QL_PvalCOMBUSTIBLEVALE.AsInteger,QL_PvalFECHA.AsDateTime),2);
      QL_PvalSubtotValeAntIEPS.AsFloat:=AjustaFloat((QL_PvalIMPORTEVALE.AsFloat-QL_PvalIEPSValeComb.AsFloat)/(1+tasa/100),2);
      QL_PvalIvaValeComb.AsFloat:=AjustaFloat(QL_PvalIMPORTEVALE.AsFloat-QL_PvalSubtotValeAntIEPS.AsFloat-QL_PvalIEPSValeComb.AsFloat,2);
      QL_PvalSubtotalValeComb.AsFloat:=AjustaFloat(QL_PvalSubtotValeAntIEPS.AsFloat+QL_PvalIEPSValeComb.AsFloat,2);
    end;
  end;
end;

procedure TFLIQTURCcpol.QL_TranCalcFields(DataSet: TDataSet);
begin
  with DMCUP do begin
    QL_TranFechaAlfa.AsString:=FechaAlf(QL_TranFecha.asdatetime);
    QL_TranSubtotalComb.AsFloat:=0;
    QL_TranIvaComb.AsFloat:=0;
    QL_TranCostoComb.AsFloat:=0;
    QL_TranImporteComb.AsFloat:=0;
    QL_TranSubtotalProd.AsFloat:=0;
    QL_TranIvaProd.AsFloat:=0;
    QL_TranCostoProd.AsFloat:=0;
    QL_TranImporteProd.AsFloat:=0;
    QL_TranProducto.AsInteger:=0;
    QL_TranIvaCombProd.AsFloat:=0;
    QL_TranImportePago.AsFloat:=0;
    QL_TranCantidad.AsFloat:=0;
    QL_TranNoClienteCupon.AsInteger:=0;
    QL_TranImporteCupon.AsFloat:=0;
    QL_TranClavePago.AsInteger:=TpagCupon;
    QL_TranLineaAceites.AsInteger:=0;
    QL_TranNoClienteVale.AsInteger:=0;
    QL_TranImporteVale.AsFloat:=0;
    QL_TranImporteTarjetaCR.AsFloat:=0;
    QL_TranImporteTarjetaPP.AsFloat:=0;
    QL_TranImporteTarjetaME.AsFloat:=0;
    QL_TranCombustibleVale.AsInteger:=0;
    QL_TranProductoVale.AsInteger:=0;
    QL_TranCantidadVale.AsInteger:=0;
    QL_TranSubtotCombAntIEPS.AsFloat:=0;
    QL_TranIEPSComb.AsFloat:=0;
    if QL_TranTipoTarjeta.AsString='CR' then QL_TranImporteTarjetaCR.AsFloat:=QL_TranImporteTarjeta.AsFloat
    else if QL_TranTipoTarjeta.AsString='PP' then QL_TranImporteTarjetaPP.AsFloat:=QL_TranImporteTarjeta.AsFloat
    else if QL_TranTipoTarjeta.AsString='ME' then QL_TranImporteTarjetaME.AsFloat:=QL_TranImporteTarjeta.AsFloat;
    QL_TranCombustibleCupon.AsInteger:=0;
    QL_TranCantidadCupon.AsFloat:=0;
    QL_TranIEPSCupon.AsFloat:=0;
    QL_TranSubtotCupAntIEPS.AsFloat:=0;
    QL_TranIvaCupon.AsFloat:=0;
    QL_TranSubtotalCupon.AsFloat:=0;
    QL_TranCuentaClienteAux.AsString:=DameCuentaAuxiCliente(QL_TranNOCLIENTETARJETA.AsInteger);
    QL_TranIEPSValeComb.AsFloat:=0;
    QL_TranSubtotValeAntIEPS.AsFloat:=0;
    QL_TranIvaValeComb.AsFloat:=0;
    QL_TranSubtotalValeComb.AsFloat:=0;
  end;
end;

function TFLIQTURCcpol.DameCuentaAuxiCliente(xcliente: Integer): string;
begin
  with DMGEN_VTAS do begin
    try
       Q_Auxi.Close;
       Q_Auxi.SQL.Clear;
       Q_AuxiStr50.FieldKind:=fkInternalCalc;
       Q_Auxi.SQL.Add('Select CuentaCntAux as Str50 from DGENCLIE');
       Q_Auxi.SQL.Add('Where noclie='+IntToStr(xcliente));
       Q_Auxi.Prepare;
       Q_Auxi.Open;
       if Q_Auxi.RecordCount>0 then
         Result:=Q_AuxiStr50.AsString
       else
         Result:='';
    finally
      Q_Auxi.Close;
    end;   
  end;
end;

end.
