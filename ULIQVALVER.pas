unit ULIQVALVER;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, ExtCtrls;

type
  TFLIQVALVER = class(TForm)
    Panel1: TPanel;
    BbEjecutar: TBitBtn;
    BbSalir: TBitBtn;
    Panel2: TPanel;
    Memo1: TMemo;
    TL_Dval: TTable;
    QL_Movi: TQuery;
    QL_MoviFOLIO: TIntegerField;
    QL_MoviFECHA: TDateTimeField;
    QL_MoviHORA: TDateTimeField;
    QL_MoviPOSCARGA: TIntegerField;
    QL_MoviCOMBUSTIBLE: TIntegerField;
    QL_MoviVOLUMEN: TFloatField;
    QL_MoviIMPORTE: TFloatField;
    QL_MoviIMPRESO: TStringField;
    QL_MoviTRANSACCION: TIntegerField;
    QL_MoviTARJETA: TStringField;
    QL_MoviKILOMETRAJE: TIntegerField;
    QL_MoviAPLICAR: TStringField;
    QL_MoviHORASTR: TStringField;
    QL_MoviFECHAGASBOY: TStringField;
    QL_MoviHORAGASBOY: TStringField;
    QL_MoviFECHACORTE: TDateTimeField;
    QL_MoviCORTE: TIntegerField;
    QL_MoviPRECIO: TFloatField;
    QL_MoviTOTAL01: TFloatField;
    QL_MoviTOTAL02: TFloatField;
    QL_MoviFACTURADO: TStringField;
    QL_MoviTAG: TIntegerField;
    QL_MoviFECHATURNO: TDateTimeField;
    QL_MoviTURNO: TIntegerField;
    QL_MoviJARREO: TStringField;
    QL_MoviMANGUERA: TIntegerField;
    QL_MoviTOTAL03: TFloatField;
    QL_MoviTOTAL04: TFloatField;
    TL_DvalESTACION: TIntegerField;
    TL_DvalCAJA: TIntegerField;
    TL_DvalFECHA: TDateTimeField;
    TL_DvalTURNO: TIntegerField;
    TL_DvalINDICE: TIntegerField;
    TL_DvalINDICEVALE: TIntegerField;
    TL_DvalPRODUCTO: TIntegerField;
    TL_DvalSUBCLAVE: TIntegerField;
    TL_DvalIMPORTE: TFloatField;
    TL_DvalCANTIDAD: TFloatField;
    TL_DvalFACTURADO: TStringField;
    TL_DvalESTACIONFAC: TIntegerField;
    TL_DvalSERIEFAC: TStringField;
    TL_DvalFOLIOFAC: TIntegerField;
    TL_DvalCLIENTE: TIntegerField;
    TL_DvalSUBCODIGO: TIntegerField;
    procedure BbEjecutarClick(Sender: TObject);
    procedure BbSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetActualizaClienteVale(const AEstacion, ACaja:Integer;Const AFecha:TDateTime;Const ATurno, AIndice, AIndiceVale, AClienteNuevo:Integer);
    procedure SetActualizaClienteDVal(const AEstacion, ACaja:Integer;Const AFecha:TDateTime;Const ATurno, AIndice, AIndiceVale, AClienteNuevo:Integer);
  end;

var
  FLIQVALVER: TFLIQVALVER;

implementation

uses ULIBDATABASE, ULIBGRAL, ULIBLICENCIAS, ULIBPRINT, DDMCUP, DDMCXC,
  DDMGAS, DDMGASP, DDMGASQ, DDMGEN, DDMGEN_VTAS, UAVANCE,ULIQCONS01,
  UGEN_NET;

{$R *.dfm}

procedure TFLIQVALVER.BbEjecutarClick(Sender: TObject);
var
  TotVAl:Double;
