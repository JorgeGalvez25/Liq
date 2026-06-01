unit ULIQREP41;

interface

uses Variants, DateUtils,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QRExport, Printers, QRPDFFilt;

type
  TFLIQREP41 = class(TForm)
    QuickRep1: TQuickRep;
    QL_Carg: TQuery;
    TT_Auxi: TTable;
    BndDt: TQRStringsBand;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    TT_AuxiNombre: TStringField;
    TT_AuxiSaldo: TFloatField;
    QRRTFFilter1: TQRRTFFilter;
    QRBand7: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    TT_AuxiFolio: TIntegerField;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRLRango: TQRLabel;
    QL_Clie: TQuery;
    QL_ClieNOCLIE: TIntegerField;
    QL_ClieNOMBRE: TStringField;
    QL_ClieCLASIFICA: TIntegerField;
    QL_CargTIPOMOV: TStringField;
    QL_CargFOLIO: TIntegerField;
    QL_CargFECHA: TDateTimeField;
    QL_CargFECVENCE: TDateTimeField;
    QL_CargIMPORTE: TFloatField;
    QL_CargTOTALPAGOS: TFloatField;
    TT_AuxiNoClie: TIntegerField;
    TT_AuxiNombreGrupo: TStringField;
    TT_AuxiFecha: TDateTimeField;
    TT_AuxiTipoMov: TStringField;
    TT_AuxiFecVence: TDateTimeField;
    TT_AuxiReg: TIntegerField;
    TT_AuxiGrupo: TIntegerField;
    QL_Abon: TQuery;
    QL_AbonIMPORTE: TFloatField;
    QL_Carg2: TQuery;
    QL_AbonSUCLCAR: TIntegerField;
    QL_AbonTIPOCAR: TStringField;
    QL_AbonFOLIOCAR: TIntegerField;
    QL_Carg2TIPOMOV: TStringField;
    QL_Carg2FOLIO: TIntegerField;
    QL_Carg2FECHA: TDateTimeField;
    QL_Carg2FECVENCE: TDateTimeField;
    QL_Carg2IMPORTE: TFloatField;
    QL_Carg2TOTALPAGOS: TFloatField;
    ChildBand2: TQRChildBand;
    ChildBand1: TQRChildBand;
    QRLabel33: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape55: TQRShape;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape1: TQRShape;
    TT_AuxiPagos: TFloatField;
    TT_AuxiConcepto: TStringField;
    QL_Carg2CONCEPTO: TStringField;
    QL_CargCONCEPTO: TStringField;
    QL_ClieNombreClasif: TStringField;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel28: TQRLabel;
    TT_AuxiTotal: TFloatField;
    TT_AuxiIvaPendiente: TFloatField;
    TT_AuxiIva: TFloatField;
    QL_Carg2IVA: TFloatField;
    QL_CargIVA: TFloatField;
    QRLabel29: TQRLabel;
    QRLMoneda: TQRLabel;
    TT_AuxiMoneda: TStringField;
    QL_CargMONEDA: TStringField;
    QL_AbonMONEDA: TStringField;
    QL_Carg2MONEDA: TStringField;
    QL_Mone: TQuery;
    QL_MoneCLAVE: TStringField;
    QL_Carg2INDICE: TIntegerField;
    TT_AuxiIndice: TIntegerField;
    QL_CargINDICE: TIntegerField;
    QL_AbonINDICECAR: TIntegerField;
    QL_ClieTELEFONO: TStringField;
    TT_AuxiTelefono: TStringField;
    QRLFechaHoraEnc: TQRLabel;
    TT_AuxiParidad: TFloatField;
    QL_CargPARIDAD: TFloatField;
    QL_Carg2PARIDAD: TFloatField;
    QL_AbonPARIDAD: TFloatField;
    TT_AuxiSaldoMN: TFloatField;
    TT_AuxiPagosMN: TFloatField;
    TT_AuxiTotalMN: TFloatField;
    TT_AuxiIvaMN: TFloatField;
    TT_AuxiIvaPendienteMN: TFloatField;
    QL_Vale: TQuery;
    QL_ValeESTACION: TIntegerField;
    QL_ValeCAJA: TIntegerField;
    QL_ValeFECHA: TDateTimeField;
    QL_ValeTURNO: TIntegerField;
    QL_ValeINDICE: TIntegerField;
    QL_ValeCLIENTE: TIntegerField;
    QL_ValeSUBCODIGO: TIntegerField;
    QL_ValeCANTIDAD: TIntegerField;
    QL_ValeTOTAL: TFloatField;
    QL_ValeFACTURADO: TStringField;
    QL_ValeESTACIONFAC: TIntegerField;
    QL_ValeSERIEFAC: TStringField;
    QL_ValeFOLIOFAC: TIntegerField;
    QL_ValeINDICEVALE: TIntegerField;
    QL_ValeFECHAFACTURA: TDateTimeField;
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure ChildBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TT_AuxiCalcFields(DataSet: TDataSet);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xFechaIni,
    xFechaFin:TDateTime;
    xRango:Boolean;
    pImporteMinimo,
    pImporteMaximo:real;
    pSwTelefono:Boolean;
    pFechaInicioIVA:TDatetime;
    procedure CreaTablaTemp;
    procedure PreparaReporte;
    procedure CargaBanda;
  end;

