unit ULIQREP34;

interface

uses Variants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport,
  RxMemDS;

type
  TFLIQREP34 = class(TForm)
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
    QRLEstacion: TQRLabel;
    ChBEnca: TQRChildBand;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    TM_AuxiVentas: TRxMemoryData;
    TM_AuxiVentasUnidad: TStringField;
    TM_AuxiVentasLitrosDia: TFloatField;
    TM_AuxiVentasImporteDia: TFloatField;
    TM_AuxiVentasLitrosAcum: TFloatField;
    TM_AuxiVentasImporteAcum: TFloatField;
    TM_AuxiCredito: TRxMemoryData;
    TM_AuxiCreditoConcepto: TStringField;
    TM_AuxiCreditoPlazo1: TFloatField;
    TM_AuxiCreditoPlazo2: TFloatField;
    TM_AuxiCreditoPlazo3: TFloatField;
    TM_AuxiCreditoPlazo4: TFloatField;
    TM_AuxiCreditoPlazo5: TFloatField;
    TM_AuxiInv: TRxMemoryData;
    TM_AuxiInvNombreProducto: TStringField;
    TM_AuxiInvCosto: TFloatField;
    TM_AuxiInvUnidades: TFloatField;
    TM_AuxiInvTotal: TFloatField;
    TM_AuxiUtil: TRxMemoryData;
    TM_AuxiUtilProducto: TStringField;
    TM_AuxiUtilNombreProducto: TStringField;
    TM_AuxiUtilVenta: TFloatField;
    TM_AuxiUtilLitro: TFloatField;
    TM_AuxiUtilUltimoCosto: TFloatField;
    TM_AuxiUtilImpCosto: TFloatField;
    TM_AuxiUtilUtilidad: TFloatField;
    QL_Dliqc: TQuery;
    QL_DliqcNombreCombustible: TStringField;
    QL_DliqcCOMBUSTIBLE: TIntegerField;
    QL_DliqcLITROS: TFloatField;
    QL_DliqcTOTAL: TFloatField;
    QL_DliqcNombreComb: TStringField;
    TM_AuxiVentasCombustible: TIntegerField;
    TM_AuxiVentasNombreCombustible: TStringField;
    QL_Clie: TQuery;
    QL_ClieNOCLIE: TIntegerField;
    QL_ClieNOMBRE: TStringField;
    QL_ClieNombreClasif: TStringField;
    QL_ClieNOMBRECOMERCIAL: TStringField;
    TT_Auxi: TRxMemoryData;
    QL_Carg: TQuery;
    QL_CargTIPOMOV: TStringField;
    QL_CargFOLIO: TIntegerField;
    QL_CargFECHA: TDateTimeField;
    QL_CargFECVENCE: TDateTimeField;
    QL_CargIMPORTE: TFloatField;
    QL_CargTOTALPAGOS: TFloatField;
    QL_CargMONEDA: TStringField;
    QL_CargINDICE: TIntegerField;
    QL_CargREFERENCIA: TIntegerField;
    QL_Abon: TQuery;
    QL_AbonIMPORTE: TFloatField;
    QL_AbonSUCLCAR: TIntegerField;
    QL_AbonTIPOCAR: TStringField;
    QL_AbonFOLIOCAR: TIntegerField;
    QL_AbonMONEDA: TStringField;
    QL_AbonINDICECAR: TIntegerField;
    TT_AuxiReg: TIntegerField;
    TT_AuxiNoClie: TIntegerField;
    TT_AuxiTipoMov: TStringField;
    TT_AuxiFolio: TIntegerField;
    TT_AuxiIndice: TIntegerField;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiFecVence: TDateTimeField;
    TT_AuxiSaldo: TFloatField;
    QL_Carg2: TQuery;
    QL_Carg2TIPOMOV: TStringField;
    QL_Carg2FOLIO: TIntegerField;
    QL_Carg2FECHA: TDateTimeField;
    QL_Carg2FECVENCE: TDateTimeField;
    QL_Carg2IMPORTE: TFloatField;
    QL_Carg2TOTALPAGOS: TFloatField;
    QL_Carg2MONEDA: TStringField;
    QL_Carg2INDICE: TIntegerField;
    QL_Carg2REFERENCIA: TIntegerField;
    TM_AuxiCreditoPlazo1Porc: TFloatField;
    TM_AuxiCreditoPlazo2Porc: TFloatField;
    TM_AuxiCreditoPlazo3Porc: TFloatField;
    TM_AuxiCreditoPlazo4Porc: TFloatField;
    TM_AuxiCreditoPlazo5Porc: TFloatField;
    QL_Prod: TQuery;
    QL_ProdCLAVE: TStringField;
    QL_ProdDESCRIPCION: TStringField;
    QL_ProdUNIDAD: TStringField;
    QL_ProdLINEA: TIntegerField;
    QL_ProdNOMBRELINEA: TStringField;
    QL_ProdLINEAACTIVA: TStringField;
    QL_ProdSUBLINEA: TIntegerField;
    QL_ProdNOMBRESUBLINEA: TStringField;
    QL_ProdSUBLINEAACTIVA: TStringField;
    TM_AuxiInvClave: TIntegerField;
    QL_Dliqc2: TQuery;
    StringField2: TStringField;
    QL_Tcmb: TQuery;
    QL_TcmbNOMBRE: TStringField;
    QL_Dliqc2LITROS: TFloatField;
    QL_Dliqc2Subtotal: TFloatField;
    QL_Dliqc2Iva: TFloatField;
    QL_Dliqc2TOTAL: TFloatField;
    QL_Dliqc2IMPIEPS: TFloatField;
    QL_Dliqc2FECHA: TDateTimeField;
    QL_Dliqc2COMBUSTIBLE: TIntegerField;
    TL_Ajud2: TTable;
    TL_Ajud2ESTACION: TIntegerField;
    TL_Ajud2FECHA: TDateTimeField;
    TL_Ajud2COMBUSTIBLE: TIntegerField;
    TL_Ajud2VOLUMEN: TFloatField;
    TL_Ajud2VENTA: TFloatField;
    TL_Ajud2DIFERENCIA: TFloatField;
    TL_Ajud2PRECIO: TFloatField;
    TL_Ajud2TOTAL: TFloatField;
    QL_Dliqc2NombreCombustible: TStringField;
    QL_TcmbCODIGO: TStringField;
    QL_Dliqa: TQuery;
    TM_AuxiUtilAce: TRxMemoryData;
    TM_AuxiUtilAceCantidad: TFloatField;
    TM_AuxiUtilAceImporte: TFloatField;
    TM_AuxiUtilAceDescripcion: TStringField;
    QL_DliqaESTACION: TIntegerField;
    QL_DliqaFECHA: TDateTimeField;
    QL_DliqaFOLIO: TIntegerField;
    QL_DliqaPRODUCTO: TStringField;
    QL_DliqaVENTA: TFloatField;
    QL_DliqaPRECIO_CIVA: TFloatField;
    QL_DliqaIMPORTE: TFloatField;
    QL_DliqaDESP: TIntegerField;
    TM_AuxiUtilAceProducto: TStringField;
    QL_DliqaDESCRIPCION: TStringField;
    QL_ClieCLASIFICA: TIntegerField;
    QL_Clas: TQuery;
    QL_ClasCLAVECATA: TStringField;
    QL_ClasCLAVECLASIF: TIntegerField;
    QL_ClasDESCRIPCION: TStringField;
    QL_ClasOBSERVACION: TStringField;
    QL_TcmbCLAVE: TIntegerField;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure QL_Dliqc2CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..6] of TQRLabel;
    procedure CreaEtiquetas;
    procedure CreaTablaTemp;
    procedure PreparaVentas;
    procedure PreparaCreditos;
    procedure PreparaInv;
    procedure PreparaUtil;
    procedure CargaBanda;
  public
    { Public declarations }
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=6;

var
  FLIQREP34: TFLIQREP34;
  xtp:char;
  xlin:string;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,
     UAVANCE, ULIQREP34P, DDMGASQ, DDMGAS, DDMCXC, DDMINV, DBCtrls, DDMLIQ,
  DDMCUP;

{$R *.DFM}

procedure TFLIQREP34.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Producto ';
        2:Caption:='Unidad ';
        3:Caption:='Litros día ';
        4:Caption:='Importe día ';
        5:Caption:='Litros acum ';
        6:Caption:='Importe acum ';
      end;
      Case i of
        1:xw:=130;
        2:xw:=90;
        3:xw:=80;
        4:xw:=100;
        5:xw:=80;
        6:xw:=70;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      case i of
        1..2:Alignment:=taLeftJustify;
      else
        Alignment:=taRightJustify;
      end;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=true;
//      if i=5 then Frame.DrawRight:=false;
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
      if i<3 then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
end;

procedure TFLIQREP34.PreparaReporte;
begin
  CreaEtiquetas;
  CreaTablaTemp;
  BndDt.Items.Clear;
  PreparaVentas;
  PreparaCreditos;
  PreparaInv;
  PreparaUtil;
  CargaBanda;
end;

