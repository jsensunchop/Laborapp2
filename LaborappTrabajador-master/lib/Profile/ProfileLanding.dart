import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/PublcityCarrousel.dart';
import 'package:laborapp_trabajador/Offers/LookUpOffer.dart';
import 'package:laborapp_trabajador/Profile/AboutUs.dart';
import 'package:laborapp_trabajador/Profile/EditProfile.dart';
import 'package:laborapp_trabajador/Profile/Profile.dart';
import 'package:laborapp_trabajador/Profile/ProfileStartScreen.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonNavigation.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';

class ProfileLanding extends StatefulWidget {
  @override
  _ProfileLandingState createState() => _ProfileLandingState();
}

class _ProfileLandingState extends State<ProfileLanding> {
  var worker = SingletonWorker();


  Future<bool> _canLeave(BuildContext context) {
    return new Future(() => false);
  }


  final List<Widget> _children = [
    ProfileStartScreen(),
    Profile(),
    AboutUs()
  ];

  void onTabTapped(int index) {
    setState(() {
      SingletonNavigation().currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>_canLeave(context) ,
      child: Scaffold(
          appBar: LaborAppBar().build(context),
          drawer: Drawer(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 35),
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blueGrey))
                    ),
                    child: ListTile(
                            title: Text("    Mis Aplicaciones", style: TextStyle(color: Colors.black, fontSize: 20)),
                            trailing: Icon(Icons.remove_red_eye),
                            enabled: true,
                          ),

                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blueGrey))
                    ),
                    child: ListTile(
                      title: Text("    Editar perfil                       \n  ", style: TextStyle(color: Colors.black, fontSize: 20)),
                      trailing: Icon(Icons.remove_red_eye),
                      enabled: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.blueGrey))
                    ),
                    child: ListTile(
                      title: Text("    Ayuda                               \n  ", style: TextStyle(color: Colors.black, fontSize: 20)),
                      trailing: Icon(Icons.remove_red_eye),
                      enabled: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _children[SingletonNavigation().currentIndex],
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
            currentIndex: SingletonNavigation().currentIndex,
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
          )),
    );
  }
}
