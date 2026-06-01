unit ULIQREP39;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, QRExport, Db, QRPDFFilt;

type
  TFLIQREP39 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand3: TQRBand;
    QRLEmp: TQRLabel;
    QRLDir: TQRLabel;
    QRLRep: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData1: TQRSysData;
    QRLRango: TQRLabel;
    CHBEnca: TQRChildBand;
    BndDt: TQRStringsBand;
    QRBand4: TQRBand;
    QRLFechaHora: TQRLabel;
    QRLSistema: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRCSVFilter1: TQRCSVFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure BndDtBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    QRLabelEnca,
    QRLabelDeta: array [1..7] of TQRLabel;
    pSwNegritas: Boolean;
    procedure IniciaEtiquetasProd;
    procedure CreaEtiquetas(xCrear:Boolean);
    function ObtenerDescripcionProducto(var clave: Integer): String;
  public
    { Public declarations }
    Estacion: Integer;
    Turno: Integer;
    Isla: Integer;
    procedure PreparaReporte;
  end;

Const
  xLeft = 5;

var
  FLIQREP39: TFLIQREP39;
  xtp: char;
  xlin: string;
  xw, xl,
  xtipo: integer;
  swaceites: boolean;

implementation

{$R *.dfm}

uses ULIBDATABASE, ULIBGRAL, DDMGEN, DDMGAS, ULIQREP39P, DDMLIQ;

procedure TFLIQREP39.CreaEtiquetas(xCrear:Boolean);
var i, lng: integer;
begin
  xw := 88;
  xl := xLeft;

  for i := 1 to 7 do begin
    if xCrear then begin
      QRLabelEnca[i] := TQRLabel(ChBEnca.AddPrintable(TQRLabel));
      QRLabelDeta[i] := TQRLabel(BndDt.AddPrintable(TQRLabel));
    end;

    with QRLabelEnca[i] do begin
      Case i of
        1: Caption := 'Dispensario/Combustible';
        2: Caption := 'Lect. Inicial  ';
        3: Caption := 'Lect. Final  ';
        4: Caption := 'Litros  ';
        5: Caption := 'Calibración  ';
        6: Caption := 'Ventas  ';
        7: Caption := 'Importe';
      end;

      if i = 1 then xw := 170;
      if i in [2..7] then xw := 85;

      Autosize := False;
      Left := xl;
      Width := xw;
      Top := 2;

      if i = 1 then Alignment := taLeftJustify //taRightJustify
      else Alignment := taRightJustify;

      Font.Name := 'Arial';
      Font.Size := 8;
      Font.Style := [];
      Frame.DrawTop := False;
      Frame.DrawBottom := False;
      Frame.DrawLeft := False;

      if i in [0, 7] then Frame.DrawRight := False
      else Frame.DrawRight := True;

      Frame.Width := 1;
    end;

    with QRLabelDeta[i] do begin
      Caption := '';
      Autosize := False;
      Left := xl;
      Width := xw;
      Top := 2;

      if i = 1 then Alignment := taLeftJustify
      else Alignment := taRightJustify;

      Font.Name := 'Arial';
      Font.Size := 8;
      Font.Style:= [];
      Frame.DrawTop := False;
      Frame.DrawBottom := False;
      Frame.DrawLeft := False;
      Frame.DrawRight := False;
      Frame.Width := 1;
    end;

    xl := xl + xw + 4;
  end;
end;

procedure TFLIQREP39.IniciaEtiquetasProd;
var i: Word;
begin
  xl := xLeft;

  for i := 1 to 7 do begin
    with QRLabelEnca[i] do begin

      if i = 2 then begin
        xw := 210;
        Frame.DrawRight := True;
        Alignment := taLeftJustify;
      end;

      if i in [1] then xw := 75;
      if i in [3..6] then xw := 75;
      if i in [7] then xw := 90;

      Left := xl;
      Width := xw;
    end;

    with QRLabelDeta[i] do begin
      if i = 2 then begin
        xw := 210;
        Alignment := taLeftJustify;
      end;
      if i in [1] then xw := 75;
      if i in [3..6] then xw := 75;
      if i in [7] then xw := 90;

      Left := xl;
      Width := xw;
    end;

    xl := xl + xw + 4;
  end;
end;

