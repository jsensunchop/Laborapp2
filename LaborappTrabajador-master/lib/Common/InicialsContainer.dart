import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class InicialsContainer {
  Container buildInicials(BuildContext context) {
    Widget inicials = Container(
      width: MediaQuery.of(context).size.height * 0.2,
      height: getHeightWithoutSafeArea(context) * 0.2,
      decoration: new BoxDecoration(
        color: Color(ColorPalette.mediumGrayApp),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          getInicials(SingletonWorker().name),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 72, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );
    return inicials;
  }
}
