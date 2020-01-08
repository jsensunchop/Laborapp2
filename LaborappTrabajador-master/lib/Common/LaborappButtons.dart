import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class LaboraapButtons {
  int getButtonTextColor(int colorCode) {
    return colorCode == ColorPalette.yellowApp
        ? ColorPalette.strongGeryApp
        : ColorPalette.softGrayApp;
  }

  Widget NormalButton(
      {String inText,
      int colorCode,
      Function buttonFunction,
      BuildContext context}) {

    double buttonHeight = getHeightWithoutSafeArea(context) * 0.06;
    double buttonWidth = getFullScreenWidth(context) * 0.5;
    if(inText.split(" ").length > 1)
    {
      buttonWidth = getFullScreenWidth(context) * 0.8;
    }

    var buttonContainer = Container(
      height: buttonHeight,
      width: buttonWidth,
      child: FlatButton(
        color: Color(colorCode),
        textColor: Color(getButtonTextColor(colorCode)),
        onPressed: () => buttonFunction(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(inText.toUpperCase(),
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800)),
      ),
    );
    return buttonContainer;
  }

  Widget PopUpButton(
      {String inText,
        int colorCode = 0,
        Function buttonFunction,
        BuildContext context}) {

    double buttonHeight = getHeightWithoutSafeArea(context) * 0.06;
    double buttonWidth = getFullScreenWidth(context) * 0.6;
    var button;
    if(colorCode != ColorPalette.strongGeryApp){
      button = OutlineButton(
        color: Color(colorCode),
        textColor: Colors.white,
        borderSide: BorderSide(color: Colors.white,width: 2.0),
        onPressed: () => buttonFunction(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(inText.toUpperCase(),
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800)),
      );
    }else{
      button = FlatButton(
        color: Color(colorCode),
        textColor: Color(getButtonTextColor(colorCode)),
        onPressed: () => buttonFunction(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(inText.toUpperCase(),
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800)),
      );
    }

    var buttonContainer = Container(
      height: buttonHeight,
      width: buttonWidth,
      child: button
    );
    return buttonContainer;
  }
}
