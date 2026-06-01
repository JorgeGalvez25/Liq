unit ULIQPVALGEN;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, Grids, DBGrids, Db, DBTables,
  Menus, ComCtrls, RxMemDS, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TFLIQPVALGEN = class(TForm)
    Panel1: TPanel;
    QL_Pval: TQuery;
    DSTT_Auxi: TDataSource;
    Bevel2: TBevel;
    DBText2: TDBText;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    BbSalir: TBitBtn;
    BbCalcular: TBitBtn;
    DBNavigator1: TDBNavigator;
    PopupMenu1: TPopupMenu;
    EliminarRegistro1: TMenuItem;
    QL_Clas: TQuery;
    QL_ClasCLAVECLASIF: TIntegerField;
    QL_ClasDESCRIPCION: TStringField;
    DSQL_Clas: TDataSource;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    TT_Auxi: TRxMemoryData;
    TT_AuxiEstacion: TIntegerField;
    TT_AuxiCliente: TIntegerField;
    TT_AuxiSubCodigo: TIntegerField;
    TT_AuxiNombre: TStringField;
    TT_AuxiCantidad: TFloatField;
    TT_AuxiTotal: TFloatField;
    TT_AuxiCaja: TIntegerField;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiTurno: TIntegerField;
    TT_AuxiIndice: TIntegerField;
    QL_PvalESTACION: TIntegerField;
    QL_PvalCAJA: TIntegerField;
    QL_PvalFECHA: TDateTimeField;
    QL_PvalTURNO: TIntegerField;
    QL_PvalINDICE: TIntegerField;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalSUBCODIGO: TIntegerField;
    QL_PvalCANTIDAD: TIntegerField;
    QL_PvalTOTAL: TFloatField;
    QL_PvalFACTURADO: TStringField;
    QL_PvalESTACIONFAC: TIntegerField;
    QL_PvalSERIEFAC: TStringField;
    QL_PvalFOLIOFAC: TIntegerField;
    QL_PvalINDICEVALE: TIntegerField;
    QL_PvalFECHAFACTURA: TDateTimeField;
    QL_PvalGrupo: TIntegerField;
    Edit2: TEdit;
    Label2: TLabel;
    TT_AuxiPlazo: TIntegerField;
    BbPrever: TBitBtn;
    BbImprimir: TBitBtn;
    TT_AuxiFolio: TIntegerField;
    TT_AuxiCargo: TStringField;
    QL_Docu: TQuery;
    QL_DocuCLAVEDOC: TStringField;
    QL_DocuDESCRIPCION: TStringField;
    DSQL_Docu: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    QL_DocuClaveDescripcion: TStringField;
    Label1: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1Cliente: TcxGridDBColumn;
    cxGrid1DBTableView1SubCodigo: TcxGridDBColumn;
    cxGrid1DBTableView1Nombre: TcxGridDBColumn;
    cxGrid1DBTableView1Cantidad: TcxGridDBColumn;
    cxGrid1DBTableView1Total: TcxGridDBColumn;
    cxGrid1DBTableView1Cargo: TcxGridDBColumn;
    QL_DVal: TQuery;
    QL_DValESTACION: TIntegerField;
    QL_DValCAJA: TIntegerField;
    QL_DValFECHA: TDateTimeField;
    QL_DValTURNO: TIntegerField;
    QL_DValINDICE: TIntegerField;
    QL_DValINDICEVALE: TIntegerField;
    QL_DValPRODUCTO: TIntegerField;
    QL_DValSUBCLAVE: TIntegerField;
    QL_DValIMPORTE: TFloatField;
    QL_DValCANTIDAD: TFloatField;
    QL_DValFACTURADO: TStringField;
    QL_DValESTACIONFAC: TIntegerField;
    QL_DValSERIEFAC: TStringField;
    QL_DValFOLIOFAC: TIntegerField;
    QL_DValCLIENTE: TIntegerField;
    QL_DValSUBCODIGO: TIntegerField;
    QL_DValClase: TStringField;
    TT_AuxiVales: TMemoField;
    Panel3: TPanel;
    CheckBox4: TCheckBox;
    MaskEdit3: TMaskEdit;
    StaticText5: TStaticText;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BbSalirClick(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure BbCalcularClick(Sender: TObject);
    procedure BBPreverClick(Sender: TObject);
    procedure EliminarRegistro1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
    procedure QL_DocuCalcFields(DataSet: TDataSet);
    procedure CheckBox4Click(Sender: TObject);
    procedure MaskEdit3DblClick(Sender: TObject);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure Panel3Enter(Sender: TObject);
  private
    { Private declarations }
    procedure CalculaFolios;
    procedure CalculaTotales;
    procedure RefrescaTabla;
  public
    { Public declarations }
    procedure PreparaForma;
  end;

var
  FLIQPVALGEN: TFLIQPVALGEN;
  folioini:integer;
  xtipomov:string;
  pCliente:Integer;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE, DDMGENQ, DDMGEN_VTAS, DDMGAS, DDMGASQ,
  DDMCUP, DDMLIQ, UAVANCE,  UGENCLIEB, DDMCXC, ULIQPVALGENI;

{$R *.DFM}


procedure TFLIQPVALGEN.PreparaForma;
begin
  with DMGEN,DMGAS do begin
    QL_Clas.Close;
    QL_Clas.Prepare;
    QL_Clas.Open;
    DBLookUpComboBox1.KeyValue:=QL_ClasClaveClasif.AsInteger;
    QL_Docu.Close;
    QL_Docu.Prepare;
    QL_Docu.Open;
    if QL_Docu.Locate('ClaveDoc',VarGasTipoMovCargoVales,[]) then;
    DBLookUpComboBox2.KeyValue:=QL_DocuClaveDoc.AsString;
    CalculaFolios;
  end;
end;

procedure TFLIQPVALGEN.CalculaFolios;
begin
  with DMGAS do begin
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Max(FolioFac) as Entero1 from DGASPVAL'); //Anteriormente se obtenía el consecutivo de la tabla DCXCCARG, lo cual provocaba error de llave primaria, ya que en la tabla DGASPVAL el consecutivo es más alto.
    Q_Auxi.SQL.Add('  Where Estacion='+IntToStr(DMGAS.T_EstsSucursal.AsInteger));
    Q_Auxi.SQL.Add('    and SerieFac="'+DBLookUpComboBox2.KeyValue+'"');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    FolioIni:=Q_AuxiEntero1.AsInteger+1;
  end;
  Edit2.Text:=IntToClaveNum(FolioIni,10);
end;


procedure TFLIQPVALGEN.RefrescaTabla;
var swagrega:boolean;
  lista:TStringList;
begin
  with DMGENQ,DMGEN,DMGEN_VTAS,DMGAS do begin
    try
      lista:=TStringList.Create;
      VgFechaIni:=StrToDate(MaskEdit1.text);
      BbCalcular.Enabled:=false;
      BbSalir.Enabled:=false;
// Vales de Crédito
      QL_Pval.Close;
      QL_Pval.SQL.Clear;
      QL_PVal.SQL.Add('Select * from DGASPVAL');
      QL_Pval.SQL.Add('Where Facturado="No"  ');
      QL_Pval.SQL.Add('  and Estacion='+IntToStr(EstacionActual));
      QL_Pval.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaIni)+'"');
      if not CheckBox4.Checked then begin
        QL_Pval.SQL.Add('  and Cliente='+IntToStr(pCliente));
      end;
      QL_Pval.SQL.Add('  and Total>0.001');
      QL_Pval.SQL.Add('Order by Estacion,Cliente,SubCodigo');
      QL_Pval.Prepare;
      QL_Pval.Open;
      swagrega:=true;
      FolioIni:=StrToInt(Edit2.Text);
      try
        TT_Auxi.Active:=true;
        TT_Auxi.SortOnFields('Cliente;SubCodigo',true,false);
        TT_Auxi.DisableControls;
        while not QL_Pval.Eof do begin
          swagrega:=QL_PvalGrupo.AsInteger=DBLookUpComboBox1.KeyValue;
          if swagrega then begin
            if TT_Auxi.Locate('Cliente;SubCodigo',VarArrayOf([QL_PvalCliente.AsInteger,QL_PvalSubCodigo.AsInteger]),[]) then begin
              TT_Auxi.Edit;
              TT_AuxiCantidad.AsFloat:=TT_AuxiCantidad.AsFloat+QL_PvalCantidad.AsInteger;
              TT_AuxiTotal.AsFloat:=TT_AuxiTotal.AsFloat+QL_PvalTotal.AsFloat;
            end
            else begin
              TT_Auxi.Insert;
              TT_AuxiFolio.AsInteger:=FolioIni;
              TT_AuxiEstacion.AsInteger:=QL_PvalEstacion.AsInteger;
              TT_AuxiCaja.AsInteger:=QL_PvalCaja.AsInteger;
              TT_AuxiFecha.AsDateTime:=QL_PvalFecha.AsDateTime;
              TT_AuxiTurno.AsInteger:=QL_PvalTurno.AsInteger;
              TT_AuxiCliente.AsInteger:=QL_PvalCliente.AsInteger;
              TT_AuxiSubCodigo.AsInteger:=QL_PvalSubCodigo.AsInteger;
              QB_Clie.Close;
              QB_Clie.ParamByName('pnoClie').AsInteger:=TT_AuxiCliente.AsInteger;
              QB_Clie.Prepare;
              QB_Clie.Open;
              TT_AuxiNombre.AsString:=QB_ClieNombre.AsString;
              TT_AuxiPlazo.AsInteger:=QB_CliePlazo.AsInteger;
              TT_AuxiCantidad.AsFloat:=QL_PvalCantidad.AsFloat;
              TT_AuxiTotal.AsFloat:=QL_PvalTotal.AsFloat;
              inc(FolioIni);
            end;
            lista.Clear;
            lista.Assign(TT_AuxiVales);
            lista.Add(QL_PvalESTACION.AsString+'//'+QL_PvalCAJA.AsString+'//'+QL_PvalFECHA.AsString+'//'+QL_PvalTURNO.AsString+'//'+QL_PvalINDICE.AsString);
            TT_AuxiVales.Assign(lista);
            TT_Auxi.Post;
          end;
         QL_Pval.Next;
        end;
      finally
        CalculaTotales;
        TT_Auxi.SortOnFields('Cliente;SubCodigo',true,false);
        TT_Auxi.First;
        TT_Auxi.EnableControls;
      end;
    finally
      BbCalcular.Enabled:=false;
      BbSalir.Enabled:=true;
      BbSalir.SetFocus;
      lista.Free;
    end;
  end;
