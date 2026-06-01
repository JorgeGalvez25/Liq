unit ULIQLIQGR;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,db,
  Mask, DBTables, ToolWin, ImgList, QuickRpt, dxNavBarBase, dxNavBarCollns,
  dxNavBar, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxTextEdit, cxCurrencyEdit, cxContainer, cxImage, dxNavBarStyles,
  cxCheckBox;

type
  TFLIQLIQGR = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    PrintDialog1: TPrintDialog;
    QL_Liqg: TQuery;
    DSQL_Liqg: TDataSource;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Editar1: TMenuItem;
    NuevaLiquidacion: TMenuItem;
    N1: TMenuItem;
    MiImprimir: TMenuItem;
    CancelarLiquidacion: TMenuItem;
    MiPrever: TMenuItem;
    N2: TMenuItem;
    Salir1: TMenuItem;
    ModificarLiquidacion: TMenuItem;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    DSQL_Desp: TDataSource;
    Herramientas1: TMenuItem;
    MiImprimirD: TMenuItem;
    PreverDesglosedeDocumentos1: TMenuItem;
    PopupMenu1: TPopupMenu;
    PreverDesglosedeDocumentos2: TMenuItem;
    PMImprimirD: TMenuItem;
    QL_LiqgISLA: TIntegerField;
    QL_LiqgFOLIO: TIntegerField;
    QL_LiqgFECHA: TDateTimeField;
    QL_LiqgDESPACHADOR: TIntegerField;
    QL_LiqgTOTGAS: TFloatField;
    QL_LiqgTOTALMA: TFloatField;
    QL_LiqgTOTGRAL: TFloatField;
    QL_LiqgTOTPAGO: TFloatField;
    QL_LiqgNOMBREDESP: TStringField;
    QL_LiqgDescripTurno: TStringField;
    QL_LiqgESTACION: TIntegerField;
    QL_LiqgTURNO: TIntegerField;
    Panel6: TPanel;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNuevaLiquidacion: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBarImprimir: TdxNavBarItem;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Item6: TdxNavBarItem;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ISLA: TcxGridDBColumn;
    cxGrid1DBTableView1FOLIO: TcxGridDBColumn;
    cxGrid1DBTableView1FECHA: TcxGridDBColumn;
    cxGrid1DBTableView1DESPACHADOR: TcxGridDBColumn;
    cxGrid1DBTableView1TOTGAS: TcxGridDBColumn;
    cxGrid1DBTableView1TOTALMA: TcxGridDBColumn;
    cxGrid1DBTableView1TOTGRAL: TcxGridDBColumn;
    cxGrid1DBTableView1TOTPAGO: TcxGridDBColumn;
    cxGrid1DBTableView1NOMDESP: TcxGridDBColumn;
    dxNavBar1StyleItem1: TdxNavBarStyleItem;
    dxNavBar1Group4: TdxNavBarGroup;
    dxNavBar1Group4Control: TdxNavBarGroupControl;
    CheckBox1: TCheckBox;
    dxLiquidacionGlobal: TdxNavBarItem;
    GenerarLiquidacionGlobal1: TMenuItem;
    PreverDesglosedeEfectivo1: TMenuItem;
    ImprimirDesglosedeEfectivo1: TMenuItem;
    N3: TMenuItem;
    PreverDesglosedeEfectivo2: TMenuItem;
    ImprimirDesglosedeEfectivo2: TMenuItem;
    QL_LiqgTotGasAju: TFloatField;
    QL_LiqgTotGralAju: TFloatField;
    QL_LiqgTotPagoAju: TFloatField;
    cxGrid1DBTableView1TOTDESC: TcxGridDBColumn;
    cxGrid1DBTableView1TOTNETO: TcxGridDBColumn;
    QL_LiqgTOTDESC: TFloatField;
    QL_LiqgTotNeto: TFloatField;
    procedure Salir1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NuevaLiquidacionClick(Sender: TObject);
    procedure DepurarFolio1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CancelarLiquidacionClick(Sender: TObject);
    procedure ModificarLiquidacionClick(Sender: TObject);
    procedure MiPreverClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QL_LiqgCalcFields(DataSet: TDataSet);
    procedure BarMiImprimir(Sender: TObject);
    procedure GenerarLiquidacionGlobal1Click(Sender: TObject);
    procedure PreverDesglosedeEfectivo1Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    pFecha:TdateTime;
    pTurno:word;
    procedure RefrescaTabla;
    procedure PreparaForma;
  end;