begin
  with DMGEN,FLIQCONS01 do begin
    QL_Pval.DisableControls;
    QL_Vale.DisableControls;
    QL_Dval.DisableControls;
    QL_Pval.First;
    TL_Dval.Active:=True;
    Memo1.Lines.Clear;
    try
      FAvance.PreparaAvance('Verificando Vales...',true,QL_Pval.RecordCount);
      while not QL_Pval.Eof do begin
        QL_Vale.Close;
        QL_Vale.Open;
        QL_Vale.First;
        TotVAl:=0;
        while not QL_vale.Eof do begin
          if QL_PvalCLIENTE.AsInteger<>QL_ValeCLIENTE.AsInteger then begin
            Memo1.Lines.Add('Inconsistencia en Clave de Cliente: Maestro: '+IntToClaveCata(QL_PvalCLIENTE.AsInteger,idClie)+' Detalle: '+IntToClaveCata(QL_ValeCLIENTE.AsInteger,idClie)+#13#10+
                              'No.Vale: '+QL_ValeINDICEVALE.AsString);
            SetActualizaClienteVale(QL_ValeESTACION.AsInteger,QL_ValeCAJA.AsInteger,QL_ValeFECHA.AsDateTime,
                                    QL_ValeTURNO.AsInteger,QL_ValeINDICE.AsInteger,QL_ValeINDICEVALE.AsInteger,
                                    QL_PvalCLIENTE.AsInteger);
          end;
          QL_Dval.Close;
          QL_Dval.Open;
          if QL_Dval.RecordCount>0 then begin
            if QL_PvalCLIENTE.AsInteger<>QL_DvalCLIENTE.AsInteger then begin
              Memo1.Lines.Add('Inconsistencia en Clave de Cliente: Maestro: '+IntToClaveCata(QL_PvalCLIENTE.AsInteger,idClie)+' Detalle: '+IntToClaveCata(QL_DvalCLIENTE.AsInteger,idClie)+#13#10+
                                'No.Detalle de Vale: '+QL_DvalINDICEVALE.AsString);
              SetActualizaClienteDVal(QL_ValeESTACION.AsInteger,QL_ValeCAJA.AsInteger,QL_ValeFECHA.AsDateTime,
                                      QL_ValeTURNO.AsInteger,QL_ValeINDICE.AsInteger,QL_ValeINDICEVALE.AsInteger,
                                      QL_PvalCLIENTE.AsInteger);
            end;
            if (QL_ValeIMPORTE.AsFloat<>QL_DvalIMPORTE.AsFloat) then  begin
              if LocalizaTabla(TL_DVAL,'Estacion;Caja;Fecha;Turno;Indice;IndiceVale',VarArrayOf([
                                        QL_ValeESTACION.AsInteger,
                                        QL_ValeCaja.AsInteger,QL_ValeFECHA.AsDateTime,QL_ValeTurno.AsInteger,
                                        QL_ValeINDICE.AsInteger,QL_ValeINDICEVALE.AsInteger])) then begin
                TL_DVAl.Edit;
                TL_DvalIMPORTE.AsFloat:=QL_ValeIMPORTE.AsFloat;
                TL_DVal.Post;
              end;
              Memo1.Lines.Add('Inconsistencia en Importe: Maestro: '+FormatoMoneda(QL_ValeIMPORTE.AsFloat)+' Detalle: '+FormatoMoneda(QL_DvalIMPORTE.AsFloat)+#13#10+
                              'Cliente: '+QL_ValeCLIENTE.AsString+' No.Vale: '+QL_ValeINDICEVALE.AsString);
            end;
          end
          else begin
            Memo1.Lines.Add('Falta Detalle de Vale en: Cliente: '+QL_PvalCLIENTE.AsString+' '+QL_PvalNombreCliente.AsString+#13#10+
                            'No.Vale: '+QL_ValeINDICEVALE.AsString+' con Fecha de '+QL_PvalFECHA.AsString);
            if Not QL_ValeFOLIOVOLUMETRICO.IsNull then begin
              QL_Movi.Close;
              QL_Movi.ParamByName('PFolio').AsInteger:=QL_ValeFOLIOVOLUMETRICO.AsInteger;
              QL_Movi.Prepare;
              QL_Movi.Open;
              TL_DVAl.Insert;
              TL_DVAlESTACION.AsInteger:=QL_Valeestacion.AsInteger;
              TL_DVAlCAJA.AsInteger:=QL_Valecaja.AsInteger;
              TL_DVAlFECHA.AsDateTime:=QL_VAlefecha.AsDateTime;
              TL_DVAlTURNO.AsInteger:=QL_ValeTURNO.AsInteger;
              TL_DVAlINDICE.AsInteger:=QL_ValeINDICE.AsInteger;
              TL_DVAlINDICEVALE.AsInteger:=QL_ValeINDICEVALE.AsInteger;
              TL_DVAlPRODUCTO.AsInteger:=QL_MoviCOMBUSTIBLE.AsInteger;
              TL_DVAlIMPORTE.AsFloat:=QL_MoviIMPORTE.AsFloat;
              TL_DVAlFACTURADO.AsString:=QL_ValeFACTURADO.AsString;
              TL_DVAlESTACIONFAC.AsInteger:=QL_ValeESTACIONFAC.AsInteger;
              TL_DVAlFOLIOFAC.AsInteger:=QL_ValeFOLIOFAC.AsInteger;
              TL_DVAlSERIEFAC.AsString:=QL_ValeSERIEFAC.AsString;
              TL_DVAlSUBCODIGO.AsInteger:=QL_ValeSUBCODIGO.AsInteger;
              TL_DVAlCLIENTE.AsInteger:=QL_ValeCLIENTE.AsInteger;
              TL_DVAlSUBCODIGO.AsInteger:=QL_ValeSUBCODIGO.AsInteger;
              TL_DVAl.Post;
            end;
          end;
          TotVAl:=Totval+QL_ValeIMPORTE.AsFloat;
          QL_vale.Next;
        end;
        if TotVAl<> QL_PvalTOTAL.AsFloat then begin
           Memo1.Lines.Add('Inconsistencia en Importes: Maestro: '+FormatoMoneda(QL_PvalTOTAL.AsFloat)+' Detalle: '+FormatoMoneda(TotVAl)+#13#10+
                           'Cliente: '+QL_ValeCLIENTE.AsString+' No.Vale:'+QL_ValeINDICEVALE.AsString+' Fecha de vale: '+QL_ValeFECHA.AsString);
        end;
        FAvance.AvanzaPosicion;
        QL_Pval.Next;
      end;
    finally
      FAvance.Close;
      QL_Pval.EnableControls;
      QL_Vale.EnableControls;
      QL_Dval.EnableControls;
      MensajeInfo('Proceso Terminado');
    end;
  end;
