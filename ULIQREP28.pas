unit ULIQREP28;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport,
  QRAbsDatas, RxMemDS, DateUtils,Variants;

type
  TFLIQREP28 = class(TForm)
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
    ChBEnca2: TQRChildBand;
    QL_Pval: TQuery;
    QL_Tran: TQuery;
    TT_Auxi: TRxMemoryData;
    TT_AuxiCliente: TIntegerField;
    QL_Abon: TQuery;
    QL_PvalESTACION: TIntegerField;
    QL_PvalCAJA: TIntegerField;
    QL_PvalFECHA: TDateTimeField;
    QL_PvalTURNO: TIntegerField;
    QL_PvalINDICE: TIntegerField;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalTOTAL: TFloatField;
    QL_TranESTACION: TIntegerField;
    QL_TranTIPOVENTA: TStringField;
    QL_TranFOLIO: TIntegerField;
    QL_TranFECHA: TDateTimeField;
    QL_TranTOTAL: TFloatField;
    QL_Carg: TQuery;
    QL_TranCLIENTE: TIntegerField;
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
    TT_AuxiClase: TStringField;
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
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    ChbEnca: TQRChildBand;
    QRLabel10: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
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
  NoEti=11;

var
  FLIQREP28: TFLIQREP28;
  xtp,ptipor:char;
  xlin:string;
  xwa,xla:Array[1..NoEti] of integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIBLICENCIAS, DDMCXC, ULIQREP28P, DDMGEN_VTAS;

{$R *.DFM}

procedure TFLIQREP28.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Cliente';
        2:Caption:='Folio';
        3:Caption:='Fecha';
        4:Caption:='1-7 días';
        5:Caption:='+ 7 días';
        6:Caption:='1-7 días';
        7:Caption:='8-14 días';
        8:Caption:='15-21 días';
        9:Caption:='22-28 días';
       10:Caption:='+ 28 días';
       11:Caption:='';
      end;
      Case i of
          1:xw:=215;
          2:xw:=57;
          3:xw:=63;
      4..11:xw:=70;
      end;
      if ptipor='R' then begin
        if i in [2,3] then begin
          Caption:='';
        end;
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
      if ptipor='R' then begin
        if i in [1..2] then begin
          Frame.DrawRight:=False;
        end;
      end;
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

procedure TFLIQREP28.PreparaReporte;
var totc,totg:Array[5..12] of real;
    totnv,totv:real;
    i,dias,ind:word;
    xcliente,clienteini,clienteexc,
    clientefin:integer;
    xlin2:string;
begin
  with DMGEN_VTAS,DMGEN,DMLIQ,DMGAS,DMCXC,FLIQREP28P do begin
    if CheckBox2.Checked then begin
      clienteini:=StrToInt(MaskEdit1.Text);
      clientefin:=StrToInt(MaskEdit2.Text);
    end;
    if CheckBox5.Checked then
       clienteexc:=StrToIntDef(MaskEdit3.Text,-1);
    if CheckBox4.Checked then ptipor:='R'
    else ptipor:='D';
    CreaEtiquetas;
    BndDt.Items.Clear;
    TT_Auxi.SortOnFields('Cliente;TipoMov;Folio',true,false);
    TT_Auxi.Active:=true;
    TV_Clie.Active:=true;
