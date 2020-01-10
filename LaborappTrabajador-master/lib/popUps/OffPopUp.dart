import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class OffPopUp extends StatelessWidget {
  double commonRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadius)),
      child: Container(
        width: getFullScreenWidth(context) * 0.5,
        height: getHeightWithoutSafeArea(context) * 0.26,
        padding: EdgeInsets.all(commonRadius),
        decoration: BoxDecoration(
            color: Color(ColorPalette.yellowApp),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(commonRadius),
            boxShadow: [
              BoxShadow(
                  color: Color(ColorPalette.mediumGrayApp),
                  offset: const Offset(20.0, 15.0),
                  blurRadius: 5.0)
            ]),
        child: AutoSizeText(
          'El botón OCUPADO se activa cuando usted ya es contratado por una empresa a través de la app y cuando termina su contrato se vuelve a poner en verde. Cuando está activado, es de color rojo.',
          style: TextStyle(
            fontSize: 30.0,
          ),
          maxLines: 8,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
