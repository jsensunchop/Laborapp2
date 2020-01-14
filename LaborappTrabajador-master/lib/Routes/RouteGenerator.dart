import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/Splash/AppSplash.dart';

import '../Landing/Landing.dart';
import '../SignUp/signUpPassword.dart';
import '../SignUp/signUpScreen.dart';
import '../main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutesNames.Splash:
        return MaterialPageRoute(builder: (_) => AppSplash());
      case RoutesNames.Landing:
        return MaterialPageRoute(builder: (_) => Landing());
      case RoutesNames.SignUpScreen:
        return MaterialPageRoute(builder: (_) => signUpScreen());
      case RoutesNames.SignUpPassword:
        return MaterialPageRoute(builder: (_) => SignUpPassword());


    }
  }
}