import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/CodeContainer.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/Offers/LookUpOffer.dart';
import 'package:laborapp_trabajador/Offers/OfferScreen.dart';
import 'package:laborapp_trabajador/Profile/AboutUs.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Web/LookUpOffersHttp.dart';
import 'package:laborapp_trabajador/Web/MyOffersHttp.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class ProfileStartScreen extends StatefulWidget {
  @override
  _ProfileStartScreenState createState() => _ProfileStartScreenState();
}

class _ProfileStartScreenState extends State<ProfileStartScreen> {
  _goTO() {
    LookUpOffersHttp().LookUpOffers(context,RoutesNames.OfferScreen);
  }

  _goTomyOffers() {
    MyOffersHttp().MyOffers(context,RoutesNames.ShowCurrentOffers);
  }

  int d = 0;

  bool _checkDocuments() {
    if (SingletonWorker().documents.length <= 2) {
      showRemmemberPopUp(context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    //Timer(Duration(microseconds: 200),_checkDocuments());

    return Container(
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context) * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InicialsContainer().NormalInicials(context),
              AutoSizeText(
                SingletonWorker().name.toUpperCase(),
                maxLines: 1,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Color(ColorPalette.yellowApp),
                    fontWeight: FontWeight.w800),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("CODIGO",
                      style: TextStyle(
                          fontSize: 27.0,
                          color: Color(ColorPalette.strongGeryApp),
                          fontWeight: FontWeight.w800)),
                  CodeContainer()
                ],
              )
            ],
          ),
          Container(
            width: getFullScreenWidth(context) * 0.9,
            height: getHeightWithoutSafeArea(context) * 0.07,
            child: OutlineButton(
              color: Color(ColorPalette.strongGeryApp),
              textColor: Color(ColorPalette.strongGeryApp),
              borderSide: BorderSide(
                  color: Color(ColorPalette.strongGeryApp), width: 1.0),
              onPressed: () {
                /**
                 * IMPORTANTE
                 * IMPORTANTE
                 * IMPORTANTE
                 **/
                if (!_checkDocuments()) {
                  _goTO();
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: AutoSizeText(
                "ver convocatorias".toUpperCase(),
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: getFullScreenWidth(context) * 0.9,
            height: getHeightWithoutSafeArea(context) * 0.07,
            child: OutlineButton(
              color: Color(ColorPalette.strongGeryApp),
              textColor: Color(ColorPalette.strongGeryApp),
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              onPressed: () {
                _goTomyOffers();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: AutoSizeText(
                "REVISAR MIS POSTULACIONES".toUpperCase(),
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w400),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: getFullScreenWidth(context) * 0.9,
            height: getHeightWithoutSafeArea(context) * 0.07,
            child: OutlineButton(
              color: Color(ColorPalette.strongGeryApp),
              textColor: Color(ColorPalette.strongGeryApp),
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              onPressed: () {

              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: AutoSizeText(
                "VER MIS POSTULACIONES ANTERIORES".toUpperCase(),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: getHeightWithoutSafeArea(context) * 0.01,)
        ],
      ),
    );
  }
}
