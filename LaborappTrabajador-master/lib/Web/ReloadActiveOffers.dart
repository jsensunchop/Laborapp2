import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/Offert.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';

class ReloadActiveOffersHttp {
  var status;
  var responseF;

  _LogIn() async {
    String url = Ips.Match + "/getAllOffers";
    var body = {
      "documentNumber": SingletonWorker().IdNumber.toString()
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

  void _getSingletonOffers(Map responseData) {
    var singletonActiveOffersInstance = SingletonActiveOffers();
    List<dynamic> offers = responseData['offers'];
    singletonActiveOffersInstance.activeOfferts.clear();
    for (int i = 0; i < offers.length; i++) {
      var algo = Offert(
          offers[i]['currentWorkers'],
          offers[i]['city'],
          offers[i]['cityDep'],
          offers[i]['direction'],
          offers[i]['offerDate'],
          offers[i]['offerHour'],
          offers[i]['workersNeeded'],
          offers[i]['specialty'],
          offers[i]['subSpecialty'],
          i,
          offers[i]['offerID'],
          offers[i]['companyName'],
          offers[i]['employeeName'],
          offers[i]['documents']);
      singletonActiveOffersInstance.activeOfferts.add(algo);
    }
  }

  _goToRoute(context) {
    Navigator.pop(context);
  }

  void ReloadOffers(BuildContext context) {
    Future<dynamic> future = _LogIn();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        Map lastData;
        lastData = json.decode(responseF);
        _getSingletonOffers(lastData);
        _goToRoute(context);
      } else {
        print(responseF);
      }
    });
  }
}
