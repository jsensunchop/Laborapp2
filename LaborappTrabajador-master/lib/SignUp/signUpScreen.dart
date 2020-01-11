import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/JobScreens/jobInterest.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class SignUpOne extends StatefulWidget {
  @override
  _SignUpOneState createState() => _SignUpOneState();
}

class _SignUpOneState extends State<SignUpOne> {
  @override
  Widget build(BuildContext context) {
    /*Variables init*/
    double height = getHeightWithoutSafeArea(context);
    /*Widgets Space*/

    var nextButton = LaboraapButtons().NormalButton(
        inText: "SIGUIENTE",
        colorCode: ColorPalette.yellowApp,
        buttonFunction: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => jobInterest()));
        },
        context: context);

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
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Número de documento",
            hintStyle: TextStyle(
                color: Colors.white, fontSize: 18.0, letterSpacing: 1.0)),
      ),
    );
    var celInput = Container(
      width: 300.0,
      height: 50.0,
      decoration: inputTextDecoration,
      child: TextField(
        textAlign: TextAlign.center,
        style: new TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Número de celular",
            hintStyle: TextStyle(
                color: Colors.white, fontSize: 18.0, letterSpacing: 1.0)),
      ),
    );

    var idType = DropdownButton<String>(
      underline: Container(color: Colors.amber, height: 1.0),
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      items: <String>['CEDULA', 'CEDULA EXTRANJERIA', 'PASAPORTE', 'NIT']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );

    var appBar2 = LaborAppBar().build(context);
    //print(kToolbarHeight);
    var screenBody = Scaffold(
      appBar: appBar2,
      body: SingleChildScrollView(
        physics: null ,
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

    );

    return screenBody;
  }
}
