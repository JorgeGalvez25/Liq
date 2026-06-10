unit ModuloAuxiliarU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Menus, Buttons, Grids, DBGrids, ImgList,
  ToolWin, ActnList, DBCtrls, dxBar, dxBarExtItems, dxStatusBar,
  dxRibbonStatusBar, cxClasses, dxRibbon, cxControls, cxGraphics,
  cxDBLookupComboBox, cxBarEditItem, WinSkinData, cxDropDownEdit, cxLabel,
  OleCtrls, GrFingerXLib_TLB, dxRibbonGallery;

type
  TModuloAuxiliarF = class(TForm)
    Panel2: TPanel;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab2: TdxRibbonTab;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxBarLargeButtonProcesosDiarios: TdxBarLargeButton;
    dxBarLargeButtonTurnosDeLiquidacion: TdxBarLargeButton;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButtonResumenLiq: TdxBarLargeButton;
    dxBarLargeButtonResumenVentasPorComb: TdxBarLargeButton;
    dxBarLargeButtonResumenVentasPorDesp: TdxBarLargeButton;
    dxBarLargeButtonResumenMensual: TdxBarLargeButton;
    dxBarLargeButtonResumenLiqCosto: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarManager1Bar3: TdxBar;
    dxBarLargeButtonSalir: TdxBarLargeButton;
    dxBarManager1Bar4: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    dxBarContainerItem1: TdxBarContainerItem;
    SkinData1: TSkinData;
    cxBarEditItem2: TcxBarEditItem;
    cxBarEditItem3: TcxBarEditItem;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    dxBarButton1: TdxBarButton;
    dxBarManager1Bar5: TdxBar;
    cxBarEditItem4: TcxBarEditItem;
    cxBarEditItem5: TcxBarEditItem;
    cxBarEditItem6: TcxBarEditItem;
    cxBarEditItem7: TcxBarEditItem;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxRibbonQuickAccessGroupButton1: TdxRibbonQuickAccessGroupButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    DBLookupComboBox1: TDBLookupComboBox;
    dxBarControlContainerItem2: TdxBarControlContainerItem;
    DBLookupComboBox2: TDBLookupComboBox;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton12: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxRibbon1Tab3: TdxRibbonTab;
    dxBarManager1Bar6: TdxBar;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxRibbon1Tab4: TdxRibbonTab;
    dxRibbonDropDownGallery1: TdxRibbonDropDownGallery;
    dxBarManager1Bar7: TdxBar;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    dxBarLargeButton20: TdxBarLargeButton;
    dxBarButton11: TdxBarButton;
    dxBarLargeButton21: TdxBarLargeButton;
    dxRibbon1Tab5: TdxRibbonTab;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dxBarLargeButtonProcesosDiariosClick(Sender: TObject);
    procedure dxBarLargeButtonTurnosDeLiquidacionClick(Sender: TObject);
    procedure dxBarLargeButtonResumenLiqClick(Sender: TObject);
    procedure dxBarLargeButtonResumenVentasPorCombClick(Sender: TObject);
    procedure dxBarLargeButtonResumenVentasPorDespClick(Sender: TObject);
    procedure dxBarLargeButtonResumenMensualClick(Sender: TObject);
    procedure dxBarLargeButtonResumenLiqCostoClick(Sender: TObject);
    procedure dxBarLargeButtonSalirClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarLargeButton12Click(Sender: TObject);
    procedure dxBarLargeButton13Click(Sender: TObject);
    procedure dxBarLargeButton14Click(Sender: TObject);
    procedure dxBarLargeButton15Click(Sender: TObject);
    procedure dxBarLargeButton16Click(Sender: TObject);
    procedure dxBarLargeButton17Click(Sender: TObject);
    procedure dxBarLargeButton19Click(Sender: TObject);
    procedure dxBarLargeButton22Click(Sender: TObject);
    procedure dxBarLargeButton20Click(Sender: TObject);
    procedure dxBarLargeButton21Click(Sender: TObject);
  private
    { Private declarations }
    //FALTA
    swVerParametroAjuste:Boolean;
  public
    { Public declarations }
    ParametrosSuite:String;
    procedure IniciaBaseDeDatos;
    procedure IniciaSistema;
    procedure CambiaNavBar;
  end;

