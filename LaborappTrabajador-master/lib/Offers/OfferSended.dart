import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';

import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Web/ReloadActiveOffers.dart';

class OfferSended extends StatelessWidget {

  _goToLookUpOffers(BuildContext context) {
    ReloadActiveOffersHttp().ReloadOffers(context);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = new TextStyle(
        color: Color(ColorPalette.strongGeryApp),
        fontSize: 22.0,
        fontWeight: FontWeight.w300);
    TextStyle boldTextStyle = new TextStyle(
        color: Color(ColorPalette.strongGeryApp),
        fontSize: 22.0,
        fontWeight: FontWeight.w500);

    return Scaffold(
      appBar: LaborAppBar().build(context),
      body: Container(
        height: getHeightWithoutSafeArea(context),
        width: getFullScreenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              "Su solicitud fue",
              style: textStyle,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              "ENVIADA CON ÉXITO",
              style: boldTextStyle,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              "por favor espere a que se\ncomuniquen con usted por\neste mismo medio,\nconfirmando el día, la hora\ny el sitio al que se debe presentar.",
              style: textStyle,
              maxLines: 7,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getHeightWithoutSafeArea(context)*0.1),
            OutlineButton(
              textColor: Color(ColorPalette.yellowApp),
              borderSide:
                  BorderSide(color: Color(ColorPalette.yellowApp), width: 1.5),
              onPressed: () => _goToLookUpOffers(context),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text("entendido".toUpperCase(),
                  style:
                      TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800)),
            )
          ],
        ),
      ),
    );
  }
}
