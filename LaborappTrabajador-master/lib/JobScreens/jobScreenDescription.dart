import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class jobScreenDescription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
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
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
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