var
  ModuloAuxiliarF: TModuloAuxiliarF;

implementation

uses ULIBGRAL, DDMGEN, UGEN_NET,
  ULIBDATABASE, ULIBLICENCIAS, DDMGAS,
  DDMGASQ, DDMGEN_VTAS, ULIQAJUD, ULIQTURC, ULIQREP05P, ULIQREP06P,
  ULIQREP08P, ULIQREP10P, ULIQREP13P, UGENPASS, ULIQREP35P, UAutoriza,
  ULIQREP38P, ULIQREP40P, UMALECTFIN, ULIQGRF01P, ULIQGRF03P, ULIQGRF04P,
  ULIQGRF05P, ULIQGRF02P, ULIQGRF06P, ULIQGRF07P, ULIQGRF08P,ULIQETAN, ULIQGRF09P,
  ULIQGRF10P, ULIQDESC;

{$R *.DFM}

procedure TModuloAuxiliarF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with DMGEN,DMGAS do begin
    try
      DBGEN1.close;
      DBGEN2.close;
      DBGAS1.close;
      DBGAS2.close;
    except
    end;
  end;
end;

procedure TModuloAuxiliarF.IniciaBaseDeDatos;
begin
  with DMGEN,DMGAS do begin
    Screen.Cursor:=crHourGlass;
    try
      if ParamCount>=1 then
        VsAliasDef:=ParamStr(1);
      if VsAliasDef='' then
        raise Exception.Create('Falta parámetro');

      ConectaDBMaestra(VSAliasDef);
      ConectaDataBase2(VSAliasDef);

      IniciaGen(idLiq);
      IniciaGen2('*','GAS;LIQ;CNT;INV');

    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TModuloAuxiliarF.IniciaSistema;
var NoEsta:word;
    str1,str2:string;
    xPassOk:boolean;
    xusuario,xpass,xcomp:string;
begin
  with DMGEN,DMGAS do begin
    UsuarioActivo:=IdSuper;
    UsuarioActivoLib:=IdSuper;
    ClaveUsuarioActivo:=0;

    Application.CreateForm(TFGENPASS,FGENPASS);
    FGENPASS.PreparaForma(VsPCName);                                               
    xPassOk:=FALSE;
    try

      if UpperCase(ParamStr(2))='SUITE' then begin
        ParametrosSuite:=ParamStr(3);
        xusuario:=ExtraeElemStrSep(ParametrosSuite,1,';');
        xpass:=ExtraeElemStrSep(ParametrosSuite,2,';');
        xcomp:=ExtraeElemStrSep(ParametrosSuite,3,';');
        case UsuarioValido(xusuario,xpass) of
          0:begin
              xPassOk:=true;
              PassUsuarioActivo:=xpass;
              if xcomp<>'' then begin
                IniciaComputadora(xcomp);
