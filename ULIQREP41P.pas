unit ULIQREP41P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, DBCtrls, Db, DBTables, Printers;

type
  TFLIQREP41P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    QL_Clas: TQuery;
    QL_ClasCLAVECATA: TStringField;
    QL_ClasCLAVECLASIF: TIntegerField;
    QL_ClasDESCRIPCION: TStringField;
    QL_ClasOBSERVACION: TStringField;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    StaticText1: TStaticText;
    CheckBox1: TCheckBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    RBPorGrupo: TRadioButton;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    GroupBox6: TGroupBox;
    ComboBox2: TComboBox;
    GroupBox7: TGroupBox;
    ComboBox3: TComboBox;
    CheckBox3: TCheckBox;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    CheckBox5: TCheckBox;
    Edit1: TEdit;
    CheckBox6: TCheckBox;
    Edit2: TEdit;
    CheckBox4: TCheckBox;
    CheckBox7: TCheckBox;
    CBTotalMes: TCheckBox;
    chbCtesActivos: TCheckBox;
    btnPrever: TBitBtn;
    btnImprimir: TBitBtn;
    btnOpciones: TBitBtn;
    btnSalir: TBitBtn;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit1DblClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure RBPorGrupoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
  private
    { Private declarations }
    xImporteMinimo:double;
  public
    { Public declarations }
  end;

var
  FLIQREP41P: TFLIQREP41P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, DDMGENQ, DDMGENT, UGENCLIEB,
  DDMGEN_VTAS, ULIQREP41, DDMCXC;

{$R *.DFM}

procedure TFLIQREP41P.BOpcionesClick(Sender: TObject);
var ss:string;
begin
  with DMGEN,DMCXC do begin
    xImporteMinimo:=10.00;
    if MensajeConf('Importe Menor o Igual a '+FormatoMoneda(10.00)+'?')=mrNo then begin
      ss:=InputBox('Importe Pendiente','Teclee el Importe ',FormatoMoneda(10.00));
      try
        xImporteMinimo:=StrToFloat(ss);
      except
        mensajeerr('Importe no válido');
        xImporteMinimo:=0;
        abort;
      end;
    end;
  end;
end;

procedure TFLIQREP41P.FormShow(Sender: TObject);
begin
  with DMGEN do begin
    AbreTablasGen('Mone;');
    if not PrinterActiva then begin
      btnPrever.Enabled:=false;
      btnImprimir.Enabled:=false;
      btnOpciones.Enabled:=false;
    end;
    ComboBox2.Items.Assign(ListPrinter);
    ComboBox2.ItemIndex:=PredPrinter1;
    ComboBox1.ItemIndex:=0;
    ComboBox3.ItemIndex:=0;
    DBLookUpComboBox1.KeyValue:=QT_MoneClave.Asstring;
    StaticText1.Caption:='';
//    MaskEdit3.EditMask:=MaskFecha2;
//    MaskEdit3.Text:=FechaToFormato(MesDiaToFecha(MesIniEjercicio(MesInicial(idCxc)),1));
//    MaskEdit7.EditMask:=MaskFecha2;
    MaskEdit4.EditMask:=MaskFecha2;
    MaskEdit4.Text:=FechaToFormato(VgFechaFin);
//    MaskEdit7.Text:=FechaToFormato(VgFechaFin);;
//    MaskEdit2.Text:='01/03/2002';
    QL_Clas.Close;
    QL_Clas.Prepare;
    QL_Clas.Open;
    MaskEdit4.SetFocus;
    xImporteMinimo:=0;
  end;
end;

procedure TFLIQREP41P.MaskEdit1Exit(Sender: TObject);
begin
  with DMGENT,DMGEN,DMGEN_VTAS do begin
    if MaskEdit1.text='' then
      exit;
    try
      if not LocalizaTabla(T_Clie,'NoClie',StrToInt(MaskEdit1.Text)) then
        raise exception.create('No existe Cliente');
      MaskEdit1.Text:=LlenaStr(MaskEdit1.Text,'D',LClaveCata(idClie),'0');
      StaticText1.Caption:=T_ClieNombre.AsString;
    except
      MaskEdit1.SetFocus;
      raise;
    end;
  end;
end;

procedure TFLIQREP41P.MaskEdit1DblClick(Sender: TObject);
begin
  with DMCXC,DMGEN do begin
    if FGENCLIEB.ShowModal=mrOK then begin
      MaskEdit1.Text:=InttoClaveCata(FGENCLIEB.ClaveClie,idClie);
      MaskEdit1Exit(Sender);
    end;
  end;
end;

procedure TFLIQREP41P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP41P.RBPorGrupoClick(Sender: TObject);
begin
  MaskEdit1.Text:='';
  StaticText1.Caption:='';
  Label6.Enabled:=true;
  Label7.Enabled:=true;
  MaskEdit5.Enabled:=true;
  MaskEdit6.Enabled:=true;
  StaticText3.Enabled:=true;
  StaticText4.Enabled:=true;
  QL_Clas.First;
  MaskEdit5.Text:=IntToClaveNum(QL_ClasClaveClasif.Asinteger,3);
  Statictext3.Caption:=QL_ClasDescripcion.Asstring;
  QL_Clas.Last;
  MaskEdit6.Text:=IntToClaveNum(QL_ClasClaveClasif.Asinteger,3);
  Statictext4.Caption:=QL_ClasDescripcion.Asstring;
  CheckBox1.Checked:=false;
