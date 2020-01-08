import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';

class testScreenOne extends StatefulWidget {
  @override
  _testScreenOneState createState() => _testScreenOneState();
}

class _testScreenOneState extends State<testScreenOne> {
  sayHi() {
    print("Hi!");
    print("REGISTRESE".length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaborAppBar().build(context),
      body: Container(
        width: 500,
        height: 800,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            LaboraapButtons().NormalButton(
                inText: "REGISTRESE",
                colorCode: ColorPalette.yellowApp,
                buttonFunction: () {
                  sayHi();
                },
                context: context),
            LaboraapButtons().NormalButton(
                inText: "ENTRAR",
                colorCode: ColorPalette.strongGeryApp,
                buttonFunction: () {
                  sayHi();
                },
                context: context),
            LaboraapButtons().NormalButton(
                inText: "INGRESAR",
                colorCode: ColorPalette.yellowApp,
                buttonFunction: () {
                  sayHi();
                },
                context: context),
            LaboraapButtons().NormalButton(
                inText: "CONFIRMAR",
                colorCode: ColorPalette.strongGeryApp,
                buttonFunction: () {
                  sayHi();
                },
                context: context),
            LaboraapButtons().NormalButton(
                inText: "SIGUIENTE",
                colorCode: ColorPalette.yellowApp,
                buttonFunction: () {
                  sayHi();
                },
                context: context),
            LaboraapButtons().NormalButton(
                inText: "SUBIR",
                colorCode: ColorPalette.strongGeryApp,
                buttonFunction: () {
                  sayHi();
                },
                context: context),
            LaboraapButtons().NormalButton(
                inText: "APLICAR A OFERTAS",
                colorCode: ColorPalette.yellowApp,
                buttonFunction: () {
                  sayHi();
                },
                context: context),
            LaboraapButtons().PopUpButton(
                inText: "TOMO ESTA OFERTA",
                colorCode: ColorPalette.strongGeryApp,
                buttonFunction: () {
                  sayHi();
                },
                context: context),
            LaboraapButtons().PopUpButton(
                inText: "ENTENDIDO",
                buttonFunction: () {
                  sayHi();
                },
                context: context),
          ],
        ),
      ),
    );
  }
}
