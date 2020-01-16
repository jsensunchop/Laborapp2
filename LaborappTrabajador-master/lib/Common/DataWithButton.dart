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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              inText,
              style: TextStyle(
                  fontSize: fontSize,
                  color: Color(ColorPalette.mediumGrayApp),
                  fontWeight: FontWeight.w500),
            ),
          ),
          GestureDetector(
              onTap: (){
                buttonFunction();
              },
              child: Icon(Icons.highlight_off,size: fontSize * 1.3,),
            ),

        ],
      ),
    );
  }
}