// Vales No Facturados
    QL_Pval.Close;
    QL_Pval.SQL.Clear;
    QL_Pval.SQL.Add('Select Estacion,Caja,Fecha,Turno,Indice,Cliente,Total from DGASPVAL ');
    QL_Pval.SQL.Add(' Where ((Facturado="No" and Fecha<="'+FechaToStrSQL(VgFechaFin)+'")');
    QL_Pval.SQL.Add('    or (Facturado="Si" and FechaFactura>"'+FechaToStrSQL(VgFechaFin)+'" and');
    QL_Pval.SQl.Add('                            Fecha<="'+FechaToStrSQL(VgFechaFin)+'" ))');
    if not CheckBox1.Checked then
      QL_Pval.SQL.Add(' and Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    if CheckBox2.Checked then
      QL_Pval.SQL.Add(' and Cliente>='+IntToStr(clienteini)+' and Cliente<='+IntToStr(clientefin));
    if CheckBox5.Checked then
      QL_Pval.SQL.Add(' and Cliente<>'+IntToStr(clienteexc));

    QL_Pval.SQL.Add(' Order by Cliente,Fecha ');
    QL_PVaL.SQL.SaveToFile('c:\IMAGENCO\PLVAQ.TXT');
    QL_Pval.Prepare;
    QL_Pval.Open;
    try
      FAvance.PreparaAvance('Vales Sin Facturar ..',true,QL_Pval.RecordCount);
      while not QL_Pval.Eof do begin
        if not TT_Auxi.Locate('Cliente;Fecha',VarArrayOf([QL_PvalCliente.AsInteger,QL_PvalFecha.AsDateTime]),[]) then begin
          TT_Auxi.Insert;
          TT_AuxiCliente.AsInteger:=QL_PvalCliente.AsInteger;
          TT_AuxiFecha.AsDateTime:=QL_PvalFecha.AsDateTime;
          TT_AuxiTipoMov.AsString:='VA';
          TT_AuxiClase.AsString:='VAL';
          TT_AuxiSucursal.AsInteger:=1;
        end
        else TT_Auxi.Edit;
        TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat+QL_PvalTotal.AsFloat;
        TT_Auxi.Post;
        Favance.AvanzaPosicion;
        QL_PVal.Next;
      end;
    finally
      FAvance.Close;
    end;

// Trasacciones No Facturadas
    QL_Tran.Close;
    QL_Tran.SQL.Clear;
    QL_Tran.SQL.Add('Select Estacion,TipoVenta,Folio,Cliente,Fecha,Total from DGASTRAN ');
    QL_Tran.SQL.Add(' Where ((Facturado="No" and Fecha<="'+FechaToStrSQL(VgFechaFin)+'")');
    QL_Tran.SQL.Add('    or (Facturado="Si" and FechaFactura>"'+FechaToStrSQL(VgFechaFin)+'"))');
    if not CheckBox1.Checked then
      QL_Tran.SQL.Add(' and Estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    if CheckBox2.Checked then
      QL_Tran.SQL.Add(' and Cliente>='+IntToStr(clienteini)+' and Cliente<='+IntToStr(clientefin));
    if CheckBox5.Checked then
      QL_Tran.SQL.Add(' and Cliente<>'+IntToStr(clienteexc));

    QL_Tran.SQL.Add('   and Estatus="A" and TipoVenta="CR" ');
    QL_Tran.SQL.Add(' Order by Cliente,Fecha');
    QL_Tran.Prepare;
    QL_Tran.Open;
    try
      FAvance.PreparaAvance('Transacciones Sin Facturar...',true,QL_Tran.RecordCount);
      while not QL_Tran.Eof do begin
        TT_Auxi.Insert;
        TT_AuxiCliente.AsInteger:=QL_TranCliente.AsInteger;
        TT_AuxiClase.AsString:='TRA';
        TT_AuxiTipoMov.AsString:='CR';
        TT_AuxiSucursal.AsInteger:=1;
        TT_AuxiFolio.AsInteger:=QL_TranFolio.AsInteger;
        TT_AuxiFecha.AsDateTime:=QL_TranFecha.AsDateTime;
        TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat+QL_TranTotal.AsFloat;
        TT_Auxi.Post;
        FAvance.AvanzaPosicion;
        QL_Tran.Next;
      end;
    finally
      FAvance.Close;
    end;

//Facturas
    QL_Carg.Close;
    QL_Carg.SQL.Clear;
    QL_Carg.SQL.Add('Select c.NoClie as Cliente, c.tipomov, c.folio, c.Sucursal, c.fecha,(c.importe-coalesce((');
    QL_Carg.SQL.Add('select sum(a.IMPORTE) from DCXCABON a');
    QL_Carg.SQL.Add('where a.tipocar = c.tipomov');
    QL_Carg.SQL.Add('and a.foliocar = c.folio');
    QL_Carg.SQL.Add('and a.aplicado = "Si"');
    QL_Carg.SQL.Add('and a.fecha <= "'+FechaToStrSQL(VgFechaFin)+'"');
    if not CheckBox1.Checked then
      QL_Carg.SQL.Add('and a.suclcar = c.sucursal');
    QL_Carg.SQL.Add('),0)) as Total from DCXCCARG c');
    QL_Carg.SQL.Add('Where c.Fecha <= "'+FechaToStrSQL(VgFechaFin)+'"');
    if not CheckBox1.Checked then
      QL_Carg.SQL.Add('and c.Sucursal='+IntToStr(DMGAS.T_EstsSucursal.AsInteger));
    if CheckBox2.Checked then
      QL_Carg.SQL.Add('and c.NoClie>='+IntToStr(clienteini)+' and c.NoClie<='+IntToStr(clientefin));
    if CheckBox5.Checked then
      QL_Carg.SQL.Add('and c.NoClie<>'+IntToStr(clienteexc));
    //SALDADO = NO
    QL_Carg.SQL.Add('and c.Importe > (coalesce((');
    QL_Carg.SQL.Add('select sum(a.IMPORTE) from DCXCABON a');
    QL_Carg.SQL.Add('where a.tipocar = c.tipomov');
    QL_Carg.SQL.Add('and a.foliocar = c.folio');
    QL_Carg.SQL.Add('and a.aplicado = "Si"');
    if not CheckBox1.Checked then
      QL_Carg.SQL.Add('and a.suclcar = c.sucursal');
    QL_Carg.SQL.Add('and a.fecha <= "'+FechaToStrSQL(VgFechaFin)+'"),0)+.004)');
    QL_Carg.SQL.Add('and c.Aplicado="Si" ');
    QL_Carg.SQL.Add('Order by c.NoClie, c.Fecha');
    QL_Carg.SQL.SaveToFile('c:\imagenco\query1.txt');
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
        TT_AuxiClase.AsString:='CAR';
        //TT_AuxiFolioStr.AsString := QL_CargTIPOMOV.AsString + '-' + IntToClaveNum(QL_CargFOLIO.AsInteger, 6);
        TT_Auxi.Post;
        FAvance.AvanzaPosicion;
        QL_Carg.Next;
      end;
    finally
      FAvance.Close;
    end;

// Restar Abonos posteriores
//    QL_Abon.Close;
//    QL_Abon.SQL.Clear;
//    QL_Abon.SQL.Add('Select NoClie as Cliente,SuclCar,TipoCar,FolioCar,IndiceCar,Importe as Total from DCXCABON');
//    QL_Abon.SQL.Add(' Where Fecha>"'+FechaToStrSQL(VgFechaFin)+'"');
//    if not CheckBox1.Checked then
//      QL_Abon.SQL.Add(' and Sucursal='+IntToStr(DMGAS.T_EstsSucursal.AsInteger));
//    if CheckBox2.Checked then
//      QL_Abon.SQL.Add(' and NoClie>='+IntToStr(clienteini)+' and NoClie<='+IntToStr(clientefin));
//    if CheckBox5.Checked then
//      QL_Abon.SQL.Add(' and NoClie<>'+IntToStr(clienteexc));
//
//    QL_Abon.SQL.Add('   and Aplicado="Si" ');
//    QL_Abon.SQL.Add(' Order by NoClie,Fecha');
//    QL_Abon.Prepare;
//    QL_Abon.Open;
//    try
//      FAvance.PreparaAvance('Vericando Abonos posteriores...',true,QL_Abon.RecordCount);
//      while not QL_Abon.Eof do begin
//        if TT_Auxi.Locate('Sucursal;TipoMov;Folio',VarArrayOf([QL_AbonSuclCar.AsInteger,QL_AbonTipoCar.AsString,QL_AbonFolioCar.AsInteger]),[]) then begin
//          TT_Auxi.Edit;
//          TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat+QL_AbonTotal.AsFloat;
//          TT_Auxi.Post;
//        end
//        else begin
//          QL_Carg2.Close;
//          QL_Carg2.ParamByName('psucursal').AsInteger:=QL_AbonSuclCar.AsInteger;
//          QL_Carg2.ParamByName('ptipomov').AsString:=QL_AbonTipoCar.AsString;
//          QL_Carg2.ParamByName('pfolio').AsInteger:=QL_AbonFolioCar.AsInteger;
//          QL_Carg2.Prepare;
//          QL_Carg2.Open;
//          if not QL_Carg2.IsEmpty then begin
//            if QL_Carg2Fecha.AsDateTime<=VgFechaFin then begin
//              TT_Auxi.Insert;
//              TT_AuxiCliente.AsInteger:=QL_Carg2Cliente.AsInteger;
//              TT_AuxiClase.AsString:='CAR';
//              TT_AuxiTipoMov.AsString:=QL_Carg2TipoMov.AsString;
//              TT_AuxiFolio.AsInteger:=QL_Carg2Folio.AsInteger;
//              TT_AuxiSucursal.AsInteger:=QL_Carg2Sucursal.AsInteger;
//              TT_AuxiSaldo.AsFloat:=QL_Carg2Total.AsFloat+QL_AbonTotal.Asfloat;
//              TT_AuxiFecha.AsDateTime:=QL_Carg2Fecha.AsDateTime;
//              TT_Auxi.Post;
//            end;
//          end;
//        end;
//        FAvance.AvanzaPosicion;
//        QL_Abon.Next;
//      end;
//    finally
//      FAvance.Close;
//    end;

    Case ComboBox2.ItemIndex of
      0:TT_Auxi.SortOnFields('Cliente;Fecha',true,false);
      1:TT_Auxi.SortOnFields('Nombre;Cliente;Fecha',true,false);
    end;

    TT_Auxi.First;
    for i:=5 to 12 do
      totg[i]:=0;
    totnv:=0; totv:=0;
    try
      FAvance.PreparaAvance('Generando Reporte...',true,TT_Auxi.RecordCount);
      while not TT_Auxi.Eof do begin
        for i:=5 to 12 do
          totc[i]:=0;
        xcliente:=TT_AuxiCliente.AsInteger;
        xlin:='D//'+IntToClaveCata(TT_AuxiCliente.AsInteger,idClie)+' '+
                    TT_AuxiNombre.AsString+'//';
//        xlin:='D//'+IntToClaveNum(TT_AuxiCliente.AsInteger,5)+' '+
//                    TT_AuxiNombre.AsString+'//';
        xlin2:=xlin;
        while (not TT_Auxi.Eof)and(xcliente=TT_AuxiCliente.AsInteger) do begin
          xlin:=xlin+TT_AuxiFolioStr.AsString+'//'+
                     FechaPaq(TT_AuxiFecha.AsDateTime)+'//';
          dias:=DiasEntre(TT_AuxiFecha.AsDatetime,VgFechaFin);
          if (TT_AuxiClase.AsString='VAL')or(TT_AuxiClase.AsString='TRA') then begin
            Case Dias of
              0..7:ind:=5
              else ind:=6;
            end;
          end
          else begin
            Case Dias of
               0..7 :ind:=7;
               8..14:ind:=8;
              15..21:ind:=9;
              22..28:ind:=10
              else ind:=11;
            end;
          end;
          InsertaElemStr(FormatoMoneda(TT_AuxiSaldo.AsFloat),ind,xlin);
          InsertaElemStr(FormatoMoneda(TT_AuxiSaldo.AsFloat),12,xlin);
          totc[ind]:=totc[ind]+TT_AuxiSaldo.AsFloat;
          totc[12]:=totc[12]+TT_AuxiSaldo.AsFloat;
          if ptipor='D' then BndDt.Items.Add(xlin);
          FAvance.AvanzaPosicion;
          xlin:='D// //';
          TT_Auxi.Next;
        end;
        if ptipor='D' then
          xlin:='T//'
        else
          xlin:=xlin2;
        for i:=5 to 12 do begin
          InsertaElemStr(FormatoMoneda(totc[i]),i,xlin);
          totg[i]:=totg[i]+totc[i];
          totc[i]:=0;
        end;
        BndDt.Items.Add(xlin);
      end;
      xlin:='T//';
      InsertaElemStr('Total',10,xlin);
      InsertaElemStr('General',11,xlin);
      for i:=5 to 12 do begin
        InsertaElemStr(FormatoMoneda(totg[i]),i,xlin);
        Case i of
          5..7 :totnv:=totnv+totg[i];
          8..11:totv:=totv+totg[i];
        end;
      end;
      BndDt.Items.Add(xlin);
      xlin:='E//';
      InsertaElemStr('No Vencido',11,xlin);
      InsertaElemStr(FormatoMoneda(totnv),12,xlin);
      BndDt.Items.Add(xlin);
      xlin:='E//';
      InsertaElemStr('Vencido',11,xlin);
      InsertaElemStr(FormatoMoneda(totv),12,xlin);
      BndDt.Items.Add(xlin);
    finally
      Favance.Close;
    end;
  end;
end;

procedure TFLIQREP28.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP28P.DBLookupComboBox2.Text;
    QRLEnca.Caption:='Al '+FechaAlf(VgFEchaFin);
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;
end;

procedure TFLIQREP28.BndDtBeforePrint(Sender: TQRCustomBand;
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
        if xtp='E' then
          Font.Style:=[fsBold];
        if (xtp='D')and(ptipor='R') then begin
          if k=1 then begin
            Autosize:=true;
            Left:=5;
            Alignment:=taLeftJustify;
          end;
          if k in [2,3] then left:=800;
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>3 then Frame.DrawTop:=true;
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

procedure TFLIQREP28.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP28.TT_AuxiAfterInsert(DataSet: TDataSet);
begin
  TT_AuxiSaldo.AsFloat:=0;
end;

procedure TFLIQREP28.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  if TT_AuxiClase.AsString='VAL' then
    TT_AuxiFolioStr.AsString:='VALES'
  else
    TT_AuxiFolioStr.AsString:=TT_AuxiTipoMov.AsString+'-'+IntToClaveNum(TT_AuxiFolio.AsInteger,6);
end;

procedure TFLIQREP28.QRLabel11Print(sender: TObject; var Value: String);
begin
  Value:='';
end;

procedure TFLIQREP28.TT_AuxiClienteChange(Sender: TField);
begin
  with DMGEN_VTAS do begin
    if TV_Clie.Locate('NoClie',TT_AuxiCliente.AsInteger,[]) then
      TT_AuxiNombre.AsString:=TV_ClieNombre.AsString
    else
      TT_AuxiNombre.AsString:='Cliente No Registrado';
  end;
end;

end.
