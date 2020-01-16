import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Localization/localizationScreen.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class TermsScreen extends StatefulWidget {
  @override
  _TermsScreenState createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  double commonRadius = 20.0;

  bool _termsAccepted = false;

  bool _dataAccepted = false;

  bool _contractAccepted = false;

  _endSignUp(BuildContext context) {
    if (_termsAccepted == _dataAccepted &&
        _dataAccepted == _contractAccepted &&
        _contractAccepted == true) {
      print("Puede registrarse");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => localizationScreen()));
    } else {
      print("No se puede registrar");
    }
  }

  @override
  Widget build(BuildContext context) {
    var space = SizedBox(
      height: getFullScreenHeight(context) * 0.05,
    );

    return Scaffold(
      body: Center(
        child: Container(
          height: getFullScreenHeight(context) * 0.9,
          width: getFullScreenWidth(context) * 0.8,
          padding: EdgeInsets.all(commonRadius),
          decoration: BoxDecoration(
              color: Color(ColorPalette.yellowApp),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(commonRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              space,
              Text("PERMISOS",
                  style: TextStyle(
                      fontSize: 22.0, color: Color(ColorPalette.white))),
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
                        style: TextStyle(
                            color: Color(ColorPalette.strongGeryApp),
                            fontSize: 18.0),
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
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(ColorPalette.strongGeryApp),
                            fontSize: 18.0),
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
                        "Acepto uso de mis documentos para\nel envío y contratación de empresas",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(ColorPalette.strongGeryApp),
                            fontSize: 18.0),
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
                height: getFullScreenHeight(context) * 0.1,
              ),
              LaboraapButtons().NormalButton(
                  inText: "Entrar",
                  colorCode: ColorPalette.strongGeryApp,
                  context: context,
                  buttonFunction: () => _endSignUp(context)),
              SizedBox(
                height: getFullScreenHeight(context) * 0.18,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                        child: Icon(Icons.info_outline,
                            size: 60, color: Color(ColorPalette.strongGeryApp)),
                        onPressed: () => print("No se"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
