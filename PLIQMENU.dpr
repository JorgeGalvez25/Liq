program PLIQMENU;

uses
  Forms,
  ULIQMENU in 'ULIQMENU.pas' {FLIQMENU},
  DDMGAS in '..\Gas\DDMGAS.pas' {DMGAS: TDataModule},
  DDMGASP in '..\Gas\DDMGASP.pas' {DMGASP: TDataModule},
  DDMGASQ in '..\Gas\DDMGASQ.pas' {DMGASQ: TDataModule},
  ULIBGRAL in '..\..\Imagen Ib Libs\Libs\ULIBGRAL.pas',
  ULIBDATABASE in '..\..\Imagen Ib Libs\Libs\ULIBDATABASE.pas',
  DDMGEN in '..\..\Imagen Ib Libs\DataMod\DDMGEN.pas' {DMGEN: TDataModule},
  ULIBLICENCIAS in '..\..\Imagen Ib Libs\Libs\ULIBLICENCIAS.pas',
  ULIBPRINT in '..\..\Imagen Ib Libs\Libs\ULIBPRINT.pas',
  DDMGENQ in '..\..\Imagen Ib Libs\DataMod\DDMGENQ.pas' {DMGENQ: TDataModule},
  DDMGENT in '..\..\Imagen Ib Libs\DataMod\DDMGENT.pas' {DMGENT: TDataModule},
  DDMGENP in '..\..\Imagen Ib Libs\DataMod\DDMGENP.pas' {DMGENP: TDataModule},
  DDMCFG in '..\..\Imagen Ib Libs\DataMod\DDMCFG.pas' {DMCFG: TDataModule},
  DDMCNT in '..\..\Imagen Ib Libs\DataMod\DDMCNT.pas' {DMCNT: TDataModule},
  DDMBNC in '..\..\Imagen Ib Libs\DataMod\DDMBNC.pas' {DMBNC: TDataModule},
  UAVANCE in '..\..\Imagen IB Libs\Util\UAVANCE.pas' {FAVANCE},
  UAcercaDe in '..\..\Imagen IB Libs\Util\UAcercaDe.pas' {FAcercaDe},
  UFormaPreverTxt in '..\..\Imagen IB Libs\Util\UFormaPreverTxt.pas' {FormaPreverTxt},
  DDMGEN_VTAS in '..\..\Imagen Ib Libs\DataMod\DDMGEN_VTAS.pas' {DMGEN_VTAS: TDataModule},
  ULIQRCUPR in 'ULIQRCUPR.pas' {FLIQRCUPR},
  ULIQCCAJAI in 'ULIQCCAJAI.pas' {FLIQCCAJAI},
  ULIQREP01P in 'ULIQREP01P.pas' {FLIQREP01P},
  ULIQREP01 in 'ULIQREP01.pas' {FLIQREP01},
  UGEN_NET in '..\..\Imagen Ib Libs\DataMod\UGEN_NET.pas',
  DDMPVG in '..\pvg\DDMPVG.pas' {DMPVG: TDataModule},
  UGENPASS in '..\..\Imagen Ib Libs\Util\UGENPASS.pas' {FGENPASS},
  UCambioPass in '..\..\Imagen Ib Libs\Util\UCambioPass.pas' {FCambioPass},
  ULIQTURC in 'ULIQTURC.pas' {FLIQTURC},
  ULIQTURCN in 'ULIQTURCN.pas' {FLIQTURCN},
  ULIQTRANR in 'ULIQTRANR.pas' {FLIQTRANR},
  DDMLIQ in 'DDMLIQ.pas' {DMLIQ: TDataModule},
  ULIQLIQG in 'ULIQLIQG.pas' {FLIQLIQG},
  ULIQLIQGN in 'ULIQLIQGN.pas' {FLIQLIQGN},
  ULIQPVALR in 'ULIQPVALR.pas' {FLIQPVALR},
  UGENCLIEB in '..\..\Imagen IB\General\UGENCLIEB.pas' {FGENCLIEB},
  ULIQPVALI in 'ULIQPVALI.pas' {FLIQPVALI},
  ULIQLIQGI in 'ULIQLIQGI.pas' {FLIQLIQGI},
  UGASPROD in '..\Gas\UGASPROD.pas' {FGASPROD},
  UGASPREC in '..\Gas\UGASPREC.pas' {FGASPREC},
  UGASPRODB in '..\Gas\UGASPRODB.pas' {FGASPRODB},
  ULIQREP36 in 'ULIQREP36.pas' {FLIQREP36},
  ULIQREP35P in 'ULIQREP35P.pas' {FLIQREP35P},
  ULIQTURCPOLI in 'ULIQTURCPOLI.pas' {FLIQTURCPOLI},
  UCNTPOLIF in '..\..\Imagen IB\Cnt\UCNTPOLIF.pas' {FCNTPOLIF},
  UImpreDialog in '..\..\Imagen Ib Libs\Util\UImpreDialog.pas' {FImpreDialog},
  ULIQREP06P in 'ULIQREP06P.pas' {FLIQREP06P},
  ULIQREP06 in 'ULIQREP06.pas' {FLIQREP06},
  UGASPRODI in '..\Gas\UGASPRODI.pas' {FGASPRODI},
  ULIQREP07P in 'ULIQREP07P.pas' {FLIQREP07P},
  ULIQREP07 in 'ULIQREP07.pas' {FLIQREP07},
  ULIQTURCSALI in 'ULIQTURCSALI.pas' {FLIQTURCSALI},
  DDMINV in '..\..\Imagen Ib Libs\DataMod\DDMINV.pas' {DMINV: TDataModule},
  UINVSALIF in '..\..\Imagen Ib Vtas\Inv\UINVSALIF.pas' {FINVSALIF},
  UGENCCOSB in '..\..\Imagen IB\General\UGENCCOSB.pas' {FGENCCOSB},
  USelecTexto in '..\..\Imagen Ib Libs\Util\USelecTexto.pas' {FSelecTexto},
  UGENPRODB in '..\..\Imagen IB\General\UGENPRODB.pas' {FGENPRODB},
  ULIQCONS01 in 'ULIQCONS01.pas' {FLIQCONS01},
  ULIQDESGLO in 'ULIQDESGLO.pas' {FLIQDESGLO},
  ULIQSPLASH in 'ULIQSPLASH.pas' {FLIQSPLASH},
  ULIQREP36P in 'ULIQREP36P.pas' {FLIQREP36P},
  ULIQREP08 in 'ULIQREP08.pas' {FLIQREP08},
  ULIQCONS01I in 'ULIQCONS01I.pas' {FLIQCONS01I},
  ULIQDTPAG in 'ULIQDTPAG.pas' {FLIQDTPAG},
  ULIQLIQIDesglo in 'ULIQLIQIDesglo.pas' {FLIQLIQGIDesglo},
  ULIQREP10P in 'ULIQREP10P.pas' {FLIQREP10P},
  ULIQREP10 in 'ULIQREP10.pas' {FLIQREP10},
  ULIQREP11P in 'ULIQREP11P.pas' {FLIQREP11P},
  UGASTCMBB in '..\Gas\UGASTCMBB.pas' {FGASTCMBB},
  ULIQREP12P in 'ULIQREP12P.pas' {FLIQREP12P},
  ULIQREP12 in 'ULIQREP12.pas' {FLIQREP12},
  ULIQREP11 in 'ULIQREP11.pas' {FLIQREP11},
  DDMCXC in '..\..\Imagen Ib Libs\DataMod\DDMCXC.pas' {DMCXC: TDataModule},
  ULIQAJUD in 'ULIQAJUD.pas' {FLIQAJUD},
  ULIQREP13P in 'ULIQREP13P.pas' {FLIQREP13P},
  ULIQREP13 in 'ULIQREP13.pas' {FLIQREP13},
  ULIQREP14 in 'ULIQREP14.pas' {FLIQREP14},
  ULIQLIQGDESG in 'ULIQLIQGDESG.pas' {FLIQLIQGDESG},
  ULIQTURCcpol in 'ULIQTURCcpol.pas' {FLIQTURCcpol},
  UGENPOLIautom in '..\..\Imagen IB\General\UGENPOLIautom.pas' {FGENPOLIautom},
  UGENPOLIparam in '..\..\Imagen IB\General\UGENPOLIparam.pas' {FGENPOLIparam},
  DDMRGS in '..\..\Imagen Ib Libs\DataMod\DDMRGS.pas' {DMRGS: TDataModule},
  DDMACF in '..\..\Imagen Ib Libs\DataMod\DDMACF.pas' {DMACF: TDataModule},
  DDMCXP in '..\..\Imagen Ib Libs\DataMod\DDMCXP.pas' {DMCXP: TDataModule},
  DDMIVA in '..\..\Imagen Ib Libs\DataMod\DDMIVA.pas' {DMIVA: TDataModule},
  UCNTPOLIConc in '..\..\Imagen IB\Cnt\UCNTPOLIConc.pas' {FCNTPOLIConc},
  UDesgloce in '..\..\Imagen Ib Libs\Util\UDesgloce.pas' {FDesgloce},
  UGENFORM in '..\..\Imagen IB\General\UGENFORM.pas' {FGENFORM},
  ULIQREP15P in 'ULIQREP15P.pas' {FLIQREP15P},
  ULIQREP15 in 'ULIQREP15.pas' {FLIQREP15},
  ULIQTURCVP in 'ULIQTURCVP.pas' {FLIQTURCVP},
  ULIQTURCVI in 'ULIQTURCVI.pas' {FLIQTURCVI},
  UGASEXPO in '..\Gas\UGASEXPO.pas' {FGASEXPO},
  UGASDESPB in '..\Gas\UGASDESPB.pas' {FGASDESPB},
  ULIQREP17 in 'ULIQREP17.pas' {FLIQREP17},
  ULIQREP18P in 'ULIQREP18P.pas' {FLIQREP18P},
  ULIQREP18 in 'ULIQREP18.pas' {FLIQREP18},
  ULIQREP19P in 'ULIQREP19P.pas' {FLIQREP19P},
  UGENCTASB in '..\..\Imagen IB\General\UGENCTASB.pas' {FGENCTASB},
  ULIQREP19 in 'ULIQREP19.pas' {FLIQREP19},
  ULIQREP20 in 'ULIQREP20.pas' {FLIQREP20},
  ULIQREP20P in 'ULIQREP20P.pas' {FLIQREP20P},
  ULIQREP21P in 'ULIQREP21P.pas' {FLIQREP21P},
  ULIQREP21 in 'ULIQREP21.pas' {FLIQREP21},
  UCNTPOLIN in '..\..\Imagen IB\Cnt\UCNTPOLIN.pas' {FCNTPOLIN},
  UPVGRCUP in '..\pvg\UPVGRCUP.pas' {FPVGRCUP},
  ULIQCONS02 in 'ULIQCONS02.pas' {FLIQCONS02},
  ULIQTRAN2 in 'ULIQTRAN2.pas' {FLIQTRAN2},
  ULIQRCUP2R in 'ULIQRCUP2R.pas' {FLIQRCUP2R},
  ULIQCONS03 in 'ULIQCONS03.PAS' {FLIQCONS03},
  ULIQPVALGEN in 'ULIQPVALGEN.pas' {FLIQPVALGEN},
  ULIQPVALCAN in 'ULIQPVALCAN.pas' {FLIQPVALCAN},
  ULIQPVALGENI in 'ULIQPVALGENI.pas' {FLIQPVALGENI},
  ULIQREP23P in 'ULIQREP23P.pas' {FLIQREP23P},
  ULIQREP23 in 'ULIQREP23.pas' {FLIQREP23},
  ULIQREP24 in 'ULIQREP24.pas' {FLIQREP24},
  ULIQREP24P in 'ULIQREP24P.pas' {FLIQREP24P},
  ULIQPVALCANI in 'ULIQPVALCANI.pas' {FLIQPVALCANI},
  ULIQPVALVER in 'ULIQPVALVER.pas' {FLIQPVALVER},
  ULIQCONS02I in 'ULIQCONS02I.pas' {FLIQCONS02I},
  ULIQREP27P in 'ULIQREP27P.pas' {FLIQREP27P},
  ULIQREP27 in 'ULIQREP27.pas' {FLIQREP27},
  ULIQREP28P in 'ULIQREP28P.pas' {FLIQREP28P},
  ULIQREP28 in 'ULIQREP28.pas' {FLIQREP28},
  ULIQREP29P in 'ULIQREP29P.pas' {FLIQREP29P},
  ULIQREP29 in 'ULIQREP29.pas' {FLIQREP29},
  DDMCONS2 in '..\..\Imagen Ib Volumetricos\Dispensarios\DDMCONS2.pas' {DMCONS2: TDataModule},
  DDMCONS in '..\..\Imagen Ib Volumetricos\Dispensarios\DDMCONS.pas' {DMCONS: TDataModule},
  ULIQVALVER in 'ULIQVALVER.pas' {FLIQVALVER},
  UGENSELFORM in '..\..\Imagen IB\General\UGENSELFORM.pas' {FGENSELFORM},
  ULIQLIQGNG in 'ULIQLIQGNG.pas' {FLIQLIQGNG},
  ULIQREP31P in 'ULIQREP31P.pas' {FLIQREP31P},
  ULIQREP31 in 'ULIQREP31.pas' {FLIQREP31},
  ULIQREP32 in 'ULIQREP32.pas' {FLIQREP32},
  ULIQTURCJT in 'ULIQTURCJT.pas' {FLIQTURCJT},
  UAutoriza in '..\..\Imagen Ib Libs\Util\UAutoriza.pas' {FAutoriza},
  ULIQDLIQE in 'ULIQDLIQE.pas' {FLIQDLIQE},
  ULIQLIQGIDesgloE in 'ULIQLIQGIDesgloE.pas' {FLIQLIQGIDesgloE},
  ULIQPVALK in 'ULIQPVALK.pas' {FLIQPVALK},
  ULIQRCUP in 'ULIQRCUP.pas' {FLIQRCUP},
  ULIQTRAN in 'ULIQTRAN.pas' {FLIQTRAN},
  ULIQRCUP2 in 'ULIQRCUP2.pas' {FLIQRCUP2},
  DDMKIO in '..\Gas\DDMKIO.pas' {DMKIO: TDataModule},
  ULIQPVAl in 'ULIQPVAL.pas' {FLIQPVAL},
  DDMAJUS in 'DDMAJUS.pas' {DMAJUS: TDataModule},
  ULIQLIQGIBLOQ in 'ULIQLIQGIBLOQ.pas' {FLIQLIQGIBLOQ},
  UAutoriza3 in '..\..\Imagen Ib Libs\Util\UAutoriza3.pas' {FAutoriza3},
  ULIQRESEFEC in 'ULIQRESEFEC.pas' {FLIQRESEFEC},
  ULIQRESEFECN in 'ULIQRESEFECN.pas' {FLIQRESEFECN},
  UIMGENCRYP in '..\..\Imagen Ib Libs\Libs\UIMGENCRYP.pas',
  DM_Plantillas in '..\..\Imagen Ib Libs\DataMod\Plantillas\DM_Plantillas.pas' {DMPlantillas: TDataModule},
  Master_Intf in '..\..\Imagen Ib Volumetricos\Master\Master_Intf.pas',
  ServiciosTiempoAireRO_Intf in '..\Gas\ServiciosTiempoAireRO_Intf.pas',
  DDMServicios in '..\Gas\DDMServicios.pas' {DMServicios: TDataModule},
  ULIQREP08P in 'ULIQREP08P.pas' {FLIQREP08P},
  ULIQREP05P in 'ULIQREP05P.pas' {FLIQREP05P},
  ULIQREP05 in 'ULIQREP05.pas' {FLIQREP05},
  ULIQREP35 in 'ULIQREP35.pas' {FLIQREP35},
  ULIQLIQGNPC in 'ULIQLIQGNPC.pas' {FLIQLIQGNPC},
  DDMXML in '..\..\Imagen Ib Libs\DataMod\DDMXML.pas' {DMXML: TDataModule},
  ULIQGRF02P in 'ULIQGRF02P.pas' {FLIQGRF02P},
  ULIQGRF02 in 'ULIQGRF02.pas' {FLIQGRF02},
  ULIQGRF03P in 'ULIQGRF03P.pas' {FLIQGRF03P},
  ULIQGRF03 in 'ULIQGRF03.pas' {FLIQGRF03},
  ULIQREP38 in 'ULIQREP38.pas' {FLIQREP38},
  ULIQREP38P in 'ULIQREP38P.pas' {FLIQREP38P},
  ULIQFDEPF in 'ULIQFDEPF.pas' {FLIQFDEPF},
  ULIQFDEP in 'ULIQFDEP.pas' {FLIQFDEP},
  DDMPBD in '..\..\Imagen Ib Libs\DataMod\DDMPBD.pas' {DMPBD: TDataModule},
  UGENDERROR in '..\..\Imagen Ib\General\UGENDERROR.pas' {FGENDERROR},
  UCNTPOLICNF in '..\..\Imagen Ib Libs\DataMod\UCNTPOLICNF.pas' {FCNTPOLICNF},
  ULIQGRF05P in 'ULIQGRF05P.pas' {FLIQGRF05P},
  ULIQREP40P in 'ULIQREP40P.pas' {FLIQREP40P},
  ULIQREP41P in 'ULIQREP41P.pas' {FLIQREP41P},
  UEsperaRO in '..\..\Imagen Ib Libs\Util\UEsperaRO.pas' {FEsperaRO},
  ULIQLIQGR in 'ULIQLIQGR.pas' {FLIQLIQGR},
  ULIQREP40 in 'ULIQREP40.pas' {FLIQREP40},
  ULIQGRF01P in 'ULIQGRF01P.pas' {FLIQGRF01P},
  ULIQGRF01 in 'ULIQGRF01.pas' {FLIQGRF01},
  ULIQGRF04P in 'ULIQGRF04P.pas' {FLIQGRF04P},
  ULIQGRF04 in 'ULIQGRF04.pas' {FLIQGRF06},
  UGASXMLMES in '..\Gas\UGASXMLMES.pas' {FGASXMLMES},
  UGENXMLMES in '..\..\Imagen Ib\General\UGENXMLMES.pas' {FGENXMLMES},
  UGENCLIEBFACELE in '..\..\Imagen Ib\General\UGENCLIEBFACELE.pas' {FGENCLIEBFACELE},
  ULIQREP06C in 'ULIQREP06C.pas' {FLIQREP06C},
  UGENTIMBRADO in '..\..\Imagen IB\General\UGENTIMBRADO.pas' {FGENTIMBRADO},
  DDM_FACNET in '..\..\Imagen Ib Libs\DataMod\DDM_FACNET.pas' {DM_FACNET: TDataModule},
  fClientForm in '..\..\ImagenSoft Net\FACELE\Host\Delphi_PAS\fClientForm.pas' {ClientForm},
  Master_FACELELibrary_Intf in '..\..\ImagenSoft Net\FACELE\Host\Delphi_PAS\Master_FACELELibrary_Intf.pas',
  UCNTPOLIFiva2 in '..\..\Imagen Ib Libs\DataMod\UCNTPOLIFiva2.pas' {FCNTPOLIFiva2},
  UCNTPOLICxpDeud in '..\..\Imagen Ib Libs\DataMod\UCNTPOLICxpDeud.pas' {FCNTPOLICxpDeud},
  ULIQRECVALE in 'ULIQRECVALE.pas' {FLIQRECVALE},
  ULIQCONSRV in 'ULIQCONSRV.pas' {FLIQCONSRV},
  ULIQREP42P in 'ULIQREP42P.pas' {FLIQREP42P},
  ULIQREP42 in 'ULIQREP42.pas' {FLIQREP42},
  ULIQREP44 in 'ULIQREP44.pas' {FLIQREP44},
  ULIQREP44P in 'ULIQREP44P.pas' {FLIQREP44P},
  DDMGASNET in '..\Gas\DDMGASNET.pas' {DMGASNET: TDataModule},
  UFAGCARGANDO in '..\Fag\UFAGCARGANDO.pas' {FFAGCARGANDO},
  UEntidadesMasterNET in '..\..\Imagen Ib Libs\MasterNET\UEntidadesMasterNET.pas',
  DDMCUP in '..\Fag\DDMCUP.pas' {DMCUP: TDataModule},
  ULIQREP46P in 'ULIQREP46P.pas' {FLIQREP46P},
  ULIQREP46 in 'ULIQREP46.pas' {FLIQREP46},
  ULIQREP47 in 'ULIQREP47.pas' {FLIQREP47},
  ULIQREP06CD in 'ULIQREP06CD.pas' {FLIQREP06CD},
  ULIQREP06D in 'ULIQREP06D.pas' {FLIQREP06D},
  DDM_PUNTOS in '..\Gas\DDM_PUNTOS.pas' {DM_PUNTOS: TDataModule},
  UFacturaGas in '..\Fag\UFacturaGas.pas',
  UFAGCONSFAC in '..\Fag\UFAGCONSFAC.pas' {FFAGCONSFAC},
  UFAGFACCF in '..\Fag\UFAGFACCF.pas' {FFAGFACCF},
  UFAGEDITAR in '..\Fag\UFAGEDITAR.pas' {FFAGEDITAR},
  UFAGFACGF in '..\Fag\UFAGFACGF.pas' {FFAGFACGF},
  UFAGFACGN in '..\Fag\UFAGFACGN.pas' {FFAGFACGN},
  UFAGFACPF in '..\Fag\UFAGFACPF.pas' {FFAGFACPF},
  UFAGFACR in '..\Fag\UFAGFACR.pas' {FFAGFACR},
  UFAGFACRF in '..\Fag\UFAGFACRF.pas' {FFAGFACRF},
  UFAGFACRN in '..\Fag\UFAGFACRN.pas' {FFAGFACRN},
  UFAGLISTACEITES in '..\Fag\UFAGLISTACEITES.pas' {FFAGLISTACEITES},
  UFAGPAQUD3SERVFACELE in '..\Fag\UFAGPAQUD3SERVFACELE.pas' {FFAGPAQUD3SERVFACELE},
  UFAGPCANC in '..\Fag\UFAGPCANC.pas' {FFAGPCANC},
  UFAGSUST in '..\Fag\UFAGSUST.pas' {FFAGSUST},
  UFAGUTIL02 in '..\Fag\UFAGUTIL02.pas' {FFAGUTIL02},
  UFAGUTIL03 in '..\Fag\UFAGUTIL03.pas' {FFAGUTIL03},
  UFAGFACG in '..\Fag\UFAGFACG.pas' {FFAGFACG};

