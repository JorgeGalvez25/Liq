unit ULIQFDEPF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, grimgctrl, QuickRpt, QRCtrls, ExtCtrls, Printers;

type
  TFLIQFDEPF = class(TForm)
    QuickRep1: TQuickRep;
    QRDesp: TQRLabel;
    QRHRule1: TQRHRule;
    QRRecibe: TQRLabel;
    QRHRule2: TQRHRule;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    BnDt: TQRStringsBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    xfecha:TDateTime;
  end;

var
  FLIQFDEPF: TFLIQFDEPF;

implementation

uses
  DDMGEN,DDMGASQ,ULIBGRAL,ULIBDATABASE,DDMGAS, DB;

{$R *.dfm}

procedure TFLIQFDEPF.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEnca.Caption:=FechaAlf(xfecha);
  end;
end;

end.
                                                