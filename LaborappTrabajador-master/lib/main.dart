import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Documents/documentsUpload.dart';
import 'package:laborapp_trabajador/JobScreens/jobInterest.dart';
import 'package:laborapp_trabajador/Landing/Landing.dart';
import 'package:laborapp_trabajador/Localization/localizationScreen.dart';
import 'package:laborapp_trabajador/Password/PasswordScreen.dart';
import 'package:laborapp_trabajador/Tests/NumericalKeyBoardTest.dart';
import 'package:laborapp_trabajador/Tests/PopUpsTest.dart';
import 'package:laborapp_trabajador/Profile/ProfileLanding.dart';
import 'package:laborapp_trabajador/Tests/SingletonTests.dart';
import 'package:laborapp_trabajador/Tests/testScreenOne.dart';
import 'dart:async';
import 'Common/ColorPalette.dart';
import 'package:laborapp_trabajador/SignUp/signUpScreen.dart';
import 'const/TextConstants.dart';
//import 'package:laborapp_trabajador/SignIn/main1.dart';

void main() => runApp(MaterialApp(home: SplashScreen()));

/*here create the state widget*/
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //check the time in that will change the screen
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => changeRute());
  }

  void changeRute() {
    SingletonTest().initOffertSingleton();
    SingletonTest().initWorkerSingleton();
    //Navigator.push(context, MaterialPageRoute(builder: (context) => testScreenOne()));
    //Navigator.push(context, MaterialPageRoute(builder: (context) => PopUpTest()));
    Navigator.push(context, MaterialPageRoute(builder: (context) => Landing()));
    //Navigator.push(context, MaterialPageRoute(builder: (context) => signUpScreen()));
    //Navigator.push(context, MaterialPageRoute(builder: (context) => localizationScreen()));
    //Navigator.push(context, MaterialPageRoute(builder: (context) => documentsUpload()));
    //Navigator.push(context, MaterialPageRoute(builder: (context) => jobInterest()));
    //Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen()));
  }

  /*build the looking of the splash screen*/
  @override
  Widget build(BuildContext context) {
    // String with the app name
    String appName = "\n  " + TextConstants.appName;
    //The text that will be displayed
    var splashText = Text(appName,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32,
            color: Color(ColorPalette.strongGeryApp),
            fontWeight: FontWeight.bold));
    //The screen indeed
    var usingStack = MaterialApp(
      title: '',
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: Color(ColorPalette.yellowApp),
              child: Image.asset(
                'assets/landing/logo.png',
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
    return usingStack;
  }
}