var
  FLIQLIQGR: TFLIQLIQGR;

implementation

uses ULIBGRAL, DDMGEN, UGEN_NET,ULIBPRINT, ULIBDATABASE, DDMGAS, DDMGASQ, DDMCUP, DDMGENQ, UFormaPreverTxt,
  DDMLIQ, ULIQLIQGN, ULIQLIQGI, ULIQTURC, ULIQLIQIDesglo, ULIQLIQGNG,
  ULIQLIQGIDesgloE, ULIQLIQGIBLOQ, DDM_PUNTOS;

{$R *.DFM}

procedure TFLIQLIQGR.PreparaForma;
begin
  with FLIQTURC,DMGEN,DMCUP,DMGAS,DMGASQ,DMLIQ do begin
    swTurnoLectura:=True;
    TL_Isla.Active:=true;
    T_Prod.Active:=true;
    T_Liqg.Active:=true;
    T_Dliqc.Active:=true;
    T_Dliqa.Active:=true;
    T_Dliqp.Active:=true;
    T_Dtpag.Active:=true;
    T_Dliqe.Active:=true;
//    ModoConsulta:=false;
//    if (QT_Turca.IsEmpty)and(pTurno>0) then begin
//      ModoConsulta:=true;
//    end
//    else begin
      FLIQLIQGR.pFecha:=QL_TurcFecha.AsDateTime;
      FLIQLIQGR.pTurno:=QL_TurcTurno.AsInteger;
//    end;
//      if not QT_Turca.IsEmpty then begin
//        pFecha:=QT_TurcaFecha.AsDateTime;
//        pTurno:=QT_TurcaTurno.AsInteger;
//      end
//      else
//        raise Exception.Create('No existe turno abierto');
//    FLIQLIQGR.Caption:='Liquidaciones solo lectura.';
    if ModoConsulta then FLIQLIQGR.Caption:=FLIQLIQGR.Caption+'  [Modo Consulta Fecha: '+FechaPaq(pFecha)+' Turno: '+InttoStr(pTurno)+' ]';
//  Bevel1.Visible:=not ModoConsulta;
    VarLiqTurnoRestringido:=TurnoEsRestringido;
    if not(DMGAS.ValidaModulo(idDesc)) and not(DMGAS.VarGasSistemaGulfActivo = 'Si') and not(DM_PUNTOS.LicenciaEsValidaPuntos) then begin
      Self.Width := Self.Width-132;
      cxGrid1DBTableView1TOTDESC.Visible := False;
      cxGrid1DBTableView1TOTNETO.Visible := False;
    end;
  end;
end;

procedure TFLIQLIQGR.RefrescaTabla;
var
  SwLiquidacionGlobal:Boolean;
