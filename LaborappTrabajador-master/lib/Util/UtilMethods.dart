import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';

getInicials(String name) {
  name = name.toUpperCase();
  //split into arrays
  var arrName = name.split(" ");
  //check length
  if (arrName.length > 1) {
    return arrName[0][0] + arrName[1][0];
  } else {
    int middle = (arrName[0].length / 2).round();
    return arrName[0][0] + arrName[0][middle];
  }
}

double getFullScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getFullScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getHeightWithoutSafeArea(BuildContext context) {
  var padding = MediaQuery.of(context).padding;
  return MediaQuery.of(context).size.height - padding.top - padding.bottom;
}

double getHeightWithoutStatusBar(BuildContext context) {
  var padding = MediaQuery.of(context).padding;
  return MediaQuery.of(context).size.height - padding.top;
}

double getHeightWithoutStatusAndToolBar(BuildContext context) {
  var padding = MediaQuery.of(context).padding;
  return MediaQuery.of(context).size.height - padding.top - kToolbarHeight;
}

double getHeightWithoutSafeAreaAppBar(BuildContext context) {
  var padding = MediaQuery.of(context).padding;
  double appbarFactor = LaborAppBar().percentageSize;
  double finalHeight = MediaQuery.of(context).size.height -
      padding.top -
      padding.bottom * (1 - appbarFactor);
  return finalHeight;
}

EdgeInsets getPadding(BuildContext context) {
  return MediaQuery.of(context).padding;
}

SizedBox getSpace(double space, BuildContext context) {
  return SizedBox(
       height:
       getHeightWithoutSafeAreaAppBar(context) * space);
}
