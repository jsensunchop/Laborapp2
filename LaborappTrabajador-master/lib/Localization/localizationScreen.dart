import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/JobScreens/jobInterest.dart';
import 'package:laborapp_trabajador/JobScreens/jobScreenDescription.dart';
import 'package:laborapp_trabajador/Landing/Landing.dart';
import 'package:laborapp_trabajador/Localization/localizationScreenDescription.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Util/Places.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class localizationScreen extends StatefulWidget {
  _localizationScreenState createState() => _localizationScreenState();
}

class _localizationScreenState extends State<localizationScreen> {
  String _dropdownValue = 'Bogot\u00e1';
  var singletonWorkerInstance = SingletonWorker();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
              SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.02),
              ProfileHeader(),
              SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.03),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              " ELIJA LA CIUDAD Y LOCALIDAD\n            EN LA QUE VIVE",
                              style: TextStyle(
                                  fontFamily: "Robotto",
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: .6,
                                  color: Colors.black)),
                          SizedBox(
                              height: getHeightWithoutSafeAreaAppBar(context) *
                                  0.02),
                          Theme(
                            data: Theme.of(context)
                                .copyWith(canvasColor: Colors.white),
                            child: DropdownButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.amber,
                                size: 15,
                              ),
                              value: _dropdownValue,
                              underline: Container(
                                  color: Color(ColorPalette.yellowApp),
                                  height: 1.0),
                              style: TextStyle(
                                  color: Color(ColorPalette.strongGeryApp),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              onChanged: (String newValue) {
                                setState(() {
                                  singletonWorkerInstance.City = newValue;
                                  _dropdownValue = newValue;
                                  print(_dropdownValue);
                                });
                              },
                              items: <String>[
                                'Bogot\u00e1',
                                'Amazonas',
                                'Antioquia',
                                'Arauca',
                                'Atl\u00e1ntico',
                                'Bol\u00edvar',
                                'Boyac\u00e1',
                                'Caldas',
                                'Caquet\u00e1',
                                'Casanare',
                                'Cauca',
                                'Cesar',
                                'Choc\u00f3',
                                'Cundinamarca',
                                'C\u00f3rdoba',
                                'Guain\u00eda',
                                'Guaviare',
                                'Huila',
                                'La Guajira',
                                'Magdalena',
                                'Meta',
                                "Nari\u00f1o",
                                'Norte de Santander',
                                'Putumayo',
                                'Quind\u00edo',
                                'Risaralda',
                                'San Andr\u00e9s y Providencia',
                                'Santander',
                                'Sucre',
                                'Tolima',
                                'Valle del Cauca',
                                'Vaup\u00e9s',
                                'Vichada'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: SizedBox(
                                      height:
                                          getHeightWithoutSafeArea(context) *
                                              0.04,
                                      width: getFullScreenWidth(context) * 0.5,
                                      child: AutoSizeText(
                                        value,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              StuffInTiles(
                city: SingletonWorker().City,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StuffInTiles extends StatefulWidget {
  String city;

  StuffInTiles({Key key, this.city}) : super(key: key);

  @override
  StuffInTilesState createState() => new StuffInTilesState();
}

class StuffInTilesState extends State<StuffInTiles> {
  bool _saved = false;
  var singletonWorkerInstance = SingletonWorker();

  _goToOfferData() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => jobInterest()));
  }

  _getLocaizationData(String localidad, BuildContext context) {
    singletonWorkerInstance.localidad = localidad;
    Timer(Duration(milliseconds: 200), _goToOfferData);
  }

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    String _where = widget.city;
    print("XD " + _where);
    return new Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: places[_where].length,
        itemBuilder: (BuildContext context, int index) {
          itemCount:
          places[_where].length;
          final cities = places[_where][index].toString();
          final bool alreadySaved =
              _selectedIndex != null && _selectedIndex == index;
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
                trailing: new Icon(
                  // Add the lines from here...
                  alreadySaved ? Icons.check : Icons.check_circle_outline,
                  color: alreadySaved ? Colors.black : Colors.transparent,
                ),
                onTap: () {
                  _onSelected(index);
                  _getLocaizationData(cities, context);
                }),
          );
        },
      ),
    );
  }
}
