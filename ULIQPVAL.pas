unit ULIQPVAl;

interface

uses Variants, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,db,
  Mask, DBTables, ToolWin, ImgList, DBActns, ActnList, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxNavBarStyles, dxNavBarCollns, dxNavBarBase, dxNavBar, cxTextEdit,
  cxCurrencyEdit, Master_Intf, DDM_KIOS, Master_FACELELibrary_Intf;

type
  TFLIQPVAL = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    DBText2: TDBText;
    Label2: TLabel;
    ActionList1: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetCancel1: TDataSetCancel;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetPost1: TDataSetPost;
    PopupMenu1: TPopupMenu;
    Guardar1: TMenuItem;
    Cancelar1: TMenuItem;
    Insertar1: TMenuItem;
    Eliminar1: TMenuItem;
    Inicio1: TMenuItem;
    Fin1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    DataSetPost2: TDataSetPost;
    DataSetCancel2: TDataSetCancel;
    DataSetInsert2: TDataSetInsert;
    DataSetDelete2: TDataSetDelete;
    DataSetFirst2: TDataSetFirst;
    DataSetLast2: TDataSetLast;
    DataSetPost3: TDataSetPost;
    DataSetCancel3: TDataSetCancel;
    DataSetInsert3: TDataSetInsert;
    DataSetDelete3: TDataSetDelete;
    DataSetFirst3: TDataSetFirst;
    DataSetLast3: TDataSetLast;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    Label4: TLabel;
    DataSetEdit1: TDataSetEdit;
    DBGrid3: TDBGrid;
    Panel10: TPanel;
    Panel11: TPanel;
    Memo1: TMemo;
    N3: TMenuItem;
    ImportardeOtrafecha1: TMenuItem;
    Panel13: TPanel;
    DBGrid2: TDBGrid;
    DBText3: TDBText;
    Label1: TLabel;
    ActualizarIndice1: TMenuItem;
    QL_Isla: TQuery;
    Label3: TLabel;
    Panel14: TPanel;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item2: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxTbImprimir: TdxNavBarItem;
    dxTbPrever: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1StyleItem1: TdxNavBarStyleItem;
    ImageList1: TImageList;
    dxNavBar1Item4: TdxNavBarItem;
    Bevel1: TBevel;
    DBText1: TDBText;
    Label5: TLabel;
    PopupMenu4: TPopupMenu;
    procedure Salir1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid3Exit(Sender: TObject);
    procedure DBGrid3ColEnter(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ActualizarIndice1Click(Sender: TObject);
    procedure DBGrid2ColExit(Sender: TObject);
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure dxTbPreverClick(Sender: TObject);
    procedure dxNavBar1Item4Click(Sender: TObject);
    procedure DBGrid3Enter(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private
    { Private declarations }
    function ValidaFolioPG(pFolioVolumetrico: Integer):Boolean;
    function CancelaFacturaPG_FACELE(pEstacion, pFolio, pPac, pFolioVolumetrico: Integer; pSerie, pUUID: string):Boolean;
  public
    { Public declarations }
    procedure PreparaForma;
    procedure CargaTeclasRapidas;
  end;

var
  FLIQPVAL: TFLIQPVAL;
  xdesp:word;
  swcol:boolean;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET,ULIBPRINT, ULIBDATABASE, DDMGAS, DDMGASQ, DDMCUP, DDMGENQ, UFormaPreverTxt,
  DDMLIQ, ULIQPVALI, UGASPRODB, UGASTCMBB, UGASDESPB,
  DDMGEN_VTAS, DDMCONS, ULIQCONS03, UGENCLIEBFACELE, fClientForm, DDMGASNET;

{$R *.DFM}

procedure TFLIQPVAL.CargaTeclasRapidas;
begin
  with DMGAS do begin
    Memo1.Lines.Clear;
    T_Tcmb.Active:=true;
    T_TCmb.First;
//    while not T_Tcmb.Eof do begin
////      if (T_TcmbTipo.AsString=idTipoCmb)and(LimpiaStr(T_TcmbTeclaRapida.AsString)<>'') then
//      if (LimpiaStr(T_TcmbTeclaRapida.AsString)<>'') then
//        Memo1.Lines.Add(T_TcmbTeclaRapida.AsString+' - '+T_TcmbNombre.AsString);
//      T_Tcmb.Next;
//    end;
//    Memo1.Lines.Add('');
    Memo1.Lines.Add('F2 - Detalle de Productos');
  end;
end;

procedure TFLIQPVAL.PreparaForma;
begin
  with DMGEN,DMCUP,DMGAS,DMGASQ,DMLIQ do begin
    if not VarLiqModoReclasificar then begin
{      if not VsAccesoRemoto then
        RefrescaQuery(QT_Turca);}
      if QT_Turca.IsEmpty then
        raise Exception.Create('No existe turno abierto');
      if (CajeroActual<>QT_TurcaCajero.AsInteger) then begin
        if LocalizaQuery(QT_Cajr,'Clave',CajeroActual) then
          if Pos(QT_CajrNombre.AsString,VarGasAuxiliarValesDefault)<=0 then
            raise Exception.Create('Usuario no tiene permiso para Capturar Vales');
      end;
      DMGEN_VTAS.TV_Clie.Active:=true;
  //
      T_Turc.Active:=true;
      if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',VarArrayOf([QT_TurcaEstacion.AsInteger,QT_TurcaCaja.AsInteger,
                                                                      QT_TurcaFecha.AsDateTime,QT_TurcaTurno.AsInteger])) then
        raise Exception.Create('No puedo localizar turno');
    end;
