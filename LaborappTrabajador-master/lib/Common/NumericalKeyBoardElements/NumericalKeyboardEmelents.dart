import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class NumericalKeyboardElement {

  double _borderWith = 1.0;
  Widget NumericalContainer(
      {BuildContext context,
      int colorCode,
      Widget containerButton,
      Border containerBorder}) {
    return Container(
        width: getFullScreenWidth(context) * 0.2,
        height: getHeightWithoutSafeArea(context) * 0.07,
        decoration: new BoxDecoration(
          border: containerBorder,
        ),
        child: containerButton);
  }

  Widget KeyboardButton(
      {int colorCode, String buttonText, Function buttonFunction}) {
    var buttonChild;
    if (buttonText == null) {
      buttonChild = Icon(
        Icons.backspace,
        size: 42.0,
      );
    } else {
      buttonChild = Text(buttonText,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800));
    }
    return FlatButton(
      color: Colors.transparent,
      textColor: Color(colorCode),
      onPressed: () => buttonFunction(),
      child: buttonChild,
    );
  }

  Border leftCotainerBorder(int colorCode) {
    return Border(
        bottom: BorderSide(
          color: Color(colorCode),
          width: _borderWith,
        ),
        left: BorderSide(
          color: Color(colorCode),
          width: _borderWith,
        ));
  }

  Border midCotainerBorder(int colorCode) {
    return Border(
      bottom: BorderSide(
        color: Color(colorCode),
        width: _borderWith,
      ),
    );
  }

  Border rightCotainerBorder(int colorCode) {
    return Border(
        bottom: BorderSide(
          color: Color(colorCode),
          width: _borderWith,
        ),
        right: BorderSide(
          color: Color(colorCode),
          width: _borderWith  ,
        ));
  }
}