begin
  with DMGEN,DMGASQ,DMGAS,DMLIQ do begin
    if not VsAccesoRemoto then
      RefrescaQuery(QT_Turca);
    SwLiquidacionGlobal:=False;

    QL_Liqg.Close;
    QL_Liqg.SQL.Clear;
    QL_Liqg.SQL.Add('Select l.Estacion,l.Isla,l.Folio,l.turno,l.Fecha,l.Despachador,l.Totgas,l.Totalma,l.Totgral,l.Totpago,');
    QL_Liqg.SQL.Add('   p.Nombre As NombreDesp,');
    //QL_Liqg.SQL.Add('   coalesce(sum(d.descuento),0) As TotDesc'); 
    QL_Liqg.SQL.Add(' coalesce((select sum(d.descuento) from dgasdescd d  ');
    QL_Liqg.SQL.Add(' where l.estacion=d.estacion  ');
    QL_Liqg.SQL.Add('         and l.fecha=d.fecha ');
    QL_Liqg.SQL.Add('             and l.turno=d.turno ');
    QL_Liqg.SQL.Add('                 and l.isla=d.isla),0) As TotDesc ');
    QL_Liqg.SQL.Add('from DGASLIQG l');
    QL_Liqg.SQL.Add('left join dgasdesp p on l.despachador=p.clave');
    //QL_Liqg.SQL.Add('full join dgasdescd d on l.estacion=d.estacion and l.fecha=d.fecha and l.turno=d.turno and l.isla=d.isla');
    QL_Liqg.SQL.Add('Where l.Estacion='+IntToStr(EstacionActual));
    QL_Liqg.SQL.Add('   and l.Caja='+IntToStr(CajaActual));
    QL_Liqg.SQL.Add('   and l.Fecha="'+FechaToStrSQL(pFecha)+'"');
    QL_Liqg.SQL.Add('   and l.Turno='+InttoStr(pTurno));
    QL_Liqg.SQL.Add('group by l.Estacion,l.Isla,l.Folio,l.turno,l.Fecha,l.Despachador,l.Totgas,l.Totalma,l.Totgral,l.Totpago,');
    QL_Liqg.SQL.Add('   p.Nombre');
    QL_Liqg.SQL.Add('order by l.isla desc');
    QL_Liqg.Prepare;
    QL_Liqg.Open;

    //verifica que si ya existe una liquidacion global ya no se pueda capturar una liquidacion
    try
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('Select count(*) as Entero1');
      Q_Auxi.SQL.Add(' from DGASLIQG');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(CajaActual));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(pFecha)+'"');
      Q_Auxi.SQL.Add('  and Turno='+InttoStr(pTurno));
      Q_Auxi.SQL.Add('  and LiquidaGlobal='+QuotedStr('Si'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger>0 then begin
        GenerarLiquidacionGlobal1.Enabled:=false;
        dxLiquidacionGlobal.Enabled:=False;
        NuevaLiquidacion.Enabled:=False;
        dxNuevaLiquidacion.Enabled:=False;
        SwLiquidacionGlobal:=True;
      end
      else begin
//        GenerarLiquidacionGlobal1.Enabled:=True;
//        dxLiquidacionGlobal.Enabled:=True;
//        NuevaLiquidacion.Enabled:=True;
//        dxNuevaLiquidacion.Enabled:=True;
      end;
    finally
      Q_Auxi.Close;
    end;
    //verifica que si ya existe una liquidacion por isla ya no se pueda capturar una liquidacion global
    try
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('Select count(*) as Entero1');
      Q_Auxi.SQL.Add(' from DGASLIQG');
      Q_Auxi.SQL.Add('Where Estacion='+IntToStr(EstacionActual));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(CajaActual));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(pFecha)+'"');
      Q_Auxi.SQL.Add('  and Turno='+InttoStr(pTurno));
      Q_Auxi.SQL.Add('  and LiquidaGlobal='+QuotedStr('No'));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiEntero1.AsInteger>0 then begin
        GenerarLiquidacionGlobal1.Enabled:=false;
        dxLiquidacionGlobal.Enabled:=False;
      end
      else begin
        if not SwLiquidacionGlobal then begin
          GenerarLiquidacionGlobal1.Enabled:=True;
          dxLiquidacionGlobal.Enabled:=True;
        end;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQLIQGR.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQLIQGR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QL_Liqg.Close;
  DMGAS.swTurnoLectura:=False;
end;

procedure TFLIQLIQGR.NuevaLiquidacionClick(Sender: TObject);
begin
//  with DMGEN,DMCUP,DMGASQ,DMGAS,DMLIQ do begin
//    RefrescaQuery(QT_Turca);
//    if QT_Turca.IsEmpty then
//      raise Exception.Create('No existe turno abierto');
//    if CajeroActual<>QT_TurcaCajero.AsInteger then
//      raise Exception.Create('Usuario no es el Cajero del turno');
//    if VarLiqTurnoRestringido then
//      raise Exception.Create('Turno Restringido');
//    if VarGasPolizaLiqDia='Si' then begin
//      Q_Auxi.Close;
//      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
//      Q_Auxi.SQL.Clear;
//      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC');
//      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QT_TurcaEstacion.AsInteger));
//      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QT_TurcaCaja.AsInteger));
//      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QT_TurcaFecha.AsDateTime)+'"');
//      Q_Auxi.SQL.Add('  and Contabilizado="Si" ');
//      Q_Auxi.Prepare;
//      Q_Auxi.Open;
//      if Q_AuxiEntero1.AsInteger>0 then
//        raise Exception.Create('Dia ya está contabilizado');
//    end;
//    Application.CreateForm(TFLIQLIQGN,FLIQLIQGN);
//    try
//      FLIQLIQGN.PreparaForma(true);
//      FLIQLIQGN.showmodal;
//    finally
//      LimpiaDocAccion;
//      FLIQLIQGN.Free;
//      RefrescaTabla;
//    end;
//  end;
end;