var
  FLIQREP41: TFLIQREP41;
  xlin:string;
  xtp:char;
  LMonedas:TStringList;


implementation

uses DDMCXC, DDMCNT, DDMGEN, ULIBGRAL, ULIBDATABASE, UAVANCE,
  UGENCLASB, UGEN_NET, DDMGENP, ULIQREP41P;

{$R *.DFM}


procedure TFLIQREP41.PreparaReporte;
var xreg,i:integer;
    xsaldo:TSaldoCxc;
    paridad:double;
    swmoneda,swsaldo:boolean;
begin
  with DMGEN, DMCXC,DMGENP,FLIQREP41P do begin
    InicializaTemp(TT_Auxi);
    CreaTablaTemp;
    LMonedas:=TStringList.Create;
    QL_Mone.Close;
    QL_Mone.Prepare;
    QL_Mone.Open;
    QL_Clie.close;
    QL_Clie.SQL.Clear;
    QL_Clie.SQL.Add('Select Noclie,Nombre,Clasifica,Telefono from DGENCLIE where ');
    if chbCtesActivos.Checked then
      QL_Clie.SQL.Add(' Activo="Si"')
    else
      QL_Clie.SQL.Add(' (Activo="Si" or Activo="No")');
    if not CheckBox3.Checked then
      QL_Clie.SQL.Add(' and Noclie in (Select distinct NoClie from DCXCSCXC where Moneda="'+DBLookUpComboBox1.keyvalue+'")')
    else
      QL_Clie.SQL.Add(' and Noclie in (Select distinct NoClie from DCXCSCXC)');

    if (not CheckBox1.Checked)and(not RBPorGrupo.Checked) then
      QL_Clie.SQL.Add(' and NoClie='+MaskEdit1.Text);

    if RBPorGrupo.Checked then begin
      QL_Clie.SQL.Add(' and  Clasifica>='+MaskEdit5.Text);
      QL_Clie.SQL.Add(' and  Clasifica<='+MaskEdit6.Text);
    end;
    QL_Clie.SQL.Add('Order by NoClie');
    QL_Clie.Prepare;
    QL_Clie.Open;
    xreg:=1;
    try
      FAvance.PreparaAvance('Preparando Reporte...',true,QL_Clie.RecordCount);
      While not QL_Clie.Eof do begin
        swsaldo:=false;
        QL_Mone.First;
        while not QL_Mone.Eof do begin
          SaldoCxcClie(QL_ClieNoClie.Asinteger,QL_MoneClave.AsString,VgFechaIni,VgFechaFin,xsaldo);
          swsaldo:=DiferentesDeCero(xsaldo.SaldoIni,xsaldo.CargosPer,xsaldo.AbonosPer,0);
          if swsaldo then break;
          QL_Mone.Next;
        end;
        if not swsaldo then begin
          FAvance.AvanzaPosicion;
          QL_Clie.Next;
          Continue;
        end;
        QL_Carg.Close;
        QL_Carg.SQL.Clear;
        QL_Carg.SQL.Add('Select tipomov,folio,indice,fecha,fecvence,iva,importe,totalpagos,Concepto,Moneda,Paridad from DCXCCARG');
        QL_Carg.SQL.Add('Where NoClie='+IntToStr(QL_ClieNoClie.AsInteger));
        QL_Carg.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
        QL_Carg.SQL.Add('  and Saldado="No" and Aplicado="Si" ');

        if not CheckBox3.Checked then
          QL_Carg.SQL.Add('  and Moneda="'+DBLookUpComboBox1.KeyValue+'"');

        if ComboBox3.ItemIndex=1 then
          QL_Carg.SQL.Add('  and FecVence<="'+FechaToStrSQL(VgFechaFin)+'"');
        QL_Carg.SQL.Add('order by fecha,tipomov,folio,indice');
        QL_Carg.Prepare;
        QL_Carg.Open;
        While not QL_Carg.Eof do begin
          if xRango then begin
            if (QL_CargFecha.AsDateTime<xfechaini) or
               (QL_CargFecha.AsDateTime>xfechafin) then begin
               QL_Carg.Next;
               Continue;
             end;
          end;
          TT_Auxi.Insert;
          TT_AuxiReg.AsInteger:=xreg;
          TT_AuxiGrupo.AsInteger:=QL_ClieClasifica.AsInteger;
          TT_AuxiNombreGrupo.AsString:=QL_ClieNombreClasif.AsString;
          TT_AuxiNoClie.AsInteger:=QL_ClieNoClie.AsInteger;
          TT_AuxiTelefono.AsString:=QL_ClieTelefono.AsString;
          TT_AuxiNombre.AsString:=QL_ClieNombre.AsString;
          TT_AuxiTipoMov.AsString:=QL_CargTipoMov.AsString;
          TT_AuxiFolio.AsInteger:=QL_CargFolio.AsInteger;
          TT_AuxiIndice.AsInteger:=QL_CargIndice.AsInteger;
          TT_AuxiFecha.AsDateTime:=QL_CargFecha.AsDateTime;
          TT_AuxiFecVence.AsDateTime:=QL_CargFecVence.AsDateTime;
          TT_AuxiConcepto.AsString:=QL_CargConcepto.AsString;
          TT_AuxiIVA.AsFloat:=QL_CargIva.AsFloat;
          TT_AuxiTotal.AsFloat:=QL_CargImporte.AsFloat;
          TT_AuxiPagos.AsFloat:=QL_CargTotalPagos.AsFloat;
          TT_AuxiSaldo.AsFloat:=QL_CargImporte.AsFloat-QL_CargTotalPagos.AsFloat;
          TT_AuxiMoneda.AsString:=QL_CargMoneda.AsString;
          TT_AuxiParidad.AsFloat:=QL_CargPARIDAD.AsFloat;
          if (CheckBox3.Checked)and(TT_AuxiMoneda.AsString<>MonedaNac) then begin
            if not CheckBox7.Checked then
                Paridad:=DameParidadFecha(TT_AuxiMoneda.asstring,VgFechaFin)
              else
                Paridad := TT_AuxiParidad.AsFloat;
            TT_AuxiParidad.AsFloat:=Paridad;
{            TT_AuxiIva.AsFloat:=AjustaFloat(TT_AuxiIva.AsFloat*paridad,2);
            TT_AuxiTotal.AsFloat:=AjustaFloat(TT_AuxiTotal.AsFloat*paridad,2);
            TT_AuxiPagos.AsFloat:=AjustaFloat(TT_AuxiPagos.AsFloat*paridad,2);
            TT_AuxiSaldo.AsFloat:=AjustaFloat(TT_AuxiSaldo.AsFloat*paridad,2);}
            swmoneda:=false;
            if LMonedas.Count>0 then
              for i:=0 to LMonedas.Count-1 do begin
                if ExtraeElemStr(LMonedas[i],1)=TT_AuxiMoneda.AsString then begin
                  swmoneda:=true;
                  break;
                end;
              end;
            if not swmoneda then
              LMonedas.Add(TT_AuxiMoneda.AsString+'//'+FormatFloat('##0.0000',paridad));
          end;
          try
            TT_Auxi.Post;
          except
            MensajeErr('Clave ya existe');
            raise;
          end;
          inc(xreg);
          QL_Carg.Next;
        end;
        // Carga vales pendientes de facturar <<<INICIO>>
        QL_Vale.Close;
        QL_Vale.SQL.Clear;
        QL_Vale.SQL.Add('select * from DGASPVAL ');
        QL_Vale.SQL.Add('where Cantidad>0 ');
        QL_Vale.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
        QL_Vale.SQL.Add('  and ((Facturado="No")  or (Facturado="Si" and FechaFactura>"'+FechaToStrSQL(VgFechaFin)+'"))');
        QL_Vale.SQL.Add('  and Cliente='+IntToStr(QL_ClieNoClie.AsInteger));
        QL_Vale.SQL.Add('order by CLIENTE,FACTURADO,FECHA');
        QL_Vale.Prepare;
        QL_Vale.Open;
        While not QL_Vale.Eof do begin
          TT_Auxi.Insert;
          TT_AuxiReg.AsInteger:=xreg;
          TT_AuxiGrupo.AsInteger:=QL_ClieClasifica.AsInteger;
          TT_AuxiNombreGrupo.AsString:=QL_ClieNombreClasif.AsString;
          TT_AuxiNoClie.AsInteger:=QL_ClieNoClie.AsInteger;
          TT_AuxiTelefono.AsString:=QL_ClieTelefono.AsString;
          TT_AuxiNombre.AsString:=QL_ClieNombre.AsString;
          TT_AuxiTipoMov.AsString:='VC';
          TT_AuxiFolio.AsInteger:=QL_ClieNoClie.AsInteger+QL_ValeIndice.AsInteger+DayOfTheWeek(QL_ValeFecha.AsDateTime);//xreg+QL_ValeIndice.AsInteger;
          TT_AuxiIndice.AsInteger:=0;
          TT_AuxiFecha.AsDateTime:=QL_ValeFecha.AsDateTime;
