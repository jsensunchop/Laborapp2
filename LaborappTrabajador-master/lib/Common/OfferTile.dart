import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/OffersDisplay/ShowActiveOffer.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffers.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:http/http.dart' as http;

class OfferTile {
  int index;
  var status;
  var responseF;
  var singeltonActiveOffersInstance = SingletonActiveOffers();

  goToShowActiveOffert(context) {
    var singletonOffersInstance = SingletonOffers();
    singletonOffersInstance.setAllToNull();
    singletonOffersInstance
        .setDate(singeltonActiveOffersInstance.activeOfferts[index].date);
    singletonOffersInstance
        .setCity(singeltonActiveOffersInstance.activeOfferts[index].city);
    singletonOffersInstance.setSpecialty(
        singeltonActiveOffersInstance.activeOfferts[index].specialty);
    singletonOffersInstance.setsubSpecialty(
        singeltonActiveOffersInstance.activeOfferts[index].subSpecialty);
    singletonOffersInstance
        .setHour(singeltonActiveOffersInstance.activeOfferts[index].hour);
    singletonOffersInstance
        .setAdress(singeltonActiveOffersInstance.activeOfferts[index].adress);
    singletonOffersInstance.setWorkersNedeed(
        singeltonActiveOffersInstance.activeOfferts[index].workersNedeed);
    singletonOffersInstance.setLocalidad(
        singeltonActiveOffersInstance.activeOfferts[index].localidad);
    singletonOffersInstance.index = index;
    singletonOffersInstance.id =
        singeltonActiveOffersInstance.activeOfferts[index].id;
    singletonOffersInstance.companyName =
        singeltonActiveOffersInstance.activeOfferts[index].comany;
    singletonOffersInstance.employeeName =
        singeltonActiveOffersInstance.activeOfferts[index].employeeName;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShowActiveOffer()));
  }

  Container buildTile(BuildContext context, int index, String compyName,
      String resume, String date, bool active) {
    this.index = index;
    int backgroundColor;
    int textColor;
    if (active != true) {
      backgroundColor = ColorPalette.softGrayApp;
      textColor = ColorPalette.strongGeryApp;
    } else {
      if (index % 2 == 0) {
        backgroundColor = ColorPalette.strongGeryApp;
        textColor = ColorPalette.yellowApp;
      } else {
        backgroundColor = ColorPalette.softGrayApp;
        textColor = ColorPalette.strongGeryApp;
      }
    }
    Container tile = Container(
      height: getHeightWithoutSafeArea(context) * ((1 - 0.1) * (0.13)),
      color: Color(backgroundColor),
      child: FlatButton(
        padding: const EdgeInsets.all(10),
        onPressed: () {
          goToShowActiveOffert(context);
          //goToPostulated(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(compyName,
                style: TextStyle(
                    color: Color(textColor),
                    fontWeight: FontWeight.w900,
                    fontSize: 18)),
            Text(resume,
                style: TextStyle(color: Color(textColor), fontSize: 16)),
            Text(date, style: TextStyle(color: Color(textColor), fontSize: 16))
          ],
        ),
      ),
    );

    return tile;
  }
}
