unit ULIQREP12;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Printers, Db, DBTables, StdCtrls, QRExport,
  QRAbsDatas, RxMemDS, DateUtils;

type
  TFLIQREP12 = class(TForm)
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
    QRLEstacion: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRCSVFilter1: TQRCSVFilter;
    ChBEnca: TQRChildBand;
    QL_Pval: TQuery;
    QL_Tran: TQuery;
    QL_PvalCLIENTE: TIntegerField;
    QL_PvalTOTAL: TFloatField;
    QL_TranCLIENTE: TIntegerField;
    QL_TranTOTAL: TFloatField;
    TT_Auxi: TRxMemoryData;
    TT_AuxiCliente: TIntegerField;
    TT_AuxiSaldoCXC: TFloatField;
    TT_AuxiVales: TFloatField;
    TT_AuxiTarjetas: TFloatField;
    QL_Clie: TQuery;
    QL_ClieNOCLIE: TIntegerField;
    TT_AuxiNombre: TStringField;
    QL_ClieNOMBRE: TStringField;
    QL_Sald: TQuery;
    QL_SaldNOCLIE: TIntegerField;
    QL_SaldLIMITECREDITO: TFloatField;
    QL_SaldADEUDOVALES: TFloatField;
    TT_AuxiLimiteCredito: TFloatField;
    TT_AuxiTotalAdeudo: TFloatField;
    TT_AuxiDisponible: TFloatField;
    QRLAnti: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta:array [1..8] of TQRLabel;
    procedure CreaEtiquetas;
    procedure DetallesCliente;
  public
    { Public declarations }
    xNoClie:Integer;
    procedure PreparaReporte;
  end;

Const
  xLeft=5;
  NoEti=8;

var
  FLIQREP12: TFLIQREP12;
  xtp:char;
  xlin:string;
  xAncho,xwid:integer;
  xTitulo:string;
  xPagTmp:Integer;
  xLinea:Integer;


implementation

uses DDMGEN, ULIBGRAL, UGEN_NET, ULIBDATABASE,DDMCUP,DDMGAS, DDMGASQ,
     DDMLIQ, UAVANCE, ULIBLICENCIAS, DDMCXC, ULIQREP12P, DDMGEN_VTAS, Master_intf;

{$R *.DFM}

procedure TFLIQREP12.CreaEtiquetas;
var i,xl,xw:integer;
begin
  xw:=xAncho;
  xl:=xLeft;
  for i:=1 to NoEti do begin
    QRLabelEnca[i] :=TQRLabel(ChBEnca.AddPrintable(TQRLabel));
    QRLabelDeta[i] :=TQRLabel(BndDt.AddPrintable(TQRLabel));
    xw:=xAncho;
    with QRLabelEnca[i] do begin
      Case i of
        1:Caption:='Clave';
        2:Caption:='Nombre';
        3:Caption:='Saldo CXC';
        4:Caption:='Vales Cred.';
        5:Caption:='Tarjetas';
        6:Caption:='Saldo Real';
        7:Caption:='Lím.Cred.';
        8:Caption:='Disponible';
      end;
      Case i of
        1:xw:=50;
        2:xw:=205;
        3:xw:=79;
        4:xw:=79;
        5:xw:=79;
        6:xw:=79;
        7:xw:=79;
        8:xw:=70;
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
      if i=NoEti then Frame.DrawRight:=false;
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
      if i in [1..2] then Alignment :=taLeftJustify;
    end;
    xl:=xl+xw+4;
  end;
  xwid:=xl;
end;

procedure TFLIQREP12.PreparaReporte;
var xsaldo:ULIBDATABASE.TSaldoCxc;
    xsaldoAnt1:ULIBDATABASE.TSaldoCxc;
    xsaldoAnt:Master_intf.TSaldoCxc;
    tot:Array[1..4] of real;
    sreal:real;
    i:word;
    Si,Ca,Sf:Double;
    MesAux, FechaAux:TDateTime;