procedure TFLIQREP34.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP34P.DBLookupComboBox2.Text;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFEchaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP34.BndDtBeforePrint(Sender: TQRCustomBand;
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
        Frame.DrawRight:=False;
        Frame.DrawLeft:=False;
        Font.Size:=8;
        if (xtp='E')and(k<3) then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
         if xtp='V' then begin
          Font.Style:=[fsBold];
         end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if (k>3) and (k<>6) then
            Frame.DrawTop:=true;
        end;
        case xtp of
          'I':begin
                case k of
                  1..4: begin
                          Font.Style:=[fsBold];
                          Frame.DrawTop:=true;
                          Frame.DrawBottom:=true;
                          if K=1 then
                            Frame.DrawLeft:=True;
//                          if k=4 then
                            Frame.DrawRight:=True;
                        end;
                end;
              end;
          'U':begin
                Font.Style:=[fsBold];
                Frame.DrawTop:=true;
                Frame.DrawBottom:=true;
                if K=1 then
                  Frame.DrawLeft:=True;
//                if k=6 then
                  Frame.DrawRight:=True;
              end;
          'C':begin
                case k of
                  1..5: begin
                          Font.Style:=[fsBold];
                          Frame.DrawTop:=true;
                          Frame.DrawBottom:=true;
                          if K=1 then
                            Frame.DrawLeft:=True;
//                          if k=5 then
                            Frame.DrawRight:=True;
                        end;
                end;
              end;
        end;
        case k of
          1:Alignment:=taLeftJustify;
        else
          Alignment:=taRightJustify;
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

  procedure HabilitaShapes(ri,rf:integer;swenabled:boolean;swwe,swtop:Integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      TQRShape(FindComponent('QRShape'+IntToStr(k))).Enabled:=swenabled;
      TQRShape(FindComponent('QRShape'+IntToStr(k))).Width:=swwe;
      if k=1 then
        TQRShape(FindComponent('QRShape'+IntToStr(k))).Top:=swtop;
    end;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
  HabilitaShapes(1,2,false,1,1);
  if xtp='C' then begin
    HabilitaShapes(1,2,True,283,2);
  end
  else if xtp='I' then begin
    HabilitaShapes(1,2,True,230,2);
  end
  else if xtp='U' then begin
    HabilitaShapes(1,2,True,400,1);
  end
end;

procedure TFLIQREP34.CreaTablaTemp;
begin
  TM_AuxiVentas.Active:=False;
  TM_AuxiCredito.Active:=False;
  TT_Auxi.Active:=False;
  TM_AuxiInv.Active:=False;
  TM_AuxiUtil.Active:=False;
  TM_AuxiUtilAce.Active:=False;
  TM_AuxiVentas.Active:=True;
  TM_AuxiCredito.Active:=True;
  TT_Auxi.Active:=True;
  TM_AuxiInv.Active:=True;
  TM_AuxiUtil.Active:=True;
  TM_AuxiUtilAce.Active:=True;

  QL_Tcmb.Close;
  QL_Tcmb.Prepare;
  QL_Tcmb.Open;
end;


procedure TFLIQREP34.FormDestroy(Sender: TObject);
begin
  TM_AuxiVentas.Active:=False;
  TM_AuxiCredito.Active:=False;
  TT_Auxi.Active:=False;
  TM_AuxiInv.Active:=False;
  TM_AuxiUtil.Active:=False;
  TM_AuxiUtilAce.Active:=False;
end;

procedure TFLIQREP34.PreparaCreditos;
var
  swsaldo:Boolean;
  xsaldoanal:real;
  xreg,i:word;
  xsaldo:TsaldoCxc;
  xtottipo,xtotgen,xtotclie,_xsaldo:array[0..5] of double;
  xTotalGral:Real;
  xnocargos:Integer;
  dias:Integer;
begin
  with DMCXC do begin
    QL_Clas.Close;
    QL_Clas.Prepare;
    QL_Clas.Open;
    QL_Clie.close;
    QL_Clie.SQL.Clear;
    QL_Clie.SQL.Add('Select Noclie,NombreComercial,Nombre,Clasifica from DGENCLIE');
    QL_Clie.SQL.Add('where Noclie in (Select distinct NoClie from DCXCSCXC)');
    QL_Clie.Prepare;
    QL_Clie.Open;
    xreg:=1;
    xsaldoanal:=0;
    try
      FAvance.PreparaAvance('Calculando sección Créditos...',true,QL_Clie.RecordCount);
      while not QL_Clie.Eof do begin
        SaldoCxcClie(QL_ClieNoClie.Asinteger,'MN',VgFechaIni,VgFechaFin,xsaldo);
        swsaldo:=DiferentesDeCero(xsaldo.SaldoIni,xsaldo.CargosPer,xsaldo.AbonosPer,0);
        if not swsaldo then begin
          FAvance.AvanzaPosicion;
          QL_Clie.Next;
          Continue;
        end;
        xsaldoanal:=xsaldoanal+xsaldo.SaldoFin;
        QL_Carg.Close;
        QL_Carg.SQL.Clear;
        QL_Carg.SQL.Add('Select tipomov,folio,indice,fecha,fecvence,importe,totalpagos,Concepto,Moneda,Referencia from DCXCCARG');
        QL_Carg.SQL.Add('Where NoClie=:pNoClie');
        QL_Carg.SQL.Add('  and fecha<=:pfecha ');
        QL_Carg.SQL.Add('  and saldado="No" ');
        QL_Carg.SQL.Add('  and Aplicado="Si" ');
        QL_Carg.SQL.Add('order by fecha,tipomov,folio,indice');
        QL_Carg.ParamByName('pNoClie').Asinteger:=QL_ClieNoClie.AsInteger;
        QL_Carg.ParamByName('pfecha').asdatetime:=VgFechaFin;
        QL_Carg.Prepare;
        QL_Carg.Open;
        While not QL_Carg.Eof do begin
          TT_Auxi.Insert;
          TT_AuxiReg.AsInteger:=xreg;
          TT_AuxiNoClie.AsInteger:=QL_ClieNoClie.AsInteger;
          TT_AuxiTipoMov.AsString:=QL_CargTipoMov.AsString;
          TT_AuxiFolio.AsInteger:=QL_CargFolio.AsInteger;
          TT_AuxiIndice.AsInteger:=QL_CargIndice.AsInteger;
          TT_AuxiFecha.AsDateTime:=QL_CargFecha.AsDateTime;
          TT_AuxiFecVence.AsDateTime:=QL_CargFecVence.AsDateTime;
          TT_AuxiSaldo.AsFloat:=QL_CargImporte.AsFloat-QL_CargTotalPagos.AsFloat;
  //        if (CheckBox3.Checked)and(TT_AuxiMoneda.AsString<>MonedaNac) then begin
  //          Paridad:=DameParidadFecha(TT_AuxiMoneda.asstring,VgFechaFin);
  //          TT_AuxiSaldo.AsFloat:=AjustaFloat(TT_AuxiSaldo.AsFloat*paridad,2);
  //          swmoneda:=false;
  //          if LMonedas.Count>0 then
  //            for i:=0 to LMonedas.Count-1 do begin
  //              if ExtraeElemStr(LMonedas[i],1)=TT_AuxiMoneda.AsString then begin
  //                swmoneda:=true;
  //                break;
  //              end;
  //            end;
  //          if not swmoneda then
  //            LMonedas.Add(TT_AuxiMoneda.AsString+'//'+FormatFloat('##0.0000',paridad));
  //        end;
          try
            TT_Auxi.Post;
          except
            TT_Auxi.Cancel;
          end;
          inc(xreg);
          QL_Carg.Next;
        end;
        QL_Abon.Close;
        QL_Abon.SQL.Clear;
        QL_Abon.SQL.Add('Select SuclCar,TipoCar,FolioCar,IndiceCar,Importe,Moneda from DCXCABON');
        QL_Abon.SQL.Add('Where noclie=:pnoclie and fecha>:pfecha and aplicado="Si" ');
        QL_Abon.SQL.Add('Order by Fecha');
        QL_Abon.ParamByName('pnoclie').AsInteger:=QL_ClieNoClie.AsInteger;
        QL_Abon.ParamByName('pfecha').AsDateTime:=VgFechaFin;
        QL_Abon.Prepare;
        QL_Abon.Open;
        while not QL_Abon.Eof do begin
          if TT_Auxi.Locate('NoClie;TipoMov;Folio;Indice',
                 VarArrayOf([QL_ClieNoClie.AsInteger,
                             QL_AbonTipoCar.AsString,
                             QL_AbonFolioCar.AsInteger,
                             QL_AbonIndiceCar.AsInteger
                             ]),[]) then begin
            TT_Auxi.Edit;
  //          if (CheckBox3.Checked)and(TT_AuxiMoneda.AsString<>MonedaNac) then begin
  //             Paridad:=DameParidadFecha(TT_AuxiMoneda.asstring,VgFechaFin);
  //             TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat+AjustaFloat(QL_AbonImporte.AsFloat*Paridad,2);
  //          end
  //          else begin
               TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat+QL_AbonImporte.AsFloat;
  //          end;
          end
          else begin
            QL_Carg2.Close;
            QL_Carg2.SQL.Clear;
            QL_Carg2.SQL.Add('Select TipoMov,Folio,Indice,Fecha,FecVence,Importe,TotalPagos,Moneda,Referencia from DCXCCARG');
            QL_Carg2.SQL.Add('Where TipoMov=:ptipomov and Folio=:pfolio and Indice=:pindice and Sucursal=:psucursal');
            QL_Carg2.SQL.Add('  and Fecha<=:pfecha');
            QL_Carg.SQL.Add('   and Aplicado="Si" ');
            QL_Carg2.ParamByName('ptipomov').AsString:=QL_AbonTipoCar.AsString;
            QL_Carg2.ParamByName('pfolio').AsInteger:=QL_AbonFolioCar.AsInteger;
            QL_Carg2.ParamByName('pindice').AsInteger:=QL_AbonIndiceCar.AsInteger;
            QL_Carg2.ParamByName('psucursal').AsInteger:=QL_AbonSuclCar.AsInteger;
            QL_Carg2.ParamByName('pfecha').AsDateTime:=VgFechaFin;
            QL_Carg2.Prepare;
            QL_Carg2.Open;
            if not QL_Carg2.IsEmpty then begin
              TT_Auxi.Insert;
              TT_AuxiReg.AsInteger:=xreg;
              TT_AuxiNoClie.AsInteger:=QL_ClieNoClie.AsInteger;
              TT_AuxiTipoMov.AsString:=QL_Carg2TipoMov.AsString;
              TT_AuxiFolio.AsInteger:=QL_Carg2Folio.AsInteger;
              TT_AuxiIndice.AsInteger:=QL_Carg2Indice.AsInteger;
              TT_Auxifecha.AsDateTime:=QL_Carg2Fecha.AsDateTime;
              TT_AuxiFecVence.AsDateTime:=QL_Carg2FecVence.AsDateTime;
              TT_AuxiSaldo.AsFloat:=QL_Carg2Importe.AsFloat-QL_Carg2TotalPagos.AsFloat+QL_AbonImporte.AsFloat;
  //            if (CheckBox3.Checked)and(TT_AuxiMoneda.AsString<>MonedaNac) then begin
  //              Paridad:=DameParidadFecha(TT_AuxiMoneda.asstring,VgFechaFin);
  //              TT_AuxiSaldo.AsFloat:=AjustaFloat(TT_AuxiSaldo.AsFloat*paridad,2);
  //              if LMonedas.Count>0 then
  //                for i:=0 to LMonedas.Count-1 do begin
  //                  if ExtraeElemStr(LMonedas[i],1)=TT_AuxiMoneda.AsString then begin
  //                    swmoneda:=true;
  //                    break;
  //                  end;
  //                end;
  //              if not swmoneda then
  //                LMonedas.Add(TT_AuxiMoneda.AsString+'//'+FormatFloat('##0.0000',paridad));
  //            end;
              try
                TT_Auxi.Post;
              except
                TT_Auxi.Cancel;
              end;
            end;
          end;
          inc(xreg);
          QL_Abon.Next;
        end;
        QL_Clie.Next;
        FAvance.AvanzaPosicion;
      end;
    finally
      FAVANCE.Close;
      QL_Clie.Close;
    end;
    TT_Auxi.First;
    while not TT_Auxi.Eof do begin
      for i:=1 to 5 do
        xtottipo[i]:=0;
      while (not TT_Auxi.Eof) do begin
        for i:=0 to 5 do
          xtotclie[i]:=0;
        xnocargos:=0;
        while {(xNoClie=TT_AuxiNoClie.AsInteger)and}(not TT_Auxi.Eof) do begin
          for i:=0 to 5 do
            _xsaldo[i]:=0;
//          Case ComboBox3.ItemIndex of
            {0:}dias:=DiasEntre(TT_AuxiFecVence.AsDatetime,VgFechaFin);
//            1:dias:=DiasEntre(TT_AuxiFecha.AsDatetime,VgFechaFin);
//          end;
          if dias <= 0 then
            _xsaldo[0]:=TT_AuxiSaldo.AsFloat
          else if (dias>0)and(dias<=VarCxcPlazo1) then
            _xsaldo[1]:=TT_AuxiSaldo.AsFloat
          else if (dias>VarcxcPlazo1)and(dias<=VarcxcPlazo2) then
            _xsaldo[2]:=TT_AuxiSaldo.AsFloat
          else if (dias>VarcxcPlazo2)and(dias<=VarcxcPlazo3) then
            _xsaldo[3]:=TT_AuxiSaldo.AsFloat
          else
            _xsaldo[4]:=TT_AuxiSaldo.AsFloat;
          _xsaldo[5]:=TT_AuxiSaldo.AsFloat;
          for i:=0 to 5 do begin
            xtotclie[i]:=xtotclie[i]+_xsaldo[i];
          end;
          inc(xnocargos);
          TT_Auxi.Next;
        end;
        for i:=0 to 5 do begin
          xtottipo[i]:=xtottipo[i]+xtotclie[i];
        end;
      end;
      for i:=0 to 5 do begin
        xtotgen[i]:=xtotgen[i]+xtottipo[i];
//        if i=5 then sw:=xtottipo[i]=xtotgen[i];
        xtottipo[i]:=0;
      end;
    end;
    xTotalGral:=0;
    TM_AuxiCredito.Insert;
    TM_AuxiCreditoConcepto.AsString:='Créditos';
    TM_AuxiCreditoPlazo1.AsFloat:=AjustaFloat(xtotgen[1]+0.001,2);
    xTotalGral:=TM_AuxiCreditoPlazo1.AsFloat;
    TM_AuxiCreditoPlazo2.AsFloat:=AjustaFloat(xtotgen[2]+0.001,2);
    xTotalGral:=xTotalGral+TM_AuxiCreditoPlazo2.AsFloat;
    TM_AuxiCreditoPlazo3.AsFloat:=AjustaFloat(xtotgen[3]+0.001,2);
    xTotalGral:=xTotalGral+TM_AuxiCreditoPlazo3.AsFloat;
    TM_AuxiCreditoPlazo4.AsFloat:=AjustaFloat(xtotgen[4]+0.001,2);
    xTotalGral:=xTotalGral+TM_AuxiCreditoPlazo4.AsFloat;
    TM_AuxiCreditoPlazo5.AsFloat:=AjustaFloat(xtotgen[5]+0.001,2);
//    xTotalGral:=xTotalGral+TM_AuxiCreditoPlazo5.AsFloat;
    TM_AuxiCreditoPlazo1Porc.AsFloat:=AjustaFloat(DivideFloat(TM_AuxiCreditoPlazo1.AsFloat,xTotalGral)*100,2);
    TM_AuxiCreditoPlazo2Porc.AsFloat:=AjustaFloat(DivideFloat(TM_AuxiCreditoPlazo2.AsFloat,xTotalGral)*100,2);
    TM_AuxiCreditoPlazo3Porc.AsFloat:=AjustaFloat(DivideFloat(TM_AuxiCreditoPlazo3.AsFloat,xTotalGral)*100,2);
    TM_AuxiCreditoPlazo4Porc.AsFloat:=AjustaFloat(DivideFloat(TM_AuxiCreditoPlazo4.AsFloat,xTotalGral)*100,2);
    TM_AuxiCreditoPlazo5Porc.AsFloat:=AjustaFloat(DivideFloat(TM_AuxiCreditoPlazo5.AsFloat,xTotalGral)*100,2);
    TM_AuxiCredito.Post;
  end;
end;

procedure TFLIQREP34.PreparaInv;
var
  xsaldo:TSaldoInv;
  totslin,totlin,totgral:Array[1..8] of double;
  xsucl,xalma,xlinea,xsublinea:integer;
  xnomlinea:string;

  Procedure TotalLinea;
  var
    i:Integer;
  begin
    for i:=1 to 8 do begin
      TotGral[i]:=TotGral[i]+TotLin[i];
      TotLin[i]:=0;
    end;

    TM_AuxiInv.Insert;
    TM_AuxiInvClave.AsInteger:=xlinea;
    TM_AuxiInvNombreProducto.AsString:=xNomLinea;
    TM_AuxiInvCosto.AsFloat:=TotGral[8];
    TM_AuxiInvUnidades.AsFloat:=TotGral[7];
    TM_AuxiInvTotal.AsFloat:=AjustaFloat(TM_AuxiInvCosto.AsFloat*TM_AuxiInvUnidades.AsFloat,2);
    TM_AuxiInv.Post;
  end;

  Procedure TotalSubLinea;
  var
    i:Integer;
  begin
    for i:=1 to 8 do begin
      TotLin[i]:=TotLin[i]+TotSlin[i];
      TotSlin[i]:=0;
    end;
  end;

  Procedure CambiaSubLinea;
  begin
    xSublinea:=QL_ProdSubLinea.AsInteger;
  end;

  Procedure CambiaLinea;
  begin
    xlinea:=QL_ProdLinea.AsInteger;
    xNomLinea:=QL_ProdNombreLinea.AsString;
    CambiaSubLinea;
  end;
begin
  with DMGEN,DMINV,FLIQREP34P do begin
    QL_Prod.Close;
    QL_Prod.SQL.Clear;
    QL_Prod.SQL.Add('Select p.clave,p.descripcion,p.unidad,');
    QL_Prod.SQL.Add('       p.linea,l.Descripcion as NombreLinea,l.Activo as LineaActiva,');
    QL_Prod.SQL.Add('       p.sublinea,s.Descripcion as NombreSubLinea, s.Activo as SublineaActiva,');
    QL_Prod.SQL.Add('       p.claveiva from DGENPROD p');
    QL_Prod.SQL.Add('inner join DINVLINE l on p.linea=l.linea');
    QL_Prod.SQL.Add('inner join DINVSLIN s on p.linea=s.linea and p.sublinea=s.sublinea');
    QL_Prod.SQL.Add('where l.Activo=''Si'' ');
    QL_Prod.SQL.Add('  and s.Activo=''Si'' ');
    QL_Prod.SQL.Add('  and p.Clave in (Select Producto from DINVSINV)');
    QL_Prod.SQL.Add('Order by p.Linea,p.Sublinea');
    QL_Prod.Prepare;
    QL_Prod.Open;
    QL_Prod.First;
    FillChar(TotLin,SizeOf(TotLin),0);
    FillChar(TotSlin,SizeOf(TotSlin),0);
    FillChar(TotGral,SizeOf(TotGral),0);
    BndDt.Items.Clear;
    xLinea:=0;
    xSubLinea:=0;
    try
      FAvance.PreparaAvance('Calculando sección Inventarios...',true,QL_Prod.RecordCount);
      while not QL_Prod.Eof do begin
        if xlinea<>QL_ProdLinea.AsInteger then begin
          if xLinea<>0 then begin
            TotalSubLinea;
            TotalLinea;
          end;
          CambiaLinea
        end else begin
          if xSubLinea<>QL_ProdSubLinea.AsInteger then begin
            if xSubLinea<>0 then
              TotalSubLinea;
            CambiaSubLinea;
          end
        end;
        SaldoInvProd('G',0,0,QL_ProdClave.AsString,VgFechaIni,VgFechaFin,xsaldo,true);
        if (xsaldo.SaldoIniUni<>0)or(xsaldo.SaldoIniImp<>0)or(xsaldo.EntradasUni<>0)or(xsaldo.EntradasImp<>0)or
           (xsaldo.SalidasUni<>0)or(xsaldo.SalidasImp<>0)or(xsaldo.SaldoFinuni<>0)or(xsaldo.SaldoFinImp<>0) then begin
          totslin[1]:=totslin[1]+xsaldo.SaldoIniUni;
          totslin[2]:=totslin[2]+xsaldo.SaldoIniImp;
          totslin[3]:=totslin[3]+xsaldo.EntradasUni;
          totslin[4]:=totslin[4]+xsaldo.EntradasImp;
          totslin[5]:=totslin[5]+xsaldo.SalidasUni;
          totslin[6]:=totslin[6]+xsaldo.SalidasImp;
          totslin[7]:=totslin[7]+xsaldo.SaldoFinUni;
          totslin[8]:=totslin[8]+xsaldo.SaldoFinImp;
        end;
        QL_Prod.Next;
        FAvance.AvanzaPosicion;
      end;
      if xlinea<>-1 then begin
        TotalSubLinea;
        TotalLinea;
      end;
    finally
      FAvance.Close;
    end;
  end;
end;

procedure TFLIQREP34.PreparaUtil;
const ModoRep=0;
var tot:Array[3..18] of real;
    tota:Array[3..14] of real;
    i,xind,j:word;
    xfecha:TDateTime;
    totl,tots,toti,tott:real;
    xtasa,IEPSLts,IEPS,
    xlitros,xsubtotal,xiva,xtotal,ImporteAIEPS:real;
    fecii,fecff:TDateTime;

    totd,totg:Array[1..2] of real;
    xprecio:double;

  function DameCosto(xProd:string):Real;
  var
    SaldoFinImp, SaldoFinUni, SaldoIniImp, SaldoIniUni:Real;
    EntradasUni, EntradasImp, SalidasUni, SalidasImp:Real;
    mesi,mesf:string;
    diam,diai:word;
    SalidasUniPendientesAplicar:Double;
  begin
    if FLIQREP34P.swImprimeCostos then begin
      with DMINV do begin
        SaldoIniUni:=0;
        SaldoIniImp:=0;
        EntradasUni:=0;
        EntradasImp:=0;
        SalidasUni:=0;
        SalidasImp:=0;
        SaldoFinUni:=0;
        SaldoFinImp:=0;
        SaldoIniUni:=0;
        mesi:=FechaToMes(VgFechaIni);
        mesf:=FechaToMes(VgFechaFin);
        try
          // Calcula entradas y salidas de meses anteriores al periodo
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_AuxiReal2.FieldKind:=fkInternalCalc;
          Q_AuxiReal3.FieldKind:=fkInternalCalc;
          Q_AuxiReal4.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(EntUnidades) as Real1, sum(EntImporte) as Real2, sum(SalUnidades) as Real3, sum(SalImporte) as Real4 from DINVSINV');
          Q_Auxi.SQL.Add('  where producto='+QuotedStr(xprod));
          Q_Auxi.SQL.Add('  and Mes<'+QuotedStr(mesi));

          Q_Auxi.Prepare;
          Q_Auxi.Open;
          SaldoIniUni:=AjustaFloat(SaldoIniUni+Q_AuxiReal1.AsFloat-Q_AuxiReal3.AsFloat,3{DMGEN_VTAS.DecCantidad});
          SaldoIniImp:=AjustaFloat(SaldoIniImp+Q_AuxiReal2.AsFloat-Q_AuxiReal4.AsFloat,2);

          // Calcula entradas y salidas de meses del periodo
          Q_Auxi.Close;
          Q_AuxiReal1.FieldKind:=fkInternalCalc;
          Q_AuxiReal2.FieldKind:=fkInternalCalc;
          Q_AuxiReal3.FieldKind:=fkInternalCalc;
          Q_AuxiReal4.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('Select sum(EntUnidades) as Real1, sum(EntImporte) as Real2, sum(SalUnidades) as Real3, sum(SalImporte) as Real4 from DINVSINV');
          Q_Auxi.SQL.Add('  where producto='+QuotedStr(xprod));
          Q_Auxi.SQL.Add('  and Mes>='+QuotedStr(mesi));
          Q_Auxi.SQL.Add('  and Mes<='+QuotedStr(mesf));

          Q_Auxi.Prepare;
          Q_Auxi.Open;
          EntradasUni:=AjustaFloat(Q_AuxiReal1.AsFloat,3{DMGEN_VTAS.DecCantidad});
          EntradasImp:=AjustaFloat(Q_AuxiReal2.AsFloat,2);
          SalidasUni:=AjustaFloat(Q_AuxiReal3.AsFloat,3{DMGEN_VTAS.DecCantidad});
          SalidasImp:=AjustaFloat(Q_AuxiReal4.AsFloat,2);

          // Resta dias incompletos del mes inicial
          diai:=GetDiaFromFecha(VgFechaIni);
          if diai>1 then begin //Si no es el primer dia del mes
            fecii:=VgFechaIni;
            SetDiaToFecha(1,fecii);
            fecff:=VgFechaIni;
            SetDiaToFecha(diai-1,fecff);
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_AuxiReal2.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(Cantidad) as Real1, sum(ImporteMN) as Real2 from DINVMOVE');
            Q_Auxi.SQL.Add('  where Fecha>='+QuotedStr(FechaToStrSQL(fecii)));
            Q_Auxi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(fecff)));
            Q_Auxi.SQL.Add('  and Aplicado=''Si'' ');
            Q_Auxi.SQL.Add('  and producto='+QuotedStr(xprod));

            Q_Auxi.Prepare;
            Q_Auxi.Open;
            SaldoIniUni:=AjustaFloat(SaldoIniUni+Q_AuxiReal1.AsFloat,3{DMGEN_VTAS.DecCantidad});
            SaldoIniimp:=AjustaFloat(SaldoIniImp+Q_AuxiReal2.AsFloat,2);
            EntradasUni:=AjustaFloat(EntradasUni-Q_AuxiReal1.AsFloat,3{DMGEN_VTAS.DecCantidad});
            EntradasImp:=AjustaFloat(EntradasImp-Q_AuxiReal2.AsFloat,2);

            Q_Auxi.Close;
            Q_AuxiReal3.FieldKind:=fkInternalCalc;
            Q_AuxiReal4.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(Cantidad) as Real3, sum(ImporteMN) as Real4 from DINVMOVS');
            Q_Auxi.SQL.Add('  where Fecha>='+QuotedStr(FechaToStrSQL(fecii)));
            Q_Auxi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(fecff)));
            Q_Auxi.SQL.Add('  and Aplicado=''Si'' ');
            Q_Auxi.SQL.Add('  and producto='+QuotedStr(xprod));

            Q_Auxi.Prepare;
            Q_Auxi.Open;
            SaldoIniUni:=AjustaFloat(SaldoIniUni-Q_AuxiReal3.AsFloat,3{DMGEN_VTAS.DecCantidad});
            SaldoIniImp:=AjustaFloat(SaldoIniImp-Q_AuxiReal4.AsFloat,2);
            SalidasUni:=AjustaFloat(SalidasUni-Q_AuxiReal3.AsFloat,3{DMGEN_VTAS.DecCantidad});
            SalidasImp:=AjustaFloat(SalidasImp-Q_AuxiReal4.AsFloat,2);
          end;

          // Resta dias incompletos del mes final
          diai:=GetDiaFromFecha(VgFechaFin);
          diam:=GetDiasDelMes(VgFechaFin);
          if diai<diam then begin//Si no es el ultimo dia del mes
            fecii:=VgFechaFin;
            SetDiaToFecha(diai+1,fecii);
            fecff:=VgFechaFin;
            SetDiaToFecha(diam,fecff);
            Q_Auxi.Close;
            Q_AuxiReal1.FieldKind:=fkInternalCalc;
            Q_AuxiReal2.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(Cantidad) as Real1, sum(ImporteMN) as Real2 from DINVMOVE');
            Q_Auxi.SQL.Add('  where Fecha>='+QuotedStr(FechaToStrSQL(fecii)));
            Q_Auxi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(fecff)));
            Q_Auxi.SQL.Add('  and Aplicado=''Si'' ');
            Q_Auxi.SQL.Add('  and producto='+QuotedStr(xprod));
            Q_Auxi.Prepare;
            Q_Auxi.Open;
            EntradasUni:=AjustaFloat(EntradasUni-Q_AuxiReal1.AsFloat,3{DMGEN_VTAS.DecCantidad});
            EntradasImp:=AjustaFloat(EntradasImp-Q_AuxiReal2.AsFloat,2);

            Q_Auxi.Close;
            Q_AuxiReal3.FieldKind:=fkInternalCalc;
            Q_AuxiReal4.FieldKind:=fkInternalCalc;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Select sum(Cantidad) as Real3, sum(ImporteMN) as Real4 from DINVMOVS');
            Q_Auxi.SQL.Add('  where Fecha>='+QuotedStr(FechaToStrSQL(fecii)));
            Q_Auxi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(fecff)));
            Q_Auxi.SQL.Add('  and Aplicado=''Si'' ');
            Q_Auxi.SQL.Add('  and producto='+QuotedStr(xprod));

            Q_Auxi.Prepare;
            Q_Auxi.Open;
            SalidasUni:=AjustaFloat(SalidasUni-Q_AuxiReal3.AsFloat,3{DMGEN_VTAS.DecCantidad});
            SalidasImp:=AjustaFloat(SalidasImp-Q_AuxiReal4.AsFloat,2);
          end;
          // Calcula Salidas de Ventas Pendientes de Aplicar
          SalidasUniPendientesAplicar:=0;

          SaldoFinUni:=AjustaFloat(SaldoIniUni+EntradasUni-SalidasUni-SalidasUniPendientesAplicar,3{DMGEN_VTAS.DecCantidad});
          SaldoFinImp:=AjustaFloat(SaldoIniImp+EntradasImp-SalidasImp,2);
        finally
          Q_Auxi.Close;
        end;
        Result:=Dividefloat(SaldoFinImp,SaldoFinUni);
      end;
    end
    else
      Result:=0;
  end;
