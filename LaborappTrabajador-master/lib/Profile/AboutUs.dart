import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.transparent,
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context) * 0.65,
      child: Column(
        children: <Widget>[
          Text("NOSOTROS\n",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 32.0,
            color: Color(ColorPalette.yellowApp)
          ),
          ),
          Container(
            width: getFullScreenWidth(context) * 0.9,
            child: Text(
              "Labor-app es una plataforma que conecta a trabajadores con una red de constructoras,  contratistas, y proveedores en el área de la construcción.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18.0,
              ),
            ),
          ),
          Container(
              height: getFullScreenHeight(context) * 0.3,
              width: getFullScreenWidth(context) * 0.3,
              child: Image(
                image: AssetImage('images/splash.png'),
              )
          )
        ],
      ),
    );
  }
}
