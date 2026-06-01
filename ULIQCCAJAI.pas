unit ULIQCCAJAI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, QRExport;

type
  TFLIQCCAJAI = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLEnca: TQRLabel;
    QRPag: TQRLabel;
    QRSPag: TQRSysData;
    QRBand2: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    BndDt: TQRStringsBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape3: TQRShape;
    QRLEstatus: TQRLabel;
    QL_Rcup: TQuery;
    QL_Serc2: TQuery;
    QL_Serc2CLAVE: TIntegerField;
    QL_Serc2DESCRIPCION: TStringField;
    QL_Serc2PRECIO: TFloatField;
    QL_RcupIMPORTE: TFloatField;
    QL_RcupSERIE: TIntegerField;
    QL_Serc: TQuery;
    QL_SercIMPORTE: TFloatField;
    QL_SercSERIE: TIntegerField;
    QL_SercDescripcion: TStringField;
    QL_SercCantidad: TIntegerField;
    QL_SercTotal: TFloatField;
    QL_Turc: TQuery;
    QL_TurcESTACION: TIntegerField;
    QL_TurcCAJA: TIntegerField;
    QL_TurcFECHA: TDateTimeField;
    QL_TurcTURNO: TIntegerField;
    QL_TurcHORAINI: TDateTimeField;
    QL_TurcHORAFIN: TDateTimeField;
    QL_TurcESTATUS: TStringField;
    QL_TurcCAJERO: TIntegerField;
    QL_TurcTOTALCUPRECUP: TFloatField;
    QL_TurcNombreCajero: TStringField;
    QL_TurcDescCaja: TStringField;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_TurcNombreEstacion: TStringField;
    QRLEstacion: TQRLabel;
    QL_Caja: TQuery;
    QL_CajaCAJA: TIntegerField;
    QL_CajaDESCRIPCION: TStringField;
    QL_TurcNombreCaja: TStringField;
    QL_RcupCUPON: TFloatField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QL_SercCalcFields(DataSet: TDataSet);
    procedure QL_TurcBeforeOpen(DataSet: TDataSet);
    procedure QL_TurcCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    pestacion,
    pcaja,
    pturno:integer;
    pfecha:tdatetime;
  public
    { Public declarations }
    procedure PreparaReporte(xestacion,xcaja,xturno:integer;xfecha:TDateTime;pswdetallado:boolean);
  end;

var
  FLIQCCAJAI: TFLIQCCAJAI;
  xtp:char;
  xlin:string;
  xsw:boolean;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS;

{$R *.DFM}

procedure TFLIQCCAJAI.PreparaReporte(xestacion,xcaja,xturno:integer;xfecha:TDateTime;pswdetallado:boolean);
var tot1,tot2:double;
    Lista:Array[1..5] of TStringList;
    i,j,xdiv,xmod,cont,nlista,tot:integer;
begin
  with DMGEN,DMCUP do begin
    xsw:=pswdetallado;
    pestacion:=xestacion;
    pcaja:=xcaja;
    pturno:=xturno;
    pfecha:=xfecha;
    QL_Caja.Close;
    QL_Caja.ParamByName('pestacion').AsInteger:=xestacion;
    QL_Caja.Prepare;
    QL_Caja.Open;
    RefrescaQuery(QL_Turc);
    if QL_Turc.IsEmpty then
      raise Exception.Create('No encuentro turno');
    QL_Serc2.Close;
    QL_Serc2.Prepare;
    QL_Serc2.Open;
    QL_Serc.Close;
    QL_Serc.ParamByName('pestacion').AsInteger:=pestacion;
    QL_Serc.ParamByName('pcaja').AsInteger:=pcaja;
    QL_Serc.ParamByName('pturno').AsInteger:=pturno;
    QL_Serc.ParamByName('pfecha').AsDateTime:=pfecha;
    QL_Serc.Prepare;
    QL_Serc.Open;
    tot1:=0; tot2:=0;
    try
      for i:=1 to 5 do
        Lista[i]:=TStringList.Create;
      while not QL_Serc.Eof do begin
        if not pswdetallado then xlin:='D//'
        else xlin:='M//';
        xlin:=xlin+IntToClaveNum(QL_SercSerie.AsInteger,4)+'//'+QL_SercDescripcion.AsString+'//'+
              FormatoMoneda(QL_SercImporte.AsFloat)+'//'+FormatFloat('##,##0',QL_SercCantidad.AsInteger)+'//'+
              FormatoMoneda(QL_SercTotal.AsFloat);
        BndDt.Items.Add(xlin);
        tot1:=tot1+QL_SercCantidad.AsInteger;
        tot2:=tot2+QL_SercTotal.AsFloat;
        if pswdetallado then begin
          QL_Rcup.Close;
          QL_Rcup.ParamByName('pestacion').AsInteger:=xestacion;
          QL_Rcup.ParamByName('pcaja').AsInteger:=xcaja;
          QL_Rcup.ParamByName('pturno').AsInteger:=xturno;
          QL_Rcup.ParamByName('pimporte').AsFloat:=QL_SercImporte.AsFloat;
          QL_Rcup.ParamByName('pfecha').AsDateTime:=xfecha;
          QL_Rcup.Prepare;
          QL_Rcup.Open;
          tot:=QL_Rcup.RecordCount;
          xdiv:=tot div 5;
          xmod:=tot mod 5;
          if xmod>0 then
            xdiv:=xdiv+1;
          for i:=1 to 5 do
            Lista[i].Clear;
          cont:=0;nlista:=1;
          while not QL_RCup.Eof do begin
            inc(cont);
            if cont>xdiv then begin
              cont:=1;
              inc(nlista);
            end;
            Lista[nlista].Add(InttoClaveNum(QL_RcupCupon.AsInteger,6));
            QL_Rcup.Next;
          end;
          for i:=0 to xdiv-1 do begin
            xlin:='D// //';
            for j:=1 to 5 do
              if lista[j].Count>i then
                xlin:=xlin+Lista[j].Strings[i]+'   ';
            BndDt.Items.Add(xlin);
          end;
          BndDt.Items.Add('');
        end;
        QL_Serc.Next;
      end;
    finally
      for i:=1 to 5 do
        Lista[i].Free;
    end;
    xlin:='T// //Total// //'+FormatFloat('###,##0',tot1)+'//'+FormatoMoneda(tot2);
    BndDt.Items.Add(xlin);
  end;
