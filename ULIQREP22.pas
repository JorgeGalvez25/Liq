unit ULIQREP22;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, RxMemDS;

type
  TFLIQREP22 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    ChBEnca: TQRChildBand;
    BndDt: TQRStringsBand;
    ChildBand1: TQRChildBand;
    QL_Dliqc: TQuery;
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_Bomb: TQuery;
    QL_BombMANGUERA: TIntegerField;
    QL_DliqcESTACION: TIntegerField;
    QL_DliqcFOLIO: TIntegerField;
    QL_DliqcBOMBA: TIntegerField;
    QL_DliqcISLA: TIntegerField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcPOSCARGA: TIntegerField;
    QL_DliqcFECHA: TDateTimeField;
    QL_DliqcTURNO: TIntegerField;
    QL_DliqcLEC_ANT: TFloatField;
    QL_DliqcLEC_ACT: TFloatField;
    QL_DliqcDEVOLUCION: TFloatField;
    QL_DliqcCANTIDAD: TFloatField;
    QL_DliqcPRECIO_CIVA: TFloatField;
    QL_DliqcIMPORTE: TFloatField;
    QL_DliqcAPLICADO: TStringField;
    QL_DliqcCALC: TStringField;
    TT_Auxi: TRxMemoryData;
    TT_AuxiNoReg: TIntegerField;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiIsla: TIntegerField;
    TT_AuxiManguera: TIntegerField;
    TT_AuxiCombustible: TIntegerField;
    TT_AuxiLecturaInicial: TFloatField;
    TT_AuxiLecturaFinal: TFloatField;
    TT_AuxiDevoluciones: TFloatField;
    TT_AuxiCantidad: TFloatField;
    TT_AuxiNombre: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..8] of TQRLabel;
    procedure CreaEtiquetas;
  public
    { Public declarations }
    pEstacion:Integer;
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=8;

var
  FLIQREP22: TFLIQREP22;
  xtp:char;
  xlin:string;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIQREP22P;

{$R *.DFM}

procedure TFLIQREP22.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Fecha';
        2:Caption:='Isla';
        3:Caption:='Manguera';
        4:Caption:='Combustible';
        5:Caption:='Lect.Inicial';
        6:Caption:='Lect.Final';
        7:Caption:='Devoluciones';
        8:Caption:='Cantidad';
      end;
      Case i of
        1:xw:=70;
        2:xw:=60;
        3:xw:=60;
        4:xw:=120;
        5,6:xw:=100;
        7:xw:=80;
        8:xw:=80;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      if i=1 then Alignment :=taLeftJustify
      else Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=true;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Tag       :=xl;
      Case i of
         2..3:Alignment :=taCenter;
         1,4:Alignment :=taLeftJustify;
      else
        Alignment :=taRightJustify;
      end;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=false;
      Frame.Width:=1;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP22.PreparaReporte;
var xno,i:integer;
    tot:Array[1..2] of real;
    xfecha:Tdatetime;
    xdev:real;
