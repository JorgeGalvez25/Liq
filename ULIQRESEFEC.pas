unit ULIQRESEFEC;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Grids, Mask, ExtCtrls, Buttons,
  Menus, ComCtrls, ToolWin, ImgList, DBTables, ActnList, DBActns,
  dxNavBarStyles, dxNavBarCollns, dxNavBarBase, dxNavBar, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxTextEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, AdvGlowButton, Variants;

type
  TFLIQRESEFEC = class(TForm)
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Prever1: TMenuItem;
    Imprimir1: TMenuItem;
    Salir2: TMenuItem;
    N1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Insertar3: TMenuItem;
    Borrar1: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    AmpliarDatos1: TMenuItem;
    QL_ResgPes: TQuery;
    DS_ResgPes: TDataSource;
    ActionList1: TActionList;
    Insertar: TAction;
    Eliminar: TAction;
    Propiedades: TAction;
    Prever: TAction;
    Imprimir: TAction;
    Inicio: TDataSetFirst;
    Final: TDataSetLast;
    N3: TMenuItem;
    Inicio2: TMenuItem;
    Fin1: TMenuItem;
    Panel1: TPanel;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxNavBar1Item1: TdxNavBarItem;
    dxNavBar1Item3: TdxNavBarItem;
    dxNavBarImprimir: TdxNavBarItem;
    dxTbPrever: TdxNavBarItem;
    dxNavBar1Item6: TdxNavBarItem;
    dxNavBar1StyleItem1: TdxNavBarStyleItem;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1CLAVE: TcxGridDBColumn;
    cxGrid1DBTableView1NOMBRE: TcxGridDBColumn;
    cxGrid1DBTableView1NombreZona: TcxGridDBColumn;
    dxNavBar1Group4: TdxNavBarGroup;
    dxNavBar1Item5: TdxNavBarItem;
    dxNavBar1Item7: TdxNavBarItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    Panel2: TPanel;
    QL_ResgPesFECHA: TDateTimeField;
    QL_ResgPesNOCLIE: TIntegerField;
    QL_ResgPesIMPORTE: TFloatField;
    QL_ResgPesNombreCliente: TStringField;
    QL_ResgPesFOLIO: TIntegerField;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    QL_ResgPesFechaAlfa: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dxNavBar1Item6Click(Sender: TObject);
    procedure InsertarExecute(Sender: TObject);
    procedure QL_ResgPesCalcFields(DataSet: TDataSet);
    procedure EliminarExecute(Sender: TObject);
  private
    { private declarations }
    procedure RefrescaTabla;
  public
    { public declarations }
  end;

var
  FLIQRESEFEC: TFLIQRESEFEC;

implementation

uses ULIBGRAL, ULIBDATABASE, UGEN_NET, DDMGEN, DDMGAS,
  DDMGEN_VTAS, UAVANCE, DDMCONS, ULIQRESEFECN, DDMLIQ;

{$R *.DFM}

procedure TFLIQRESEFEC.RefrescaTabla;
begin
  with DMGAS do begin
    try
      QL_ResgPes.Close;
      QL_ResgPes.SQL.Clear;
      QL_ResgPes.SQL.Add('select Fecha,Folio,NoClie,Importe from DGASRESGPES');
      QL_ResgPes.SQL.Add('Where Fecha>='+QuotedStr(FechaToStrSQL(DiaPrimero(T_TurcFECHA.AsDateTime))));
      QL_ResgPes.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(DiaUltimo(T_TurcFECHA.AsDateTime))));
      QL_ResgPes.SQL.Add('Order by Fecha Desc');
      QL_ResgPes.Prepare;
      QL_ResgPes.Open;
    except
      on e:exception do begin
        QL_ResgPes.Close;
        raise Exception.Create(e.Message);
      end;
    end;
  end;
end;

procedure TFLIQRESEFEC.FormShow(Sender: TObject);
var
  color1,color2:TColor;