procedure TFLIQLIQGR.DepurarFolio1Click(Sender: TObject);
begin
  with DMGEN,DMLIQ,DMGASQ,DMGAS do begin
    RefrescaQuery(QT_Turca);
    if QT_Turca.IsEmpty then
      raise Exception.Create('No existe turno abierto');
    if not LocalizaTabla(T_Liqg,'Estacion;Folio',
                          VarArrayOf([QL_LiqgEstacion.AsInteger,QL_LiqgFolio.AsInteger])) then
      raise Exception.Create('No encuentro liquidación '+QL_LiqgFolio.AsString);
    if MensajeConf('Desea ELIMINAR esta Liquidación '+T_LiqgFolio.asstring+'?')=mrYes then begin
      try
        IniciaDocAccion(idDocu,IntToClaveNum(T_LiqgEstacion.asinteger,2)+'-'+T_LiqgFolio.AsString,AccEliminar);
        IniciaUpdates(DBGAS2,T_Liqg);
        T_Liqg.delete;
        AplicaUpdates(DBGAS2,T_Liqg);
        FinalizaDocAccion;
        RefrescaTabla;
      except
        CancelaDocAccion;
        CancelaUpdates(DBGAS2,T_Liqg);
        raise;
      end;
    end;
  end;
end;

procedure TFLIQLIQGR.SpeedButton2Click(Sender: TObject);
begin
  RefrescaDataBase(DMGAS.DBGAS1);
  RefrescaDataBase(DMGAS.DBGAS2);
  RefrescaTabla;
end;

procedure TFLIQLIQGR.CancelarLiquidacionClick(Sender: TObject);
begin
  with DMGEN,DMLIQ,DMGASQ,DMGAS do begin
    RefrescaQuery(QT_Turca);
//    if QT_Turca.IsEmpty then
//      raise Exception.Create('No existe turno abierto');
    if not LocalizaTabla(T_Liqg,'Estacion;Folio',
                          VarArrayOf([QL_LiqgEstacion.AsInteger,QL_LiqgFolio.AsInteger])) then
      raise Exception.Create('No encuentro liquidación '+QL_LiqgFolio.AsString);
    if VarLiqTurnoRestringido then
      raise Exception.Create('Turno Restringido');
//    ChecaDerechoDocu(drEliminar,idLiqg,FechaTrabajo);
    if MensajeConf('Desea CANCELAR esta Liquidacion '+IntToClaveNum(QL_LiqgEstacion.asinteger,2)+'-'+IntToClaveNum(QL_LiqgFolio.AsInteger,6)+'?')=mrYes then begin
      try
        IniciaDocAccion(idLiqg,T_LiqgLiquidacionStr.AsString,AccEliminar);
        IniciaUpdates(DBGAS2,T_Liqg);
        T_Liqg.edit;
        T_LiqgAplicado.AsString:='No';
        T_Liqg.Post;
        T_Liqg.Delete;
        AplicaUpdates(DBGAS2,T_Liqg);
        FinalizaDocAccion;
        RefrescaTabla;
      except
        CancelaDocAccion;
        CancelaUpdates(DBGAS2,T_Liqg);
        raise;
      end;
    end;
  end;
end;

procedure TFLIQLIQGR.ModificarLiquidacionClick(Sender: TObject);
var bm:TbookMark;
begin
//  with DMGEN,DMCUP,DMGASQ,DMGAS,DMLIQ do begin
//    RefrescaQuery(QT_Turca);
//    if QT_Turca.IsEmpty then
//      raise Exception.Create('No existe turno abierto');
//    if (FechaTrabajo<>QT_TurcaFecha.AsDateTime)and(VarGasPermitirMovimientosAnteriores='No') then
//
//      raise Exception.Create('Fecha del Turno difiere de Fecha de Trabajo');
//    if CajeroActual<>QT_TurcaCajero.AsInteger then
//      raise Exception.Create('Usuario no es el Cajero del turno');
//    if not LocalizaTabla(T_Liqg,'Estacion;Folio',
//                          VarArrayOf([QL_LiqgEstacion.AsInteger,QL_LiqgFolio.AsInteger])) then
//      raise Exception.Create('No encuentro liquidación '+QL_LiqgFolio.AsString);
////    ChecaDerechoDocu(drModificar,idLiqg,FechaTrabajo);
//    Application.CreateForm(TFLIQLIQGN,FLIQLIQGN);
//    try
//      bm:=QL_Liqg.GetBookmark;
//      IniciaDocAccion(idLiqg,T_LiqgLiquidacionStr.AsString,AccModificar);
//      FLIQLIQGN.PreparaForma(false);
//      FLIQLIQGN.showmodal;
//      RefrescaTabla;
//    finally
//      LimpiaDocAccion;
//      QL_Liqg.GotoBookmark(bm);
//      QL_Liqg.FreeBookmark(bm);
//      FLIQLIQGN.Free;
//    end;
//  end;
end;

