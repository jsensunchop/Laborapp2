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
import 'package:auto_size_text/auto_size_text.dart';

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
            hintText: "Escriba aquí nombre y apellido",
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
        onChanged: (text) {
          singletonWorkerInstance.CelNumber = text;
        },
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
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.amber,
        size: 15,
      ),
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
        return DropdownMenuItem<String>(value: value, child: SizedBox(
          height: getHeightWithoutSafeArea(context) * 0.03,
          width: getFullScreenWidth(context) * 0.5,
          child: AutoSizeText(
            value,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ));
      }).toList(),
    );

    var appBar = LaborAppBar().build(context);

    //print(kToolbarHeight);

    var screenBody = Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
            width: getFullScreenWidth(context),
            height: getHeightWithoutSafeArea(context) * 1,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/TrabajadorG.jpeg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: <Widget>[
                SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.066),
                nameInput,
                SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.04),

                Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor:
                          Color(ColorPalette.softGrayApp).withAlpha(150)),
                  child: idType,
                ),
                SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.02),
                idInput,
                SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.03),
                celInput,
                SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.04),

                Theme(
                  data: ThemeData( brightness: Brightness.dark,unselectedWidgetColor:Colors.white),

                  child: Row(
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
                  ),
                ),
                SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.08),
                nextButton,
                SizedBox(
                  height: getHeightWithoutSafeArea(context) * 0.09,
                ),

                Row (
                  children: <Widget>[
                    SizedBox(
                      width: getFullScreenWidth(context) * 0.7,
                    ),
                    Row (
                      children: <Widget>[
                        SizedBox.fromSize(
                          size: Size(80, 80), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Colors.black, // button color
                              child: InkWell(
                                splashColor: Colors.green, // splash color
                                onTap: () {}, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[ // icon
                                    Text(
                                      "¿Necesita\n   ayuda?",
                                      style: TextStyle(color: Colors.white),
                                        ), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )

              ],
            )),
      ),

    );

    return screenBody;
  }
}
