unit ULIQDLIQE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ExtCtrls, DBTables, StdCtrls, Buttons, DBCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxCurrencyEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid;

type
  TFLIQDLIQE = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DENOMINACION: TcxGridDBColumn;
    cxGrid1DBTableView1CANTIDAD: TcxGridDBColumn;
    cxGrid1DBTableView1IMPORTE: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    xTotal:real;
    procedure Totaliza;
  public
    { Public declarations }
  end;

var
  FLIQDLIQE: TFLIQDLIQE;

implementation

uses DDMGEN, DDMGENT, ULIBDATABASE, ULIBGRAL, DDMGAS, DDMLIQ, UGENCLIEB;

{$R *.DFM}

procedure TFLIQDLIQE.FormShow(Sender: TObject);
begin
  Totaliza;
  DMLIQ.T_Dliqe.First;
  cxGrid1.SetFocus;
end;

procedure TFLIQDLIQE.Totaliza;
var bm:TBookMark;
begin
  with DMGAS,DMLIQ do begin
    try
      T_Dliqe.DisableControls;
      bm:=T_Dliqe.GetBookmark;
      T_Dliqe.First;
      xTotal:=0;
      while not T_Dliqe.Eof do begin
        xTotal:=xTotal+T_DliqeIMPORTE.AsFloat;
        T_Dliqe.Next;
      end;
    finally
      T_Dliqe.GotoBookmark(bm);
      T_Dliqe.FreeBookmark(bm);
      T_Dliqe.EnableControls;
    end;
  end;
end;

procedure TFLIQDLIQE.DBGrid1Exit(Sender: TObject);
begin
  with DMLIQ do begin
    if (T_Dliqe.State=dsInsert)and(T_DliqeIMPORTE.Asfloat<0.001) then
      T_Dliqe.Cancel;
    if T_Dliqe.State=dsEdit then
      T_Dliqe.Post;
    Totaliza;
  end;
end;

procedure TFLIQDLIQE.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with DMGAS,DMLIQ do begin
    if ModalResult=mrOk then begin
      Totaliza;
      T_DliqpIMPORTE.AsFloat:=xTotal;
    end;
  end;
end;

procedure TFLIQDLIQE.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  with DMLIQ do begin
    if key=idEnter then begin
      key:=VK_DOWN;
    end;
  end;
end;

end.
