import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';

import '../Common/ColorPalette.dart';
import '../Common/ColorPalette.dart';
import '../Common/LaborappButtons.dart';
import '../Tests/SingletonTests.dart';
import '../Tests/SingletonTests.dart';
import '../Util/UtilMethods.dart';
import '../Util/UtilMethods.dart';

class AppSplash extends StatefulWidget {
  @override
  _AppSplashState createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => changeRute());
  }

  changeRute() {
    SingletonTest.initWorkerSingleton();
    SingletonTest.initOffertSingleton();
    Navigator.pushNamed(context, RoutesNames.Landing);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              width: getFullScreenWidth(context),
              height: getFullScreenHeight(context),
              decoration: BoxDecoration(
                  color: Color(ColorPalette.yellowApp)),
          child: Image(image: AssetImage('images/LogoNegro.png'),),),
        ],
      ),
    );
  }
}
