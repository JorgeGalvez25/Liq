unit ULIQREP39P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, Printers, ExtCtrls, DBCtrls, DB;

type
  TFLIQREP39P = class(TForm)
    GroupBox3: TGroupBox;
    Label1: TLabel;
    dtFecha: TMaskEdit;
    Panel2: TPanel;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    cmbImpresora: TComboBox;
    Label2: TLabel;
    PrintDialog1: TPrintDialog;
    Label3: TLabel;
    dblEstaciones: TDBLookupComboBox;
    Label4: TLabel;
    txtTurno: TComboBox;
    cmbIslas: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure BPreverClick(Sender: TObject);
    procedure BOpcionesClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);

    procedure dtFechaExit(Sender: TObject);
    procedure cmbImpresoraChange(Sender: TObject);
  private
    { Private declarations }
    procedure ObtenerIslas(var estacion: Integer);
    procedure ObtenerTurnos;
  public
    { Public declarations }
  end;

var
  FLIQREP39P: TFLIQREP39P;

implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT, DDMCFG, DDMGAS, UAVANCE,
     ULIQREP39, DDMCUP, DDMLIQ, DDMPVG;

{$R *.dfm}

procedure TFLIQREP39P.FormShow(Sender: TObject);
var estacion: Integer;
begin
  if not PrinterActiva then begin
    Self.BPrever.Enabled := False;
    Self.BImprimir.Enabled := False;
    Self.BOpciones.Enabled := False;
  end;

  Self.cmbImpresora.Items.Assign(ListPrinter);
  Self.cmbImpresora.ItemIndex := PredPrinter1;

  Self.dtFecha.Text := FechaToFormato(VgFecha);

  with DMGAS do begin
    T_Ests.Active := True;

    if VarLiqReportesEstacionActiva = 'Si' then begin
      Self.dblEstaciones.KeyValue := EstacionActual;
    end else begin
      Self.dblEstaciones.KeyValue := T_EstsClave.AsInteger;
    end;

    estacion := Self.dblEstaciones.KeyValue;
    Self.ObtenerIslas(estacion);
    Self.cmbIslas.ItemIndex := 0;
    Self.ObtenerTurnos;
    Self.txtTurno.ItemIndex := 0;
  end;
end;

procedure TFLIQREP39P.BCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFLIQREP39P.BOpcionesClick(Sender: TObject);
begin
  Self.PrintDialog1.Execute;
end;

procedure TFLIQREP39P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then begin
    Printer.PrinterIndex := PredPrinter1;
  end;
end;

procedure TFLIQREP39P.cmbImpresoraChange(Sender: TObject);
begin
  if PrinterActiva then begin
    Printer.PrinterIndex := cmbImpresora.ItemIndex;
  end;
end;

procedure TFLIQREP39P.dtFechaExit(Sender: TObject);
begin
  VgFecha := StrToDate(Self.dtFecha.text);
end;

procedure TFLIQREP39P.ObtenerIslas(var estacion: Integer);
begin
  with DMPVG do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind := fkInternalCalc;
      
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT ISLA AS ENTERO1');
      Q_Auxi.SQL.Add('  FROM DGASISLA');
      Q_Auxi.SQL.Add(' WHERE ESTACION = :PESTACION');
      Q_Auxi.SQL.Add('   AND ACTIVA = ''Si''');
      Q_Auxi.SQL.Add(' ORDER BY ISLA');
      Q_Auxi.ParamByName('PESTACION').AsInteger := estacion;
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      Self.cmbIslas.Items.Clear;
      Self.cmbIslas.Items.Add('Seleccione una isla');
      while not Q_Auxi.Eof do begin
        Self.cmbIslas.Items.Add(IntToClaveNum(Q_AuxiEntero1.AsInteger, 2));
        Q_Auxi.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQREP39P.ObtenerTurnos;
begin
  with DMPVG do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind := fkInternalCalc;
      
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT DISTINCT');
      Q_Auxi.SQL.Add('       TURNO AS ENTERO1');
      Q_Auxi.SQL.Add('  FROM DGASLIQG');
      Q_Auxi.Prepare;
      Q_Auxi.Open;

      Self.txtTurno.Items.Clear;
      Self.txtTurno.Items.Add('Seleccione un turno');
      while not Q_Auxi.Eof do begin
        Self.txtTurno.Items.Add('Turno ' + IntToClaveNum(Q_AuxiEntero1.AsInteger, 2));
        Q_Auxi.Next;
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQREP39P.BPreverClick(Sender: TObject);
var turno, isla : Integer;
begin
  with DMGEN, DMCFG do begin
    VgFecha := StrToDate(Self.dtFecha.Text);

    if Self.dblEstaciones.KeyValue <= 0 then begin
      Self.dblEstaciones.Focused;
      raise Exception.Create('Seleccione una estación.');
    end;

    if (Self.txtTurno.Text = '') or(Self.txtTurno.Text = 'Seleccione un turno') then begin
      Self.txtTurno.Focused;
      raise Exception.Create('Seleccione un turno.');
    end;

    turno := StrToInt(Trim(StringReplace(Self.txtTurno.Text, 'Turno ', '', [rfIgnoreCase])));

    if turno <= 0 then begin
      Self.txtTurno.Focused;
      raise Exception.Create('Valor inválido, seleccione un turno.');
    end;

    if Self.cmbIslas.Text = 'Seleccione una isla' then begin
      Self.cmbIslas.Focused;
      raise Exception.Create('Seleccione una isla.');
    end;

    isla := StrToInt(Trim(Self.cmbIslas.Text));
    Application.CreateForm(TFLIQREP39, FLIQREP39);

    try
      FLIQREP39.Estacion := Self.dblEstaciones.KeyValue;
      FLIQREP39.Turno := turno;
      FLIQREP39.Isla := isla;
      FLIQREP39.PreparaReporte;

      if sender = BImprimir then begin
        FLIQREP39.QuickRep1.Print;
      end else begin
        FLIQREP39.QuickRep1.Preview;
      end;

    finally
      FLIQREP39.Free;
    end;
  end;
end;

end.
