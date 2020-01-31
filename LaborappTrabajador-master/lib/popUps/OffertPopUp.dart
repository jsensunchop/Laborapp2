import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffert.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Web/SetAnApplyHttp.dart';

class OffertPopUp {
  double commonRadius = 20.0;

  var _offert = SingletonOffert();

  String _buildOffertText() {
    int workersNeeded = _offert.workersNedeed;
    String specialty = _offert.specialty;
    String subespecialty = _offert.subSpecialty;
    String documents = "";

    if (_offert.documents.length < 1) {
      documents = "sin documentos";
    } else {
      documents = "Con los documentos:";
      for (int i = 0; i < _offert.documents.length; i++) {
        documents = documents + " " + _offert.documents[i];
      }
    }

    String adress = _offert.adress + " " + _offert.city;
    String date = _offert.date;
    String hour = _offert.hour;
    return "Solicita ${workersNeeded} trabajadores en\n${specialty} ${subespecialty}\n${documents}.\nEn ${adress} ${date}\na las ${hour}";
  }

  _applyToOffer(BuildContext context) {
    SetAnApplyHttp().logIn(context);
  }

  Widget buildPopUp(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadius)),
      child: Container(
        width: getFullScreenWidth(context),
        height: getHeightWithoutSafeArea(context) * 0.7,
        padding: EdgeInsets.all(commonRadius),
        decoration: BoxDecoration(
            color: Color(ColorPalette.yellowApp),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(commonRadius),
                topRight: Radius.circular(commonRadius)),
            boxShadow: [
              BoxShadow(
                  color: Color(ColorPalette.mediumGrayApp),
                  offset: const Offset(20.0, 15.0),
                  blurRadius: 5.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InicialsContainer().CompanySmallInicials(context),
            AutoSizeText(
              _offert.companyName.toUpperCase(),
              maxLines: 1,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            RatingBar(
              onRatingUpdate: null,
              initialRating: 3,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: Colors.white),
              itemSize: getHeightWithoutSafeArea(context) * 0.04,
            ),
            AutoSizeText(
              _buildOffertText(),
              maxLines: 10,
              style: TextStyle(fontSize: 22.0),
              textAlign: TextAlign.center,
            ),
            LaboraapButtons().PopUpButton(
                inText: "tomo esta oferta",
                colorCode: ColorPalette.strongGeryApp,
                context: context,
                buttonFunction: () => _applyToOffer(context))
          ],
        ),
      ),
    );
  }
}
