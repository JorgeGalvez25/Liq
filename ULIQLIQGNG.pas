unit ULIQLIQGNG;

interface

uses Variants, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,
  Mask,db,dbtables, DDMGEN, ImgList, DBActns, ActnList, DDM_KIOS, Master_Intf;

type
  TFLIQLIQGNG = class(TForm)
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
    Panel4: TPanel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    BbGuardar: TBitBtn;
    BbCancelar: TBitBtn;
    BbSalir: TBitBtn;
    GroupBox1: TGroupBox;
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
    LFuncion: TLabel;
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
    QL_Bomb: TQuery;
    QL_BombMANGUERA: TIntegerField;
    QL_BombPOSCARGA: TIntegerField;
    QL_BombCOMBUSTIBLE: TIntegerField;
    QL_BombISLA: TIntegerField;
    QL_BombCON_PRECIO: TIntegerField;
    QL_BombCON_POSICION: TIntegerField;
    QL_BombCON_DIGITOAJUSTE: TIntegerField;
    QL_BombIMPRESORA: TIntegerField;
    QL_BombACTIVO: TStringField;
    QL_BombIMPRIMEAUTOM: TStringField;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    Label12: TLabel;
    DBText9: TDBText;
    DBGrid4: TDBGrid;
    PopupMenu4: TPopupMenu;
    CalcularResumenCombustible1: TMenuItem;
    N5: TMenuItem;
    CargarProductos1: TMenuItem;
    QL_Prod: TQuery;
    QL_ProdCLAVE: TIntegerField;
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
    procedure DesglosedeDocumentos1Click(Sender: TObject);
    procedure ActualizarTiposdePago1Click(Sender: TObject);
    procedure Panel3Enter(Sender: TObject);
    procedure CargarPagosdeCupones1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CargarProductos1Click(Sender: TObject);
    procedure Panel3Exit(Sender: TObject);
  private
    { Private declarations }
    SwNuevo:Boolean;
    procedure DuplicaVtasTInteligente;
    procedure pagoNegativoTInte;
    procedure CalculaIEPS;
    procedure ObtenerConfLiquidaciones;
    procedure CalculaVentasConsignacion;
  public
    { Public declarations }
    Procedure PreparaForma(xNuevo:Boolean);
    Procedure SetAltaDocu;
    Procedure SetModificaDocu;
    Procedure EliminaCaptura;
  end;

var
  FLIQLIQGNG :TFLIQLIQGNG;
  ImporteTajetaBancaria : Double;
  ClaveTarjetaBancaria  : Integer;
  xMontoTarjetaPuntos   : Double;
  xClavePagoPtos        : Integer;
  xIncluirIslasValesCre :Boolean;
  xIncluirAceites       :Boolean;   
  acumEzzyGas:Double;


implementation

uses ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMGENQ,DDMLIQ, ULIQLIQG, DDMGAS,
  DDMGASQ, UGASPRODB, ULIQDESGLO, ULIQDTPAG, DDMCONS, DDMPVG, DDMCUP, ULIQLIQGN;

{$R *.DFM}

procedure TFLIQLIQGNG.ObtenerConfLiquidaciones;
begin
  with DMGAS do begin
    try
      try
        Q_Auxi.Close;
        Q_AuxiStr2.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('SELECT INCLUIR_ACEITES as Str2 FROM DGASCONFLIQ');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        xIncluirAceites := (Q_AuxiStr2.AsString = 'Si');

        Q_Auxi.Close;
        Q_AuxiStr2.FieldKind:=fkInternalCalc;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('SELECT INCLUIR_ISLAS_VC as Str2 FROM DGASCONFLIQ');
        Q_Auxi.Prepare;
        Q_Auxi.Open;
        xIncluirIslasValesCre := (Q_AuxiStr2.AsString = 'Si');
      except
        xIncluirIslasValesCre := False;
        xIncluirAceites       := False;
        MensajeInfo('Error al obtener configuración de liquidaciones');
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

Procedure TFLIQLIQGNG.EliminaCaptura;
begin
  with DMGEN,DMLIQ,DMGAS do begin
    try
      if T_Liqg.State=dsInsert then begin
        T_Liqg.cancel;
        CancelaUpdates(DBGAS2,T_Liqg);
      end
      else if T_Liqg.State=dsEdit then begin
        if SwNuevo then begin
//          T_Liqg.cancel;
//          T_Liqg.delete;
//          CancelaUpdates(DBGAS2,T_Liqg);
//          RefrescaDataBase(DBGAS2);
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

