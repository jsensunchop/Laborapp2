import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';

class TermsPopUp extends StatelessWidget {
  double commonRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadius)),
      child: Container(
        padding: EdgeInsets.all(commonRadius),
        decoration: BoxDecoration(
            color: Color(ColorPalette.yellowApp),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(commonRadius)),
      ),
    );
  }
}
