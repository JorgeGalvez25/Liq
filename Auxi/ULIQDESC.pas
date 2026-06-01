unit ULIQDESC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, DBCtrls, Grids, DBGrids, Buttons,
  ComCtrls, ToolWin, ExtCtrls;

type
  TFLIQDESC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    MesBox1: TComboBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    TBAjusta: TToolButton;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    DBNavigator1: TDBNavigator;
    StaticText2: TStaticText;
    Panel4: TPanel;
    Panel5: TPanel;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    T_Desc: TTable;
    T_Descd: TTable;
    Ds_Desc: TDataSource;
    T_DescESTACION: TIntegerField;
    T_DescFECHA: TDateTimeField;
    T_DescTURNO: TIntegerField;
    T_DescTOTAL: TFloatField;
    T_DescDESCUENTO: TFloatField;
    T_DescdESTACION: TIntegerField;
    T_DescdFECHA: TDateTimeField;
    T_DescdTURNO: TIntegerField;
    T_DescdCOMBUSTIBLE: TIntegerField;
    T_DescdLITROS: TFloatField;
    T_DescdPRECIO: TFloatField;
    T_DescdIMPORTE: TFloatField;
    T_DescdDESCUENTO: TFloatField;
    T_DescdTOTAL: TFloatField;
    T_DescdNombreCombustible: TStringField;
    Ds_Descd: TDataSource;
    Q_DescD: TQuery;
    T_DescContabilizado: TStringField;
    T_DescdISLA: TIntegerField;
    Q_DescDCOMBUSTIBLE: TIntegerField;
    Q_DescDNombreCombustible: TStringField;
    Q_DescDLITROS: TFloatField;
    Q_DescDPRECIO: TFloatField;
    Q_DescDIMPORTE: TFloatField;
    Q_DescDDESCUENTO: TFloatField;
    Q_DescDTOTAL: TFloatField;
    DsQ_DescD: TDataSource;
    Bitsalir: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure MesBox1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure TBAjustaClick(Sender: TObject);
    procedure T_DescCalcFields(DataSet: TDataSet);
    procedure T_DescAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefrescaTabla;
    procedure Totaliza;
  end;

var
  FLIQDESC: TFLIQDESC;

implementation

uses
  ULIBGRAL, DDMGEN, DDMGAS, DDMGASQ, ULIBDATABASE, DDMCONS, DateUtils, DDMAJUS;

{$R *.dfm}

{ TFLIQDESC }

