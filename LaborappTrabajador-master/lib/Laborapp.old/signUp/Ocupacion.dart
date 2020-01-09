import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'FormCard1.dart';
import '../EndSignUp/eleccionEspecialidad.dart';
import 'subespecialidad_drywall.dart';
import 'subespecialidad_estructura.dart';
import 'subespecialidad_lavado.dart';
import 'subespecialidad_mamposteria.dart';
import 'subespecialidadpintura.dart';
import 'package:http/http.dart' as http;

class Ocupacion extends StatefulWidget {
  _OcupacionState createState() => _OcupacionState();
}

class _OcupacionState extends State<Ocupacion>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 1, initialIndex: 0);
  }

  Future<bool> _onBackPressed() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => main4()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          appBar: AppBar(
            backgroundColor: Color(ColorPalette.strongGeryApp),
            title: Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/common/LogoHeader.png'),
            ),
          ),
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              HomePage(),
            ],
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var singeltonWorkerInstance = SingletonWorker();

  void continueWorkerRute(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Ocupacion()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FormCard1(),
        ListTile(
          title: Text('Pintura'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            singeltonWorkerInstance.specialty = "Pintura";
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new subespecialidadpintura()));
          },
        ),
        ListTile(
          title: Text('Drywall'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            singeltonWorkerInstance.specialty = "Drywall";
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new subespecialidad_drywall()));
          },
        ),
        ListTile(
          title: Text('Lavado de Fachada y Aseo'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            singeltonWorkerInstance.specialty = "Lavado de Fachada y Aseo";
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new subespecialidad_lavado()));
          },
        ),
        ListTile(
          title: Text('Mamposteria'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            singeltonWorkerInstance.specialty = "Mamposteria";
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new subespecialidad_mamposteria()));
          },
        ),
        ListTile(
          title: Text('Estructura'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            singeltonWorkerInstance.specialty = "Estructura";
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new subespecialidad_estructura()));
          },
        ),
      ],
    );
  }
}
