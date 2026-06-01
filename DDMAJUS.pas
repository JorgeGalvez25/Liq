unit DDMAJUS;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TDMAJUS = class(TDataModule)
    DBAJUS1: TDatabase;
    TL_Ajud: TTable;
    TL_AjudEstacion: TIntegerField;
    TL_AjudFECHA: TDateTimeField;
    TL_AjudAPLICADO: TStringField;
    TL_AjudTOTAL: TFloatField;
    TL_AjudTURNO: TIntegerField;
    DSL_Ajud: TDataSource;
    TL_Ajud2: TTable;
    TL_Ajud2ESTACION: TIntegerField;
    TL_Ajud2FECHA: TDateTimeField;
    TL_Ajud2COMBUSTIBLE: TIntegerField;
    TL_Ajud2VOLUMEN: TFloatField;
    TL_Ajud2VENTA: TFloatField;
    TL_Ajud2DIFERENCIA: TFloatField;
    TL_Ajud2PRECIO: TFloatField;
    TL_Ajud2TOTAL: TFloatField;
    TL_Ajud2NombreCombustible: TStringField;
    DSL_Ajud2: TDataSource;
    Q_AuxiAjus: TQuery;
    Q_AuxiAjusEntero1: TIntegerField;
    Q_AuxiAjusReal1: TFloatField;
    TL_Ajud2TURNO: TIntegerField;
    Q_AuxiAjusEntero2: TIntegerField;
    procedure TL_AjudAfterDelete(DataSet: TDataSet);
    procedure TL_AjudAfterEdit(DataSet: TDataSet);
    procedure TL_Ajud2AfterInsert(DataSet: TDataSet);
    procedure Q_AuxiAjusAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Totaliza;
  end;

var
  DMAJUS: TDMAJUS;

implementation

uses DDMGAS, DDMGASQ, ULIBGRAL;

{$R *.dfm}

procedure TDMAJUS.Totaliza;
var BM:TBookMark;
    total:real;
begin
  TL_Ajud.DisableControls;
  BM:=TL_Ajud.GetBookMark;
  total:=0;
  try
    TL_Ajud.First;
    while not TL_Ajud.eof do begin
      if TL_AjudAplicado.AsString='Si' then
        total:=total+TL_AjudTotal.AsFloat;
      TL_Ajud.Next;
    end;
//    StaticText2.Caption:=FormatoMoneda(total);
  finally
    TL_Ajud.EnableControls;
    TL_Ajud.GotoBookmark(BM);
    TL_Ajud.FreeBookmark(BM);
  end;
end;

procedure TDMAJUS.TL_AjudAfterDelete(DataSet: TDataSet);
begin
  Totaliza;
end;

procedure TDMAJUS.TL_AjudAfterEdit(DataSet: TDataSet);
begin
  if (TL_AjudAplicado.AsString='Si') then begin
    TL_Ajud.Cancel;
    MensajeErr('No se puede cambiar fecha');
  end;
end;

procedure TDMAJUS.TL_Ajud2AfterInsert(DataSet: TDataSet);
begin
  TL_Ajud2.Cancel;
end;

procedure TDMAJUS.Q_AuxiAjusAfterClose(DataSet: TDataSet);
begin
  Q_AuxiAjusEntero1.FieldKind:=fkCalculated;
  Q_AuxiAjusEntero2.FieldKind:=fkCalculated;
  Q_AuxiAjusReal1.FieldKind:=fkCalculated;
end;

end.
