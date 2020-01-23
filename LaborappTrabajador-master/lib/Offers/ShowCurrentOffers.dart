import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/PublcityCarrousel.dart';
import 'package:laborapp_trabajador/Offers/OffersDisplay/CurrentOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonNavigation.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';


class ShowCurrentOffers extends StatefulWidget {
  @override
  _ShowCurrentOffersState createState() => _ShowCurrentOffersState();
}

class _ShowCurrentOffersState extends State<ShowCurrentOffers> {


  var worker = SingletonWorker();

  void onTabTapped(int index) {
    SingletonNavigation().currentIndex = index;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LaborAppBar().build(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CurrentOffers().build(context),
              PublicityCarrousel().build(context)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (a) => onTabTapped(a),
          backgroundColor: Color(ColorPalette.strongGeryApp),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Principal'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Perfil'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.help),
              title: new Text('Nosotros'),
            ),
          ],
        ));
  }
}

