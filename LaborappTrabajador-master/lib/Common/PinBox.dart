import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class PinBox {
  Widget getPinBox(
      {Duration animationDuration,
      int borderColor,
      Color textColor,
      BuildContext context, Color backGroundColor}) {
    if(backGroundColor == null){
      backGroundColor = Colors.transparent;
    }
    return AnimatedContainer(
      duration: animationDuration,
      height: getHeightWithoutSafeArea(context) * 0.06,
      width: getHeightWithoutSafeArea(context) * 0.06,
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(width: 2.0, color: Color(borderColor)),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: AnimatedDefaultTextStyle(
        duration: animationDuration,
        child: Text(
          "*",
          textAlign: TextAlign.center,
        ),
        style: TextStyle(
          color: textColor,
          fontSize: 42,
        ),
      ),
    );
  }
}
