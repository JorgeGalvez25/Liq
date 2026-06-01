unit ULIQDTPAG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ExtCtrls, DBTables, StdCtrls, Buttons, DBCtrls;

type
  TFLIQDTPAG = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    StaticText2: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    xTotal:real;
    procedure Totaliza;
  public
    { Public declarations }
  end;

var
  FLIQDTPAG: TFLIQDTPAG;

implementation

uses DDMGEN, DDMGENT, ULIBDATABASE, ULIBGRAL, DDMGAS, DDMLIQ, UGENCLIEB;

{$R *.DFM}

procedure TFLIQDTPAG.FormShow(Sender: TObject);
begin
  Totaliza;
  DBGrid1.SetFocus;
end;

procedure TFLIQDTPAG.DBGrid1DblClick(Sender: TObject);
begin
  with DMGEN,DMGAS,DMLIQ do begin
    if DBGrid1.SelectedField=T_DtpagCliente then begin
      if FGENCLIEB.ShowModal=mrOk then begin
        SetEditOrInsert(T_Dtpag);
        T_DtpagCliente.AsInteger:=FGENCLIEB.ClaveClie;
        T_DtpagNombre.AsString:=FGENCLIEB.NombreClie;
        DBGrid1.SelectedIndex:=2;
      end;
    end;
  end;
end;

procedure TFLIQDTPAG.Totaliza;
var bm:TBookMark;
begin
  with DMGAS,DMLIQ do begin
    try
      T_Dtpag.DisableControls;
      bm:=T_Dtpag.GetBookmark;
      T_Dtpag.First;
      xTotal:=0;
      while not T_Dtpag.Eof do begin
        xTotal:=xTotal+T_DtpagImporte.AsFloat;
        T_Dtpag.Next;
      end;
    finally
      StaticText2.Caption:=FormatoMoneda(xTotal);
      T_Dtpag.GotoBookmark(bm);
      T_Dtpag.FreeBookmark(bm);
      T_Dtpag.EnableControls;
    end;
  end;
end;

procedure TFLIQDTPAG.DBGrid1Exit(Sender: TObject);
begin
  with DMLIQ do begin
    if (T_Dtpag.State=dsInsert)and(T_DtpagImporte.Asfloat<0.001) then
      T_Dtpag.Cancel;
    if T_Dtpag.State=dsEdit then
      T_Dtpag.Post;
    Totaliza;
  end;
end;

procedure TFLIQDTPAG.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  with DMGAS,DMLIQ do begin
    if ModalResult=mrOk then begin
      if Abs(xTotal-T_DliqpImporte.AsFloat)>0.001 then begin
        CanClose:=false;
        MensajeErr('La Suma del Desglose es diferente al Importe del Pago');
      end;
    end;
  end;
end;

procedure TFLIQDTPAG.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var BM:TBookMark;
begin
  with DMLIQ do begin
    if key=idF2 then begin
      if DBGrid1.SelectedField=T_DtpagImporte then begin
        SetEditOrInsert(T_Dtpag);
        T_DtpagImporte.AsFloat:=0;
        T_Dtpag.Post;
        Totaliza;
        T_Dtpag.Edit;
        T_DtpagImporte.AsFloat:=T_DliqpImporte.AsFloat-xTotal;
      end;
    end;
    if key=idEnter then begin
      BitBtn1.SetFocus;
      BitBtn1.Click;
    end;
  end;

end;

end.