begin
  //Saca las ventas de los combustibles. <<<INICIO>>>
  DMGAS.T_Tcmb.Active:=True;
  with FLIQREP34P, DMGEN, DMLIQ, DMGAS do begin
    QL_Tcmb.Close;
    QL_Tcmb.Prepare;
    QL_Tcmb.Open;
    for i:=3 to 18 do
      tot[i]:=0;
    for i:=3 to 14 do
      tota[i]:=0;
    QL_Dliqc2.Close;
    QL_Dliqc2.ParamByName('pestacion').AsInteger:=DBLookupComboBox2.KeyValue;
    QL_Dliqc2.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqc2.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqc2.Prepare;
    QL_Dliqc2.Open;
    try
      FAvance.PreparaAvance('Calculando sección Utili1...',true,QL_Dliqc2.RecordCount);
      while not QL_Dliqc2.Eof do begin
        xlitros:=QL_Dliqc2LITROS.AsFloat;
        xsubtotal:=QL_Dliqc2Subtotal.AsFloat;
        xiva:=QL_Dliqc2Iva.AsFloat;
        xtotal:=QL_Dliqc2Total.AsFloat;
        xtasa:=dividefloat(xiva,xsubtotal);
        if ModoRep=0 then begin
          if LocalizaTabla(TL_Ajud2,'Estacion;Fecha;Combustible',
               VarArrayOf([DBLookupComboBox2.KeyValue,QL_Dliqc2Fecha.AsDateTime,QL_Dliqc2Combustible.AsInteger])) then
          begin
            xtotal:=xtotal-TL_Ajud2Total.AsFloat;
            xlitros:=xlitros-TL_Ajud2Diferencia.AsFloat;
            xsubtotal:=ajustafloat(dividefloat(xtotal,1+xtasa),2);
            xiva:=xtotal-xsubtotal;
          end;
        end;
        xfecha:=QL_Dliqc2Fecha.AsDateTime;
