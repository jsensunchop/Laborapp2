import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';

class LogInHttp {
  var status;
  var responseF;

  _LogIn() async {
    String url = Ips.Sign + "/singInWorker";
    var body = {
      "documentNumber": SingletonWorker().IdNumber.toString(),
      "password": SingletonWorker().pss
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

  void _getWorkerSingleton(Map responseData) {
    SingletonWorker().Calification = responseData['User']['calification'];
    SingletonWorker().Specialty = responseData['User']['specialty'];
    SingletonWorker().SubSpecialty = responseData['User']['subSpecialty'];
    SingletonWorker().appCode = responseData['User']['appCode'];
    SingletonWorker().name = responseData['User']['name'];
    SingletonWorker().IdType = responseData['User']['documentType'];
    SingletonWorker().IdNumber = responseData['User']['documentNumber'];
    SingletonWorker().CelNumber = responseData['User']['cellphone'].toString();
    SingletonWorker().documents = responseData['User']['documents'];
  }

  _goToRoute(context) {
    if (SingletonWorker().Specialty == 'undefined') {
      Navigator.pushNamed(context, RoutesNames.LocalizationScreen);
    } else {
      Navigator.pushNamed(context, RoutesNames.ProfileLanding);
    }
  }

  void logIn(BuildContext context) {
    Future<dynamic> future = _LogIn();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        Map lastData;
        lastData = json.decode(responseF);
        _getWorkerSingleton(lastData);
        _goToRoute(context);
      } else {
        print(responseF);
      }
    });
  }
}
