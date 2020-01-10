import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class WorkerPopUp extends StatelessWidget {
  double commonRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadius)),
      child: Container(
        height: getHeightWithoutSafeArea(context) * 0.7,
        padding: EdgeInsets.all(commonRadius),
        decoration: BoxDecoration(
            color: Color(ColorPalette.yellowApp),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(commonRadius),
                topRight: Radius.circular(commonRadius)),
            boxShadow: [
              BoxShadow(
                  color: Color(ColorPalette.mediumGrayApp),
                  offset: const Offset(20.0, 15.0),
                  blurRadius: 5.0)
            ]),
      ),
    );
  }
}
