import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Common/NumericalKeyboard.dart';
import 'package:laborapp_trabajador/Common/PinBox.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Web/ChangePassword.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  int _screenBoxes = 8;
  int _currentBox = 0;
  var _pin = ["x", "x", "x", "x", "x", "x", "x", "x"];
  String _pss = "";
  String _newPss = "";
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

  bool _changePassword() {
    _pss = "";
    _newPss = "";
    for (int i = 0; i < 4; i++) {
      if (_pin[i] == "x" || _pin[4 + i] == "x") return false;
      _pss += _pin[i];
      _newPss += _pin[4 + i];
    }
    return true;
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  "INTRODUZCA CONTRASEÑA ANTIGUA".toUpperCase(),
                  style: TextStyle(
                      color: Color(
                        ColorPalette.mediumGrayApp,
                      ),
                      fontSize: 24.0),
                  maxLines: 1,
                ),
                Container(
                  width: getFullScreenWidth(context) * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _getBoxes().sublist(0, 4),
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
                    height: getHeightWithoutSafeArea(context) * 0.05,
                  ),
                  Text("NUEVA CONTRASEÑA",
                      style: TextStyle(
                          color: Color(
                            ColorPalette.mediumGrayApp,
                          ),
                          fontSize: 24.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _getBoxes().sublist(4, 8),
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
                inText: "Cambiar",
                buttonFunction: () {
                  if (_changePassword()) {
                    ChangePasswordHttp().changePassword(context, _pss, _newPss);
                  }
                },
                context: context,
                colorCode: ColorPalette.yellowApp)
          ],
        ),
      ),
    );
  }
}