//          TT_AuxiFecVence.AsDateTime:=QL_ValeFecVence.AsDateTime;
          TT_AuxiConcepto.AsString:='Vale pendiente por facturar';
//          TT_AuxiIVA.AsFloat:=QL_ValeIva.AsFloat;
          TT_AuxiTotal.AsFloat:=QL_ValeTOTAL.AsFloat;
          TT_AuxiPagos.AsFloat:=0;
          TT_AuxiSaldo.AsFloat:=QL_ValeTOTAL.AsFloat;
          TT_AuxiMoneda.AsString:=MonedaNac;
          TT_AuxiParidad.AsFloat:=1;
          if (CheckBox3.Checked)and(TT_AuxiMoneda.AsString<>MonedaNac) then begin
            if not CheckBox7.Checked then
                Paridad:=DameParidadFecha(TT_AuxiMoneda.asstring,VgFechaFin)
              else
                Paridad := TT_AuxiParidad.AsFloat;
            TT_AuxiParidad.AsFloat:=Paridad;
{            TT_AuxiIva.AsFloat:=AjustaFloat(TT_AuxiIva.AsFloat*paridad,2);
            TT_AuxiTotal.AsFloat:=AjustaFloat(TT_AuxiTotal.AsFloat*paridad,2);
            TT_AuxiPagos.AsFloat:=AjustaFloat(TT_AuxiPagos.AsFloat*paridad,2);
            TT_AuxiSaldo.AsFloat:=AjustaFloat(TT_AuxiSaldo.AsFloat*paridad,2);}
            swmoneda:=false;
            if LMonedas.Count>0 then
              for i:=0 to LMonedas.Count-1 do begin
                if ExtraeElemStr(LMonedas[i],1)=TT_AuxiMoneda.AsString then begin
                  swmoneda:=true;
                  break;
                end;
              end;
            if not swmoneda then
              LMonedas.Add(TT_AuxiMoneda.AsString+'//'+FormatFloat('##0.0000',paridad));
          end;
          try
            TT_Auxi.Post;
          except
            MensajeErr('Clave ya existe');
            raise;
          end;
          inc(xreg);
          QL_Vale.Next;
        end;
        // Carga vales pendientes de facturar <<<FIN>>>

        QL_Abon.Close;
        QL_Abon.SQL.Clear;
        QL_Abon.SQL.Add('Select SuclCar,TipoCar,FolioCar,Paridad,IndiceCar,Importe,Moneda from DCXCABON');
        QL_Abon.SQL.Add('Where NoClie='+IntToStr(QL_ClieNoClie.AsInteger));
        QL_Abon.SQL.Add('  and Fecha>"'+FechaToStrSQL(VgFechaFin)+'" ');
        QL_Abon.SQL.Add('  and Aplicado="Si" ');
        if not CheckBox3.Checked then
          QL_Abon.SQL.Add('  and Moneda="'+DBLookUpComboBox1.KeyValue+'"');
        QL_Abon.SQL.Add('Order by Fecha');
        QL_Abon.Prepare;
        QL_Abon.Open;
        while not QL_Abon.Eof do begin
          if TT_Auxi.Locate('Grupo;NoClie;TipoMov;Folio;Indice',
                 VarArrayOf([QL_ClieClasifica.AsInteger,
                             QL_ClieNoClie.AsInteger,
                             QL_AbonTipoCar.AsString,
                             QL_AbonFolioCar.AsInteger,
                             QL_AbonIndiceCar.AsInteger
                             ]),[]) then begin
            TT_Auxi.Edit;
            TT_AuxiPagos.AsFloat:=TT_AuxiPagos.AsFloat-QL_AbonImporte.AsFloat;
            TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat+QL_AbonImporte.AsFloat;
            TT_Auxi.Post;
 {           if (CheckBox3.Checked)and(TT_AuxiMoneda.AsString<>MonedaNac) then begin
               Paridad:=QL_AbonParidad.AsFloat;
               TT_AuxiPagos.AsFloat:=TT_AuxiPagos.AsFloat-AjustaFloat(QL_AbonImporte.AsFloat*Paridad,2);
               TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat+AjustaFloat(QL_AbonImporte.AsFloat*Paridad,2);
            end
            else begin
              TT_AuxiPagos.AsFloat:=TT_AuxiPagos.AsFloat-QL_AbonImporte.AsFloat;
              TT_AuxiSaldo.AsFloat:=TT_AuxiSaldo.AsFloat+QL_AbonImporte.AsFloat;
            end;
            TT_Auxi.Post;}
          end
          else begin
            QL_Carg2.Close;
            QL_Carg2.SQL.Clear;
            QL_Carg2.SQL.Add('Select TipoMov,Folio,Indice,Fecha,FecVence,Importe,iva,Concepto,TotalPagos,Moneda,Paridad from DCXCCARG');
            QL_Carg2.SQL.Add('Where TipoMov="'+QL_AbonTipoCar.AsString+'"');
            QL_Carg2.SQL.Add('  and Folio='+IntToStr(QL_AbonFolioCar.AsInteger));
            QL_Carg2.SQL.Add('  and Indice='+IntToStr(QL_AbonIndiceCar.AsInteger));
            QL_Carg2.SQL.Add('  and Sucursal='+IntToStr(QL_AbonSuclCar.AsInteger));
            QL_Carg2.SQL.Add('  and Fecha<="'+FechaToStrSQL(VgFechaFin)+'"');
            if not CheckBox3.Checked then
              QL_Carg2.SQL.Add('  and Moneda="'+DBLookUpComboBox1.KeyValue+'"');

            if ComboBox3.ItemIndex=1 then
              QL_Carg2.SQL.Add('  and FecVence<"'+FechaToStrSQL(VgFechaFin)+'"');
            QL_Carg2.SQL.Add('  and Aplicado="Si" ');
            QL_Carg2.Prepare;
            QL_Carg2.Open;
            if not QL_Carg2.IsEmpty then begin
              if xRango then begin
                if (QL_Carg2Fecha.AsDateTime<xfechaini) or
                   (QL_Carg2Fecha.AsDateTime>xfechafin) then begin
                   QL_Abon.Next;
                   Continue;
                 end;
              end;
              TT_Auxi.Insert;
              TT_AuxiReg.AsInteger:=xreg;
              TT_AuxiGrupo.AsInteger:=QL_ClieClasifica.AsInteger;
              TT_AuxiNombreGrupo.AsString:=QL_ClieNombreClasif.AsString;
              TT_AuxiNoClie.AsInteger:=QL_ClieNoClie.AsInteger;
              TT_AuxiNombre.AsString:=QL_ClieNombre.AsString;
              TT_AuxiTipoMov.AsString:=QL_Carg2TipoMov.AsString;
              TT_AuxiFolio.AsInteger:=QL_Carg2Folio.AsInteger;
              TT_AuxiIndice.AsInteger:=QL_Carg2Indice.AsInteger;
              TT_AuxiConcepto.AsString:=QL_Carg2Concepto.AsString;
              TT_AuxiFecha.AsDateTime:=QL_Carg2Fecha.AsDateTime;
              TT_AuxiFecVence.AsDateTime:=QL_Carg2FecVence.AsDateTime;
              TT_AuxiIVA.AsFloat:=QL_Carg2Iva.AsFloat;
              TT_AuxiTotal.AsFloat:=QL_Carg2Importe.AsFloat;
              TT_AuxiPagos.AsFloat:=QL_Carg2TotalPagos.AsFloat-QL_AbonImporte.AsFloat;
              TT_AuxiSaldo.AsFloat:=QL_Carg2Importe.AsFloat-TT_AuxiPagos.AsFloat;
              TT_AuxiMoneda.AsString:=QL_Carg2Moneda.AsString;
              TT_AuxiParidad.AsFloat:=QL_Carg2Paridad.AsFloat;
              if (CheckBox3.Checked)and(TT_AuxiMoneda.AsString<>MonedaNac) then begin
                if not CheckBox7.Checked then
                  Paridad:=DameParidadFecha(TT_AuxiMoneda.asstring,VgFechaFin)
                else
                  Paridad := TT_AuxiParidad.AsFloat;
                TT_AuxiParidad.AsFloat:=Paridad;
{                TT_AuxiIva.AsFloat:=AjustaFloat(TT_AuxiIva.AsFloat*paridad,2);
                TT_AuxiTotal.AsFloat:=AjustaFloat(TT_AuxiTotal.AsFloat*paridad,2);
                TT_AuxiPagos.AsFloat:=AjustaFloat(TT_AuxiPagos.AsFloat*paridad,2);
                TT_AuxiSaldo.AsFloat:=AjustaFloat(TT_AuxiSaldo.AsFloat*paridad,2);}
                swmoneda:=false;
                if LMonedas.Count>0 then
                  for i:=0 to LMonedas.Count-1 do begin
                    if ExtraeElemStr(LMonedas[i],1)=TT_AuxiMoneda.AsString then begin
                      swmoneda:=true;
                      break;
                    end;
                  end;
                if not swmoneda then
                  LMonedas.Add(TT_AuxiMoneda.AsString+'//'+FormatFloat('##0.0000',paridad));
              end;
              TT_Auxi.Post;
            end;
          end;
          inc(xreg);
          QL_Abon.Next;
        end;
        FAvance.AvanzaPosicion;
        QL_Clie.Next;
      end;
    finally
      FAvance.Close;
    end;
  end;
  CargaBanda;