begin
  with DMGEN_VTAS,DMGEN,DMLIQ,DMGAS,DMCXC,FLIQREP12P do begin
    xLinea:=0;
    xTitulo:='';
    xancho:=78;
    CreaEtiquetas;
    BndDt.Items.Clear;
    TT_Auxi.SortOnFields('Cliente',true,false);
    TT_Auxi.Active:=true;
    for i:=1 to 4 do
      tot[i]:=0;
    QL_Pval.Close;
    QL_Pval.SQL.Clear;
    QL_Pval.SQL.Add('Select Cliente,Sum(Total) as Total from DGASPVAL');
    QL_Pval.SQL.Add('where (((Facturado="No")');
    QL_Pval.SQL.Add('and (Fecha<="'+FechaToStrSQL(VgFechaFin)+'")');
    if not ChbTodasEstaciones.Checked then begin
      QL_Pval.SQl.Add('  and (estacion='+IntToStr(DBLookUpComboBox2.KeyValue)+'))');
    end
    else
      QL_Pval.SQL.Add(')');

    //Validacion para ampliar la busqueda de saldos si detecta un cambio de mes
    MesAux:=MonthOf(VgFechaFin);
    FechaAux:=IncDay(VgFechaFin, 1);
    if (MonthOf(FechaAux) <> MesAux) then
      QL_Pval.SQL.Add('   or ((Fecha<="'+FechaToStrSQL(VgFechaFin)+'") and (Facturado="Si") and (Fechafactura>"'+FechaToStrSQL(FechaAux)+'")')
    else
      QL_Pval.SQL.Add('   or ((Fecha<="'+FechaToStrSQL(VgFechaFin)+'") and (Facturado="Si") and (Fechafactura>"'+FechaToStrSQL(VgFechaFin)+'")');

    if not ChbTodasEstaciones.Checked then begin
      QL_Pval.SQL.Add('  and (estacion='+IntToStr(DBLookUpComboBox2.KeyValue)+')))');
    end
    else
      QL_Pval.SQL.Add('))');
    if xNoClie>0 then begin
      QL_Pval.SQL.Add('  and Cliente='+IntToStr(xNoClie));
    end;
    QL_Pval.SQL.Add('Group by Cliente');
    QL_Pval.SQL.Add('Order by Cliente');
    QL_Pval.Prepare;
    QL_Pval.Open;
    try
      FAvance.PreparaAvance('Clientes de Vales...',true,QL_Pval.RecordCount);
      while not QL_Pval.Eof do begin
        TT_Auxi.Insert;
        TT_AuxiCliente.AsInteger:=QL_PvalCliente.AsInteger;
        if LocalizaTabla(TV_Clie,'NoClie',TT_AuxiCliente.asinteger) then
          TT_AuxiNombre.AsString:=TV_ClieNombre.AsString;
        TT_AuxiVales.AsFloat:=QL_PvalTotal.AsFloat;
        TT_AuxiSaldoCXC.AsFloat:=0;
        TT_AuxiTarjetas.AsFloat:=0;
        TT_Auxi.Post;
        Favance.AvanzaPosicion;
        QL_PVal.Next;
      end;
    finally
      FAvance.Close;
    end;
    QL_Tran.Close;
    QL_Tran.SQL.Clear;
    QL_Tran.SQl.Add('Select Cliente,Sum(Total) as Total from DGASTRAN');
    QL_Tran.SQl.Add('where ((Facturado="No" and Fecha<="'+FechaToStrSQL(VgFechaFin)+'")');
    //Validacion para ampliar la busqueda de saldos si detecta un cambio de mes
    if (MonthOf(FechaAux) <> MesAux) then
      QL_Tran.SQL.Add('   or (Fecha<="'+FechaToStrSQL(VgFechaFin)+'" and Facturado="Si" and Fechafactura>"'+FechaToStrSQL(FechaAux)+'"))')
    else
      QL_Tran.SQL.Add('   or (Fecha<="'+FechaToStrSQL(VgFechaFin)+'" and Facturado="Si" and Fechafactura>"'+FechaToStrSQL(VgFechaFin)+'"))');
      
    QL_Tran.SQL.Add(' and estatus="A" and TipoVenta="CR"');
    if xNoClie>0 then begin
      QL_Tran.SQL.Add('  and Cliente='+IntToStr(xNoClie));
    end;
    if not ChbTodasEstaciones.Checked then
      QL_Tran.SQl.Add('and estacion='+IntToStr(DBLookUpComboBox2.KeyValue));
    QL_Tran.SQL.Add('Group by Cliente');
    QL_Tran.SQL.Add('Order by Cliente');
    QL_Tran.Prepare;
    QL_Tran.Open;
    try
      FAvance.PreparaAvance('Clientes de Tarjetas...',true,QL_Tran.RecordCount);
      while not QL_Tran.Eof do begin
        if not TT_Auxi.Locate('Cliente',QL_TranCliente.AsInteger,[]) then begin
          TT_Auxi.Insert;
          TT_AuxiCliente.AsInteger:=QL_TranCliente.AsInteger;
          if LocalizaTabla(TV_Clie,'NoClie',TT_AuxiCliente.asinteger) then
            TT_AuxiNombre.AsString:=TV_ClieNombre.AsString;
          TT_AuxiTarjetas.AsFloat:=QL_TranTotal.AsFloat;
          TT_AuxiSaldoCXC.AsFloat:=0;
          TT_AuxiVales.AsFloat:=0;
        end
        else begin
          TT_Auxi.Edit;
          TT_AuxiTarjetas.AsFloat:=TT_AuxiTarjetas.AsFloat+QL_TranTotal.AsFloat;
        end;
        TT_Auxi.Post;
        FAvance.AvanzaPosicion;
        QL_Tran.Next;
      end;
    finally
      FAvance.Close;
    end;


    if (FLIQREP12P.CheckBox1.Checked) or ((not FLIQREP12P.CheckBox1.Checked) and (xNoClie > 0)) then begin

      QL_Clie.Close;
      QL_Clie.SQL.Clear;
      QL_Clie.SQL.Add('Select NoClie,Nombre from DGENCLIE');
      QL_Clie.SQL.Add('where NoClie in (Select NoClie from DCXCSCXC)');
      if xNoClie>0 then begin
        QL_Clie.SQL.Add('  and NoClie='+IntToStr(xNoClie));
      end;
      QL_Clie.SQL.Add('Order by NoClie');
      QL_Clie.Prepare;
      QL_Clie.Open;
      try
        FAvance.PreparaAvance('Clientes de CXC...',true,QL_Clie.RecordCount);
        while not QL_Clie.Eof do begin
          if not TT_Auxi.Locate('Cliente',QL_ClieNoClie.AsInteger,[]) then begin
            TT_Auxi.Insert;
            TT_AuxiCliente.AsInteger:=QL_ClieNoClie.AsInteger;
            TT_AuxiNombre.AsString:=QL_ClieNombre.AsString;
            TT_AuxiTarjetas.AsFloat:=0;
            TT_AuxiSaldoCXC.AsFloat:=0;
            TT_AuxiVales.AsFloat:=0;
            TT_Auxi.Post;
          end;

          FAvance.AvanzaPosicion;
          QL_Clie.Next;
        end;
      finally
        FAvance.Close;
      end;
      //limites de credito y disponibles
      QL_Sald.Close;
      QL_Sald.SQL.Clear;
      QL_Sald.SQL.Add('Select NoClie,LimiteCredito, AdeudoVales from DGASSALD');
      QL_Sald.SQL.Add('where TipoTarjeta='+QuotedStr('CR'));
      if xNoClie>0 then begin
        QL_Sald.SQL.Add('  and NoClie='+IntToStr(xNoClie));
      end;
      QL_Sald.SQL.Add('Order by NoClie');
      QL_Sald.Prepare;
      QL_Sald.Open;
      try
        FAvance.PreparaAvance('Preparando reporte...',true,QL_Sald.RecordCount);
        //if not CheckBox3.Checked then begin
          while not QL_Sald.eof do begin
            if TT_Auxi.Locate('Cliente',QL_SaldNOCLIE.AsInteger,[]) then begin
              TT_Auxi.Edit;
              if not ChbTodasEstaciones.Checked then
                SaldoCxcClieSucl(TT_AuxiCliente.Asinteger,MonedaNac,VgFechaFin,VgFechaFin,xsaldo,DBLookUpComboBox2.KeyValue)
              else
                SaldoCxcClie(TT_AuxiCliente.Asinteger,MonedaNac,VgFechaFin,VgFechaFin,xsaldo);
              TT_AuxiLimiteCredito.AsFloat:=QL_SaldLimiteCredito.AsFloat;
              TT_AuxiTotalAdeudo.AsFloat:=xsaldo.SaldoFin+QL_SaldAdeudoVales.AsFloat;
              TT_AuxiDisponible.AsFloat:=TT_AuxiLimiteCredito.AsFloat-TT_AuxiTotalAdeudo.AsFloat;
              if not Checkbox2.Checked then TT_Auxi.Post
              else begin
                if TT_AuxiDisponible.AsFloat<0.001 then TT_Auxi.Post
                else TT_Auxi.Cancel;
              end;
            end;
            Favance.AvanzaPosicion;
            QL_Sald.Next;
          end;
        finally
          FAvance.Close;
        end;
    end
    else begin
      //clientes de tarjeas saldo cero
      if chkClientesSaldoCero.Checked then begin
        DMGAS.Q_Auxi.Close;
        DMGAS.Q_Auxi.SQL.Clear;
        DMGAS.Q_AuxiEntero1.FieldKind:=fkInternalCalc;
        DMGAS.Q_Auxi.SQL.Add('Select distinct Cliente as Entero1 from DGASPVAL');
        if xNoClie>0 then begin
          DMGAS.Q_Auxi.SQL.Add('Where NoClie='+IntToStr(xNoClie));
        end;
        DMGAS.Q_Auxi.SQL.Add('Order by Cliente');
        DMGAS.Q_Auxi.Prepare;
        DMGAS.Q_Auxi.Open;
        try
          FAvance.PreparaAvance('Clientes de vales...',true,DMGAS.Q_Auxi.RecordCount);
          while not DMGAS.Q_Auxi.Eof do begin
            if not TT_Auxi.Locate('Cliente',DMGAS.Q_AuxiEntero1.AsInteger,[]) then begin
              TT_Auxi.Insert;
              TT_AuxiCliente.AsInteger:=DMGAS.Q_AuxiEntero1.AsInteger;
              if LocalizaTabla(TV_Clie,'NoClie',DMGAS.Q_AuxiEntero1.AsInteger) then
                TT_AuxiNombre.AsString:=TV_ClieNombre.AsString;
              TT_AuxiTarjetas.AsFloat:=0;
              TT_AuxiSaldoCXC.AsFloat:=0;
              TT_AuxiVales.AsFloat:=0;
              TT_Auxi.Post;
            end;
            FAvance.AvanzaPosicion;
            DMGAS.Q_Auxi.Next;
          end;
        finally
          FAvance.Close;
        end;
      end;
    end;
    Case FLIQREP12P.ComboBox2.ItemIndex of
      0:TT_Auxi.SortOnFields('Cliente',true,false);
      1:TT_Auxi.SortOnFields('Nombre',true,false);
    end;
    TT_Auxi.First;
    FAvance.PreparaAvance('Preparando reporte...',true,TT_Auxi.RecordCount);
    try
      while not TT_Auxi.Eof do begin
        if not CheckBox3.Checked then begin
          if not ChbTodasEstaciones.Checked then begin
            //marcar el check y obtener los datos igual que el cxc con eso CAMBIO JUAN JOSE RIOS
            if (CheckBox4.Checked) then begin
              SaldoCxcCliePendietes(TT_AuxiCliente.Asinteger,MonedaNac,VgFechaFin,xsaldo,DBLookUpComboBox2.KeyValue);
            end else begin
              SaldoCxcClieSucl(TT_AuxiCliente.Asinteger,MonedaNac,VgFechaFin,VgFechaFin,xsaldo,DBLookUpComboBox2.KeyValue);
            end;
          end else begin
              SaldoCxcClie(TT_AuxiCliente.Asinteger,MonedaNac,VgFechaFin,VgFechaFin,xsaldo);
          end;

          sreal:=xsaldo.SaldoFin+TT_AuxiVales.AsFloat+TT_AuxiTarjetas.AsFloat;
          xlin:='D//'+IntToClaveCata(TT_AuxiCliente.AsInteger,idClie)+'//'+TT_AuxiNombre.AsString+'//'+
                      FormatoMoneda(xsaldo.SaldoFin)+'//'+FormatoMoneda(TT_AuxiVales.AsFloat)+'//'+FormatoMoneda(TT_AuxiTarjetas.AsFloat)+'//'+FormatoMoneda(sreal)+'//';
                      if TT_AuxiLimiteCredito.AsFloat<>0.00 then
                        xlin:=xlin+FormatoMoneda(TT_AuxiLimiteCredito.AsFloat)+'//'
                      else
                        xlin:=xlin+'//';
                      if TT_AuxiLimiteCredito.AsFloat-abs(sreal)>0.00 then
                        xlin:=xlin+FormatoMoneda(TT_AuxiLimiteCredito.AsFloat-abs(sreal))
