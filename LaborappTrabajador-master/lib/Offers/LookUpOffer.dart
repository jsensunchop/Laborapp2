import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/OffersDisplay/OfferTile.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class LookUpOffer extends StatefulWidget {
  @override
  _LookUpOfferState createState() => _LookUpOfferState();
}

class _LookUpOfferState extends State<LookUpOffer> {
  var _offers = [];

  getOffers(BuildContext context) {
    _offers.clear();
    var singletonActiveOffersInstance = SingletonActiveOffers();

    bool active = true;

    print(singletonActiveOffersInstance.activeOfferts.length);
    for (int i = 0;
        i < singletonActiveOffersInstance.activeOfferts.length;
        i++) {

      String compyName = singletonActiveOffersInstance.activeOfferts[i].Comany;
      String resume = singletonActiveOffersInstance.activeOfferts[i].Specialty +
          ", " +
          singletonActiveOffersInstance.activeOfferts[i].SubSpecialty +
          " / " +
          singletonActiveOffersInstance.activeOfferts[i].Localidad;
      String date = singletonActiveOffersInstance.activeOfferts[i].Date;

      _offers.add(
          OfferTile().buildTile(context, i, compyName, resume, date, active));
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
                color: Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
