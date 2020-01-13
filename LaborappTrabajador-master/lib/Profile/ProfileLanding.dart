import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/CodeContainer.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class ProfileLanding extends StatefulWidget {
  @override
  _ProfileLandingState createState() => _ProfileLandingState();
}

class _ProfileLandingState extends State<ProfileLanding> {
  var worker = SingletonWorker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LaborAppBar().build(context),
        body: SafeArea(
          child: Container(
            width: getFullScreenWidth(context),
            height: getHeightWithoutSafeArea(context) * 0.9,
            //color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InicialsContainer().NormalInicials(context),
                AutoSizeText(
                  SingletonWorker().name.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 27.0,
                      color: Color(ColorPalette.yellowApp),
                      fontWeight: FontWeight.w800),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("CODIGO",
                        style: TextStyle(
                            fontSize: 27.0,
                            color: Color(ColorPalette.strongGeryApp),
                            fontWeight: FontWeight.w800)),
                    CodeContainer()
                  ],
                ),
                Container(
                  width: getFullScreenWidth(context) * 0.8,
                  child: OutlineButton(
                    color: Color(ColorPalette.strongGeryApp),
                    textColor: Color(ColorPalette.strongGeryApp),
                    borderSide: BorderSide(
                        color: Color(ColorPalette.strongGeryApp), width: 1.0),
                    onPressed: () => showOffertPopUp(context),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("ver convocatorias".toUpperCase(),
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w400)),
                  ),
                ),
                OutlineButton(
                  color: Color(ColorPalette.strongGeryApp),
                  textColor: Color(ColorPalette.strongGeryApp),
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                  onPressed: () => showAcceptedPopUp(context),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("REVISAR MIS POSTULACIONES".toUpperCase(),
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w400)),
                ),
                OutlineButton(
                  color: Color(ColorPalette.strongGeryApp),
                  textColor: Color(ColorPalette.strongGeryApp),
                  borderSide: BorderSide(color: Colors.transparent, width: 1.0),
                  onPressed: () => showRemmemberPopUp(context),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: AutoSizeText(
                    "VER MIS POSTULACIONES ANTERIORES".toUpperCase(),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                    maxLines: 1,
                  ),
                ),
                CarouselSlider(
                  height: getHeightWithoutSafeArea(context) * 0.2,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  viewportFraction: 0.4,
                  enableInfiniteScroll: true,
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Center(
                                child: Text(
                              'PUBLICIDAD',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  color: Color(ColorPalette.softGrayApp)),
                            )));
                      },
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(ColorPalette.strongGeryApp),
          selectedItemColor: Colors.amber,
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: Colors.white,
              ),
              title:
                  new Text('Principal', style: TextStyle(color: Colors.white)),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.white),
                title: Text('Perfil', style: TextStyle(color: Colors.white))),
            BottomNavigationBarItem(
              icon: new Icon(Icons.help, color: Colors.white),
              title:
                  new Text('Nosotros', style: TextStyle(color: Colors.white)),
            ),
          ],
        ));
  }
}