end;

procedure TFLIQREP41.CreaTablaTemp;
begin
  with DMGEN,FLIQREP41P do begin
    if TT_Auxi.Exists then
      EliminaTemp(TT_Auxi);
    TT_Auxi.Active:=false;
    with TT_Auxi.FieldDefs do begin
      Clear;
      Add('Reg', ftInteger, 0, true);
      Add('Grupo', ftInteger, 0, false);
      Add('NombreGrupo', ftString, 30, false);
      Add('NoClie', ftInteger,0, false);
      Add('Nombre', ftString, 50, false);
      Add('TipoMov', ftString, 2, false);
      Add('Folio', ftInteger, 0, false);
      Add('Indice', ftInteger, 0, false);
      Add('Fecha', ftDateTime,0,false);
      Add('FecVence', ftDateTime, 0,false);
      Add('Concepto', ftString, 50, false);
      Add('Total', ftFloat,0,false);
      Add('Pagos', ftFloat,0,false);
      Add('Saldo', ftFloat,0,false);
      Add('IVA', ftFloat,0,false);
      Add('Moneda', ftString, 2, false);
      Add('Telefono', ftString, 20, false);
      Add('Paridad',ftFloat,0,False);

    end;
    with TT_Auxi.IndexDefs do begin
      Clear;
      Add('', 'Reg', [ixPrimary, ixUnique]);
      Add('NoClie', 'Grupo;NoClie;Fecha;TipoMov;Folio;Indice', []);
      Add('Nombre','Grupo;Nombre;NoClie;TipoMov;Folio;Indice', [ixCaseInsensitive]);
    end;
    TT_Auxi.CreateTable;
    TT_auxi.IndexDefs.Update;
    Case ComboBox1.ItemIndex of
      0:TT_Auxi.IndexName:='NoClie';
      1:TT_Auxi.IndexName:='Nombre';
    end;
    TT_Auxi.Active:=true;
  end;