{$R *.RES}

begin
  FLIQSPLASH := TFLIQSPLASH.Create(Application);
  FLIQSPLASH.StaticText1.Caption:=VersionGasolinera;
  FLIQSPLASH.StaticText2.Caption:=ReviGenGas;
  if ParamStr(2)<>'SUITE' then
    FLIQSPLASH.Show;
  FLIQSPLASH.Update;
  GlobalExHandler:=TGlobalExHandler.Create;
  Application.OnException:=GlobalExHandler.HandlerProc;
  Application.Initialize;
  Application.Title := 'I-Gas Liquidaciones';
  Application.CreateForm(TFLIQMENU, FLIQMENU);
  Application.CreateForm(TDMGAS, DMGAS);
  Application.CreateForm(TDMGASP, DMGASP);
  Application.CreateForm(TDMGASQ, DMGASQ);
  Application.CreateForm(TDMGEN, DMGEN);
  Application.CreateForm(TDMGENQ, DMGENQ);
  Application.CreateForm(TDMGENT, DMGENT);
  Application.CreateForm(TDMGENP, DMGENP);
  Application.CreateForm(TDMCFG, DMCFG);
  Application.CreateForm(TDMCNT, DMCNT);
  Application.CreateForm(TDMBNC, DMBNC);
  Application.CreateForm(TFAVANCE, FAVANCE);
  Application.CreateForm(TFAcercaDe, FAcercaDe);
  Application.CreateForm(TFormaPreverTxt, FormaPreverTxt);
  Application.CreateForm(TDMGEN_VTAS, DMGEN_VTAS);
  Application.CreateForm(TDMPVG, DMPVG);
  Application.CreateForm(TDMLIQ, DMLIQ);
  Application.CreateForm(TFGENCLIEB, FGENCLIEB);
  Application.CreateForm(TFGASPRODB, FGASPRODB);
  Application.CreateForm(TFImpreDialog, FImpreDialog);
  Application.CreateForm(TDMINV, DMINV);
  Application.CreateForm(TFGENCCOSB, FGENCCOSB);
  Application.CreateForm(TFSelecTexto, FSelecTexto);
  Application.CreateForm(TFGENPRODB, FGENPRODB);
  Application.CreateForm(TFGASTCMBB, FGASTCMBB);
  Application.CreateForm(TDMCXC, DMCXC);
  Application.CreateForm(TDMRGS, DMRGS);
  Application.CreateForm(TDMACF, DMACF);
  Application.CreateForm(TDMCXP, DMCXP);
  Application.CreateForm(TDMIVA, DMIVA);
  Application.CreateForm(TFCNTPOLIF, FCNTPOLIF);
  Application.CreateForm(TFCNTPOLIConc, FCNTPOLIConc);
  Application.CreateForm(TFINVSALIF, FINVSALIF);
  Application.CreateForm(TFLIQDTPAG, FLIQDTPAG);
  Application.CreateForm(TFGASDESPB, FGASDESPB);
  Application.CreateForm(TFGENFORM, FGENFORM);
  Application.CreateForm(TFGENCTASB, FGENCTASB);
  Application.CreateForm(TFLIQREP29P, FLIQREP29P);
  Application.CreateForm(TFLIQREP29, FLIQREP29);
  Application.CreateForm(TDMCONS2, DMCONS2);
  Application.CreateForm(TDMCONS, DMCONS);
  Application.CreateForm(TFGENSELFORM, FGENSELFORM);
  Application.CreateForm(TFLIQLIQGNG, FLIQLIQGNG);
  Application.CreateForm(TFLIQREP31P, FLIQREP31P);
  Application.CreateForm(TFLIQREP31, FLIQREP31);
  Application.CreateForm(TFLIQREP32, FLIQREP32);
  Application.CreateForm(TFLIQTURCJT, FLIQTURCJT);
  Application.CreateForm(TFAutoriza, FAutoriza);
  Application.CreateForm(TFLIQDLIQE, FLIQDLIQE);
  Application.CreateForm(TFLIQLIQGIDesgloE, FLIQLIQGIDesgloE);
  Application.CreateForm(TFLIQPVALK, FLIQPVALK);
  Application.CreateForm(TFLIQRCUP, FLIQRCUP);
  Application.CreateForm(TFLIQTRAN, FLIQTRAN);
  Application.CreateForm(TFLIQRCUP2, FLIQRCUP2);
  Application.CreateForm(TFLIQPVAL, FLIQPVAL);
  Application.CreateForm(TDMAJUS, DMAJUS);
  Application.CreateForm(TFLIQLIQGIBLOQ, FLIQLIQGIBLOQ);
  Application.CreateForm(TFAutoriza3, FAutoriza3);
  Application.CreateForm(TFLIQRESEFEC, FLIQRESEFEC);
  Application.CreateForm(TFLIQRESEFECN, FLIQRESEFECN);
  Application.CreateForm(TDMPlantillas, DMPlantillas);
  Application.CreateForm(TDMServicios, DMServicios);
  Application.CreateForm(TFLIQREP08P, FLIQREP08P);
  Application.CreateForm(TFLIQREP05P, FLIQREP05P);
  Application.CreateForm(TFLIQREP05, FLIQREP05);
  Application.CreateForm(TFLIQREP35, FLIQREP35);
  Application.CreateForm(TFLIQLIQGNPC, FLIQLIQGNPC);
  Application.CreateForm(TDMXML, DMXML);
  Application.CreateForm(TDMPBD, DMPBD);
  Application.CreateForm(TFGENDERROR, FGENDERROR);
  Application.CreateForm(TFCNTPOLICNF, FCNTPOLICNF);
  Application.CreateForm(TFLIQREP40P, FLIQREP40P);
  Application.CreateForm(TFLIQREP40, FLIQREP40);
  Application.CreateForm(TFLIQGRF01P, FLIQGRF01P);
  Application.CreateForm(TFLIQGRF01, FLIQGRF01);
  Application.CreateForm(TFLIQGRF04P, FLIQGRF04P);
  Application.CreateForm(TFLIQGRF05P, FLIQGRF05P);
  Application.CreateForm(TFLIQREP41P, FLIQREP41P);
  Application.CreateForm(TFEsperaRO, FEsperaRO);
  Application.CreateForm(TFGENCLIEBFACELE, FGENCLIEBFACELE);
  Application.CreateForm(TFGENTIMBRADO, FGENTIMBRADO);
  Application.CreateForm(TDM_FACNET, DM_FACNET);
  Application.CreateForm(TClientForm, ClientForm);
  Application.CreateForm(TFCNTPOLIFiva2, FCNTPOLIFiva2);
  Application.CreateForm(TFCNTPOLICxpDeud, FCNTPOLICxpDeud);
  Application.CreateForm(TFLIQREP42P, FLIQREP42P);
  Application.CreateForm(TFLIQREP42, FLIQREP42);
  Application.CreateForm(TFLIQREP44, FLIQREP44);
  Application.CreateForm(TFLIQREP44P, FLIQREP44P);
  Application.CreateForm(TDMGASNET, DMGASNET);
  Application.CreateForm(TFFAGCARGANDO, FFAGCARGANDO);
  Application.CreateForm(TDMCUP, DMCUP);
  Application.CreateForm(TFLIQREP06CD, FLIQREP06CD);
  Application.CreateForm(TFLIQREP06D, FLIQREP06D);
  Application.CreateForm(TDM_PUNTOS, DM_PUNTOS);
  Application.CreateForm(TFFAGCONSFAC, FFAGCONSFAC);
  Application.CreateForm(TFFAGFACCF, FFAGFACCF);
  Application.CreateForm(TFFAGEDITAR, FFAGEDITAR);
  Application.CreateForm(TFFAGFACGF, FFAGFACGF);
  Application.CreateForm(TFFAGFACGN, FFAGFACGN);
  Application.CreateForm(TFFAGFACPF, FFAGFACPF);
  Application.CreateForm(TFFAGFACR, FFAGFACR);
  Application.CreateForm(TFFAGFACRF, FFAGFACRF);
  Application.CreateForm(TFFAGFACRN, FFAGFACRN);
  Application.CreateForm(TFFAGLISTACEITES, FFAGLISTACEITES);
  Application.CreateForm(TFFAGPAQUD3SERVFACELE, FFAGPAQUD3SERVFACELE);
  Application.CreateForm(TFFAGPCANC, FFAGPCANC);
  Application.CreateForm(TFFAGSUST, FFAGSUST);
  Application.CreateForm(TFFAGUTIL02, FFAGUTIL02);
  Application.CreateForm(TFFAGUTIL03, FFAGUTIL03);
  Application.CreateForm(TFFAGFACG, FFAGFACG);
  Application.Run;
end.