//  Indice
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Max(Indice) as Entero1 from DGASPVAL');
    Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
    Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
    Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
    Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    T_Turc.Edit;
    T_TurcIndice_Pval.AsInteger:=Q_AuxiEntero1.AsInteger;
    T_Turc.Post;
    T_Turc.Edit;
    AbreTablasLiqT('PVAL;VALE;DVAL');
    CargaTeclasRapidas;
    VarLiqIndiceTurc:=T_TurcIndice_Pval.AsInteger+1;
    xdesp:=0;
  end;
end;

procedure TFLIQPVAL.Salir1Click(Sender: TObject);
begin
  with DMGAS do begin
    RefrescaDataBase(DBGAS1);
    RefrescaDataBase(DBGAS2);
    Close;
  end;
end;

procedure TFLIQPVAL.SpeedButton2Click(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    try
      T_Pval.DisableControls;
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Delete from DGASPVAL');
      Q_Auxi.SQL.Add('where Estacion='+IntToStr(T_TurcEstacion.AsInteger));
      Q_Auxi.SQL.Add('  and Caja='+IntToStr(T_TurcCaja.AsInteger));
      Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(T_TurcFecha.AsDateTime)+'"');
      Q_Auxi.SQL.Add('  and Turno='+IntToStr(T_TurcTurno.AsInteger));
      Q_Auxi.SQL.Add('  and Total<0.001');
      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;
    finally
      T_Pval.EnableControls;
      RefrescaDataBase(DBGAS1);
      RefrescaDataBase(DBGAS2);
    end;
  end;
end;

procedure TFLIQPVAL.DBGrid1DblClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if DBGrid1.SelectedField=T_PvalCliente then begin
      if FGENCLIEBFACELE.ShowModal=mrOk then begin
        if FGENCLIEBFACELE.Credito='No' then
          raise Exception.Create('Cliente no tiene crédito');
        SetEditOrInsert(T_Pval);
        T_PvalCliente.AsInteger:=FGENCLIEBFACELE.ClaveClie;
        DBGrid1.SetFocus;
      end;
    end;
  end;
end;