end;

procedure TFLIQREP41.CargaBanda;
var xtotclie,
    xtotalmes,xtottipo,xtotgen:array[1..4] of double;
    xgrupo,xNoClie,i:integer;
    xnocargos:word;
    xindlin1,xindlin2:integer;
    xdestipo,xind:string;
    sw:boolean;
    xmes1,xmes2:string;
    xfecha:TDateTime;

    procedure limpiaMes;
    var i:Byte;
    begin
      for i:= 1 to 4 do
        xtotalmes[i]:=0;
    end;

    procedure totalizames;
    var
      i:Byte;
    begin
      xlin:='M// // // //Total mes: '+MesPaq(FechaToMes(xfecha))+'//'+FormatoMoneda(xtotalmes[1])+'//'+FormatoMoneda(xtotalmes[2])+'//'+FormatoMoneda(xtotalmes[3])+'//'+
            FormatoMoneda(xtotalmes[4]);
      BndDt.Items.Add(xlin);
      xmes1:=FechaToMes(TT_AuxiFecha.AsDateTime);
      xfecha:=TT_AuxiFecha.AsDateTime;
      limpiaMes;
    end;
begin
  with DMGEN,FLIQREP41P do begin
    BndDt.Items.Clear;
    TT_Auxi.First;
    while not TT_Auxi.Eof do begin
      if ((TT_AuxiMoneda.AsString<>MonedaNac)and(CheckBox3.Checked)) then
        if TT_AuxiParidad.AsFloat>1.001 then begin
          TT_Auxi.Edit;
          TT_AuxiIva.AsFloat:=AjustaFloat(TT_AuxiIva.AsFloat*TT_AuxiParidad.AsFloat,2);
          TT_AuxiTotal.AsFloat:=AjustaFloat(TT_AuxiTotal.AsFloat*TT_AuxiParidad.AsFloat,2);
          TT_AuxiPagos.AsFloat:=AjustaFloat(TT_AuxiPagos.AsFloat*TT_AuxiParidad.AsFloat,2);
          TT_AuxiSaldo.AsFloat:=AjustaFloat(TT_AuxiSaldo.AsFloat*TT_AuxiParidad.AsFloat,2);
          TT_Auxi.Post;
        end;
      TT_Auxi.Next;
    end;
    TT_Auxi.First;
    xindlin1:=0; xindlin2:=0;
    limpiaMes;
    xmes1:='';
    xmes2:='';
    while not TT_Auxi.Eof do begin
      if FLIQREP41P.CBTotalMes.Checked then begin
        xmes2:=FechaToMes(TT_AuxiFecha.AsDateTime);
        if xmes1<>xmes2 then begin
          if xmes1<>'' then
            totalizames;
          xmes1:=FechaToMes(TT_AuxiFecha.AsDateTime);
          xfecha:=TT_AuxiFecha.AsDateTime;
        end;
      end;
      if TT_AuxiGrupo.AsInteger>0 then begin
        xlin:='E//'+IntToClaveNum(TT_AuxiGrupo.AsInteger,3)+'  '+TT_AuxiNombreGrupo.AsString;
        BndDt.Items.Add(xlin);
        xIndLin2:=BndDt.Items.IndexOf(xlin);
        BndDt.Items.Add('B//');
      end;
      xgrupo:=TT_AuxiGrupo.AsInteger;
      xdestipo:=TT_AuxiNombreGrupo.AsString;
      for i:=1 to 4 do
        xtottipo[i]:=0;
      while (xgrupo=TT_AuxiGrupo.AsInteger)and(not TT_Auxi.Eof) do begin
        if FLIQREP41P.CBTotalMes.Checked then begin
          xmes2:=FechaToMes(TT_AuxiFecha.AsDateTime);
          if xmes1<>xmes2 then begin
            if xmes1<>'' then
              totalizames;
            xmes1:=FechaToMes(TT_AuxiFecha.AsDateTime);
            xfecha:=TT_AuxiFecha.AsDateTime;
          end;
        end;
        xlin:='S//'+InttoClaveCata(TT_AuxiNoClie.AsInteger,idClie)+'  '+LimpiaStr(TT_AuxiNombre.AsString)+'// //  //';
        if pSwTelefono then xlin:=xlin+' Tel. '+TT_AuxiTelefono.AsString;
        BndDt.Items.Add(xlin);
        xIndLin1:=BndDt.Items.IndexOf(xlin);
        xNoClie:=TT_AuxiNoClie.AsInteger;
        for i:=1 to 4 do
          xtotclie[i]:=0;
        xnocargos:=0;
        while (xNoClie=TT_AuxiNoClie.AsInteger)and(not TT_Auxi.Eof) do begin
          if FLIQREP41P.CBTotalMes.Checked then begin
            xmes2:=FechaToMes(TT_AuxiFecha.AsDateTime);
            if xmes1<>xmes2 then begin
              if xmes1<>'' then
                totalizames;
              xmes1:=FechaToMes(TT_AuxiFecha.AsDateTime);
              xfecha:=TT_AuxiFecha.AsDateTime;
            end;
          end;
          if (pImporteMinimo>0)and(TT_AuxiSaldo.AsFloat<pImporteMinimo) then begin
            TT_Auxi.Next;
            Continue;
          end;
          if (pImporteMaximo>0)and(TT_AuxiSaldo.AsFloat>pImporteMaximo) then begin
            TT_Auxi.Next;
            Continue;
          end;
          xind:='';
          if TT_AuxiIndice.AsInteger>1 then xind:='-'+IntToClaveNum(TT_AuxiIndice.AsInteger,3);
          xlin:='D//'+TT_AuxiTipoMov.AsString+'-'+IntToClaveNum(TT_AuxiFolio.AsInteger,8)+xind+'//'+
                      FechaPaq(TT_AuxiFecha.AsDateTime)+'//'+FechaPaq(TT_AuxiFecVence.AsDateTime)+'//'+
                      Copy(TT_AuxiConcepto.AsString,1,{16}40);

          if CheckBox7.Checked then begin
            if (TT_AuxiMoneda.AsString<>MonedaNac) then
              xlin:=xlin+'     Paridad: '+ TT_AuxiParidad.AsString +'//'
            else
              xlin:=xlin+'//';
          end
          else
            xlin:=xlin+'//';

          xlin:=xlin+FormatoMoneda(TT_AuxiTotal.AsFloat)+'//'+
                      FormatoMoneda(TT_AuxiPagos.AsFloat)+'//'+FormatoMoneda(TT_AuxiSaldo.AsFloat)+'//';

