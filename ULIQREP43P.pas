unit ULIQREP43P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB, DBTables,
  ComCtrls;

type
  TFLIQREP43P = class(TForm)
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    MaskEdit2: TMaskEdit;
    StaticText2: TStaticText;
    CheckBox1: TCheckBox;
    QL_Ests: TQuery;
    QL_EstsCLAVE: TIntegerField;
    QL_EstsNOMBRE: TStringField;
    CheckBox2: TCheckBox;
    BCancelar: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure MaskEdit2Enter(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2DblClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BPreverClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure MaskEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP43P: TFLIQREP43P;

implementation

uses
  DDMGENQ,DDMGEN_VTAS,UGENCLIEB,ULIBGRAL,DDMGEN,ULIBDATABASE,UGEN_NET,
  DDMGAS, ULIQREP43;

{$R *.dfm}

procedure TFLIQREP43P.MaskEdit2Enter(Sender: TObject);
begin
  with Sender as TMaskEdit do
    Text:='';
  if Sender = MaskEdit2 then StaticText2.Caption:=''
end;

procedure TFLIQREP43P.MaskEdit2Exit(Sender: TObject);
begin
  with DMGENQ,DMGEN_VTAS do begin
    with Sender as TMaskEdit do begin
      if Text='' then exit;
      try
        if not BuscaQuery(QB_Clie,'pNoClie',StrtoInt(Text)) then
          raise Exception.Create('No existe Cliente');
        Text:=LlenaStr(Text,'D',6,'0');
        if Sender = MaskEdit2 then StaticText2.Caption:=QB_ClieNombre.AsString
      except
        SetFocus;
        raise;
      end;
    end;
  end;
end;

procedure TFLIQREP43P.MaskEdit2DblClick(Sender: TObject);
begin
  if FGENCLIEB.ShowModal=mrOK then with DMGEN do begin
    with Sender as TMaskEdit do begin
      Text:=InttoClaveCata(FGENCLIEB.ClaveClie,idClie);
    end;
    MaskEdit2Exit(Sender);
  end;
end;

procedure TFLIQREP43P.CheckBox1Click(Sender: TObject);
begin
  DBLookupComboBox2.Enabled:=not CheckBox1.Checked;
end;

procedure TFLIQREP43P.FormShow(Sender: TObject);
begin
  VgFechaIni:=DiaPrimero(FechaTrabajo);
  VgFechaFin:=FechaTrabajo;
  DateTimePicker1.DateTime:=VgFechaIni;
  DateTimePicker2.DateTime:=VgFechaFin;
  QL_Ests.Close;
  QL_Ests.Prepare;
  QL_Ests.Open;
  if DMGAS.VarLiqReportesEstacionActiva='Si' then begin
    DBLookUpComboBox2.KeyValue:=DMGAS.EstacionActual;
    DateTimePicker1.SetFocus;
  end
  else begin
    DBLookUpComboBox2.KeyValue:=QL_EstsCLAVE.AsInteger;
  end;  
end;

procedure TFLIQREP43P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP43P.BPreverClick(Sender: TObject);
begin
  VgFechaIni:=DateTimePicker1.DateTime;
  VgFechaFin:=DateTimePicker2.DateTime;
  if VgFechaIni>VgFechaFin then
    raise Exception.Create('Periodo Inválido');
  if (StrToIntDef(MaskEdit2.Text,-999999)=-999999) and (not CheckBox2.Checked) then
    raise Exception.Create('Favor de indicar un cliente');    
  Application.CreateForm(TFLIQREP43,FLIQREP43);
  try
    FLIQREP43.PreparaReporte;
    if sender=BImprimir then
      FLIQREP43.QuickRep1.Print
    else
      FLIQREP43.QuickRep1.Preview;
  finally
    FLIQREP43.Free;
  end;
end;

procedure TFLIQREP43P.CheckBox2Click(Sender: TObject);
begin
  MaskEdit2.Enabled:=not CheckBox2.Checked;
end;

procedure TFLIQREP43P.MaskEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
    Key:=#0;
end;

procedure TFLIQREP43P.DateTimePicker1Exit(Sender: TObject);
begin
  VgFechaIni:=DateTimePicker1.DateTime;
  if (DiaUltimo(VgFechaIni)<=FechaTrabajo) or (VgFechaIni>FechaTrabajo) then
    DateTimePicker2.DateTime:=DiaUltimo(VgFechaIni)
  else
    DateTimePicker2.DateTime:=FechaTrabajo;
end;

end.