begin
  with DMGEN do begin
    if (IdSist=idCup) then begin
      color1:=$000080FF;
      color2:=$0080BFFF;
      dxNavBar1.View:=9;
  //       9 = UltraFlatExplorerView
  //      10 = AdvExplorerBarView
      dxNavBar1.DefaultStyles.GroupHeader.Font.Color:=clBlack;
      dxNavBar1.DefaultStyles.Background.BackColor:=color1;
      dxNavBar1.DefaultStyles.Background.BackColor2:=color2;
      dxNavBar1.DefaultStyles.GroupBackground.BackColor:=color2;
      dxNavBar1.DefaultStyles.GroupBackground.BackColor2:=color2;
      dxNavBar1.DefaultStyles.GroupHeader.BackColor:=color2;
      dxNavBar1.DefaultStyles.GroupHeader.BackColor2:=color1;
      dxNavBar1.DefaultStyles.GroupHeaderActive.BackColor:=color1;
      dxNavBar1.DefaultStyles.GroupHeaderActive.BackColor2:=color1;
      dxNavBar1.DefaultStyles.GroupHeaderActiveHotTracked.BackColor:=color1;
      dxNavBar1.DefaultStyles.GroupHeaderActiveHotTracked.BackColor2:=color1;
      dxNavBar1.DefaultStyles.GroupHeaderActivePressed.BackColor:=color1;
      dxNavBar1.DefaultStyles.GroupHeaderActivePressed.BackColor2:=color1;
      dxNavBar1.DefaultStyles.GroupHeaderHotTracked.BackColor:=color2;
      dxNavBar1.DefaultStyles.GroupHeaderHotTracked.BackColor2:=color1;
      dxNavBar1.DefaultStyles.GroupHeaderPressed.BackColor:=color2;
      dxNavBar1.DefaultStyles.GroupHeaderPressed.BackColor2:=color1;
      dxNavBar1.Update;
    end;
  end;
  RefrescaTabla;
end;

procedure TFLIQRESEFEC.dxNavBar1Item6Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQRESEFEC.InsertarExecute(Sender: TObject);
begin
  with DMGAS do begin
    if VarCupNoClienteRes<=0 then begin
      raise Exception.Create('No se ha especificado cliente para reguardo de efectivo');
    end;
    Application.CreateForm(TFLIQRESEFECN,FLIQRESEFECN);
    try
      FLIQRESEFECN.PreparaForma;
      FLIQRESEFECN.ShowModal;
    finally
      FLIQRESEFECN.Free;
      RefrescaTabla;
    end;
  end;
end;

procedure TFLIQRESEFEC.QL_ResgPesCalcFields(DataSet: TDataSet);
begin
  with DMGEN_VTAS do begin
    try
      Q_Auxi.close;
      Q_AuxiStr50.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select Nombre as Str50 from DGENCLIE');
      Q_Auxi.SQL.Add('Where Noclie='+IntToStr(QL_ResgPesNOCLIE.AsInteger));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      QL_ResgPesNombreCliente.AsString:=DMGEN.IntToClaveCata(QL_ResgPesNOCLIE.AsInteger,idClie)+'-'+Q_AuxiStr50.AsString;
    finally
      Q_Auxi.Close;
    end;
    QL_ResgPesFechaAlfa.AsString:=FechaPaq(QL_ResgPesFECHA.AsDateTime);
  end;
end;

procedure TFLIQRESEFEC.EliminarExecute(Sender: TObject);
var
  xListFoliosVolu:TStringList;
  i:Integer;
begin
  with DMLIQ, DMGAS do begin
    if not T_Resgpes.Active then
      T_Resgpes.Active:=True;
    if not T_Resgpes.Locate('Fecha;Folio',VarArrayOf([QL_ResgPesFECHA.AsDateTime,QL_ResgPesFOLIO.AsInteger]),[]) then
      raise Exception.Create('Resguardo en Efectivo no encontrado');
    if T_Pval.Locate('Indice',T_ResgpesIndice_Val.AsInteger,[]) then;
    if T_PvalFACTURADO.AsString='Si' then
      raise Exception.Create('Resguardo no se puede eliminar por que esta total o parcialmente facturado');
    if MensajeConf('¿Desea eliminar el resguardo: '+IntToClaveNum(QL_ResgPesFOLIO.AsInteger,6)+'?')=mrYes then begin
      with DMCONS do begin
        try
          xListFoliosVolu:=TStringList.Create;
          xListFoliosVolu.Assign(T_ResgpesFOLIOSVOLUMETRICOS);
          FAVANCE.PreparaAvance('Desmarcando folios volumetricos...',True,xListFoliosVolu.Count);
          for i:=0 to xListFoliosVolu.Count-1 do begin
            try
              Q_Auxi.Close;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('update DPVGMOVI set Impreso='+QuotedStr('No'));
              Q_Auxi.SQL.Add('where folio='+xListFoliosVolu.Strings[i]);
              Q_Auxi.ExecSQL;
              Q_Auxi.Close;
            except
              on e:exception do begin
                Q_Auxi.Close;
                raise exception.Create(e.Message);
              end;
            end;
            FAVANCE.AvanzaPosicion;
          end;
          T_Pval.Delete;
          T_Resgpes.Delete;
        finally
          RefrescaTabla;
          xListFoliosVolu.Free;
          FAVANCE.Close;
        end;
      end;
    end;
  end;
end;

end.
