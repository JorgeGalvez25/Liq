unit ULIQTURCJT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, DB, DBTables;

type
  TFLIQTURCJT = class(TForm)
    QL_Desp: TQuery;
    QL_DespCLAVE: TIntegerField;
    QL_DespNOMBRE: TStringField;
    QL_DespCTACNT: TStringField;
    QL_DespESTACION: TIntegerField;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText4: TDBText;
    Label2: TLabel;
    Label8: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBText2: TDBText;
    DSQL_Desp: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQTURCJT: TFLIQTURCJT;

implementation

uses DDMLIQ, DDMGAS, DDMGASQ;

{$R *.dfm}

procedure TFLIQTURCJT.FormShow(Sender: TObject);
begin
  QL_Desp.Close;
  QL_Desp.ParamByName('pEstacion').AsInteger:=DMGAS.T_TurcESTACION.AsInteger;
  QL_Desp.Prepare;
  QL_Desp.Open;
end;

end.
