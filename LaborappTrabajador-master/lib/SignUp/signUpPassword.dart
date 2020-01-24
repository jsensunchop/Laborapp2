import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Common/NumericalKeyboard.dart';
import 'package:laborapp_trabajador/Common/PinBox.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonNavigation.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/TermsScreen.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class SignUpPassword extends StatefulWidget {
  @override
  _SignUpPasswordState createState() => _SignUpPasswordState();
}



class _SignUpPasswordState extends State<SignUpPassword> {  int _screenBoxes = 8;
int _currentBox = 0;
var _pin = ["x", "x", "x", "x","x", "x", "x", "x"];
Duration _animationDuration = Duration(milliseconds: 500);

var _borderColor = [
  ColorPalette.white,
  ColorPalette.white,
  ColorPalette.white,
  ColorPalette.white,
  ColorPalette.white,
  ColorPalette.white,
  ColorPalette.white,
  ColorPalette.white,
  ColorPalette.white,
  ColorPalette.white
];
List<Color> _textColor = [
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent
];

String _text = "";

List<Widget> _getBoxes() {
  List<Widget> boxes = new List<Widget>();
  for (int i = 0; i < _screenBoxes; i++) {
    boxes.add(PinBox().getPinBox(
        context: context,
        animationDuration: _animationDuration,
        borderColor: _borderColor[i],
        textColor: _textColor[i],backGroundColor: Color(ColorPalette.mediumGrayApp)));
  }
  return boxes;
}

_goOut() {
  Navigator.pop(context);
}

_putNumber(String currentButton) {
  if (_currentBox > _screenBoxes - 1) return;
  setState(() {
    _pin[_currentBox] = currentButton;
    _textColor[_currentBox] = Color(ColorPalette.white);
    _text = "*";
    _borderColor[_currentBox] = ColorPalette.white;
    _currentBox++;
  });
}

_delete() {
  if (_currentBox <= 0) return;
  setState(() {
    _currentBox--;
    _pin[_currentBox] = "x";
    _textColor[_currentBox] = Colors.transparent;
    _text = "";
    _borderColor[_currentBox] = ColorPalette.strongGeryApp;
  });
}

_signUp(BuildContext contextT) {
  String pss = '';
  for(int i = 0; i < _screenBoxes - 4; i++){
    if(_pin[i] == 'x')return;
    if(_pin[i] != _pin[i+4]) {
      print("Miss match");
      return;
    }
    pss = pss + _pin[i];
    SingletonWorker().pss = pss;
  }
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => TermsScreen()));
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: LaborAppBar().build(context),
    body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/TrabajadorG.jpeg'),
              fit: BoxFit.cover,
            )),
        width: getFullScreenWidth(context),
        height: getHeightWithoutSafeArea(context) * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  "PIENSE EN UNA CLAVE".toUpperCase(),
                  style: TextStyle(
                      color: Color(
                        ColorPalette.white,
                      ),
                      fontSize: 24.0),
                  maxLines: 1,
                ),
                Container(
                  width: getFullScreenWidth(context) * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _getBoxes().sublist(0,4),
                  ),
                ),
              ],
            ),
            Container(
              //color: Colors.green,
              width: getFullScreenWidth(context) * 0.6,
              height: getHeightWithoutSafeArea(context) * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: getFullScreenWidth(context) * 0.4,
                    height:  getHeightWithoutSafeArea(context) * 0.05,
                  ),
                  Text("REPÍTALA",
                      style: TextStyle(
                          color: Color(
                            ColorPalette.white,
                          ),
                          fontSize: 24.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _getBoxes().sublist(4,8),
                  )
                ],
              ),
            ),
            NumericalKeyboard().LaboraapNumericalKeyboard(
                context: context,
                colorCode: ColorPalette.white,
                buttonFunction: (String currentButton) =>
                    _putNumber(currentButton),
                deleteFunction: () => _delete(),
                goOut: () => _goOut()),
            Container(
              height: getHeightWithoutSafeArea(context) * 0.06,
              width: getFullScreenWidth(context) * 0.5,
            ),
            LaboraapButtons().NormalButton(
                inText: "Confirmar".toUpperCase(),
                buttonFunction: () => _signUp(context),
                context: context,
                colorCode: ColorPalette.yellowApp)
          ],
        ),
      ),
    ),
  );
}
}