function TFLIQREP39.ObtenerDescripcionProducto(var clave: Integer): string;
begin
  with DMGEN do begin
    try
      Q_Auxi.Close;
      Q_Auxi.SQL.Clear;

      Q_AuxiStr50.FieldKind := fkInternalCalc;

      Q_Auxi.SQL.Add('SELECT DESCRIPCION AS Str50');
      Q_Auxi.SQL.Add('  FROM DGENCLAS');
      Q_Auxi.SQL.Add(' WHERE CLAVECATA = "PROG"');
      Q_Auxi.SQL.Add('   AND CLAVECLASIF = ' + IntToStr(clave));

      Q_Auxi.Prepare;
      Q_Auxi.Open;

      Q_Auxi.First;
      Result := Q_AuxiStr50.AsString;
    finally
      Q_Auxi.Close;
    end;
  end;
end;

procedure TFLIQREP39.PreparaReporte;
var totc, tota, totdev,
    totp, totcant, totfaltantes: real;
    s, sAux: string;
    ADescripcion: TStringList;
    i, curProd : Integer;
begin
  with DMGAS do begin
    CreaEtiquetas(true);

    totc := BndDt.Size.Width;

    totc := 0; totcant := 0;
    totdev := 0; totfaltantes := 0;
    swaceites := False;
    BndDt.Items.Clear;

    DMGAS.Q_Auxi.Close;
    try
      DMGAS.Q_Auxi.SQL.Clear;

      DMGAS.Q_AuxiEntero1.FieldKind := fkInternalCalc;
      DMGAS.Q_AuxiStr50.FieldKind := fkInternalCalc;
      DMGAS.Q_AuxiReal1.FieldKind := fkInternalCalc;

      DMGAS.Q_Auxi.SQL.Add('SELECT L.POSCARGA AS Entero1,');
      DMGAS.Q_Auxi.SQL.Add('       C.NOMBRE AS Str50,');
      DMGAS.Q_Auxi.SQL.Add('       L.LEC_ACT AS Real1');
      DMGAS.Q_Auxi.SQL.Add('  FROM DGASDLIQC L');
      DMGAS.Q_Auxi.SQL.Add('  LEFT OUTER JOIN DGASTCMB C');
      DMGAS.Q_Auxi.SQL.Add('    ON C.CLAVE = L.COMBUSTIBLE');
      DMGAS.Q_Auxi.SQL.Add(' WHERE L.ESTACION = ' + IntToStr(Estacion));
      DMGAS.Q_Auxi.SQL.Add('   AND L.FOLIO = (SELECT COALESCE(FOLIO, 0)');
      DMGAS.Q_Auxi.SQL.Add('                    FROM DGASDLIQC');
      DMGAS.Q_Auxi.SQL.Add('                   WHERE ESTACION = ' + IntToStr(Estacion));
      DMGAS.Q_Auxi.SQL.Add('                     AND ISLA = ' + IntToStr(Isla));
      DMGAS.Q_Auxi.SQL.Add('                     AND FECHA = (SELECT MAX(FECHA)');
      DMGAS.Q_Auxi.SQL.Add('                                    FROM DGASDLIQC');
      DMGAS.Q_Auxi.SQL.Add('                                   WHERE ESTACION = ' + IntToStr(Estacion));
      DMGAS.Q_Auxi.SQL.Add('                                     AND ISLA = ' + IntToStr(Isla));
      DMGAS.Q_Auxi.SQL.Add('                                     AND APLICADO = ''Si''');
      DMGAS.Q_Auxi.SQL.Add('                                     AND ((FECHA < "' + FechaToStrSQL(VgFecha) + '") OR');
      DMGAS.Q_Auxi.SQL.Add('                                         ((FECHA = "' + FechaToStrSQL(VgFecha) + '") AND');
      DMGAS.Q_Auxi.SQL.Add('                                          (TURNO < ' + IntToStr(Turno) + '))))');
      DMGAS.Q_Auxi.SQL.Add('                     AND APLICADO = ''Si''');
      DMGAS.Q_Auxi.SQL.Add('                   ORDER BY TURNO DESC ROWS 1)');

      DMGAS.Q_Auxi.Prepare;
      DMGAS.Q_Auxi.Open;

      DMGAS.Q_Auxi.First;

      if (DMGAS.Q_Auxi.Eof) then begin
        raise Exception.Create('No hay elementos que mostrar.');
      end;
      
      while not DMGAS.Q_Auxi.Eof do begin
        xlin := 'D//' + IntToClaveNum(DMGAS.Q_AuxiEntero1.AsInteger, 2) + ' - ' + DMGAS.Q_AuxiStr50.AsString
              + '//' + FormatoLectura(DMGAS.Q_AuxiReal1.AsFloat)
              + '// // // // //';
        BndDt.Items.Add(xlin);
        DMGAS.Q_Auxi.Next;
      end;

      xlin := 'T// // //Total:// // // //';
      BndDt.Items.Add(xlin);

      xlin := 'E//Lubricantes y aditivos';
      BndDt.Items.Add(xlin);
      xlin := 'A//Código//Descripción//Inicial//Final//Ventas//Precio//Importe';
      BndDt.Items.Add(xlin);

      DMGAS.Q_Auxi.Close;
      DMGAS.Q_Auxi.SQL.Clear;

      DMGAS.Q_AuxiEntero1.FieldKind := fkInternalCalc;
      DMGAS.Q_AuxiEntero2.FieldKind := fkInternalCalc;
      DMGAS.Q_AuxiReal2.FieldKind := fkInternalCalc;
      DMGAS.Q_AuxiStr50.FieldKind := fkInternalCalc;
      DMGAS.Q_AuxiReal1.FieldKind := fkInternalCalc;

      DMGAS.Q_Auxi.SQL.Add('SELECT DISTINCT');
      DMGAS.Q_Auxi.SQL.Add('       P.LINEA AS ENTERO1,');
      DMGAS.Q_Auxi.SQL.Add('       L.PRODUCTO AS ENTERO2,');
      DMGAS.Q_Auxi.SQL.Add('       P.DESCRIPCION AS STR50,');
      DMGAS.Q_Auxi.SQL.Add('       Sum(L.sald_fin) AS REAL2,');
      DMGAS.Q_Auxi.SQL.Add('       (SELECT PRECIO');
      DMGAS.Q_Auxi.SQL.Add('          FROM DGASPREA');
      DMGAS.Q_Auxi.SQL.Add('         WHERE PRODUCTO = P.CLAVE');
      DMGAS.Q_Auxi.SQL.Add('         ORDER BY FECHA DESC ROWS 1) AS REAL1');
      DMGAS.Q_Auxi.SQL.Add('  FROM DGASDLIQA L');
      DMGAS.Q_Auxi.SQL.Add('  LEFT OUTER JOIN DGASPROD P');
      DMGAS.Q_Auxi.SQL.Add('    ON P.CLAVE = L.PRODUCTO');
      DMGAS.Q_Auxi.SQL.Add(' WHERE L.ESTACION = ' + IntToStr(Estacion));
      DMGAS.Q_Auxi.SQL.Add('   AND L.FOLIO = (SELECT FOLIO');
      DMGAS.Q_Auxi.SQL.Add('                    FROM DGASDLIQA');
      DMGAS.Q_Auxi.SQL.Add('                   WHERE ESTACION = ' + IntToStr(Estacion));
      DMGAS.Q_Auxi.SQL.Add('                     AND ISLA = ' + IntToStr(Isla));
      DMGAS.Q_Auxi.SQL.Add('                     AND FECHA = (SELECT MAX(FECHA)');
      DMGAS.Q_Auxi.SQL.Add('                                    FROM DGASDLIQA');
      DMGAS.Q_Auxi.SQL.Add('                                   WHERE ESTACION = ' + IntToStr(Estacion));
      DMGAS.Q_Auxi.SQL.Add('                                     AND ISLA = ' + IntToStr(Isla));
      DMGAS.Q_Auxi.SQL.Add('                                     AND APLICADO = ''Si''');
      DMGAS.Q_Auxi.SQL.Add('                                     AND ((FECHA < "' + FechaToStrSQL(VgFecha) + '") OR');
      DMGAS.Q_Auxi.SQL.Add('                                         ((FECHA = "' + FechaToStrSQL(VgFecha) + '") AND');
      DMGAS.Q_Auxi.SQL.Add('                                          (TURNO < ' + IntToStr(Turno) + '))))');
      DMGAS.Q_Auxi.SQL.Add('                     AND APLICADO = ''Si''');
      DMGAS.Q_Auxi.SQL.Add('                   ORDER BY TURNO DESC ROWS 1)');
      DMGAS.Q_Auxi.SQL.Add(' GROUP BY P.LINEA,');
      DMGAS.Q_Auxi.SQL.Add('       L.PRODUCTO,');
      DMGAS.Q_Auxi.SQL.Add('       P.DESCRIPCION,');
      DMGAS.Q_Auxi.SQL.Add('       P.CLAVE');

      DMGAS.Q_Auxi.Prepare;
      DMGAS.Q_Auxi.Open;

      DMGAS.Q_Auxi.First;

      curProd := 0;
      while not DMGAS.Q_Auxi.Eof do begin
        if curProd <> DMGAS.Q_AuxiEntero1.AsInteger then begin
          curProd := DMGAS.Q_AuxiEntero1.AsInteger;
          xlin := 'S// //' + ObtenerDescripcionProducto(curProd);
          BndDt.Items.Add(xlin);
        end;

        xlin := 'D//' + IntToClaveNum(DMGAS.Q_AuxiEntero2.AsInteger, 6)
              + '//' + DMGAS.Q_AuxiStr50.AsString
              + '//' + FormatoLectura(DMGAS.Q_AuxiReal2.AsFloat)
              + '// // '
              + '//' + FormatoLectura(DMGAS.Q_AuxiReal1.AsFloat)
              + '//';

        BndDt.Items.Add(xlin);
        DMGAS.Q_Auxi.Next;
      end;

      xlin := 'E// // // // // //Total://';
      BndDt.Items.Add(xlin);
    finally
      DMGAS.Q_Auxi.Close;
    end;
  end;

