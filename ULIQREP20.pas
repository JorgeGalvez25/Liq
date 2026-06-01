unit ULIQREP20;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport, QrPrntr;

type
  TFLIQREP20 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    ChBEnca: TQRChildBand;
    BndDt: TQRStringsBand;
    ChildBand1: TQRChildBand;
    QL_Dliqp: TQuery;
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    TT_Auxi: TTable;
    TT_AuxiNoReg: TIntegerField;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiIndice: TIntegerField;
    TT_AuxiImporte: TFloatField;
    QL_DliqpFECHA: TDateTimeField;
    QL_DliqpTOTAL: TFloatField;
    TT_AuxiClase: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
    QRLabelEnca,
    QRLabelDeta:array [1..30] of TQRLabel;
    procedure CreaEtiquetas;
    procedure CreaTablaTemp;
  public
    { Public declarations }
    pWidth:integer;
    procedure PreparaReporte(xModo:integer);
  end;

Const
  xLeft=8;
  NoEti=5;

var
  FLIQREP20: TFLIQREP20;
  xtp:char;
  xlin:string;
  ListaClaves:TStringList;
  xnoEti:word;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, ULIQREP20P, UAVANCE;

{$R *.DFM}

procedure TFLIQREP20.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xnoEti:=ListaClaves.Count+2;
  xw:=pWidth div xnoEti;
  if xw>100 then xw:=100;
  xl:=xLeft;
  for i:=1 to xnoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      if i=1 then Caption:='Fecha'
      else if i=xNoEti then Caption:='Total'
        else Caption:=ExtraeElemStr(ListaClaves[i-2],2);
      Autosize  :=false;
      Left      :=xl;
      if i=1 then Width:=70 else Width:=xw;
      Top       :=2;
      if i=1 then Alignment :=taLeftJustify
      else Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size:=7;
      if i in [1,xnoEti] then Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=true;
      if i=xnoEti then Frame.DrawRight:=false;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Tag       :=xl;
      if i<2 then Alignment :=taLeftJustify
      else Alignment :=taRightJustify;
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

procedure TFLIQREP20.PreparaReporte;
var xno,i,xestacion,xind:word;
    xfecha:TdateTime;
    ajuste,importe,impdia:real;
    swefectivo:boolean;
    tot: Array[0..29] of real;
    ItemChecked: Boolean;
