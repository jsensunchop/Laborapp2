import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/NumericalKeyboard.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class NumericalTest extends StatefulWidget {
  @override
  _NumericalTestState createState() => _NumericalTestState();
}

class _NumericalTestState extends State<NumericalTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 500,
          height: getHeightWithoutSafeArea(context) * 0.4,
        ),
        NumericalKeyboard().LaboraapNumericalKeyboard(context: context,colorCode: ColorPalette.mediumGrayApp )

      ],
    );
  }
}