//                      if TT_AuxiDisponible.AsFloat<>0.00 then
//                        xlin:=xlin+FormatoMoneda(TT_AuxiDisponible.AsFloat)
                      else
                        xlin:=xlin+'//';
          if (abs(sreal)>0.001)or(chkClientesSaldoCero.Checked) then begin
            BndDt.Items.Add(xlin);
            Inc(xLinea);
          end;
          tot[1]:=tot[1]+xsaldo.SaldoFin;
          tot[2]:=tot[2]+TT_AuxiVales.AsFloat;
          tot[3]:=tot[3]+TT_AuxiTarjetas.AsFloat;
          tot[4]:=tot[4]+sreal;
        end
        else begin
           if not ChbTodasEstaciones.Checked then begin
              SaldoCxcClieSucl(TT_AuxiCliente.Asinteger,MonedaNac,VgFechaFin,VgFechaFin,xsaldo,DBLookUpComboBox2.KeyValue);
           end else begin
              SaldoCxcClie(TT_AuxiCliente.Asinteger,MonedaNac,VgFechaFin,VgFechaFin,xsaldo);
            end;

          //calculo de anticipos
          if((dmgen.QT_EmprSERIEKEY.AsInteger = 0) or (dmgen.QT_EmprSERIEKEY.AsInteger = 151)or (dmgen.QT_EmprSERIEKEY.AsInteger = 61))then begin
            dmgas.SaldoCxcAntClie(TT_AuxiCliente.AsInteger, MonedaNac, VgFechaFin, VgFechaFin, xsaldoAnt);
          end
          else begin
            dmcxc.SaldoCxcAntClie(TT_AuxiCliente.AsInteger, MonedaNac, VgFechaFin, VgFechaFin, xsaldoAnt1);
            xsaldoAnt := Master_intf.TSaldoCXC.Create;
            xsaldoAnt.SaldoIni := xsaldoAnt1.SaldoIni;
            xsaldoAnt.CargosPer := xsaldoAnt1.CargosPer;
            xsaldoAnt.AbonosPer := xsaldoAnt1.AbonosPer;
            xsaldoAnt.SaldoFin :=  xsaldoAnt1.SaldoFin;
          end;

          if xsaldoAnt.SaldoIni>0 then
            Si:=xsaldo.SaldoIni-xsaldoAnt.SaldoIni
          else
            Si:=xsaldo.SaldoIni+xsaldoAnt.SaldoIni;
          Ca:=xsaldo.CargosPer+xsaldoAnt.CargosPer;

          Sf:= (Si+Ca)-(xsaldo.AbonosPer+ xsaldoAnt.AbonosPer);
