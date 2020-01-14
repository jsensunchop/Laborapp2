import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Routes/RouteGenerator.dart';

void main() => runApp(MaterialApp(home: SplashScreen()));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'LABOR-APP',
    );
  }
}