//          if (CheckBox2.Checked) then
//            xlin:=xlin+FormatoMoneda(TT_AuxiIvaPendiente.AsFloat)+'//'
//          else
            if ((TT_AuxiMoneda.AsString<>MonedaNac)and(not CheckBox3.Checked)) then
              xlin:=xlin+FormatoMoneda(TT_AuxiParidad.AsFloat*TT_auxiSaldo.AsFloat)
            else
              xlin:=xlin+'//';
          if (CheckBox3.Checked)and(TT_AuxiMoneda.AsString<>MonedaNac) then
            xlin:=xlin+TT_AuxiMoneda.AsString;
          BndDt.Items.Add(xlin);
          inc(xnocargos);
          xtotclie[1]:=xtotclie[1]+TT_AuxiTotal.AsFloat;
          xtotclie[2]:=xtotclie[2]+TT_AuxiPagos.AsFloat;
          xtotclie[3]:=xtotclie[3]+TT_AuxiSaldo.AsFloat;
//          if CheckBox2.Checked then
//            xtotclie[4]:=xtotclie[4]+TT_AuxiIvaPendiente.AsFloat
//          else
          xtotclie[4]:=xtotclie[4]+TT_AuxiParidad.AsFloat*TT_auxiSaldo.AsFloat;

          xtotalmes[1]:=xtotalmes[1]+TT_AuxiTotal.AsFloat;
          xtotalmes[2]:=xtotalmes[2]+TT_AuxiPagos.AsFloat;
          xtotalmes[3]:=xtotalmes[3]+TT_AuxiSaldo.AsFloat;
