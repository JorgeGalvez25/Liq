unit ULIQPVALVER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, ExtCtrls;

type
  TFLIQPVALVER = class(TForm)
    Panel1: TPanel;
    BbEjecutar: TBitBtn;
    BbSalir: TBitBtn;
    Panel2: TPanel;
    QL_Pval: TQuery;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalSERIEFAC: TStringField;
    QL_PvalFOLIOFAC: TIntegerField;
    QL_PvalFECHAFACTURA: TDateTimeField;
    QL_PvalTOTAL: TFloatField;
    Memo1: TMemo;
    bntRecalcular: TBitBtn;
    QL_Carg: TQuery;
    QL_CargSUCURSAL: TIntegerField;
    QL_CargTIPOMOV: TStringField;
    QL_CargFOLIO: TIntegerField;
    QL_CargINDICE: TIntegerField;
    QL_CargNOCLIE: TIntegerField;
    QL_CargFECHA: TDateTimeField;
    QL_CargPLAZO: TIntegerField;
    QL_CargFECVENCE: TDateTimeField;
    QL_CargMES: TStringField;
    QL_CargCARABO: TStringField;
    QL_CargCONCEPTO: TStringField;
    QL_CargIMPORTE: TFloatField;
    QL_CargMONEDA: TStringField;
    QL_CargPARIDAD: TFloatField;
    QL_CargIMPORTEMN: TFloatField;
    QL_CargTOTALPAGOS: TFloatField;
    QL_CargSALDADO: TStringField;
    QL_CargAPLICADO: TStringField;
    QL_CargDOCUMORIGEN: TStringField;
    QL_CargSUBTOTAL: TFloatField;
    QL_CargIVA: TFloatField;
    QL_CargISH: TFloatField;
    QL_CargOTROS: TFloatField;
    QL_CargRETENIVA: TFloatField;
    QL_CargRETENISR: TFloatField;
    QL_CargCLAVEIVA: TIntegerField;
    QL_CargCLAVERIVA: TIntegerField;
    QL_CargCLAVERISR: TIntegerField;
    QL_CargREFERENCIA: TIntegerField;
    QL_CargTASAINTERES: TFloatField;
    QL_CargTIPO_INTERESES: TStringField;
    QL_CargCLAVEDEDU: TIntegerField;
    QL_CargIMPORTEDEDU: TFloatField;
    QL_Pval2: TQuery;
    QL_Pval2ESTACION: TIntegerField;
    QL_Pval2CAJA: TIntegerField;
    QL_Pval2FECHA: TDateTimeField;
    QL_Pval2TURNO: TIntegerField;
    QL_Pval2INDICE: TIntegerField;
    QL_Pval2CLIENTE: TIntegerField;
    QL_Pval2SUBCODIGO: TIntegerField;
    QL_Pval2CANTIDAD: TIntegerField;
    QL_Pval2TOTAL: TFloatField;
    QL_Pval2FACTURADO: TStringField;
    QL_Pval2ESTACIONFAC: TIntegerField;
    QL_Pval2SERIEFAC: TStringField;
    QL_Pval2FOLIOFAC: TIntegerField;
    QL_Pval2INDICEVALE: TIntegerField;
    QL_Pval2FECHAFACTURA: TDateTimeField;
    procedure BbEjecutarClick(Sender: TObject);
    procedure BbSalirClick(Sender: TObject);
    procedure bntRecalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQPVALVER: TFLIQPVALVER;

implementation

uses ULIBDATABASE, ULIBGRAL, ULIBLICENCIAS, ULIBPRINT, DDMCUP, DDMCXC,
  DDMGAS, DDMGASP, DDMGASQ, DDMGEN, DDMGEN_VTAS, UAVANCE;

{$R *.dfm}

