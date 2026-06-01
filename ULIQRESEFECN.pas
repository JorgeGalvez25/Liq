unit ULIQRESEFECN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DB, DBTables, RxMemDS;

type
  TFLIQRESEFECN = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    btnGuardar: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit3: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    StaticText5: TStaticText;
    Label3: TLabel;
    edMonto: TEdit;
    btnGenerar: TBitBtn;
    StaticText1: TStaticText;
    Label4: TLabel;
    QL_Movi: TQuery;
    QL_MoviFOLIO: TIntegerField;
    QL_MoviIMPORTE: TFloatField;
    TM_Auxi: TRxMemoryData;
    TM_AuxiFolio: TIntegerField;
    TM_AuxiImporte: TFloatField;
    QL_MoviTAG: TIntegerField;
    QL_MoviHEXHASH: TStringField;
    procedure edClienteKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit3DblClick(Sender: TObject);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure edMontoKeyPress(Sender: TObject; var Key: Char);
    procedure btnGenerarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edMontoEnter(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edMontoExit(Sender: TObject);
  private
    { Private declarations }
    xResg:Real;
    xMonto:Real;
  public
    { Public declarations }
    procedure PreparaForma;
  end;

var
  FLIQRESEFECN: TFLIQRESEFECN;

implementation

uses UGENCLIEB, DDMGEN, DDMGENQ, DDMGEN_VTAS, UGEN_NET, ULIBDATABASE,
  UAVANCE, ULIBGRAL, DDMGAS, DDMCONS, DDMLIQ, UIMGENCRYP;

{$R *.dfm}

procedure TFLIQRESEFECN.edClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#10,#13,#9]) then
    Key:=#0;
end;

procedure TFLIQRESEFECN.MaskEdit3DblClick(Sender: TObject);
begin
  if FGENCLIEB.ShowModal=mrOK then with DMGEN do begin
    MaskEdit3.Text:=InttoClaveCata(FGENCLIEB.ClaveClie,idClie);
    MaskEdit3Exit(Sender);
  end;
end;

procedure TFLIQRESEFECN.MaskEdit3Enter(Sender: TObject);
begin
  MaskEdit3.Text:='';
end;

procedure TFLIQRESEFECN.MaskEdit3Exit(Sender: TObject);
begin
  with DMGENQ,DMGEN_VTAS do begin
    if MaskEdit3.Text='' then
      exit;
    try
      if not BuscaQuery(QB_Clie,'pNoClie',StrtoInt(MaskEdit3.text)) then
        raise Exception.Create('No existe Cliente');
      MaskEdit3.Text:=DMGEN.IntToClaveCata(StrToInt(MaskEdit3.Text),idClie);
      StaticText5.Caption:=QB_ClieNombre.AsString;
    except
      MaskEdit3.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQRESEFECN.edMontoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#13,#10,#8,#9]) then
    Key:=#0;
end;

procedure TFLIQRESEFECN.btnGenerarClick(Sender: TObject);
var
  xedMonto:string;
  xImp:Real;
  _desencrip:string;
begin
  with DMGAS do begin
    btnGenerar.Enabled:=False;
    btnGuardar.Enabled:=False;
    if xMonto>0 then begin
      try
        xedMonto:=edMonto.Text;
        xResg:=0;
        QL_Movi.Close;
        QL_Movi.SQL.Clear;
        QL_Movi.SQL.Add('select folio, importe, tag, hexhash from dpvgmovi');
        QL_Movi.SQL.Add('where impreso='+QuotedStr('No'));
        QL_Movi.SQL.Add('  and Facturado='+QuotedStr('No'));
        QL_Movi.SQL.Add('  and Importe>=1');
        QL_Movi.SQL.Add('  and Tag<>1');
        QL_Movi.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(DiaPrimero(T_TurcFECHA.AsDateTime))));
        QL_Movi.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(DiaUltimo(T_TurcFECHA.AsDateTime))));
        QL_Movi.SQL.Add('Order By Importe Desc');
        QL_Movi.Prepare;
        QL_Movi.Open;
        FAVANCE.PreparaAvance('Calculando Resguardo...',True,QL_Movi.RecordCount);
        TM_Auxi.Active:=False;
        TM_Auxi.Active:=True;
        While not QL_Movi.Eof do begin
          if (xResg+QL_MoviIMPORTE.AsFloat)<=xMonto then begin
            xImp:=QL_MoviIMPORTE.AsFloat;
            if QL_MoviTAG.AsInteger=1 then begin
              try
                if not DMCONS.T_EstsIb.Active then
                  DMCONS.T_EstsIb.Open;
                _desencrip:=DesencriptaCadena(DMCONS.T_EstsIbNUMEROESTACION.AsString,QL_MoviHEXHASH.AsString);
                xImp:=StrToFloatDef(_desencrip,-1);
                if xImp=-1 then
                  xImp:=QL_MoviIMPORTE.AsFloat
              except
                on e:Exception do  begin
                  xImp:=QL_MoviIMPORTE.AsFloat;
                  raise Exception.Create(e.Message);
                end;
              end;
            end;
            try
              TM_Auxi.Insert;
              TM_AuxiFolio.AsInteger:=QL_MoviFOLIO.AsInteger;
              TM_AuxiImporte.AsFloat:=xImp;
              TM_Auxi.Post;
              xResg:=xResg+QL_MoviIMPORTE.AsFloat;
              if xResg=xMonto then
                Break;
            except
              TM_Auxi.Cancel;
            end;
          end;
          QL_Movi.Next;
          FAVANCE.AvanzaPosicion;
        end;
      finally
        MensajeInfo('Proceso Terminado');
        FAVANCE.Close;
        QL_Movi.Close;
        if TM_Auxi.RecordCount>0 then begin
          btnGuardar.Enabled:=True;
          btnGuardar.SetFocus;
          StaticText1.Caption:=FormatoMoneda(xResg);
          edMonto.Text:=xedMonto;
        end;
      end;
    end;
    btnGenerar.Enabled:=False;
  end;
