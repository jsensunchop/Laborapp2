import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class LookUpOffer extends StatefulWidget {
  @override
  _LookUpOfferState createState() => _LookUpOfferState();
}

class _LookUpOfferState extends State<LookUpOffer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context) * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ProfileHeader()
        ],
      ),
    );
  }
}
