unit UMALECTFIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, ExtCtrls, StdCtrls, ComCtrls, Buttons, DBCtrls;

type
  TFMALECTFIN = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    TM_Auxi: TRxMemoryData;
    TM_AuxiFecha: TDateTimeField;
    TM_AuxiTanque: TIntegerField;
    TM_AuxiCombustible: TIntegerField;
    TM_AuxiVolumenDisponible: TFloatField;
    DTFechaV: TDateTimePicker;
    Label1: TLabel;
    lblVol: TLabel;
    edtVol: TEdit;
    btnGuardar: TBitBtn;
    btnSalir: TBitBtn;
    lblTanque: TLabel;
    cbbTanque: TComboBox;
    Label2: TLabel;
    DBLEst: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure edtVolKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure edtVolExit(Sender: TObject);
    procedure DBLEstClick(Sender: TObject);
  private
    { Private declarations }
    procedure InicializaTanques(swEst:Integer);
  public
    { Public declarations }
  end;

var
  FMALECTFIN: TFMALECTFIN;

implementation

{$R *.dfm}

Uses Ulibgral, DDMCONS, DDMGAS, ModuloAuxiliarU;

procedure TFMALECTFIN.FormShow(Sender: TObject);
var
  i:Integer;
begin
  DTFechaV.DateTime:=Date;
  with DMGAS do begin
    T_Ests.Active:=true;
//    if VarLiqReportesEstacionActiva='Si' then begin
//      DBLEst.KeyValue:=EstacionActual;
//    end
//    else begin
//      DBLEst.KeyValue:=T_EstsClave.AsInteger;
//    end;
    DBLEst.KeyValue:=ModuloAuxiliarF.DBLookupComboBox2.KeyValue;
    InicializaTanques(DBLEst.KeyValue);
  end;

end;

procedure TFMALECTFIN.edtVolKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9','.',#13,#10,#8]) then
    Key:=#0;
end;

procedure TFMALECTFIN.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMALECTFIN.btnGuardarClick(Sender: TObject);
var
  xVol:Double;
  xComb:Integer;
  function combustible(xcmb:string):Integer;
  begin
    if UpperCase(Copy(xcmb,6,Length(xcmb)-1)) = UpperCase('magna') then begin
      Result:=1
    end
    else if UpperCase(Copy(xcmb,6,Length(xcmb)-1)) = UpperCase('premium') then
      Result:=2
    else if UpperCase(Copy(xcmb,6,Length(xcmb)-1)) = UpperCase('diesel') then
      Result:=3
    else
      Result:=1;
  end;
begin
  if cbbTanque.Items.Count<=0 then begin
    MensajeInfo('No se ha proporcionado un tanque valido');
    Exit;
  end;
  edtVol.Text := StringReplace(edtVol.Text,',','',[rfReplaceAll]);
  xVol:=StrToFloatDef(edtVol.Text,-1);
  edtVol.Text:=FormatoMoneda(StrToFloat(edtVol.Text));
  if xVol<=0 then begin
    edtVol.SetFocus;
    MensajeInfo('No se ha proporcionado un valor valido para el volumen');
    Exit;
  end;
  xComb:=combustible(cbbTanque.Text);
  with DMCONS do begin
    try
      Q_Auxi.close;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('select m.VolumenDisponible as Real1 From DPVGTURNT m');
      Q_Auxi.SQL.Add('Where m.Fecha = '+QuotedStr(FechaToStrSQL(DTFechaV.DateTime)));
      Q_Auxi.SQL.Add('  and m.Turno=3');
      Q_Auxi.SQL.Add('  and m.combustible='+IntToStr(xComb));
      Q_Auxi.SQL.Add('Order by m.combustible');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      if Q_AuxiReal1.AsFloat>0 then begin
        MensajeInfo('Ya existe volumen final para este día');
        Exit;
      end;
    finally
      Q_Auxi.Close;
    end;
    try
      Q_Auxi.close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('INSERT INTO DPVGTURNT (FECHA, TURNO, TANQUE, COMBUSTIBLE, VOLUMEN, PORLLENAR, NIVEL, VOLUMENAGUA, ');
      Q_Auxi.SQL.Add('                       TEMPERATURA, VOLUMENFONDAJE, VOLUMENDISPONIBLE, VOLUMENUTIL)');
      Q_Auxi.SQL.Add('VALUES (:pFecha, 3, :pTanque, :pComb, :pVol, :pVol, 0, 0, 0, 5000, :pVol, :pVol)');
      Q_Auxi.ParamByName('pFecha').AsDateTime:=DTFechaV.DateTime;
      Q_Auxi.ParamByName('pTanque').AsInteger:=StrToInt(Copy(cbbTanque.Text,0,2));
      Q_Auxi.ParamByName('pComb').AsInteger:=xComb;
      Q_Auxi.ParamByName('pVol').AsFloat:=xVol;
      Q_Auxi.ExecSQL;
    finally
      Q_Auxi.Close;
    end;
    MensajeInfo('Volumen guardado con exito');
  end;
  Close;
end;

procedure TFMALECTFIN.edtVolExit(Sender: TObject);
begin
  edtVol.Text:=FormatoMoneda(StrToFloat(edtVol.Text));
end;

procedure TFMALECTFIN.InicializaTanques(swEst:Integer);
begin
  cbbTanque.Items.Clear;
  DMGAS.EstacionActual:=swEst;
  DMGAS.CargaConfiguracionConsola;
  with DMCONS do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiStr20.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('Select t.tanque as Entero1, (select c.nombre from DPVGTCMB c where c.clave=t.combustible) as Str20 from dpvgtanq t');
      Q_Auxi.SQL.Add('where t.activo='+QuotedStr('Si'));
      Q_Auxi.SQL.Add('Order by t.tanque');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      while not Q_Auxi.Eof do begin
        cbbTanque.Items.Add(IntToClaveNum(Q_AuxiEntero1.AsInteger,2)+' - '+Q_AuxiStr20.AsString);
        Q_Auxi.Next;
      end;
      cbbTanque.ItemIndex:=0;
    finally
      Q_Auxi.close;
    end;
  end;
end;

procedure TFMALECTFIN.DBLEstClick(Sender: TObject);
begin
  InicializaTanques(DBLEst.KeyValue);
end;

end.
