import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/popUps/AcceptedPopUp.dart';
import 'package:laborapp_trabajador/popUps/DocumentPopUp.dart';
import 'package:laborapp_trabajador/popUps/MissingPaswordPopUp.dart';
import 'package:laborapp_trabajador/popUps/OffPopUp.dart';
import 'package:laborapp_trabajador/popUps/OnPopUp.dart';
import 'package:laborapp_trabajador/popUps/RemmemberPopUp.dart';
import 'package:laborapp_trabajador/popUps/OffertPopUp.dart';

showMissingPaswordPopUp(BuildContext context) {
  showDialog(context: context, builder: (context) => MissingPaswordPopUp());
}

showDocumentPopUp(BuildContext context) {
  showDialog(context: context, builder: (context) => DocumentPopUp());
}

showAcceptedPopUp(BuildContext context) {
  showDialog(context: context, builder: (context) => AcceptedPopUp());
}

showOffertPopUp(BuildContext context, {String cName}) {
  showDialog(context: context, builder: (context) => OffertPopUp().buildPopUp(context));
}

showRemmemberPopUp(BuildContext context) {
  showDialog(context: context, builder: (context) => RemmemberPopUp());
}

showOnPopUp(BuildContext context) {
  showDialog(context: context, builder: (context) => OnPopUp());
}

showOffPopUp(BuildContext context) {
  showDialog(context: context, builder: (context) => OffPopUp());
}