procedure TFLIQLIQGR.MiPreverClick(Sender: TObject);
var bm:tbookmark;
begin
  with DMLIQ do begin
    if not LocalizaTabla(T_Liqg,'Estacion;Folio',
                          VarArrayOf([QL_LiqgEstacion.AsInteger,QL_LiqgFolio.AsInteger])) then
      raise Exception.Create('No encuentro liquidación '+QL_LiqgFolio.AsString);
    try
      QL_Liqg.DisableControls;
      bm:=QL_Liqg.GetBookmark;
      if ((T_LiqgBLOQUEADO.AsString <> 'Si')and(not GetHayAjusteEnElDia(T_LiqgESTACION.AsInteger,T_LiqgFECHA.AsDateTime))) and (not(DMGEN.QT_EmprSERIEKEY.AsInteger=485)) then begin
        Application.CreateForm(TFLIQLIQGI,FLIQLIQGI);
        try
          FLIQLIQGI.SwIncluirPagare:=CheckBox1.Checked;
          FLIQLIQGI.PreparaReporte;

          if (Sender=MiImprimir)or(sender=dxNavBarImprimir)  then
            FLIQLIQGI.QuickRep1.Print
          else
            FLIQLIQGI.QuickRep1.Preview;
        finally
          FLIQLIQGI.Free;
        end;
      end
      else begin
        Application.CreateForm(TFLIQLIQGIBLOQ,FLIQLIQGIBLOQ);
        try
          FLIQLIQGIBLOQ.SwIncluirPagare:=CheckBox1.Checked;
          FLIQLIQGIBLOQ.PreparaReporte;

          if (Sender=MiImprimir)or(sender=dxNavBarImprimir)  then
            FLIQLIQGIBLOQ.QuickRep1.Print
          else
            FLIQLIQGIBLOQ.QuickRep1.Preview;
        finally
          FLIQLIQGIBLOQ.Free;
        end;
      end;
    finally
      QL_Liqg.GotoBookmark(bm);
      QL_Liqg.FreeBookmark(bm);
      QL_Liqg.EnableControls;
    end;
  end;
end;

procedure TFLIQLIQGR.FormShow(Sender: TObject);
begin
  with DMGAS,DMLIQ,DMGASQ do begin
    RefrescaTabla;
    if VarLiqTurnoRestringido then FLIQLIQGR.Caption:=FLIQLIQGR.Caption+' [Turno Restringido] '+QT_TurcADescripTurno.AsString;
    FLIQLIQGR.Caption:='Liquidaciones '+FLIQTURC.QL_TurcDescripTurno.AsString;
  end;
end;

procedure TFLIQLIQGR.QL_LiqgCalcFields(DataSet: TDataSet);
var
  ImporteAjustadoIsla : Double;
begin
  with DMLIQ do begin
    QL_LiqgDescripTurno.asstring:='Turno: '+IntToClaveNum(QL_LiqgTurno.AsInteger,2)+'  Fecha: '+FechaPaq(QL_LiqgFecha.asdatetime);
    ImporteAjustadoIsla := GetImporteAjustadoIsla(QL_LiqgESTACION.AsInteger,QL_LiqgFECHA.AsDateTime,QL_LiqgISLA.AsInteger,QL_LiqgTURNO.AsInteger);
    QL_LiqgTotGasAju.AsFloat := AjustaFloat(QL_LiqgTOTGAS.AsFloat - ImporteAjustadoIsla,2);
    QL_LiqgTotGralAju.AsFloat := AjustaFloat(QL_LiqgTOTGRAL.AsFloat - ImporteAjustadoIsla,2);
    QL_LiqgTotPagoAju.AsFloat := AjustaFloat(QL_LiqgTOTPAGO.AsFloat - ImporteAjustadoIsla-QL_LiqgTOTDESC.AsFloat,2);
    QL_LiqgTotNeto.AsFloat:=AjustaFloat(QL_LiqgTotGralAju.AsFloat-QL_LiqgTOTDESC.AsFloat,2);
  end;