end;

procedure TFLIQRESEFECN.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TFLIQRESEFECN.edMontoEnter(Sender: TObject);
begin
  edMonto.Text:='0.00';
  StaticText1.Caption:='0.00';
  btnGuardar.Enabled:=False;
  btnGenerar.Enabled:=True;
end;

procedure TFLIQRESEFECN.btnGuardarClick(Sender: TObject);
var
  xListFoliosVolu:TStringList;
begin
  with DMGAS, DMLIQ do begin
    btnGuardar.Enabled:=False;
    try
      try
        T_Pval.Insert;
        T_PvalCLIENTE.AsInteger:=VarCupNoClienteRes;
        T_Pval.Post;
        if not T_Resgpes.Active then
          T_Resgpes.Active:=True;
        T_Resgpes.Insert;
        T_ResgpesINDICE_VAL.AsInteger:=T_PvalIndice.AsInteger;
        T_ResgpesNOCLIE.AsInteger:=VarCupNoClienteRes;
        T_ResgpesIMPORTE.AsFloat:=xResg;
        TM_Auxi.First;
        xListFoliosVolu:=TStringList.Create;
        FAVANCE.PreparaAvance('Apartando folios volumetricos...',True,TM_Auxi.RecordCount);
        while not TM_Auxi.Eof do begin
          try
            T_Vale.Insert;
            T_ValeFOLIOVOLUMETRICO.AsInteger:=TM_AuxiFolio.AsInteger;
            T_Vale.Post;
            xListFoliosVolu.Add(IntToStr(TM_AuxiFolio.AsInteger));
            with DMCONS do begin
              try
                Q_Auxi.Close;
                Q_Auxi.SQL.Clear;
                Q_Auxi.SQL.Add('update DPVGMOVI set Impreso='+QuotedStr('Si'));
                Q_Auxi.SQL.Add('where folio='+IntToStr(TM_AuxiFolio.AsInteger));
                Q_Auxi.ExecSQL;
                Q_Auxi.Close;
              except
                on e:exception do begin
                  Q_Auxi.Close;
                  raise exception.Create(e.Message);
                end;
              end;
            end;
          except
            T_Vale.Cancel;
          end;
          TM_Auxi.Next;
          FAVANCE.AvanzaPosicion;
        end;
        T_ResgpesFOLIOSVOLUMETRICOS.Assign(xListFoliosVolu);
        T_Resgpes.Post;
      except
        on e:Exception do begin
          T_Resgpes.Cancel;
          raise Exception.Create(e.Message);
        end;
      end;
    finally
      FAVANCE.Close;
      MensajeInfo('Proceso Terminado');
      edMonto.SetFocus;
      edMonto.Text:='0.00';
      StaticText1.Caption:='0.00';
    end;
  end;
end;

procedure TFLIQRESEFECN.PreparaForma;
begin
  with DMGAS do begin
    MaskEdit3.Text:=IntToStr(VarCupNoClienteRes);
    MaskEdit3Exit(nil);
  end;
end;

procedure TFLIQRESEFECN.FormShow(Sender: TObject);
begin
  edMonto.Text:='0.00';
  StaticText1.Caption:='0.00';
  btnGuardar.Enabled:=False;
  edMonto.SetFocus;
end;

procedure TFLIQRESEFECN.edMontoExit(Sender: TObject);
begin
  xMonto:=StrToFloatDef(edMonto.Text,0);
  edMonto.Text:=FormatoMoneda(StrToFloatDef(edMonto.Text,0));
end;

end.
