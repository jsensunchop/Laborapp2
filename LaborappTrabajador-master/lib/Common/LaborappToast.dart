import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LaborappToasts {
  getFieldErrorToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Por favor revise que los campos\n"
            "                Esten correctos.",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }

  getNetworkErrorToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Por favor revise su conexion",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }

  getDoneApplyToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Se aplico correctamente",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }

  getCredentialErrorToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Por favor revise usuario y contraseña",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }

  getPasswordHelpToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Digite una clave igual \n"
            "   en ambos campos",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }

  getWrongPasswordToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "No coinciden las contraseñas",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }

  getOffertSendToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Oferta enviada",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black38,
        textColor: Colors.white);
  }
}
