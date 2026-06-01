unit ULIQREP29;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport,
  QRAbsDatas, RxMemDS, DateUtils,Variants;

type
  TFLIQREP29 = class(TForm)
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
    BndDt: TQRStringsBand;
    ChildBand1: TQRChildBand;
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    TT_Auxi: TRxMemoryData;
    TT_AuxiCliente: TIntegerField;
    QL_Abon: TQuery;
    QL_Carg: TQuery;
    QL_AbonCLIENTE: TIntegerField;
    QL_AbonSUCLCAR: TIntegerField;
    QL_AbonTIPOCAR: TStringField;
    QL_AbonFOLIOCAR: TIntegerField;
    QL_AbonINDICECAR: TIntegerField;
    QL_AbonTOTAL: TFloatField;
    QL_Carg2: TQuery;
    QL_CargCLIENTE: TIntegerField;
    QL_CargTIPOMOV: TStringField;
    QL_CargFOLIO: TIntegerField;
    QL_CargFECHA: TDateTimeField;
    QL_CargTOTAL: TFloatField;
    TT_AuxiTipoMov: TStringField;
    TT_AuxiFolio: TIntegerField;
    TT_AuxiSaldo: TFloatField;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiSucursal: TIntegerField;
    QL_CargSUCURSAL: TIntegerField;
    QL_Carg2SUCURSAL: TIntegerField;
    QL_Carg2TIPOMOV: TStringField;
    QL_Carg2FOLIO: TIntegerField;
    QL_Carg2CLIENTE: TIntegerField;
    QL_Carg2FECHA: TDateTimeField;
    QL_Carg2TOTAL: TFloatField;
    TT_AuxiFolioStr: TStringField;
    ChbEnca: TQRChildBand;
    TT_AuxiNombre: TStringField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TT_AuxiAfterInsert(DataSet: TDataSet);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure TT_AuxiClienteChange(Sender: TField);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..11] of TQRLabel;
    procedure CreaEtiquetas;

  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=7;

var
  FLIQREP29: TFLIQREP29;
  xtp:char;
  xlin:string;
  xwa,xla:Array[1..NoEti] of integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIBLICENCIAS, DDMCXC, ULIQREP29P, DDMGEN_VTAS;

{$R *.DFM}

procedure TFLIQREP29.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Clave';
        2:Caption:='Cliente';
        3:Caption:='1 - '+IntToStr(VarCxcPlazo1)+' días';
        4:Caption:=IntToClaveNum(VarCxcPlazo1+1,2)+' - '+IntToStr(VarCxcPlazo2)+' días';
        5:Caption:=IntToClaveNum(VarCxcPlazo2+1,2)+' - '+IntToStr(VarCxcPlazo3)+' días';
        6:Caption:=IntToStr(VarCxcPlazo3+1)+' o Más';
        7:Caption:='Saldo Actual';
      end;
      Case i of
        1:xw:=50;
        2:xw:=260;
        3..7:xw:=71;
      end;
      xwa[i]:=xw;
      xla[i]:=xl;
      if i in [1..3] then Frame.DrawTop:=true;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=true;
      if i=NoEti then Frame.DrawRight:=false;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taRightJustify;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=false;
      Frame.Width:=1;
      if i in [1..2] then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP29.PreparaReporte;
var totc,totg:Array[4..8] of real;
    i,dias,ind:word;
    xcliente,clienteini,
    clientefin:integer;
    xlin2:string;
begin
  with DMGEN_VTAS,DMGEN,DMLIQ,DMGAS,DMCXC,FLIQREP29P do begin
    if CheckBox2.Checked then begin
      clienteini:=StrToInt(MaskEdit1.Text);
      clientefin:=StrToInt(MaskEdit2.Text);
    end;
    CreaEtiquetas;
    BndDt.Items.Clear;
    TT_Auxi.SortOnFields('Cliente;TipoMov;Folio',true,false);
    TT_Auxi.Active:=true;
    TV_Clie.Active:=true;
