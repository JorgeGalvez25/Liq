unit ULIQREP30;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRExport, QuickRpt, QRCtrls, ExtCtrls, Printers, DB, DBTables;

type
  TFLIQREP07 = class(TForm)
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
    BndDt: TQRStringsBand;
    ChildBand1: TQRChildBand;
    ChBEnca: TQRChildBand;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    QL_Aux: TQuery;
    QL_Tran: TQuery;
    QL_TranCLIENTE: TIntegerField;
    QL_TranVEHICULO: TIntegerField;
    QL_TranDESCRIPCION: TStringField;
    QL_TranKMS_INICIAL: TIntegerField;
    QL_TranKMS_FINAL: TIntegerField;
    QL_TranKMS_RECORRIDOS: TIntegerField;
    QL_TranLITROS: TFloatField;
    QL_TranRENDIMIENTOXLITRO: TFloatField;
    QL_TranNombreCliente: TStringField;
    QL_TranNOECONOMICO: TStringField;
    QL_TranTIPOVENTA: TStringField;
    QL_TranFOLIO: TIntegerField;
    QL_TranESTACION: TIntegerField;
    QL_AuxTIPOVENTA: TStringField;
    QL_AuxESTACION: TIntegerField;
    QL_AuxFOLIO: TIntegerField;
    QL_AuxISLA: TIntegerField;
    QL_AuxFECHA: TDateTimeField;
    QL_AuxCLIENTE: TIntegerField;
    QL_AuxVEHICULO: TIntegerField;
    QL_AuxCOMBUSTIBLE: TIntegerField;
    QL_AuxPRECIO: TFloatField;
    QL_AuxLITROS: TFloatField;
    QL_AuxTOTAL: TFloatField;
    QL_AuxESTATUS: TStringField;
    QL_AuxKILOMETRAJE: TIntegerField;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..8] of TQRLabel;
    tot,totg: array[1..5] of double;
    procedure CreaEtiquetas;
  public
    { Public declarations }
    procedure PreparaForma;
  end;
Const
  xLeft=6;
  NoEti=8;

var
  FLIQREP07: TFLIQREP07;
  xtp:char;
  xlin:string;
  xwa,xla:Array[1..NoEti] of integer;

implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     ULIBLICENCIAS, ULIQREP07P, DDMGEN_VTAS, UGASCONS09, UAVANCE;

{$R *.dfm}

{ TForm1 }

procedure TFLIQREP07.PreparaForma;
var
  xcte,xvehi:integer;
  xNomCte:string[50];
  i,cont,contG:integer;
  xkm,xltrs,xkmf,xrendi:Real;
  xfecha: TDateTime;
