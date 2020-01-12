import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/Localization/localizationScreenDescription.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';

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
        body: new Column(
          children: <Widget>[
            //header of the screen
            //EDIT HERE
            ProfileHeader(),
            localizationScreenDescription(),
            new Expanded(
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new StuffInTiles(listOfTiles[index]);
                },
                itemCount: listOfTiles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  var singletonWorkerInstance = SingletonWorker();

  _getLocaizationData(String localidad) {
    print(singletonWorkerInstance.City + " " + localidad);
  }

  final MyTile myTile;

  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => _getLocaizationData(t.title),
          title: new Text(
            t.title,
            style: TextStyle(
                color: Color(ColorPalette.mediumGrayApp),
                fontSize: 14.0,
                fontWeight: FontWeight.w500),
          ));

    return new ExpansionTile(
      key: new PageStorageKey<int>(3),
      title: new Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;
  bool enabled;

  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'No Aplica',
  ),
  new MyTile(
    'Usaquén',
  ),
  new MyTile(
    'Chapinero',
  ),
  new MyTile(
    'Santa Fe',
  ),
  new MyTile(
    'Usme',
  ),
  new MyTile(
    'Tunjuelito',
  ),
  new MyTile(
    'San Cristóbal',
  ),
  new MyTile(
    'Bosa',
  ),
  new MyTile(
    'Kennedy',
  ),
  new MyTile(
    'Fontibón',
  ),
  new MyTile(
    'Engativá',
  ),
  new MyTile(
    'Suba',
  ),
  new MyTile(
    'Barrios Unidos',
  ),
  new MyTile(
    'Teusaquillo',
  ),
  new MyTile(
    'Los Mártires',
  ),
  new MyTile(
    'Antonio Nariño',
  ),
  new MyTile(
    'Puente Aranda',
  ),
  new MyTile(
    'La Candelaria',
  ),
  new MyTile(
    'Rafael Uribe',
  ),
  new MyTile(
    'Ciudad Bolívar',
  ),
  new MyTile(
    'Sumapaz',
  ),
];
