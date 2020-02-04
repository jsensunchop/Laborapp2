import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Password/NewPassword.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class MissingPaswordPopUp extends StatelessWidget {
  String _verificationCode;
  double _commonRadius = 20.0;

  sendVerifyCode(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewPassword()));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_commonRadius)),
      child: Container(
        padding: EdgeInsets.all(_commonRadius),
        decoration: BoxDecoration(
            color: Color(ColorPalette.yellowApp),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(_commonRadius)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              'Se envió un mensaje \n de texto con un CÓDIGO \n para RESTAURAR \n la contraseña',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w300),
              maxLines: 4,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getHeightWithoutSafeArea(context) * 0.05),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  top: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              width: getFullScreenWidth(context) * 0.6,
              child: TextField(
                textAlign: TextAlign.center,
                autocorrect: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Código de verificación",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18.0),
                    border: InputBorder.none),
                onChanged: (String text) {
                  _verificationCode = text;
                },
              ),
            ),
            SizedBox(height: getHeightWithoutSafeArea(context) * 0.1),
            LaboraapButtons().NormalButton(
                inText: "Ingresar",
                colorCode: ColorPalette.strongGeryApp,
                context: context,
                buttonFunction: () {}
                )
          ],
        ),
      ),
    );
  }
}
