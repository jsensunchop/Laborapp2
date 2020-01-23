import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class CodeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getFullScreenWidth(context) * 0.25,
      height: getHeightWithoutSafeAreaAppBar(context) * 0.07,
      color: Color(ColorPalette.yellowApp),
      child: Center(
        child: AutoSizeText(SingletonWorker().appCode.toUpperCase(), style:TextStyle(
            fontSize: 40.0, color: Color(ColorPalette.strongGeryApp),fontWeight: FontWeight.w800) ,maxLines: 1,),
      ),
    );
  }
}
