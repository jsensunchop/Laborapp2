import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/OffersDisplay/ShowActiveOffer.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffert.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:http/http.dart' as http;
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class OfferTile {
  int index;
  var status;
  var responseF;
  var singeltonActiveOffersInstance = SingletonActiveOffers();
  double _fontSize = 16.0;

  _goToShowActiveOffert(context) {
    var singletonOffersInstance = SingletonOffert();
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
        singeltonActiveOffersInstance.activeOfferts[index].Comany;
    singletonOffersInstance.employeeName =
        singeltonActiveOffersInstance.activeOfferts[index].EmployeeName;
    showOffertPopUp(context);
  }

  _setFavoriteOffer(BuildContext context){
    print("Favorito");
  }

  _shareOffer(BuildContext context){
    print("Sharing");
  }

  Container buildTile(BuildContext context, int index, String compyName,
      String resume, String date, bool active) {
    this.index = index;
    int backgroundColor = ColorPalette.softGrayApp;
    int textColor = ColorPalette.strongGeryApp;

    Container tile = Container(
      height: getHeightWithoutSafeArea(context) * (0.12),
      color: Color(backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InicialsContainer().TileInicials(context),
          Container(
            width: getFullScreenWidth(context) * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    AutoSizeText(
                      "La empresa ",
                      style: TextStyle(fontSize: _fontSize),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      compyName.toUpperCase(),
                      style: TextStyle(
                          fontSize: _fontSize, fontWeight: FontWeight.w600),
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      " solicita",
                      style: TextStyle(fontSize: _fontSize),
                      maxLines: 1,
                    )
                  ],
                ),
                AutoSizeText(
                  "Obrero en: "+resume,
                  style: TextStyle(fontSize: _fontSize),
                  maxLines: 1,
                ),
                AutoSizeText(
                  date,
                  style: TextStyle(fontSize: _fontSize),
                  maxLines: 1,
                )
              ],
            ),
          ),
          Container(
            height: getHeightWithoutSafeArea(context) * (0.12),
            width: getFullScreenWidth(context) * 0.1,
            color: Color(ColorPalette.yellowApp),
            child: Column(
              children: <Widget>[
                GestureDetector(
                    onTap: () => _goToShowActiveOffert(context),
                    child:
                        Icon(Icons.check_circle_outline, color: Colors.white)),
                GestureDetector(
                    onTap: () => _setFavoriteOffer(context),
                    child: Icon(Icons.star_border, color: Colors.white)),
                GestureDetector(
                    onTap: () => _shareOffer(context),
                    child: Icon(Icons.share, color: Colors.white))
              ],
            ),
          )
        ],
      ),
    );

    return tile;
  }
}