//        xlin:='D//'+IntToClaveNum(GetDiaFromFecha(QL_DliqcFecha.AsDateTime),2);
        xind:=3;
        totl:=0; tots:=0; toti:=0; tott:=0;
        for i:=3 to 14 do
          tota[i]:=0;
        while (xfecha=QL_Dliqc2Fecha.AsDateTime)and (not QL_Dliqc2.Eof) do begin
          if DMCUP.SwSubModuloCupReformas2008 then begin
            IEPS:=DMCUP.DameIEPS(QL_Dliqc2Combustible.AsInteger,QL_Dliqc2FECHA.AsDateTime);
            IEPS:=xlitros*IEPS;
            ImporteAIEPS:=(xtotal-IEPS)/(1+GetTasaIVAdeCombustible(DBLookupComboBox2.KeyValue,QL_Dliqc2COMBUSTIBLE.AsInteger,QL_Dliqc2FECHA.AsDateTime)/100);
            xiva:=(xtotal-IEPS-ImporteAIEPS);
            xsubtotal:=ImporteAIEPS+IEPS;
          end;
          xind:=3+4*(QL_Dliqc2Combustible.AsInteger-1);

          tot[xind]:=tot[xind]+xLitros;
          tot[xind+1]:=tot[xind+1]+xSubTotal;
          tot[xind+2]:=tot[xind+2]+xIva;
          tot[xind+3]:=tot[xind+3]+xTotal;
