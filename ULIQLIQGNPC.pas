unit ULIQLIQGNPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TFLIQLIQGNPC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1IMPORTE: TcxGridDBColumn;
    cxGrid1DBTableView1NombreCliente: TcxGridDBColumn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQLIQGNPC: TFLIQLIQGNPC;

implementation

{$R *.dfm}

Uses DDMLIQ;

procedure TFLIQLIQGNPC.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
