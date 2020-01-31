import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/CodeContainer.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/Profile/ActiveButtons.dart';
import 'package:laborapp_trabajador/Profile/BasicData.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Web/LookUpOffersHttp.dart';
import '../Common/ColorPalette.dart';
import '../Common/LaborappButtons.dart';
import '../Util/UtilMethods.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var worker = SingletonWorker();

  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: getFullScreenWidth(context) * 0.5,
                    child: InicialsContainer().NormalInicials(context),
                  ),
                  CodeContainer(),
                ],
              ),
              AutoSizeText(
                SingletonWorker().name.toUpperCase(),
                maxLines: 1,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Color(ColorPalette.yellowApp),
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          BasicData(),
          ActiveButtons(),
          LaboraapButtons().NormalButton(
              colorCode: ColorPalette.strongGeryApp,
              buttonFunction: () {
                LookUpOffersHttp().LookUpOffers(context,RoutesNames.OfferScreen);
              },
              context: context,
              inText: "APLICAR A OFERTAS"),
        ],
      ),
    );
  }
}
