import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class DataWithButton {
  static Widget build(
      {BuildContext context,
      String inText,
      Function buttonFunction,
      double fontSize}) {
    if (buttonFunction == null) {
      buttonFunction = () => print("XD");
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            inText,
            style: TextStyle(
                fontSize: fontSize,
                color: Color(ColorPalette.mediumGrayApp),
                fontWeight: FontWeight.w500),
          ),
          Container(
            width: getFullScreenWidth(context) * 0.1,
            height: fontSize + 10,
            child: FlatButton(
              onPressed: buttonFunction,
              child: Icon(Icons.highlight_off,size: fontSize * 1.3,),
            ),
          )
        ],
      ),
    );
  }
}
