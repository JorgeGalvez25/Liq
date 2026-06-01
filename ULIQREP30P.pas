unit ULIQREP30P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Printers, DB, DBTables;

type
  TFLIQREP07P = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    btnPrever: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    PrintDialog1: TPrintDialog;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    MaskEdit3: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    StaticText5: TStaticText;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit3DblClick(Sender: TObject);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure btnPreverClick(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xcliente:integer;
    xnombre:string;
  end;

var
  FLIQREP07P: TFLIQREP07P;

implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS,
  UGASCLIETB, DDMGENQ, DDMGASQ, DDMGEN_VTAS, ULIQREP07;

{$R *.dfm}

procedure TFLIQREP07P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP07P.FormShow(Sender: TObject);
begin
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  MaskEdit1.EditMask:=MaskFecha2;
  MaskEdit2.EditMask:=MaskFecha2;
  MaskEdit1.Text:=FechaToFormato(VgFechaIni);
  MaskEdit2.Text:=FechaToFormato(VgFechaFin);
end;

procedure TFLIQREP07P.MaskEdit3DblClick(Sender: TObject);
begin
  FGASCLIETB.PreparaForma('','PP');
  if FGASCLIETB.ShowModal=mrOK then with DMGEN do begin
    MaskEdit3.Text:=IntToClaveCata(FGASCLIETB.ClaveClie,idClie);
    StaticText5.Caption:=FGASCLIETB.NombreClie;
    xcliente:=FGASCLIETB.ClaveClie;
    xnombre:=FGASCLIETB.NombreClie;
  end;
end;

procedure TFLIQREP07P.MaskEdit3Enter(Sender: TObject);
begin
  MaskEdit3.Text:='';
  StaticText5.Caption:='';
///  QL_Tran.Close;
end;

procedure TFLIQREP07P.MaskEdit3Exit(Sender: TObject);
begin
  with DMGENQ,DMGEN,DMGASQ,DMGEN_VTAS do begin
    if MaskEdit3.Text='' then
      exit;
    try
      if not BuscaQuery(QB_Clie,'pNoClie',StrtoInt(MaskEdit3.text)) then begin
        MaskEdit3.Text:='';
        raise Exception.Create('No existe Cliente');
      end;
      MaskEdit3.Text:=IntToClaveCata(StrToInt(MaskEdit3.text),idClie);
      xnombre:=QB_ClieNombre.AsString;
      xcliente:=QB_ClieNOCLIE.AsInteger;
      StaticText5.Caption:=QB_ClieNombre.AsString;
    except
      MaskEdit3.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQREP07P.btnPreverClick(Sender: TObject);
begin
  if (not CheckBox1.Checked) and (MaskEdit3.Text='') then
    raise Exception.Create('No sea Proporcionado el cliente');
  Application.CreateForm(TFLIQREP07,FLIQREP07);
  try
    FLIQREP07.PreparaForma;
    if Sender=btnPrever then
      FLIQREP07.QuickRep1.Preview
    else
      FLIQREP07.QuickRep1.Print;
  finally
    FLIQREP07.Free;
  end;            
end;

procedure TFLIQREP07P.MaskEdit1Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit1.text);
  MaskEdit2.Text:=FechaToFormato(DiaUltimo(VgFechaIni));
  VgFechaFin:=StrToDate(MaskEdit2.text);
end;

procedure TFLIQREP07P.MaskEdit2Exit(Sender: TObject);
begin
  VgFechaFin:=StrToDate(MaskEdit2.text);
end;

procedure TFLIQREP07P.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP07P.CheckBox1Click(Sender: TObject);
begin
  MaskEdit3.Enabled:=not CheckBox1.Checked;
  Label1.Enabled:=not CheckBox1.Checked;
  Label2.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP07P.BitBtn2Click(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

end.
