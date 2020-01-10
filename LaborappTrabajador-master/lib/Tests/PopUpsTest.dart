import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class PopUpTest extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaborAppBar().build(context),
      body: Container(
        width: getFullScreenWidth(context),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            LaboraapButtons().NormalButton(
                inText: "Constraseña",
                colorCode: ColorPalette.yellowApp,
                context: context,
                buttonFunction:()=>showMissingPaswordPopUp(context)),
            LaboraapButtons().NormalButton(
                inText: "Terminos",
                colorCode: ColorPalette.yellowApp,
                context: context,
                buttonFunction:()=>showTermsPopUp(context)),
            LaboraapButtons().NormalButton(
                inText: "Documento",
                colorCode: ColorPalette.yellowApp,
                context: context,
                buttonFunction:()=>showDocumentPopUp(context)),
            LaboraapButtons().NormalButton(
                inText: "Aceptado",
                colorCode: ColorPalette.yellowApp,
                context: context,
                buttonFunction:()=>showAcceptedPopUp(context)),
            LaboraapButtons().NormalButton(
                inText: "Oferta",
                colorCode: ColorPalette.yellowApp,
                context: context,
                buttonFunction:()=>showOffertPopUp(context)),
            LaboraapButtons().NormalButton(
                inText: "Recuerda",
                colorCode: ColorPalette.yellowApp,
                context: context,
                buttonFunction:()=>showRemmemberPopUp(context)),
            LaboraapButtons().NormalButton(
                inText: "Disponible",
                colorCode: ColorPalette.yellowApp,
                context: context,
                buttonFunction:()=>showOnPopUp(context)),
            LaboraapButtons().NormalButton(
                inText: "Ocupado",
                colorCode: ColorPalette.yellowApp,
                context: context,
                buttonFunction:()=>showOffPopUp(context)),
          ],
        ),

      ),
    );
  }
}
