import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/CodeContainer.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/InicialsContainer.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InicialsContainer().NormalInicials(context),
          AutoSizeText(
            SingletonWorker().name.toUpperCase(),
            maxLines: 1,
            style: TextStyle(
                fontSize: 25.0, color: Color(ColorPalette.yellowApp),fontWeight: FontWeight.w800),
          ),
          CodeContainer(),
        ],
      ),
    );
  }
}