//
          tota[xind]:=tota[xind]+xLitros;
          tota[xind+1]:=tota[xind+1]+xSubtotal;
          tota[xind+2]:=tota[xind+2]+xIva;
          tota[xind+3]:=tota[xind+3]+xTotal;

          xfecha:=QL_Dliqc2Fecha.AsDateTime;
          FAvance.AvanzaPosicion;
          QL_Dliqc2.Next;
          xlitros:=QL_Dliqc2Litros.AsFloat;
          xsubtotal:=QL_Dliqc2Subtotal.AsFloat;
          xiva:=QL_Dliqc2Iva.AsFloat;
          xtotal:=QL_Dliqc2Total.AsFloat;
          xtasa:=dividefloat(xiva,xsubtotal);
//          if ModoRep=0 then begin
//            if LocalizaTabla(TL_Ajud2,'Estacion;Fecha;Combustible',
//                 VarArrayOf([T_EstsClave.AsInteger,QL_DliqcFecha.AsDateTime,QL_DliqcCombustible.AsInteger])) then
//            begin
//              xtotal:=xtotal-TL_Ajud2Total.AsFloat;
//              xlitros:=xlitros-TL_Ajud2Diferencia.AsFloat;
//              xsubtotal:=ajustafloat(dividefloat(xtotal,1+xtasa),2);
//              xiva:=xtotal-xsubtotal;
//            end;
//          end;
        end;
        totl:=tota[3]+tota[7]+tota[11];
        tots:=tota[4]+tota[8]+tota[12];
        toti:=tota[5]+tota[9]+tota[13];
        tott:=tota[6]+tota[10]+tota[14];
        tot[15]:=tot[15]+totl;
        tot[16]:=tot[16]+tots;
        tot[17]:=tot[17]+toti;
        tot[18]:=tot[18]+tott;
//        InsertaElemStr(FormatFloat('###,##0',totl),15,xlin);
//        InsertaElemStr(FormatoMoneda(tots),16,xlin);
//        InsertaElemStr(FormatoMoneda(toti),17,xlin);
//        InsertaElemStr(FormatoMoneda(tott),18,xlin);
//        BndDt.Items.Add(xlin);
      end;
