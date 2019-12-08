import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart' as util;
import 'main2.dart';
import '../signUp/Ocupacion.dart';
import 'package:fluttertoast/fluttertoast.dart';

class main4 extends StatefulWidget {
  _main4State createState() => _main4State();
}

class _main4State extends State<main4> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 1, initialIndex: 0);
  }

  Future<bool> _onBackPressed() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => main2()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          appBar: LaborAppBar().build(context),
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
  void _showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Dependiendo de tu localidad te\n"
          "apareceran trabajos en orden de\n"
          "cercania a tu ubicación",
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.black38,
      textColor: Colors.white,
    );
  }

  void continueWorkerRute(BuildContext context) {
    var singletonWorkerInstance = SingletonWorker();
    singletonWorkerInstance.localidad = localidad;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Ocupacion()));
  }

  var localidad;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: util.getHeightWithoutSafeAreaAppBar(context) * 0.2,
          decoration: BoxDecoration(
            //color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("ELIJA LA LOCALIDAD EN\n    LA QUE USTED VIVE",
                        style: TextStyle(
                            fontFamily: "Robotto",
                            fontSize: ScreenUtil.getInstance().setSp(38),
                            letterSpacing: .6,
                            color: Colors.black))
                  ],
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: Text("NO APLICA"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "NO APLICA";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Usaquén"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Usaquén";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Chapinero"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Chapinero";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Santa Fe"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Santa Fe";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("San Cristóbal"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "San Cristóbal";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Usme"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Usme";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Tunjuelito"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Tunjuelito";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Bosa"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Bosa";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Kennedy"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Kennedy";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Fontibón"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Fontibón";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Engativá"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Engativá";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Suba"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Suba";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Barrios Unidos"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Barrios Unidos";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Teusaquillo"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Teusaquillo";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Los Mártires"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Los Mártires";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Antonio Nariño"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Antonio Nariño";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Puente Aranda"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Puente Aranda";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("La Candelaria"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "La Candelaria";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Rafael Uribe"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Rafael Uribe";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Ciudad Bolívar"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Ciudad Bolívar";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Sumapaz"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            localidad = "Sumapaz";
            continueWorkerRute(context);
          },
        ),
      ],
    );
  }
}
