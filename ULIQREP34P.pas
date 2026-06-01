unit ULIQREP34P;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ComCtrls, Printers, DBCtrls, Db, DBTables,
  Buttons, UOutLookMail_ICOMER, QRPDFFilt;

type
  TFLIQREP34P = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    BPrever: TBitBtn;
    BImprimir: TBitBtn;
    BOpciones: TBitBtn;
    BCancelar: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
  private
    { Private declarations }
    ModoRep:integer;
  public
    { Public declarations }
    swImprimeCostos:Boolean;
    procedure PreparaForma(xModo:integer);
  end;

var
  FLIQREP34P: TFLIQREP34P;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIBPRINT,  DDMCFG, DDMGAS, UAVANCE,
  ULIQREP34, DDMGEN_VTAS;

{$R *.DFM}

procedure TFLIQREP34P.PreparaForma(xModo:integer);
begin
  ModoRep:=xModo;
end;

procedure TFLIQREP34P.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQREP34P.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
  MaskEdit3.EditMask:=MaskFecha2;
  MaskEdit4.EditMask:=MaskFecha2;
  MaskEdit3.Text:=FechaToFormato(VgFechaIni);
  MaskEdit4.Text:=FechaToFormato(VgFechaFin);
  with DMGAS do begin
    T_Ests.Active:=true;
    DBLookUpComboBox2.KeyValue:=T_EstsClave.AsInteger;
  end;
end;

procedure TFLIQREP34P.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQREP34P.BImprimirClick(Sender: TObject);
var
  MailDetail:TMailRecord;
  _ArchivosAdjuntos:TStringList;
  PDFFilt:TQRPDFDocumentFilter;
  _contacto:String;
  _ArchivoPDF:string;
begin
  with DMGEN,DMCFG do begin
    VgFechaIni:=StrToDate(MaskEdit3.text);
    VgFechaFin:=StrToDate(MaskEdit4.text);
    if VgFechaIni>VgFechaFin then
      raise Exception.Create('Periodo Inválido');
    swImprimeCostos:=True;
    if VgFechaFin>DMGEN_VTAS.FechaCosteo then begin
      swImprimeCostos:=false;
      MensajeInfo('Cuidado fecha final mayor a la Fecha de Costeo, el reporte se imprimira sin costos');
    end;
    Application.CreateForm(TFLIQREP34,FLIQREP34);
    try
      FLIQREP34.PreparaReporte;
      if CheckBox1.Checked then begin
        if Pos('@',DMGAS.VarGasCorreoDirectivo)>0 then begin
          _contacto := DMGAS.VarGasCorreoDirectivo;
          if _contacto<>'' then begin
            //Generar PDF para enviar correo  <<<INICIO>>>
            {$I-}
              ChDir(Ulibdatabase.VsLocalDir);
              if IOResult <> 0 then begin
                MkDir(Ulibdatabase.VsLocalDir);
                if IOResult <> 0 then
                  MessageDlg('No he podido crear el directorio '+Ulibdatabase.VsLocalDir, mtWarning, [mbOk], 0);
              end;
              _ArchivoPDF:='ReporteDirectivo '+FormatDateTime('ddmmyy',Now)+'.Pdf';
              PDFFilt:=TQRPDFDocumentFilter.Create(Ulibdatabase.VsLocalDir+'\'+_ArchivoPDF);
            {$I+}
            try
              try
                FLIQREP34.QuickRep1.ExportToFilter(PDFFilt);
                _ArchivosAdjuntos := TStringList.Create;
                _ArchivosAdjuntos.Add(Ulibdatabase.VsLocalDir+'\'+_ArchivoPDF);
                MailDetail.FileToAttach := _ArchivosAdjuntos;
                MailDetail.MailTo:=_contacto;
                MailDetail.CC:='';
                MailDetail.CCO:='';
                MailDetail.BCC:='';
                MailDetail.Body:='Este es un correo automático por parte de '+QT_EmprRAZONSOCIAL.AsString+' que contiene como adjunto el Reporte Directivo.';
                try
                  OutLookMailProc(MailDetail);
                except
                end;
                if FileExists(Ulibdatabase.VsLocalDir+'\'+_ArchivoPDF) then
                  DeleteFile(Ulibdatabase.VsLocalDir+'\'+_ArchivoPDF);
                _ArchivosAdjuntos.Free;
              except
                on e:exception do begin
                  _ArchivosAdjuntos.Free;
                  raise exception.Create(e.message);
                end;
              end;
            finally
              pdffilt.Free;
            end;
            //Genrar PDF para enviar correo  <<<FIN>>>
          end;
        end
        else
          MensajeWarn('No se enviara correo electrónico, dirección de correo electrónico no esta correcta');
      end;
      if sender=BImprimir then
        FLIQREP34.QuickRep1.Print
      else
        FLIQREP34.QuickRep1.Preview;
    finally
      FLIQREP34.Free;
    end;
  end;
end;

procedure TFLIQREP34P.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQREP34P.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQREP34P.MaskEdit3Exit(Sender: TObject);
begin
  VgFechaIni:=StrToDate(MaskEdit3.text);
  MaskEdit4.Text:=FechaToFormato(DiaUltimo(VgFechaIni));  
end;

end.