//      xlin:='T// //';
      Try
        // MAGNA
        TM_AuxiUtil.Append;
        TM_AuxiUtilProducto.AsString:='1';
        TM_AuxiUtilNombreProducto.AsString:=_NOMBRESCOMBUSTIBLES[1];
        TM_AuxiUtilVenta.AsFloat:=tot[4];
        TM_AuxiUtilLitro.AsFloat:=tot[3];
        if QL_Tcmb.Locate('Clave',1,[]) then
          TM_AuxiUtilUltimoCosto.AsFloat:=DameCosto(QL_TcmbCODIGO.AsString)
        else
          TM_AuxiUtilUltimoCosto.AsFloat:=0;
        TM_AuxiUtilImpCosto.AsFloat:=AjustaFloat(TM_AuxiUtilLitro.AsFloat*TM_AuxiUtilUltimoCosto.AsFloat,2);
        TM_AuxiUtilUtilidad.AsFloat:=TM_AuxiUtilVenta.AsFloat-TM_AuxiUtilImpCosto.AsFloat;
        TM_AuxiUtil.Post;
        //PREMIUM
        TM_AuxiUtil.Append;
        TM_AuxiUtilProducto.AsString:='2';
        TM_AuxiUtilNombreProducto.AsString:=_NOMBRESCOMBUSTIBLES[2];
        TM_AuxiUtilVenta.AsFloat:=tot[8];
        TM_AuxiUtilLitro.AsFloat:=tot[7];
        if QL_Tcmb.Locate('Clave',2,[]) then
          TM_AuxiUtilUltimoCosto.AsFloat:=DameCosto(QL_TcmbCODIGO.AsString)
        else
          TM_AuxiUtilUltimoCosto.AsFloat:=0;
        TM_AuxiUtilImpCosto.AsFloat:=AjustaFloat(TM_AuxiUtilLitro.AsFloat*TM_AuxiUtilUltimoCosto.AsFloat,2);
        TM_AuxiUtilUtilidad.AsFloat:=TM_AuxiUtilVenta.AsFloat-TM_AuxiUtilImpCosto.AsFloat;
        TM_AuxiUtil.Post;
        //DIESEL
        TM_AuxiUtil.Append;
        TM_AuxiUtilProducto.AsString:='1';
        TM_AuxiUtilNombreProducto.AsString:=_NOMBRESCOMBUSTIBLES[3];
        TM_AuxiUtilVenta.AsFloat:=tot[12];
        TM_AuxiUtilLitro.AsFloat:=tot[11];
        if QL_Tcmb.Locate('Clave',3,[]) then
          TM_AuxiUtilUltimoCosto.AsFloat:=DameCosto(QL_TcmbCODIGO.AsString)
        else
          TM_AuxiUtilUltimoCosto.AsFloat:=0;
        TM_AuxiUtilImpCosto.AsFloat:=AjustaFloat(TM_AuxiUtilLitro.AsFloat*TM_AuxiUtilUltimoCosto.AsFloat,2);
        TM_AuxiUtilUtilidad.AsFloat:=TM_AuxiUtilVenta.AsFloat-TM_AuxiUtilImpCosto.AsFloat;
        TM_AuxiUtil.Post;
      except
        on e:Exception do begin
          TM_AuxiUtil.Cancel;
          MensajeErr(e.Message);
        end;
      end;
      for i:=3 to 18 do
        if i in [3,7,11,15] then xlin:=xlin+FormatFloat('###,##0',tot[i])+'//'
        else xlin:=xlin+FormatoMoneda(tot[i])+'//';
//      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
//    if FLIQREP06P.CBIeps.Checked then begin
//      BndDt.Items.Add('D//');
//      BndDt.Items.Add('D//');
//      BndDt.Items.Add('Z// // Resumen de IEPS/Lts:');
//      BndDt.Items.Add('Z// //Combustible // //IEPS/Lts //Litros //Total IEPS');
//      IEPSLts:=0;
//      FAvance.PreparaAvance('Preparando resumen IEPS...',true,QL_Dliqc.RecordCount);
//      try
//        IEPS:=0;
//        QL_Ieps.Close;
//        QL_Ieps.SQL.Clear;
//        QL_Ieps.SQL.Add('select l.combustible as Entero1,');
//        QL_Ieps.SQL.Add('(Select Nombre from dgastcmb where clave=l.combustible) as Str50,');
//        QL_Ieps.SQL.Add('sum(l.cantidad) as Real2,sum(l.importe_ieps) as Real3 from dgasdliqc l');
//        QL_Ieps.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
//        if VgFechaIni<DMGAS.VarGasFechaInicioIEPS then
//          QL_Ieps.SQL.Add('  and l.fecha>='+QuotedStr(FechaToStrSQL(DMGAS.VarGasFechaInicioIEPS)))
//        else
//          QL_Ieps.SQL.Add('  and l.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
//        QL_Ieps.SQL.Add('  and l.Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
//        QL_Ieps.SQL.Add('group by l.combustible');
//        QL_Ieps.Prepare;
//        QL_Ieps.Open;
//        while not QL_Ieps.Eof do begin
//          try
//            QL_Auxi.Close;
//            QL_Auxi.SQL.Clear;
//            QL_Auxi.SQL.Add('Select sum(Diferencia) as Real1, Combustible from DGASAJUD2');
//            QL_Auxi.SQL.Add('Where Estacion='+IntToStr(T_EstsClave.AsInteger));
//            QL_Auxi.SQL.Add('  and Combustible='+IntToStr(QL_IepsEntero1.AsInteger));
//            if VgFechaIni<DMGAS.VarGasFechaInicioIEPS then
//              QL_Auxi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(DMGAS.VarGasFechaInicioIEPS )))
//            else
//              QL_Auxi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
//            QL_Auxi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
//            QL_Auxi.SQL.Add('Group by Combustible');
//            QL_Auxi.Prepare;
//            QL_Auxi.Open;
//            IEPS:=DMCUP.DameIEPS(QL_IepsEntero1.AsInteger,VgFechaIni);
//            IEPSLts:=IEPSLts+(QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)*IEPS;
//            xlin:='Z// //'+QL_IepsSTR50.AsString+'// //'+FloatToStr(IEPS)+'//'+FormatoMoneda(AjustaFloat(QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat,0))+'//'+FormatoMoneda(AjustaFloat((QL_IepsReal2.AsFloat-QL_AuxiREAL1.AsFloat)*IEPS,0));
//            BndDt.Items.Add(xlin);
//          finally
//            QL_Auxi.Close;
//          end;
//          QL_Ieps.Next;
//          FAVANCE.AvanzaPosicion;
//        end;
//        BndDt.Items.Add('X// // // // //Total... // '+FormatoMoneda(AjustaFloat(IEPSLts,2)));
//      finally
//        Q_Auxi.Close;
//        FAVANCE.Close;
//      end;
//    end;
  end;
  //Saca las ventas de los combustibles. <<<FIN>>>
  //Saca las ventas de los Aceites. <<<INICIO>>>
  with FLIQREP34P, DMGEN, DMLIQ, DMGAS do begin
//    CreaEtiquetas;
//    InicializaTemp(TT_Auxi);
//    CreaTablaTemp;
//    BndDt.Items.Clear;
    QL_Dliqa.Close;
    {QL_Dliqa.ParamByName('pestacion').AsInteger:=T_EstsClave.AsInteger;
    QL_Dliqa.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqa.ParamByName('pfechafin').AsDateTime:=VgFechaFin; }
    QL_Dliqa.SQL.Clear;
    QL_Dliqa.SQL.Add('Select l.Estacion,l.Fecha,l.Folio,(select p.codigo from DGASPROD p where p.clave=l.producto)as Producto,l.Venta,l.Precio_Civa,l.Importe,');
    QL_Dliqa.SQL.Add('   (Select Despachador from DGASLIQG where Estacion=l.Estacion and Folio=l.folio) as Desp,');
    QL_Dliqa.SQL.Add('   (select p.descripcion from DGASPROD p where p.clave=l.producto)as Descripcion');
    QL_Dliqa.SQL.Add(' from DGASDLIQA l');
    QL_Dliqa.SQL.Add('Where l.Estacion='+IntToStr(DBLookupComboBox2.KeyValue));
    QL_Dliqa.SQL.Add('      and l.Fecha>="'+FechaToStrSql(VgFechaIni)+'" and l.Fecha<="'+FechaToStrSql(VgFechaFin)+'"');
    QL_Dliqa.SQL.Add('      and l.Venta>0.001');
//    if pIsla>0  then QL_Dliqa.SQL.Add(' and Isla='+InttoStr(pIsla));
//    if pTurno>0 then QL_Dliqa.SQL.Add(' and Turno='+InttoStr(pTurno));
    QL_Dliqa.SQL.Add('Order by l.Estacion,l.Folio,l.Fecha');
    QL_Dliqa.Prepare;
    QL_Dliqa.Open;
    try
      FAvance.PreparaAvance('Calculando sección Util2...',true,QL_Dliqa.RecordCount);
      while not QL_Dliqa.Eof do begin
        if not TM_AuxiUtilAce.Locate('Producto',QL_DliqaProducto.AsString,[]) then begin
          TM_AuxiUtilAce.Append;
          TM_AuxiUtilAceProducto.AsString:=QL_DliqaProducto.AsString;
          TM_AuxiUtilAceDescripcion.AsString:=QL_DliqaDESCRIPCION.AsString;
          TM_AuxiUtilAceCantidad.AsInteger:=QL_DliqaVenta.AsInteger;
          TM_AuxiUtilAceImporte.AsFloat:=QL_DliqaImporte.AsFloat;
        end
        else begin
          TM_AuxiUtilAce.Edit;
          TM_AuxiUtilAceCantidad.AsInteger:=TM_AuxiUtilAceCantidad.AsInteger+QL_DliqaVenta.AsInteger;
          TM_AuxiUtilAceImporte.AsFloat:=TM_AuxiUtilAceImporte.AsFloat+QL_DliqaImporte.AsFloat;
        end;
        FAvance.AvanzaPosicion;
        QL_Dliqa.Next;
      end;
    finally
      FAvance.Close;
    end;
