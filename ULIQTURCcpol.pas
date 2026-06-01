unit ULIQTURCcpol;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Buttons, ComCtrls, DBCtrls, RxMemDS;

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
    QL_DliqcCuentaCntTarjeta: TStringField;
    QL_DliqaCuentaCntTarjeta: TStringField;
    QL_DliqpCuentaCntTarjeta: TStringField;
    QL_RcupCuentaCntTarjeta: TStringField;
    QL_PvalCuentaCntTarjeta: TStringField;
    QL_TranCOMBUSTIBLE: TIntegerField;
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
    QL_RcupCuentaCntVales: TStringField;
    QL_TranCuentaCntVales: TStringField;
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
    QL_PvalIEPSVale: TFloatField;
    QL_PvalSubtotValeAntIEPS: TFloatField;
    QL_PvalIvaVale: TFloatField;
    QL_PvalSubtotalVale: TFloatField;
    QL_RcupIEPSVale: TFloatField;
    QL_RcupSubtotValeAntIEPS: TFloatField;
    QL_RcupIvaVale: TFloatField;
    QL_RcupSubtotalVale: TFloatField;
    QL_TranIEPSVale: TFloatField;
    QL_TranSubtotValeAntIEPS: TFloatField;
    QL_TranIvaVale: TFloatField;
    QL_TranSubtotalVale: TFloatField;
    QL_DliqpIEPSVale: TFloatField;
    QL_DliqpSubtotValeAntIEPS: TFloatField;
    QL_DliqpIvaVale: TFloatField;
    QL_DliqpSubtotalVale: TFloatField;
    QL_DliqaIEPSVale: TFloatField;
    QL_DliqaSubtotValeAntIEPS: TFloatField;
    QL_DliqaIvaVale: TFloatField;
    QL_DliqaSubtotalVale: TFloatField;
    QL_DliqcIEPSVale: TFloatField;
    QL_DliqcSubtotValeAntIEPS: TFloatField;
    QL_DliqcIvaVale: TFloatField;
    QL_DliqcSubtotalVale: TFloatField;
    QL_PvalTIPO: TStringField;
    QL_RcupSERIECUPON: TIntegerField;
    QL_PvalSerieCupon: TStringField;
    QL_TranSerieCupon: TStringField;
    QL_DliqpSerieCupon: TStringField;
    QL_DliqaSerieCupon: TStringField;
    QL_DliqcSerieCupon: TStringField;
    QL_PvalIEPSTarj: TFloatField;
    QL_PvalSubtotTarjAntIEPS: TFloatField;
    QL_PvalIvaTarj: TFloatField;
    QL_PvalSubtotalTarj: TFloatField;
    QL_TranIMPORTECMB: TFloatField;
    QL_RcupImporteCmb: TFloatField;
    QL_PvalImporteCmb: TFloatField;
    QL_RcupIEPSTarj: TFloatField;
    QL_RcupSubtotTarjAntIEPS: TFloatField;
    QL_RcupIvaTarj: TFloatField;
    QL_RcupSubtotalTarj: TFloatField;
    QL_TranIEPSTarj: TFloatField;
    QL_TranSubtotTarjAntIEPS: TFloatField;
    QL_TranIvaTarj: TFloatField;
    QL_TranSubtotalTarj: TFloatField;
    QL_DliqpIEPSTarj: TFloatField;
    QL_DliqpSubtotTarjAntIEPS: TFloatField;
    QL_DliqpIvaTarj: TFloatField;
    QL_DliqpSubtotalTarj: TFloatField;
    QL_DliqpImporteCmb: TFloatField;
    QL_DliqcImporteCmb: TFloatField;
    QL_DliqcIEPSTarj: TFloatField;
    QL_DliqcSubtotTarjAntIEPS: TFloatField;
    QL_DliqcIvaTarj: TFloatField;
    QL_DliqcSubtotalTarj: TFloatField;
    QL_DliqaImporteCmb: TFloatField;
    QL_DliqaIEPSTarj: TFloatField;
    QL_DliqaSubtotTarjAntIEPS: TFloatField;
    QL_DliqaIvaTarj: TFloatField;
    QL_DliqaSubtotalTarj: TFloatField;
    QL_Cupo: TQuery;
    QL_CupoSERIECFERIA: TIntegerField;
    QL_CupoFOLIOCFERIA: TIntegerField;
    QL_CupoFECHARECUPCFERIA: TDateTimeField;
    QL_CupoIMPORTECFERIA: TFloatField;
    QL_CupoTURNO: TIntegerField;
    QL_CupoCuentaCntTarjeta: TStringField;
    QL_CupoImporteVale: TFloatField;
    QL_CupoCuentaDespachador: TStringField;
    QL_CupoFECHA: TDateTimeField;
    QL_CupoESTACION: TIntegerField;
    QL_CupoImporteCupon: TFloatField;
    QL_CupoCombustible: TIntegerField;
    QL_CupoProducto: TIntegerField;
    QL_CupoImporteComb: TFloatField;
    QL_CupoImporteProd: TFloatField;
    QL_CupoSubtotalComb: TFloatField;
    QL_CupoSubtotalProd: TFloatField;
    QL_CupoIvaComb: TFloatField;
    QL_CupoIvaProd: TFloatField;
    QL_CupoFechaAlfa: TDateTimeField;
    QL_CupoCantidad: TFloatField;
    QL_CupoImportePago: TFloatField;
    QL_CupoCostoComb: TFloatField;
    QL_CupoCostoProd: TFloatField;
    QL_CupoIvaCombProd: TFloatField;
    QL_CupoNOCLIENTECUPON: TIntegerField;
    QL_CupoNoClienteTarjeta: TIntegerField;
    QL_CupoClavePago: TIntegerField;
    QL_CupoNoCLienteVale: TIntegerField;
    QL_CupoImporteTarjeta: TFloatField;
    QL_CupoTipoTarjeta: TStringField;
    QL_CupoImporteTarjetaCR: TFloatField;
    QL_CupoImporteTarjetaPP: TFloatField;
    QL_CupoImporteTarjetaME: TFloatField;
    QL_CupoCombustibleVale: TIntegerField;
    QL_CupoProductoVale: TIntegerField;
    QL_CupoCantidadVale: TFloatField;
    QL_CupoLineaAceites: TIntegerField;
    QL_CupoGrupoCliente: TIntegerField;
    QL_CupoCuentaCntVales: TStringField;
    QL_CupoSubtotCombAntIEPS: TFloatField;
    QL_CupoIEPSComb: TFloatField;
    QL_CupoCombustibleCupon: TIntegerField;
    QL_CupoCantidadCupon: TFloatField;
    QL_CupoIEPSCupon: TFloatField;
    QL_CupoSubtotCupAntIEPS: TFloatField;
    QL_CupoIvaCupon: TFloatField;
    QL_CupoSubtotalCupon: TFloatField;
    QL_CupoCuentaClienteAux: TStringField;
    QL_CupoIEPSVale: TFloatField;
    QL_CupoSubTotValeAntIEPS: TFloatField;
    QL_CupoIvaVale: TFloatField;
    QL_CupoSubtotalVale: TFloatField;
    QL_CupoSerieCupon: TStringField;
    QL_CupoImporteCmb: TFloatField;
    QL_CupoIEPSTaj: TFloatField;
    QL_CupoSubTotTarjAntIEPS: TFloatField;
    QL_CupoIvaTarj: TFloatField;
    QL_CupoSubTotalTarj: TFloatField;
    QL_RcupFolioCFeria: TIntegerField;
    QL_RcupSerieCFeria: TStringField;
    QL_RcupFechaRecupCFeria: TDateTimeField;
    QL_RcupImporteCFeria: TFloatField;
    QL_TranSerieCFeria: TStringField;
    QL_TranFolioCFeria: TIntegerField;
    QL_TranFechaRecupCFeria: TDateTimeField;
    QL_TranImporteCFeria: TFloatField;
    QL_DliqpSerieCFeria: TStringField;
    QL_DliqpFolioCFeria: TIntegerField;
    QL_DliqpFechaRecupCFeria: TDateTimeField;
    QL_DliqpImporteCFeria: TFloatField;
    QL_DliqaSerieCFeria: TStringField;
    QL_DliqaFolioCFeria: TIntegerField;
    QL_DliqaFechaRecupCFeria: TDateTimeField;
    QL_DliqaImporteCFeria: TFloatField;
    QL_DliqcSerieCFeria: TStringField;
    QL_DliqcFolioCFeria: TIntegerField;
    QL_DliqcFechaRecupCFeria: TDateTimeField;
    QL_DliqcImporteCFeria: TFloatField;
    QL_PvalSerieCFeria: TStringField;
    QL_PvalFolioCFeria: TIntegerField;
    QL_PvalFechaRecupCFeria: TDateTimeField;
    QL_PvalImporteCFeria: TFloatField;
    QL_DliqpIEPSTpag: TFloatField;
    TM_Tpag: TRxMemoryData;
    TM_TpagClave: TIntegerField;
    TM_TpagDescripcion: TStringField;
    TM_TpagImporte: TFloatField;
    TM_TpagPorcentaje: TFloatField;
    TM_TpagIvaTpag: TFloatField;
    TM_TpagIEPSTpag: TFloatField;
    TM_TpagCuentaCntTarjeta: TStringField;
    TM_TpagNoClienteTarjeta: TIntegerField;
    TM_TpagImporteVale: TFloatField;
    TM_TpagFecha: TDateTimeField;
    TM_TpagTurno: TIntegerField;
    TM_TpagClavePago: TIntegerField;
    TM_TpagCombustible: TIntegerField;
    TM_TpagProducto: TIntegerField;
    TM_TpagImporteComb: TFloatField;
    TM_TpagImporteProd: TFloatField;
    TM_TpagSubtotalComb: TFloatField;
    TM_TpagSubtotalProd: TFloatField;
    TM_TpagIvaComb: TFloatField;
    TM_TpagIvaProd: TFloatField;
    TM_TpagFechaAlfa: TStringField;
    TM_TpagCantidad: TFloatField;
    TM_TpagCostoComb: TFloatField;
    TM_TpagCostoProd: TFloatField;
    TM_TpagImporteCupon: TFloatField;
    TM_TpagCuentaCntCupones: TStringField;
    TM_TpagNoClienteCupon: TIntegerField;
    TM_TpagIvaCombProd: TFloatField;
    TM_TpagImportePrev: TFloatField;
    TM_TpagImportePago: TFloatField;
    TM_TpagFolio: TIntegerField;
    TM_TpagDespachador: TIntegerField;
    TM_TpagNoClienteVale: TIntegerField;
    TM_TpagCuentaCntVales: TStringField;
    TM_TpagCuentaDespachador: TStringField;
    TM_TpagImporteTarjeta: TFloatField;
    TM_TpagTipoTarjeta: TStringField;
    TM_TpagImporteTarjetaCR: TFloatField;
    TM_TpagImporteTarjetaPP: TFloatField;
    TM_TpagCombustibleVale: TIntegerField;
    TM_TpagProductoVale: TIntegerField;
    TM_TpagCantidadVale: TFloatField;
    TM_TpagGrupoCliente: TIntegerField;
    TM_TpagImporteTarjetaME: TFloatField;
    TM_TpagLineaAceites: TIntegerField;
    TM_TpagSubtotCombAntIEPS: TFloatField;
    TM_TpagIEPSComb: TFloatField;
    TM_TpagCombustibleCupon: TIntegerField;
    TM_TpagCantidadCupon: TFloatField;
    TM_TpagIEPSCupon: TFloatField;
    TM_TpagSubTotCupAntIEPS: TFloatField;
    TM_TpagIvaCupon: TFloatField;
    TM_TpagSubtotalCupon: TFloatField;
    TM_TpagCuentaClienteAux: TStringField;
    TM_TpagIEPSVale: TFloatField;
    TM_TpagSubTotValeAntIEPS: TFloatField;
    TM_TpagIvaVale: TFloatField;
    TM_TpagSerieCupon: TStringField;
    TM_TpagImporteCmb: TFloatField;
    TM_TpagIEPSTarj: TFloatField;
    TM_TpagSubtotTarjAntIEPS: TFloatField;
    TM_TpagIvaTarj: TFloatField;
    TM_TpagSubtotalTarj: TFloatField;
    TM_TpagSerieCFeria: TStringField;
    TM_TpagFolioCFeria: TIntegerField;
    TM_TpagFechaRecupCFeria: TDateTimeField;
    TM_TpagImporteCFeria: TFloatField;
    TM_TpagSubTotalTpag: TFloatField;
    QL_DliqpSubtotalTpag: TFloatField;
    QL_DliqpClave: TIntegerField;
    QL_DliqpDescripcion: TStringField;
    QL_DliqpImporte: TFloatField;
    QL_DliqpPorcentaje: TFloatField;
    QL_DliqpIvaTpag: TFloatField;
    QL_DliqaSubtotalTpag: TFloatField;
    QL_DliqaClave: TIntegerField;
    QL_DliqaDescripcion: TStringField;
    QL_DliqaImporte: TFloatField;
    QL_DliqaPorcentaje: TFloatField;
    QL_DliqaIvaTpag: TFloatField;
    QL_DliqaIEPSTpag: TFloatField;
    QL_DliqcSubtotalTpag: TFloatField;
    QL_DliqcClave: TIntegerField;
    QL_DliqcDescripcion: TStringField;
    QL_DliqcImporte: TFloatField;
    QL_DliqcPorcentaje: TFloatField;
    QL_DliqcIvaTpag: TFloatField;
    QL_DliqcIEPSTpag: TFloatField;
    QL_TranSubtotalTpag: TFloatField;
    QL_TranClave: TIntegerField;
    QL_TranDescripcion: TStringField;
    QL_TranImporte: TFloatField;
    QL_TranPorcentaje: TFloatField;
    QL_TranIvaTpag: TFloatField;
    QL_TranIEPSTpag: TFloatField;
    QL_RcupSubtotalTpag: TFloatField;
    QL_RcupClave: TIntegerField;
    QL_RcupDescripcion: TStringField;
    QL_RcupImporte: TFloatField;
    QL_RcupPorcentaje: TFloatField;
    QL_RcupIvaTpag: TFloatField;
    QL_RcupIEPSTpag: TFloatField;
    QL_CupoSubtotalTpag: TFloatField;
    QL_CupoClave: TIntegerField;
    QL_CupoDescripcion: TStringField;
    QL_CupoImporte: TFloatField;
    QL_CupoPorcentaje: TFloatField;
    QL_CupoIvaTpag: TFloatField;
    QL_CupoIEPSTpag: TFloatField;
    QL_PvalSubtotalTpag: TFloatField;
    QL_PvalClave: TIntegerField;
    QL_PvalDescripcion: TStringField;
    QL_PvalImporte: TFloatField;
    QL_PvalPorcentaje: TFloatField;
    QL_PvalIvaTpag: TFloatField;
    QL_PvalIEPSTpag: TFloatField;
    TM_TpagSubtotalVale: TFloatField;
    TM_TpagEstacion: TIntegerField;
    QL_FDep: TQuery;
    QL_FDepCuentaCntTarjeta: TStringField;
    QL_FDepNoClienteTarjeta: TIntegerField;
    QL_FDepImporteVale: TFloatField;
    QL_FDepFECHA: TDateTimeField;
    QL_FDepTURNO: TIntegerField;
    QL_FDepClavePago: TStringField;
    QL_FDepCombustible: TIntegerField;
    QL_FDepProducto: TIntegerField;
    QL_FDepImporteComb: TFloatField;
    QL_FDepImporteProd: TFloatField;
    QL_FDepSubtotalComb: TFloatField;
    QL_FDepSubtotalProd: TFloatField;
    QL_FDepIvaComb: TFloatField;
    QL_FDepIvaProd: TFloatField;
    QL_FDepFechaAlfa: TStringField;
    QL_FDepCantidad: TFloatField;
    QL_FDepCostoComb: TFloatField;
    QL_FDepCostoProd: TFloatField;
    QL_FDepImporteCupon: TFloatField;
    QL_FDepCuentaCntCupones: TStringField;
    QL_FDepNoClienteCupon: TIntegerField;
    QL_FDepIvaCombProd: TFloatField;
    QL_FDepImportePrev: TFloatField;
    QL_FDepImportePago: TFloatField;
    QL_FDepFolio: TIntegerField;
    QL_FDepDespachador: TIntegerField;
    QL_FDepNoClienteVale: TIntegerField;
    QL_FDepCuentaCntVales: TStringField;
    QL_FDepCuentaDespachador: TStringField;
    QL_FDepImporteTarjeta: TIntegerField;
    QL_FDepTipoTarjeta: TStringField;
    QL_FDepImporteTarjetaCR: TFloatField;
    QL_FDepImporteTarjetaPP: TFloatField;
    QL_FDepCombustibleVale: TIntegerField;
    QL_FDepProductoVale: TIntegerField;
    QL_FDepCantidadVale: TFloatField;
    QL_FDepGrupoCliente: TIntegerField;
    QL_FDepImporteTarjetaME: TFloatField;
    QL_FDepLineaAceites: TIntegerField;
    QL_FDepSubtotCombAntIEPS: TFloatField;
    QL_FDepIEPSComb: TFloatField;
    QL_FDepCombustibleCupon: TIntegerField;
    QL_FDepCantidadCupon: TFloatField;
    QL_FDepIEPSCupon: TFloatField;
    QL_FDepSubtotCupAntIEPS: TFloatField;
    QL_FDepIvaCupon: TFloatField;
    QL_FDepSubtotalCupon: TFloatField;
    QL_FDepCuentaClienteAux: TIntegerField;
    QL_FDepIEPSVale: TFloatField;
    QL_FDepSubtotValeAntIEPS: TFloatField;
    QL_FDepIvaVale: TFloatField;
    QL_FDepSubtotalVale: TFloatField;
    QL_FDepSerieCupon: TStringField;
    QL_FDepImporteCmb: TFloatField;
    QL_FDepIEPSTarj: TFloatField;
    QL_FDepSubtotTarjAntIEPS: TFloatField;
    QL_FDepIvaTarj: TFloatField;
    QL_FDepSubtotalTarj: TFloatField;
    QL_FDepSerieCFeria: TStringField;
    QL_FDepFolioCFeria: TIntegerField;
    QL_FDepFechaRecupCFeria: TDateTimeField;
    QL_FDepImporteCFeria: TFloatField;
    QL_FDepSubtotalTpag: TFloatField;
    QL_FDepClave: TIntegerField;
    QL_FDepDescripcion: TStringField;
    QL_FDepImporte: TFloatField;
    QL_FDepPorcentaje: TFloatField;
    QL_FDepIvaTpag: TFloatField;
    QL_FDepIEPSTpag: TFloatField;
    QL_FDepESTACION: TIntegerField;
    QL_FDepNOFICHA: TIntegerField;
    QL_FDepFOLIO_FICHA: TIntegerField;
    QL_FDepTOTAL_FICHA: TFloatField;
    QL_DliqcNoFicha: TIntegerField;
    QL_DliqcFolio_Ficha: TIntegerField;
    QL_DliqcTotal_Ficha: TFloatField;
    QL_DliqaNoFicha: TIntegerField;
    QL_DliqaFolio_Ficha: TIntegerField;
    QL_DliqaTotal_Ficha: TFloatField;
    QL_DliqpNoFicha: TIntegerField;
    QL_DliqpFolio_Ficha: TIntegerField;
    QL_DliqpTotal_Ficha: TFloatField;
    QL_TranNoFicha: TIntegerField;
    QL_TranFolio_Ficha: TIntegerField;
    QL_TranTotal_Ficha: TFloatField;
    QL_RcupNoFicha: TIntegerField;
    QL_RcupFolio_Ficha: TIntegerField;
    QL_RcupTotal_Ficha: TFloatField;
    QL_CupoNoFicha: TIntegerField;
    QL_CupoFolio_Ficha: TIntegerField;
    QL_CupoTotal_Ficha: TFloatField;
    QL_PvalNoFicha: TIntegerField;
    QL_PvalFolio_Ficha: TIntegerField;
    QL_PvalTotal_Ficha: TFloatField;
    TM_TpagTotal_Ficha: TFloatField;
    TM_TpagFolio_Ficha: TIntegerField;
    TM_TpagNoFicha: TIntegerField;
    QL_RcupCuentaCntCupones: TStringField;
    QL_Abon: TQuery;
    QL_AbonCUENTACNT: TStringField;
    QL_AbonNOCLIE: TIntegerField;
    QL_AbonIvaAbonoMn: TFloatField;
    QL_AbonTotalAbonoMn: TFloatField;
    QL_AbonSubTotalMn: TFloatField;
    QL_AbonIMPORTEMN: TFloatField;
    QL_AbonSUCLCAR: TIntegerField;
    QL_AbonSERIECARGO: TStringField;
    QL_AbonFOLIOCARGO: TIntegerField;
    QL_AbonINDICECARGO: TIntegerField;
    QL_AbonEstacion: TIntegerField;
    QL_AbonCombustible: TIntegerField;
    QL_AbonProducto: TIntegerField;
    QL_AbonFechaAlfa: TStringField;
    QL_AbonFecha: TStringField;
    QL_AbonCantidad: TIntegerField;
    QL_AbonTurno: TIntegerField;
    QL_AbonImporteComb: TFloatField;
    QL_AbonSubtotalComb: TFloatField;
    QL_AbonIvaComb: TFloatField;
    QL_AbonImporteProd: TFloatField;
    QL_AbonSubtotalProd: TFloatField;
    QL_AbonIvaProd: TFloatField;
    QL_AbonCostoComb: TFloatField;
    QL_AbonCostoProd: TFloatField;
    QL_AbonIvaCombProd: TFloatField;
    QL_AbonClavePago: TIntegerField;
    QL_AbonImportePago: TFloatField;
    QL_AbonNoClienteCupon: TIntegerField;
    QL_AbonImporteCupon: TFloatField;
    QL_AbonCuentaCntCupones: TIntegerField;
    QL_AbonCuentaDespachador: TIntegerField;
    QL_AbonNoClienteVale: TIntegerField;
    QL_AbonCuentaCntVales: TIntegerField;
    QL_AbonImporteVale: TFloatField;
    QL_AbonCombustibleVale: TFloatField;
    QL_AbonProductoVale: TIntegerField;
    QL_AbonGrupoCliente: TIntegerField;
    QL_AbonLineaAceites: TIntegerField;
    QL_AbonNoClienteTarjeta: TIntegerField;
    QL_AbonImporteTarjeta: TFloatField;
    QL_AbonCuentaCntTarjeta: TIntegerField;
    QL_AbonTipoTarjeta: TStringField;
    QL_AbonImporteTarjetaCR: TFloatField;
    QL_AbonImporteTarjetaPP: TFloatField;
    QL_AbonImporteTarjetaME: TFloatField;
    QL_AbonSubtotCombAntIEPS: TFloatField;
    QL_AbonIEPSComb: TFloatField;
    QL_AbonCombustibleCupon: TIntegerField;
    QL_AbonCantidadCupon: TFloatField;
    QL_AbonIEPSCupon: TFloatField;
    QL_AbonSubtotCupAntIEPS: TFloatField;
    QL_AbonIvaCupon: TFloatField;
    QL_AbonSubtotalCupon: TFloatField;
    QL_AbonCuentaClienteAux: TStringField;
    QL_AbonIEPSVale: TFloatField;
    QL_AbonSubtotValeAntIEPS: TFloatField;
    QL_AbonIvaVale: TFloatField;
    QL_AbonIEPSTarj: TFloatField;
    QL_AbonSubtotTarjANTIEPS: TFloatField;
    QL_AbonIvaTarj: TFloatField;
    QL_AbonSubtotalTarj: TFloatField;
    QL_AbonSerieCupon: TStringField;
    QL_AbonSerieCFeria: TStringField;
    QL_AbonFolioCFeria: TIntegerField;
    QL_AbonFechaRecupCFeria: TStringField;
    QL_AbonImporteCFeria: TFloatField;
    QL_AbonIEPSTpag: TDateField;
    QL_AbonSubtotalTpag: TFloatField;
    QL_AbonClave: TIntegerField;
    QL_AbonIvaTpag: TFloatField;
    QL_AbonSubtotalVale: TFloatField;
    QL_DliqcTotalAbonoMn: TFloatField;
    QL_DliqcIvaAbonoMn: TFloatField;
    QL_DliqcCuentaCliente: TIntegerField;
    QL_DliqcCuentaCnt: TIntegerField;
    QL_DliqaTotalAbonoMn: TFloatField;
    QL_DliqaIvaAbonoMn: TFloatField;
    QL_DliqaCuentaCliente: TIntegerField;
    QL_DliqaCuentaCnt: TIntegerField;
    QL_DliqpTotalAbonoMn: TFloatField;
    QL_DliqpIvaAbonoMn: TFloatField;
    QL_DliqpCuentaCliente: TIntegerField;
    QL_DliqpCuentaCnt: TIntegerField;
    QL_TranTotalAbonoMn: TFloatField;
    QL_TranIvaAbonoMn: TFloatField;
    QL_TranCuentaCliente: TIntegerField;
    QL_TranCuentaCnt: TIntegerField;
    QL_FDepTotalAbonoMn: TFloatField;
    QL_FDepIvaAbonoMn: TFloatField;
    QL_FDepCuentaCliente: TIntegerField;
    QL_FDepCuentaCnt: TIntegerField;
    QL_RcupTotalAbonoMn: TFloatField;
    QL_RcupIvaAbonoMn: TFloatField;
    QL_RcupCuentaCliente: TIntegerField;
    QL_RcupCuentaCnt: TIntegerField;
    QL_CupoTotalAbonoMn: TFloatField;
    QL_CupoIvaAbonoMn: TFloatField;
    QL_CupoCuentaCliente: TIntegerField;
    QL_CupoCuentaCnt: TIntegerField;
    QL_PvalTotalAbonoMn: TFloatField;
    QL_PvalIvaAbonoMn: TFloatField;
    QL_PvalCuentaCliente: TIntegerField;
    QL_PvalCuentaCnt: TIntegerField;
    QL_TranCuentaCntTarjeta: TStringField;
    QL_TranTipoTarjeta: TStringField;
    TM_TpagTotalAbonoMn: TFloatField;
    TM_TpagIvaAbonoMn: TFloatField;
    TM_TpagCuentaCliente: TIntegerField;
    TM_TpagCuentaCnt: TIntegerField;
    QL_PvalCuentaCntVales: TStringField;
    QL_CupoCuentaCntCupones: TStringField;
    QL_PvalCuentaCntCupones: TStringField;
    QL_TranCuentaCntCupones: TStringField;
    QL_Desc: TQuery;
    QL_DescESTACION: TIntegerField;
    QL_DescCOMBUSTIBLE: TIntegerField;
    QL_DescFECHA: TDateTimeField;
    QL_DescTURNO: TIntegerField;
    QL_DescProducto: TIntegerField;
    QL_DescSubtotalComb: TFloatField;
    QL_DescIvaComb: TFloatField;
    QL_DescFechaAlfa: TStringField;
    QL_DescCostoComb: TFloatField;
    QL_DescImporteProd: TFloatField;
    QL_DescSubtotalProd: TFloatField;
    QL_DescIvaProd: TFloatField;
    QL_DescCostoProd: TFloatField;
    QL_DescIvaCombProd: TFloatField;
    QL_DescClavePago: TIntegerField;
    QL_DescImportePago: TFloatField;
    QL_DescImporteCupon: TFloatField;
    QL_DescCuentaCntCupones: TStringField;
    QL_DescNoClienteCupon: TIntegerField;
    QL_DescDESCUENTO: TFloatField;
    QL_DescTOTALCONDESCTO: TFloatField;
    QL_DescCantidad: TFloatField;
    QL_DescImporteComb: TFloatField;
    QL_DescCuentaDespachador: TStringField;
    QL_DescNoClienteVale: TIntegerField;
    QL_DescCuentaCntVales: TStringField;
    QL_DescImporteVale: TFloatField;
    QL_DescLineaAceites: TIntegerField;
    QL_DescNoClienteTarjeta: TIntegerField;
    QL_DescImporteTarjeta: TIntegerField;
    QL_DescTipoTarjeta: TStringField;
    QL_DescImporteTarjetaCR: TFloatField;
    QL_DescImporteTarjetaPP: TFloatField;
    QL_DescCuentaCntTarjeta: TStringField;
    QL_DescCombustibleVale: TIntegerField;
    QL_DescProductoVale: TIntegerField;
    QL_DescCantidadVale: TFloatField;
    QL_DescGrupoCliente: TIntegerField;
    QL_DescImporteTarjetaME: TFloatField;
    QL_DescSubtotCombAntIEPS: TFloatField;
    QL_DescIEPSCOMB: TFloatField;
    QL_DescCombustibleCupon: TIntegerField;
    QL_DescCantidadCupon: TFloatField;
    QL_DescIEPSCupon: TFloatField;
    QL_DescSubtotCupAntIEPS: TFloatField;
    QL_DescIvaCupon: TFloatField;
    QL_DescSubtotalCupon: TFloatField;
    QL_DescCuentaClienteAux: TIntegerField;
    QL_DescIEPSVale: TFloatField;
    QL_DescSubtotValeAntIEPS: TFloatField;
    QL_DescIvaVale: TFloatField;
    QL_DescSubtotalVale: TFloatField;
    QL_DescSerieCupon: TStringField;
    QL_DescImporteCmb: TFloatField;
    QL_DescIEPSTarj: TFloatField;
    QL_DescSubtotTarjAntIEPS: TFloatField;
    QL_DescIvaTarj: TFloatField;
    QL_DescSubtotalTarj: TFloatField;
    QL_DescSerieCFeria: TStringField;
    QL_DescFolioCFeria: TIntegerField;
    QL_DescFechaRecupCFeria: TDateTimeField;
    QL_DescImporteCFeria: TFloatField;
    QL_DescSubtotalTpag: TFloatField;
    QL_DescClave: TIntegerField;
    QL_DescDescripcion: TStringField;
    QL_DescImporte: TFloatField;
    QL_DescPorcentaje: TFloatField;
    QL_DescIvaTpag: TFloatField;
    QL_DescIEPSTpag: TFloatField;
    QL_DescNoFicha: TIntegerField;
    QL_DescFolio_Ficha: TIntegerField;
    QL_DescTotal_Ficha: TFloatField;
    QL_DescTotalAbonoMn: TFloatField;
    QL_DescIvaAbonoMn: TFloatField;
    QL_DescCuentaCliente: TIntegerField;
    QL_DescCuentaCnt: TIntegerField;
    QL_DliqcDescuento: TFloatField;
    QL_DliqcTotalConDescto: TFloatField;
    QL_DliqaDescuento: TFloatField;
    QL_DliqaTotalConDescto: TFloatField;
    QL_DliqpDescuento: TFloatField;
    QL_DliqpTotalConDescto: TFloatField;
    QL_TranDescuento: TFloatField;
    QL_TranTotalConDescto: TFloatField;
    QL_FDepDescuento: TFloatField;
    QL_FDepTotalConDescto: TFloatField;
    QL_RcupDescuento: TFloatField;
    QL_RcupTotalConDescto: TFloatField;
    QL_CupoDescuento: TFloatField;
    QL_CupoTotalConDescto: TFloatField;
    QL_AbonDescuento: TFloatField;
    QL_AbonTotalConDescto: TFloatField;
    QL_PvalDescuento: TFloatField;
    QL_PvalTotalConDescto: TFloatField;
    TM_TpagDescuento: TFloatField;
    TM_TpagTotalConDescto: TFloatField;
    QL_DescIvaDescuento: TFloatField;
    QL_DescSubtotalDescuento: TFloatField;
    QL_DliqcSubtotalDescuento: TFloatField;
    QL_DliqcIvaDescuento: TFloatField;
    QL_DliqaIvaDescuento: TFloatField;
    QL_DliqaSubtotalDescuento: TFloatField;
    QL_DliqpIvaDescuento: TFloatField;
    QL_DliqpSubtotalDescuento: TFloatField;
    QL_RcupIvaDescuento: TFloatField;
    QL_RcupSubtotalDescuento: TFloatField;
    QL_PvalIvaDescuento: TFloatField;
    QL_PvalSubtotalDescuento: TFloatField;
    QL_TranIvaDescuento: TFloatField;
    QL_TranSubtotalDescuento: TFloatField;
    QL_CupoIvaDescuento: TFloatField;
    QL_CupoSubtotalDescuento: TFloatField;
    QL_FDepIvaDescuento: TFloatField;
    QL_FDepSubtotalDescuento: TFloatField;
    QL_AbonIvaDescuento: TFloatField;
    QL_AbonSubtotalDescuento: TFloatField;
    TM_TpagIvaDescuento: TFloatField;
    TM_TpagSubtotalDescuento: TFloatField;
    QL_AbonCUENTACLIENTE: TStringField;
    QL_AbonSUBTOTALCARGO: TFloatField;
    QL_AbonIVACARGO: TFloatField;
    QL_AbonRETIVACARGO: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure QL_DliqcCalcFields(DataSet: TDataSet);
    procedure QL_DliqaCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QL_DliqpCalcFields(DataSet: TDataSet);
    procedure QL_RcupCalcFields(DataSet: TDataSet);
    procedure QL_PvalCalcFields(DataSet: TDataSet);
    procedure QL_TranCalcFields(DataSet: TDataSet);
    procedure QL_CupoCalcFields(DataSet: TDataSet);
    procedure QL_FDepCalcFields(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure QL_AbonCalcFields(DataSet: TDataSet);
    procedure QL_DescCalcFields(DataSet: TDataSet);
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
    tipoLiq:Integer;
  public
    { Public declarations }
    xPolizaCosto:Boolean;
    procedure PreparaForma(xdocu:string;xnum:integer);
    function DameCuentaAuxiCliente(xcliente:Integer):string;
  end;

var
  FLIQTURCcpol: TFLIQTURCcpol;

implementation

uses DDMCFG, DDMGEN, ULIBGRAL, ULIBDATABASE, UGENPOLIautom, DDMGENQ,
  UGEN_NET, DDMCNT, DDMCUP, DDMGAS, DDMLIQ, DDMGEN_VTAS, DDMGASQ, DDMCXC;

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
    if DMGEN.VarComp('PolizaDfltLiq')<>'' then
      DBLookupComboBox1.KeyValue:=DMGEN.VarComp('PolizaDfltLiq')
    else
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
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select TipoLiq as Entero1 from DGENEMPR');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    tipoLiq:=Q_AuxiEntero1.AsInteger;
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
           FormatoNumeroSinComas(PreaTasaIva,10,2)+' // '+
           FormatoNumeroSinComas(Costo,10,2)+'//A//';
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
    end
    else if (tipoLiq=2) and ((VarGasPolizaLiqDia<>'Si')) then begin
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
          Q_Auxi.SQL.Add('  and Turno='+T_TurcTURNO.AsString);
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
    else begin
      QL_Dliqc.SQL.Delete(3);
      QL_Dliqc.SQL[0]:=StringReplace(QL_Dliqc.SQL[0],',turno',',1 as turno',[]);
      QL_Dliqc.SQL[3]:=StringReplace(QL_Dliqc.SQL[3],',turno','',[]);
    end;
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
      QL_Rcup.SQL.Delete(3);
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

    QL_Cupo.Close;
    QL_Cupo.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_Cupo.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_Cupo.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else
      QL_Cupo.SQL.Delete(3);
    QL_Cupo.Prepare;
    QL_Cupo.open;

    QL_FDep.Close;
    QL_FDep.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_FDep.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_FDep.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else
      QL_FDep.SQL.Delete(3);
    QL_FDep.Prepare;
    QL_FDep.open;

    QL_Desc.Close;
    QL_Desc.ParamByName('pestacion').asinteger:=T_TurcEstacion.asinteger;
    QL_Desc.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    if VarGasPolizaLiqDia='No' then
      QL_Desc.ParamByName('pturno').asinteger:=T_TurcTurno.asinteger
    else begin
      QL_Desc.SQL.Delete(3);
      QL_Desc.SQL[0]:=StringReplace(QL_Desc.SQL[0],',turno',',1 as turno',[]);
      QL_Desc.SQL[3]:=StringReplace(QL_Desc.SQL[3],',turno','',[]);
    end;
    QL_Desc.Prepare;
    QL_Desc.open;

    QL_Abon.Close;
    QL_Abon.ParamByName('psucursal').asinteger:=T_TurcEstacion.asinteger;
    QL_Abon.ParamByName('pfecha').asdatetime:=T_TurcFecha.asdatetime;
    QL_Abon.Prepare;
    QL_Abon.open;

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
    if ((QL_DliqcTurno.AsInteger=xTurnoAux)or(VarGasPolizaLiqDia='Si')) then
      QL_DliqcCantidad.AsFloat:=QL_DliqcCantidadPrev.AsFloat-xAjusteCant[i]
    else
      QL_DliqcCantidad.AsFloat:=QL_DliqcCantidadPrev.AsFloat;
    if ((QL_DliqcTurno.AsInteger=xTurnoAux) or(VarGasPolizaLiqDia='Si')) then
      QL_DliqcImporteComb.AsFloat:=AjustaFloat(QL_DliqcImportePrev.AsFloat-xAjusteImpo[i],2)
    else
      QL_DliqcImporteComb.AsFloat:=AjustaFloat(QL_DliqcImportePrev.AsFloat,2);

    if DMGAS.VarCupCalcularIEPS='Si' then begin
      QL_DliqcIEPSCOMB.AsFloat:=AjustaFloat(QL_DliqcCantidad.AsFloat*DameIEPS(QL_DliqcCOMBUSTIBLE.AsInteger,QL_DliqcFECHA.AsDateTime),2);
    end
    else begin
      QL_DliqcIEPSCOMB.AsFloat:=0;
    end;

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

    QL_DliqcIEPSVale.AsFloat:=0;
    QL_DliqcSubtotValeAntIEPS.AsFloat:=0;
    QL_DliqcIvaVale.AsFloat:=0;
    QL_DliqcSubtotalVale.AsFloat:=0;
    QL_DliqcSerieCupon.AsString:='';

    QL_DliqcIEPSTarj.AsFloat:=0;
    QL_DliqcSubtotTarjAntIEPS.AsFloat:=0;
    QL_DliqcIvaTarj.AsFloat:=0;
    QL_DliqcSubtotalTarj.AsFloat:=0;
    QL_DliqcImporteCmb.AsFloat:=0;
    QL_DliqcDescuento.AsFloat:=0;
    QL_DliqcTotalConDescto.AsFloat:=0;
    QL_DliqcIvaDescuento.AsFloat:=0;
    QL_DliqcSubtotalDescuento.AsFloat:=0;


// Cupon de Feria
    QL_DliqcSerieCFeria.AsString:='';
    QL_DliqcFolioCFeria.AsInteger:=0;
    QL_DliqcFechaRecupCFeria.AsDateTime:=0;
    QL_DliqcImporteCFeria.AsFloat:=0;
// Fin Cupon de Feria
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_DliqcIEPSTpag.AsFloat:=0;
    QL_DliqcSubtotalTpag.AsFloat:=0;
    QL_DliqcClave.AsInteger:=0;
    QL_DliqcDescripcion.AsString:='';
    QL_DliqcImporte.AsFloat:=0;
    QL_DliqcPorcentaje.AsFloat:=0;
    QL_DliqcIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Fichas de Depósito
    QL_DliqcNoFicha.AsInteger:=0;
    QL_DliqcFolio_Ficha.AsInteger:=0;
    QL_DliqcTotal_Ficha.AsFloat:=0;
// Fin Fichas de Depósito
// Etiquetas para saldos CXC
    QL_DliqcTotalAbonoMn.AsFloat:=0;
    QL_DliqcIvaAbonoMn.AsFloat:=0;
    QL_DliqcCuentaCliente.AsInteger:=0;
    QL_DliqcCuentaCnt.AsInteger:=0;
    QL_DliqcCuentaCntVales.AsInteger:=0;
    QL_DliqcCuentaDespachador.AsInteger:=0;
    QL_DliqcCuentaCntCupones.AsInteger:=0;
  end;
end;

procedure TFLIQTURCcpol.BitBtn1Click(Sender: TObject);
var num,i:integer;
    lista:TStrings;
    ss,val:string;
    xTotCombImp, xTotComIeps, xTotIva, xTotAceites,
    xTotal:Real;
begin
  with DMGEN,DMCFG,DMCNT,DMGAS do begin
    if not LocalizaTabla(T_Cpold,'Documento;Numero;Clave',
                     VarArrayOf([Q_CpoldDocumento.Asstring,Q_CpoldNumero.AsInteger,Q_CpoldClave.Asinteger])) then
      raise Exception.Create('No existe Configuración');
    pcve:=T_CpoldClave.AsInteger;
    BitBtn1.Enabled:=false;
    lista:=TStringList.Create;
    TM_Tpag.Active:=False;
    TM_Tpag.Active:=True;
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
        xTotCombImp:=0;
        xTotComIeps:=0;
        xTotIva:=0;
//        xTotComImpAntIEPS:=0;
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
          xTotCombImp:=xTotCombImp+QL_DliqcImporteComb.AsFloat;
          xTotComIeps:=xTotComIeps+QL_DliqcIEPSCOMB.AsFloat;
          xTotIva:=xTotIva+QL_DliqcIvaComb.AsFloat;
//          xTotComImpAntIEPS:=xTotComImpAntIEPS+QL_DliqcSubtotCombAntIEPS.AsFloat;
          lista.clear;
          QL_Dliqc.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // DLIQA
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Dliqa.RecordCount;
        ProgressBar1.Position:=0;
        xTotAceites:=0;
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
          xTotAceites:=xTotAceites+QL_DliqaIMPORTEPROD.AsFloat;
          xTotIva:=xTotIva+QL_DliqaIvaProd.AsFloat;
          QL_Dliqa.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // DLIQP
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Dliqp.RecordCount;
        ProgressBar1.Position:=0;
//        xPorIeps:=AjustaFloat(DivideFloat(xTotComIeps,xTotCombImp+xTotAceites),12);
//        xPorComImpAntIEPS:=AjustaFloat(DivideFloat(xTotComImpAntIEPS,xTotCombImp+xTotAceites),12);
        while not QL_Dliqp.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
//              if (ss='IEPSTpag') or (ss='STCombAntIEPSTpag') then begin
//                if ss='IEPSTpag' then begin
//
//                  val:=FloatToStr(AjustaFloat(QL_DliqpImportePago.AsFloat*xPorIeps,2));
//                end;
//                if ss='STCombAntIEPSTpag' then begin
//                  val:=FloatToStr(AjustaFloat(QL_DliqpImportePago.AsFloat*xPorComImpAntIEPS,2));
//                end
//              end
//              else
                val:=QL_Dliqp.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          if Abs(QL_DliqpImportePago.AsFloat)>0 then begin
            if not TM_Tpag.Locate('Clave;Estacion',VarArrayOf([QL_DliqpClavePago.AsInteger,QL_DliqpESTACION.AsInteger]),[]) then begin
              TM_Tpag.Insert;
              TM_TpagClave.AsInteger:=QL_DliqpClavePago.AsInteger;
              TM_TpagDescripcion.AsString:='Tipo de pago Global';
              TM_TpagImporte.AsFloat:=Abs(QL_DliqpImportePago.AsFloat);
              TM_TpagSubTotalTpag.AsFloat:=0;
              TM_TpagIvaTpag.AsFloat:=0;
              TM_TpagIEPSTpag.AsFloat:=0;
              TM_TpagPorcentaje.AsFloat:=0;
              TM_TpagEstacion.AsInteger:=QL_DliqpESTACION.AsInteger;
            end
            else begin
              TM_Tpag.Edit;
              TM_TpagImporte.AsFloat:=TM_TpagImporte.AsFloat + Abs(QL_DliqpImportePago.AsFloat);
            end;
            TM_Tpag.Post;
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

        // CUPO
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Cupo.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_Cupo.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Cupo.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Cupo.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        //Tipo de pagos
        xTotal:=xTotCombImp+xTotAceites;
        TM_Tpag.First;
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=TM_Tpag.RecordCount;
        ProgressBar1.Position:=0;
        while not TM_Tpag.Eof do begin
          try
            TM_Tpag.Edit;
            TM_TpagPorcentaje.AsFloat:=DivideFloat(TM_TpagImporte.AsFloat,xTotal);
            TM_TpagIvaTpag.AsFloat:=AjustaFloat(xTotIva*TM_TpagPorcentaje.AsFloat,2);
            TM_TpagIEPSTpag.AsFloat:=AjustaFloat(xTotComIeps*TM_TpagPorcentaje.AsFloat,2);
            TM_TpagSubTotalTpag.AsFloat:=AjustaFloat(TM_TpagImporte.AsFloat-(TM_TpagIvaTpag.AsFloat+TM_TpagIEPSTpag.AsFloat),2);
            TM_Tpag.Post;
          except
            TM_Tpag.Cancel;
          end;
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=TM_Tpag.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          TM_Tpag.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // FDEP
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_FDep.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_FDep.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_FDep.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_FDep.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // DESC
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Desc.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_Desc.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Desc.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Desc.Next;
          ProgressBar1.StepBy(1);
          StaticText3.Caption:=IntToStr(ProgressBar1.Position)+'/'+IntToStr(ProgressBar1.Max);
        end;

        // ABON
        ProgressBar1.Visible:=true;
        ProgressBar1.Max:=QL_Abon.RecordCount;
        ProgressBar1.Position:=0;
        while not QL_Abon.Eof do begin
          inc(num);
          T_Calc.Insert;
          T_CalcClave.AsInteger:=num;
          lista.Assign(T_CpolParametros);
          for i:=0 to lista.Count-1 do begin
            ss:=limpiastr(lista[i]);
            if ss<>'' then begin
              val:=QL_Abon.fieldbyname(ss).asstring;
              lista[i]:=ss+' = '+val;
            end;
          end;
          T_CalcParametros.Assign(lista);
          T_Calc.Post;
          lista.clear;
          QL_Abon.Next;
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
            if not(xPolizaCosto) then begin
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
            end
            else begin
              T_Turc.Edit;
              T_TurcContabilizado2.AsString:='Si';
              T_TurcTipoPoliza2.AsString:=T_PoliTipoPoliza.AsString;
              T_TurcNoPoliza2.AsInteger:=T_PoliNoPoliza.AsInteger;
              T_Turc.Post;
              if VarGasPolizaLiqDia='Si' then begin
                Q_Auxi.Close;
                Q_Auxi.SQL.Clear;
                Q_Auxi.SQL.Add('Update DGASTURC Set Contabilizado2="Si", TipoPoliza2="**" ');
                Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
                Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
                Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
                Q_Auxi.SQL.Add('  and Turno<'+IntToStr(T_TurcTurno.AsInteger));
                Q_Auxi.Prepare;
                Q_Auxi.ExecSQL;
              end;
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

        QL_DliqaIEPSVale.AsFloat:=0;
        QL_DliqaSubtotValeAntIEPS.AsFloat:=0;
        QL_DliqaIvaVale.AsFloat:=0;
        QL_DliqaSubtotalVale.AsFloat:=0;
        QL_DliqaSerieCupon.AsString:='';

        QL_DliqaIEPSTarj.AsFloat:=0;
        QL_DliqaSubtotTarjAntIEPS.AsFloat:=0;
        QL_DliqaIvaTarj.AsFloat:=0;
        QL_DliqaSubtotalTarj.AsFloat:=0;
        QL_DliqaImporteCmb.AsFloat:=0;
        QL_DliqaDescuento.AsFloat:=0;
        QL_DliqaTotalConDescto.AsFloat:=0;
        QL_DliqaIvaDescuento.AsFloat:=0;
        QL_DliqaSubtotalDescuento.AsFloat:=0;
      end;
    end;
// Cupon de Feria
    QL_DliqaSerieCFeria.AsString:='';
    QL_DliqaFolioCFeria.AsInteger:=0;
    QL_DliqaFechaRecupCFeria.AsDateTime:=0;
    QL_DliqaImporteCFeria.AsFloat:=0;
// Fin Cupon de Feria
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_DliqaIEPSTpag.AsFloat:=0;
    QL_DliqaSubtotalTpag.AsFloat:=0;
    QL_DliqaClave.AsInteger:=0;
    QL_DliqaDescripcion.AsString:='';
    QL_DliqaImporte.AsFloat:=0;
    QL_DliqaPorcentaje.AsFloat:=0;
    QL_DliqaIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Fichas de Depósito
    QL_DliqaNoFicha.AsInteger:=0;
    QL_DliqaFolio_Ficha.AsInteger:=0;
    QL_DliqaTotal_Ficha.AsFloat:=0;
// Fin Fichas de Depósito
// Etiquetas para saldos CXC
    QL_DliqaTotalAbonoMn.AsFloat:=0;
    QL_DliqaIvaAbonoMn.AsFloat:=0;
    QL_DliqaCuentaCliente.AsInteger:=0;
    QL_DliqaCuentaCnt.AsInteger:=0;
    QL_DliqaCuentaCntVales.AsInteger:=0;
    QL_DliqaCuentaDespachador.AsInteger:=0;
    QL_DliqaCuentaCntCupones.AsInteger:=0;
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
    if (QL_DliqpClavePago.AsInteger=TpagEfectivo)and (((QL_DliqpTurno.AsInteger=xTurnoAux) or (VarGasPolizaLiqDia='Si'))and (xSwAux))  then begin
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

    QL_DliqpIEPSVale.AsFloat:=0;
    QL_DliqpSubtotValeAntIEPS.AsFloat:=0;
    QL_DliqpIvaVale.AsFloat:=0;
    QL_DliqpSubtotalVale.AsFloat:=0;
    QL_DliqpSerieCupon.AsString:='';

    QL_DliqpIEPSTarj.AsFloat:=0;
    QL_DliqpSubtotTarjAntIEPS.AsFloat:=0;
    QL_DliqpIvaTarj.AsFloat:=0;
    QL_DliqpSubtotalTarj.AsFloat:=0;
    QL_DliqpImporteCmb.AsFloat:=0;
    QL_DliqpDescuento.AsFloat:=0;
    QL_DliqpTotalConDescto.AsFloat:=0;
    QL_DliqpIvaDescuento.AsFloat:=0;
    QL_DliqpSubtotalDescuento.AsFloat:=0;
// Cupon de Feria
    QL_DliqpSerieCFeria.AsString:='';
    QL_DliqpFolioCFeria.AsInteger:=0;
    QL_DliqpFechaRecupCFeria.AsDateTime:=0;
    QL_DliqpImporteCFeria.AsFloat:=0;
// Fin Cupon de Feria
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_DliqpIEPSTpag.AsFloat:=0;
    QL_DliqpSubtotalTpag.AsFloat:=0;
    QL_DliqpClave.AsInteger:=0;
    QL_DliqpDescripcion.AsString:='';
    QL_DliqpImporte.AsFloat:=0;
    QL_DliqpPorcentaje.AsFloat:=0;
    QL_DliqpIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Fichas de Depósito
    QL_DliqpNoFicha.AsInteger:=0;
    QL_DliqpFolio_Ficha.AsInteger:=0;
    QL_DliqpTotal_Ficha.AsFloat:=0;
// Fin Fichas de Depósito
// Etiquetas para saldos CXC
    QL_DliqpTotalAbonoMn.AsFloat:=0;
    QL_DliqpIvaAbonoMn.AsFloat:=0;
    QL_DliqpCuentaCliente.AsInteger:=0;
    QL_DliqpCuentaCnt.AsInteger:=0;
    QL_DliqpCuentaCntVales.AsInteger:=0;
    QL_DliqpCuentaDespachador.AsInteger:=0;
    QL_DliqpCuentaCntCupones.AsInteger:=0;
    with DMGAS do begin
//      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiEntero1.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Add('Select DESPACHADOR As Entero1 From DGASLIQG Where ESTACION='+QL_DliqpEstacion.AsString+' and FOLIO='+QL_DliqpFOLIO.AsString);
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        QL_DliqpDespachador.AsInteger := Q_AuxiEntero1.AsInteger;

        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiStr50.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Add('Select CTACNT As Str50 From DGASDESP Where CLAVE='+QL_DliqpDespachador.AsString);
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        QL_DliqpCuentaDespachador.AsString := Q_AuxiStr50.AsString;
//      finally
//        Q_Auxi.Close;
//      end;
    end;
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
    
    if DMGAS.VarGasPreciosPorEstacion='Si' then
      DMCUP.DamePrecioFechaEst(DMGAS.T_TurcEstacion.asinteger,QL_RcupCOMBUSTIBLECUPON.AsInteger,QL_RcupFECHA.AsDateTime,prec,tasa)
    else
      DMCUP.DamePrecioFecha(QL_RcupCOMBUSTIBLECUPON.AsInteger,QL_RcupFECHA.AsDateTime,prec,tasa);

    QL_RcupCantidadCupon.AsFloat:=AjustaFloat(DivideFloat(QL_RcupIMPORTECUPON.AsFloat,prec),3);

    if DMGAS.VarCupCalcularIEPS='Si' then begin
      QL_RcupIEPSCupon.AsFloat:=AjustaFloat(QL_RcupCantidadCupon.AsFloat*DameIEPS(QL_RcupCOMBUSTIBLECUPON.AsInteger,QL_RcupFECHA.AsDateTime),2);
    end
    else begin
      QL_RcupIEPSCupon.AsFloat:=0;
    end;
    
    QL_RcupSubtotCupAntIEPS.AsFloat:=AjustaFloat((QL_RcupIMPORTECUPON.AsFloat-QL_RcupIEPSCupon.AsFloat)/(1+tasa/100),2);
    QL_RcupIvaCupon.AsFloat:=AjustaFloat(QL_RcupIMPORTECUPON.AsFloat-QL_RcupSubtotCupAntIEPS.AsFloat-QL_RcupIEPSCupon.AsFloat,2);
    QL_RcupSubtotalCupon.AsFloat:=AjustaFloat(QL_RcupSubtotCupAntIEPS.AsFloat+QL_RcupIEPSCupon.AsFloat,2);
    QL_RcupCuentaClienteAux.AsString:=DameCuentaAuxiCliente(QL_RcupNOCLIENTECUPON.AsInteger);
    QL_RcupIEPSVale.AsFloat:=0;
    QL_RcupSubtotValeAntIEPS.AsFloat:=0;
    QL_RcupIvaVale.AsFloat:=0;
    QL_RcupSubtotalVale.AsFloat:=0;

    QL_RcupIEPSTarj.AsFloat:=0;
    QL_RcupSubtotTarjAntIEPS.AsFloat:=0;
    QL_RcupIvaTarj.AsFloat:=0;
    QL_RcupSubtotalTarj.AsFloat:=0;
    QL_RcupImporteCmb.AsFloat:=0;
    QL_RcupDescuento.AsFloat:=0;
    QL_RcupTotalConDescto.AsFloat:=0;
    QL_RcupIvaDescuento.AsFloat:=0;
    QL_RcupSubtotalDescuento.AsFloat:=0;

// Cupon de Feria
    QL_RcupSERIECFERIA.AsString:='';
    QL_RcupFolioCFeria.AsInteger:=0;
    QL_RcupFechaRecupCFeria.AsDateTime:=0;
    QL_RcupImporteCFeria.AsFloat:=0;
// Fin Cupon de Feria
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_RcupIEPSTpag.AsFloat:=0;
    QL_RcupSubtotalTpag.AsFloat:=0;
    QL_RcupClave.AsInteger:=0;
    QL_RcupDescripcion.AsString:='';
    QL_RcupImporte.AsFloat:=0;
    QL_RcupPorcentaje.AsFloat:=0;
    QL_RcupIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Fichas de Depósito
    QL_RcupNoFicha.AsInteger:=0;
    QL_RcupFolio_Ficha.AsInteger:=0;
    QL_RcupTotal_Ficha.AsFloat:=0;
// Fin Fichas de Depósito
// Etiquetas para saldos CXC
    QL_RcupTotalAbonoMn.AsFloat:=0;
    QL_RcupIvaAbonoMn.AsFloat:=0;
    QL_RcupCuentaCliente.AsInteger:=0;
    QL_RcupCuentaCnt.AsInteger:=0;
//    try
      DMGAS.Q_Auxi.Close;
      DMGAS.Q_Auxi.SQL.Clear;
      DMGAS.Q_AuxiStr50.FieldKind:=fkInternalCalc;
      DMGAS.Q_AuxiStr100.FieldKind:=fkInternalCalc;
      DMGAS.Q_Auxi.SQL.Add('SELECT CUENTACUPONES As Str50, CUENTAVALES As Str100 FROM DGASSALD');
      DMGAS.Q_Auxi.SQL.Add('WHERE NOCLIE='+inttostr(QL_RcupNOCLIENTECUPON.Asinteger));
      DMGAS.Q_Auxi.Prepare;
      DMGAS.Q_Auxi.Open;
      QL_RcupCuentaCntCupones.AsString:=DMGAS.Q_AuxiStr50.AsString;
      QL_RcupCuentaCntVales.AsString:=DMGAS.Q_AuxiStr100.AsString;
//    finally
//      DMGAS.Q_Auxi.Close;
//    end;
    QL_RcupCuentaDespachador.AsInteger:=0;
  end;
end;

procedure TFLIQTURCcpol.QL_PvalCalcFields(DataSet: TDataSet);
var
  valores:TImportesIEPS;
begin
  with DMGAS,DMCUP do begin
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
    //IEPS de vales
    if QL_PvalTIPO.AsString=idTipoCmb then begin

      if DMGAS.VarCupCalcularIEPS='Si' then begin
        valores:=DameImportesConIEPS(QL_PvalCOMBUSTIBLEVALE.AsInteger,QL_PvalIMPORTEVALE.AsFloat,QL_PvalFECHA.AsDateTime);
      end
      else begin
        valores:=DameImportesSinIEPS(QL_PvalCOMBUSTIBLEVALE.AsInteger,QL_PvalIMPORTEVALE.AsFloat,QL_PvalFECHA.AsDateTime);
      end;
      
      QL_PvalIEPSVale.AsFloat:=valores.IEPS;
      QL_PvalSubtotValeAntIEPS.AsFloat:=valores.SubtotalAntIEPS;
      QL_PvalIvaVale.AsFloat:=valores.Iva;
      QL_PvalSubtotalVale.AsFloat:=valores.Subtotal;
    end
    else begin
      if VariableDeMemo(DMGASQ.QT_CajaVarIni,'ValidaAceites')<>'No' then begin
        if (QL_PvalTIPO.AsString=idTipoAceites)and(QL_PvalPRODUCTOVALE.AsInteger=0) then
          raise Exception.Create('Vale de Aceite no tiene clave de producto'+#10#13+'Cliente: '+IntToClaveNum(QL_PvalNOCLIENTEVALE.AsInteger,6)+#10#13+
                                'Fecha: '+QL_PvalFechaAlfa.AsString+#10#13+
                                'Turno: '+IntToClaveNum(QL_PvalTURNO.AsInteger,3)+#10#13+
                                'Importe: $ '+FormatoMoneda(QL_PvalIMPORTEVALE.AsFloat)+#10#13
                                );
      end;
      QL_PvalIEPSVale.AsFloat:=0;
      QL_PvalSubtotValeAntIEPS.AsFloat:=0;
      QL_PvalSubtotalVale.AsFloat:=(AjustaFloat((QL_PvalIMPORTEVALE.AsFloat)/(1+GetTasaIVAdeCombustible(QL_PvalESTACION.AsInteger,1,QL_PvalFECHA.AsDateTime)/100),2));
      QL_PvalIvaVale.AsFloat:=QL_PvalIMPORTEVALE.AsFloat-QL_PvalSubtotalVale.AsFloat;
    end;
    QL_PvalIEPSTarj.AsFloat:=0;
    QL_PvalSubtotTarjAntIEPS.AsFloat:=0;
    QL_PvalIvaTarj.AsFloat:=0;
    QL_PvalSubtotalTarj.AsFloat:=0;
    QL_PvalImporteCmb.AsFloat:=0;
    QL_PvalDescuento.AsFloat:=0;
    QL_PvalTotalConDescto.AsFloat:=0;
    QL_PvalIvaDescuento.AsFloat:=0;
    QL_PvalSubtotalDescuento.AsFloat:=0;
// Cupon de Feria
    QL_PvalSerieCFeria.AsString:='';
    QL_PvalFolioCFeria.AsInteger:=0;
    QL_PvalFechaRecupCFeria.AsDateTime:=0;
    QL_PvalImporteCFeria.AsFloat:=0;
// Fin Cupon de Feria
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_PvalIEPSTpag.AsFloat:=0;
    QL_PvalSubtotalTpag.AsFloat:=0;
    QL_PvalClave.AsInteger:=0;
    QL_PvalDescripcion.AsString:='';
    QL_PvalImporte.AsFloat:=0;
    QL_PvalPorcentaje.AsFloat:=0;
    QL_PvalIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Fichas de Depósito
    QL_PvalNoFicha.AsInteger:=0;
    QL_PvalFolio_Ficha.AsInteger:=0;
    QL_PvalTotal_Ficha.AsFloat:=0;
// Fin Fichas de Depósito
//    try
      DMGAS.Q_Auxi.Close;
      DMGAS.Q_Auxi.SQL.Clear;
      DMGAS.Q_AuxiStr50.FieldKind:=fkInternalCalc;
      DMGAS.Q_AuxiStr100.FieldKind:=fkInternalCalc;
      DMGAS.Q_Auxi.SQL.Add('SELECT CUENTAVALES As Str50, CUENTACUPONES As Str100 FROM DGASSALD');
      DMGAS.Q_Auxi.SQL.Add('WHERE NOCLIE='+inttostr(QL_PvalNOCLIENTEVALE.Asinteger));
      DMGAS.Q_Auxi.Prepare;
      DMGAS.Q_Auxi.Open;
      QL_PvalCuentaCntVales.AsString:=DMGAS.Q_AuxiStr50.AsString;
      QL_PvalCuentaCntCupones.AsString:=DMGAS.Q_AuxiStr100.AsString;
//    finally
//      DMGAS.Q_Auxi.Close;
//    end;
// Etiquetas para saldos CXC
    QL_PvalTotalAbonoMn.AsFloat:=0;
    QL_PvalIvaAbonoMn.AsFloat:=0;
    QL_PvalCuentaCliente.AsInteger:=0;
    QL_PvalCuentaCnt.AsInteger:=0;
    QL_PvalCuentaDespachador.AsInteger:=0;
  end;
end;

procedure TFLIQTURCcpol.QL_TranCalcFields(DataSet: TDataSet);
var
  valores:TImportesIEPS;
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

    with DMGAS do begin
//      try
        Q_Auxi.Close;
        Q_AuxiStr2.FieldKind := fkInternalCalc;
        Q_AuxiString.FieldKind := fkInternalCalc;
        Q_AuxiStr50.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('Select TIPOTARJETA as Str2, CUENTAVALES as String, CUENTACUPONES As Str50 from DGASSALD');
        Q_Auxi.SQL.Add('where NOCLIE = '+IntToStr(QL_TranNOCLIENTETARJETA.AsInteger));
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        QL_TranTipoTarjeta.AsString := Q_AuxiStr2.AsString;
        QL_TranCuentaCntTarjeta.AsString := Q_AuxiString.AsString;
        QL_TranCuentaCntCupones.AsString:= Q_AuxiStr50.AsString;
//      finally
//        Q_Auxi.Close;
//      end;
    end;

    if QL_TranTipoTarjeta.AsString='CR' then
      QL_TranImporteTarjetaCR.AsFloat:=QL_TranImporteTarjeta.AsFloat
    else if QL_TranTipoTarjeta.AsString='PP' then
      QL_TranImporteTarjetaPP.AsFloat:=QL_TranImporteTarjeta.AsFloat
    else if QL_TranTipoTarjeta.AsString='ME' then
      QL_TranImporteTarjetaME.AsFloat:=QL_TranImporteTarjeta.AsFloat;
    QL_TranCombustibleCupon.AsInteger:=0;
    QL_TranCantidadCupon.AsFloat:=0;
    QL_TranIEPSCupon.AsFloat:=0;
    QL_TranSubtotCupAntIEPS.AsFloat:=0;
    QL_TranIvaCupon.AsFloat:=0;
    QL_TranSubtotalCupon.AsFloat:=0;
    QL_TranCuentaClienteAux.AsString:=DameCuentaAuxiCliente(QL_TranNOCLIENTETARJETA.AsInteger);

    QL_TranIEPSVale.AsFloat:=0;
    QL_TranSubtotValeAntIEPS.AsFloat:=0;
    QL_TranIvaVale.AsFloat:=0;
    QL_TranSubtotalVale.AsFloat:=0;
    QL_TranSerieCupon.AsString:='';
    QL_TranDescuento.AsFloat:=0;
    QL_TranTotalConDescto.AsFloat:=0;
    QL_TranIvaDescuento.AsFloat:=0;
    QL_TranSubtotalDescuento.AsFloat:=0;

    if QL_TranIMPORTECMB.AsFloat>0 then begin

      if DMGAS.VarCupCalcularIEPS='Si' then begin
        valores:=DameImportesConIEPS(QL_TranCOMBUSTIBLE.AsInteger,QL_TranIMPORTECMB.AsFloat,QL_TranFECHA.AsDateTime);
      end
      else begin
        valores:=DameImportesSinIEPS(QL_TranCOMBUSTIBLE.AsInteger,QL_TranIMPORTECMB.AsFloat,QL_TranFECHA.AsDateTime);
      end;

      QL_TranIEPSTarj.AsFloat:=valores.IEPS;
      QL_TranSubtotTarjAntIEPS.AsFloat:=valores.SubtotalAntIEPS;
      QL_TranIvaTarj.AsFloat:=valores.Iva;
      QL_TranSubtotalTarj.AsFloat:=valores.Subtotal;
    end
    else begin
      QL_TranIEPSTarj.AsFloat:=0;
      QL_TranSubtotTarjAntIEPS.AsFloat:=0;
      QL_TranIvaTarj.AsFloat:=0;
      QL_TranSubtotalTarj.AsFloat:=0;
    end;
// Cupon de Feria
    QL_TranSerieCFeria.AsString:='';
    QL_TranFolioCFeria.AsInteger:=0;
    QL_TranFechaRecupCFeria.AsDateTime:=0;
    QL_TranImporteCFeria.AsFloat:=0;
// Fin Cupon de Feria
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_TranIEPSTpag.AsFloat:=0;
    QL_TranSubtotalTpag.AsFloat:=0;
    QL_TranClave.AsInteger:=0;
    QL_TranDescripcion.AsString:='';
    QL_TranImporte.AsFloat:=0;
    QL_TranPorcentaje.AsFloat:=0;
    QL_TranIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Fichas de Depósito
    QL_TranNoFicha.AsInteger:=0;
    QL_TranFolio_Ficha.AsInteger:=0;
    QL_TranTotal_Ficha.AsFloat:=0;
// Fin Fichas de Depósito
// Etiquetas para saldos CXC
    QL_TranTotalAbonoMn.AsFloat:=0;
    QL_TranIvaAbonoMn.AsFloat:=0;
    QL_TranCuentaCliente.AsInteger:=0;
    QL_TranCuentaCnt.AsInteger:=0;
    QL_TranCuentaDespachador.AsInteger:=0;
    QL_TranCuentaCntCupones.AsInteger:=0;
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


procedure TFLIQTURCcpol.QL_CupoCalcFields(DataSet: TDataSet);
begin
  with DMCUP do begin
    QL_CupoFechaAlfa.AsString:='';
    QL_CupoSubtotalComb.AsFloat:=0;
    QL_CupoIvaComb.AsFloat:=0;
    QL_CupoCostoComb.AsFloat:=0;
    QL_CupoImporteComb.AsFloat:=0;
    QL_CupoCombustible.AsInteger:=0;
    QL_CupoSubtotalProd.AsFloat:=0;
    QL_CupoIvaProd.AsFloat:=0;
    QL_CupoCostoProd.AsFloat:=0;
    QL_CupoImporteProd.AsFloat:=0;
    QL_CupoProducto.AsInteger:=0;
    QL_CupoIvaCombProd.AsFloat:=0;
    QL_CupoImportePago.AsFloat:=0;
    QL_CupoClavePago.AsInteger:=0;
    QL_CupoImporteVale.AsInteger:=0;
    QL_CupoLineaAceites.AsInteger:=0;
    QL_CupoNoClienteTarjeta.AsInteger:=0;
    QL_CupoImporteTarjeta.AsInteger:=0;
    QL_CupoTipoTarjeta.AsString:='';
    QL_CupoImporteTarjetaCR.AsFloat:=0;
    QL_CupoImporteTarjetaPP.AsFloat:=0;
    QL_CupoImporteTarjetaME.AsFloat:=0;
    QL_CupoCombustibleVale.AsInteger:=0;
    QL_CupoProductoVale.AsInteger:=0;
    QL_CupoCantidadVale.AsInteger:=0;
    QL_CupoSubtotCombAntIEPS.AsFloat:=0;
    QL_CupoIEPSComb.AsFloat:=0;
    QL_CupoCantidadCupon.AsFloat:=0;
    QL_CupoIEPSCupon.AsFloat:=0;
    QL_CupoSubtotCupAntIEPS.AsFloat:=0;
    QL_CupoIvaCupon.AsFloat:=0;
    QL_CupoSubtotalCupon.AsFloat:=0;
    QL_CupoCuentaClienteAux.AsString:=DameCuentaAuxiCliente(QL_CupoNOCLIENTECUPON.AsInteger);
    QL_CupoIEPSVale.AsFloat:=0;
    QL_CupoSubtotValeAntIEPS.AsFloat:=0;
    QL_CupoIvaVale.AsFloat:=0;
    QL_CupoSubtotalVale.AsFloat:=0;
    QL_CupoIEPSTaj.AsFloat:=0;
    QL_CupoSubtotTarjAntIEPS.AsFloat:=0;
    QL_CupoIvaTarj.AsFloat:=0;
    QL_CupoSubtotalTarj.AsFloat:=0;
    QL_CupoImporteCmb.AsFloat:=0;
    QL_CupoDescuento.AsFloat:=0;
    QL_CupoTotalConDescto.AsFloat:=0;
    QL_CupoIvaDescuento.AsFloat:=0;
    QL_CupoSubtotalDescuento.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_CupoIEPSTpag.AsFloat:=0;
    QL_CupoSubtotalTpag.AsFloat:=0;
    QL_CupoClave.AsInteger:=0;
    QL_CupoDescripcion.AsString:='';
    QL_CupoImporte.AsFloat:=0;
    QL_CupoPorcentaje.AsFloat:=0;
    QL_CupoIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Fichas de Depósito
    QL_CupoNoFicha.AsInteger:=0;
    QL_CupoFolio_Ficha.AsInteger:=0;
    QL_CupoTotal_Ficha.AsFloat:=0;
// Fin Fichas de Depósito
// Etiquetas para saldos CXC
    QL_CupoTotalAbonoMn.AsFloat:=0;
    QL_CupoIvaAbonoMn.AsFloat:=0;
    QL_CupoCuentaCliente.AsInteger:=0;
    QL_CupoCuentaCnt.AsInteger:=0;
//    try
      DMGAS.Q_Auxi.Close;
      DMGAS.Q_AuxiStr50.FieldKind:=fkInternalCalc;
      DMGAS.Q_AuxiString.FieldKind:=fkInternalCalc;
      DMGAS.Q_Auxi.SQL.Clear;
      DMGAS.Q_Auxi.SQL.Add('SELECT CUENTACUPONES As Str50, CUENTAVALES As String FROM DGASSALD');
      DMGAS.Q_Auxi.SQL.Add('WHERE NOCLIE='+inttostr(QL_CupoNOCLIENTECUPON.Asinteger));
      DMGAS.Q_Auxi.Prepare;
      DMGAS.Q_Auxi.Open;
      QL_CupoCuentaCntCupones.AsString:=DMGAS.Q_AuxiStr50.AsString;
      QL_CupoCuentaCntVales.AsString:=DMGAS.Q_AuxiString.AsString;
//    finally
//      DMGAS.Q_Auxi.Close;
//    end;
    QL_CupoCuentaDespachador.AsInteger:=0;
  end;
end;


procedure TFLIQTURCcpol.QL_FDepCalcFields(DataSet: TDataSet);
begin
  with DMCUP do begin
    QL_FDepFolio.AsInteger:=0;
    QL_FDepImporteCupon.AsFloat:=0;
    QL_FDepFechaAlfa.AsString:='';
    QL_FDepSubtotalComb.AsFloat:=0;
    QL_FDepIvaComb.AsFloat:=0;
    QL_FDepCostoComb.AsFloat:=0;
    QL_FDepImporteComb.AsFloat:=0;
    QL_FDepCombustible.AsInteger:=0;
    QL_FDepSubtotalProd.AsFloat:=0;
    QL_FDepIvaProd.AsFloat:=0;
    QL_FDepCostoProd.AsFloat:=0;
    QL_FDepImporteProd.AsFloat:=0;
    QL_FDepProducto.AsInteger:=0;
    QL_FDepIvaCombProd.AsFloat:=0;
    QL_FDepImportePago.AsFloat:=0;
    QL_FDepClavePago.AsInteger:=0;
    QL_FDepImporteVale.AsInteger:=0;
    QL_FDepLineaAceites.AsInteger:=0;
    QL_FDepNoClienteTarjeta.AsInteger:=0;
    QL_FDepImporteTarjeta.AsInteger:=0;
    QL_FDepTipoTarjeta.AsString:='';
    QL_FDepImporteTarjetaCR.AsFloat:=0;
    QL_FDepImporteTarjetaPP.AsFloat:=0;
    QL_FDepImporteTarjetaME.AsFloat:=0;
    QL_FDepCombustibleVale.AsInteger:=0;
    QL_FDepProductoVale.AsInteger:=0;
    QL_FDepCantidadVale.AsInteger:=0;
    QL_FDepSubtotCombAntIEPS.AsFloat:=0;
    QL_FDepIEPSComb.AsFloat:=0;
    QL_FDepCantidadCupon.AsFloat:=0;
    QL_FDepIEPSCupon.AsFloat:=0;
    QL_FDepSubtotCupAntIEPS.AsFloat:=0;
    QL_FDepIvaCupon.AsFloat:=0;
    QL_FDepSubtotalCupon.AsFloat:=0;
    QL_FDepCuentaClienteAux.AsString:='';
    QL_FDepIEPSVale.AsFloat:=0;
    QL_FDepSubtotValeAntIEPS.AsFloat:=0;
    QL_FDepIvaVale.AsFloat:=0;
    QL_FDepSubtotalVale.AsFloat:=0;
    QL_FDepIEPSTarj.AsFloat:=0;
    QL_FDepSubtotTarjAntIEPS.AsFloat:=0;
    QL_FDepIvaTarj.AsFloat:=0;
    QL_FDepSubtotalTarj.AsFloat:=0;
    QL_FDepImporteCmb.AsFloat:=0;
    QL_FDepDescuento.AsFloat:=0;
    QL_FDepTotalConDescto.AsFloat:=0;
    QL_FDepIvaDescuento.AsFloat:=0;
    QL_FDepSubtotalDescuento.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_FDepIEPSTpag.AsFloat:=0;
    QL_FDepSubtotalTpag.AsFloat:=0;
    QL_FDepClave.AsInteger:=0;
    QL_FDepDescripcion.AsString:='';
    QL_FDepImporte.AsFloat:=0;
    QL_FDepPorcentaje.AsFloat:=0;
    QL_FDepIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Etiquetas para saldos CXC
    QL_FDepTotalAbonoMn.AsFloat:=0;
    QL_FDepIvaAbonoMn.AsFloat:=0;
    QL_FDepCuentaCliente.AsInteger:=0;
    QL_FDepCuentaCnt.AsInteger:=0;
    QL_FDepCuentaCntVales.AsInteger:=0;
    QL_FDepCuentaDespachador.AsInteger:=0;
    QL_FDepCuentaCntCupones.AsInteger:=0;
    with DMGAS do begin
//      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiEntero1.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Add('Select DESPACHADOR As Entero1 From DGASLIQG Where ESTACION='+QL_FDepEstacion.AsString+' and FOLIO='+QL_FDepFOLIO.AsString);
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        QL_FDepDespachador.AsInteger := Q_AuxiEntero1.AsInteger;

        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_AuxiStr50.FieldKind := fkInternalCalc;
        Q_Auxi.SQL.Add('Select CTACNT As Str50 From DGASDESP Where CLAVE='+QL_FDepDespachador.AsString);
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        QL_FDepCuentaDespachador.AsString := Q_AuxiStr50.AsString;
//      finally
//        Q_Auxi.Close;
//      end;
    end;
  end;
end;

procedure TFLIQTURCcpol.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFLIQTURCcpol.QL_AbonCalcFields(DataSet: TDataSet);
begin
  QL_AbonSubTotalMn.AsFloat:=AjustaFloat(QL_AbonIMPORTEMN.AsFloat/(1+dividefloat((QL_AbonIvaCargo.asfloat-QL_AbonRetIvaCargo.AsFloat),QL_AbonSubtotalCargo.AsFloat)),2);
  QL_AbonIvaAbonoMn.AsFloat:=AjustaFloat(QL_AbonIMPORTEMN.asfloat-QL_AbonSubTotalMn.AsFloat,2);
  QL_AbonTotalAbonoMn.AsFloat:=AjustaFloat(QL_AbonSubTotalMn.AsFloat+QL_AbonIvaAbonoMn.AsFloat,2);

  QL_AbonEstacion.AsInteger:=0;
  QL_AbonCombustible.AsInteger:=0;
  QL_AbonProducto.AsInteger:=0;
  QL_AbonFecha.AsString:='';
  QL_AbonFechaAlfa.AsString:='';
  QL_AbonTurno.AsInteger:=0;
  QL_AbonCantidad.AsInteger:=0;
  QL_AbonImporteComb.AsFloat:=0;
  QL_AbonSubtotalComb.AsFloat:=0;
  QL_AbonIvaComb.AsFloat:=0;
  QL_AbonImporteProd.AsFloat:=0;
  QL_AbonSubtotalProd.AsFloat:=0;
  QL_AbonIvaProd.AsFloat:=0;
  QL_AbonCostoComb.AsFloat:=0;
  QL_AbonCostoProd.AsFloat:=0;
  QL_AbonIvaCombProd.AsFloat:=0;
  QL_AbonClavePago.AsInteger:=0;
  QL_AbonImportePago.AsFloat:=0;
  QL_AbonNoClienteCupon.AsInteger:=0;
  QL_AbonImporteCupon.AsFloat:=0;
  QL_AbonCuentaCntCupones.AsInteger:=0;
  QL_AbonCuentaDespachador.AsInteger:=0;
  QL_AbonNoClienteVale.AsInteger:=0;
  QL_AbonCuentaCntVales.AsInteger:=0;
  QL_AbonImporteVale.AsFloat:=0;
  QL_AbonCombustibleVale.AsInteger:=0;
  QL_AbonProductoVale.AsInteger:=0;
  QL_AbonGrupoCliente.AsInteger:=0;
  QL_AbonLineaAceites.AsInteger:=0;
  QL_AbonNoClienteTarjeta.AsInteger:=0;
  QL_AbonImporteTarjeta.AsFloat:=0;
  QL_AbonCuentaCntTarjeta.AsInteger:=0;
  QL_AbonTipoTarjeta.AsFloat:=0;
  QL_AbonImporteTarjetaCR.AsFloat:=0;
  QL_AbonImporteTarjetaPP.AsFloat:=0;
  QL_AbonImporteTarjetaME.AsFloat:=0;
  QL_AbonSubtotCombAntIEPS.AsFloat:=0;
  QL_AbonIEPSComb.AsFloat:=0;
  QL_AbonCombustibleCupon.AsInteger:=0;
  QL_AbonCantidadCupon.AsFloat:=0;
  QL_AbonIEPSCupon.AsFloat:=0;
  QL_AbonSubtotCupAntIEPS.AsFloat:=0;
  QL_AbonIvaCupon.AsFloat:=0;
  QL_AbonSubtotalCupon.AsFloat:=0;
  QL_AbonCuentaClienteAux.AsString:='';
  QL_AbonIEPSVale.AsFloat:=0;
  QL_AbonSubtotValeAntIEPS.AsFloat:=0;
  QL_AbonIvaVale.AsFloat:=0;
  QL_AbonSubtotalVale.AsFloat:=0;
  QL_AbonIEPSTarj.AsFloat:=0;
  QL_AbonSubtotTarjANTIEPS.AsFloat:=0;
  QL_AbonIvaTarj.AsFloat:=0;
  QL_AbonSubtotalTarj.AsFloat:=0;
  QL_AbonSerieCupon.AsString:='';
  QL_AbonSerieCFeria.AsString:='';
  QL_AbonFolioCFeria.AsInteger:=0;
  QL_AbonFechaRecupCFeria.AsString:='';
  QL_AbonImporteCFeria.AsFloat:=0;
  QL_AbonIEPSTpag.AsFloat:=0;
  QL_AbonSubtotalTpag.AsFloat:=0;
  QL_AbonClave.AsInteger:=0;
  QL_AbonIvaTpag.AsFloat:=0;
  QL_AbonDescuento.AsFloat:=0;
  QL_AbonTotalConDescto.AsFloat:=0;
  QL_AbonIvaDescuento.AsFloat:=0;
  QL_AbonSubtotalDescuento.AsFloat:=0;
end;

procedure TFLIQTURCcpol.QL_DescCalcFields(DataSet: TDataSet);
var i:integer;
    xtasa:real;
begin
  with DMCUP,DMGAS do begin
    i:=QL_DescCOMBUSTIBLE.AsInteger;
    xtasa:=xTasaIva[i];
    QL_DescSubtotalDescuento.AsFloat:=AjustaFloat((QL_DescDESCUENTO.AsFloat)/(1+xtasa/100),2);
    QL_DescIvaDescuento.AsFloat:=AjustaFloat(QL_DescDESCUENTO.AsFloat-QL_DescSubtotalDescuento.AsFloat,2);
    QL_DescCantidad.AsFloat:=0;
    QL_DescImporteComb.AsFloat:=0;
    QL_DescIEPSCOMB.AsFloat:=0;
    QL_DescCostoComb.AsFloat:=0;
    QL_DescFechaAlfa.AsString:=FechaAlf(QL_DescFecha.asdatetime);
    QL_DescSubtotCombAntIEPS.AsFloat:=0;
    QL_DescIvaComb.AsFloat:=0;
    QL_DescSubtotalComb.AsFloat:=0;
    QL_DescIvaCombProd.AsFloat:=0;
    QL_DescSubtotalProd.AsFloat:=0;
    QL_DescIvaProd.AsFloat:=0;
    QL_DescCostoProd.AsFloat:=0;
    QL_DescImporteProd.AsFloat:=0;
    QL_DescProducto.AsInteger:=0;
    QL_DescClavePago.AsInteger:=0;
    QL_DescImportePago.AsInteger:=0;
    QL_DescImporteCupon.AsInteger:=0;
    QL_DescImporteVale.AsInteger:=0;
    QL_DescNoClienteCupon.AsInteger:=0;
    QL_DescLineaAceites.AsInteger:=0;
    QL_DescNoClienteTarjeta.AsInteger:=0;
    QL_DescImporteTarjeta.AsInteger:=0;
    QL_DescTipoTarjeta.AsString:='';
    QL_DescImporteTarjetaCR.AsFloat:=0;
    QL_DescImporteTarjetaPP.AsFloat:=0;
    QL_DescImporteTarjetaME.AsFloat:=0;
    QL_DescCombustibleVale.AsInteger:=0;
    QL_DescProductoVale.AsInteger:=0;
    QL_DescCantidadVale.AsInteger:=0;
    QL_DescGrupoCliente.AsInteger:=0;
    QL_DescCombustibleCupon.AsInteger:=0;
    QL_DescCantidadCupon.AsFloat:=0;
    QL_DescIEPSCupon.AsFloat:=0;
    QL_DescSubtotCupAntIEPS.AsFloat:=0;
    QL_DescIvaCupon.AsFloat:=0;
    QL_DescSubtotalCupon.AsFloat:=0;
    QL_DescCuentaClienteAux.AsInteger:=0;

    QL_DescIEPSVale.AsFloat:=0;
    QL_DescSubtotValeAntIEPS.AsFloat:=0;
    QL_DescIvaVale.AsFloat:=0;
    QL_DescSubtotalVale.AsFloat:=0;
    QL_DescSerieCupon.AsString:='';

    QL_DescIEPSTarj.AsFloat:=0;
    QL_DescSubtotTarjAntIEPS.AsFloat:=0;
    QL_DescIvaTarj.AsFloat:=0;
    QL_DescSubtotalTarj.AsFloat:=0;
    QL_DescImporteCmb.AsFloat:=0;
// Cupon de Feria
    QL_DescSerieCFeria.AsString:='';
    QL_DescFolioCFeria.AsInteger:=0;
    QL_DescFechaRecupCFeria.AsDateTime:=0;
    QL_DescImporteCFeria.AsFloat:=0;
// Fin Cupon de Feria
// Etiquetas para Tipo de pagos <<<Inicio>>>
    QL_DescIEPSTpag.AsFloat:=0;
    QL_DescSubtotalTpag.AsFloat:=0;
    QL_DescClave.AsInteger:=0;
    QL_DescDescripcion.AsString:='';
    QL_DescImporte.AsFloat:=0;
    QL_DescPorcentaje.AsFloat:=0;
    QL_DescIvaTpag.AsFloat:=0;
// Etiquetas para Tipo de pagos <<<Fin>>>
// Fichas de Depósito
    QL_DescNoFicha.AsInteger:=0;
    QL_DescFolio_Ficha.AsInteger:=0;
    QL_DescTotal_Ficha.AsFloat:=0;
// Fin Fichas de Depósito
// Etiquetas para saldos CXC
    QL_DescTotalAbonoMn.AsFloat:=0;
    QL_DescIvaAbonoMn.AsFloat:=0;
    QL_DescCuentaCliente.AsInteger:=0;
    QL_DescCuentaCnt.AsInteger:=0;
    QL_DescCuentaCntVales.AsInteger:=0;
    QL_DescCuentaDespachador.AsInteger:=0;
    QL_DescCuentaCntCupones.AsInteger:=0;
  end;
end;

end.


