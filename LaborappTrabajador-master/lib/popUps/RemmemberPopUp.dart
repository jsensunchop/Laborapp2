import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Documents/documentsUpload.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class RemmemberPopUp extends StatefulWidget {
  @override
  _RemmemberPopUpState createState() => _RemmemberPopUpState();
}

class _RemmemberPopUpState extends State<RemmemberPopUp> {
  double commonRadius = 20.0;

  _goToDocuments(BuildContext context) {
    //Navigator.pushNamed(context, RoutesNames.SignUpPassword);
   Navigator.push(
        context, MaterialPageRoute(builder: (context) => documentsUpload()));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadius)),
      child: Container(
          width: getFullScreenWidth(context),
          height: getHeightWithoutSafeArea(context) * 0.7,
          padding: EdgeInsets.all(commonRadius),
          decoration: BoxDecoration(
              color: Color(ColorPalette.yellowApp),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(commonRadius),
                  topRight: Radius.circular(commonRadius)),
              boxShadow: [
                BoxShadow(
                    color: Color(ColorPalette.mediumGrayApp),
                    offset: const Offset(20.0, 15.0),
                    blurRadius: 5.0)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AutoSizeText(
                'Recuerde que para\n aplicar a las\n convocatorias de\n trabajo, debe tener los\n documentos básicos\n  subidos a la \n aplicación. (cédula, \n curso de altura y\n examen médico',
                style: TextStyle(
                  fontSize: 22.0,
                ),
                maxLines: 9,
                textAlign: TextAlign.center,
              ),
              LaboraapButtons().NormalButton(
                  inText: "SEGUIR",
                  buttonFunction: () => _goToDocuments(context),
                  context: context,
                  colorCode: ColorPalette.strongGeryApp)
            ],
          )),
    );
  }
}
