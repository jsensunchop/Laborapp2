import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappToast.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';
import 'Ocupacion.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laborapp_trabajador/signUp/home1.dart';
import 'package:http/http.dart' as http;

class subespecialidadpintura extends StatefulWidget {
  _subespecialidadpinturaState createState() => _subespecialidadpinturaState();
}

class _subespecialidadpinturaState extends State<subespecialidadpintura>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 1, initialIndex: 0);
  }

  Future<bool> _onBackPressed() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => Ocupacion()));
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

  ////////////////////////
  var subSpecialty;
  var singletonWorkerInstance;
  var status;
  var responseF;

  _completeSignUp() async {
    print(singletonWorkerInstance.IdNumber.toString());
    print("LOCALIDAD : " + singletonWorkerInstance.localidad);
    String url = Ips.Sign + "/completeSignUp";
    var body = {
      "documentNumber": singletonWorkerInstance.IdNumber.toString(),
      "localidad": singletonWorkerInstance.localidad,
      "specialty": singletonWorkerInstance.specialty,
      "subSpecialty": singletonWorkerInstance.subSpecialty
    };
    try {
      http.Response response = await http.post(url, body: body);
      status = response.statusCode;
      responseF = response.body;
      return status;
    } catch (e) {
      print(e);
      return 500;
    }
  }

  void continueWorkerRute(BuildContext context) {
    singletonWorkerInstance = SingletonWorker();
    singletonWorkerInstance.subSpecialty = subSpecialty;
    Future<dynamic> future = _completeSignUp();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home1()));
      } else {
        print("XDXDDXD");
        LaborappToasts().getNetworkErrorToast(context);
        print(responseF);
      }
    });
  }

  //////////////////////////

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: ScreenUtil.getInstance().setHeight(280),
          decoration: BoxDecoration(
            color: Colors.transparent,
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
                  children: <Widget>[
                    Text("ELIJA LA SUBESPECIALIDAD",
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
          title: Text("Estuco"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            subSpecialty = "Estuco";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Segunda Mano"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            subSpecialty = "Segunda Mano";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Terminación"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            subSpecialty = "Terminación";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Graniplast"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            subSpecialty = "Graniplast";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Carraplast"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            subSpecialty = "Carraplast";
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Ayudante"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            subSpecialty = "Ayudante";
            continueWorkerRute(context);
          },
        ),
      ],
    );
  }
}