end;


procedure TFLIQPVALGEN.FormShow(Sender: TObject);
begin
  FLIQPVALGEN.Caption:=FLIQPVALGEN.Caption+'  ['+DMGASQ.QT_TurcaDescripTurno.AsString+']';
  MaskEdit1.EditMask:=MaskFecha2;
  if DMGASQ.QT_TurcaFecha.AsDateTime<>0 then
    MaskEdit1.Text:=FechaToFormato(DMGASQ.QT_TurcaFecha.AsDateTime)
  else
    MaskEdit1.Text:=FechaToFormato(Date);

  VgFechaFin:=DMGASQ.QT_TurcaFecha.AsDateTime;
  BbCalcular.Enabled:=false;
  //DBGrid1.Columns[2].Visible:=false;
  cxGrid1DBTableView1SubCodigo.Visible:=FALSE;
  if DMGAS.VarGasUtilizarReferencia='Si' then
    //DBGrid1.Columns[2].Visible:=true
    cxGrid1DBTableView1SubCodigo.Visible:=TRUE
  else
    cxGrid1DBTableView1SubCodigo.Width:=cxGrid1DBTableView1Cantidad.Width+33;
    //DBGrid1.Columns[3].Width:=DBGrid1.Columns[3].Width+33;
  DBLookUpComboBox1.SetFocus;
