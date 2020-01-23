
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laborapp_trabajador/Profile/ProfileLanding.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';

class EndSignUpHttp {
  var status;
  var responseF;

  _endSignUp() async {
    String url = Ips.Sign + "/completeSignUp";
    var body = {
      "documentNumber":SingletonWorker().IdNumber.toString(),
      "localidad":SingletonWorker().localidad,
      "specialty":SingletonWorker().Specialty,
      "subSpecialty":SingletonWorker().SubSpecialty,
      "city":SingletonWorker().City,
    };
    try {
      Response response = await post(url, body: body);
      status = response.statusCode;
      responseF = response.body;
      return status;
    } catch (e) {
      return 500;
    }
  }

  void endSignUp(BuildContext context) {
    Future<dynamic> future = _endSignUp();
    future.then((status) {
      if (status >= 200 && status < 300) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProfileLanding()));
      } else {
        print(responseF);
      }
    });
  }

}