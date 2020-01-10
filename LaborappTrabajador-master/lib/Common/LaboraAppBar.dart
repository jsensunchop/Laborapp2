import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';

class LaborAppBar extends StatelessWidget {
  final double percentageSize = 0.1;
  @override
  Widget build(BuildContext context) {
    double height = getHeightWithoutSafeArea(context);
    return PreferredSize(
      preferredSize: Size.fromHeight(height * 0.1),
      child: AppBar(
        actions: <Widget>[],
        leading: new Container(),
        backgroundColor: Color(ColorPalette.strongGeryApp),
        title: Align(
          alignment: Alignment.topRight,
          child: Container(
              height: getHeightWithoutSafeAreaAppBar(context) * 0.07,
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Image.asset(
                'assets/common/LogoHeader.png',
              )),
        ),
      ),
    );
  }
}