//Facturas
    QL_Carg.Close;
    QL_Carg.SQL.Clear;
    QL_Carg.SQL.Add('Select NoClie as Cliente,tipomov,folio,Sucursal,fecha,(importe-TotalPagos) as Total from DCXCCARG');
    QL_Carg.SQL.Add(' Where Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
    if not CheckBox1.Checked then
      QL_Carg.SQL.Add(' and Sucursal='+IntToStr(DMGAS.T_EstsSucursal.AsInteger));
    if CheckBox2.Checked then
      QL_Carg.SQL.Add(' and NoClie>='+IntToStr(clienteini)+' and NoClie<='+IntToStr(clientefin));
    QL_Carg.SQL.Add(' and Saldado="No" and Aplicado="Si" ');
    QL_Carg.SQL.Add(' Order by NoClie,Fecha');
    QL_Carg.Prepare;
    QL_Carg.Open;
    try
      FAvance.PreparaAvance('Facturas...',true,QL_Carg.RecordCount);
      while not QL_Carg.Eof do begin
        TT_Auxi.Insert;
        TT_AuxiCliente.AsInteger:=QL_CargCliente.AsInteger;
        TT_AuxiTipoMov.AsString:=QL_CargTipoMov.AsString;
        TT_AuxiFolio.AsInteger:=QL_CargFolio.AsInteger;
        TT_AuxiSucursal.AsInteger:=QL_CargSucursal.AsInteger;
        TT_AuxiSaldo.AsFloat:=QL_CargTotal.AsFloat;
        TT_AuxiFecha.AsDateTime:=QL_CargFecha.AsDateTime;
        TT_Auxi.Post;
        FAvance.AvanzaPosicion;
        QL_Carg.Next;
      end;
    finally
      FAvance.Close;
    end;

// Restar Abonos posteriores
    QL_Abon.Close;
    QL_Abon.SQL.Clear;
    QL_Abon.SQL.Add('Select NoClie as Cliente,SuclCar,TipoCar,FolioCar,IndiceCar,Importe as Total from DCXCABON');
    QL_Abon.SQL.Add(' Where Fecha>"'+FechaToStrSQL(VgFechaFin)+'"');
    if not CheckBox1.Checked then
      QL_Abon.SQL.Add(' and Sucursal='+IntToStr(DMGAS.T_EstsSucursal.AsInteger));
    if CheckBox2.Checked then
      QL_Abon.SQL.Add(' and NoClie>='+IntToStr(clienteini)+' and NoClie<='+IntToStr(clientefin));
    QL_Abon.SQL.Add('   and Aplicado="Si" ');
    QL_Abon.SQL.Add(' Order by NoClie,Fecha');
    QL_Abon.Prepare;
    QL_Abon.Open;
    try
      FAvance.PreparaAvance('Vericando Abonos posteriores...',true,QL_Abon.RecordCount);
      while not QL_Abon.Eof do begin
        if TT_Auxi.Locate('Sucursal;TipoMov;Folio',VarArrayOf([QL_AbonSuclCar.AsInteger,QL_AbonTipoCar.AsString,QL_AbonFolioCar.AsInteger]),[]) then begin
          TT_Auxi.Edit;
          TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat-QL_AbonTotal.AsFloat;
        end
        else begin
          QL_Carg2.Close;
          QL_Carg2.ParamByName('psucursal').AsInteger:=QL_AbonSuclCar.AsInteger;
          QL_Carg2.ParamByName('ptipomov').AsString:=QL_AbonTipoCar.AsString;
          QL_Carg2.ParamByName('pfolio').AsInteger:=QL_AbonFolioCar.AsInteger;
          QL_Carg2.Prepare;
          QL_Carg2.Open;
          if not QL_Carg2.IsEmpty then begin
            TT_Auxi.Insert;
            TT_AuxiCliente.AsInteger:=QL_Carg2Cliente.AsInteger;
            TT_AuxiTipoMov.AsString:=QL_Carg2TipoMov.AsString;
            TT_AuxiFolio.AsInteger:=QL_Carg2Folio.AsInteger;
            TT_AuxiSucursal.AsInteger:=QL_Carg2Sucursal.AsInteger;
            TT_AuxiSaldo.AsFloat:=QL_Carg2Total.AsFloat;
            TT_AuxiFecha.AsDateTime:=QL_Carg2Fecha.AsDateTime;
            TT_Auxi.Post;
          end;
        end;
        FAvance.AvanzaPosicion;
        QL_Abon.Next;
      end;
    finally
      FAvance.Close;
    end;
    Case ComboBox2.ItemIndex of
      0:TT_Auxi.SortOnFields('Cliente;Fecha',true,false);
      1:TT_Auxi.SortOnFields('Nombre;Cliente;Fecha',true,false);
    end;
    TT_Auxi.First;
    for i:=4 to 8 do
      totg[i]:=0;
    try
      FAvance.PreparaAvance('Generando Reporte...',true,TT_Auxi.RecordCount);
      while not TT_Auxi.Eof do begin
        for i:=4 to 8 do
          totc[i]:=0;
        xcliente:=TT_AuxiCliente.AsInteger;
        xlin:='D//'+IntToClaveCata(TT_AuxiCliente.AsInteger,idClie)+'//'+
                    TT_AuxiNombre.AsString+'//';
        xlin2:=xlin;
        while (not TT_Auxi.Eof)and(xcliente=TT_AuxiCliente.AsInteger) do begin
          dias:=DiasEntre(TT_AuxiFecha.AsDatetime,VgFechaFin);
          if dias<=VarCxcPlazo1 then ind:=4
          else if dias<=VarCxcPlazo2 then ind:=5
          else if dias<=VarCxcPlazo3 then ind:=6
          else ind:=7;
          totc[ind]:=totc[ind]+TT_AuxiSaldo.AsFloat;
          totc[8]:=totc[8]+TT_AuxiSaldo.AsFloat;
          FAvance.AvanzaPosicion;
          TT_Auxi.Next;
        end;
        xlin:=xlin2;
        for i:=4 to 8 do begin
          InsertaElemStr(FormatoMoneda(totc[i]),i,xlin);
          totg[i]:=totg[i]+totc[i];
          totc[i]:=0;
        end;
        BndDt.Items.Add(xlin);
      end;
      xlin:='T//';
      for i:=4 to 8 do begin
        InsertaElemStr(FormatoMoneda(totg[i]),i,xlin);
      end;
      BndDt.Items.Add(xlin);
      xlin:='E//';
      for i:=4 to 8 do begin
        InsertaElemStr(FormatoMoneda(DivideFloat(totg[i],totg[8])*100)+'%',i,xlin);
      end;
      BndDt.Items.Add(xlin);
    finally
      Favance.Close;
    end;
  end;
end;

procedure TFLIQREP29.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP29P.DBLookupComboBox2.Text;
    QRLEnca.Caption:='Al '+FechaAlf(VgFEchaFin);
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;
end;

procedure TFLIQREP29.BndDtBeforePrint(Sender: TQRCustomBand;
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
        Left:=xla[k];
        width:=xwa[k];
        if (xtp='E') then begin
          Font.Style:=[fsBold];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>2 then Frame.DrawTop:=true;
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

procedure TFLIQREP29.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP29.TT_AuxiAfterInsert(DataSet: TDataSet);
begin
  TT_AuxiSaldo.AsFloat:=0;
end;

procedure TFLIQREP29.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  TT_AuxiFolioStr.AsString:=TT_AuxiTipoMov.AsString+'-'+IntToClaveNum(TT_AuxiFolio.AsInteger,6);
end;

procedure TFLIQREP29.QRLabel11Print(sender: TObject; var Value: String);
begin
  Value:='';
end;

procedure TFLIQREP29.TT_AuxiClienteChange(Sender: TField);
begin
  with DMGEN_VTAS do begin
    if TV_Clie.Locate('NoClie',TT_AuxiCliente.AsInteger,[]) then
      TT_AuxiNombre.AsString:=TV_ClieNombre.AsString
    else
      TT_AuxiNombre.AsString:='Cliente No Registrado';
  end;
end;

end.
