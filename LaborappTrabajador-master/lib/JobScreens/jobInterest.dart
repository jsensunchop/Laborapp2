import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/Documents/documentsUpload.dart';
import 'package:laborapp_trabajador/JobScreens/jobScreenDescription.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Web/EndSignUpHttp.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class jobInterest extends StatefulWidget {
  _jobInterestState createState() => _jobInterestState();
}

class _jobInterestState extends State<jobInterest> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: LaborAppBar().build(context),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: new Column(children: <Widget>[
        //header of the screen
        //EDIT HERE
        SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.02),
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
      ]),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  String _specialty = "";

  _getScreenSelectedData(String sub, BuildContext context) {
    SingletonWorker().Specialty = _specialty;
    SingletonWorker().SubSpecialty = sub.substring(10);
    print(SingletonWorker().IdNumber.toString());
    EndSignUpHttp().endSignUp(context);
  }

  _getSpecialty(bool changed, String special) {
    _specialty = special;
  }

  final MyTile myTile;

  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile, context);
  }

  List<Widget> innerTile(List<MyTile> childs, BuildContext context) {
    List<Widget> tiles = List<Widget>();
    for (int i = 0; i < childs.length; i++) {
      tiles.add(ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => _getScreenSelectedData(childs[i].title, context),
          selected: true,
          title: new AutoSizeText(
            childs[i].title,
            style: TextStyle(
                color: Color(ColorPalette.mediumGrayApp),
                fontSize: 14.0,
                fontWeight: FontWeight.w500),
            maxLines: 1,
          )));
    }
    return tiles;
  }

  Widget _buildTiles(MyTile t, BuildContext context) {
    return new Theme(
        data: ThemeData(accentColor: Colors.amber),
        child: Card(
            child: ExpansionTile(
          onExpansionChanged: (changed) => _getSpecialty(changed, t.title),
          key: new PageStorageKey<int>(3),
          title: new AutoSizeText(
            t.title,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          //children: t.children.map(_buildTiles).toList(),
          children: innerTile(t.children, context),
        )));
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
      new MyTile('          Estuco'),
      new MyTile('          Segunda Mano'),
      new MyTile('          Terminación'),
      new MyTile('          Graniplast'),
      new MyTile('          Carraplast'),
      new MyTile('          Ayudante'),
    ],
  ),
  new MyTile(
    'Drywall',
    <MyTile>[
      new MyTile('          Estructura'),
      new MyTile('          Tapado'),
      new MyTile('          Empastador'),
      new MyTile('          Ayudante'),
    ],
  ),
  new MyTile(
    'Lavado de Fachada y Aseo',
    <MyTile>[
      new MyTile('          Lavador'),
      new MyTile('          Aseo'),
    ],
  ),
  new MyTile(
    'Mampostería',
    <MyTile>[
      new MyTile('          Oficial'),
      new MyTile('          Media Cuchara'),
      new MyTile('          Ayudante'),
      new MyTile('          Mampostero'),
      new MyTile('          Pañetador'),
      new MyTile('          Enchapador'),
    ],
  ),
  new MyTile(
    'Estrucutra',
    <MyTile>[
      new MyTile('          Oficial'),
      new MyTile('          Media Cuchara'),
      new MyTile('          Ayudante'),
      new MyTile('          Latero'),
    ],
  ),
];