procedure TFLIQPVAL.DBGrid1Exit(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    if T_PvalCliente.AsInteger>0 then
      if T_PvalSubCodigo.IsNull then T_PvalSubCodigo.AsInteger:=0;
    if T_Pval.State=dsInsert then
      if (T_PvalCliente.AsInteger>0)and(T_PvalCantidad.AsInteger>0) then
        T_Pval.Post
      else
    else if T_Pval.State=dsEdit then
      T_Pval.Post;
    DBGrid2.SelectedIndex:=0;
    if (VarGasFolioVolumetricoVales='No')or(DMCONS.AliasConsolaEsts='') then
      DBGrid2.SelectedIndex:=1;
  end;
end;

procedure TFLIQPVAL.DBGrid1ColExit(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    if (DBgrid1.SelectedField=T_PvalCliente) then
       DBGrid2.SetFocus;

{      if  VarGasUtilizarReferencia='No' then
        DBGrid2.SetFocus;
    end;
    if VarGasUtilizarReferencia='Si' then begin
      if DBgrid1.SelectedField=T_PvalSubCodigo then
          DBGrid2.SetFocus;
    end;}
  end;
end;

procedure TFLIQPVAL.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  xindex:Integer;
begin
  with DMGEN,DMGAS,DMLIQ do begin
    //Cambio sujeto a la variable que activa el cambio de facturación público general.
    if (Key=idEnter) and (T_ValeFOLIOVOLUMETRICO.AsInteger=0) and (DBGrid2.SelectedIndex<>0) then begin
      if T_Vale.state=dsInsert then
        T_Vale.Post;
      T_Dval.Insert;
      T_DvalProducto.AsInteger:=4;
      DBGrid3.SelectedIndex:=1;
      DBGrid3.SetFocus;
      Exit;
    end;
    //---------------------------------------------------------------------------------

    if (Key=idEnter)and(VarComp('EnterValesCredito')<>'No') then begin
      xindex:=DBGrid2.SelectedIndex;
      DBGrid2.SelectedIndex:=4;
      DBGrid2.SelectedIndex:=xindex;
      if (T_ValeFolioVolumetrico.AsInteger>0)and(DBGrid2.SelectedIndex=0) then begin
        if not dmgas.SwServiciosMaster then begin
          with DMCONS do begin
            if T_Vale.State in [dsInsert,dsEdit] then begin
              Q_Auxi.Close;
              Q_AuxiEntero1.FieldKind:=fkInternalCalc;
              Q_AuxiEntero2.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select Count(*) as Entero1,sum(tag) as Entero2 from DPVGMOVI');
              Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              if Q_AuxiEntero1.AsInteger<1 then
                raise Exception.Create('Folio de Ticket Volumétrico no existe');
              if Q_AuxiEntero2.AsInteger>0 then begin
                T_ValeIMPORTE.AsFloat:=0.00;
                DBGrid2.SelectedIndex:=1
              end
              else begin
                DBgrid1.SetFocus;
                DBGrid1.SelectedIndex:=0;
                if T_ValeFolioVolumetrico.AsInteger>0 then begin
                  T_Vale.Edit;
                  T_Vale.Post;
                end;
                T_Pval.Append;
              end;
            end;
          end;
        end
        else begin
          with DMCUP do begin
            if T_Vale.State in [dsInsert,dsEdit] then begin
              if _ticket<>nil then begin
                if _ticket.Folio<>T_ValeFOLIOVOLUMETRICO.AsInteger then
                  _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
              end
              else
                _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
              if _ticket=nil then
                raise Exception.Create('Folio de Ticket Volumétrico no existe');
              if _ticket.Tag>0 then begin
                T_ValeIMPORTE.AsFloat:=0.00;
                DBGrid2.SelectedIndex:=1
              end
              else begin
                DBgrid1.SetFocus;
                DBGrid1.SelectedIndex:=0;
                if T_ValeFolioVolumetrico.AsInteger>0 then begin
                  T_Vale.Edit;
                  T_Vale.Post;
                end;
                T_Pval.Append;
              end;
            end;
          end;
        end;
      end
      else begin
        DBgrid1.SetFocus;
        DBGrid1.SelectedIndex:=0;
        if T_ValeFolioVolumetrico.AsInteger>0 then begin
          T_Vale.Edit;
          T_Vale.Post;
        end;
        //Cambio sujeto a la variable que activa el cambio de facturación público general.
//        T_Pval.Append;
      end;
    end;
    if (Key=idEnter)and(VarComp('EnterValesCredito')='No') then begin
      xindex:=DBGrid2.SelectedIndex;
      DBGrid2.SelectedIndex:=4;
      DBGrid2.SelectedIndex:=xindex;
      if (T_ValeFolioVolumetrico.AsInteger>0)and(DBGrid2.SelectedIndex=0) then begin
        if not DMGAS.SwServiciosMaster then begin
          with DMCONS do begin
            if T_Vale.State in [dsInsert,dsEdit] then begin
              Q_Auxi.Close;
              Q_AuxiEntero1.FieldKind:=fkInternalCalc;
              Q_AuxiEntero2.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select Count(*) as Entero1,sum(tag) as Entero2 from DPVGMOVI');
              Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              if Q_AuxiEntero1.AsInteger<1 then
                raise Exception.Create('Folio de Ticket Volumétrico no existe');
              if Q_AuxiEntero2.AsInteger>0 then begin
                T_ValeIMPORTE.AsFloat:=0.00;
                DBGrid2.SelectedIndex:=1
              end
              else begin
                if T_Vale.state in [dsEdit,dsInsert] then
                  T_Vale.Post;
                //Cambio sujeto a la variable que activa el cambio de facturación público general.
//                T_Vale.Append;
                if (VarGasFolioVolumetricoVales='No')or(DMCONS.AliasConsolaEsts='') then
                  if not DMGAS.SwServiciosMaster then
                    DBGrid2.SelectedIndex:=1
                  else
                    DBGrid2.SelectedIndex:=0
                else
                  DBGrid2.SelectedIndex:=0;
              end;
            end;
          end;
        end
        else begin
          with DMCUP do begin
            if T_Vale.State in [dsInsert,dsEdit] then begin
              if _ticket<>nil then begin
                if _ticket.Folio<>T_ValeFOLIOVOLUMETRICO.AsInteger then
                  _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
              end
              else
                _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
              if _ticket=nil then
                raise Exception.Create('Folio de Ticket Volumétrico no existe');
              if _ticket.Tag>0 then begin
                T_ValeIMPORTE.AsFloat:=0.00;
                DBGrid2.SelectedIndex:=1
              end
              else begin
                if T_Vale.state in [dsEdit,dsInsert] then
                  T_Vale.Post;
                //Cambio sujeto a la variable que activa el cambio de facturación público general.
//                T_Vale.Append;
                if (VarGasFolioVolumetricoVales='No')or(DMCONS.AliasConsolaEsts='') then
                  if not DMGAS.SwServiciosMaster then
                    DBGrid2.SelectedIndex:=1
                  else
                    DBGrid2.SelectedIndex:=0
                else
                  DBGrid2.SelectedIndex:=0;
              end;
            end;
          end;
        end;
      end
      else begin
        if T_Vale.state in [dsEdit,dsInsert] then
          T_Vale.Post;
        //Cambio sujeto a la variable que activa el cambio de facturación público general.
//        T_Vale.Append;
        if (VarGasFolioVolumetricoVales='No')or(DMCONS.AliasConsolaEsts='') then
          if not DMGAS.SwServiciosMaster then
            DBGrid2.SelectedIndex:=1
          else
            DBGrid2.SelectedIndex:=0
        else
          DBGrid2.SelectedIndex:=0;
      end;
    end;
    if (Key=idF10) then begin
      DBgrid1.SetFocus;
      DBGrid1.SelectedIndex:=0;
      if T_ValeFolioVolumetrico.AsInteger>0 then begin
        T_Vale.Edit;
        T_Vale.Post;
      end;
      T_Pval.Append;
    end;
    if Key=idF2 then begin
      //Cambio sujeto a la variable que activa el cambio de facturación público general.
      if (T_ValeFOLIOVOLUMETRICO.AsInteger=0) and (DBGrid2.SelectedIndex<>0) then begin
      if T_Vale.state=dsInsert then
        T_Vale.Post;
      T_Dval.Insert;
      T_DvalProducto.AsInteger:=4;
      DBGrid3.SelectedIndex:=1;
      DBGrid3.SetFocus;
      end
      else begin
        if T_Vale.state=dsInsert then
          T_Vale.Post;
        DBGrid3.SelectedIndex:=4;
        DBGrid3.SetFocus;
    end;
    end;
    if Key=idF3 then begin
      if T_Vale.state=dsInsert then
        T_Vale.Post;
      DBGrid3.SelectedIndex:=4;
      DBGrid3.SetFocus;
    end;
  end;
end;

procedure TFLIQPVAL.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  with DMLIQ do begin
    if (DBGrid2.SelectedField = T_ValeFOLIOVOLUMETRICO) and not(T_ValeFOLIOVOLUMETRICO.IsNull) then Abort;
   VarLiqKeyPress:=Key;
   if ClaveCmb(VarLiqKeyPress)>0 then
    if T_Vale.State in [dsInsert,dsEdit] then
      T_Vale.Post;
  end;
end;

procedure TFLIQPVAL.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DMLIQ do begin
    //Cambio sujeto a la variable que activa el cambio de facturación público general.
    if (Key=idEnter) and (DBGrid3.SelectedField<>T_DvalPRODUCTO) then begin
      if T_Dval.state=dsInsert then
        T_Dval.Post;
      DBgrid2.SetFocus;
      T_Vale.Append;
    end;
    Exit;
    //-------------------------------------------------------------------------------
    if Key=idEnter then begin
      if T_Dval.state=dsInsert then
        T_Dval.Post;
      DBgrid2.SetFocus;
      T_Vale.Append;
    end;
  end;
end;

procedure TFLIQPVAL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMLIQ,DMGAS do begin
    if T_Vale.State in [dsEdit,dsInsert] then
      T_Vale.Post;
    TotalVales;
    if T_Turc.State=dsEdit then begin
      T_TurcIndice_Pval.AsInteger:=VarLiqIndiceTurc;
      T_Turc.Post;
    end;
  end;
end;

procedure TFLIQPVAL.FormShow(Sender: TObject);
begin
  with DMLIQ,DMGAS do begin
    if VarLiqModoReclasificar then
      FLIQPVAL.Caption:=FLIQPVAL.Caption+'  [Reclasificación de Vales]';
    if VarGasUtilizarReferencia='Si' then begin
      DBGrid1.Columns[1].Width:= 35;
      DBGrid1.Columns[2].Width:=185;
    end
    else begin
      DBGrid1.Columns[1].Visible:=False;
      DBGrid1.Columns[2].Width:=220;
    end;
    if VarGasDespachadorVales='No' then begin
      DBGrid2.Columns[3].Visible:=False;
      DBText3.Visible:=False;
    end;
    if not DMGAS.SwServiciosMaster then begin
      if (VarGasFolioVolumetricoVales='No')or(DMCONS.AliasConsolaEsts='')  then begin
        DBGrid2.Columns[0].Visible:=False;
        DBText3.Visible:=False;
      end;
    end;
    if (VarGasIslaVales='No') then begin
      DBGrid2.Columns[2].Visible:=False;
    end;
  end;
end;

procedure TFLIQPVAL.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with DMLIQ,DMGAS do begin
    if (VarLiqModoReclasificar) then begin
      if abs(T_TurcTotalVales.AsFloat-VarLiqTotalVales)>0.001 then begin
        CanClose:=False;
        raise Exception.Create('No puede cambiar el Total de Vales: $'+FormatoMoneda(VarLiqTotalVales));
      end;
    end;
  end;
end;

procedure TFLIQPVAL.DBGrid3DblClick(Sender: TObject);
begin
  with DMLIQ do begin
    //Cambio sujeto a la variable que activa el cambio de facturación público general.
    if (T_ValeFOLIOVOLUMETRICO.AsInteger>0) then
      Exit;
    //--------------------------------------------------------------------------------
    if DBGrid3.SelectedField=T_DvalProducto then begin
      if FGASTCMBB.ShowModal=mrOk then begin
        SetEditorInsert(T_Dval);
        T_DvalProducto.asinteger:=FGASTCMBB.ClaveComb;
      end;
    end;
    if DBGrid3.SelectedField=T_DvalSubClave then begin
      if FGASPRODB.ShowModal=mrOk then begin
        SetEditorInsert(T_Dval);
        T_DvalSubClave.AsInteger:=FGASPRODB.ClaveProd;
      end;
    end;
  end;
end;

procedure TFLIQPVAL.DBGrid3Exit(Sender: TObject);
begin
  with DMLIQ do begin
    if T_Dval.State=dsEdit then
      T_Dval.Post;
  end;
end;

procedure TFLIQPVAL.DBGrid3ColEnter(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    if (DBGrid3.SelectedIndex=1)and(T_DvalTipo.AsString=idTipoCmb) then
      DBGrid3.SelectedIndex:=4;
  end;
end;

procedure TFLIQPVAL.DBGrid2DblClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if FGASDESPB.ShowModal=mrOk then begin
      SetEditOrInsert(T_Vale);
      T_ValeDespachador.AsInteger:=FGASDESPB.ClaveDesp;
    end;
  end;
end;

procedure TFLIQPVAL.SpeedButton1Click(Sender: TObject);
begin
  with DMLIQ do begin
    TotalVales;
  end;
end;

procedure TFLIQPVAL.ActualizarIndice1Click(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select Max(IndiceVale) as Entero1 from DGASVALE');
    Q_Auxi.SQL.Add(' Where Estacion='+IntToStr(T_PvalEstacion.AsInteger));
    Q_Auxi.SQL.Add('   and Caja='+IntToStr(T_PvalCaja.AsInteger));
    Q_Auxi.SQL.Add('   and Fecha="'+FechaToStrSQL(T_PvalFecha.AsDateTime)+'"');
    Q_Auxi.SQL.Add('   and Turno='+IntToStr(T_PvalTurno.AsInteger));
    Q_Auxi.SQL.Add('   and Indice='+IntToStr(T_PvalIndice.AsInteger));
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    T_ValeIndiceVale.AsInteger:=Q_AuxiEntero1.AsInteger+1;
  end;
end;

procedure TFLIQPVAL.DBGrid2ColExit(Sender: TObject);
var ss,ss2,ests:string;
begin
  with DMLIQ,DMGAS do begin
    if swcol then begin
      if T_ValeFolioVolumetrico.AsInteger>0 then begin
        if not DMGAS.SwServiciosMaster then begin
          with DMCONS do begin
            if T_Vale.State in [dsInsert,dsEdit] then begin
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
                      MensajeInfo('Ticket no es de esta estación de servicio');
                      Abort;
                    end;
                  end;
                end
                else if length(ss)=9 then begin
                  ss2:=copy(ss,1,2);
                  T_EstsIb.Active:=true;
                  ests:=IntToStr(T_ValeESTACION.AsInteger);
                  while length(ests)>2 do
                    delete(ests,1,1);
                  if ss2<>ests then begin
                    ests:=T_EstsIbNumeroEstacion.AsString;
                    while length(ests)>2 do
                      delete(ests,1,1);
                    if ss2<>ests then begin
                      T_Vale.cancel;
                      MensajeInfo('Ticket no es de esta estación de servicio');
                      Abort;
                    end;
                  end;
                  T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,3,7));
                end
                else if length(ss)=8 then begin
                  ss2:=copy(ss,1,1);
                  T_EstsIb.Active:=true;
                  ests:=IntToStr(T_ValeESTACION.AsInteger);
                  while length(ests)>1 do
                    delete(ests,1,1);
                  if ss2<>ests then begin
                    ests:=T_EstsIbNumeroEstacion.AsString;
                    while length(ests)>1 do
                      delete(ests,1,1);
                    if ss2<>ests then begin
                      T_Vale.cancel;
                      MensajeInfo('Ticket no es de esta estación de servicio');
                      Abort;
                    end;
                  end;
                  T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,2,8));
                end;
              end;

              ValidarFolioVolumetricoPublicoGeneral;

              Q_Auxi.Close;
              Q_AuxiEntero1.FieldKind:=fkInternalCalc;
              Q_AuxiEntero2.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select Count(*) as Entero1,sum(tag) as Entero2 from DPVGMOVI');
              Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              if Q_AuxiEntero1.AsInteger<1 then
                raise Exception.Create('Folio de Ticket Volumétrico no existe');
              if Q_AuxiEntero2.AsInteger>0 then begin
                T_ValeIMPORTE.AsFloat:=0.00;
                DBGrid2.SelectedIndex:=1
              end
              else begin
                if T_Vale.State in [dsInsert,dsEdit] then begin
                  T_Vale.Post;
                  DBGrid2.SelectedIndex:=0;
                end;
              end;
            end;
          end;
        end
        else begin
          with DMCUP do begin
            if T_Vale.State in [dsInsert,dsEdit] then begin
              if not((Length(IntToStr(GetMaximoFolioMovimiento))=8) and (Length(IntToStr(T_ValeFolioVolumetrico.AsInteger))=8)) then begin
                ss:=T_ValeFolioVolumetrico.AsString;
                if DMLIQ.estTicket<>'' then begin
                  ests:=IntToStr(T_ValeESTACION.AsInteger);
                  while length(ests)>2 do
                    delete(ests,1,1);
                  if DMLIQ.estTicket<>ests then begin
                    ests:=_NumeroEstacionVolumetrico;
                    while length(ests)>2 do
                      delete(ests,1,1);
                    if DMLIQ.estTicket<>ests then begin
                      T_Vale.cancel;
                      MensajeInfo('Ticket no es de esta estación de servicio');
                      Abort;
                    end;
                  end;
                end
                else if length(ss)=9 then begin
                  T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,3,7));
                  ss2:=copy(ss,1,2);
                  ests:=IntToStr(T_ValeESTACION.AsInteger);
                  while length(ests)>2 do
                    delete(ests,1,1);
                  if ss2<>ests then begin
                    ests:=_NumeroEstacionVolumetrico;
                    while length(ests)>2 do
                      delete(ests,1,1);
                    if ss2<>ests then begin
                      T_Vale.cancel;
                      MensajeInfo('Ticket no es de esta estación de servicio');
                      Abort;
                    end;
                  end;
                end
                else if length(ss)=8 then begin
                  ss2:=copy(ss,1,1);
                  ests:=IntToStr(T_ValeESTACION.AsInteger);
                  while length(ests)>1 do
                    delete(ests,1,1);
                  if ss2<>ests then begin
                    ests:=_NumeroEstacionVolumetrico;
                    while length(ests)>1 do
                      delete(ests,1,1);
                    if ss2<>ests then begin
                      T_Vale.cancel;
                      MensajeInfo('Ticket no es de esta estación de servicio');
                      Abort;
                    end;
                  end;
                  T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,2,8));
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
              if _ticket.Tag>0 then begin
                T_ValeIMPORTE.AsFloat:=0.00;
                DBGrid2.SelectedIndex:=1
              end
              else begin
                if T_Vale.State in [dsInsert,dsEdit] then begin
                  T_Vale.Post;
                  DBGrid2.SelectedIndex:=0;
                end;
              end;
            end;
          end;
        end;
      end;
    end
  end;
