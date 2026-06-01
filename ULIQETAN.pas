unit ULIQETAN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DB, Master_Intf, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxButtonEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, RxMemDS, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TFLIQETAN = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BbGuardar: TBitBtn;
    BbSalir: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label5: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    lblLitros: TEdit;
    BitBtn1: TBitBtn;
    TM_Clie: TRxMemoryData;
    TM_ClieNOCLIE: TIntegerField;
    TM_ClieNOMBRE: TStringField;
    TM_ClieSALDO: TFloatField;
    DS_Clie: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    CheckBox1: TCheckBox;
    procedure Edit4DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Click(Sender: TObject);
    procedure BbGuardarClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BbSalirClick(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1Column1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure LimpiaControles;
  public
    { Public declarations }
  end;

var
  FLIQETAN: TFLIQETAN;

implementation

uses
  UGENCLIEBFACELE,ULIBGRAL,ULIBDATABASE,DDMCONS,DDMCXC,DDMCUP,DateUtils,
  Math,DDMGAS,DDM_KIOS,UAVANCE;

{$R *.dfm}

procedure TFLIQETAN.Edit4DblClick(Sender: TObject);
begin
  FGENCLIEBFACELE.PreparaForma('');
  if FGENCLIEBFACELE.ShowModal=mrOk then begin
    if FGENCLIEBFACELE.Credito='Si' then
      Edit4.Text:=IntToClaveNum(FGENCLIEBFACELE.ClaveClie,5)+' - '+FGENCLIEBFACELE.NombreClie
    else
      MensajeInfo('El cliente seleccionado no es de crédito.');
  end;
end;

procedure TFLIQETAN.FormShow(Sender: TObject);
begin
  with DMCONS do begin
    Q_Auxi.Close;
    Q_AuxiDate1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT MAX(FECHA) AS DATE1 FROM DPVGCVOL WHERE ESTATUS=''A''');
    Q_Auxi.Open;
    MaskEdit2.Text:=DateToStr(Q_AuxiDate1.AsDateTime);
    MaskEdit1.Text:=FormatDateTime('hh:mm',Now);
    ComboBox1Click(Sender);
    TM_Clie.Active:=True;
  end;
end;

procedure TFLIQETAN.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure TFLIQETAN.ComboBox1Click(Sender: TObject);
begin
  with DMCONS do begin
    ComboBox2.Items.Clear;
    ComboBox2.Enabled:=True;
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT TANQUE AS ENTERO1 FROM DPVGTANQ WHERE COMBUSTIBLE='+IntToStr(ComboBox1.ItemIndex+1));
    Q_Auxi.Open;
    while not Q_Auxi.Eof do begin
      ComboBox2.Items.Add('Tanque '+Q_AuxiEntero1.AsString);
      Q_Auxi.Next;
    end;
    if ComboBox2.Items.Count>0 then
      ComboBox2.ItemIndex:=0
    else
      ComboBox2.Enabled:=False;
  end;
end;

procedure TFLIQETAN.BbGuardarClick(Sender: TObject);
var
  VolIni:Double;
  precio,xTotClien:Double;
  Turno:Integer;
  NoTickets,NoClie,FolioVol:Integer;
  VolEnt,VolTick,TotTick,ImpTick:Double;
  i,isla,posCarga,cajaLiq:Integer;
  Vale:TVale;
  xError:Boolean;
  horaTmp:TDateTime;
begin
  with DMCONS do begin
    xError:=False;
    if cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0] <> null then
      xTotClien:=cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0]
    else
      xTotClien:=0;
    if not DMGAS.SwServiciosMaster then begin
      MensajeInfo('Necesita tener activos los servicios del master'+#13#10+'para poder realizar este proceso.');
      Exit;
    end;
    if GetServerTime<=0 then
      Exit;
    VolEnt:=StrToFloatDef(Edit1.Text,0);
    VolTick:=StrToFloatDef(Edit2.Text,0);
    if VolEnt<=0 then begin
      MensajeInfo('No ha indicado el volumen de la entrada correctamente.');
      Exit;
    end;
    if not ComboBox2.Enabled then begin
      MensajeInfo('No cuenta con ningún tanque del combustible seleccionado.');
      Exit;
    end;
    if StrToDateTime(MaskEdit2.Text+' '+MaskEdit1.Text)>Now then begin
      MensajeInfo('La hora de la entrada no puede ser posterior a la hora actual.');
      Exit;
    end;
    if VolTick<=0 then begin
      MensajeInfo('No se han indicado los litros de los tickets a generar.');
      Exit;
    end;
    if VolTick>VolEnt then begin
      MensajeInfo('El volumen de los tickets no puede ser superior al de la entrada.');
      Exit;
    end;
    if not(strtofloat(Edit1.Text)=xTotClien) then begin
      MensajeInfo('El volumen de la entrada no coincide con el total de tickets');
      Exit;
    end;
//    Q_Auxi.Close;
//    Q_AuxiDate1.FieldKind:=fkInternalCalc;
//    Q_Auxi.SQL.Clear;
//    Q_Auxi.SQL.Add('SELECT MAX(FECHAHORAINICIAL) AS DATE1 FROM DPVGCVOL WHERE ESTATUS=''A''');
//    Q_Auxi.Open;
//    if StrToDateTime(MaskEdit2.Text+' '+MaskEdit1.Text)<Q_AuxiDate1.AsDateTime then begin
//      MensajeInfo('La fecha y hora de la entrada no pueden ser anteriores'+#13#10+'a la fecha y hora de apertura del corte actual.');
//      Exit;
//    end;
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT FIRST 1 VOLUMENFINAL - (SELECT COALESCE(SUM(VOLUMEN),0) FROM DPVGMOVI WHERE HORA>=E.FECHAHORAFINAL');
    Q_Auxi.SQL.Add('AND HORA<=:HORAF');
    Q_Auxi.SQL.Add('AND MANGUERA IN (SELECT MANGUERA FROM DPVGBOMB WHERE TANQUE=:TANQUE)) AS REAL1');
    Q_Auxi.SQL.Add('FROM DPVGETAN E WHERE FECHA<=:FECHA AND TANQUE=:TANQUE ORDER BY FOLIO DESC');
    Q_Auxi.ParamByName('HORAF').AsDateTime:=StrToDateTime(MaskEdit2.Text)+StrToTime(MaskEdit1.Text);
    Q_Auxi.ParamByName('FECHA').AsDateTime:=StrToDate(MaskEdit2.Text);
    Q_Auxi.ParamByName('TANQUE').AsInteger:=StrToInt(Copy(ComboBox2.Text,Length(ComboBox2.Text)-1,2));
    Q_Auxi.Open;
    VolIni:=Q_AuxiReal1.AsFloat;
    Q_Auxi.Close;
    Q_AuxiReal1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT CAPACIDAD AS REAL1 FROM DPVGTANQ WHERE TANQUE='+Copy(ComboBox2.Text,Length(ComboBox2.Text)-1,2));
    Q_Auxi.Open;
    if VolEnt+VolIni>Q_AuxiReal1.AsFloat then begin
      MensajeInfo('El volumen de la entrada superaría la capacidad de este tanque.');
      Exit;
    end;

    Precio:=DMCUP.PrecioCombustibleFecha(ComboBox1.ItemIndex+1,StrToDate(MaskEdit2.Text));

    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT TURNO AS ENTERO1 FROM DPVGTURN WHERE (FECHAHORAINICIAL<=:FECHAHORA AND FECHAHORAFINAL>=:FECHAHORA) OR');
    Q_Auxi.SQL.Add('(FECHAHORAINICIAL<=:FECHAHORA AND ESTATUS=''A'')');
    Q_Auxi.ParamByName('FECHAHORA').AsDateTime:=StrToDateTime(MaskEdit2.Text+' '+MaskEdit1.Text);
    Q_Auxi.Open;
    Turno:=Q_AuxiEntero1.AsInteger;

    //Entrada
    Q_Auxi.Close;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('INSERT INTO DPVGETAN (FECHA,CORTE,TANQUE,COMBUSTIBLE,VOLUMENINICIAL,VOLUMENFINAL,VOLUMENRECEPCION,');
    Q_Auxi.SQL.Add('TEMPERATURA,FECHAHORAINICIAL,FECHAHORAFINAL,FECHAHORA,FECHATURNO,FECHAHORADISP,TURNO,VIRTUAL) VALUES');
    Q_Auxi.SQL.Add('(:FECHA,:CORTE,:TANQUE,:COMBUSTIBLE,:VOLUMENINICIAL,:VOLUMENFINAL,:VOLUMENRECEPCION,:TEMPERATURA,');
    Q_Auxi.SQL.Add(':FECHAHORAINICIAL,:FECHAHORAFINAL,:FECHAHORA,:FECHATURNO,:FECHAHORADISP,:TURNO,:VIRTUAL)');
    Q_Auxi.ParamByName('FECHA').AsDateTime:=StrToDate(MaskEdit2.Text);
    Q_Auxi.ParamByName('CORTE').AsInteger:=1;
    Q_Auxi.ParamByName('TANQUE').AsInteger:=StrToInt(Copy(ComboBox2.Text,Length(ComboBox2.Text)-1,2));
    Q_Auxi.ParamByName('COMBUSTIBLE').AsInteger:=ComboBox1.ItemIndex+1;
    Q_Auxi.ParamByName('VOLUMENINICIAL').AsFloat:=VolIni;
    Q_Auxi.ParamByName('VOLUMENFINAL').AsFloat:=VolEnt+VolIni;
    Q_Auxi.ParamByName('VOLUMENRECEPCION').AsFloat:=VolEnt;
    Q_Auxi.ParamByName('TEMPERATURA').AsFloat:=24;
    Q_Auxi.ParamByName('FECHAHORAINICIAL').AsDateTime:=StrToDateTime(MaskEdit2.Text+' '+MaskEdit1.Text);
    Q_Auxi.ParamByName('FECHAHORAFINAL').AsDateTime:=IncMinute(StrToDateTime(MaskEdit2.Text+' '+MaskEdit1.Text),Trunc(VolEnt/860));
    Q_Auxi.ParamByName('FECHAHORA').AsDateTime:=Q_Auxi.ParamByName('FECHAHORAFINAL').AsDateTime;
    Q_Auxi.ParamByName('FECHATURNO').AsDateTime:=Trunc(Q_Auxi.ParamByName('FECHAHORAFINAL').AsDateTime);
    Q_Auxi.ParamByName('FECHAHORADISP').AsString:=FormatDateTime('DDMMYYhhmm',Q_Auxi.ParamByName('FECHAHORAFINAL').AsDateTime);
    Q_Auxi.ParamByName('TURNO').AsInteger:=Turno;
    Q_Auxi.ParamByName('VIRTUAL').AsString:='Si';
    Q_Auxi.ExecSQL;

    //Tickets
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_AuxiEntero2.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT FIRST 1 POSCARGA AS ENTERO1, ISLA AS ENTERO2 FROM DPVGBOMB WHERE COMBUSTIBLE='+IntToStr(ComboBox1.ItemIndex+1));
    Q_Auxi.Open;
    posCarga:=Q_AuxiEntero1.AsInteger;
    isla:=Q_AuxiEntero2.AsInteger;
    with DMGAS do begin
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT FIRST 1 CAJA AS ENTERO1 FROM DGASCAJA WHERE TIPO =''Liquidacion'' AND ESTACION='+T_EstsCLAVE.AsString);
      Q_Auxi.Open;
      cajaLiq:=Q_AuxiEntero1.AsInteger;
    end;
    while not(TM_Clie.Eof) do begin
      NoClie:=TM_ClieNOCLIE.AsInteger;
      VolEnt:=TM_ClieSALDO.AsFloat;
      NoTickets:=IfThen(Frac(VolEnt/VolTick)=0,Trunc(VolEnt/VolTick),Trunc(VolEnt/VolTick)+1);
      FAVANCE.PreparaAvance('Registrando ventas del cliente '+inttostr(NoClie),True,NoTickets);
      horaTmp:=IncMinute(StrToDateTime(MaskEdit2.Text+' '+MaskEdit1.Text),Trunc(VolEnt/860));
      try
        for i:=1 to NoTickets do begin
          Q_Auxi.Close;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('INSERT INTO DPVGMOVI (FECHA,HORA,POSCARGA,COMBUSTIBLE,VOLUMEN,IMPORTE,PRECIO,HORASTR,TIPOPAGO) VALUES');
          Q_Auxi.SQL.Add('(:FECHA,:HORA,:POSCARGA,:COMBUSTIBLE,:VOLUMEN,:IMPORTE,:PRECIO,:HORASTR,:TIPOPAGO)');
          Q_Auxi.ParamByName('FECHA').AsDateTime:=StrToDate(MaskEdit2.Text);
          if not CheckBox1.Checked then begin
            Q_Auxi.ParamByName('HORA').AsDateTime:=IncSecond(StrToDateTime(MaskEdit2.Text+' '+MaskEdit1.Text),
                                                   Trunc((i*StrToFloat(Edit2.Text))*IfThen(ComboBox1.ItemIndex=2,1.2,2.1428)));
          end
          else begin
            horaTmp:=IncSecond(horaTmp);
            Q_Auxi.ParamByName('HORA').AsDateTime:=horaTmp;
          end;
          Q_Auxi.ParamByName('POSCARGA').AsInteger:=posCarga;
          Q_Auxi.ParamByName('COMBUSTIBLE').AsInteger:=ComboBox1.ItemIndex+1;
          if TotTick+VolTick>VolEnt then
            Q_Auxi.ParamByName('VOLUMEN').AsFloat:=VolEnt-TotTick
          else
            Q_Auxi.ParamByName('VOLUMEN').AsFloat:=VolTick;
          VolTick:=Q_Auxi.ParamByName('VOLUMEN').AsFloat;
          Q_Auxi.ParamByName('IMPORTE').AsFloat:=Q_Auxi.ParamByName('VOLUMEN').AsFloat*precio;
          ImpTick:=Q_Auxi.ParamByName('IMPORTE').AsFloat;
          Q_Auxi.ParamByName('PRECIO').AsFloat:=precio;
          Q_Auxi.ParamByName('HORASTR').AsString:=FormatDateTime('hh:mm:ss',Q_Auxi.ParamByName('HORA').AsDateTime);
          Q_Auxi.ParamByName('TIPOPAGO').AsInteger:=10;
          Q_Auxi.ExecSQL;
          TotTick:=TotTick+StrToFloat(Edit2.Text);

          //Vales
          Q_Auxi.Close;
          Q_AuxiEntero1.FieldKind:=fkInternalCalc;
          Q_Auxi.SQL.Clear;
          Q_Auxi.SQL.Add('SELECT MAX(FOLIO) AS ENTERO1 FROM DPVGMOVI');
          Q_Auxi.Open;
          FolioVol:=Q_AuxiEntero1.AsInteger;

          Vale:=TVale.Create;
          Vale.Estacion         := DMGAS.T_EstsCLAVE.AsInteger;
          Vale.Caja             := cajaLiq;
          Vale.Fecha            := StrToDate(MaskEdit2.Text);
          Vale.Turno            := Turno;
          vale.Indice           := dame_next_folio_vale(0, DMGAS.T_EstsCLAVE.AsInteger, cajaLiq, StrToDate(MaskEdit2.Text), Turno, 0);
          Vale.Producto         := ComboBox1.ItemIndex+1;
          vale.SubClave         := 0;
          Vale.Cantidad         := VolTick;
          Vale.Precio           := precio;
          Vale.Importe          := ImpTick;
          Vale.Liquidado        := 'No';
          Vale.Cliente          := NoClie;
          Vale.Despachador      := 0;
          Vale.FolioVolumetrico := FolioVol;
          if DMGAS.VarLiqIslaVirtual>0 then
            Vale.Isla           := DMGAS.VarLiqIslaVirtual
          else
            Vale.Isla           := isla;
          if set_vale(Vale,False)>0 then
            xError:=True;
          Q_Auxi.Close;
          FAVANCE.AvanzaPosicion;
        end;
        FAVANCE.Close2;
        LimpiaControles;
      except
        on e:Exception do begin
          FAVANCE.Close2;
          raise Exception.Create('Error: '+e.Message);
        end
      end;

      TM_Clie.Next;
    end;
    if xError then
      MensajeInfo('Ocurrio un error en el proceso, verificar log generado "c:\Imagenco\Tmp\ErrorVale"')
    else
      MensajeInfo('Proceso concluido satisfactoriamente.');
    LimpiaControles;
  end;
end;

procedure TFLIQETAN.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','.',#8]) then
    Key:=#0;
end;

procedure TFLIQETAN.BbSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQETAN.LimpiaControles;
begin
  ComboBox1.ItemIndex:=0;
  ComboBox1Click(nil);
  Edit1.Text:='';
  Edit2.Text:='';
  Edit4.Text:='';
  lblLitros.Text:='';
  TM_Clie.EmptyTable;
  with DMCONS do begin
    Q_Auxi.Close;
    Q_AuxiDate1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('SELECT MAX(FECHA) AS DATE1 FROM DPVGCVOL WHERE ESTATUS=''A''');
    Q_Auxi.Open;
    MaskEdit2.Text:=DateToStr(Q_AuxiDate1.AsDateTime);
    MaskEdit1.Text:=FormatDateTime('hh:mm',Now);
  end;
end;

procedure TFLIQETAN.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=idF5 then
    Edit4DblClick(Sender)
end;

procedure TFLIQETAN.cxGrid1DBTableView1Column1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if not TM_Clie.Eof then
    TM_Clie.Delete;
end;

procedure TFLIQETAN.BitBtn1Click(Sender: TObject);
var
  xLitros,xTot,xPrecio,xTotalImp,xSaldClie:Double;
  xClaveClie:Integer;
  xNomClie:string;
  SaldoClie:TSaldoCxc;
begin
  xClaveClie:=StrToIntDef(ExtraeElemStrSep(Edit4.Text,1,'-'),0);
  xNomClie:=ExtraeElemStrSep(Edit4.Text,2,'-');
  xLitros:= StrToFloatDef(lblLitros.Text,-1);
  if cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0] <> null then
    xTot:=cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0]
  else
    xTot:=0;
  //VALIDACIONES
  if Edit1.Text = '' then begin
    MensajeInfo('No ha indicado el volumen de entrada');
    Edit1.SetFocus;
    Exit;
  end;
  if lblLitros.Text='' then begin
    MensajeInfo('No ha indicado los litros');
    lblLitros.SetFocus;
    Exit;
  end;
  if xLitros<0 then begin
    MensajeInfo('"'+lblLitros.Text+'" no es un valor de litros válido');
    lblLitros.SetFocus;
    Exit;
  end;
  if xClaveClie=0 then begin
    MensajeInfo('No ha indicado ningún cliente');
    Edit4.SetFocus;
    Exit;
  end;
  if ((xTot+xLitros)>(StrToFloatDef(Edit1.Text,0))) then begin
    MensajeInfo('La cantidad de litros acumulada ha sobrepasado el volumen de la entrada');
    lblLitros.SetFocus;
    Exit;
  end;
  if TM_Clie.Locate('NOCLIE',xClaveClie,[]) then begin
    MensajeInfo('El cliente ya ha sido agregado');
    Edit4.SetFocus;
    Exit;
  end;