//                SkinData1.Active:=TRUE;
//                SkinActivo.Checked:=TRUE;
              end;
            end;
          1,2,3:begin
              xPassOk:=FALSE;
            end;
        end;
      end;
      if not xPassOk then begin
        if FGENPASS.ShowModal=mrCancel then
          Abort;
        if FGENPASS.Computadora<>'' then
          IniciaComputadora(FGENPASS.Computadora);
      end;
    finally
      FGENPASS.Free;
    end;

    if VarComp('AliasVentas')='' then
      raise Exception.Create('No se configuró "Alias" de Ventas');
    DMGEN_VTAS.ConectaDataBaseVentas(VarComp('AliasVentas'));

    if VarComp('AliasGasolinera')='' then
      raise Exception.Create('No se configuró "Alias" de Gasolinera');
    DMGAS.ConectaDataBaseGas(VarComp('AliasGasolinera'));

    IniciaGasolinera;

    SwServiciosMaster:=VarComp('ServiciosMaster')='Si';
    if SwServiciosMaster then begin
      if VariableDeMemo(T_EstsCONSOLA,'TargetURLMaster')<>'' then
        VarGasTargetURL_Master:=VariableDeMemo(T_EstsCONSOLA,'TargetURLMaster');
      dxRibbonStatusBar1.Panels[0].Text:='Servicios de Master Activos ['+VarGasTargetURL_Master+']';  
    end;

    CargaConfiguracionConsola;

    AbreQuery(QT_Empr);

    AbreQuery(QT_Sist);
    if LocalizaQuery(QT_Sist,'ClaveSis',idLiq) then ;

    if ActivaFechaTrabajo then ;

    if ActivaEjercicio(idLiq) then begin
      DBLookupComboBox1.KeyValue:=EjercicioActivo;
      cxBarEditItem2.EditValue := EjercicioActivo;
    end
    else Abort;

    //RegistraConexion(true);
    with DMGASQ do begin
      AbreTablasGasQ('Ests;Isla;Turn;Dtrn;Desp');
      DMGAS.LeeVarGas;
    end;

    DMGEN.QT_Empr.Active:=true;

    if DMGAS.swmochila then
      str1:='true'
    else
      str1:='false';
    if EnDemostracion then
      str2:='true'
    else
      str2:='false';
    with DMGAS do begin
      T_Ests.Active:=true;
      DBLookUpComboBox2.KeyValue:=DMGAS.T_EstsClave.AsInteger;
      cxBarEditItem3.EditValue := DMGAS.T_EstsClave.AsInteger;
    end;

    //Valida opción Proceso Descuentos con licencia I-Gas Descuentos
      if (DMGAS.ValidaModulo(idDesc))
      then dxBarLargeButton21.Visible:=ivAlways
      else dxBarLargeButton21.Visible:=ivNever;

      (*
    if (not DMGAS.swmochila) then
      if (not EnDemostracion) then
      if not (DMGEN.QT_EmprSerieKey.AsInteger in [120,151,154,163,164,187,171,215]) then
    begin
      MensajeErr('Error en Aplicacion');
      Application.Terminate;
    end;*)
  end;
end;

procedure TModuloAuxiliarF.FormShow(Sender: TObject);
begin
  idSist:=idLiq;
  IniciaAmbiente;
  IniciaBaseDeDatos;
  IniciaSistema;
  try
    ChecaDerechoEspecialAutor3(idAux,aeAccesoModuloAux);
    if not FAutoriza.PassOk then
      Abort
    else begin
      dxBarSubItem2.Enabled:= False;
      dxBarButton3.Enabled:=False;
      dxBarButton4.Enabled:=False;
      dxRibbon1Tab1.Visible:=False;
      dxRibbon1Tab2.Visible:=False;
      dxRibbon1Tab3.Visible:=False;
      dxRibbon1Tab4.Visible:=False;
      dxRibbon1Tab5.Visible:=False;
    end;
  except
    Abort;
  end;
  ErrorInic:=false;

  swVerParametroAjuste:=True;
  
  try
    if DMGEN.UsuarioActivo<>IdSuper then begin

      ChecaDerechoEspecialAutor3(idAux,aeEstadisticasModuloAux);
      if FAutoriza.PassOk then begin
         dxRibbon1Tab3.Visible:=True;
      end;

      ChecaDerechoEspecialAutor3(idAux,aeComparativasModuloAux);
      if FAutoriza.PassOk then begin
         dxRibbon1Tab4.Visible:=True;
      end;

      ChecaDerechoEspecialAutor3(idAux,aeEntrasVirtualesModuloAux);
      if FAutoriza.PassOk then begin
         dxRibbon1Tab5.Visible:=True;
      end;

      ChecaDerechoEspecialAutor3(idAux,aeMAuxReportes);
      if FAutoriza.PassOk then begin
        dxBarSubItem2.Enabled:= True;
        dxRibbon1Tab1.Visible:=False;
        dxBarLargeButtonResumenVentasPorComb.Enabled:=False;
        dxBarLargeButtonResumenVentasPorDesp.Enabled:=False;
        dxBarLargeButtonResumenMensual.Enabled:=False;
        dxBarLargeButtonResumenLiqCosto.Enabled:=False;
        dxBarLargeButton1.Enabled:=False;
        dxBarLargeButton2.Enabled:=False;
        swVerParametroAjuste:=False;
        dxRibbon1Tab3.Visible:=True;
        dxBarButton3.Enabled:=False;
        dxBarButton4.Enabled:=False;
        dxBarButton7.Enabled:=False;
        dxBarButton8.Enabled:=False;
        dxBarButton9.Enabled:=False;
        dxBarButton10.Enabled:=False;
        dxBarLargeButton12.Enabled:=False;
        dxBarLargeButton13.Enabled:=False;
        dxBarLargeButton14.Enabled:=False;
        dxBarLargeButton15.Enabled:=False;
        dxBarLargeButton16.Enabled:=False;
        dxBarLargeButton17.Enabled:=False;
        dxRibbon1Tab2.Active:=True;
        dxBarLargeButton18.Enabled:=False;   //03-12-15
        dxRibbon1Tab5.Visible:=True;
      end;

      ChecaDerechoEspecialAutor3(idAux,aeReportesModuloAux);
      if FAutoriza.PassOk then begin
        dxBarSubItem2.Enabled:= True;
         dxRibbon1Tab2.Visible:=True;
      end;

      ChecaDerechoEspecialAutor3(idAux,aeInicioModuloAux);
      if FAutoriza.PassOk then begin
        dxBarButton3.Enabled:=True;
        dxBarButton4.Enabled:=True;
        dxRibbon1Tab1.Visible:=True;
        dxRibbon1Tab1.Active:=True;
      end;

    end else begin
      dxBarSubItem2.Enabled:= True;
      dxBarButton3.Enabled:=True;
      dxBarButton4.Enabled:=True;
      dxRibbon1Tab1.Visible:=True;
      dxRibbon1Tab1.Active:=True;
      dxRibbon1Tab2.Visible:=True;
      dxRibbon1Tab3.Visible:=True;
      dxRibbon1Tab4.Visible:=True;
      dxRibbon1Tab5.Visible:=True;
    end;
  except

  end;
