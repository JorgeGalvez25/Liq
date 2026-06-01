unit ULIQFDEP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB,
  DBTables, Menus, ActnList, DBActns, Master_Intf;

type
  TFLIQFDEP = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BbGuardar: TBitBtn;
    BbCancelar: TBitBtn;
    BbSalir: TBitBtn;
    DBGrid1: TDBGrid;
    QL_TurcF: TQuery;
    QL_TurcFESTACION: TIntegerField;
    QL_TurcFCAJA: TIntegerField;
    QL_TurcFFECHA: TDateTimeField;
    QL_TurcFTURNO: TIntegerField;
    QL_TurcFNOFICHA: TIntegerField;
    QL_TurcFFOLIO_FICHA: TIntegerField;
    QL_TurcFTOTAL_FICHA: TFloatField;
    QL_TurcFD: TQuery;
    QL_TurcFDESTACION: TIntegerField;
    QL_TurcFDCAJA: TIntegerField;
    QL_TurcFDFECHA: TDateTimeField;
    QL_TurcFDTURNO: TIntegerField;
    QL_TurcFDNOFICHA: TIntegerField;
    QL_TurcFDISLA: TIntegerField;
    QL_TurcFDTOTAL_ISLA: TFloatField;
    DS_TurcF: TDataSource;
    DS_TurcFD: TDataSource;
    DBNavigator1: TDBNavigator;
    USQL_TurcF: TUpdateSQL;
    USQL_TurcFD: TUpdateSQL;
    PopupMenu1: TPopupMenu;
    EliminarRengln1: TMenuItem;
    ActionList1: TActionList;
    DataSetDelete1: TDataSetDelete;
    InsertarRengln1: TMenuItem;
    DataSetInsert1: TDataSetInsert;
    ImprimirComprobante1: TMenuItem;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    procedure BbSalirClick(Sender: TObject);
    procedure BbCancelarClick(Sender: TObject);
    procedure BbGuardarClick(Sender: TObject);
    procedure QL_TurcFDBeforePost(DataSet: TDataSet);
    procedure QL_TurcFBeforePost(DataSet: TDataSet);
    procedure DBGrid1Exit(Sender: TObject);
    procedure ImprimirComprobante1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QL_TurcFBeforeScroll(DataSet: TDataSet);
    procedure QL_TurcFDAfterDelete(DataSet: TDataSet);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure QL_TurcFDAfterOpen(DataSet: TDataSet);
    procedure QL_TurcFDISLAChange(Sender: TField);
    procedure QL_TurcFDBeforeDelete(DataSet: TDataSet);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Cancelando,Modifico:Boolean;
    est,caja,turno:Integer;
    fecha:TDateTime;
    islas:TStringList;
  public
    { Public declarations }
    swNuevo:Boolean;
    procedure PreparaForma(Origen:Char);
  end;

var
  FLIQFDEP: TFLIQFDEP;

implementation

uses
  ULIBDATABASE, ULIBGRAL, DDMGAS, ULIQLIQG, DDMGEN, ULIQFDEPF,
  DDM_KIOS, DDMGASQ, ULIQTURC;

{$R *.dfm}

procedure TFLIQFDEP.BbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQFDEP.BbCancelarClick(Sender: TObject);
begin
  CancelaUpdates(DMGAS.DBGAS2,QL_TurcF);
  CancelaUpdates(DMGAS.DBGAS2,QL_TurcFD);
  Cancelando:=True;
  Close;
end;

procedure TFLIQFDEP.BbGuardarClick(Sender: TObject);
var
  TotFicha:Double;
