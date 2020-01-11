import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffert.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class AcceptedPopUp extends StatelessWidget {
  double commonRadius = 20.0;
  var _offert = SingletonOffert();

  String _buildAcceptedCompanyText() {
    String who = _offert.companyName;
    String head = "La empresa ${who}";
    return head;
  }

  String _buildAcceptedbodyText() {
    String documents = _offert.documents;
    String adress = _offert.adress +" "+ _offert.city;
    String date = _offert.date;
    String hour = _offert.hour;
    String body = "Por favor presentarse muy puntual con documentos: ${documents}.\n ${adress} El día ${date} a las ${hour}";
    return body;
  }

  _aceptedOffer(BuildContext context) {
    print("Aqui seguramente cerramos el pop up");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
            Column(
              children: <Widget>[
                AutoSizeText(
                  _buildAcceptedCompanyText(),
                  maxLines: 2,
                  style: TextStyle(fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
                AutoSizeText(
                  "ACEPTO su solicitud",
                  maxLines: 1,
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
                AutoSizeText(
                  _buildAcceptedbodyText(),
                  maxLines: 10,
                  style: TextStyle(fontSize: 22.0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            LaboraapButtons().PopUpButton(
                inText: "Entendido",
                buttonFunction: () => _aceptedOffer(context),
                context: context)
          ],
        ),
      ),
    );
  }
}