end;

procedure TFLIQLIQGR.BarMiImprimir(Sender: TObject);
var bm:tbookmark;
begin
  with DMLIQ do begin
    if not LocalizaTabla(T_Liqg,'Estacion;Folio',
                          VarArrayOf([QL_LiqgEstacion.AsInteger,QL_LiqgFolio.AsInteger])) then
      raise Exception.Create('No encuentro liquidación '+QL_LiqgFolio.AsString);
    try
      QL_Liqg.DisableControls;
      bm:=QL_Liqg.GetBookmark;
      Application.CreateForm(TFLIQLIQGIDesglo,FLIQLIQGIDesglo);
      try
        FLIQLIQGIDesglo.PreparaReporte;
        if (Sender=MiImprimirD)or(Sender=PMImprimirD) then
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

procedure TFLIQLIQGR.GenerarLiquidacionGlobal1Click(Sender: TObject);
begin
//  with DMGEN,DMCUP,DMGASQ,DMGAS,DMLIQ do begin
//    RefrescaQuery(QT_Turca);
//    if QT_Turca.IsEmpty then
//      raise Exception.Create('No existe turno abierto');
//    if CajeroActual<>QT_TurcaCajero.AsInteger then
//      raise Exception.Create('Usuario no es el Cajero del turno');
//    if VarLiqTurnoRestringido then
//      raise Exception.Create('Turno Restringido');
//    if VarGasPolizaLiqDia='Si' then begin
//      Q_Auxi.Close;
//      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
//      Q_Auxi.SQL.Clear;
//      Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASTURC');
//      Q_Auxi.SQL.Add('where Estacion='+IntToStr(QT_TurcaEstacion.AsInteger));
//      Q_Auxi.SQL.Add('  and Caja='+IntToStr(QT_TurcaCaja.AsInteger));
//      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QT_TurcaFecha.AsDateTime)+'"');
//      Q_Auxi.SQL.Add('  and Contabilizado="Si" ');
//      Q_Auxi.Prepare;
//      Q_Auxi.Open;
//      if Q_AuxiEntero1.AsInteger>0 then
//        raise Exception.Create('Dia ya está contabilizado');
//    end;
//    Application.CreateForm(TFLIQLIQGNG,FLIQLIQGNG);
//    try
//      FLIQLIQGNG.PreparaForma(true);
//      FLIQLIQGNG.showmodal;
//    finally
//      LimpiaDocAccion;
//      FLIQLIQGNG.Free;
//      RefrescaTabla;
//    end;
//  end;
end;

procedure TFLIQLIQGR.PreverDesglosedeEfectivo1Click(Sender: TObject);
var bm:tbookmark;
begin
  with DMLIQ do begin
    if not LocalizaTabla(T_Liqg,'Estacion;Folio',
                          VarArrayOf([QL_LiqgEstacion.AsInteger,QL_LiqgFolio.AsInteger])) then
      raise Exception.Create('No encuentro liquidación '+QL_LiqgFolio.AsString);
    try
      QL_Liqg.DisableControls;
      bm:=QL_Liqg.GetBookmark;
      Application.CreateForm(TFLIQLIQGIDesgloE,FLIQLIQGIDesgloE);
      try
        FLIQLIQGIDesgloE.PreparaReporte;
        if (Sender=ImprimirDesglosedeEfectivo1)or(Sender=ImprimirDesglosedeEfectivo2) then
          FLIQLIQGIDesgloE.QuickRep1.Print
        else
          FLIQLIQGIDesgloE.QuickRep1.Preview;
      finally
        FLIQLIQGIDesgloE.Free;
      end;
    finally
      QL_Liqg.GotoBookmark(bm);
      QL_Liqg.FreeBookmark(bm);
      QL_Liqg.EnableControls;
    end;
  end;
end;

end.
