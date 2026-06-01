unit ULIQCCAJAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, Printers;

type
  TFLIQCCAJAP = class(TForm)
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    BPrever: TButton;
    BImprimir: TButton;
    BOpciones: TButton;
    BCancelar: TButton;
    GroupBox1: TGroupBox;
    RbResumido: TRadioButton;
    RbDetallado: TRadioButton;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    procedure BOpcionesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BPreverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQCCAJAP: TFLIQCCAJAP;


implementation

uses ULIBGRAL, DDMGEN, UGEN_NET, ULIBDATABASE, ULIQCCAJAI;

{$R *.DFM}

procedure TFLIQCCAJAP.BOpcionesClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TFLIQCCAJAP.FormShow(Sender: TObject);
begin
  if not PrinterActiva then begin
    BPrever.Enabled:=false;
    BImprimir.Enabled:=false;
    BOpciones.Enabled:=false;
  end;
  ComboBox1.Items.Assign(ListPrinter);
  ComboBox1.ItemIndex:=PredPrinter1;
end;

procedure TFLIQCCAJAP.BCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFLIQCCAJAP.ComboBox1Change(Sender: TObject);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=ComboBox1.ItemIndex;
end;

procedure TFLIQCCAJAP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if PrinterActiva then
    Printer.PrinterIndex:=PredPrinter1;
end;

procedure TFLIQCCAJAP.BPreverClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQCCAJAI,FLIQCCAJAI);
  try
    FLIQCCAJAI.PreparaReporte(RBDetallado.Checked);
    if (Sender = BPrever) then
      FLIQCCAJAI.QuickRep1.Preview
    else
      FLIQCCAJAI.QuickRep1.Print;
  finally
    FLIQCCAJAI.Free;
  end;
end;

end.
