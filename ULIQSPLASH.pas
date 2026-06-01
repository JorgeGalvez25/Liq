unit ULIQSPLASH;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, acPNG;

type
  TFLIQSPLASH = class(TForm)
    Panel1: TPanel;
    Image2: TImage;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLIQSPLASH: TFLIQSPLASH;

implementation

{$R *.DFM}

procedure TFLIQSPLASH.FormShow(Sender: TObject);
begin
  StaticText1.Caption := '4.3.10.0';
end;

end.
