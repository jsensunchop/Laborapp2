import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/SignIn/main1.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';

class SignUpTwo extends StatefulWidget {
  @override
  _SignUpTwoState createState() => _SignUpTwoState();
}

class _SignUpTwoState extends State<SignUpTwo> {
  var status;
  var responseF;
  var pss1;
  var pss2;

  _signUp() async {
    var singletonWorkerInstance = SingletonWorker();
    String url = Ips.Sign + "/singUpWorker";
    var body = {"name":singletonWorkerInstance.name,
    "documentType":singletonWorkerInstance.IdType,
    "documentNumber":singletonWorkerInstance.IdNumber.toString(),
    "cellphone":singletonWorkerInstance.CelNumber,
    "password":pss1,};
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

  bool validateData() {
    print(pss2);
    print(pss1);
    if (pss1 == null || pss1 == " " || pss2 == " " || pss2 == null) {
      print("Contraseñas vacia");
      return false;
    } else if (pss1 != pss2) {
      print("Contraseñas mal");
      return false;
    }
    return true;
  }

  void continueWorkerRute(BuildContext context) {
    if (!validateData()) return;

    print("Maing request");
    Future<dynamic> future = _signUp();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => main1()));
      } else {
        print("XDXDDXD");
        // LaborappToasts().getFieldErrorToast(context);
        print(responseF);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    /*Variables Space*/

    double height = getHeightWithoutSafeArea(context);

    var nextButton = FlatButton(
      color: Color(ColorPalette.yellowApp),
      textColor: Color(ColorPalette.strongGeryApp),
      padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
      splashColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: () {
        continueWorkerRute(context);
        print("Registrado ");
      },
      child: Text(
        "Registrarme",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
      ),
    );

    var inputTextDecoration = BoxDecoration(
      color: Color(ColorPalette.mediumGrayApp),
      border: Border(
        left: BorderSide(
          //                   <--- left side
          color: Color(ColorPalette.strongGeryApp),
          width: 2.0,
        ),
        top: BorderSide(
          //                    <--- top side
          color: Color(ColorPalette.strongGeryApp),
          width: 2.0,
        ),
      ),
    );

    var nameInput = Container(
      width: 300.0,
      height: 50.0,
      decoration: inputTextDecoration,
      child: TextField(
        onChanged: (text) {
          pss1 = text;
        },
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Piense en una clave",
            hintStyle: TextStyle(
                color: Colors.white, fontSize: 18.0, letterSpacing: 1.0)),
      ),
    );

    var idInput = Container(
      width: 300.0,
      height: 50.0,
      decoration: inputTextDecoration,
      child: TextField(
        onChanged: (text) {
          pss2 = text;
        },
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "repitala",
            hintStyle: TextStyle(
                color: Colors.white, fontSize: 18.0, letterSpacing: 1.0)),
      ),
    );

    var screenBody = MaterialApp(
        home: Scaffold(
            appBar: LaborAppBar().build(context),
            body: SingleChildScrollView(
                child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                      child: Image.asset(
                    'assets/registo_obrero/workerSignIn/workers.png',
                    //width: double.infinity,
                    //height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    fit: BoxFit.cover,
                  )),
                  Container(
                      child: Image.asset(
                    'assets/registo_obrero/workerSignIn/logoScreen.png',
                    //width: double.infinity,
                    //height: double.infinity,
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    fit: BoxFit.cover,
                  )),
                  Align(alignment: Alignment(0, -0.5), child: nameInput),
                  Align(alignment: Alignment(0, -0.2), child: idInput),
                  Align(alignment: Alignment(0, 0.3), child: nextButton)
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: getHeightWithoutSafeAreaAppBar(context),
            )),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                  'assets/registo_obrero/workerSignIn/HelpBoton1.png'),
              onPressed: () {
                print("Ayudando");
              },
            )));

    return screenBody;
  }
}
