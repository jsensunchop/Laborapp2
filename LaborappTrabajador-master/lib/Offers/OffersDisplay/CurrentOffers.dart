import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/Offers/OffersDisplay/CurrentOfferTile.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class CurrentOffers {
  var _offers = [];

  getOffers(BuildContext context) {
    _offers.clear();
    var singletonActiveOffersInstance = SingletonActiveOffers();

    bool active = true;

    for (int i = 0;
        i < singletonActiveOffersInstance.activeOfferts.length;
        i++) {
      try {
        String compyName =
            singletonActiveOffersInstance.activeOfferts[i].Comany;
        String resume =
            singletonActiveOffersInstance.activeOfferts[i].Specialty +
                ", " +
                singletonActiveOffersInstance.activeOfferts[i].SubSpecialty +
                " / " +
                singletonActiveOffersInstance.activeOfferts[i].Localidad;
        String date = singletonActiveOffersInstance.activeOfferts[i].Date;

        _offers.add(CurrentOfferTile()
            .buildTile(context, i, compyName, resume, date, active));
      } catch (e) {
        continue;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getOffers(context);
    return Container(
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context) * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ProfileHeader(),
          Container(
            height: getHeightWithoutSafeArea(context) * (0.53),
            width: getFullScreenWidth(context),
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: _offers.length,
              itemBuilder: (BuildContext context, int index) {
                return _offers[index];
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 5,
                color: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
