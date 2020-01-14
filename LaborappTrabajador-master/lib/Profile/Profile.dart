import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/CodeContainer.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/PublcityCarrousel.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';
import '../Common/ColorPalette.dart';
import '../Common/LaborappButtons.dart';
import '../Util/UtilMethods.dart';
import '../Util/UtilMethods.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var worker = SingletonWorker();
  double _innerFontSize = 20.0;
  Color testColor = Colors.green;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InicialsContainer().NormalInicials(context),
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
                Row(
                  children: <Widget>[
                    AutoSizeText(
                      "     Localidad: ",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: _innerFontSize,
                          color: Color(ColorPalette.mediumGrayApp),
                          fontWeight: FontWeight.w300),
                    ),
                    AutoSizeText(
                      SingletonWorker().localidad.toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: _innerFontSize,
                          color: Color(ColorPalette.mediumGrayApp),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  width: getFullScreenWidth(context),
                  height: 1.5,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        AutoSizeText(
                          "     Especialidades: ",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: _innerFontSize,
                              color: Color(ColorPalette.mediumGrayApp),
                              fontWeight: FontWeight.w300),
                        ),
                        AutoSizeText(
                          SingletonWorker().Specialty,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: _innerFontSize,
                              color: Color(ColorPalette.mediumGrayApp),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    AutoSizeText(
                      "     " + SingletonWorker().SubSpecialty,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: _innerFontSize,
                          color: Color(ColorPalette.mediumGrayApp),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Container(
                  width: getFullScreenWidth(context),
                  height: 1.5,
                  color: Colors.grey,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        AutoSizeText(
                          "     Documentos: ",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: _innerFontSize,
                              color: Color(ColorPalette.mediumGrayApp),
                              fontWeight: FontWeight.w300),
                        ),
                        AutoSizeText(
                          SingletonWorker().IdType,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: _innerFontSize,
                              color: Color(ColorPalette.mediumGrayApp),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        AutoSizeText(
                          "     " + "Curso A.",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: _innerFontSize,
                              color: Color(ColorPalette.mediumGrayApp),
                              fontWeight: FontWeight.w500),
                        ),
                        AutoSizeText(
                          "     Examen M",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: _innerFontSize,
                              color: Color(ColorPalette.mediumGrayApp),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AnimatedContainer(
                      width: MediaQuery.of(context).size.height * 0.16,
                      height: getHeightWithoutSafeArea(context) * 0.16,
                      duration: Duration(seconds: 1),
                      decoration: new BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            "D",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 52.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          AutoSizeText(
                            "DISPONIBLE",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    AnimatedContainer(
                      width: MediaQuery.of(context).size.height * 0.16,
                      height: getHeightWithoutSafeArea(context) * 0.16,
                      duration: Duration(seconds: 1),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            "O",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 52.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          AutoSizeText(
                            "OCUPADO",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                LaboraapButtons().NormalButton(
                    colorCode: ColorPalette.strongGeryApp,
                    buttonFunction: () => print("XD"),
                    context: context,
                    inText: "APLICAR A OFERTAS")
              ],
            ),
          ),
          PublicityCarrousel().build(context)
        ],
      ),
    );
  }
}
