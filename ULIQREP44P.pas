unit ULIQREP44P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, StdCtrls, Buttons, cxDropDownEdit, cxTextEdit,
  cxButtonEdit, ComCtrls, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, Printers;

const
  MsjCvClienteNoExiste = 'Clave de cliente no existe.';

type
  TFLIQREP44P = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Estacion: TcxLookupComboBox;
    FechaIni: TDateTimePicker;
    FechaFin: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Cliente: TcxButtonEdit;
    NombreCliente: TcxTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    Impresora: TcxComboBox;
    Prever: TBitBtn;
    Imprimir: TBitBtn;
    Opciones: TBitBtn;
    Salir: TBitBtn;
    TodasEstaciones: TCheckBox;
    PrintDialog1: TPrintDialog;
    TodosClientes: TCheckBox;
    SoloCuponesRecuperados: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure OpcionesClick(Sender: TObject);
    procedure ImpresoraPropertiesChange(Sender: TObject);
    procedure SalirClick(Sender: TObject);
    procedure TodasEstacionesClick(Sender: TObject);
    procedure ClientePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure ClienteExit(Sender: TObject);
    procedure ClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PreverClick(Sender: TObject);
    procedure TodosClientesClick(Sender: TObject);
  private
    procedure CargaCliente(Clave:Integer);
    procedure LimpiaCliente;
  public

  end;

var
  FLIQREP44P: TFLIQREP44P;

implementation

uses
  DDMGEN, DDMGASQ, DDMGAS, ULIBDATABASE, ULIBGRAL, UGENCLIEB, UGEN_NET,
  DDMGEN_VTAS, DDMCFG, ULIQREP44;

{$R *.dfm}

procedure TFLIQREP44P.CargaCliente(Clave:Integer);
begin
  LimpiaCliente;

  if (Clave > 0) then begin
    with DMGEN_VTAS do begin
      Cliente.Text := DMGEN.IntToClaveCata(FGENCLIEB.ClaveClie, idClie);

      BuscaQuery(QB_Clie,'pNoClie',FGENCLIEB.ClaveClie);

      NombreCliente.Text := QB_ClieNombre.AsString;
    end;
  end;
end;

procedure TFLIQREP44P.LimpiaCliente;
begin
  Cliente.Clear;
  NombreCliente.Clear;
end;

procedure TFLIQREP44P.FormShow(Sender: TObject);
begin
  with DMGASQ, DMGAS do begin
    QT_Ests.Active := True;

    //Estacion
    Estacion.EditValue := DMGAS.EstacionActual;
    TodasEstaciones.Checked := False;

    //Fecha
    FechaIni.Date := VgFechaIni;
    FechaFin.Date := VgFechaFin;

    //Cliente
    LimpiaCliente;
    TodosClientes.Checked := True;
    TodosClientesClick(nil);

    //Impresora
    Impresora.Properties.Items.Assign(ListPrinter);

    if (impresora.Properties.Items.Count > 0)
    then Impresora.ItemIndex := PredPrinter1
    else Impresora.ItemIndex := -1;
  end;
end;

procedure TFLIQREP44P.OpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP44P.ImpresoraPropertiesChange(Sender: TObject);
begin
  if (PrinterActiva) then Printer.PrinterIndex := Impresora.ItemIndex;
end;

procedure TFLIQREP44P.SalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP44P.TodasEstacionesClick(Sender: TObject);
begin
  Estacion.Enabled := not(TodasEstaciones.Checked);
end;

procedure TFLIQREP44P.ClientePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
  if (FGENCLIEB.ShowModal = mrOk) then CargaCliente(FGENCLIEB.ClaveClie);
end;

procedure TFLIQREP44P.ClienteExit(Sender: TObject);
begin
  if (StrToIntDef(LimpiaStr(Cliente.Text), -1) <> -1) then begin
    FGENCLIEB.PreparaForma(Cliente.Text);

    if (FGENCLIEB.ClaveClie = 0) then begin
      MensajeInfo(MsjCvClienteNoExiste);

      LimpiaCliente;
    end
    else CargaCliente(FGENCLIEB.ClaveClie);
  end
  else LimpiaCliente;
end;

procedure TFLIQREP44P.ClienteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (key = idF5) then ClientePropertiesButtonClick(Sender, 0);
  if (key = 13) then ClienteExit(Sender);
end;

procedure TFLIQREP44P.PreverClick(Sender: TObject);
begin
  with DMGEN, DMCFG do begin
    if ((TodosClientes.Checked = False) and (StrToIntDef(Cliente.Text, 0) < 1)) then begin
      MensajeInfo(MsjCvClienteNoExiste);
      Cliente.SetFocus;
      
      Exit;
    end;

    VgFechaIni := FechaIni.Date;
    VgFechaFin := FechaFin.Date;

    Application.CreateForm(TFLIQREP44,FLIQREP44);

    try
      FLIQREP44.PreparaReporte;

      if (FLIQREP44.Q_Cupones.RecordCount > 0) then begin
        if (sender = Imprimir)
        then FLIQREP44.QuickRep1.Print
        else FLIQREP44.QuickRep1.Preview;
      end
      else MensajeInfo('No se encontró información con los datos capturados.');
    finally
      FLIQREP44.Free;
    end;
  end;
end;

procedure TFLIQREP44P.TodosClientesClick(Sender: TObject);
begin
  Cliente.Enabled := not(TodosClientes.Checked);

  if not(Cliente.Enabled) then LimpiaCliente;
end;

end.