Procedure TFLIQLIQGNG.SetAltaDocu;
begin
  with DMGEN,DMLIQ,DMGASQ,DMGAS do begin
    if T_Liqg.State<>dsBrowse then
      raise Exception.Create('Error en Captura: SetAltaDocu');
    try
      IniciaDocAccion(idLiqg,'',AccNuevo);
      IniciaUpdates(DBGAS2,T_Liqg);
      T_Liqg.insert;
      T_LiqgLIQUIDAGLOBAL.AsString:='Si';
      BbGuardar.Enabled:=false;
      BbCancelar.Enabled:=false;
      Guardar1.Enabled:=false;
      Cancelar1.Enabled:=false;
      DBGrid1.DataSource:=nil;
      DBGrid2.DataSource:=nil;
      DBGrid3.DataSource:=nil;
    except
      ErrorMsg:='Liquidación '+IntToClaveDocu(T_LiqgFolio.AsInteger,idLiqg)+' ya existe';
      FLIQLIQGNG.Close;
    end;
  end;
end;

procedure TFLIQLIQGNG.SetModificaDocu;
var swerr,
    swcargaautom,
    swpago1,
    swpago2,
    swpago3,
    swpago4,
    swpago5,
    swpago6,
    SwPagoFeria:boolean;
    xp,i,xt,xcont,xindice:integer;
    xtotal:real;
    xtippago:Integer;
    xcontTran:Integer;
    pVenta:Integer;
    montoVentaTA: Double;
    _Kiosco:Integer;
    _ListaLiqAceiteKiosco:TListaLiquidacionAceites;
    _LiqAceiteKiosco:TLiquidacionAceite;
    _ListaAcumTipoPago:TListaAcumTipoPago;
    _ListaAcumTipoPagoCheq:TListaAcumTipoPagoCheq;
    _AcumTipoPago:TAcumTipoPago;
    _totalCuponesFeria:double;
    AConexion:Boolean;
    totalPromo: Double;
    pListaTransacciones:TListaTransaccionGas;
    Msj:string;
    _ErrorActualizacion:TStringList;
    xTieneTiposPagoKiosko:Boolean;
    real1:Double;

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
  with DMLIQ,DMGEN,DMGAS do begin
    swerr:=false;
    if SwNuevo then begin
      if T_Liqg.State<>dsInsert then begin
        if T_Liqg.State<>dsEdit then
          raise Exception.Create('Error en Captura: SetModificaDocu')
        else exit;
      end;
    end;
    DuplicaVtasTInteligente;
    T_Dliqp.DisableControls;
    T_Dliqa.DisableControls;
    T_Dliqp.DisableControls;
    try
      try
        if SwNuevo then begin
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
             QL_Dtur2.close;
             QL_Dtur2.SQL.Clear;
             QL_Dtur2.SQL.Add('select * from DGASDTUR2');
             QL_Dtur2.SQL.Add('where estacion='+T_LiqgEstacion.AsString);
             QL_Dtur2.SQL.Add('  and fecha='+QuotedStr(FechaToStrSQL(T_LiqgFecha.AsDateTime)));
             QL_Dtur2.SQL.Add('  and turno='+T_LiqgTurno.AsString);
             QL_Dtur2.Prepare;
             QL_Dtur2.Open;
            T_Dliqc.First;
            while not T_Dliqc.Eof do begin
              if QL_Dtur2.Locate('Isla;PosCarga;Combustible',VarArrayOf([T_DliqcISLA.AsInteger,T_DliqcPosCarga.AsInteger,T_DliqcCombustible.AsInteger]),[]) then
              begin
                try
                  swcargaautom:=true;
                  T_Dliqc.Edit;

                  //QUITAR DECIMALES
                  if (VarGasQuitarDecimalesEnCapturaLecturaFinalLiq='Si')
                  then T_DliqcLec_Act.AsFloat:=AjustaFloat(QL_Dtur2Final_Litros.AsFloat,0)
                  else T_DliqcLec_Act.AsFloat:=QL_Dtur2Final_Litros.AsFloat;

                  CalculaVentasConsignacion;
                  FLIQLIQGN.CalculaDiferenciaLectura;
                  T_Dliqc.Post;
                except
                  if T_Dliqc.State=dsEdit then T_Dliqc.Cancel;
                end;
              end;
              T_Dliqc.Next;
            end;
          end;
          // Fin lect
          if not swcargaautom then with DMCONS do begin
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
                    xtotal:=QL_TurndTotal01.AsFloat;
                    QL_Bomb.First;
                    while (not QL_Bomb.Eof)and(QL_BombPosCarga.AsInteger<>T_DliqcPosCarga.AsInteger) do
                      QL_Bomb.Next;
                    if (QL_BombPosCarga.AsInteger=T_DliqcPosCarga.AsInteger)and(QL_BombCombustible.AsInteger<>T_DliqcCombustible.AsInteger) then
                      xtotal:=QL_TurndTotal02.AsFloat;
                    if (xtotal>0.01) then begin
                      try
                        T_Dliqc.Edit;

                        //QUITAR DECIMALES
                        if (VarGasQuitarDecimalesEnCapturaLecturaFinalLiq='Si')
                        then T_DliqcLec_Act.AsFloat:=AjustaFloat(xtotal,0)
                        else T_DliqcLec_Act.AsFloat:=xtotal;

                        CalculaVentasConsignacion;
                        FLIQLIQGN.CalculaDiferenciaLectura;
                        T_Dliqc.Post;
                      except
                        if T_Dliqc.State=dsEdit then
                          T_Dliqc.Cancel;
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
          end;
        end;