begin
  with DMGEN,DMLIQ,DMGAS,FLIQREP20P do begin
    ModoRep:=xModo;
    xestacion:=DBLookUpComboBox2.KeyValue;
    ListaClaves:=TStringList.Create;

    for i:=0 to CheckListBox1.Items.Count-1 do begin
      if CheckListBox1.Checked[i] then begin
        QL_Tpag.GotoBookmark(CheckListBox1.Items.Objects[i]);
        ListaClaves.Add(QL_TpagClave.AsString+'//'+QL_TpagDescripcion.AsString+'//'+QL_TpagClase.AsString);
        ItemChecked := True;
      end;
    end;
     if (Not ItemChecked) then begin
      raise Exception.Create('Es necesario seleccionar un tipo de pago.');
    end;
    CreaEtiquetas;
    InicializaTemp(TT_Auxi);
    CreaTablaTemp;
    for i:=0 to xnoEti do
      tot[i]:=0;
    BndDt.Items.Clear; xno:=0;
    try
      FAvance.PreparaAvance('Clasificando pagos...',true,ListaClaves.Count-1);
      for i:=0 to ListaClaves.Count-1 do begin
        QL_Dliqp.Close;
        QL_Dliqp.SQL.Clear;
        QL_Dliqp.SQL.Add('Select fecha,sum(importe) as total from DGASDLIQP');
        QL_Dliqp.SQL.Add(' Where Estacion='+IntToStr(xestacion));
        QL_Dliqp.SQL.Add('   and Fecha>="'+FechaToStrSQL(VgFechaIni)+'"');
        QL_Dliqp.SQL.Add('   and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
        QL_Dliqp.SQL.Add('   and Clave_Pago="'+ExtraeElemStr(ListaClaves[i],1)+'"');
        QL_Dliqp.SQL.Add('Group by Fecha');
        QL_Dliqp.SQL.Add('Order by Fecha');
        QL_Dliqp.Prepare;
        QL_Dliqp.Open;
        while not QL_Dliqp.Eof do begin
          TT_Auxi.Insert;
          TT_AuxiNoReg.AsInteger:=xno;
          TT_AuxiFecha.AsDateTime:=QL_DliqpFecha.AsDateTime;
          TT_AuxiIndice.AsInteger:=i;
          TT_AuxiImporte.AsFloat:=QL_DliqpTotal.AsFloat;
          TT_AuxiClase.AsString:=ExtraeElemStr(ListaClaves[i],3);
          TT_Auxi.Post;
          inc(xno);
          QL_Dliqp.Next;
        end;
        FAvance.AvanzaPosicion;
      end;
    finally
      FAvance.Close;
    end;
    TT_Auxi.First;
    FAvance.PreparaAvance('Generando reporte...',true,TT_Auxi.RecordCount);
    try
      while not TT_Auxi.Eof do begin
//ajuste
        if ModoRep=0 then with DMGAS do begin
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(Total) as Real1 from DGASAJUD2');
          Q_Auxi.SQL.Add('Where Estacion='+IntToStr(xestacion));
          Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(TT_AuxiFecha.AsDateTime)+'"');
          Q_Auxi.Prepare;
          Q_Auxi.Open;
          ajuste:=Q_AuxiReal1.AsFloat;
        end
        else ajuste:=0;
        swefectivo:=false;
        xfecha:=TT_AuxiFecha.AsDateTime;
        xind:=0; impdia:=0;
        xlin:='D//'+FechaPaq(xfecha)+'//';
        while (xfecha=TT_AuxiFecha.AsDateTime)and(not TT_Auxi.Eof) do begin
          importe:=TT_AuxiImporte.AsFloat;
          if (not swefectivo)and(TT_AuxiClase.AsString=idClaseEfectivo) then begin
            importe:=importe-ajuste;
            swefectivo:=true;
          end;
          if (TT_AuxiIndice.AsInteger-xind)>1 then begin
            for i:=1 to TT_AuxiIndice.AsInteger-xind-1 do
              xlin:=xlin+'0.00//';
          end;
          xlin:=xlin+FormatoMoneda(importe)+'//';
          xfecha:=TT_AuxiFecha.AsDateTime;
          impdia:=impdia+importe;
          tot[TT_AuxiIndice.AsInteger]:=tot[TT_AuxiIndice.AsInteger]+importe;
          xind:=TT_AuxiIndice.AsInteger;
          FAvance.AvanzaPosicion;
          TT_Auxi.Next;
        end;
        tot[xnoEti-2]:=tot[xnoEti-2]+impdia;
        xlin:=xlin+FormatoMoneda(impdia);
        BndDt.Items.Add(xlin);
      end;
    finally
      FAvance.Close;
      xlin:='T//';
      for i:=0 to ListaClaves.Count do
        InsertaElemStr(FormatoMoneda(tot[i]),i+3,xlin);
      BndDt.Items.Add(xlin);
    end;
  end;
end;

procedure TFLIQREP20.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP20P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
    Case FLIQREP20P.ComboBox2.ItemIndex of
      0:QuickRep1.Page.PaperSize:=Letter;
      1:QuickRep1.Page.PaperSize:=Legal;
    end;
    Case FLIQREP20P.ComboBox3.ItemIndex of
      0:QuickRep1.Page.Orientation:=poPortrait;
      1:QuickRep1.Page.Orientation:=poLandscape;
    end;
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP20.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if xtp='E' then begin
          Font.Style:=[fsbold];
          if k=1 then Autosize:=true;
          if k=2 then Left:=900;
        end;
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
  InicializaEtiquetas(1,xnoEti);
  ExtraeEtiquetas(1,xNoEti);
end;

procedure TFLIQREP20.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP20.CreaTablaTemp;
begin
  with DMGEN do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('NoReg', ftInteger, 0, True);
      Add('Fecha', ftDateTime, 0, False);
      Add('Indice', ftInteger, 0, False);
      Add('Importe', ftFloat,0,false);
      Add('Clase', ftString, 15, false);
    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'NoReg', [ixPrimary, ixUnique]);
      Add('Fecha','Fecha;Indice',[]);
    end;
    TT_Auxi.CreateTable;
    TT_Auxi.IndexName:='Fecha';
    TT_Auxi.Active:=true;
  end;
end;


procedure TFLIQREP20.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Dliqp.Close;
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    ListaClaves.Free;
  end;
end;

end.