end;


procedure TFLIQPVALGEN.BbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQPVALGEN.CalculaTotales;
var bm:TBookMark;
    total,cant:double;
begin
  bm:=TT_Auxi.GetBookMark;
  TT_Auxi.DisableControls;
  try
    Total:=0;
    TT_Auxi.first;
    while not TT_Auxi.eof do begin
      Total:=Total+TT_AuxiTotal.asfloat;
      Cant:=Cant+TT_AuxiCantidad.asfloat;
      TT_Auxi.next;
    end;
  finally
//    StaticText7.Caption:=FormatoMoneda(Total);
//    StaticText1.Caption:=FormatoMoneda(Cant);
    TT_Auxi.GotoBookmark(BM);
    TT_Auxi.EnableControls;
  end;
end;

procedure TFLIQPVALGEN.Panel1Enter(Sender: TObject);
begin
  BbCalcular.Enabled:=true;
  QL_Pval.Close;
  TT_Auxi.Active:=false;
end;

procedure TFLIQPVALGEN.BbCalcularClick(Sender: TObject);
var xsuc:integer;
    swok:boolean;
    _vales:TStringList;
begin
  with DMCXC,DMGEN_VTAS,DMCUP,DMLIQ,DMGAS do begin
    try
      _vales:=TStringList.Create;
      FAvance.PreparaAvance('Aplicando Vales de Crédito...',true,TT_Auxi.RecordCount);
      TT_Auxi.First;
      while not TT_Auxi.Eof do begin
        StatusBar1.Panels[0].Text:='Cliente: '+IntToClaveNum(TT_AuxiCliente.AsInteger,5);
        StatusBar1.Refresh;
        swok:=false;
        _vales.Assign(TT_AuxiVales);
