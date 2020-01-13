import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laborapp_trabajador/SignUp/signUpPassword.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/JobScreens/jobInterest.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class signUpScreen extends StatefulWidget {
  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  int _radioValue1 = -1;
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

  @override
  Widget build(BuildContext context) {
    /*Variables init*/
    double height = getHeightWithoutSafeArea(context);
    singletonWorkerInstance.IdType = dropdownValue;

    /*Widgets Space*/

    var nextButton = LaboraapButtons().NormalButton(
        inText: "SIGUIENTE",
        colorCode: ColorPalette.yellowApp,
        buttonFunction: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPassword()));
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
      items: <String>['CEDULA', 'CéDULA EXTRANJERIA', 'PASAPORTE', 'NIT']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
    );

    var appBar = LaborAppBar().build(context);

    //print(kToolbarHeight);

    var screenBody = Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
            width: getFullScreenWidth(context),
            height: getHeightWithoutSafeArea(context) * 0.9,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/Trabajador.jpeg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                nameInput,
                Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:
                          Color(ColorPalette.softGrayApp).withAlpha(150)),
                  child: idType,
                ),
                idInput,
                celInput,
                nextButton,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 0,
                      groupValue: _radioValue1,
                      activeColor: Colors.white,
                      //onChanged: _handleRadioValueChange1,
                    ),
                    new Text(
                      'Recordar mis datos',
                      style: new TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                )
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        label: Text("¿Necesita\n   ayuda?"),
      ),
    );

    return screenBody;
  }
}
