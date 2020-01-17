import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Landing/Landing.dart';

import '../Common/ColorPalette.dart';
import '../Tests/SingletonTests.dart';
import '../Util/UtilMethods.dart';

class AppSplash extends StatefulWidget {
  @override
  _AppSplashState createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  bool _spalshEnded = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => changeRute());
  }

  changeRute() {
    setState(() {
      SingletonTest.initWorkerSingleton();
      SingletonTest.initOffertSingleton();
      SingletonTest.initOffers();

      _spalshEnded = true;
    });
    //Navigator.pushNamed(context, RoutesNames.Landing);
  }

  @override
  Widget build(BuildContext context) {
    if (_spalshEnded != false) return Landing();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: getFullScreenWidth(context),
            height: getFullScreenHeight(context),
            decoration: BoxDecoration(color: Color(ColorPalette.yellowApp)),
            child: Image(
              image: AssetImage('images/LogoNegro.png'),
            ),
          ),
        ],
      ),
    );
  }
}
