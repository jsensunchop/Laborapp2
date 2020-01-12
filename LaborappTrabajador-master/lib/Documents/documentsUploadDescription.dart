import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'filterChip.dart';

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
            Align
              (
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Localidad:",
                  style: TextStyle(color: Colors.black26,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Align
                (
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Wrap(
                      spacing: 5.0,
                      runSpacing: 3.0,
                      children: <Widget>[
                        filterChipWidget(chipName: 'Elevator'),
                        filterChipWidget(chipName: 'Washer/Dryer'),
                      ],
                    )
                ),
              ),
            ),
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