procedure TFLIQPVALVER.BbEjecutarClick(Sender: TObject);
var xsuc:integer;
begin
  with DMGEN,DMGAS,DMCXC,DMGEN_VTAS do begin
    QL_Pval.Close;
    QL_Pval.ParamByName('pseriefac').AsString:=VarGasTipoMovCargoVales;
    QL_Pval.Prepare;
    QL_Pval.Open;
    try
      FAvance.PreparaAvance('Verificando Cargos...',true,QL_Pval.RecordCount);
      while not QL_Pval.eof do begin
        xsuc:=T_EstsSucursal.AsInteger;
        if xsuc<1 then xsuc:=1;
        if LocalizaTabla(T_Carg,'Sucursal;TipoMov;Folio;Indice',
                         VarArrayOf([xSuc,
                                     QL_PvalSerieFac.AsString,
                                     QL_PvalFolioFac.AsInteger,
                                     1])) then
        begin
          if T_CargNoClie.AsInteger<>QL_PvalCliente.AsInteger then begin
            if not LocalizaTabla(T_Carg,'Sucursal;TipoMov;Folio;Indice',
                             VarArrayOf([xSuc,
                                         QL_PvalSerieFac.AsString,
                                         QL_PvalFolioFac.AsInteger,
                                         2])) then begin

              try
                Memo1.Lines.Add('Error: '+QL_PvalSerieFac.AsString+'-'+IntToClaveNum(QL_PvalFolioFac.AsInteger,6)+' Cliente: '+IntToStr(QL_PvalCliente.AsInteger));
                DBVentas1.StartTransaction;
                T_Carg.Insert;
                T_CargSucursal.AsInteger:=xsuc;
                T_CargTipoMov.AsString:=QL_PvalSerieFac.AsString;
                T_CargFolio.AsInteger:=QL_PvalFolioFac.AsInteger;
                T_CargIndice.AsInteger:=2;
                T_CargNoClie.AsInteger:=QL_PvalCliente.AsInteger;
                T_CargMes.AsString:=FechaToMes(QL_PvalFechaFactura.AsDateTime);
                T_CargFecha.AsDateTime:=QL_PvalFechaFactura.AsDateTime;
                T_CargPlazo.AsInteger:=30;
                T_CargFecVence.AsDateTime:=IncFecha(T_CargFecha.asdatetime,T_CargPlazo.asinteger);
                T_CargConcepto.Asstring:='Vale de Combustible ';
                T_CargImporte.AsFloat:=QL_PvalTotal.AsFloat;
                T_CargMoneda.AsString:=MonedaNac;
                T_CargParidad.AsFloat:=1;
                T_CargImporteMN.AsFloat:=QL_PvalTotal.AsFloat;
                T_CargDocumOrigen.Asstring:='VALE';
                T_CargSaldado.AsString:='No';
                T_CargSubtotal.AsFloat:=AjustaFloat(DivideFloat(QL_PvalTotal.AsFloat,(1+T_EstsTasaIva.AsFloat/100)),2);
                T_CargIva.AsFloat:=QL_PvalTotal.AsFloat-T_CargSubTotal.AsFloat;
                T_CargImporte.AsFloat:=QL_PValTotal.AsFloat;
                T_CargImporteMN.AsFloat:=QL_PvalTotal.AsFloat;
                if LocalizaQuery(DMGEN.QT_Civa,'Porciento',T_EstsTasaIva.AsFloat) then
                  T_CargClaveIva.AsInteger:=DMGEN.QT_CivaClave.AsInteger;
                T_Carg.Post;
                T_Carg.Refresh;
                AplicaCargo(T_CargSucursal.AsInteger,T_CargTipoMov.asstring,T_CargFolio.asinteger,T_CargIndice.AsInteger,true);
                T_Carg.Refresh;
                DBVentas1.Commit;
              except
                DBVentas1.Rollback;
                raise;
              end;
            end;
          end;
        end;
        FAvance.AvanzaPosicion;
        QL_Pval.Next;
      end;
    finally
      FAvance.Close;
      MensajeInfo('Proceso terminado');
    end;
  end;
end;

procedure TFLIQPVALVER.BbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQPVALVER.bntRecalcularClick(Sender: TObject);
var
  lista:TStringList;
  var xsuc:integer;
begin
  with DMGEN_VTAS,DMGAS,DMCXC,DMCUP do begin
    lista:=TStringList.Create;
    QL_Carg.Close;
    QL_Carg.Prepare;
    QL_Carg.Open;
    QL_Carg.First;
    try
      FAvance.PreparaAvance('Verificando Cargos...',true,QL_Carg.RecordCount);
      while not QL_Carg.Eof do begin
        lista.Clear;
        QL_Pval2.Close;
        QL_Pval2.ParamByName('pEstacionFac').AsInteger:=QL_CargSUCURSAL.AsInteger;
        QL_Pval2.ParamByName('pSeriefac').AsString:=QL_CargTIPOMOV.AsString;
        QL_Pval2.ParamByName('pFoliofac').AsInteger:=QL_CargFOLIO.AsInteger;
        QL_Pval2.ParamByName('pfechafactura').AsDateTime:=QL_CargFECHA.AsDateTime;
        QL_Pval2.Prepare;
        QL_Pval2.Open;
        QL_Pval2.First;
        while not QL_Pval2.Eof do begin
          lista.Add(QL_Pval2ESTACION.AsString+'//'+QL_Pval2CAJA.AsString+'//'+QL_Pval2FECHA.AsString+'//'+QL_Pval2TURNO.AsString+'//'+QL_Pval2INDICE.AsString);
          QL_Pval2.Next;
        end;
        xsuc:=T_EstsSucursal.AsInteger;
        if xsuc<1 then xsuc:=1;
        if LocalizaTabla(T_Carg,'Sucursal;TipoMov;Folio;Indice',
                         VarArrayOf([QL_CargSUCURSAL.AsInteger,
                                     QL_CargTIPOMOV.AsString,
                                     QL_CargFOLIO.AsInteger,
                                     1])) then
        begin
          try
            DBVentas1.StartTransaction;
            AplicaCargo(T_CargSucursal.AsInteger,T_CargTipoMov.asstring,T_CargFolio.asinteger,T_CargIndice.AsInteger,false);
            T_Carg.Refresh;
            T_Carg.Edit;

            T_CargSUBTOTAL.AsFloat:=dameSubtotalDePVAL(lista);
            T_CargIVA.AsFloat:=dameIVADePVAL(lista);
            T_CargISH.AsFloat:=dameIEPSDePVAL(lista);
            T_CargImporte.AsFloat:=T_CargSUBTOTAL.AsFloat+T_CargIVA.AsFloat;
            T_CargImporteMN.AsFloat:=T_CargImporte.AsFloat;
            if LocalizaQuery(DMGEN.QT_Civa,'Porciento',T_EstsTasaIva.AsFloat) then
              T_CargClaveIva.AsInteger:=DMGEN.QT_CivaClave.AsInteger;
            T_Carg.Post;
            T_Carg.Refresh;
            AplicaCargo(T_CargSucursal.AsInteger,T_CargTipoMov.asstring,T_CargFolio.asinteger,T_CargIndice.AsInteger,true);
            T_Carg.Refresh;
            DBVentas1.Commit;
          except
            DBVentas1.Rollback;
            raise;
          end;
        end;
        FAVANCE.AvanzaPosicion;
        QL_Carg.Next;
      end;
    finally
      FAvance.Close;
      MensajeInfo('Proceso terminado');
    end;
  end;
end;

end.