//  DMCXC.SaldoCxcClie(xClaveClie,'MN',StrToDate(MaskEdit2.Text),StrToDate(MaskEdit2.Text),SaldoClie);
  xSaldClie:=DMGAS.CreditoDisponible(xClaveClie,StrToDate(MaskEdit2.Text));
  xPrecio:=DMCUP.PrecioCombustibleFecha(ComboBox1.ItemIndex+1,StrToDate(MaskEdit2.Text));
  xTotalImp:=xPrecio*xLitros;
  if xTotalImp>xSaldClie then begin
    MensajeInfo('El cliente no tiene saldo suficiente para realizar la entrada');
    Exit;
  end;

  TM_Clie.Insert;
  TM_ClieNOCLIE.AsInteger:=xClaveClie;
  TM_ClieNOMBRE.AsString:=xNomClie;
  TM_ClieSALDO.AsFloat:=xLitros;
  TM_Clie.Post;
  lblLitros.Clear;
  Edit4.Clear;
end;

procedure TFLIQETAN.Edit1Exit(Sender: TObject);
var
  xValor:Double;
begin
  if not(Trim(Edit1.Text) = '') then begin
    xValor:=StrToFloatDef(Edit1.Text,-1);
    if xValor<0 then begin
      MensajeInfo('"'+Edit1.Text+'" no es un valor de volumen válido');
      Edit1.SetFocus;
    end;
  end;
end;

procedure TFLIQETAN.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not(TM_Clie.IsEmpty) then begin
    if MensajeConf('¿Desea guardar la entrada antes de salir?')=mrYes then
      BbGuardar.Click
  end;
end;

end.
