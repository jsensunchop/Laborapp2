import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';

class ChangePasswordHttp {
  var _status;
  var _responseF;

  _ChangePassword(String pss,String newPss) async {
    String url = Ips.Sign + "/changePassword";
    var body = {
      "documentNumber": SingletonWorker().IdNumber.toString(),
      "password": pss,
      "newPassword": newPss
    };
    try {
      Response response = await post(url, body: body);
      _status = response.statusCode;
      _responseF = response.body;
      return _status;
    } catch (e) {
      return 500;
    }
  }

  _goToRoute(context) {
    Navigator.pop(context);
  }

  void changePassword(BuildContext context, pss, newPss) {
    Future<dynamic> future = _ChangePassword(pss,newPss);
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        _goToRoute(context);
      } else {
        print(_responseF);
      }
    });
  }
}