end;

procedure TFLIQPVAL.DBGrid2ColEnter(Sender: TObject);
var ss,ss2,ests:string;
begin
  with DMLIQ do begin
    swcol:=false;
    if DBGrid2.SelectedField=T_ValeFolioVolumetrico then
      swcol:=true;
    if ((DBGrid2.SelectedField=T_ValeImporte)or(DBGrid2.SelectedField=T_ValeIsla))and(T_ValeFolioVolumetrico.AsInteger>0) then begin
      if not DMGAS.SwServiciosMaster then begin
        with DMCONS do begin
          ss:=T_ValeFolioVolumetrico.AsString;
          if length(ss)=9 then begin
            ss2:=copy(ss,1,2);
            T_EstsIb.Active:=true;
            ests:=T_EstsIbNumeroEstacion.AsString;
            while length(ests)>2 do
              delete(ests,1,1);
            if ss2<>ests then begin
              T_Vale.cancel;
              raise Exception.Create('Ticket no es de esta estación de servicio');
            end;
            T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,3,7));
          end;
          Q_Auxi.Close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_AuxiEntero2.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select Count(*) as Entero1,sum(tag) as Entero2 from DPVGMOVI');
          Q_Auxi.SQL.Add('where Folio='+inttostr(T_ValeFolioVolumetrico.AsInteger));
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          if Q_AuxiEntero1.AsInteger<1 then
            raise Exception.Create('Folio de Ticket Volumétrico no existe');
          if Q_AuxiEntero2.AsInteger>0 then begin
            DBGrid2.SelectedIndex:=1
          end
          else begin
            DBGrid2.SelectedIndex:=3;
          end;
        end;
      end
      else begin
        with DMGAS,DMCUP do begin
          ss:=T_ValeFolioVolumetrico.AsString;
          if length(ss)=9 then begin
            T_ValeFolioVolumetrico.AsInteger:=StrToInt(copy(ss,3,7));
            ss2:=copy(ss,1,2);
            ests:=_NumeroEstacionVolumetrico;
            while length(ests)>2 do
              delete(ests,1,1);
            if ss2<>ests then begin
              T_Vale.cancel;
              raise Exception.Create('Ticket no es de esta estación de servicio');
            end;
          end;
          if _ticket<>nil then begin
            if _ticket.Folio<>T_ValeFOLIOVOLUMETRICO.AsInteger then
              _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
          end
          else
            _ticket:=dame_ticket(T_ValeFOLIOVOLUMETRICO.AsInteger);
          if _ticket=nil then
            raise Exception.Create('Folio de Ticket Volumétrico no existe');
          if _ticket.Tag>0 then begin
            DBGrid2.SelectedIndex:=1
          end
          else begin
            DBGrid2.SelectedIndex:=3;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFLIQPVAL.DBGrid2Enter(Sender: TObject);