//Cargando banda detalle
    try
      for i:=1 to 2 do begin
        totd[i]:=0;
        totg[i]:=0;
      end;
      TM_AuxiUtilAce.First;
      FAvance.PreparaAvance('Calculando sección Util3...',true,TM_AuxiUtilAce.RecordCount);
      while not TM_AuxiUtilAce.Eof do begin
//        xlin:='E//'+IntToClaveNum(TT_AuxiDespachador.AsInteger,3)+'//'+TT_AuxiNombreDespachador.AsString;
//        BndDt.Items.Add(xlin);
//        xdesp:=TT_AuxiDespachador.AsInteger;
//        for i:=1 to 2 do
//          totd[i]:=0;
//        while (xdesp=TT_AuxiDespachador.AsInteger)and(not TT_Auxi.Eof) do begin
          xprecio:=AjustaFloat(DivideFloat(TM_AuxiUtilAceImporte.AsFloat,TM_AuxiUtilAceCantidad.AsInteger),2);
//          xlin:='D//'+IntToClaveNum(TT_AuxiProducto.AsInteger,3)+'//'+
//                      TT_AuxiDescripcion.AsString+'//'+
//                      FormatFloat('###,##0.00',xprecio)+'//'+
//                      FormatFloat('###,##0',TT_AuxiCantidad.AsFloat)+'//'+
//                      FormatoMoneda(TT_AuxiImporte.AsFloat)+'//';
          totd[1]:=totd[1]+TM_AuxiUtilAceCantidad.AsInteger;
          totd[2]:=totd[2]+TM_AuxiUtilAceImporte.AsFloat;
//          BndDt.Items.Add(xlin);
          FAvance.AvanzaPosicion;
          TT_Auxi.Next;
//        end;
        try
          if not TM_AuxiUtil.Locate('Producto',TM_AuxiUtilAceProducto.AsString,[]) then begin
            TM_AuxiUtil.Append;
            TM_AuxiUtilProducto.AsString:=TM_AuxiUtilAceProducto.AsString;
            TM_AuxiUtilNombreProducto.AsString:=TM_AuxiUtilAceDescripcion.AsString;
            TM_AuxiUtilVenta.AsFloat:=totd[2];
            TM_AuxiUtilLitro.AsFloat:=totd[1];
            TM_AuxiUtilUltimoCosto.AsFloat:=DameCosto(TM_AuxiUtilProducto.AsString);
            TM_AuxiUtilImpCosto.AsFloat:=AjustaFloat(TM_AuxiUtilLitro.AsFloat*TM_AuxiUtilUltimoCosto.AsFloat,2);
            TM_AuxiUtilUtilidad.AsFloat:=TM_AuxiUtilVenta.AsFloat-TM_AuxiUtilImpCosto.AsFloat;
          end
          else begin
            TM_AuxiUtil.Edit;
//            TM_AuxiUtilProducto.AsString:='1';              n
//            TM_AuxiUtilNombreProducto.AsString:='DIESEL 34006';
            TM_AuxiUtilVenta.AsFloat:=TM_AuxiUtilVenta.AsFloat+totd[2];
            TM_AuxiUtilLitro.AsFloat:=TM_AuxiUtilLitro.AsFloat+totd[1];
//            if QL_Tcmb.Locate('Clave',3,[]) then
//              TM_AuxiUtilUltimoCosto.AsFloat:=DameCosto(QL_TcmbCODIGO.AsString)
//            else
//              TM_AuxiUtilUltimoCosto.AsFloat:=0;
            TM_AuxiUtilImpCosto.AsFloat:=AjustaFloat(TM_AuxiUtilLitro.AsFloat*TM_AuxiUtilUltimoCosto.AsFloat,2);
            TM_AuxiUtilUtilidad.AsFloat:=TM_AuxiUtilVenta.AsFloat-TM_AuxiUtilImpCosto.AsFloat;
          end;
          TM_AuxiUtil.Post;
        except
          TM_AuxiUtil.Cancel;
        end;
//        xlin:='T//';
//        for i:=1 to 2 do begin
//          Case i of
//            1:InsertaElemStr(FormatFloat('###,##0',totd[i]),4+i,xlin);
//            2:InsertaElemStr(FormatoMoneda(totd[i]),4+i,xlin);
//          end;
//          totg[i]:=totg[i]+totd[i];
//        end;
//        BndDt.Items.Add(xlin);
        TM_AuxiUtilAce.Next;
        FAvance.AvanzaPosicion;
      end;
//      xlin:='T// //Total General//';
//      for i:=1 to 2 do begin
//        InsertaElemStr(FormatoMoneda(totg[i]),4+i,xlin);
//      end;
//      BndDt.Items.Add(xlin);
    finally
      FAvance.Close;
    end;
  end;
  //Saca las ventas de los Aceites. <<<FIN>>>

end;

procedure TFLIQREP34.PreparaVentas;
begin
  with DMGAS do begin
    QL_Dliqc.Close;
    QL_Dliqc.ParamByName('pestacion').AsInteger:=T_EstsClave.AsInteger;
    QL_Dliqc.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
    QL_Dliqc.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;
    if QL_Dliqc.RecordCount>0 then begin
      try
        FAVANCE.PreparaAvance('Calculando sección Ventas...',True,QL_Dliqc.RecordCount);
        while not QL_Dliqc.Eof do begin
          try
            if TM_AuxiVentas.Locate('Combustible',QL_DliqcCOMBUSTIBLE.AsInteger,[]) then begin
              TM_AuxiVentas.Edit;
              TM_AuxiVentasLitrosDia.AsFloat:=  TM_AuxiVentasLitrosDia.AsFloat + QL_DliqcLITROS.AsFloat;
              TM_AuxiVentasImporteDia.AsFloat:= TM_AuxiVentasImporteDia.AsFloat + QL_DliqcTOTAL.AsFloat;
            end
            else begin
              TM_AuxiVentas.Insert;
              TM_AuxiVentasCombustible.AsInteger:=      QL_DliqcCOMBUSTIBLE.AsInteger;
              TM_AuxiVentasNombreCombustible.AsString:= QL_DliqcNombreCombustible.AsString;
              TM_AuxiVentasUnidad.AsString:=            'Litros';
              TM_AuxiVentasLitrosDia.AsFloat:=          QL_DliqcLITROS.AsFloat;
              TM_AuxiVentasImporteDia.AsFloat:=         QL_DliqcTOTAL.AsFloat;
              TM_AuxiVentasLitrosAcum.AsFloat:=         0;
              TM_AuxiVentasImporteAcum.AsFloat:=        0;  
            end;
            TM_AuxiVentas.Post;
          except
            TM_AuxiVentas.Cancel;
          end;
          QL_Dliqc.Next;
          FAVANCE.AvanzaPosicion;
        end;
      finally
        QL_Dliqc.Close;
        FAVANCE.Close;
      end;
    end;
    QL_Dliqc.Close;
    QL_Dliqc.ParamByName('pestacion').AsInteger:=T_EstsClave.AsInteger;
    QL_Dliqc.ParamByName('pfechaini').AsDateTime:=DiaPrimero(VgFechaIni);
    QL_Dliqc.ParamByName('pfechafin').AsDateTime:=DiaUltimo(VgFechaFin);
    QL_Dliqc.Prepare;
    QL_Dliqc.Open;
    if QL_Dliqc.RecordCount>0 then begin
      try
        FAVANCE.PreparaAvance('Calculando Ventas Mensual...',True,QL_Dliqc.RecordCount);
        while not QL_Dliqc.Eof do begin
          try
            if TM_AuxiVentas.Locate('Combustible',QL_DliqcCOMBUSTIBLE.AsInteger,[]) then begin
              TM_AuxiVentas.Edit;
              TM_AuxiVentasLitrosAcum.AsFloat:=  TM_AuxiVentasLitrosAcum.AsFloat + QL_DliqcLITROS.AsFloat;
              TM_AuxiVentasImporteAcum.AsFloat:= TM_AuxiVentasImporteAcum.AsFloat + QL_DliqcTOTAL.AsFloat;
            end
            else begin
              TM_AuxiVentas.Insert;
              TM_AuxiVentasCombustible.AsInteger:=      QL_DliqcCOMBUSTIBLE.AsInteger;
              TM_AuxiVentasNombreCombustible.AsString:= QL_DliqcNombreCombustible.AsString;
              TM_AuxiVentasUnidad.AsString:=            'Litros';
              TM_AuxiVentasLitrosDia.AsFloat:=          0;
              TM_AuxiVentasImporteDia.AsFloat:=         0;
              TM_AuxiVentasLitrosAcum.AsFloat:=         QL_DliqcLITROS.AsFloat;
              TM_AuxiVentasImporteAcum.AsFloat:=        QL_DliqcTOTAL.AsFloat;
            end;
            TM_AuxiVentas.Post;
          except
            TM_AuxiVentas.Cancel;
          end;
          QL_Dliqc.Next;
          FAVANCE.AvanzaPosicion;
        end;
      finally
        QL_Dliqc.Close;
        FAVANCE.Close;
      end;
    end;
  end;