// Carga Pagos
        swpago1:=false; swpago2:=false; swpago3:=false; swpago4:=false; swpago5:=false; swpago6:=false; SwPagoFeria:=False;
        T_Dliqp.First;
        while (not T_Dliqp.Eof)and((not swpago1)or(not swpago2)or(not swpago3)or(not swpago4)or(not swpago5)or(not swpago6)) do begin
          if (T_DliqpCLAVE_PAGO.AsString=VarGasTPagoTI) and (T_DliqpClasePago.AsString='Otros') and (SwNuevo) then
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
            //Q_Auxi.SQL.Add('  and Isla_pvg='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:=real1;
            T_Dliqp.Post;
            swpago1:=true;
          end;
          if (T_DliqpClasePago.AsString=idClaseTarjIntCre)or
             (T_DliqpClasePago.AsString=idClaseTarjeta) and (SwNuevo)  then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
            Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
            //Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('  and estatus="A"');
            Q_Auxi.SQL.Add('  and Cliente in (Select NoClie from DGASSALD where TipoTarjeta="CR")');
            Q_Auxi.Active:=true;  
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:=real1;
            T_Dliqp.Post;
            swpago2:=true;
          end;
          if (T_DliqpClasePago.AsString=idClaseTarjIntPre) and (SwNuevo)  then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
            Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
            //Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('  and estatus="A"');
            Q_Auxi.SQL.Add('  and Cliente in (Select NoClie from DGASSALD where TipoTarjeta="PP")');
            if CteEzzyGas>0 then
              Q_Auxi.SQL.Add('and Cliente<>'+IntToStr(CteEzzyGas));
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:=real1;  
            T_Dliqp.Post;
            swpago3:=true;
          end;
          if (T_DliqpClasePago.AsString=idClaseTarjIntME) and (SwNuevo) then begin
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(total) as real1 from DGASTRAN');
            Q_Auxi.SQL.Add('where estacion='+inttostr(T_LiqgEstacion.asinteger));
            Q_Auxi.SQL.Add('  and fecha="'+FechaToStrSQL(T_LiqgFecha.asdatetime)+'"');
            Q_Auxi.SQL.Add('  and turnoliq='+inttostr(T_LiqgTurno.asinteger));
            //Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.SQL.Add('  and estatus="A"');
            Q_Auxi.SQL.Add('  and Cliente in (Select NoClie from DGASSALD where TipoTarjeta="ME")');
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:=real1;
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
            //if not (xIncluirIslasValesCre) then
            //  Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
            Q_Auxi.Active:=true;
            real1:=Q_AuxiReal1.AsFloat;
            T_Dliqp.Edit;
            T_DliqpImporte.Asfloat:=real1;
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
            //Q_Auxi.SQL.Add('and Isla='+IntToStr(T_LiqgIsla.asinteger));
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
        T_Dliqp.First;
        if xIncluirAceites then begin
         // Agregar las venta que se realizan en el KIOSKO
          if SistemaActivo2(idKio) then begin
            if SwServiciosMaster then begin
              // Carga Aceites y Derivados
              if SwNuevo then begin
                _ListaLiqAceiteKiosco:=GetLiquidacionesAceite(T_LiqgESTACION.AsInteger,T_LiqgFECHA.AsDateTime,
                                                              T_LiqgISLA.AsInteger,T_LiqgTURNO.AsInteger,True,AConexion);
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
                if _ListaLiqAceiteKiosco<>nil then
                  _ListaLiqAceiteKiosco.Free;
              end;
              // Cargar los Tipos de Pagos de Combustible
              ImporteTajetaBancaria := 0;
              ClaveTarjetaBancaria := 0;
              with DMGAS do begin
                if SwNuevo then begin
                  try
                    _Kiosco:=GetKioscoIsla(T_LiqgISLA.AsInteger);
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
                      if T_Dliqp.Locate('Estacion;Turno;Clave_pago',VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgTurno.asinteger,IntToStr(xtippago)]),[]) then begin
                        if (T_DliqpClasePago.AsString<>'Vale de Crédito') and (T_DliqpClasePago.AsString<>'Cupón') and (T_DliqpClasePago.AsString<>'Tarjeta Prepago')
                         and (T_DliqpClasePago.AsString<>'Tarjeta Crédito') then begin
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
                            if T_TarjTipoMonto.AsString='Litros' then
                              T_TranBITACORA.AsString:=T_TranBITACORA.AsString+'/'+FloatToStr(T_TranLitros.AsFloat)
                            else
                               T_TranBITACORA.AsString:=T_TranBITACORA.AsString+'/'+FloatToStr(T_TranIMPORTECMB.AsFloat);
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
           // Fin del Agregado de las ventas que se realizaron en el KIOSKO.
          end;
        end;
                with DMGAS do begin
          if SwNuevo then begin      //Codigo Aux
            try
              _Kiosco:=GetKioscoIsla(T_LiqgISLA.AsInteger);
              if not (VarGasExportarTipoPago = 'No') then begin
                    //Acumulamos tipos de pago volumétricos
                    //_ListaAcumTipoPago:=GetAcumuladosVentasPorTipoPagoLiquidables(T_LiqgFECHA.AsDateTime,_Kiosco,T_LiqgTURNO.AsInteger,'Si');
                    _ListaAcumTipoPago:=GetAcumTipoPagoVolumetrico(T_LiqgFECHA.AsDateTime,T_LiqgTURNO.AsInteger, 0);
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
                      _totalCuponesFeria:=GetTotalFeriaCuponesTurno(T_LiqgESTACION.AsInteger,0,T_LiqgFECHA.AsDateTime,T_LiqgTURNO.AsInteger,AConexion);//_Kiosco,T_LiqgFECHA.AsDateTime,T_LiqgTURNO.AsInteger,AConexion);
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
                          T_Dliqp.Edit;
                          T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat+_AcumTipoPago.Importe;
                          T_Dliqp.Post;
                        end;
                      end else begin
                        if T_Dliqp.Locate('Estacion;Turno;Clave_pago',VarArrayOf([T_LiqgEstacion.asinteger,T_LiqgTurno.asinteger,IntToStr(xtippago)]),[]) then begin
                          if (T_DliqpClasePago.AsString<>'Vale de Crédito') and (T_DliqpClasePago.AsString<>'Cupón') and (T_DliqpClasePago.AsString<>'Tarjeta Prepago')
                           and (T_DliqpClasePago.AsString<>'Tarjeta Crédito') and (T_DliqpClasePago.AsString<>'Ezzygas') then begin
                            T_Dliqp.Edit;
                            T_DliqpIMPORTE.AsFloat:=T_DliqpIMPORTE.AsFloat+_AcumTipoPago.Importe;
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
            except
            end;
          end;
        end;
  // Realiza los calculos del IEPS
          if (DMCUP.SwSubModuloCupReformas2008) then
            CalculaIEPS;
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
        ErrorMsg:='Isla ya fue Liquidada '+IntToClaveNum(T_LiqgIsla.AsInteger,3);
        EliminaCaptura;
        swerr:=true;
        DBGrid1.DataSource:=nil;
        DBGrid2.DataSource:=nil;
        DBGrid3.DataSource:=nil;
        raise;
      end;
    finally
      T_Dliqp.EnableControls;
      T_Dliqa.EnableControls;
      T_Dliqp.EnableControls;
    end;
  end;
