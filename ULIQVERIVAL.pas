unit ULIQVERIVAL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, Db, DBTables, ComCtrls;

type
  TFLIQVERIVAL = class(TForm)
    QL_Pval: TQuery;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    BbCalcular: TBitBtn;
    BbSalir: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    QL_PvalESTACION: TIntegerField;
    QL_PvalCAJA: TIntegerField;
    QL_PvalFECHA: TDateTimeField;
    QL_PvalTURNO: TIntegerField;
    QL_PvalINDICE: TIntegerField;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalCANTIDAD: TIntegerField;
    QL_PvalTOTAL: TFloatField;
    QL_PvalFACTURADO: TStringField;
    QL_PvalESTACIONFAC: TIntegerField;
    QL_PvalSERIEFAC: TStringField;
    QL_PvalFOLIOFAC: TIntegerField;
    QL_PvalINDICEVALE: TIntegerField;
    DSQL_Pval: TDataSource;
    QL_Vale: TQuery;
    QL_ValeESTACION: TIntegerField;
    QL_ValeCAJA: TIntegerField;
    QL_ValeFECHA: TDateTimeField;
    QL_ValeTURNO: TIntegerField;
    QL_ValeINDICE: TIntegerField;
    QL_ValeINDICEVALE: TIntegerField;
    QL_ValeIMPORTE: TFloatField;
    QL_ValeFACTURADO: TStringField;
    QL_ValeESTACIONFAC: TIntegerField;
    QL_ValeSERIEFAC: TStringField;
    QL_ValeFOLIOFAC: TIntegerField;
    QL_ValeCLIENTE: TIntegerField;
    DSQL_Vale: TDataSource;
    QL_Dval: TQuery;
    QL_DvalNombreProducto: TStringField;
    QL_DvalESTACION: TIntegerField;
    QL_DvalCAJA: TIntegerField;
    QL_DvalFECHA: TDateTimeField;
    QL_DvalTURNO: TIntegerField;
    QL_DvalINDICE: TIntegerField;
    QL_DvalINDICEVALE: TIntegerField;
    QL_DvalPRODUCTO: TIntegerField;
    QL_DvalIMPORTE: TFloatField;
    QL_DvalFACTURADO: TStringField;
    QL_DvalESTACIONFAC: TIntegerField;
    QL_DvalSERIEFAC: TStringField;
    QL_DvalFOLIOFAC: TIntegerField;
    QL_DvalCLIENTE: TIntegerField;
    DSQL_Dval: TDataSource;
    procedure BbCalcularClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BbSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQVERIVAL: TFLIQVERIVAL;

implementation

uses ULIBGRAL, UGEN_NET, DDMGEN, DDMGENQ, ULIBDATABASE, DDMGEN_VTAS, DDMLIQ,
  DDMGAS, UAVANCE, DDMCXC, DDMCUP;

{$R *.DFM}


procedure TFLIQVERIVAL.BbCalcularClick(Sender: TObject);
begin
  with DMGEN,DMGAS do begin
    VgFechaIni:=StrToDate(MaskEdit1.text);
    VgFechaFin:=StrToDate(MaskEdit2.text);
    if VgFechaIni>VgFechaFin then begin
      MensajeErr('Periodo Inválido');
      MaskEdit1.SetFocus;
    end;
    try
      SwCalcFields:=false;
      QL_Pval.Close;
      QL_Pval.ParamByName('pfechaini').AsDateTime:=VgFechaIni;
      QL_Pval.ParamByName('pfechafin').AsDateTime:=VgFechaFin;
      QL_Pval.Prepare;
      QL_Pval.Open;
      QL_Vale.Open;
      QL_Dval.Open;
      FAvance.PreparaAvance('Verificando Vales...',true,QL_Pval.RecordCount);
      while not QL_Pval.Eof do begin
        StatusBar1.Panels[0].Text:='Cliente: '+Inttoclavenum(QL_PvalCliente.AsInteger,5);
        StatusBar1.Refresh;
        QL_Vale.Close;
        QL_Vale.Prepare;
        QL_Vale.Open;
        while not QL_Vale.Eof do begin
          if QL_ValeCliente.AsInteger<>QL_PvalCliente.AsInteger then begin
            MensajeInfo('Error en Cliente: '+Inttoclavenum(QL_PvalCliente.AsInteger,5));
            Q_Auxi.Close;
            Q_Auxi.SQL.Clear;
            Q_Auxi.SQL.Add('Update DGASVALE Set  Cliente='+IntToStr(QL_PvalCliente.Asinteger));
            Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_PvalEstacion.asinteger));
            Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_PvalCaja.asinteger));
            Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_PvalFecha.AsDateTime)+'"');
            Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_PvalTurno.AsInteger));
            Q_Auxi.SQL.Add('  and Indice='+IntToStr(QL_PvalIndice.AsInteger));
            Q_Auxi.Prepare;
            Q_Auxi.ExecSql;
//
            QL_Dval.Close;
            QL_Dval.Prepare;
            QL_Dval.Open;
            while not QL_Dval.Eof do begin
              if QL_DvalCliente.AsInteger<>QL_PvalCliente.AsInteger then begin
                Q_Auxi.Close;
                Q_Auxi.SQL.Clear;
                Q_Auxi.SQL.Add('Update DGASDVAL Set  Cliente='+IntToStr(QL_PvalCliente.Asinteger));
                Q_Auxi.SQL.Add('where Estacion='+IntToStr(QL_ValeEstacion.asinteger));
                Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_ValeCaja.asinteger));
                Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_ValeFecha.AsDateTime)+'"');
                Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_ValeTurno.AsInteger));
                Q_Auxi.SQL.Add('  and Indice='+IntToStr(QL_ValeIndice.AsInteger));
                Q_Auxi.SQL.Add('  and IndiceVale='+IntToStr(QL_ValeIndiceVale.AsInteger));
                Q_Auxi.Prepare;
                Q_Auxi.ExecSql;
              end;
              QL_Dval.Next;
            end;
          end;
          QL_Vale.Next;
        end;
        FAvance.AvanzaPosicion;
        QL_Pval.Next;
      end;
    finally
      FAvance.Close;
      QL_Pval.Close;
      QL_Vale.Close;
      QL_Dval.Close;
      StatusBar1.Panels[0].Text:='';
      StatusBar1.Refresh;
      MensajeInfo('Proceso terminado');
    end;
  end;
end;

procedure TFLIQVERIVAL.FormShow(Sender: TObject);
begin
  MaskEdit1.EditMask:=MaskFecha2;
  MaskEdit2.EditMask:=MaskFecha2;
  MaskEdit1.Text:=FechaToFormato(VgFechaIni);
  MaskEdit2.Text:=FechaToFormato(VgFechaFin);
end;

procedure TFLIQVERIVAL.BbSalirClick(Sender: TObject);
begin
  Close;
end;

end.
