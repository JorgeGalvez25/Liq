unit ULIQREP28P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons;

type
  TFLIQREP28P = class(TForm)
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    MaskEdit4: TMaskEdit;
    GroupBox4: TGroupBox;
    ComboBox2: TComboBox;
    GroupBox5: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    CheckBox4: TCheckBox;
    SaveDialog1: TSaveDialog;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BExportar: TBitBtn;
    BCancelar: TBitBtn;
    CheckBox5: TCheckBox;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    StaticText3: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit1DblClick(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP28P: TFLIQREP28P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
     ULIQREP28, UGENCLIEB, DDMGENQ, DDMGEN_VTAS, DDMLIQ;

{$R *.DFM}

procedure TFLIQREP28P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BExportar.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  ComboBox2.ItemIndex:=0;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  with DMGAS do begin
    T_Ests.Active:=true;
    if VarLiqReportesEstacionActiva='Si' then begin
      DBLookUpComboBox2.KeyValue:=EstacionActual;
      MaskEdit4.SetFocus;
    end
    else begin
      DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
    end;
  end;
end;

procedure TFLIQREP28P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP28P.BImprimirClick(Sender: TObject);
var ss,xarch,xaux:string;
    ch:char;
    Lista:TStringList;
    i:integer;
begin
  with DMGEN,DMCFG do begin
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if CheckBox2.Checked then
      if StrToInt(MaskEdit2.Text)<StrToInt(MaskEdit1.Text) then
        raise Exception.Create('Rango de Cliente Inválido');
    Application.CreateForm(TFLIQREP28,FLIQREP28);
    try
      FLIQREP28.PreparaReporte;
      if sender=BImprimir then
        FLIQREP28.QuickRep1.Print
      else if Sender=BPrever then
        FLIQREP28.QuickRep1.Preview
      else begin
        ss:=InputBox('Exportación Texto','Teclee el Caracter se Separación entre Columnas','|');
        ch:=StrToChar(copy(ss,1,1));
        try
          with FLIQREP28 do begin
            SaveDialog1.InitialDir:=VsLocalDir;
            if SaveDialog1.Execute then begin
              if FileExists(SaveDialog1.Filename) then
                if MensajeConf('Archivo ya existe. Eliminar ?')=mrYes then
                  DeleteFile(SaveDialog1.Filename)
            end;
            xarch:=SaveDialog1.FileName+'.Txt';
            Lista:=TStringList.Create;
            Lista.Add('Nombre'+ch+
                      'Folio'+ch+
                      'Fecha'+ch+
                      'Sin Facturar 1-7'+ch+
                      'Sin Facturar Mas 7'+ch+
                      'Facturado 1-7'+ch+
                      'Facturado 8-14'+ch+
                      'Facturado 15-21'+ch+
                      'Facturado 22-28'+ch+
                      'Facturado Más 28'+ch+
                      'Total'+ch);
            for i:=0 to BndDt.Items.Count-1 do begin
              DMGAS.CambiaStr(ch,BndDt.Items[i],xaux);
              Lista.Add(xaux);
            end;
          end;
        finally
          Lista.SaveToFile(xarch);
          MensajeInfo('Archivo Generado: '+xarch);
          Lista.Free;
        end;

      end;
    finally
      FLIQREP28.Free;
    end;
  end;
end;

procedure TFLIQREP28P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP28P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP28P.MaskEdit1DblClick(Sender: TObject);
begin
  if FGENCLIEB.ShowModal=mrOK then with DMGEN do begin
    with Sender as TMaskEdit do begin
      Text:=InttoClaveCata(FGENCLIEB.ClaveClie,idClie);
    end;
    MaskEdit1Exit(Sender);
  end;
end;

procedure TFLIQREP28P.MaskEdit1Exit(Sender: TObject);
begin
  with DMGENQ,DMGEN_VTAS do begin
    with Sender as TMaskEdit do begin
      if Text='' then exit;
      try
        if not BuscaQuery(QB_Clie,'pNoClie',StrtoInt(Text)) then
          raise Exception.Create('No existe Cliente');
        Text:=LlenaStr(Text,'D',6,'0');
        if Sender = MaskEdit1 then StaticText1.Caption:=QB_ClieNombre.AsString
        else if Sender = MaskEdit3 then StaticText3.Caption:=QB_ClieNombre.AsString
             else StaticText2.Caption:=QB_ClieNombre.AsString
      except
        SetFocus;
        raise;
      end;
    end;
  end;
end;

procedure TFLIQREP28P.MaskEdit1Enter(Sender: TObject);
begin
  with Sender as TMaskEdit do
    Text:='';
  if Sender = MaskEdit1 then StaticText1.Caption:=''
  else StaticText2.Caption:='';
end;

procedure TFLIQREP28P.CheckBox2Click(Sender: TObject);
begin
  Label1.Enabled:=CheckBox2.Checked;
  Label2.Enabled:=CheckBox2.Checked;
  MaskEdit1.Enabled:=CheckBox2.Checked;
  MaskEdit2.Enabled:=CheckBox2.Checked;
  StaticText1.Enabled:=CheckBox2.Checked;
  StaticText2.Enabled:=CheckBox2.Checked;
  CheckBox3.Checked:=not CheckBox2.Checked;
end;

procedure TFLIQREP28P.CheckBox1Click(Sender: TObject);
begin
  DBLookUpComboBox2.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP28P.CheckBox5Click(Sender: TObject);
begin
  Label3.Enabled:=CheckBox5.Checked;
  MaskEdit3.Enabled:=CheckBox5.Checked;
end;

procedure TFLIQREP28P.DBLookupComboBox2Enter(Sender: TObject);
begin
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    if not DMLIQ.ValidaDerechoReportesConsultas(idLiq) then
      MaskEdit4.SetFocus;
  end;
end;

end.
