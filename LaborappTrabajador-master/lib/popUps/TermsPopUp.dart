import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class TermsPopUp extends StatefulWidget {
  @override
  _TermsPopUpState createState() => _TermsPopUpState();
}

class _TermsPopUpState extends State<TermsPopUp> {
  double commonRadius = 20.0;
  bool _termsAccepted = false;
  bool _dataAccepted = false;
  bool _contractAccepted = false;

  _endSignUp(BuildContext context) {
    if (_termsAccepted == _dataAccepted &&
        _dataAccepted == _contractAccepted &&
        _contractAccepted == true) {
      print("Puede registrarse");
    }else{
      print("No se puede registrar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadius)),
      child: Container(
        width: getFullScreenWidth(context),
        padding: EdgeInsets.all(commonRadius),
        decoration: BoxDecoration(
            color: Color(ColorPalette.yellowApp),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(commonRadius)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("PERMISOS",
                style: TextStyle(fontSize: 22.0, color: Colors.white)),
            Container(
              width: getFullScreenWidth(context) * 0.7,
              height: getFullScreenHeight(context) * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: AutoSizeText(
                      "Acepto términos y condiciones",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    width: getFullScreenWidth(context) * 0.55,
                  ),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: Checkbox(
                      activeColor: Colors.transparent,
                      value: _termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          _termsAccepted = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: 2.0,
                width: getFullScreenWidth(context) * 0.5,
                color: Colors.white),
            Container(
              width: getFullScreenWidth(context) * 0.7,
              height: getFullScreenHeight(context) * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: AutoSizeText(
                      "Acepto uso de mis datos para el\n envío y contratación de empresas",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    width: getFullScreenWidth(context) * 0.55,
                  ),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: Checkbox(
                      activeColor: Colors.transparent,
                      value: _dataAccepted,
                      onChanged: (value) {
                        setState(() {
                          _dataAccepted = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: 2.0,
                width: getFullScreenWidth(context) * 0.5,
                color: Colors.white),
            Container(
              width: getFullScreenWidth(context) * 0.7,
              height: getFullScreenHeight(context) * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: AutoSizeText(
                      "Acepto uso de mis documentos para\n el envío y contratación de empresas",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    width: getFullScreenWidth(context) * 0.55,
                  ),
                  Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: Checkbox(
                      activeColor: Colors.transparent,
                      value: _contractAccepted,
                      onChanged: (value) {
                        setState(() {
                          _contractAccepted = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getFullScreenHeight(context) * 0.3,
            ),
            LaboraapButtons().NormalButton(
                inText: "Entrar",
                colorCode: ColorPalette.strongGeryApp,
                context: context,
                buttonFunction: () => _endSignUp(context))
          ],
        ),
      ),
    );
  }
}