//          if CheckBox2.Checked then
//            xtotalmes[4]:=xtotalmes[4]+TT_AuxiIvaPendiente.AsFloat
//          else
            xtotalmes[4]:=xtotalmes[4]+TT_AuxiParidad.AsFloat*TT_auxiSaldo.AsFloat;
          xnoclie:=TT_AuxiNoClie.AsInteger;
          TT_Auxi.Next;
        end;
        if xmes1<>'' then begin
          totalizames;
          limpiaMes;
        end;
        xlin:='T// // // // //';
        for i:=1 to 4 do begin
          xlin:=xlin+FormatoMoneda(xtotclie[i])+'//';
          xtottipo[i]:=xtottipo[i]+xtotclie[i];
        end;
        if abs(xtotclie[3])>0.0001 then begin
          if (xnocargos>1) then BndDt.Items.Add(xlin)
          else BndDt.Items.Add('B//')
        end
        else
          BndDt.Items.Delete(xindlin1);
      end;
      BndDt.Items.Add('B//');
      xlin:='C// //Total '+xdestipo+'// // //';
      sw:=false;
      for i:=1 to 4 do begin
        xlin:=xlin+FormatoMoneda(xtottipo[i])+'//';
        xtotgen[i]:=xtotgen[i]+xtottipo[i];
//        if i=3 then sw:=xtottipo[i]=xtotgen[i];
      end;
      if not sw then begin
        if abs(xtottipo[3])>0.0001 then begin
          BndDt.Items.Add(xlin);
          BndDt.Items.Add('B//');
        end
        else
          BndDt.Items.Delete(xindlin2);
      end;
    end;
    xlin:='T// //Total General // // //';
    for i:=1 to 4 do begin
      xlin:=xlin+FormatoMoneda(xtotgen[i])+'//';
    end;
    BndDt.Items.Add(xlin);
    if (CheckBox3.Checked)and(LMonedas.Count>0) then begin
      BndDt.Items.Add('B//');
      BndDt.Items.Add('B//');
      if not CheckBox7.Checked then begin
        xlin:='S//Paridades al '+FechaAlf(VgFechaFin);
        BndDt.Items.Add(xlin);
      end;
      if not CheckBox7.Checked then begin
        for i:=0 to LMonedas.Count-1 do begin
          if LocalizaQuery(QT_Mone,'Clave',ExtraeElemStr(LMonedas[i],1)) then begin
            xlin:='D//   '+QT_MoneNombre.AsString+'//'+ExtraeElemStr(LMonedas[i],2);
            BndDt.Items.Add(xlin);
          end;
        end;
      end;
    end;
  end;
