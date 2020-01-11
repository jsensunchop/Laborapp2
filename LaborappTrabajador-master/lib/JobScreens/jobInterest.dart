import 'package:flutter/material.dart';
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
          onTap: () => print("tap"),
          selected: true,
          title: new Text(t.title));

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