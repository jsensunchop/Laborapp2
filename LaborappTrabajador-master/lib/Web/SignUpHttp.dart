import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laborapp_trabajador/Localization/localizationScreen.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';

class SignUpHttp {
  var status;
  var responseF;

  _signUp() async {
    String url = Ips.Sign + "/singUpWorker";
    var body = {
      "name": SingletonWorker().name,
      "documentType": SingletonWorker().IdType,
      "documentNumber": SingletonWorker().IdNumber.toString(),
      "cellphone": SingletonWorker().CelNumber,
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

  void signUp(BuildContext context) {
    Future<dynamic> future = _signUp();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        Map lastData;
        lastData = json.decode(responseF);
        print(lastData);
        SingletonWorker().appCode = lastData['worker']['appCode'];
        Navigator.pushNamed(context, RoutesNames.LocalizationScreen);
        //Navigator.push(context, MaterialPageRoute(builder: (context) => localizationScreen()));
      } else {
        print(responseF);
      }
    });
  }




}
