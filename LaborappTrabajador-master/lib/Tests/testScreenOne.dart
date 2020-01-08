import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboappButtons.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';

class testScreenOne extends StatefulWidget {
  @override
  _testScreenOneState createState() => _testScreenOneState();
}

class _testScreenOneState extends State<testScreenOne> {
  sayHi() {
    print("Hi!");
  }
  sayBye() {
    print("Bye!");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: LaborAppBar().build(context),
        body: Container(
          width: 500,
          height: 500,
          color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LaboraapButtons().NormalButton(
              inText: "Hola",
              colorCode: ColorPalette.strongGeryApp,
              buttonFunction: () => sayHi()),

              LaboraapButtons().NormalButton(
                  inText: "ADIOS",
                  colorCode: ColorPalette.strongGeryApp,
                  buttonFunction: () => sayBye())
            ],
          ),
        ));
  }
}