end;

procedure TFLIQREP39.QuickRep1BeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with DMGEN, FLIQREP39P do begin
    CreaEtiquetas(false);
    Self.QRLEmp.Caption := QT_EmprRazonSocial.AsString;
    Self.QRLDir.Caption := QT_EmprDireccion.AsString + '    ' + QT_EmprPoblacion.Asstring + '    ' + QT_EmprRFC.AsString;
    Self.QRLRep.Caption := Self.Caption + ' ' + DMGAS.T_EstsDescripcion.AsString;
    Self.QRLRango.Caption := 'Del: ' + FechaAlf(VgFecha) + ', Turno: ' + IntToClaveNum(Turno, 2) + ', Isla: ' + cmbIslas.Text;
    Self.QRLSistema.Caption := IdSistNombre;
    Self.QRLFechaHora.Caption := SetFechaHora(VsFechaEnRep);
    SwAceites := False;
    xtipo:=0;
  end;
end;

procedure TFLIQREP39.BndDtBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  procedure InicializaEtiquetas(ri, rf: Integer);
  var k: word;
  begin
    for k := ri to rf do
      with QRLabelDeta[k] do begin
        Caption := '';
        Font.Style := [];
        Frame.DrawTop := False;
        Frame.DrawBottom := False;
        Font.Size := 8;

        if k = 1 then Left := xLeft;

        if (xtp = 'D') and (xtipo > 2) then
          if k = 1 then Left := Left + 30;

        if (xtp = 'S') then begin
          if k = 1 then begin
            Font.Style := [fsUnderline];
          end;
        end;

        if (xtp = 'R') then begin
          if k in [3, 4] then begin
            Frame.DrawTop := True;
          end;
        end;

        if xtp in ['A', 'E'] then Font.Style := [fsBold];

        if xtp = 'T' then begin
          if not pSwNegritas then Font.Style := [fsBold];

          if xtipo = 1 then begin
            if k in [3, 5, 6] then Frame.DrawTop := True
            else Frame.DrawTop := False;
          end else if xtipo = 2 then
            if k = 7 then Frame.DrawTop := True
            else Frame.DrawTop := False;
        end;

        if xtp = 'X' then begin
          if not pSwNegritas then Font.Style := [fsBold];
          if k in [4, 5] then Frame.DrawTop := True
        end;
      end;
  end;

  procedure ExtraeEtiquetas(ri, rf: Integer);
  var k: word;
  begin
    for k := ri to rf do begin
      QRLabelDeta[k].Caption := ExtraeElemStr(xlin, k - ri + 2);
    end;
  end;

begin
  BndDt.Frame.DrawBottom := False;
  xlin := BndDt.Item;
  xtp := StrtoChar(ExtraeElemStr(xlin, 1));

  if xtp = 'A' then begin
    BndDt.Frame.DrawBottom := True;

    if not SwAceites then IniciaEtiquetasProd;

    swaceites := True;
  end;

  if xtp in ['A', 'S'] then inc(xtipo);

  InicializaEtiquetas(1, 7);
  ExtraeEtiquetas(1, 7);
end;

end.
