import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class OffertPopUp extends StatelessWidget {
  double commonRadius = 20.0;
  String _buildOffertText(){
    return "XD";
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadius)),
      child: Container(
        width: getFullScreenWidth(context),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AutoSizeText(
              _buildOffertText(),
              maxLines: 12,
              style: TextStyle(fontSize: 22.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
