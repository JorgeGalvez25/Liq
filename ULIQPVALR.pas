unit ULIQPVALR;

interface

uses Variants, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,db,
  Mask, DBTables, ToolWin, ImgList, DBActns, ActnList, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxNavBarStyles, dxNavBarCollns, dxNavBarBase, dxNavBar, cxTextEdit,
  cxCurrencyEdit;

type
  TFLIQPVALR = class(TForm)
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
    procedure Salir1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaForma;
    procedure CargaTeclasRapidas;
  end;

var
  FLIQPVALR: TFLIQPVALR;
  xdesp:word;
  swcol:boolean;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET,ULIBPRINT, ULIBDATABASE, DDMGAS, DDMGASQ, DDMCUP, DDMGENQ, UFormaPreverTxt,
  DDMLIQ, UGENCLIEB, ULIQPVALI, UGASPRODB, UGASTCMBB, UGASDESPB,
  DDMGEN_VTAS, DDMCONS, ULIQCONS03, ULIQTURC;

{$R *.DFM}

procedure TFLIQPVALR.CargaTeclasRapidas;
begin
  with DMGAS do begin
    Memo1.Lines.Clear;
    T_Tcmb.Active:=true;
    T_TCmb.First;
    while not T_Tcmb.Eof do begin
//      if (T_TcmbTipo.AsString=idTipoCmb)and(LimpiaStr(T_TcmbTeclaRapida.AsString)<>'') then
      if (LimpiaStr(T_TcmbTeclaRapida.AsString)<>'') then
        Memo1.Lines.Add(T_TcmbTeclaRapida.AsString+' - '+T_TcmbNombre.AsString);
      T_Tcmb.Next;
    end;
    Memo1.Lines.Add('');
    Memo1.Lines.Add('F2 - Detalle de Productos');
  end;
end;

procedure TFLIQPVALR.PreparaForma;
begin
  with FLIQTURC,DMGEN,DMCUP,DMGAS,DMGASQ,DMLIQ do begin
    swTurnoLectura:=True;
    if not VarLiqModoReclasificar then begin
{      if not VsAccesoRemoto then
        RefrescaQuery(QT_Turca);}
//      if QT_Turca.IsEmpty then
//        raise Exception.Create('No existe turno abierto');
//      if (CajeroActual<>QT_TurcaCajero.AsInteger) then begin
//        if LocalizaQuery(QT_Cajr,'Clave',CajeroActual) then
//          if QT_CajrNombre.AsString<>VarGasAuxiliarValesDefault then
//            raise Exception.Create('Usuario no tiene permiso para Capturar Vales');
//      end;
      DMGEN_VTAS.TV_Clie.Active:=true;
  //
      T_Turc.Active:=true;
      if not LocalizaTabla(T_Turc,'Estacion;Caja;Fecha;Turno',VarArrayOf([QL_TurcESTACION.AsInteger,QL_TurcCAJA.AsInteger,
                                                                      QL_TurcFECHA.AsDateTime,QL_TurcTURNO.AsInteger])) then
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

procedure TFLIQPVALR.Salir1Click(Sender: TObject);
begin
  with DMGAS do begin
    RefrescaDataBase(DBGAS1);
    RefrescaDataBase(DBGAS2);
    Close;
  end;
end;

procedure TFLIQPVALR.SpeedButton2Click(Sender: TObject);
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

procedure TFLIQPVALR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMLIQ,DMGAS do begin
    if T_Vale.State in [dsEdit,dsInsert] then
      T_Vale.Post;
    TotalVales;
    if T_Turc.State=dsEdit then begin
      T_TurcIndice_Pval.AsInteger:=VarLiqIndiceTurc;
      T_Turc.Post;
    end;
    swTurnoLectura:=False;
  end;
end;

procedure TFLIQPVALR.FormShow(Sender: TObject);
begin
  with DMLIQ,DMGAS do begin
    if VarLiqModoReclasificar then
      FLIQPVALR.Caption:=FLIQPVALR.Caption+'  [Reclasificación de Vales]';
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
      if ((VarGasFolioVolumetricoVales='No')or(DMCONS.AliasConsolaEsts=''))  then begin
        DBGrid2.Columns[0].Visible:=False;
        DBText3.Visible:=False;
      end;
    end;
    if (VarGasIslaVales='No') then begin
      DBGrid2.Columns[2].Visible:=False;
    end;
  end;