procedure TFLIQDESC.RefrescaTabla;
var feci,fecf:TDateTime;
begin
  with DMGEN,DMGASQ,DMGAS do begin
    feci:=MesDiaToFecha(ElementoActualMesBox(MesBox1),1);
    fecf:=MesDiaMaxToFecha(ElementoActualMesBox(MesBox1));
    T_Desc.Active:=false;
    T_Desc.Filter:='Estacion='+IntToStr(EstacionActual)+
                    ' and Fecha>='''+FechaToFormato(feci)+''' and Fecha<='''+FechaToFormato(fecf)+'''';
    T_Desc.Filtered:=true;
    T_Desc.Active:=true;
    T_Descd.Active:=true;
    VgMes:=FechaToMes(fecf);
    Q_DescD.Open;
    Totaliza;
  end;
end;

procedure TFLIQDESC.FormShow(Sender: TObject);
begin
  IniciaMesBox(MesBox1,MesIniEjercicio(DMGEN.MesInicial(idLiq)),MesFinEjercicio,VgMes,false);
  RefrescaTabla;
end;

procedure TFLIQDESC.MesBox1Change(Sender: TObject);
begin
  RefrescaTabla;
end;

procedure TFLIQDESC.Totaliza;
var BM:TBookMark;
    total:real;
begin
  T_Desc.DisableControls;
  BM:=T_Desc.GetBookMark;
  total:=0;
  try
    T_Desc.First;
    while not T_Desc.eof do begin
      total:=total+T_DescTotal.AsFloat;
      T_Desc.Next;
    end;
    StaticText2.Caption:=FormatoMoneda(total);
  finally
    T_Desc.EnableControls;
    T_Desc.GotoBookmark(BM);
    T_Desc.FreeBookmark(BM);
  end;
end;

procedure TFLIQDESC.ToolButton1Click(Sender: TObject);
var
  i:Integer;
  totDesc,totImp,desc:Double;
  iepsMagna,iepsPremium,iepsDiesel:Double;
begin
  with DMCONS do begin
    if T_DescContabilizado.AsString='Si' then
      raise Exception.Create('Turno ya se encuentra contabilizado.');

    if (DMGEN.VarComp('AliasAuxiliar')<>'') and (Sender=ToolButton1) then begin
      with DMAJUS do begin
        TL_Ajud.Open;
        if not TL_Ajud.Locate('ESTACION;FECHA',VarArrayOf([T_DescESTACION.AsInteger,T_DescFECHA.AsDateTime]),[]) then
          raise Exception.Create('Turno no ha sido ajustado.')
        else if TL_AjudAPLICADO.AsString<>'Si' then
          raise Exception.Create('Turno no ha sido ajustado.');
      end;
    end;

    if Sender=ToolButton1 then
      desc:=StrToFloatDef(VariableDeMemo(T_EstsIbCONSOLA,'PorcentajeDescuento'),-1)/100
    else
      desc:=0;

    if desc<0 then desc:=0;
    if desc>0.05 then desc:=0.05;

    totImp:=0;
    totDesc:=0;
    iepsMagna:=0;
    iepsPremium:=0;
    iepsDiesel:=0;

    if Sender=ToolButton1 then with DMGAS do begin
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT IEPSENPESOS AS REAL1 FROM DGASIEPS WHERE MES=(SELECT MAX(MES) FROM DGASIEPS');
      Q_Auxi.SQL.Add('WHERE MES<='+QuotedStr(ElementoActualMesBox(MesBox1))+') ORDER BY COMBUSTIBLE');
      Q_Auxi.Open;

      for i:=1 to 3 do begin
        case i of
          1:iepsMagna:=Q_AuxiReal1.AsFloat;
          2:iepsPremium:=Q_AuxiReal1.AsFloat;
          3:iepsDiesel:=Q_AuxiReal1.AsFloat;
        end;
        Q_Auxi.Next;
      end;
    end;

    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('UPDATE DPVGMOVI SET DESCUENTO=ROUND((IMPORTE-(VOLUMEN*'+FloatToStr(iepsMagna)+'))*'+FloatToStr(desc)+',2) WHERE FECHA=:FECHA');
    Q_Auxi.SQL.Add('AND TURNO=:TURNO AND TIPOPAGO IN (0,1,8) AND FACTURADO=''No'' AND IMPRESO=''No'' AND COMBUSTIBLE=1');
    Q_Auxi.ParamByName('FECHA').AsDateTime:=T_DescFECHA.AsDateTime;
    Q_Auxi.ParamByName('TURNO').AsInteger:=T_DescTURNO.AsInteger;
    Q_Auxi.ExecSQL;

    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('UPDATE DPVGMOVI SET DESCUENTO=ROUND((IMPORTE-(VOLUMEN*'+FloatToStr(iepsPremium)+'))*'+FloatToStr(desc)+',2) WHERE FECHA=:FECHA');
    Q_Auxi.SQL.Add('AND TURNO=:TURNO AND TIPOPAGO IN (0,1,8) AND FACTURADO=''No'' AND IMPRESO=''No'' AND COMBUSTIBLE=2');
    Q_Auxi.ParamByName('FECHA').AsDateTime:=T_DescFECHA.AsDateTime;
    Q_Auxi.ParamByName('TURNO').AsInteger:=T_DescTURNO.AsInteger;
    Q_Auxi.ExecSQL;

    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('UPDATE DPVGMOVI SET DESCUENTO=ROUND((IMPORTE-(VOLUMEN*'+FloatToStr(iepsDiesel)+'))*'+FloatToStr(desc)+',2) WHERE FECHA=:FECHA');
    Q_Auxi.SQL.Add('AND TURNO=:TURNO AND TIPOPAGO IN (0,1,8) AND FACTURADO=''No'' AND IMPRESO=''No'' AND COMBUSTIBLE=3');
    Q_Auxi.ParamByName('FECHA').AsDateTime:=T_DescFECHA.AsDateTime;
    Q_Auxi.ParamByName('TURNO').AsInteger:=T_DescTURNO.AsInteger;
    Q_Auxi.ExecSQL;

    T_Descd.First;
    while not T_Descd.Eof do begin
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_AuxiReal2.FieldKind:=fkInternalCalc;
      Q_AuxiReal3.FieldKind:=fkInternalCalc;
      Q_AuxiReal4.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Add('SELECT COMBUSTIBLE, ROUND(AVG(PRECIO),2) AS REAL1, COALESCE(SUM(VOLUMEN),0) AS REAL2, COALESCE(SUM(IMPORTE),0) AS REAL3,');
      Q_Auxi.SQL.Add('COALESCE(SUM(DESCUENTO),0) AS REAL4 FROM DPVGMOVI WHERE FECHA=:FECHA AND TURNO=:TURNO AND COMBUSTIBLE='+T_DescdCOMBUSTIBLE.AsString);
      Q_Auxi.SQL.Add('AND POSCARGA IN (SELECT POSCARGA FROM DPVGBOMB WHERE ISLA='+T_DescdISLA.AsString+')');       
      Q_Auxi.SQL.Add('GROUP BY COMBUSTIBLE');
      Q_Auxi.ParamByName('FECHA').AsDateTime:=T_DescFECHA.AsDateTime;
      Q_Auxi.ParamByName('TURNO').AsInteger:=T_DescTURNO.AsInteger;
      Q_Auxi.Open;

      T_Descd.Edit;
      T_DescdLITROS.AsFloat:=Q_AuxiReal2.AsFloat;
      T_DescdPRECIO.AsFloat:=Q_AuxiReal1.AsFloat;
      T_DescdIMPORTE.AsFloat:=Q_AuxiReal3.AsFloat;
      T_DescdDESCUENTO.AsFloat:=Q_AuxiReal4.AsFloat;
      T_DescdTOTAL.AsFloat:=Q_AuxiReal3.AsFloat-Q_AuxiReal4.AsFloat;
      T_Descd.Post;
      T_Descd.Next;

      totImp:=totImp+(Q_AuxiReal3.AsFloat-Q_AuxiReal4.AsFloat);
      totDesc:=totDesc+Q_AuxiReal4.AsFloat;
    end;

    T_Desc.Edit;
    T_DescTOTAL.AsFloat:=totImp;
    T_DescDESCUENTO.AsFloat:=totDesc;
    T_Desc.Post;
    Q_DescD.Open;
    Totaliza;
  end;
end;

procedure TFLIQDESC.TBAjustaClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQDESC.T_DescCalcFields(DataSet: TDataSet);
begin
  with DMGASQ do begin
    QT_Turc.close;
    QT_Turc.ParamByName('pEstacion').asinteger:=T_DescESTACION.AsInteger;
    QT_Turc.ParamByName('pCaja').asinteger:=DMGAS.CajaActual;
    QT_Turc.ParamByName('pFecha').asdatetime:=T_DescFECHA.AsDateTime;
    QT_Turc.open;
    LocalizaQuery(QT_Turc,'ESTACION;FECHA;TURNO',VarArrayOf([T_DescESTACION.AsInteger,T_DescFECHA.AsDateTime,T_DescTURNO.AsInteger]));
    T_DescContabilizado.AsString:=QT_TurcCONTABILIZADO.AsString;
  end;
end;

procedure TFLIQDESC.T_DescAfterScroll(DataSet: TDataSet);
begin
  ToolButton1.Enabled:=(T_DescDESCUENTO.AsFloat=0) and (not T_Desc.IsEmpty);
  ToolButton2.Enabled:=T_DescDESCUENTO.AsFloat>0;
end;

end.