begin
  with DMLIQ do begin
    //Cambio sujeto a la variable que activa el cambio de facturación público general.
    if not T_Vale.IsEmpty then begin
      DBGrid2.ReadOnly:=True;
      Exit;
    end
    else
      DBGrid2.ReadOnly:=False;
    //------------------------------------------------------------------------------
    swcol:=false;
    if DBGrid2.SelectedField=T_ValeFolioVolumetrico then
      swcol:=true;
  end;
end;

procedure TFLIQPVAL.dxTbPreverClick(Sender: TObject);
var bm:tbookmark;
begin
  with DMLIQ do begin
    try
      T_Pval.DisableControls;
      bm:=T_Pval.GetBookmark;
      Application.CreateForm(TFLIQPVALI,FLIQPVALI);
      try
        FLIQPVALI.PreparaReporte;
        if sender=dxTBImprimir then
          FLIQPVALI.QuickRep1.Print
        else
          FLIQPVALI.QuickRep1.Preview;
      finally
        FLIQPVALI.Free;
      end;
    finally
      T_Pval.GotoBookmark(bm);
      T_Pval.FreeBookmark(bm);
      T_Pval.EnableControls;
    end;
  end;
end;

procedure TFLIQPVAL.dxNavBar1Item4Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQCONS03,FLIQCONS03);
  try
    with DMGASQ do begin
      FLIQCONS03.pEstacion:=QT_TurcaEstacion.AsInteger;
      FLIQCONS03.pCaja:=QT_TurcaCaja.AsInteger;
      FLIQCONS03.pFecha:=QT_TurcaFecha.AsDateTime;
      FLIQCONS03.pTurno:=QT_TurcaTurno.AsInteger;
      FLIQCONS03.ShowModal;
    end;
  finally
    FLIQCONS03.Free;
  end;