end;

procedure TFLIQREP41.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Font.Size:=8;
        if K=21 then Left:=8;
        if k=21 then Font.Color:=clWindowText;
        if k=22 then Left:=90;
        if k=23 then Left:=158;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k-19);
      if k=23 then begin
        if ExtraeElemStr(xlin,k-19)='30/Dic/1899' then
          TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:='';
      end;
    end
  end;

  procedure HabilitaShapes(ri,rf:integer;swenabled:boolean);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Frame.DrawTop:=swenabled;
      end;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(21,29);
  if ({(FLIQREP41P.CheckBox2.Checked)or}((DMGEN.QT_MoneClave.AsString<>MonedaNac)and(FLIQREP41P.CheckBox7.Checked))) then
    ExtraeEtiquetas(21,29)
  else begin
    ExtraeEtiquetas(21,27);
    ExtraeEtiquetas(29,29);
  end;
  HabilitaShapes(25,28,false);
  Case xtp of
    'E':begin
          QRLabel21.Font.Style:=[fsbold,fsUnderline];
          QRLabel21.Font.Color:=StringtoColor(DMGEN.QT_EmprColor.Asstring);
          QRLabel21.Font.Size:=9;
          QRLabel22.Left:=500;
          QRLabel23.Left:=500;
        end;
    'S':begin
          QRLabel21.Font.Style:=[fsBold];
          QRLabel24.Font.Style:=[fsBold];
          QRLabel22.Left:=300;
          QRLabel22.Left:=500;
          QRLabel23.Left:=500;
        end;
    'P',
    'C',
    'T':if {(FLIQREP41P.CheckBox2.Checked )or}((DMGEN.QT_MoneClave.AsString<>MonedaNac)and(FLIQREP41P.CheckBox7.Checked))then
          HabilitaShapes(25,28,true)
        else
          HabilitaShapes(25,27,true);
    'M':begin
          QRLabel24.Font.Style:=[fsBold];
          QRLabel25.Font.Style:=[fsBold];
          QRLabel26.Font.Style:=[fsBold];
          QRLabel27.Font.Style:=[fsBold];
          QRLabel28.Font.Style:=[fsBold];
          if {(FLIQREP41P.CheckBox2.Checked )or}((DMGEN.QT_MoneClave.AsString<>MonedaNac)and(FLIQREP41P.CheckBox7.Checked))then
            HabilitaShapes(25,28,true)
          else
            HabilitaShapes(25,27,true);
        end;
  end;
  PrintBand:=xtp<>'B';
end;

procedure TFLIQREP41.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
  with DMGEN,FLIQREP41P do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLRango.Caption:='Al '+FechaAlf(VgFechaFin);
    if xRango then
      QRLRango.Caption:=QRLRango.Caption+'    [Movimientos del '+Rangofecha(xFechaini,xfechafin)+']';
    if CheckBox3.Checked then
      QRLMoneda.Caption:='Moneda: Todas'
    else
      QRLMoneda.Caption:='Moneda: '+DBLookupComboBox1.Text;
    QRLSistema.Caption:=IdSistNombre;
//    if VarGenPosImprimeFechaHora='Encabezado' then begin
//      QRLFechaHora.Caption:='';
//      QRLFechaHoraEnc.Caption:=SetFechaHora(VarGenFechaHoraRepos);
//    end
//    else begin
      QRLFechaHora.Caption:=SetFechaHora(VarGenFechaHoraRepos);
      QRLFechaHoraEnc.Caption:='';
//    end;
  end;
end;

procedure TFLIQREP41.ChildBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp in ['B','P'];
end;

procedure TFLIQREP41.TT_AuxiCalcFields(DataSet: TDataSet);
begin
  if abs(TT_AuxiTotal.AsFloat)>0.001 then begin
    if TT_AuxiFecha.AsDateTime>=pFechaInicioIva then
      TT_AuxiIvaPendiente.AsFloat:=AjustaFloat(TT_AuxiIva.AsFloat*TT_AuxiSaldo.AsFloat/TT_AuxiTotal.AsFloat,2)
    else
      TT_AuxiIVAPendiente.AsFloat:=0;
  end;
end;

procedure TFLIQREP41.QRLabel4Print(sender: TObject; var Value: String);
begin
  if ({(not FLIQREP41P.CheckBox2.Checked)and}( not FLIQREP41P.CheckBox3.Checked) and (DMGEN.QT_MoneCLAVE.AsString<>MonedaNac)) then
    Value:='Saldo M.N.'
  else //if not FLIQREP41P.CheckBox2.Checked then
    Value:=''
end;

procedure TFLIQREP41.FormDestroy(Sender: TObject);
begin
  try
    QL_Carg.Close;
    QL_Abon.Close;
    QL_Clie.Close;
    QL_Carg2.Close;
    QL_Mone.Close;
    LMonedas.Free;
    with DMGEN do
      if TT_Auxi.Exists then
        EliminaTemp(TT_Auxi);
  except
  end;
end;

end.