begin
  with DMGEN,DMLIQ,DMGAS,DMCUP,FLIQREP22P do begin
    CreaEtiquetas;
    TT_Auxi.Active:=true;
    BndDt.Items.Clear;
    for i:=1 to 2 do
      tot[i]:=0;
    xno:=0;
    xfecha:=VgFechaIni;
    QL_Bomb.Close;
    QL_Bomb.ParamByName('pestacion').AsInteger:=pEstacion;
    QL_Bomb.Prepare;
    QL_Bomb.Open;
    try
      FAvance.PreparaAvance('Preparando reporte...',true,DiasEntre(VgFechaIni,VgFechaFin));
      while xfecha<=VgFechaFin do begin
        QL_Bomb.First;
        while not QL_Bomb.Eof do begin
          for i:=1 to 2 do begin
            Q_Auxi.Close;
            Q_AuxiEntero1.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Case i of
              1:Q_Auxi.SQL.Add('Select Min(Turno) as Entero1 from DGASDLIQC');
              2:Q_Auxi.SQL.Add('Select Max(Turno) as Entero1 from DGASDLIQC');
            end;
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(pEstacion));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(xFecha)+'"');
            Q_Auxi.SQL.Add('  and Bomba='+IntToStr(QL_BombManguera.asinteger));
            Q_Auxi.Prepare;
            Q_Auxi.Open;

            QL_Dliqc.Close;
            QL_Dliqc.ParamByName('pestacion').AsInteger:=pEstacion;
            QL_Dliqc.ParamByName('pfecha').AsDateTime:=xFecha;
            QL_Dliqc.ParamByName('pturno').AsInteger:=Q_AuxiEntero1.AsInteger;
            QL_Dliqc.ParamByName('pbomba').AsInteger:=QL_BombManguera.AsInteger;
            QL_Dliqc.Prepare;
            QL_Dliqc.Open;
            if i=1 then begin
              TT_Auxi.Insert;
              TT_AuxiNoReg.AsInteger:=xno;
              TT_AuxiFecha.AsDateTime:=xFecha;
              TT_AuxiIsla.AsInteger:=QL_DliqcIsla.AsInteger;
              TT_AuxiManguera.AsInteger:=QL_DliqcBomba.AsInteger;
              TT_AuxiCombustible.AsInteger:=QL_DliqcCombustible.AsInteger;
              TT_AuxiLecturaInicial.AsFloat:=QL_DliqcLec_Ant.AsFloat;
            end
            else begin
              TT_AuxiLecturaFinal.AsFloat:=QL_DliqcLec_Act.AsFloat;
              Q_Auxi.Close;
              Q_AuxiReal1.FieldKind:=fkInternalCalc;
              Q_AuxiReal2.FieldKind:=fkInternalCalc;
              Q_Auxi.SQL.Clear;
              Q_Auxi.SQL.Add('Select Sum(Cantidad) as Real1, Sum(Devolucion) as Real2 from DGASDLIQC');
              Q_Auxi.SQL.Add('where estacion='+IntToStr(pEstacion));
              Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(xFecha)+'"');
              Q_Auxi.SQL.Add('  and Bomba='+IntToStr(QL_BombManguera.asinteger));
              Q_Auxi.Prepare;
              Q_Auxi.Open;
              TT_AuxiCantidad.AsFloat:=Q_AuxiReal1.AsFloat;
              TT_AuxiDevoluciones.AsFloat:=Q_AuxiReal2.AsFloat;
              TT_Auxi.Post;
              inc(xno);
            end;
          end;
          QL_Bomb.Next;
        end;
        FAvance.AvanzaPosicion;
        xFecha:=xFecha+1;
      end;
    finally
      FAvance.Close;
    end;
// Generando Reporte;
    TT_Auxi.SortOnFields('Fecha',true,false);
    TT_Auxi.First;
    FAvance.PreparaAvance('Generando reporte...',true,TT_Auxi.RecordCount);
    try
      while not TT_Auxi.Eof do begin
        xlin:='D//'+FechaPaq(TT_AuxiFecha.AsDateTime)+'//'+
                    IntToClaveNum(TT_AuxiIsla.AsInteger,2)+'//'+
                    IntToClaveNum(TT_AuxiManguera.AsInteger,2)+'//'+
                    TT_AuxiNombre.AsString+'//'+
                    FormatoMoneda(TT_AuxiLecturaInicial.AsFloat)+'//'+
                    FormatoMoneda(TT_AuxiLecturaFinal.AsFloat)+'//'+
                    FormatoMoneda(TT_AuxiDevoluciones.AsFloat)+'//'+
                    FormatoMoneda(TT_AuxiCantidad.AsFloat)+'//';
        BndDt.Items.Add(xlin);
        tot[1]:=tot[1]+TT_AuxiDevoluciones.AsFloat;
        tot[2]:=tot[2]+TT_AuxiCantidad.AsFloat;
        FAvance.AvanzaPosicion;
        TT_Auxi.Next;
      end;
    finally
      FAvance.Close;
      xlin:='T//';
      for i:=1 to 2 do begin
        InsertaElemStr(FormatoMoneda(tot[i]),6+i,xlin);
      end;
      BndDt.Items.Add(xlin);
    end;
  end;
end;

procedure TFLIQREP22.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP22P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP22.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with QRLabelDeta[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Font.Size:=8;
        Left:=Tag;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>1 then Frame.DrawTop:=true
          else Frame.DrawTop:=false;
        end;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDeta[k].Caption:=ExtraeElemStr(xlin,k-ri+2);
    end;
  end;

begin
  BndDt.Frame.DrawBottom:=false;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
end;

procedure TFLIQREP22.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
