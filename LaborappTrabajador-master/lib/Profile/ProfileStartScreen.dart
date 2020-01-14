import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/CodeContainer.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/Common/PublcityCarrousel.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';


class ProfileStartScreen extends StatefulWidget {
  @override
  _ProfileStartScreenState createState() => _ProfileStartScreenState();
}

class _ProfileStartScreenState extends State<ProfileStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context) * 0.9,
      //color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: getFullScreenWidth(context),
            height: getHeightWithoutSafeArea(context) * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InicialsContainer().NormalInicials(context),
                AutoSizeText(
                  SingletonWorker().name.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 27.0,
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
                ),
                Container(
                  width: getFullScreenWidth(context) * 0.8,
                  child: OutlineButton(
                    color: Color(ColorPalette.strongGeryApp),
                    textColor: Color(ColorPalette.strongGeryApp),
                    borderSide: BorderSide(
                        color: Color(ColorPalette.strongGeryApp), width: 1.0),
                    onPressed: () => showOffertPopUp(context),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("ver convocatorias".toUpperCase(),
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w400)),
                  ),
                ),
                OutlineButton(
                  color: Color(ColorPalette.strongGeryApp),
                  textColor: Color(ColorPalette.strongGeryApp),
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                  onPressed: () => showAcceptedPopUp(context),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("REVISAR MIS POSTULACIONES".toUpperCase(),
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w400)),
                ),
                OutlineButton(
                  color: Color(ColorPalette.strongGeryApp),
                  textColor: Color(ColorPalette.strongGeryApp),
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                  onPressed: () => showRemmemberPopUp(context),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: AutoSizeText(
                    "VER MIS POSTULACIONES ANTERIORES".toUpperCase(),
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          PublicityCarrousel().build(context)
        ],
      ),
    );
  }
}