begin
  with DMGEN,DMGAS,DMGEN_VTAS,FLIQREP07P do
  begin
    QL_Tran.close;
    QL_Tran.SQL.Clear;
    QL_Tran.SQL.Add('select a.Tipoventa,a.folio,a.estacion,a.cliente,a.vehiculo,b.noeconomico,b.descripcion,min(a.kilometraje) as kms_inicial,max(a.kilometraje) as kms_final,');
    QL_Tran.SQL.Add('       max(a.kilometraje)-min(a.kilometraje) as kms_recorridos,sum(a.litros) as litros,');
    QL_Tran.SQL.Add('       (FLOOR(((max(a.kilometraje)-min(a.kilometraje))/sum(a.litros))*100+0.5)/100)  as rendimientoxlitro');
    QL_Tran.SQL.Add('       from dgastran a,dgastarj b');
    QL_Tran.SQL.Add('where not a.kilometraje is null and a.litros>0.001 ');
    if not CheckBox1.Checked then
      QL_Tran.SQL.Add(' and a.cliente='+IntToStr(xcliente));
    QL_Tran.SQL.Add('  and a.fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni))+' and');
    QL_Tran.SQL.Add('      a.fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin))+' and a.vehiculo=b.vehic and a.cliente=b.noclie');
    QL_Tran.SQL.Add('group by a.cliente,a.vehiculo,b.noeconomico,b.descripcion,a.Tipoventa,a.folio,a.estacion');
    QL_Tran.Prepare;
    QL_Tran.Open;
    CreaEtiquetas;
    BndDt.Items.Clear;
    for i:=1 to 5 do
      totg[i]:=0;
    contG:=0;
    QL_Tran.First;
    xcte:=QL_TranCLIENTE.AsInteger;
    FAVANCE.PreparaAvance('Preparando Reporte...',true,QL_Tran.RecordCount);
    while not QL_Tran.Eof do begin
      for i:=1 to 5 do
        tot[i]:=0;
      cont:=0;
      xlin:='E//'+IntToClaveNum(QL_TranCLIENTE.AsInteger,6)+' '+QL_TranNombreCliente.AsString;
      BndDt.Items.Add(xlin);
      xcte:=QL_TranCLIENTE.AsInteger;
      xvehi:=-1;
      while not(QL_Tran.Eof) and (xcte=QL_TranCLIENTE.AsInteger) do begin
        if xvehi<>QL_TranVEHICULO.AsInteger then begin
          xlin:='E//'+IntToClaveNum(QL_TranVEHICULO.AsInteger,3)+'-'+QL_TranNOECONOMICO.AsString+'-'+
                   QL_TranDESCRIPCION.AsString;
          BndDt.Items.Add(xlin);
          xcte:=QL_TranCLIENTE.AsInteger;
          xNomCte:=QL_TranNombreCliente.AsString;
          xvehi:=QL_TranVEHICULO.AsInteger;
          QL_Aux.Close;
          QL_Aux.SQL.Clear;
          QL_Aux.SQL.Add('Select * from DGASTRAN');
          QL_Aux.SQL.Add('Where Kilometraje>0 and litros>0');
          QL_Aux.SQL.Add('  and cliente='+inttostr(QL_TranCLIENTE.AsInteger));
          QL_Aux.SQL.Add('  and Vehiculo='+inttostr(QL_TranVEHICULO.AsInteger));
          QL_Aux.SQL.Add('  and Fecha<'+QuotedStr(FechaToStrSQL(VgFechaIni)));
          QL_Aux.SQL.Add('Order by Fecha desc');
          ql_aux.Prepare;
          QL_Aux.Open;
          xkm:=QL_AuxKILOMETRAJE.AsInteger;
          xltrs:=QL_AuxLITROS.AsFloat;
          xfecha:=QL_AuxFECHA.AsDateTime;

          QL_Aux.Close;
          QL_Aux.SQL.Clear;
          QL_Aux.SQL.Add('Select * from DGASTRAN');
          QL_Aux.SQL.Add('Where Kilometraje>0 and litros>0');
          QL_Aux.SQL.Add('  and cliente='+inttostr(QL_TranCLIENTE.AsInteger));
          QL_Aux.SQL.Add('  and Vehiculo='+inttostr(QL_TranVEHICULO.AsInteger));
          QL_Aux.SQL.Add('  and Fecha>='+QuotedStr(FechaToStrSQL(VgFechaIni)));
          QL_Aux.SQL.Add('  and Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
          QL_Aux.SQL.Add('Order by Cliente,Fecha');
          QL_Aux.Prepare;
          QL_Aux.Open;
          QL_Aux.First;
          if QL_Aux.RecordCount>0 then
          begin
            xlin:='E//'+QL_TranDESCRIPCION.AsString;
            while not QL_Aux.Eof do begin
              if xkm<0 then
                xkm:=QL_AuxKILOMETRAJE.AsInteger;
              if xltrs<0.001 then
                xltrs:=QL_AuxLITROS.AsFloat;

              xkmf:=QL_AuxKILOMETRAJE.AsInteger - xkm;
              xrendi:=xkmf/xltrs;
              xlin:='D//'+IntToClaveNum(QL_AuxESTACION.AsInteger,3)+'-'+QL_AuxTIPOVENTA.AsString+'-'+IntToClaveNum(QL_AuxFOLIO.AsInteger,6)+'//'+
                    DateToStr(xfecha)+'//'+DateToStr(QL_AuxFECHA.AsDateTime)+'//'+FormatFloat('#,###,#0.00',xkm)+'//'+
                    FormatFloat('#,###,#0.00',QL_AuxKILOMETRAJE.AsInteger)+'//'+ FormatFloat('#,###,#0.00',xkmf)+'//'+FormatFloat('#,###,#0.00',xltrs)+'//'+
                    FormatFloat('#,###,#0.00',xrendi);
              BndDt.Items.Add(xlin);
              tot[1]:=Tot[1]+xkm;
              tot[2]:=tot[2]+QL_AuxKILOMETRAJE.AsFloat;
              tot[3]:=Tot[3]+xkmf;
              tot[4]:=Tot[4]+xltrs;
              tot[5]:=Tot[5]+xrendi;
              xkm:=QL_AuxKILOMETRAJE.AsInteger;
              xltrs:=QL_AuxLITROS.AsFloat;
              xfecha:=QL_AuxFECHA.AsDateTime;
              QL_Aux.Next;
            end;
            inc(cont);
          end;
        end;          
        QL_Tran.Next;
        FAVANCE.AvanzaPosicion;
      end;
      xlin:='T//Total '+IntToClaveNum(xcte,6)+' '+xNomCte+'// // // // //'+FormatoMoneda(Tot[3])+'//'+FormatoMoneda(Tot[4])+'//'+FormatoMoneda(Tot[5]);
      BndDt.Items.Add(xlin);
      totG[1]:=totG[1]+tot[1];
      totG[2]:=totG[2]+tot[2];
      totG[3]:=totG[3]+tot[3];
      totG[4]:=totG[4]+tot[4];
      totG[5]:=totG[5]+tot[5]/cont;
      inc(contG);
    end;
    xlin:='T//Total General'+'// // // // //'+FormatoMoneda(Totg[3])+'//'+FormatoMoneda(Totg[4])+'//'+FormatoMoneda(Totg[5]);
    BndDt.Items.Add(xlin);
    QL_Tran.First;
    QL_Tran.EnableControls;
    FAVANCE.Close;
  end;    
end;

procedure TFLIQREP07.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEnca.Caption:=RangoFecha(VgFechaIni,VgFechaFin);
  end;
  QRLSistema.Caption:=IdSistNombre;
  QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
end;

procedure TFLIQREP07.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);

  procedure InicializaEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do
      with QRLabelDeta[k] do begin
        Caption:='';
        Font.Style:=[];
        Frame.DrawTop:=false;
        Frame.DrawBottom:=false;
        Font.Size:=8;
        Autosize:=False;
        if (k=2) or (k=3)then AutoSize:=True;
        width:=xwa[k];
        left:=xla[k];
        if k=1 then Alignment:=taCenter;
        if xtp='E' then begin
          Font.Size:=9;
          Font.Style:=[fsBold];
          if k=1 then begin
            Autosize:=true;
            Alignment:=taLeftJustify;
          end;
          if k>1 then left:=800;
        end;
        if xtp='T' then begin
          if k=1 then begin
            Autosize:=true;
            Alignment:=taLeftJustify;
          end;
          Font.Style:=[fsBold];
          if k>=5 then Frame.DrawTop:=true;
        end;
      end;
  end;

  procedure ExtraeEtiquetas(ri,rf:integer);
  var k:word;
  begin
    for k:=ri to rf do begin
      QRLabelDeta[k].Caption:=ExtraeElemStr(xlin,k-ri+2);
    end;
  end;

begin
  BndDt.Frame.DrawBottom:=false;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
end;

procedure TFLIQREP07.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP07.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFLIQREP07.Creaetiquetas;
var
  i,xl,xw:integer;
begin
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Documento';
        2:Caption:='Fecha Tran. Ant.';
        3:Caption:='Fecha';
///        3:Caption:='Descripcion';
        4:Caption:='Km. Inicial';
        5:Caption:='Km. Final';
        6:Caption:='Km. Rec.';
        7:Caption:='Litros';
        8:Caption:='Rend. por Ltr';

      end;
      Case i of
        1:xw:=110;
        2:xw:=95;
        3:xw:=70;
        4..5:xw:=70;
        6:xw:=90;
        7:xw:=85;
      end;
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taCenter;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=true;
      Frame.Width:=1;
    end;
    with QRLabelDeta[i] do begin
      Caption   :='';
      Autosize  :=false;
      Left      :=xl;
      Width     :=xw;
      Top       :=2;
      Alignment :=taRightJustify;
      Font.Name :='Arial';
      Font.Size :=8;
      Font.Style:=[];
      Frame.DrawTop:=false;
      Frame.DrawBottom:=false;
      Frame.DrawLeft:=false;
      Frame.DrawRight:=false;
      Frame.Width:=1;
      if i in [1..3] then Alignment :=taLeftJustify;
      xwa[i]:=xw;
      xla[i]:=xl;
    end;
    xl:=xl+xw+4;
  end;
end;

end.