end;

procedure TFLIQREP34.QL_Dliqc2CalcFields(DataSet: TDataSet);
begin
  with DMGAS do begin
    QL_Dliqc2SubTotal.AsFloat:=AjustaFloat(QL_Dliqc2TOTAL.AsFloat/(1+GetTasaIVAdeCombustible(EstacionActual,QL_Dliqc2COMBUSTIBLE.AsInteger,QL_Dliqc2FECHA.AsDateTime)/100),2);
    QL_Dliqc2Iva.AsFloat:=AjustaFloat(QL_Dliqc2Total.AsFloat-QL_Dliqc2Subtotal.AsFloat,2);
  end;
end;

procedure TFLIQREP34.CargaBanda;
var
  xTotVentas:array[1..2] of Real;
  i:Integer;
  xPorcCred:array[1..4] of Real;
  xTotInv:array[1..2] of Real;
  xTotUtil:array[1..4] of Real;
begin
  try
    TM_AuxiVentas.First;
    TM_AuxiCredito.First;
    TM_AuxiInv.First;
    TM_AuxiUtil.First;
    xlin:='';
    BndDt.Items.Clear;
    if TM_AuxiVentas.RecordCount>0 then begin
      FAVANCE.PreparaAvance('Imprimiendo sección ventas...',True,TM_AuxiVentas.RecordCount);
      try
        for i:=1 to 2 do begin
          xTotVentas[i]:=0;
        end;
        xlin:='E//VENTAS DEL DIA';
        BndDt.Items.Add(xlin);
        while not TM_AuxiVentas.Eof do begin
          xlin:='D//'+TM_AuxiVentasNombreCombustible.AsString+'//'+TM_AuxiVentasUnidad.AsString+'//'+FormatoMoneda(TM_AuxiVentasLitrosDia.AsFloat)+'//'+
                      FormatoMoneda(TM_AuxiVentasImporteDia.AsFloat)+'//'+FormatoMoneda(TM_AuxiVentasLitrosAcum.AsFloat)+'//'+FormatoMoneda(TM_AuxiVentasImporteAcum.AsFloat);
          BndDt.Items.Add(xlin);
          xTotVentas[1]:=xTotVentas[1]+TM_AuxiVentasImporteDia.AsFloat;
          xTotVentas[2]:=xTotVentas[2]+TM_AuxiVentasImporteAcum.AsFloat;
          TM_AuxiVentas.Next;
          FAVANCE.AvanzaPosicion;
        end;
        xlin:='V//Total // // //'+FormatoMoneda(xTotVentas[1])+'// //'+FormatoMoneda(xTotVentas[2]);
        BndDt.Items.Add(xlin);
      finally
        FAVANCE.Close;
        TM_AuxiVentas.Active:=False;
      end;
    end;
    if TM_AuxiCredito.RecordCount>0 then begin
      for i:= 1 to 4 do begin
        xPorcCred[i]:=0;
      end;
      try
        FAVANCE.PreparaAvance('Imprimiendo sección Créditos...',True,2);
        xlin:='E//CRÉDITOS';
        BndDt.Items.Add(xlin);
        xlin:='C//Concepto // 1 - '+IntTostr(VarcxcPlazo1)+' Días //'+IntTostr(VarcxcPlazo1+1)+' - '+IntToStr(VarcxcPlazo2)+' Días //'+IntTostr(VarcxcPlazo2+1)+' - '+IntToStr(VarcxcPlazo3)+' Días //'
              +'Mas de '+IntTostr(VarcxcPlazo3)+' Días ';
        BndDt.Items.Add(xlin);
        FAVANCE.AvanzaPosicion;
        xlin:='D//'+TM_AuxiCreditoConcepto.AsString+'//'+FormatoMoneda(TM_AuxiCreditoPlazo1.AsFloat)+'//'+FormatoMoneda(TM_AuxiCreditoPlazo2.AsFloat)+'//'+
              FormatoMoneda(TM_AuxiCreditoPlazo3.AsFloat)+'//'+FormatoMoneda(TM_AuxiCreditoPlazo4.AsFloat)+'//'+FormatoMoneda(TM_AuxiCreditoPlazo5.AsFloat);
        BndDt.Items.Add(xlin);
        xlin:='D// //'+FormatoMoneda(TM_AuxiCreditoPlazo1Porc.AsFloat)+'%'+'//'+FormatoMoneda(TM_AuxiCreditoPlazo2Porc.AsFloat)+'%'+'//'+FormatoMoneda(TM_AuxiCreditoPlazo3Porc.AsFloat)+'%'
               +'//'+FormatoMoneda(TM_AuxiCreditoPlazo4Porc.AsFloat)+'%';
        BndDt.Items.Add(xlin);
        FAVANCE.AvanzaPosicion;
      finally
        FAVANCE.Close;
        TM_AuxiCredito.Active:=False;
      end;
    end;
    if TM_AuxiInv.RecordCount>0 then begin
      try
        xlin:='E//INVENTARIOS';
        BndDt.Items.Add(xlin);
        xlin:='I// Producto // Costo Actual // Unidades // Costos //';
        BndDt.Items.Add(xlin);
        FAVANCE.PreparaAvance('Imprimiendo sección Inventario...',True,TM_AuxiInv.RecordCount);
        for i:= 1 to 2 do begin
          xTotInv[i]:=0;
        end;
        while not TM_AuxiInv.Eof do begin
          xlin:='D//'+TM_AuxiInvNombreProducto.AsString+'//'+FormatoMoneda(TM_AuxiInvCosto.AsFloat)+'//'+FormatoMoneda(TM_AuxiInvUnidades.AsFloat)+
                '//'+FormatoMoneda(TM_AuxiInvTotal.AsFloat);
          BndDt.Items.Add(xlin);
          xTotInv[1]:=xTotInv[1]+TM_AuxiInvUnidades.AsFloat;
          xTotInv[2]:=xTotInv[2]+TM_AuxiInvTotal.AsFloat;
          TM_AuxiInv.Next;
          FAVANCE.AvanzaPosicion;
        end;
        xlin:='V// Total // //'+FormatoMoneda(xTotInv[1])+' // '+FormatoMoneda(xTotInv[2]);
        BndDt.Items.Add(xlin);
      finally
        FAVANCE.Close;
        TM_AuxiInv.Active:=False;
      end;
    end;
    if TM_AuxiUtil.RecordCount>0 then begin
      try
        xlin:='E//UTILIDAD';
        BndDt.Items.Add(xlin);
        xlin:='U// Productos // Litros // Ventas // Ultimo Costo // Costos // Utilidad //';
        BndDt.Items.Add(xlin);
        FAVANCE.PreparaAvance('Imprimiendo sección Utilidad...',True,TM_AuxiUtil.RecordCount);
        for i:=1 to 4 do begin
          xTotUtil[i]:=0;
        end;
        while not TM_AuxiUtil.Eof do begin
          xlin:='D//'+TM_AuxiUtilNombreProducto.AsString+'//'+FormatoMoneda(TM_AuxiUtilLitro.AsFloat)+'//'+FormatoMoneda(TM_AuxiUtilVenta.AsFloat)+'//'+
                FormatoMoneda(TM_AuxiUtilUltimoCosto.AsFloat)+'//'+FormatoMoneda(TM_AuxiUtilImpCosto.AsFloat)+'//'+FormatoMoneda(TM_AuxiUtilUtilidad.AsFloat);
          BndDt.Items.Add(xlin);
          xTotUtil[1]:=xTotUtil[1]+TM_AuxiUtilLitro.AsFloat;
          xTotUtil[2]:=xTotUtil[2]+TM_AuxiUtilVenta.AsFloat;
          xTotUtil[3]:=xTotUtil[3]+TM_AuxiUtilImpCosto.AsFloat;
          xTotUtil[4]:=xTotUtil[4]+TM_AuxiUtilUtilidad.AsFloat;
          TM_AuxiUtil.Next;
          FAVANCE.AvanzaPosicion;
        end;
        xlin:='V// Total //'+FormatoMoneda(xTotUtil[1])+'//'+FormatoMoneda(xTotUtil[2])+'// //'+FormatoMoneda(xTotUtil[3])+'//'+FormatoMoneda(xTotUtil[4]);
        BndDt.Items.Add(xlin);
      finally
        TM_AuxiUtil.Active:=False;
        FAVANCE.Close;
      end;
    end;
  finally

  end;
end;

end.
