unit ULIQLTPAG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CheckLst, DB;

type
  TFLIQLTPAG = class(TForm)
    CheckListBox1: TCheckListBox;
    Panel1: TPanel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQLTPAG: TFLIQLTPAG;

implementation

uses
  DDMGAS, DDMGEN, ULIBGRAL;

{$R *.dfm}

procedure TFLIQLTPAG.FormShow(Sender: TObject);
begin
  with DMGAS do begin
    ListTPag.Clear;
    CheckListBox1.Items.Clear;
    CheckListBox1.Checked[CheckListBox1.Items.Add('Crédito y Prepago')]:=True;
    CheckListBox1.Checked[CheckListBox1.Items.Add('Vales')]:=True;
    CheckListBox1.Checked[CheckListBox1.Items.Add('Cupones')]:=True;
    if DMGEN.VarComp('ServiciosMaster')='Si' then begin
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiStr2.FieldKind:=fkInternalCalc;
      Q_AuxiStr50.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT CLAVE AS STR2, DESCRIPCION AS STR50 FROM DGASTPAG WHERE CLASE=''Otros''');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      while not Q_Auxi.Eof do begin
        CheckListBox1.Checked[CheckListBox1.Items.Add(Q_AuxiStr2.AsString+' - '+Q_AuxiStr50.AsString)]:=True;;
        if Self.Height<=400 then begin
          CheckListBox1.Height:=CheckListBox1.Height+20;
          Self.Height:=Self.Height+20;
        end;
        Q_Auxi.Next;
      end;
    end;
  end;
end;

procedure TFLIQLTPAG.FormClose(Sender: TObject; var Action: TCloseAction);
var i:Integer;
begin
  for i:=0 to CheckListBox1.Items.Count-1 do begin
    if CheckListBox1.Checked[i] then
      DMGAS.ListTPag.Add(CheckListBox1.Items[i]);
  end;
end;

end.