begin
  try
    try
      if QL_TurcFD.IsEmpty then
        raise Exception.Create('No se ha registrado ninguna ficha.');    
      islas:=TStringList.Create;
      QL_TurcFD.First;
      while not QL_TurcFD.Eof do begin
        TotFicha:=TotFicha+QL_TurcFDTOTAL_ISLA.AsFloat;
        if islas.IndexOf(QL_TurcFDISLA.AsString)=-1 then
          islas.Add(QL_TurcFDISLA.AsString)
        else
          raise Exception.Create('Existen islas repetidas en la ficha, no es posible guardar.');
        QL_TurcFD.Next;
      end;
      AplicaUpdates(DMGAS.DBGAS2,QL_TurcF);
      AplicaUpdates(DMGAS.DBGAS2,QL_TurcFD);
      if TotFicha<>QL_TurcFTOTAL_FICHA.AsFloat then begin
        QL_TurcF.Edit;
        QL_TurcFTOTAL_FICHA.AsFloat:=TotFicha;
        QL_TurcF.Post;
        AplicaUpdates(DMGAS.DBGAS2,QL_TurcF);
      end;

      TotFicha:=0;


      if Sender=BbGuardar then
        MensajeInfo('Guardado Exitoso');
      Modifico:=False;
      if swNuevo then
        Close;
    except
      on e:Exception do
        raise Exception.Create('Error: '+e.Message);
    end;
  finally
    islas.Free;
  end;   
end;

procedure TFLIQFDEP.QL_TurcFDBeforePost(DataSet: TDataSet);
begin       
  if QL_TurcFDISLA.AsInteger>999999 then
    raise Exception.Create('El valor de la isla supera el valor máximo permitido.');
  if QL_TurcFDTOTAL_ISLA.AsFloat>9999999 then
    raise Exception.Create('El valor de importe supera el valor máximo permitido.');
  if QL_TurcFDISLA.AsInteger<=0 then
    raise Exception.Create('Indique una isla.');
  if QL_TurcFDTOTAL_ISLA.AsInteger<=0 then
    raise Exception.Create('El importe debe ser mayor a cero.');
  if QL_TurcFD.State=dsinsert then begin
    QL_TurcFDESTACION.AsInteger:=QL_TurcFESTACION.AsInteger;
    QL_TurcFDCAJA.AsInteger:=QL_TurcFCAJA.AsInteger;
    QL_TurcFDFECHA.AsDateTime:=QL_TurcFFECHA.AsDateTime;
    QL_TurcFDTURNO.AsInteger:=QL_TurcFTURNO.AsInteger;
    QL_TurcFDNOFICHA.AsInteger:=QL_TurcFNOFICHA.AsInteger;
  end;
  QL_TurcFDISLA.Tag:=0;
  Modifico:=True;
end;

procedure TFLIQFDEP.QL_TurcFBeforePost(DataSet: TDataSet);
begin
  with DMGAS do begin
    if QL_TurcF.State=dsInsert then begin
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT COALESCE(MAX(NOFICHA),0)+1 AS ENTERO1 FROM DGASTURCF WHERE');
      Q_Auxi.SQL.Add('ESTACION=:ESTACION AND CAJA=:CAJA AND FECHA=:FECHA AND TURNO=:TURNO');
      Q_Auxi.ParamByName('ESTACION').AsInteger:=est;
      Q_Auxi.ParamByName('CAJA').AsInteger:=caja;
      Q_Auxi.ParamByName('FECHA').AsDateTime:=fecha;
      Q_Auxi.ParamByName('TURNO').AsInteger:=turno;
      Q_Auxi.Open;
      QL_TurcFNOFICHA.AsInteger:=Q_AuxiEntero1.AsInteger;
    end;        
    Modifico:=True;
  end;
end;

procedure TFLIQFDEP.DBGrid1Exit(Sender: TObject);
begin
  if QL_TurcFD.State in [dsInsert,dsEdit] then begin
    try
      QL_TurcFD.Post;
    except
      DbGrid1.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQFDEP.ImprimirComprobante1Click(Sender: TObject);
var
  Despachador:TDespachador;