end;

procedure TFLIQREP41P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QL_Clas.Close;
end;

procedure TFLIQREP41P.MaskEdit5Exit(Sender: TObject);
begin
  MaskEdit5.Text:=LlenaStr(MaskEdit5.Text,'D',3,'0');
  if QL_Clas.Locate('ClaveClasif',StrToInt(MaskEdit5.Text),[]) then
     StaticText3.Caption:=QL_ClasDescripcion.AsString;
end;

procedure TFLIQREP41P.MaskEdit6Exit(Sender: TObject);
begin
  MaskEdit6.Text:=LlenaStr(MaskEdit6.Text,'D',3,'0');
  if QL_Clas.Locate('ClaveClasif',StrToInt(MaskEdit6.Text),[]) then
     StaticText4.Caption:=QL_ClasDescripcion.AsString;
end;

procedure TFLIQREP41P.BImprimirClick(Sender: TObject);
var ximp1,ximp2:real;
    xswtel:boolean;
begin
  with DMGEN,FLIQREP41 do begin
    VgFechaIni:=StrToDate(MaskEdit4.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
//    if CheckBox8.Checked then begin
//      if StrToDate(MaskEdit3.text)>StrToDate(MaskEdit7.text) then
//        raise Exception.Create('Fecha inicial debe ser menor a la fecha final');
//    end;
    if (not CheckBox1.Checked)and(not RBPorGrupo.Checked) then
      if MaskEdit1.Text='' then
        raise Exception.Create('No se indicó clave de cliente');
    ximp1:=-1; ximp2:=-1;
    if CheckBox5.Checked then begin
      if StrToFloatDef(Edit1.Text,-1)=-1 then begin
        Edit1.SetFocus;
        raise Exception.Create('Importe no válido');
      end
      else ximp1:=StrToFloat(Edit1.Text);
    end;
    if CheckBox6.Checked then begin
      if StrToFloatDef(Edit2.Text,-1)=-1 then begin
        Edit2.SetFocus;
        raise Exception.Create('Importe no válido');
      end
      else ximp2:=StrToFloat(Edit2.Text);
    end;
    if (CheckBox5.Checked)and(CheckBox6.Checked) then
      if ximp1>ximp2 then
        raise Exception.Create('Rango de Importes no válidos');
    Application.CreateForm(TFLIQREP41,FLIQREP41);
    try
      pImporteMinimo:=ximp1;
      pImporteMaximo:=ximp2;
//      if CheckBox2.Checked then
//        pFechaInicioIva:=StrToDate(MaskEdit2.text);
      pSwTelefono:=CheckBox4.Checked;
      FLIQREP41.xRango:=false;
//      if CheckBox8.Checked then begin
//        FLIQREP41.xFechaIni:=StrToDate(MaskEdit3.text);
//        FLIQREP41.xFechaFin:=StrToDate(MaskEdit7.text);
//        FLIQREP41.xRango:=true;
//      end;
      PreparaReporte;
      if sender=btnImprimir then
        QuickRep1.print
      else
        QuickRep1.Preview;
    finally
      Free;
    end;
end;
end;

procedure TFLIQREP41P.CheckBox1Click(Sender: TObject);
begin
  chbCtesActivos.Checked:=CheckBox1.Checked;
  chbCtesActivos.Enabled:=CheckBox1.Checked;
  if CheckBox1.Checked then begin
    MaskEdit1.Text:='';
    StaticText1.Caption:='';
    RbPorgrupo.Checked:=false;
  end;
end;

procedure TFLIQREP41P.MaskEdit1Enter(Sender: TObject);
begin
  CheckBox1.Checked:=false;
  RbPorgrupo.Checked:=false;
end;

procedure TFLIQREP41P.ComboBox2Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox2.ItemIndex;
end;

procedure TFLIQREP41P.DBLookupComboBox1Click(Sender: TObject);
begin
  CheckBox3.Checked:=false;
end;

procedure TFLIQREP41P.CheckBox3Click(Sender: TObject);
begin
  DBLookUpComboBox1.Enabled:=not CheckBox3.Checked;
end;

procedure TFLIQREP41P.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=idF5 then
    MaskEdit1DblClick(Sender);
end;

procedure TFLIQREP41P.CheckBox5Click(Sender: TObject);
begin
  Edit1.Enabled:=CheckBox5.Checked;
end;

procedure TFLIQREP41P.CheckBox6Click(Sender: TObject);
begin
  Edit2.Enabled:=CheckBox6.Checked;
end;

procedure TFLIQREP41P.CheckBox2Click(Sender: TObject);
begin
//  Label1.Enabled:=CheckBox2.Checked;
//  MaskEdit2.Enabled:=CheckBox2.Checked;
end;

procedure TFLIQREP41P.CheckBox8Click(Sender: TObject);
begin
//  Label3.Enabled:=CheckBox8.Checked;
//  MaskEdit3.Enabled:=CheckBox8.Checked;
//  Label5.Enabled:=CheckBox8.Checked;
//  MaskEdit7.Enabled:=CheckBox8.Checked;
end;

end.
