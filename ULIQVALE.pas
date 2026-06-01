unit ULIQVALE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Menus,db,
  Mask, DBTables, ToolWin, ImgList;

type
  TFLIQVALE = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBText1: TDBText;
    Bevel1: TBevel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    StaticText1: TStaticText;
    procedure Salir1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreparaForma;
  end;

var
  FLIQVALE: TFLIQVALE;

implementation

uses ULIBGRAL, DDMGEN, UGEN_NET,ULIBPRINT, ULIBDATABASE, DDMGAS, DDMGASQ, DDMCUP, DDMGENQ, UFormaPreverTxt,
  DDMLIQ, UGENCLIEB;

{$R *.DFM}

procedure TFLIQVALE.PreparaForma;
begin
  with DMGEN,DMCUP,DMGAS,DMGASQ,DMLIQ do begin
    if not VsAccesoRemoto then
      RefrescaQuery(QT_Turca);
    if QT_Turca.IsEmpty then
      raise Exception.Create('No existe turno abierto');
    AbreTablasLiqT('PVAL;VALE;DVAL');
  end;
end;

procedure TFLIQVALE.Salir1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQVALE.SpeedButton2Click(Sender: TObject);
begin
  RefrescaDataBase(DMGAS.DBGAS1);
  RefrescaDataBase(DMGAS.DBGAS2);
end;

procedure TFLIQVALE.DBGrid1DblClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if DBGrid1.SelectedField=T_PvalCliente then begin
      if FGENCLIEB.ShowModal=mrOk then begin
        SetEditOrInsert(T_Pval);
        T_PvalCliente.AsInteger:=FGENCLIEB.ClaveClie;
        DBGrid1.SetFocus;
      end;
    end;
  end;
end;

end.
