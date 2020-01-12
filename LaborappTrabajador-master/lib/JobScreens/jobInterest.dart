import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/JobScreens/jobScreenDescription.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';

class jobInterest extends StatefulWidget {
  _jobInterestState createState() => _jobInterestState();
}

class _jobInterestState extends State<jobInterest> {
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
            jobScreenDescription(),
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
  String _specialty = "";
  String _subSpecialty = "";

  _getScreenSelectedData(String sub) {
    _subSpecialty = sub;
    print(_specialty + " " + _subSpecialty);
  }

  _getSpecialty(bool changed, String special) {
    _specialty = special;
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
          onTap: () => _getScreenSelectedData(t.title),
          selected: true,
          title: new AutoSizeText(
            t.title,
            style: TextStyle(
                color: Color(ColorPalette.mediumGrayApp),
                fontSize: 14.0,
                fontWeight: FontWeight.w500),
            maxLines: 1,
          ));

    return new Theme(
        data: ThemeData(accentColor: Colors.amber),
        child: ExpansionTile(
          onExpansionChanged: (changed) => _getSpecialty(changed, t.title),
          key: new PageStorageKey<int>(3),
          title: new AutoSizeText(
            t.title,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          children: t.children.map(_buildTiles).toList(),
        ));
  }
}

class MyTile {
  String title;
  List<MyTile> children;

  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listOfTiles = <MyTile>[
  new MyTile(
    'Pintura',
    <MyTile>[
      new MyTile('Estuco'),
      new MyTile('Segunda Mano'),
      new MyTile('Terminación'),
      new MyTile('Graniplast'),
      new MyTile('Carraplast'),
      new MyTile('Ayudante'),
    ],
  ),
  new MyTile(
    'Drywall',
    <MyTile>[
      new MyTile('Estructura'),
      new MyTile('Tapado'),
      new MyTile('Empastador'),
      new MyTile('Ayudante'),
    ],
  ),
  new MyTile(
    'Lavado de Fachada y Aseo',
    <MyTile>[
      new MyTile('Lavador'),
      new MyTile('Aseo'),
    ],
  ),
  new MyTile(
    'Mampostería',
    <MyTile>[
      new MyTile('Oficial'),
      new MyTile('Media Cuchara'),
      new MyTile('Ayudante'),
      new MyTile('Mampostero'),
      new MyTile('Pañetador'),
      new MyTile('Enchapador'),
    ],
  ),
  new MyTile(
    'Estrucutra',
    <MyTile>[
      new MyTile('Oficial'),
      new MyTile('Media Cuchara'),
      new MyTile('Ayudante'),
      new MyTile('Latero'),
    ],
  ),
];
