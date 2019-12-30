import 'package:flutter/material.dart';
import 'pin_put_state.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<TextEditingController> controllers = <TextEditingController>[new TextEditingController()
    ,TextEditingController(),TextEditingController(),TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pinBoxs(50.0, controllers, Colors.white, Colors.black, context, false),
        ),
      ),
    );
  }
}