end;

procedure TFLIQLIQGNG.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQLIQGNG.Guardar1Click(Sender: TObject);
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
    if not TotalDesgloseOk then begin
      MensajeErr('Desglose de Documentos no es igual al Importe del Pago');
      PageControl1.ActivePageIndex:=2;
      DBGrid3.setfocus;
      exit;
    end;
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
        PageControl1.ActivePageIndex:=0;
        DBEdit1.SetFocus;
      end
      else
        FLIQLIQGNG.Close;
    end;
  end;
end;

procedure TFLIQLIQGNG.PreparaForma(xNuevo:Boolean);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if VarGasDiferenciaLectura then
      begin
          DBGrid1.Columns[6].Visible  := true;
          DBGrid1.Columns[6].ReadOnly := True;
      end
    else
      DBGrid1.Columns[6].Visible := false;

    TM_Dliqc.Active:=true;
    TM_Dliqc.SortOnFields('Combustible',true,false);
    SwCalculaResumen:=false;
    DBGrid1.ReadOnly:=VarLiqTurnoRestringido;
    DBGrid2.ReadOnly:=VarLiqTurnoRestringido;
    SwNuevo:=xNuevo;
    ObtenerConfLiquidaciones;
    if SwNuevo then
      SetAltaDocu
    else
      SetModificaDocu;
  end;
