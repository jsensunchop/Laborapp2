import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffert.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class OfferTile {
  int index;
  var status;
  var responseF;
  var ActiveOffers = SingletonActiveOffers();
  double _fontSize = 16.0;

  _goToShowActiveOffert(BuildContext context) {
    var singletonOffer = SingletonOffert();
    singletonOffer.setAllToNull();
    singletonOffer.documents = ActiveOffers.activeOfferts[index].Documents;
    singletonOffer.setDate(ActiveOffers.activeOfferts[index].date);
    singletonOffer.setCity(ActiveOffers.activeOfferts[index].city);
    singletonOffer.setSpecialty(ActiveOffers.activeOfferts[index].specialty);
    singletonOffer
        .setsubSpecialty(ActiveOffers.activeOfferts[index].subSpecialty);
    singletonOffer.setHour(ActiveOffers.activeOfferts[index].hour);
    singletonOffer.setAdress(ActiveOffers.activeOfferts[index].adress);
    singletonOffer
        .setWorkersNedeed(ActiveOffers.activeOfferts[index].workersNedeed);
    singletonOffer.setLocalidad(ActiveOffers.activeOfferts[index].localidad);
    singletonOffer.index = index;
    singletonOffer.id = ActiveOffers.activeOfferts[index].id;
    singletonOffer.companyName = ActiveOffers.activeOfferts[index].Comany;
    singletonOffer.employeeName =
        ActiveOffers.activeOfferts[index].EmployeeName;
    showOffertPopUp(context);
  }



  _setFavoriteOffer(BuildContext context) {
    print("Favorito");
  }

  _shareOffer(BuildContext context) {
    print("Sharing");
  }

  Container buildTile(BuildContext context, int index, String compyName,
      String resume, String date, bool active) {
    this.index = index;
    int backgroundColor = ColorPalette.softGrayApp;
    int textColor = ColorPalette.strongGeryApp;
    double companySpace;
    int max1= 1;
    if(compyName.length < 13){
      companySpace = getFullScreenWidth(context) * 0.2;
      max1= 1;
    }else{
      companySpace = getFullScreenWidth(context) * 0.3;
      max1= 2;
    }

    Container tile = Container(
      height: getHeightWithoutSafeArea(context) * (0.12),
      color: Color(backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InicialsContainer().TileInicials(context, compyName),
          Container(
            width: getFullScreenWidth(context) * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: getFullScreenWidth(context) * 0.69,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: getFullScreenWidth(context) * 0.2,
                        child: AutoSizeText(
                          "La empresa ",
                          style: TextStyle(fontSize: _fontSize),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        width: companySpace,
                        child: AutoSizeText(
                          compyName.toUpperCase(),
                          style: TextStyle(
                              fontSize: _fontSize, fontWeight: FontWeight.w600),
                          maxLines: max1,
                        ),
                      ),
                      Container(
                        width: getFullScreenWidth(context) * 0.16,
                        child: AutoSizeText(
                          " solicita",
                          style: TextStyle(fontSize: _fontSize),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: getFullScreenWidth(context) * 0.7,
                  child: AutoSizeText(
                    "Obrero en: " + resume,
                    style: TextStyle(fontSize: _fontSize),
                    maxLines: 1,
                  ),
                ),
                Container(
                  width: getFullScreenWidth(context) * 0.4,
                  child: AutoSizeText(
                    date,
                    style: TextStyle(fontSize: _fontSize),
                    maxLines: 1,
                  ),
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
