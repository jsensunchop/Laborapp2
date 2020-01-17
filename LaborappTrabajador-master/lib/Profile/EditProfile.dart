import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/CodeContainer.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/DataWithButton.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/Common/PublcityCarrousel.dart';
import 'package:laborapp_trabajador/Profile/BasicData.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  double _innerFontSize = 16.0;

  _changeProfile(BuildContext context){
    print("Se cambio");
  }
  buttonF() {
    print("DX");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context) * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InicialsContainer().NormalInicials(context),
              AutoSizeText(
                SingletonWorker().name.toUpperCase(),
                maxLines: 1,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Color(ColorPalette.yellowApp),
                    fontWeight: FontWeight.w800),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("CODIGO",
                      style: TextStyle(
                          fontSize: 27.0,
                          color: Color(ColorPalette.strongGeryApp),
                          fontWeight: FontWeight.w800)),
                  CodeContainer()
                ],
              )
            ],
          ),
          BasicData(),
          Container(
            width: getFullScreenWidth(context),
            height: 1.5,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  AutoSizeText(
                    "     Celular: ",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: _innerFontSize,
                        color: Color(ColorPalette.mediumGrayApp),
                        fontWeight: FontWeight.w300),
                  ),
                  DataWithButton.build(
                      fontSize: _innerFontSize,
                      inText: SingletonWorker().CelNumber.toUpperCase(),
                      context: context),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize * 2,
                      child: FlatButton(
                        onPressed: buttonF,
                        child: Icon(
                          Icons.edit,
                          size: _innerFontSize * 1.3,
                        ),
                      )),
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize * 2),
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize * 2)
                ],
              ),
            ],
          ),
          Container(
            width: getFullScreenWidth(context),
            height: 1.5,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText("     Cambiar clave: ********",
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: _innerFontSize,
                      color: Color(ColorPalette.mediumGrayApp),
                      fontWeight: FontWeight.w300)),
              Row(
                children: <Widget>[
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize * 2,
                      child: FlatButton(
                        onPressed: buttonF,
                        child: Icon(
                          Icons.edit,
                          size: _innerFontSize * 1.3,
                        ),
                      )),
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize * 2),
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize * 2)
                ],
              ),
            ],
          ),
          Container(
            width: getFullScreenWidth(context),
            height: getFullScreenHeight(context) * 0.05,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: FloatingActionButton(
                    heroTag: "btnClear",
                    child: Icon(Icons.clear),
                    backgroundColor: Colors.redAccent,
                    elevation: 0,
                    onPressed: () => {},
                  ),
                ),
                Center(
                  child: FloatingActionButton(
                    heroTag: "btnTrue",
                    child: Icon(Icons.done),
                    backgroundColor: Colors.green,
                    elevation: 0,
                    onPressed: ()=> _changeProfile(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