//Actualiza PVAL
        try
          DBGAS2.StartTransaction;
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Update DGASPVAL Set Facturado="Si", ');
          Q_Auxi.SQL.Add('                    EstacionFac='+IntToStr(EstacionActual)+', ');
          Q_Auxi.SQL.Add('                    SerieFac="'+xtipomov+'", ');
          Q_Auxi.SQL.Add('                    FolioFac='+IntToStr(TT_AuxiFolio.AsInteger)+', ');
          Q_Auxi.SQL.Add('                    FechaFactura="'+FechaToStrSQL(VgFechaFin)+'"');
          Q_Auxi.SQL.Add('Where Cliente='+IntToStr(TT_AuxiCliente.AsInteger));
          Q_Auxi.SQL.Add('  and SubCodigo='+IntToStr(TT_AuxiSubCodigo.AsInteger));
          Q_Auxi.SQL.Add('  and Estacion='+IntToStr(TT_AuxiEstacion.AsInteger));
          Q_Auxi.SQL.Add('  and Facturado="No" ');
          Q_Auxi.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaIni)+'"');
          Q_Auxi.Prepare;
          Q_Auxi.ExecSQL;
          DBGAS2.Commit;
          swok:=true;
        except
          DBGAS2.Rollback;
          raise;
        end;