end;

procedure TFLIQPVALR.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFLIQPVALR.DBGrid3DblClick(Sender: TObject);
begin
  with DMLIQ do begin
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

procedure TFLIQPVALR.DBGrid3Exit(Sender: TObject);
begin
  with DMLIQ do begin
    if T_Dval.State=dsEdit then
      T_Dval.Post;
  end;
end;

procedure TFLIQPVALR.DBGrid3ColEnter(Sender: TObject);
begin
  with DMGAS,DMLIQ do begin
    if (DBGrid3.SelectedIndex=1)and(T_DvalTipo.AsString=idTipoCmb) then
      DBGrid3.SelectedIndex:=4;
  end;
end;

procedure TFLIQPVALR.DBGrid2DblClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if FGASDESPB.ShowModal=mrOk then begin
      SetEditOrInsert(T_Vale);
      T_ValeDespachador.AsInteger:=FGASDESPB.ClaveDesp;
    end;
  end;
end;

procedure TFLIQPVALR.SpeedButton1Click(Sender: TObject);
begin
  with DMLIQ do begin
    TotalVales;
  end;
end;

procedure TFLIQPVALR.ActualizarIndice1Click(Sender: TObject);
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

procedure TFLIQPVALR.DBGrid2ColExit(Sender: TObject);
var ss,ss2,ests:string;
begin
  with DMLIQ,DMGAS do begin
    if swcol then begin
      if T_ValeFolioVolumetrico.AsInteger>0 then begin
        with DMCONS do begin
          if T_Vale.State in [dsInsert,dsEdit] then begin
            ss:=T_ValeFolioVolumetrico.AsString;
            if length(ss)=9 then begin
              ss2:=copy(ss,1,2);
              T_EstsIb.Active:=true;
              ests:=T_EstsIbNumeroEstacion.AsString;
              while length(ests)>2 do
                delete(ests,1,1);
              if ss2<>ests then begin
                T_Vale.cancel;
                raise Exception.Create('Ticket no es de esta Estación de Servicio');
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
              T_ValeIMPORTE.AsFloat:=0.00;
              DBGrid2.SelectedIndex:=1
            end
            else begin
              if T_Vale.State in [dsInsert,dsEdit] then begin
                T_Vale.Post;
                T_Vale.Append;
                DBGrid2.SelectedIndex:=0;
              end;
            end;
          end;
        end;
      end;
    end
  end;
end;

procedure TFLIQPVALR.DBGrid2ColEnter(Sender: TObject);
var ss,ss2,ests:string;
begin
  with DMLIQ do begin
    swcol:=false;
    if DBGrid2.SelectedField=T_ValeFolioVolumetrico then
      swcol:=true;
    if ((DBGrid2.SelectedField=T_ValeImporte)or(DBGrid2.SelectedField=T_ValeIsla))and(T_ValeFolioVolumetrico.AsInteger>0) then begin
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
            raise Exception.Create('Ticket no es de esta Estación de Servicio');
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
    end;
  end;
end;

procedure TFLIQPVALR.DBGrid2Enter(Sender: TObject);
begin
  with DMLIQ do begin
    swcol:=false;
    if DBGrid2.SelectedField=T_ValeFolioVolumetrico then
      swcol:=true;
  end;
end;

procedure TFLIQPVALR.dxTbPreverClick(Sender: TObject);
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

procedure TFLIQPVALR.dxNavBar1Item4Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQCONS03,FLIQCONS03);
  try
    with FLIQTURC do begin
      FLIQCONS03.pEstacion:=QL_TurcESTACION.AsInteger;
      FLIQCONS03.pCaja:=QL_TurcCAJA.AsInteger;
      FLIQCONS03.pFecha:=QL_TurcFECHA.AsDateTime;
      FLIQCONS03.pTurno:=QL_TurcTURNO.AsInteger;
      FLIQCONS03.ShowModal;
    end;
  finally
    FLIQCONS03.Free;
  end;
end;

end.
