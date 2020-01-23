import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laborapp_trabajador/Offers/OfferSended.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffert.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';


class SetAnApplyHttp{

  var status;
  var responseF;

  _setAnApply() async {

    String url = Ips.Match + "/setAnApply";
    var body = {
      "offerID": SingletonOffert().id,
      "documentNumber": SingletonWorker().IdNumber.toString(),
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

_goToLookUpOffers(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => OfferSended()));
}
  void logIn(BuildContext context) {
    Future<dynamic> future = _setAnApply();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        Navigator.pop(context);
        _goToLookUpOffers(context);
      } else {
        print(responseF);
      }
    });
  }
}