import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

class documentsUploadDescription extends StatelessWidget {

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
                AutoSizeText(
                  "AHORA, ES EL MOMENTO DE \n"
                  "SUBIR LOS DOCUMENTOS, \n"
                  "SÓLO ES TOMARLE FOTO CON \n"
                  "EL CELULAR A CADA UNO",
                  maxLines: 4,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}