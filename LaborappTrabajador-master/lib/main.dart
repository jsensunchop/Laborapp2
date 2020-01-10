import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Tests/testScreenOne.dart';
import 'dart:async';
import 'Common/ColorPalette.dart';
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => testScreenOne()));
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
