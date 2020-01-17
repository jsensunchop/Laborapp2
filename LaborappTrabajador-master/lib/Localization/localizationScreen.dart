
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/JobScreens/jobInterest.dart';
import 'package:laborapp_trabajador/JobScreens/jobScreenDescription.dart';
import 'package:laborapp_trabajador/Landing/Landing.dart';
import 'package:laborapp_trabajador/Localization/localizationScreenDescription.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class localizationScreen extends StatefulWidget {
  _localizationScreenState createState() => _localizationScreenState();
}

class _localizationScreenState extends State<localizationScreen> {



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: LaborAppBar().build(context),
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: new SingleChildScrollView(
        child: Container(
          width: getFullScreenWidth(context),
          height: getHeightWithoutSafeArea(context) * 1,
          child: Column(
          children: <Widget>[
            //header of the screen
            //EDIT HERE
            ProfileHeader(),
            localizationScreenDescription(),
            StuffInTiles(),
          ],
          ),
        ),
      ),
      ),
    );
  }
}

class StuffInTiles extends StatefulWidget  {
  @override
  StuffInTilesState createState() => new StuffInTilesState();
}
class StuffInTilesState extends State<StuffInTiles> {

  bool _saved = false;
  var singletonWorkerInstance = SingletonWorker();

  _getLocaizationData(String localidad, BuildContext context) {
    print(singletonWorkerInstance.City + " " + localidad);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => jobInterest()));
  }


  List<String> listing = [

    'No Aplica',
    'Usaquén',
    'Chapinero',
    'Santa Fe',
    'Usme',
    'Tunjuelito',
    'San Cristóbal',
    'Bosa',
    'Kennedy',
    'Fontibón',
    'Engativá',
    'Suba',
    'Barrios Unidos',
    'Teusaquillo',
    'Los Mártires',
    'Antonio Nariño',
    'Puente Aranda',
    'La Candelaria',
    'Rafael Uribe',
    'Ciudad Bolívar',
    'Sumapaz',

  ];

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }


  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listing.length,
        itemBuilder: (BuildContext context, int index) {
          itemCount: listing.length;
          final cities = listing[index].toString();
          final bool alreadySaved = _selectedIndex != null && _selectedIndex == index;
          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              title: new Text(
                cities,
                style: TextStyle(
                color: Color(ColorPalette.mediumGrayApp),
                fontSize: 14.0,
                fontWeight: FontWeight.w500),
              ),
              trailing: new Icon(   // Add the lines from here...
                alreadySaved ? Icons.check : Icons.check_circle_outline,
                color: alreadySaved ? Colors.black : Colors.transparent,
              ),

              onTap: () {
                _onSelected(index);
                _getLocaizationData(cities, context);
              }
            ),
          );
        },
      ),
    );
  }
}