//Registrar el Cargo en CXC
        if swok then begin
          try
            DBVentas1.StartTransaction;
            xsuc:=T_EstsSucursal.AsInteger;
            if xsuc<1 then xsuc:=1;
            if LocalizaTabla(T_Carg,'Sucursal;TipoMov;Folio;Indice',
                             VarArrayOf([xSuc,
                                         xTipomov,
                                         TT_AuxiFolio.AsInteger,
                                         1])) then
            begin
              AplicaCargo(T_CargSucursal.AsInteger,T_CargTipoMov.asstring,T_CargFolio.asinteger,T_CargIndice.AsInteger,false);
              T_Carg.Refresh;
              T_Carg.Delete;
              T_Carg.Refresh;
            end;
            T_Carg.Insert;
            T_CargSucursal.AsInteger:=xsuc;
            T_CargTipoMov.AsString:=xTipoMov;
            T_CargFolio.AsInteger:=TT_AuxiFolio.AsInteger;
            T_CargIndice.AsInteger:=1;
            T_CargNoClie.AsInteger:=TT_AuxiCliente.AsInteger;
            T_CargMes.AsString:=FechaToMes(DMGASQ.QT_TurcaFecha.AsDateTime);
            T_CargFecha.AsDateTime:=DMGASQ.QT_TurcaFecha.AsDateTime;
            T_CargPlazo.AsInteger:=TT_AuxiPlazo.AsInteger;
            T_CargFecVence.AsDateTime:=IncFecha(T_CargFecha.asdatetime,T_CargPlazo.asinteger);
            T_CargConcepto.Asstring:='Vale de Combustible ';
            T_CargImporte.AsFloat:=TT_AuxiTotal.AsFloat;
            T_CargMoneda.AsString:=MonedaNac;
            T_CargParidad.AsFloat:=1;
            T_CargImporteMN.AsFloat:=TT_AuxiTotal.AsFloat;
            T_CargDocumOrigen.Asstring:='VALE';
            T_CargSaldado.AsString:='No';
            //Determina Importes
//            T_CargSubtotal.AsFloat:=AjustaFloat(DivideFloat(TT_AuxiTotal.AsFloat,(1+T_EstsTasaIva.AsFloat/100)),2);
            T_CargSUBTOTAL.AsFloat:=dameSubtotalDePVAL(_vales);
            T_CargIVA.AsFloat:=dameIVADePVAL(_vales);
            T_CargISH.AsFloat:=dameIEPSDePVAL(_vales);
//            T_CargIva.AsFloat:=TT_AuxiTotal.AsFloat-T_CargSubTotal.AsFloat;
            T_CargImporte.AsFloat:=TT_AuxiTotal.AsFloat;
            T_CargImporteMN.AsFloat:=TT_AuxiTotal.AsFloat;
            if LocalizaQuery(DMGEN.QT_Civa,'Porciento',T_EstsTasaIva.AsFloat) then
              T_CargClaveIva.AsInteger:=DMGEN.QT_CivaClave.AsInteger;
            T_Carg.Post;
            T_Carg.Refresh;
            AplicaCargo(T_CargSucursal.AsInteger,T_CargTipoMov.asstring,T_CargFolio.asinteger,T_CargIndice.AsInteger,true);
            T_Carg.Refresh;
            DBVentas1.Commit;
          except
            DBVentas1.Rollback;
            raise;
          end;
        end;
        inc(FolioIni);
        FAvance.AvanzaPosicion;
        TT_Auxi.Next;
      end;
    finally
      _vales.Free;
      StatusBar1.Panels[0].Text:='';
       FAvance.Close;
      MensajeInfo('Proceso terminado...');
      BbCalcular.Enabled:=false;
      CalculaFolios;
    end;
  end;
end;

procedure TFLIQPVALGEN.BBPreverClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQPVALGENI,FLIQPVALGENI);
  try
    TT_Auxi.DisableControls;
    FLIQPVALGENI.PreparaReporte;
    if sender=BbImprimir then
      FLIQPVALGENI.QuickRep1.Print
    else
      FLIQPVALGENI.QuickRep1.Preview;
  finally
    FLIQPVALGENI.Free;
    TT_Auxi.EnableControls;
  end;
end;

procedure TFLIQPVALGEN.EliminarRegistro1Click(Sender: TObject);
var i:word;
begin
  {if DBGrid1.SelectedRows.Count>0 then begin
    with DBGrid1.DataSource.DataSet do begin
      for i:=0 to DBGrid1.SelectedRows.Count-1 do begin
        GotoBookmark(pointer(DBGrid1.SelectedRows.Items[i]));
        with DBGrid1.DataSource.DataSet do
          delete;
      end;
    end;
    CalculaTotales;
  end;}
  if cxGrid1DBTableView1.Controller.SelectedRowCount>0 then begin
    with cxGrid1DBTableView1.DataController do begin
      //for i:=0 to cxGrid1DBTableView1.Controller.SelectedRowCount-1 do begin
        //GotoBookmark(pointer(cxGrid1DBTableView1.Controller.SelectedRows[i]));
        //with cxGrid1DBTableView1.DataController.DataSet do
        //  delete;
      DeleteSelection;
  //    end;
    end;
    CalculaTotales;
  end;
