unit ULIQREP45P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DB, CheckLst;

type
  TFLIQREP45P = class(TForm)
    Panel2: TPanel;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    MaskEdit3: TMaskEdit;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    CheckListBox1: TCheckListBox;
    PrintDialog1: TPrintDialog;
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BOpcionesClick(Sender: TObject);
    procedure BPreverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQREP45P: TFLIQREP45P;

implementation

uses
  DDMGAS, ULIBGRAL, ULIBDATABASE, ULIQREP45;

{$R *.dfm}

procedure TFLIQREP45P.FormShow(Sender: TObject);
begin
  with DMGAS do begin
    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_AuxiStr40.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Add('SELECT NOMBRE AS STR40 FROM DGASTCMB WHERE CLAVE<=3');
    Q_Auxi.Open;
    while not Q_Auxi.Eof do begin
      CheckListBox1.Items.Add(Q_AuxiStr40.AsString);
      CheckListBox1.Checked[CheckListBox1.Items.IndexOf(Q_AuxiStr40.AsString)]:=True;
      Q_Auxi.Next;
    end;
  end;
  MaskEdit3.EditMask:=MaskFecha2;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
end;

procedure TFLIQREP45P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP45P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP45P.BPreverClick(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  VgFechaFin:=StrToDate(MaskEdit4.text);
  if VgFechaIni>VgFechaFin then
    raise Exception.Create('Periodo Inválido');
  if (not CheckListBox1.Checked[0]) and (not CheckListBox1.Checked[1]) and (not CheckListBox1.Checked[2]) then
    raise Exception.Create('Debe ser seleccionar al menos un combustible.');
  Application.CreateForm(TFLIQREP45,FLIQREP45);
  try
    FLIQREP45.PreparaReporte;
    if (sender = BImprimir)
    then FLIQREP45.QuickRep1.Print
    else FLIQREP45.QuickRep1.Preview;
  finally
    FLIQREP45.Free;
  end;
end;

end.
