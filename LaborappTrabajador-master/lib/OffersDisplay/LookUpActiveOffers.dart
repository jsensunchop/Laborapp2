import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonBuilder.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Common/OfferTile.dart';

class LookUpActiveOffers extends StatefulWidget {
  @override
  _LookUpActiveOffersState createState() => _LookUpActiveOffersState();
}

class _LookUpActiveOffersState extends State<LookUpActiveOffers> {


  var Offers = [];

  getOffers(BuildContext context) {
    Offers.clear();
    var singletonActiveOffersInstance = SingletonActiveOffers();
    var singletonBuilderInstance = SingletonBuilder();

    bool active = true;

    for (int i = 0;
    i < singletonActiveOffersInstance.activeOfferts.length;
    i++) {
      String compyName = singletonActiveOffersInstance.activeOfferts[i].comany;
      String resume = singletonActiveOffersInstance.activeOfferts[i].specialty +
          ", " +
          singletonActiveOffersInstance.activeOfferts[i].subSpecialty +
          " / " +
          singletonActiveOffersInstance.activeOfferts[i].localidad;
      String date = singletonActiveOffersInstance.activeOfferts[i].date;

      Offers.add(
          OfferTile().buildTile(context, i, compyName, resume, date, active));
    }
  }

  @override
  Widget build(BuildContext context) {
    /*Methods space*/
    getOffers(context);

    var activeOffersText = Container(
      height: getHeightWithoutSafeArea(context) * ((1 - 0.1) * (0.2)),
      width: getFullScreenWidth(context),
      child: Center(
        child: Text(
          "OFERTAS ACTIVAS",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
        ),
      ),
    );

    var activeList = Container(
      height: getHeightWithoutSafeArea(context) * (1 - 0.1) * (0.8),
      width: getFullScreenWidth(context),
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: Offers.length,
        itemBuilder: (BuildContext context, int index) {
          return Offers[index];
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
        ),
      ),
    );

    var startScreen =MaterialApp(
          home: Scaffold(
            appBar: LaborAppBar().build(context),
            body: SingleChildScrollView(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          child: Image.asset(
                            'images/LogoFondopantallgris.png',
                            //width: double.infinity,
                            //height: double.infinity,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            fit: BoxFit.cover,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[activeOffersText, activeList],
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: getHeightWithoutSafeArea(context) * (0.9),
                )),
          ),
        );

    return startScreen;
  }
}
