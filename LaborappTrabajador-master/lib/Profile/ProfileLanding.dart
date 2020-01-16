import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/PublcityCarrousel.dart';
import 'package:laborapp_trabajador/Offers/LookUpOffer.dart';
import 'package:laborapp_trabajador/Profile/AboutUs.dart';
import 'package:laborapp_trabajador/Profile/EditProfile.dart';
import 'package:laborapp_trabajador/Profile/Profile.dart';
import 'package:laborapp_trabajador/Profile/ProfileStartScreen.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';

class ProfileLanding extends StatefulWidget {
  @override
  _ProfileLandingState createState() => _ProfileLandingState();
}

class _ProfileLandingState extends State<ProfileLanding> {
  var worker = SingletonWorker();

  int _currentIndex = 0;

  final List<Widget> _children = [
    ProfileStartScreen(),
    Profile(),
    EditProfile()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
              _children[_currentIndex],
              PublicityCarrousel().build(context)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          backgroundColor: Color(ColorPalette.strongGeryApp),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
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