//  DMGAS.CargaConfiguracionConsola;
end;

procedure TModuloAuxiliarF.FormActivate(Sender: TObject);
begin
  if ErrorInic then
    Application.Terminate;
  SwCalcFields:=true;
end;

procedure TModuloAuxiliarF.dxBarLargeButtonProcesosDiariosClick(
  Sender: TObject);
begin
   Application.CreateForm(TFLIQAJUD,FLIQAJUD);
  with DMGEN do begin
    try
      FLIQAJUD.PreparaForma(VarComp('LIQ_API_IDP_BASE_URL'),VarComp('LIQ_API_BASE_URL'),
                            VarComp('LIQ_API_USERNAME'),VarComp('LIQ_API_PASSWORD'));
      FLIQAJUD.ShowModal;
    finally
      FLIQAJUD.Free;
    end;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButtonTurnosDeLiquidacionClick(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQTURC,FLIQTURC);
  try
    FLIQTURC.PreparaForma(1);
    CambiaNavBar;
    FLIQTURC.ShowModal;
  finally
    FLIQTURC.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButtonResumenLiqClick(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP05P,FLIQREP05P);
  try
    //FALTA
    FLIQREP05P.PreparaForma(1, swVerParametroAjuste,True);
    FLIQREP05P.ShowModal;
  finally
    FLIQREP05P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButtonResumenVentasPorCombClick(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP06P,FLIQREP06P);
  try
    FLIQREP06P.PreparaForma(1);
    FLIQREP06P.ShowModal;
  finally
    FLIQREP06P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButtonResumenVentasPorDespClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP08P,FLIQREP08P);
  try
    FLIQREP08P.PreparaForma(1);
    FLIQREP08P.ShowModal;
  finally
    FLIQREP08P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButtonResumenMensualClick(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP10P,FLIQREP10P);
  try
    FLIQREP10P.PreparaForma(1);
    FLIQREP10P.ShowModal;
  finally
    FLIQREP10P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButtonResumenLiqCostoClick(
  Sender: TObject);
begin
  Application.CreateForm(TFLIQREP13P,FLIQREP13P);
  try
    FLIQREP13P.PreparaForma(1);
    FLIQREP13P.ShowModal;
  finally
    FLIQREP13P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButtonSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TModuloAuxiliarF.dxBarButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TModuloAuxiliarF.DBLookupComboBox1Click(Sender: TObject);
begin
  PonEjercicioActivo(DMGEN.QT_EjerAno.AsInteger);
end;