end;

procedure TFLIQPVALGEN.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Pval.close;
  end;
end;

procedure TFLIQPVALGEN.BitBtn1Click(Sender: TObject);
begin
  with DMGEN,DMGAS,DMGASQ do begin
    if (not CheckBox4.Checked)and(MaskEdit3.Text='') then
        raise Exception.Create('No se Indicó el Cliente.');
    VgFechaIni:=StrToDate(MaskEdit1.text);
    if VgFechaIni>QT_TurcaFecha.AsDateTime then
      raise Exception.Create('Fecha mayor que Fecha del Turno');
//Revisa que no exista ese folio
    FolioIni:=StrToInt(Edit2.Text);
    xtipomov:=DBLookupComboBox2.KeyValue;
    //xtipomov:=VarGasTipoMovCargoVales;
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Count(*) as Entero1 from DGASPVAL  ');
    Q_Auxi.SQL.Add('Where SerieFac="'+xtipomov+'"');
    Q_Auxi.SQL.Add('  and FolioFac='+IntToStr(FolioIni));
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    if Q_AuxiEntero1.AsInteger>0 then begin
      Edit2.SetFocus;
      raise Exception.Create('Folio inicia ya existe: '+xtipomov+'-'+IntToClaveNum(FolioIni,6));
    end;
    RefrescaTabla;
    BbCalcular.Enabled:=true;
  end;
end;

procedure TFLIQPVALGEN.DBLookupComboBox2Click(Sender: TObject);
begin
  CalculaFolios;
end;

procedure TFLIQPVALGEN.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  TT_AuxiCargo.AsString:=xtipomov+'-'+IntToClaveNum(TT_AuxiFolio.AsInteger,6);
end;

procedure TFLIQPVALGEN.QL_DocuCalcFields(DataSet: TDataSet);
begin
  QL_DocuClaveDescripcion.AsString:=QL_DocuClaveDoc.AsString+' '+QL_DocuDescripcion.AsString;
end;

procedure TFLIQPVALGEN.CheckBox4Click(Sender: TObject);
begin
  MaskEdit3.Enabled:= not CheckBox4.Checked;
  if CheckBox4.Checked then begin
    MaskEdit3.Text:='';
    StaticText5.Caption:='';
  end;
end;

procedure TFLIQPVALGEN.MaskEdit3DblClick(Sender: TObject);
begin
  if FGENCLIEB.ShowModal=mrOK then with DMGEN do begin
    MaskEdit3.Text:=InttoClaveCata(FGENCLIEB.ClaveClie,idClie);
    MaskEdit3Exit(Sender);
  end;
end;

procedure TFLIQPVALGEN.MaskEdit3Enter(Sender: TObject);
begin
  MaskEdit3.Text:='';
end;

procedure TFLIQPVALGEN.MaskEdit3Exit(Sender: TObject);
begin
  with DMGENQ,DMGEN_VTAS do begin
    if MaskEdit3.Text='' then
      exit;
    try
      if not BuscaQuery(QB_Clie,'pNoClie',StrtoInt(MaskEdit3.text)) then
        raise Exception.Create('No existe Cliente');
      MaskEdit3.Text:=DMGEN.IntToClaveCata(StrToInt(MaskEdit3.Text),idClie);
      StaticText5.Caption:=QB_ClieNombre.AsString;
      pCliente:=QB_ClieNOCLIE.AsInteger;
    except
      MaskEdit3.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQPVALGEN.Panel3Enter(Sender: TObject);
begin
  TT_Auxi.Active:=False;
  TT_Auxi.Active:=True;
end;

end.