end;

function TFLIQPVAL.ValidaFolioPG(pFolioVolumetrico: Integer):Boolean;
var
  CancelacionResult: Boolean;
begin
  with DMCUP, DMCONS do begin
    try
      DMCONS.Q_Auxi.Close;
      DMCONS.Q_AuxiStr16.FieldKind:=fkInternalCalc;
      DMCONS.Q_AuxiStr2.FieldKind:=fkInternalCalc;
      DMCONS.Q_Auxi.SQL.Clear;

      DMCONS.Q_Auxi.SQL.Add('SELECT RFC AS Str16, Facturado AS Str2 FROM DPVGMOVI');
      DMCONS.Q_Auxi.SQL.Add('  WHERE Folio= '+inttostr(pFolioVolumetrico));

      DMCONS.Q_Auxi.Prepare;
      DMCONS.Q_Auxi.Open;

      //Se verifica si el ticket está facturado a público general
      if ((DMCONS.Q_AuxiStr16.AsString = 'XAXX010101000') and (DMCONS.Q_AuxiStr2.AsString = 'Si')) then begin
        DMCUP.Q_Gas.Close;
        DMCUP.Q_Gas.SQL.Clear;

        //Se obtiene el estatus del turno verificando con el folio volumétrico del detalle de factura
        DMCUP.Q_Gas.SQL.Add('SELECT b.Estatus , a.Estacion, a.Tipofac, a.Folio, a.PAC, a.Uuid FROM DGASTURC b');
        DMCUP.Q_Gas.SQL.Add('RIGHT JOIN DGASFACG a');
        DMCUP.Q_Gas.SQL.Add('  ON b.Fecha = a.Fecha');
        DMCUP.Q_Gas.SQL.Add('  AND b.Turno = a.Turno');
        DMCUP.Q_Gas.SQL.Add('RIGHT JOIN DGASFACGD c');
        DMCUP.Q_Gas.SQL.Add('  ON c.Estacion = a.Estacion');
        DMCUP.Q_Gas.SQL.Add('  AND c.Tipofac = a.Tipofac');
        DMCUP.Q_Gas.SQL.Add('  AND c.Folio = a.Folio');
        DMCUP.Q_Gas.SQL.Add('WHERE Folioticket= :FOLIOTICKET');

        DMCUP.Q_Gas.ParamByName('FOLIOTICKET').AsInteger:=pFolioVolumetrico;

        DMCUP.Q_Gas.Prepare;
        DMCUP.Q_Gas.Open;

        if (Not DMCUP.Q_gas.IsEmpty) then begin
          if (DMCUP.Q_Gas.FieldByName('ESTATUS').AsString = 'C') then begin
            MensajeInfo('No se pude cancelar factura ya que el turno en el cual se generó la factura está cerrado');
            Result := False;
            Exit;
          end;
        end;

        if (MensajeConf(Concat('Folio volumétrico ya fue facturado a público en general',#13,'¿Desea cancelar la factura?')) = mrYes) then begin
          CancelacionResult := Self.CancelaFacturaPG_FACELE(DMCUP.Q_Gas.FieldByName('ESTACION').AsInteger, DMCUP.Q_Gas.FieldByName('FOLIO').AsInteger,
                                                     DMCUP.Q_Gas.FieldByName('PAC').AsInteger, pFolioVolumetrico, DMCUP.Q_Gas.FieldByName('TIPOFAC').AsString,
                                                     DMCUP.Q_Gas.FieldByName('UUID').AsString);
          if CancelacionResult then
            MensajeInfo('Comprobante cancelado con éxito')
          else
            MensajeInfo('No se pudo cancelar comprobante electrónico');
        end;
      end;
      Result:=CancelacionResult;
    except
      on e:Exception do begin
        Result:= False;
        MensajeErr(e.Message);
      end;
    end;
  end;
end;

function TFLIQPVAL.CancelaFacturaPG_FACELE(pEstacion, pFolio, pPac, pFolioVolumetrico: Integer; pSerie, pUUID: string):Boolean;
var
  ResultCancelacion: Boolean;
begin
  with DMCUP, DMCONS do begin
    if not T_Facg.Active then begin
      T_Facg.Active := True;
      T_FacgD.Active := True;
      T_Dfcg.Active := True;
    end;
    if not BuscaQuery(T_Facg,'pEstacion;pTipoFac;pFolio',VarArrayOf([pEstacion,pSerie,pFolio])) then
      raise Exception.Create('No se encuentra factura '+Concat(pSerie, '-', InttoClaveNum(pFolio, 6)));

    Case StrToChar(cancelar_comprobante_electronico(pEstacion, pSerie, pFolio, pPac,Concat(pUUID,'|','XAXX010101000'),2,'').Estatus) of
      'C': begin //Cancelación exitosa
         ResultCancelacion := DMCUP.CancelaFacturaPG(pEstacion, pFolio, pFolioVolumetrico, pSerie);

        if not ResultCancelacion then
          MensajeInfo('No se pudo cancelar administrativamente la factura');

        Result := ResultCancelacion;
      end;
    else // Se recibe diferente de C y se impide continuar
      Result := False;
    end;
  end;
end;

procedure TFLIQPVAL.DBGrid3Enter(Sender: TObject);
begin
  //Cambio sujeto a la variable que activa el cambio de facturación público general.
  if (DMLIQ.T_ValeFOLIOVOLUMETRICO.AsInteger>0) and (not DMLIQ.T_Dval.IsEmpty)then begin
    DBGrid3.ReadOnly:=True;
    DBGrid3.PopupMenu:=PopupMenu4;
  end
  else begin
    DBGrid3.ReadOnly:=false;
    DBGrid3.PopupMenu:=PopupMenu3;
  end;
  //-------------------------------------------------------------------------------------
end;

procedure TFLIQPVAL.PopupMenu2Popup(Sender: TObject);
begin
  //Cambio sujeto a la variable que activa el cambio de facturación público general.
  if not DMLIQ.T_Vale.IsEmpty then begin
    MenuItem1.Visible:=False;
    MenuItem2.Visible:=False;
    MenuItem3.Visible:=False;
    MenuItem4.Visible:=False;
    MenuItem5.Enabled:=True;
    MenuItem6.Visible:=False;
    MenuItem7.Visible:=False;
    MenuItem8.Visible:=False;
    MenuItem9.Visible:=False;
    ActualizarIndice1.Visible:=False;
  end
  else begin
    MenuItem1.Visible:=True;
    MenuItem2.Visible:=True;
    MenuItem3.Visible:=True;
    MenuItem4.Visible:=True;
    MenuItem5.Enabled:=False;
    MenuItem6.Visible:=True;
    MenuItem7.Visible:=True;
    MenuItem8.Visible:=True;
    MenuItem9.Visible:=True;
    ActualizarIndice1.Visible:=True;
  end;
  //----------------------------------------------------------------------------
end;

procedure TFLIQPVAL.DBGrid2Exit(Sender: TObject);
begin
  //Cambio sujeto a la variable que activa el cambio de facturación público general.
  if DMLIQ.T_Vale.State = dsInsert then
    DMLIQ.T_Vale.Post;
//  DBGrid3.SelectedIndex:=4;
//  DBGrid3.SetFocus;
  //---------------------------------------------------------------------------------
end;

procedure TFLIQPVAL.MenuItem5Click(Sender: TObject);
begin
  //Cambio sujeto a la variable que activa el cambio de facturación público general.
  if DMLIQ.T_Dval.State <> dsBrowse then
    DMLIQ.T_Dval.Cancel;

  DMLIQ.T_Vale.Refresh;

  if DMLIQ.T_Vale.State = dsBrowse then
    DMLIQ.T_Vale.Delete
  else
    DMLIQ.T_Vale.Cancel;

  if DMLIQ.T_Vale.IsEmpty then
    DBGrid1.SetFocus;

  //---------------------------------------------------------------------------------  
end;

end.
