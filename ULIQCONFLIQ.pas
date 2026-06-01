unit ULIQCONFLIQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB;

type
  TFLIQCONFLIQ = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    chIncluirAceites: TCheckBox;
    chIslasValesCredito: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PreparaForma;
    { Public declarations }
  end;

var
  FLIQCONFLIQ: TFLIQCONFLIQ;
  IncluirAceites:String;
  IslasValesCredito:String;

implementation

uses DDMGAS, ULIBGRAL, ULIBDATABASE;

{$R *.dfm}

procedure TFLIQCONFLIQ.PreparaForma;
begin
  with DMGAS do begin
    try
      Q_Auxi.Close;
      Q_AuxiStr2.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT INCLUIR_ACEITES as Str2 FROM DGASCONFLIQ');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      IncluirAceites := Q_AuxiStr2.AsString;

      Q_Auxi.Close;
      Q_AuxiStr2.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT INCLUIR_ISLAS_VC as Str2 FROM DGASCONFLIQ');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      IslasValesCredito := Q_AuxiStr2.AsString;
    finally
      Q_Auxi.Close;

      chIncluirAceites.Checked    := IncluirAceites = 'Si';
      chIslasValesCredito.Checked := IslasValesCredito = 'Si';
    end;
  end;
end;

procedure TFLIQCONFLIQ.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQCONFLIQ.BitBtn2Click(Sender: TObject);
begin
  chIncluirAceites.Checked    := IncluirAceites = 'Si';
  chIslasValesCredito.Checked := IslasValesCredito = 'Si';
end;

procedure TFLIQCONFLIQ.BitBtn1Click(Sender: TObject);
begin
  with DMGAS do begin
    try
      if chIncluirAceites.Checked then IncluirAceites := 'Si'
      else  IncluirAceites := 'No';

      if chIslasValesCredito.Checked then IslasValesCredito := 'Si'
      else  IslasValesCredito := 'No';

      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('UPDATE DGASCONFLIQ SET INCLUIR_ACEITES = '+QuotedStr(IncluirAceites));
      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;

      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('UPDATE DGASCONFLIQ SET INCLUIR_ISLAS_VC = '+QuotedStr(IslasValesCredito));
      Q_Auxi.Prepare;
      Q_Auxi.ExecSQL;
    finally
      Q_Auxi.Close;
      MensajeInfo('La configuración se guardó correctamente.');

      RefrescaDataBase(DMGAS.DBGAS2);
      Close;
    end;
  end;
end;

end.
