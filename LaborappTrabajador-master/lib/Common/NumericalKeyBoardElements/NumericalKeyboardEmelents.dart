import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class NumericalKeyboardElement {
  Widget NumericalContainer(
      {BuildContext context,
      int colorCode,
      Widget containerButton,
      Border containerBorder}) {
    return Container(
        width: getFullScreenWidth(context) * 0.3,
        height: getHeightWithoutSafeArea(context) * 0.1,
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

  Border leftCotainerBorder() {
    return Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 3.0,
        ),
        left: BorderSide(
          color: Colors.grey,
          width: 3.0,
        ));
  }

  Border midCotainerBorder() {
    return Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 3.0,
      ),
    );
  }

  Border rightCotainerBorder() {
    return Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 3.0,
        ),
        right: BorderSide(
          color: Colors.grey,
          width: 3.0,
        ));
  }
}
