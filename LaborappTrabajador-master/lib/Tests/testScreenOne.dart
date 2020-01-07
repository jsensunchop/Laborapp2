import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';

class testScreenOne extends StatefulWidget {
  @override
  _testScreenOneState createState() => _testScreenOneState();
}

class _testScreenOneState extends State<testScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LaborAppBar().build(context),

    );
  }
}
