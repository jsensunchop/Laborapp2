import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class InicialsContainer {
  Container NormalInicials(BuildContext context) {
    Widget inicials = Container(
      width: MediaQuery.of(context).size.height * 0.1,
      height: getHeightWithoutSafeArea(context) * 0.1,
      decoration: new BoxDecoration(
        color: Color(ColorPalette.mediumGrayApp),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: AutoSizeText(
          getInicials(SingletonWorker().name),
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
              fontSize: 35.0, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );
    return inicials;
  }

  Container SmallInicials(BuildContext context) {
    Widget inicials = Container(
      width: MediaQuery.of(context).size.height * 0.1,
      height: getHeightWithoutSafeArea(context) * 0.1,
      decoration: new BoxDecoration(
        color: Color(ColorPalette.mediumGrayApp),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: AutoSizeText(
          getInicials(SingletonWorker().name),
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
              fontSize: 35.0, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );
    return inicials;
  }

  Container TileInicials(BuildContext context) {
    Widget inicials = Container(
      width: MediaQuery.of(context).size.height * 0.08,
      height: getHeightWithoutSafeArea(context) * 0.08,
      decoration: new BoxDecoration(
        color: Color(ColorPalette.mediumGrayApp),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: AutoSizeText(
          getInicials(SingletonWorker().name),
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );
    return inicials;
  }
}