begin
  with DMGAS do begin
    try
      Application.CreateForm(TFLIQFDEPF,FLIQFDEPF);
      Q_Auxi.Close;
      Q_AuxiStr50.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT NOMBRE AS Str50 FROM DGASDESP WHERE CLAVE=');
      Q_Auxi.SQL.Add('(SELECT DESPACHADOR FROM DGASLIQG WHERE ESTACION=:ESTACION');
      Q_Auxi.SQL.Add('AND CAJA=:CAJA AND FECHA=:FECHA AND TURNO=:TURNO AND ISLA=:ISLA)');
      Q_Auxi.ParamByName('ESTACION').AsInteger:=QL_TurcFDESTACION.AsInteger;
      Q_Auxi.ParamByName('CAJA').AsInteger:=QL_TurcFDCAJA.AsInteger;
      Q_Auxi.ParamByName('FECHA').AsDateTime:=QL_TurcFDFECHA.AsDateTime;
      Q_Auxi.ParamByName('TURNO').AsInteger:=QL_TurcFDTURNO.AsInteger;
      Q_Auxi.ParamByName('ISLA').AsInteger:=QL_TurcFDISLA.AsInteger;
      Q_Auxi.Open;
      if Q_AuxiStr50.AsString<>'' then
        FLIQFDEPF.QRDesp.Caption:=Q_AuxiStr50.AsString
      else begin
        if SwServiciosMaster then begin
          DM_KIOSK.ROChannel.TargetURL:=VariableDeMemo(T_EstsCONSOLA,'TargetURLMaster');
          Despachador:=GetDespachadorTurno(QL_TurcFDFECHA.AsDateTime,QL_TurcFDTURNO.AsInteger,QL_TurcFDISLA.AsInteger);
          if Despachador<>nil then
            FLIQFDEPF.QRDesp.Caption:=Despachador.Nombre
          else
            FLIQFDEPF.QRDesp.Caption:='Despachador';
        end
        else
          FLIQFDEPF.QRDesp.Caption:='Despachador';
      end;
      FLIQFDEPF.QRRecibe.Caption:=DMGASQ.QT_TurcANomCajero.AsString;
      FLIQFDEPF.xfecha:=QL_TurcFDFECHA.AsDateTime;
      FLIQFDEPF.BnDt.Items.Add('x');
      FLIQFDEPF.QRLabel1.Caption:='Efectivo entregado de la isla '+QL_TurcFDISLA.AsString+': $'+FormatoMoneda(QL_TurcFDTOTAL_ISLA.AsFloat);
      FLIQFDEPF.QRLabel2.Caption:=ImporteToLetras(QL_TurcFDTOTAL_ISLA.AsFloat,'Pesos','MN');
      FLIQFDEPF.QuickRep1.Print;
    finally
      FLIQFDEPF.Free;
    end;
  end;
end;

procedure TFLIQFDEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not Cancelando) and (Modifico) and ((not swNuevo) or (QL_TurcFD.RecordCount>0)) and
     (MensajeConf('¿Desea guardar antes de salir?')=mrYes) then begin
    BbGuardarClick(Sender);
  end
  else begin
    CancelaUpdates(DMGAS.DBGAS2,QL_TurcF);
    CancelaUpdates(DMGAS.DBGAS2,QL_TurcFD);
  end;
end;