//          sreal:=xsaldo.SaldoFin+TT_AuxiVales.AsFloat+TT_AuxiTarjetas.AsFloat;
          sreal:=Sf+(TT_AuxiVales.AsFloat+TT_AuxiTarjetas.AsFloat);

          xlin:='D//'+IntToClaveCata(TT_AuxiCliente.AsInteger,idClie)+'//'+TT_AuxiNombre.AsString+'//'+
                      FormatoMoneda(Sf)+'//'+FormatoMoneda(TT_AuxiVales.AsFloat)+'//'+FormatoMoneda(TT_AuxiTarjetas.AsFloat)+'//'+FormatoMoneda(sreal)+'//';
                      if TT_AuxiLimiteCredito.AsFloat<>0.00 then
                        xlin:=xlin+FormatoMoneda(TT_AuxiLimiteCredito.AsFloat)+'//'
                      else
                        xlin:=xlin+'//';
                      if TT_AuxiDisponible.AsFloat<>0.00 then
                        xlin:=xlin+FormatoMoneda(TT_AuxiDisponible.AsFloat)
                      else
                        xlin:=xlin+'//';
          if abs(sreal)>0.001 then begin
            BndDt.Items.Add(xlin);
            Inc(xLinea);
          end;
          tot[1]:=tot[1]+Sf;
          tot[2]:=tot[2]+TT_AuxiVales.AsFloat;
          tot[3]:=tot[3]+TT_AuxiTarjetas.AsFloat;
          tot[4]:=tot[4]+sreal;
        end;
        FAvance.AvanzaPosicion;
        TT_Auxi.Next;
      end;
    finally
      FAvance.Close;
    end;
    xlin:='T// // //';
    for i:=1 to 4 do
      xlin:=xlin+FormatoMoneda(tot[i])+'//';
    BndDt.Items.Add(xlin);
    Inc(xLinea);
    if xNoClie>0 then
      DetallesCliente;
  end;