procedure TModuloAuxiliarF.DBLookupComboBox2Click(Sender: TObject);
begin
  with DMGAS do begin
    EstacionActual:=T_EstsClave.AsInteger; 
    if SwServiciosMaster then begin
      if VariableDeMemo(T_EstsCONSOLA,'TargetURLMaster')<>'' then
        VarGasTargetURL_Master:=VariableDeMemo(T_EstsCONSOLA,'TargetURLMaster');
      dxRibbonStatusBar1.Panels[0].Text:='Servicios de Master Activos ['+VarGasTargetURL_Master+']';
    end;
    CargaConfiguracionConsola;
  end;
end;

procedure TModuloAuxiliarF.CambiaNavBar;
begin
  with FLIQTURC do begin
    dxNavBar1.View:=10;
    dxNavBar1.Update;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP35P,FLIQREP35P);
  try
    FLIQREP35P.PreparaForma;
    FLIQREP35P.ShowModal;
  finally
    FLIQREP35P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQREP38P,FLIQREP38P);
  try
    FLIQREP38P.PreparaForma(1, swVerParametroAjuste, True);
    FLIQREP38P.ShowModal;
  finally
    FLIQREP38P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton3Click(Sender: TObject);
begin
  //FALTA
  Application.CreateForm(TFLIQREP40P,FLIQREP40P);
  try
    FLIQREP40P.PreparaForma(1, swVerParametroAjuste, True);
    FLIQREP40P.ShowModal;
  finally
    FLIQREP40P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton4Click(Sender: TObject);
begin
  //FALTA
  Application.CreateForm(TFMALECTFIN,FMALECTFIN);
  try
    FMALECTFIN.ShowModal;
  finally
    FMALECTFIN.Free;
  end;

end;

procedure TModuloAuxiliarF.dxBarLargeButton7Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF03P,FLIQGRF03P);
  try
    FLIQGRF03P.PreparaForma(0);
    FLIQGRF03P.ShowModal;
  finally
    FLIQGRF03P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton11Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF01P,FLIQGRF01P);
  try
    FLIQGRF01P.PreparaForma(1, swVerParametroAjuste,True); //25-11-15
    FLIQGRF01P.ShowModal;
  finally
    FLIQGRF01P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton12Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF02P,FLIQGRF02P);
  try
    FLIQGRF02P.PreparaForma(1,True);
    FLIQGRF02P.ShowModal;
  finally
    FLIQGRF02P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton13Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF03P,FLIQGRF03P);
  try
    FLIQGRF03P.PreparaForma(1,True);
    FLIQGRF03P.ShowModal;
  finally
    FLIQGRF03P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton14Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF04P,FLIQGRF04P);
  try
    FLIQGRF04P.PreparaForma(1,True);
    FLIQGRF04P.ShowModal;
  finally
    FLIQGRF04P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton15Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF05P,FLIQGRF05P);
  try
    FLIQGRF05P.PreparaForma(1,True);
    FLIQGRF05P.ShowModal;
  finally
    FLIQGRF05P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton16Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF06P,FLIQGRF06P);
  try
    FLIQGRF06P.PreparaForma(1,True); //25-11-15
    FLIQGRF06P.ShowModal;
  finally
    FLIQGRF06P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton17Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF07P,FLIQGRF07P); //25-11-15
  try
    FLIQGRF07P.PreparaForma(1,True);
    FLIQGRF07P.ShowModal;
  finally
    FLIQGRF07P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton19Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF08P,FLIQGRF08P); //03-12-15
  try
    FLIQGRF08P.PreparaForma(1,True);
    FLIQGRF08P.ShowModal;
  finally
    FLIQGRF08P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton22Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQETAN, FLIQETAN);
  try
    FLIQETAN.ShowModal;
  finally
    FLIQETAN.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton20Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQGRF09P,FLIQGRF09P); //TODO 15-02-15
  try
    FLIQGRF09P.PreparaForma(1,True);
    FLIQGRF09P.ShowModal;
  finally
    FLIQGRF09P.Free;
  end;
end;

procedure TModuloAuxiliarF.dxBarLargeButton21Click(Sender: TObject);
begin
  Application.CreateForm(TFLIQDESC,FLIQDESC);
  try
    FLIQDESC.ShowModal;
  finally
    FLIQDESC.Free;
  end;
end;

end.
