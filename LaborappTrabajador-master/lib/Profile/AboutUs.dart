import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.transparent,
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context) * 0.65,);
  }
}