end;

procedure TFLIQLIQGNG.FormShow(Sender: TObject);
begin
  with DMLIQ,DMGASQ do begin
    PageControl1.Pages[1].Visible:=False;
    if VarLiqTurnoRestringido then
      PageControl1.ActivePageIndex:=2
    else
      PageControl1.ActivePageIndex:=0;
    FLIQLIQGNG.Caption:=Caption+LLenaStr(QT_TurcADescripTurno.AsString,'D',100,' ');
    if SwNuevo then
      DBEdit1.SetFocus
    else begin
      DBEdit1.ReadOnly:=true;
      DBEdit3.ReadOnly:=true;
      DBEdit5.ReadOnly:=true;
      if VarLiqTurnoRestringido then DBGrid3.SetFocus
      else DBGrid1.SetFocus;
    end;
  end;
end;

procedure TFLIQLIQGNG.DBGrid1Exit(Sender: TObject);
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

procedure TFLIQLIQGNG.DBGrid1Enter(Sender: TObject);
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

procedure TFLIQLIQGNG.FormCloseQuery(Sender: TObject;
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

procedure TFLIQLIQGNG.GroupBox2Enter(Sender: TObject);
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

procedure TFLIQLIQGNG.Cancelar1Click(Sender: TObject);
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

procedure TFLIQLIQGNG.DBGrid2Exit(Sender: TObject);
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

procedure TFLIQLIQGNG.InsertarRenglon2Click(Sender: TObject);
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

procedure TFLIQLIQGNG.EliminarRenglon2Click(Sender: TObject);
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

procedure TFLIQLIQGNG.CancelarCambios2Click(Sender: TObject);
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

procedure TFLIQLIQGNG.Inicio2Click(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqp.First;
  end;
end;

procedure TFLIQLIQGNG.Inicio3Click(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqa.First;
  end;
end;

procedure TFLIQLIQGNG.Fin2Click(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqp.Last;
  end;
end;

procedure TFLIQLIQGNG.Fin3Click(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqa.Last;
  end;
end;

procedure TFLIQLIQGNG.DBGrid3Exit(Sender: TObject);
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

procedure TFLIQLIQGNG.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DMGAS,DMLIQ do begin
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
end;

procedure TFLIQLIQGNG.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFLIQLIQGNG.DBLookupComboBox2Exit(Sender: TObject);
begin
  with DMLIQ do begin
    PageControl1.ActivePageIndex:=0;
    if not T_Dliqc.IsEmpty then begin
      T_Liqg.Refresh;
      T_Liqg.Edit;
      DbGrid1.SetFocus;
    end;
  end;
end;

procedure TFLIQLIQGNG.DataSetDelete2Execute(Sender: TObject);
begin
  with DMLIQ do begin
    T_Dliqa.Delete;
  end;
end;

procedure TFLIQLIQGNG.DBGrid2KeyDown(Sender: TObject; var Key: Word;
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

procedure TFLIQLIQGNG.DBLookupComboBox2Enter(Sender: TObject);
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

procedure TFLIQLIQGNG.QL_DespFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=QL_DespEstacion.AsInteger=DMLIQ.T_LiqgEstacion.AsInteger;
end;

procedure TFLIQLIQGNG.DBEdit1Change(Sender: TObject);
begin
  QL_Desp.Close;
  QL_Desp.Prepare;
  QL_Desp.Open;
end;

procedure TFLIQLIQGNG.DBGrid2DblClick(Sender: TObject);
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

procedure TFLIQLIQGNG.DesglosedeDocumentos1Click(Sender: TObject);
begin
  with DMGAS, DMLIQ do begin
    if T_DliqpDesglosa.AsString='Si' then begin
      T_Dliqp.Edit;
      FLIQDTPAG.ShowModal;
    end;
  end;
end;

procedure TFLIQLIQGNG.ActualizarTiposdePago1Click(Sender: TObject);
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
          T_DliqpFecha.AsDateTime:=T_Liqgfecha.AsDateTime;
          T_DliqpTurno.AsInteger:=T_LiqgTurno.AsInteger;
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

procedure TFLIQLIQGNG.Panel3Enter(Sender: TObject);
begin
  with DMLIQ,DMGEN do begin
    DBEdit1.ReadOnly:=false;
    DBEdit3.ReadOnly:=false;
    DBEdit5.ReadOnly:=false;
    if (T_Liqg.state<>dsinsert)and(T_Liqg.state<>dsedit) then begin
      try
        SetAltaDocu;
      except
        FLIQLIQGNG.Close;
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

procedure TFLIQLIQGNG.CargarPagosdeCupones1Click(Sender: TObject);
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
      if not (xIncluirIslasValesCre) then
        Q_Auxi.SQL.Add('  and Isla='+IntToStr(T_LiqgIsla.asinteger));
      Q_Auxi.Active:=true;
      T_Dliqp.Edit;
      T_DliqpImporte.Asfloat:=Q_AuxiReal1.AsFloat;
      T_Dliqp.Post;
    end;
  end;
end;

procedure TFLIQLIQGNG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  DMLIQ.TM_Dliqc.EmptyTable;
end;

procedure TFLIQLIQGNG.CargarProductos1Click(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    QL_Prod.Close;
    QL_Prod.Prepare;
    QL_Prod.Open;
    while not QL_Prod.Eof do begin
      T_Dliqa.Insert;
      T_DliqaProducto.AsInteger:=QL_ProdClave.AsInteger;
      T_Dliqa.Post;
      QL_Prod.Next;
    end;
  end;
end;

procedure TFLIQLIQGNG.Panel3Exit(Sender: TObject);
begin
  if DBEdit1.Text='' then
   DBEdit1.SetFocus;
end;

procedure TFLIQLIQGNG.DuplicaVtasTInteligente;
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

procedure TFLIQLIQGNG.pagoNegativoTInte;
begin
  with DMGAS,DMLIQ do begin
    if (NoElemStrSep(VarGasCteTICteTIOri,';')=2) and (VarGasTPagoTI<>'') then begin
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
      T_Dliqp.Edit;
      T_DliqpImporte.Asfloat:=T_DliqpImporte.Asfloat-Q_AuxiReal1.AsFloat;
      T_Dliqp.Post;
    end;
  end;
end;

procedure TFLIQLIQGNG.CalculaIEPS;
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

procedure TFLIQLIQGNG.CalculaVentasConsignacion;
begin
  with DMCONS do begin
    Q_Auxi.Close;
    Q_AuxiREAL1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT SUM(VOLUMEN) AS REAL1 FROM DPVGMOVI WHERE FECHATURNO=:FECHATURNO');
    Q_Auxi.SQL.Add('AND TURNO=:TURNO AND POSCARGA=:POSCARGA AND COMBUSTIBLE=:COMBUSTIBLE AND CONSIGNACION=:CONSIGNACION');
    Q_Auxi.ParamByName('FECHATURNO').AsDateTime:=DMLIQ.T_DliqcFECHA.AsDateTime;
    Q_Auxi.ParamByName('TURNO').AsInteger:=DMLIQ.T_DliqcTURNO.AsInteger;
    Q_Auxi.ParamByName('POSCARGA').AsInteger:=DMLIQ.T_DliqcPosCarga.AsInteger;
    Q_Auxi.ParamByName('COMBUSTIBLE').AsInteger:=DMLIQ.T_DliqcCOMBUSTIBLE.AsInteger;
    Q_Auxi.ParamByName('CONSIGNACION').AsString:='Si';
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    DMLIQ.T_DliqcCONSIGNACION.AsFloat:= Q_AuxiREAL1.AsFloat;
  end;
end;

end.

