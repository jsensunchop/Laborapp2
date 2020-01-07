import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/signUp/SignUpTwo.dart';

class SignUpOne extends StatefulWidget {
  @override
  _SignUpOneState createState() => _SignUpOneState();
}

class _SignUpOneState extends State<SignUpOne> {
  String dropdownValue = 'CEDULA';
  var singletonWorkerInstance = SingletonWorker();

  bool validateData() {
    if (singletonWorkerInstance.IdType == null ||
        singletonWorkerInstance.IdType == " " ||
        singletonWorkerInstance.IdNumber == 0 ||
        singletonWorkerInstance.IdNumber == null ||
        singletonWorkerInstance.name == " " ||
        singletonWorkerInstance.name == null ||
        singletonWorkerInstance.CelNumber == " " ||
        singletonWorkerInstance.CelNumber == null) {
      print("Algun dato esta mal");
      return false;
    }
    return true;
  }

  void continueWorkerRute(BuildContext context) {
    if (!validateData()) return;

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpTwo()));
  }

  @override
  Widget build(BuildContext context) {
    /*Variables init*/
    double height = getHeightWithoutSafeArea(context);
    singletonWorkerInstance.IdType = dropdownValue;

    /*Widgets Space*/

    var nextButton = FlatButton(
      color: Color(ColorPalette.yellowApp),
      textColor: Color(ColorPalette.strongGeryApp),
      padding: EdgeInsets.fromLTRB(42.0, 8.0, 42.0, 8.0),
      splashColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      onPressed: () {
        continueWorkerRute(context);
      },
      child: Text(
        "Siguiente",
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
          singletonWorkerInstance.name = text;
        },
        style: new TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "escriba aqui nombre y apellido",
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
          singletonWorkerInstance.IdNumber = int.parse(text);
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "escriba aqui el numero",
            hintStyle: TextStyle(
                color: Colors.white, fontSize: 18.0, letterSpacing: 1.0)),
      ),
    );
    var celInput = Container(
      width: 300.0,
      height: 50.0,
      decoration: inputTextDecoration,
      child: TextField(
        onChanged: (text) {
          singletonWorkerInstance.CelNumber = text;
        },
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "y el numero de celular",
            hintStyle: TextStyle(
                color: Colors.white, fontSize: 18.0, letterSpacing: 1.0)),
      ),
    );

    var idType = DropdownButton<String>(
      value: dropdownValue,
      underline: Container(color: Colors.amber, height: 1.0),
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      onChanged: (String newValue) {
        setState(() {
          singletonWorkerInstance.IdType = newValue;
          dropdownValue = newValue;
          //print(dropdownValue);
        });
      },
      items: <String>['CEDULA', 'CEDULA EXTRANJERIA', 'PASAPORTE', 'NIT']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );

    var appBar = PreferredSize(
      preferredSize: Size.fromHeight(height * 0.1),
      child: AppBar(
        backgroundColor: Color(ColorPalette.strongGeryApp),
        title: Align(
          alignment: Alignment.topRight,
          child: Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Image.asset(
                'assets/common/LogoHeader.png',
              )),
        ),
      ),
    );

    var appBar2 = LaborAppBar().build(context);

    //print(kToolbarHeight);

    var screenBody = MaterialApp(
        home: Scaffold(
            appBar: appBar2,
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
                  Align(
                      alignment: Alignment(0, -0.75),
                      child: Text("REGISTRO",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white))),
                  Align(alignment: Alignment(0, -0.5), child: nameInput),
                  Align(
                      alignment: Alignment(0, -0.2),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            canvasColor:
                                Color(ColorPalette.softGrayApp).withAlpha(150)),
                        child: idType,
                      )),
                  Align(alignment: Alignment(0, 0.1), child: idInput),
                  Align(alignment: Alignment(0, 0.4), child: celInput),
                  Align(alignment: Alignment(0, 0.7), child: nextButton),
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
