import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/CodeContainer.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/DataWithButton.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/PublcityCarrousel.dart';
import 'package:laborapp_trabajador/Documents/documentsUpload.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';
import '../Common/ColorPalette.dart';
import '../Common/LaborappButtons.dart';
import '../Util/UtilMethods.dart';
import '../Util/UtilMethods.dart';

class BasicData extends StatelessWidget {
  double _innerFontSize = 16.0;

  buttonF() {
    print("DX");
  }

  _EditDocumets(BuildContext context){
    Navigator.pushNamed(context, RoutesNames.DocumentsUpload);
  }
  _EditSpecialty(BuildContext context){
    Navigator.pushNamed(context, RoutesNames.JobInterested);
  }

  @override
  Widget build(BuildContext context) {
    print(SingletonWorker().localidad);
    print(SingletonWorker().Specialty);
    print(SingletonWorker().SubSpecialty);
    print(SingletonWorker().IdType);

    return Container(
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context) * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
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
              DataWithButton.build(
                  fontSize: _innerFontSize,
                  inText: SingletonWorker().localidad.toUpperCase(),
                  context: context),
            ],
          ),
          Container(
            width: getFullScreenWidth(context),
            height: 1.5,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Column(
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
                        DataWithButton.build(
                            fontSize: _innerFontSize,
                            inText: SingletonWorker().Specialty,
                            context: context),
                      ],
                    ),
                    DataWithButton.build(
                        fontSize: _innerFontSize,
                        inText: "     " + SingletonWorker().SubSpecialty,
                        context: context),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize *2,
                      child: FlatButton(
                        onPressed: ()=>_EditSpecialty(context),
                        child: Icon(
                          Icons.edit,
                          size: _innerFontSize * 1.3,
                        ),
                      )),
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize *2,
                      child: FlatButton(
                        onPressed: buttonF,
                        child: Icon(
                          Icons.remove_red_eye,
                          size: _innerFontSize * 1.3,
                        ),
                      )),
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize *2,
                      child: FlatButton(
                        onPressed: buttonF,
                        child: Icon(
                          Icons.add_circle_outline,
                          size: _innerFontSize * 1.3,
                        ),
                      ))
                ],
              )
            ],
          ),
          Container(
            width: getFullScreenWidth(context),
            height: 1.5,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
                      DataWithButton.build(
                          fontSize: _innerFontSize,
                          inText: SingletonWorker().IdType,
                          context: context),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      DataWithButton.build(
                          fontSize: _innerFontSize,
                          inText: "     Curso A",
                          context: context),
                      DataWithButton.build(
                          fontSize: _innerFontSize,
                          inText: "     Examen M",
                          context: context),
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize *2,
                      child: FlatButton(
                        onPressed: ()=>_EditDocumets(context),
                        child: Icon(
                          Icons.edit,
                          size: _innerFontSize * 1.3,
                        ),
                      )),
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize *2,
                      child: FlatButton(
                        onPressed: buttonF,
                        child: Icon(
                          Icons.remove_red_eye,
                          size: _innerFontSize * 1.3,
                        ),
                      )),
                  Container(
                      width: getFullScreenWidth(context) * 0.1,
                      height: _innerFontSize *2,
                      child: FlatButton(
                        onPressed: buttonF,
                        child: Icon(
                          Icons.add_circle_outline,
                          size: _innerFontSize * 1.3,
                        ),
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
