unit ULIQDESGLO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ExtCtrls, DBTables, StdCtrls, Buttons, DBCtrls;

type
  TFLIQDESGLO = class(TForm)
    Panel1: TPanel;
    DS_Auxi: TDataSource;
    StaticText1: TStaticText;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    StaticText3: TStaticText;
    StaticText2: TStaticText;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    StaticText4: TStaticText;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQDESGLO: TFLIQDESGLO;

implementation

uses DDMGEN, DDMGENT, ULIBDATABASE, ULIBGRAL, DDMGAS, ULIQREP05P;

{$R *.DFM}

procedure TFLIQDESGLO.FormShow(Sender: TObject);
begin
  with FLIQREP05P do begin
    StaticText4.Caption:=FechaPaq(VgFechaIni);
    StaticText1.Caption:=FechaPaq(VgFechaFin);
    TT_Auxi.First;
    TT_Auxi.Edit;
    TT_Auxi.Post;
    DBGrid1.SelectedIndex:=2;
    DBGrid1.SetFocus;
  end;
end;

end.