procedure TFLIQFDEP.PreparaForma(Origen:Char);
begin
  if (Origen='T') then begin
    with FLIQTURC do begin
      est:=QL_TurcESTACION.AsInteger;
      caja:=QL_TurcCAJA.AsInteger;
      fecha:=QL_TurcFECHA.AsDateTime;
      turno:=QL_TurcTURNO.AsInteger;
    end;
  end
  else begin
    with FLIQLIQG do begin
      est:=QL_LiqgESTACION.AsInteger;
      caja:=QL_LiqgCAJA.AsInteger;
      fecha:=QL_LiqgFECHA.AsDateTime;
      turno:=QL_LiqgTURNO.AsInteger;
    end;
  end;
  QL_TurcF.ParamByName('ESTACION').AsInteger:=est;
  QL_TurcF.ParamByName('CAJA').AsInteger:=caja;
  QL_TurcF.ParamByName('FECHA').AsDateTime:=fecha;
  QL_TurcF.ParamByName('TURNO').AsInteger:=turno;
  QL_TurcF.Open;
  QL_TurcFD.Open;
  if (not swNuevo) and (QL_TurcF.IsEmpty) then
    raise Exception.Create('No existen fichas registradas en este turno.');
  IniciaUpdates(DMGAS.DBGAS2,QL_TurcF);
  IniciaUpdates(DMGAS.DBGAS2,QL_TurcFD);
  if swNuevo then begin
    DBNavigator1.Enabled:=False;
    QL_TurcF.Append;
    QL_TurcFESTACION.AsInteger:=est;
    QL_TurcFCAJA.AsInteger:=caja;
    QL_TurcFFECHA.AsDateTime:=fecha;
    QL_TurcFTURNO.AsInteger:=turno;
    QL_TurcF.Post;
  end;
end;

procedure TFLIQFDEP.QL_TurcFBeforeScroll(DataSet: TDataSet);
begin
  if (not Cancelando) and (Modifico) and ((not swNuevo) or (QL_TurcFD.RecordCount>0)) and
     (MensajeConf('¿Desea guardar la ficha modificada?')=mrYes) then
    BbGuardarClick(nil)
  else begin
    Modifico:=False;
    CancelaUpdates(DMGAS.DBGAS2,QL_TurcF);
    CancelaUpdates(DMGAS.DBGAS2,QL_TurcFD);
  end;
end;

procedure TFLIQFDEP.QL_TurcFDAfterDelete(DataSet: TDataSet);
begin
  Modifico:=True;
end;

procedure TFLIQFDEP.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#13,#8]) then
    Key:=#0;
end;

procedure TFLIQFDEP.PopupMenu1Popup(Sender: TObject);
begin
  ImprimirComprobante1.Enabled:=(QL_TurcFD.State<>dsInsert) and (QL_TurcFDTOTAL_ISLA.AsFloat>0)
end;

procedure TFLIQFDEP.QL_TurcFDAfterOpen(DataSet: TDataSet);
begin
  if not QL_TurcFD.IsEmpty then begin
    islas.Clear;
    QL_TurcFD.First;
    while not QL_TurcFD.Eof do begin
      islas.Add(QL_TurcFDISLA.AsString);
      QL_TurcFD.Next;
    end;
    QL_TurcFD.First;
  end
  else
    islas.Clear;
end;

procedure TFLIQFDEP.QL_TurcFDISLAChange(Sender: TField);
begin
  if QL_TurcFD.State<>dsInsert then
  if (QL_TurcFDISLA.Tag=QL_TurcFDISLA.NewValue) then
    Exit;
  if (islas.IndexOf(QL_TurcFDISLA.AsString)<>-1) then
    raise Exception.Create('La isla ya se encuentra registrada.');
  if QL_TurcFDISLA.Tag<=0 then begin
    if QL_TurcFD.State=dsInsert then
      QL_TurcFDISLA.Tag:=QL_TurcFDISLA.NewValue
    else
      QL_TurcFDISLA.Tag:=QL_TurcFDISLA.OldValue;
  end;
  if QL_TurcFDISLA.Tag<>QL_TurcFDISLA.NewValue then
    islas.Delete(islas.IndexOf(IntToStr(QL_TurcFDISLA.Tag)));
  islas.Add(QL_TurcFDISLA.NewValue);
  QL_TurcFDISLA.Tag:=QL_TurcFDISLA.NewValue;
end;

procedure TFLIQFDEP.QL_TurcFDBeforeDelete(DataSet: TDataSet);
begin
  islas.Delete(islas.IndexOf(QL_TurcFDISLA.AsString));
end;

procedure TFLIQFDEP.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (not (Key in ['0'..'9','.',#13,#8])) then
    Key:=#0;
end;

end.
