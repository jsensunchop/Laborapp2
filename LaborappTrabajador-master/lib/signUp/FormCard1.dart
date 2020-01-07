import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormCard1 extends StatelessWidget {
  void _showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Selecciona la especialidad en la que\n"
          "tienes mas experiencia, dependiendo de\n"
          "esta te apareceran ofertas de trabajo\n"
          "similares a tu habilidad",
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.black38,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(320),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    " ELIJA EL TIPO DE ESPECIALIDAD\n            EN LA QUE TRABAJA",
                    style: TextStyle(
                        fontFamily: "Robotto",
                        fontSize: ScreenUtil.getInstance().setSp(38),
                        letterSpacing: .6,
                        color: Colors.black))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