end;

procedure TFLIQVALVER.BbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQVALVER.SetActualizaClienteDVal(const AEstacion,
  ACaja: Integer; const AFecha: TDateTime; const ATurno, AIndice,
  AIndiceVale, AClienteNuevo: Integer);
begin
  with DMGAS do begin
    try
      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DGASDVAL SET CLIENTE='+IntToStr(AClienteNuevo));
        Q_Auxi.SQL.Add('WHERE ESTACION=:ESTACION');
        Q_Auxi.SQL.Add('  AND CAJA=:CAJA');
        Q_Auxi.SQL.Add('  AND FECHA=:FECHA');
        Q_Auxi.SQL.Add('  AND TURNO=:TURNO');
        Q_Auxi.SQL.Add('  AND INDICE=:INDICE');
        Q_Auxi.SQL.Add('  AND INDICEVALE=:INDICEVALE');
        Q_Auxi.ParamByName('ESTACION').AsInteger   := AEstacion;
        Q_Auxi.ParamByName('CAJA').AsInteger       := ACaja;
        Q_Auxi.ParamByName('FECHA').AsDateTime     := AFecha;
        Q_Auxi.ParamByName('TURNO').AsInteger      := ATurno;
        Q_Auxi.ParamByName('INDICE').AsInteger     := AIndice;
        Q_Auxi.ParamByName('INDICEVALE').AsInteger := AIndiceVale;
        Q_Auxi.ExecSQL;
      except
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQVALVER.SetActualizaClienteVale(const AEstacion,
  ACaja: Integer; const AFecha: TDateTime; const ATurno, AIndice,
  AIndiceVale, AClienteNuevo: Integer);
begin
  with DMGAS do begin
    try
      try
        Q_Auxi.Close;
        Q_Auxi.SQL.Clear;
        Q_Auxi.SQL.Add('UPDATE DGASVALE SET CLIENTE='+IntToStr(AClienteNuevo));
        Q_Auxi.SQL.Add('WHERE ESTACION=:ESTACION');
        Q_Auxi.SQL.Add('  AND CAJA=:CAJA');
        Q_Auxi.SQL.Add('  AND FECHA=:FECHA');
        Q_Auxi.SQL.Add('  AND TURNO=:TURNO');
        Q_Auxi.SQL.Add('  AND INDICE=:INDICE');
        Q_Auxi.SQL.Add('  AND INDICEVALE=:INDICEVALE');
        Q_Auxi.ParamByName('ESTACION').AsInteger   := AEstacion;
        Q_Auxi.ParamByName('CAJA').AsInteger       := ACaja;
        Q_Auxi.ParamByName('FECHA').AsDateTime     := AFecha;
        Q_Auxi.ParamByName('TURNO').AsInteger      := ATurno;
        Q_Auxi.ParamByName('INDICE').AsInteger     := AIndice;
        Q_Auxi.ParamByName('INDICEVALE').AsInteger := AIndiceVale;
        Q_Auxi.ExecSQL;
      except
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

end.
