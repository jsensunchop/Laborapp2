import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Common/NumericalKeyboard.dart';
import 'package:laborapp_trabajador/Common/PinBox.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';


class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  int _screenBoxes = 8;
  int _currentBox = 0;
  var _pin = ["x", "x", "x", "x","x", "x", "x", "x"];
  Duration _animationDuration = Duration(milliseconds: 500);

  var _borderColor = [
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp,
    ColorPalette.strongGeryApp
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
      print(i);
      boxes.add(PinBox().getPinBox(
          context: context,
          animationDuration: _animationDuration,
          borderColor: _borderColor[i],
          textColor: _textColor[i]));
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
      _textColor[_currentBox] = Color(ColorPalette.yellowApp);
      _text = "*";
      _borderColor[_currentBox] = ColorPalette.yellowApp;
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

  _changePassword() {
    for(int i = 0; i < _screenBoxes; i++){
      if(_pin[i] != _pin[i+4]) {
        print("Miss match");
        return;
      }
    }
    print(_pin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaborAppBar().build(context),
      body: Container(
        color: Colors.white,
        width: getFullScreenWidth(context),
        height: getHeightWithoutSafeArea(context) * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              "INTRODUZCA CONTRASEÑA".toUpperCase(),
              style: TextStyle(
                  color: Color(
                    ColorPalette.mediumGrayApp,
                  ),
                  fontSize: 24.0),
              maxLines: 1,
            ),
            Container(
              //color: Colors.green,
              width: getFullScreenWidth(context) * 0.6,
              height: getHeightWithoutSafeArea(context) * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _getBoxes().sublist(0,4),
                  ),
                  Container(
                    color: Color(ColorPalette.mediumGrayApp),
                    width: getFullScreenWidth(context) * 0.4,
                    height: 1.0,
                  ),
                  Text("REPÍTALA",
                      style: TextStyle(
                          color: Color(
                            ColorPalette.mediumGrayApp,
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
                colorCode: ColorPalette.softGrayApp,
                buttonFunction: (String currentButton) =>
                    _putNumber(currentButton),
                deleteFunction: () => _delete(),
                goOut: () => _goOut()),
            Container(
              height: getHeightWithoutSafeArea(context) * 0.06,
              width: getFullScreenWidth(context) * 0.5,
            ),
            LaboraapButtons().NormalButton(
                inText: "Entrar",
                buttonFunction: () => _changePassword(),
                context: context,
                colorCode: ColorPalette.yellowApp)
          ],
        ),
      ),
    );
  }
}