end;

procedure TFLIQCCAJAI.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN do begin
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:='Recuperación de Cupones - Corte de Caja';
    QRLEnca.Caption:='Turno: '+IntToClaveNum(pturno,2)+'  del '+FechaAlf(pfecha)+
                      '         Cajero:  '+UsuarioActivo+'           '+QL_TurcDescCaja.AsString;
    if QL_TurcEstatus.AsString='A' then QRLEstatus.Caption:='CORTE PARCIAL'
    else QRLEstatus.Caption:='';
    QRLEstacion.Caption:='Estación: '+QL_TurcNombreEstacion.AsString;
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;
  if PrinterActiva then
    QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
end;

procedure TFLIQCCAJAI.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);


  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with TQRLabel(FindComponent('QRLabel'+IntToStr(k))) do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Font.Size:=8;
        if (xtp='T')or(xtp='M') then Font.Style:=[fsBold];
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      TQRLabel(FindComponent('QRLabel'+IntToStr(k))).Caption:=ExtraeElemStr(xlin,k-9);
    end;
  end;

  procedure HabilitaShapes(ri,rf:integer;swenabled:boolean);
  var k:word;
  begin
    for k:=ri to rf do
      TQRShape(FindComponent('QRShape'+IntToStr(k))).Enabled:=swenabled;
  end;

begin
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(11,15);
  HabilitaShapes(8,9,false);
  ExtraeEtiquetas(11,15);
  Case xtp of
    'T':HabilitaShapes(8,9,true);
  end;
end;

procedure TFLIQCCAJAI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN do begin
    QL_Serc.close;
    QL_Serc2.close;
    QL_Rcup.close;
    QL_Turc.close;
  end;
end;

procedure TFLIQCCAJAI.QRLabel2Print(sender: TObject; var Value: String);
begin
  if xsw then Value:='DESCRIPCION / FOLIO'
  else Value:='DESCRIPCION';
end;

procedure TFLIQCCAJAI.QL_SercCalcFields(DataSet: TDataSet);
begin
  with DMGEN,DMGAS do begin
    Q_Auxi.Close;
    Q_AuxiEntero1.FieldKind:=fkInternalCalc;
    Q_Auxi.SQL.Clear;
    Q_Auxi.SQL.Add('Select count(*) as Entero1  from DGASRCUP');
    Q_Auxi.SQL.Add('Where Estacion='+IntToStr(QL_TurcEstacion.AsInteger));
    Q_Auxi.SQL.Add('  and Caja='+IntToStr(QL_TurcCaja.AsInteger));
    Q_Auxi.SQL.Add('  and Turno='+IntToStr(QL_TurcTurno.AsInteger));
    Q_Auxi.SQL.Add('  and Importe='+FloatToStr(QL_SercImporte.AsFloat));
    Q_Auxi.SQL.Add('  and Fecha="'+FechaToStrSQL(QL_TurcFecha.AsDateTime)+'"');
    Q_Auxi.Prepare;
    Q_Auxi.Open;
    QL_SercCantidad.AsInteger:=Q_AuxiEntero1.AsInteger;
    QL_SercTotal.AsFloat:=AjustaFloat(QL_SercImporte.AsFloat*QL_SercCantidad.AsInteger,2);
  end;
end;

procedure TFLIQCCAJAI.QL_TurcBeforeOpen(DataSet: TDataSet);
begin
  QL_Turc.ParamByName('pestacion').asinteger:=pestacion;
  QL_Turc.ParamByName('pcaja').asinteger:=pcaja;
  QL_Turc.ParamByName('pturno').asinteger:=pturno;
  QL_Turc.ParamByName('pfecha').asdatetime:=pfecha;
end;

procedure TFLIQCCAJAI.QL_TurcCalcFields(DataSet: TDataSet);
begin
  QL_TurcDescCaja.AsString:='Caja: '+IntToClaveNum(QL_TurcCaja.asinteger,2)+'-'+QL_TurcNombreCaja.AsString;
end;

end.