end;

procedure TFLIQREP12.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  with DMGEN,DMGASQ do begin
    if PrinterActiva then
      QuickRep1.PrinterSettings.PrinterIndex:=Printer.PrinterIndex;
    QRLEmp.Font.Color:=StringtoColor(QT_EmprColor.Asstring);
    QRLEmp.Caption:=QT_EmprRazonSocial.AsString;
    QRLDir.Caption:=QT_EmprDireccion.AsString+'    '+QT_EmprPoblacion.Asstring+'    '+QT_EmprRFC.AsString;
    QRLRep.Caption:=Caption;
    QRLEstacion.Caption:=FLIQREP12P.DBLookupComboBox2.Text;
    if FLIQREP12P.CheckBox3.Checked then
      QRLAnti.Caption:='Incluye Anticipos'
    else
      QRLAnti.Caption:='';
    if FLIQREP12P.ChbTodasEstaciones.Checked then QRLEstacion.Caption:='Todas las Estaciones';
    QRLEnca.Caption:='Al '+FechaAlf(VgFEchaFin);
    QRLSistema.Caption:=IdSistNombre;
    QRLFechaHora.Caption:=SetFechaHora(VsFechaEnRep);
  end;
end;

procedure TFLIQREP12.BndDtBeforePrint(Sender: TQRCustomBand;
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
        Transparent:=False;
        Autosize:=False;
        //Acomoda etiquetas cuando es la impresión <<<INICIO>>>
        if BndDt.Index=0 then begin
          case k of
            1:left:=5;
            2:begin
                left:=54;
                Alignment :=taLeftJustify;
                Width:=205;
              end;
            3:left:=269;
            4:left:=352;
            5:left:=431;
            6:left:=510;
            7:left:=599;
            8:left:=678;
          end;
        end;
        //Acomoda etiquetas cuando es la impresión <<<FIN>>>
        if xtp='E' then begin
          Font.Style:=[fsBold,fsUnderline];
        end;
        if xtp='T' then begin
          Font.Style:=[fsBold];
          if k>2 then Frame.DrawTop:=true;
        end;
        if xtp='Z' then begin
          Font.Style:=[fsBold];
          if k=5 then Frame.DrawTop:=true;
        end;
        if xtp='X' then begin
          Font.Style:=[fsBold];
          if k=2 then Frame.DrawTop:=true;
        end;
        if xtp='C' then begin
          Font.Style:=[fsBold];
          if k=1 then begin
            Width:=100;
          end
          else if k=2 then begin
//            Autosize:=True;
            Width:= 62;
//            Transparent:=True;
            Left:= 103
          end
          else if k=3 then begin
            Width:= 100;
            Alignment :=taRightJustify;
//            Transparent:=True;
            Left:= 170
          end
          else if k=4 then begin
            Width:= 100;
            Alignment :=taRightJustify;
            Left:= 295
          end
          else if k=5 then begin
            Width:= 100;
            Left:= 400
          end
        end;
        if xtp='I' then begin
          Font.Style:=[fsBold];
          if k=3 then begin
            Alignment :=taLeftJustify;
            Left:= 175
          end
          else if k=4 then begin
            Alignment :=taLeftJustify;
            Width:= 150;
            Left:= 300
          end
          else if k=5 then begin
            Width:= 50;
            Left:= 451
          end
        end;
        if xtp='V' then begin
          Font.Style:=[fsBold];
//          Autosize:=True;
          if K=2 then
            Alignment :=taRightJustify;
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
//  if BndDt.Index = 56 then begin
//    BndDt.Items.Insert(BndDt.Index,xTitulo);
//    xlin:=BndDt.Item;//xTitulo;
//    xtp:=StrtoChar(ExtraeElemStr(xlin,1));
//    InicializaEtiquetas(1,NoEti);
//    ExtraeEtiquetas(1,NoEti);
//  end;
  BndDt.Frame.DrawBottom:=false;
  xlin:=BndDt.Item;
  xtp:=StrtoChar(ExtraeElemStr(xlin,1));
  InicializaEtiquetas(1,NoEti);
  ExtraeEtiquetas(1,NoEti);
  if xtp='C' then
    xTitulo:=xlin
  else if xtp='I' then
    xTitulo:=xlin
  else if xtp='V' then
    xTitulo:=xlin;
  xPagTmp:=QuickRep1.PageNumber;
end;

procedure TFLIQREP12.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand:=xtp='T';
end;

procedure TFLIQREP12.FormDestroy(Sender: TObject);
begin
  with DMGEN do begin
    QL_Pval.Close;
    QL_Tran.Close;
  end;
end;

procedure TFLIQREP12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFLIQREP12.DetallesCliente;
var
  xsaldoCxc:Real;
  xCargo,xAbono:Real;
  xTotTarj:Real;
  xTotVales:Real;
begin
  BndDt.Items.Add('D//');
  Inc(xLinea);
  BndDt.Items.Add('C//Saldo CXC');
  Inc(xLinea);
  xlin:='C//Documento //Fecha //Cargo //Abono //Saldo';
  BndDt.Items.Add(xlin);
  Inc(xLinea);
  with DMGEN_VTAS do begin
    try
      Q_Auxi.Close;
      Q_AuxiEntero2.FieldKind:=fkInternalCalc;
      Q_AuxiStr2.FieldKind:=fkInternalCalc;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiDate1.FieldKind:=fkInternalCalc;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_AuxiReal2.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT c.SUCURSAL as Entero2, c.TIPOMOV as Str2, c.FOLIO as Entero1, c.FECHA as Date1, c.IMPORTEMN as Real1, ');
      Q_Auxi.SQL.Add('      (select sum(coalesce(a.importemn,0)) from DCXCABON a ');
      Q_Auxi.SQL.Add('       Where a.suclcar=c.sucursal and a.tipocar=c.tipomov and a.foliocar=c.folio and a.aplicado='+QuotedStr('Si')+') as Real2 ');
      Q_Auxi.SQL.Add(' FROM DCXCCARG c ');
      Q_Auxi.SQL.Add('WHERE NOCLIE = '+IntToStr(xNoClie));
      Q_Auxi.SQL.Add('  AND FECHA<='+QuotedStr(FechaToStrSQL(VgFechaFin)));
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      xsaldoCxc:=0;
      While not Q_Auxi.Eof do begin
        if Abs(Q_AuxiReal1.AsFloat-Q_AuxiReal2.AsFloat)>0.009 then begin
          xCargo:=Q_AuxiReal1.AsFloat;
          xAbono:=Q_AuxiReal2.AsFloat;
  //        if Q_AuxiStr15.AsString='C' then
  //          xCargo:=Q_AuxiReal1.AsFloat
  //        else
  //          xAbono:=Q_AuxiReal1.AsFloat;
          if (xLinea=56) or (xLinea=112) then begin
            xlin:='C//Documento //Fecha //Cargo //Abono //Saldo';
            BndDt.Items.Add(xlin);
            Inc(xLinea);
          end;
          xlin:='D//'+IntToClaveNum(Q_AuxiEntero2.AsInteger,2)+'-'+Q_AuxiStr2.AsString+'-'+IntToClaveNum(Q_AuxiEntero1.AsInteger,7)+'//'+
                FechaPaq(Q_AuxiDate1.AsDateTime)+'//'+FormatoMoneda(xCargo)+'//'+
                FormatoMoneda(xAbono)+'//'+FormatoMoneda(xCargo-xAbono);
          BndDt.Items.Add(xlin);
          Inc(xLinea);
          xsaldoCxc:=xsaldoCxc+(xCargo-xAbono);
        end;
        Q_Auxi.Next;
      end;
      if xsaldoCxc>0 then begin
        xlin:='Z//Total Saldo // // // //'+FormatoMoneda(xsaldoCxc);
        BndDt.Items.Add(xlin);
        Inc(xLinea);
      end;
    finally
      Q_Auxi.Close;
    end;
  end;
  with DMGAS do begin
    BndDt.Items.Add('D//');
    Inc(xLinea);
    BndDt.Items.Add('I//Tarjetas Pendiente');
    Inc(xLinea);
    xlin:='I//Documento //Fecha //Tarjeta //Descripción //Total';
    BndDt.Items.Add(xlin);
    Inc(xLinea);
    try
      Q_Auxi.Close;
      Q_AuxiEntero1.FieldKind:=fkInternalCalc;
      Q_AuxiStr2.FieldKind:=fkInternalCalc;
      Q_AuxiEntero2.FieldKind:=fkInternalCalc;
      Q_AuxiDate1.FieldKind:=fkInternalCalc;
      Q_AuxiStr10.FieldKind:=fkInternalCalc;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_AuxiStr6_2.FieldKind:=fkInternalCalc;
      Q_Auxi.SQL.Clear;
      Q_Auxi.SQL.Add('SELECT T.ESTACION as Entero1, T.TIPOVENTA as Str2, T.FOLIO as Entero2, T.HORA AS Date1, V.DESCRIPCION as Str10, ');
      Q_Auxi.SQL.Add('       COALESCE(T.TOTAL, 0) AS Real1, ');
      Q_Auxi.SQL.Add('       V.CODIGO as Str6_2 FROM DGASTRAN T ');
      Q_Auxi.SQL.Add('       LEFT JOIN DGASTARJ V ');
      Q_Auxi.SQL.Add('       ON T.CLIENTE = V.NOCLIE ');
      Q_Auxi.SQL.Add('       AND T.VEHICULO = V.VEHIC ');
      Q_Auxi.SQL.Add('       LEFT JOIN DGASESTS E ');
      Q_Auxi.SQL.Add('       ON T.ESTACION = E.CLAVE ');
      Q_Auxi.SQL.Add('WHERE ((Facturado='+QuotedStr('No')+' and Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin))+') ');
      Q_Auxi.SQL.Add('       or (Fecha<='+QuotedStr(FechaToStrSQL(VgFechaFin))+' and Facturado="Si" and Fechafactura>'+QuotedStr(FechaToStrSQL(VgFechaFin))+')) ');
      Q_Auxi.SQL.Add('  AND T.CLIENTE = '+IntToStr(xNoClie));
      Q_Auxi.SQL.Add('  AND T.ESTATUS = '+QuotedStr('A'));
      Q_Auxi.SQL.Add('  AND T.TIPOVENTA = '+QuotedStr('CR'));
      Q_Auxi.SQL.Add('  ORDER BY T.HORA, T.ESTACION, T.TIPOVENTA, T.FOLIO');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      xTotTarj:=0;
      While not Q_Auxi.Eof do begin
        if (xLinea=56) or (xLinea=112) then begin
          xlin:='I//Documento //Fecha //Tarjeta //Descripción //Total';
          BndDt.Items.Add(xlin);
          Inc(xLinea);
        end;
        xlin:='D//'+IntToClaveNum(Q_AuxiEntero1.AsInteger,2)+'-'+Q_AuxiStr2.AsString+'-'+IntToClaveNum(Q_AuxiEntero2.AsInteger,6)+'//'+FechaPaq(Q_AuxiDate1.AsDateTime)+'//'+
              Q_AuxiStr6_2.AsString+'//'+Q_AuxiStr10.AsString+'//'+FormatoMoneda(Q_AuxiReal1.AsFloat);
        BndDt.Items.Add(xlin);
        Inc(xLinea);
        xTotTarj:=xTotTarj+Q_AuxiReal1.AsFloat;
        Q_Auxi.Next;
      end;
      if xTotTarj>0 then begin
        xlin:='Z//Total Tarjetas // // // //'+FormatoMoneda(xTotTarj);
        BndDt.Items.Add(xlin);
        Inc(xLinea);
      end;
    finally
      Q_Auxi.Close;
    end;

    BndDt.Items.Add('D//');
    Inc(xLinea);
    BndDt.Items.Add('V// Vales Cred.');
    Inc(xLinea);
    xlin:='V//Fecha Documento //Total';
    BndDt.Items.Add(xlin);
    Inc(xLinea);
    try
      Q_Auxi.Close;
      Q_AuxiDate1.FieldKind:=fkInternalCalc;
      Q_AuxiReal1.FieldKind:=fkInternalCalc;
      Q_Auxi.sql.Clear;
      Q_Auxi.SQL.Add('SELECT FECHA as Date1, TOTAL as Real1 FROM DGASPVAL ');
      Q_Auxi.SQL.Add('WHERE CLIENTE = '+IntToStr(xNoClie));
      Q_Auxi.SQL.Add('  AND FACTURADO = '+QuotedStr('No'));
      Q_Auxi.SQL.Add('  AND FECHA <= '+QuotedStr(FechaToStrSQL(VgFechaFin)));
      Q_Auxi.SQL.Add('ORDER BY FECHA');
      Q_Auxi.Prepare;
      Q_Auxi.Open;
      xTotVales:=0;
      While not Q_Auxi.Eof do begin
        if (xLinea=56) or (xLinea=112) then begin
          xlin:='V//Fecha Documento //Total';
          BndDt.Items.Add(xlin);
          Inc(xLinea);
        end;
        xlin:='D//'+FechaPaq(Q_AuxiDate1.AsDateTime)+'//'+FormatoMoneda(Q_AuxiReal1.AsFloat);
        BndDt.Items.Add(xlin);
        Inc(xLinea);
        xTotVales:=xTotVales+Q_AuxiReal1.AsFloat;
        Q_Auxi.Next;
      end;
      if xTotVales>0 then begin
        xlin:='X//Total Vales // '+FormatoMoneda(xTotVales);
        BndDt.Items.Add(xlin);
      end;
    finally
      Q_Auxi.Close;
    end;
  end;

end;

end.
