import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';

class LaboraapButtons {
  String getNormalButtonString(String posibleText) {
    if (posibleText.length == 10) {
      return posibleText;
    } else {
      if (posibleText.length % 2 == 0) {
        posibleText = " " + posibleText;
        return getNormalButtonString(posibleText);
      } else {
        posibleText = posibleText + " ";
        return getNormalButtonString(posibleText);
      }
    }
  }

  int getButtonTextColor(int colorCode) {
    return colorCode == ColorPalette.yellowApp
        ? ColorPalette.strongGeryApp
        : ColorPalette.softGrayApp;
  }

  Widget NormalButton({String inText, int colorCode, Function buttonFunction}) {
    inText = getNormalButtonString(inText).toUpperCase();
    print(inText.length);
    return FlatButton(
      color: Color(colorCode),
      textColor: Color(getButtonTextColor(colorCode)),
      onPressed: (){
        buttonFunction();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(inText, style: TextStyle(fontSize: 22.0)),
    );
  }
}
