import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:laborapp_trabajador/Routes/RoutesNames.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffert.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/Offert.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class CheckMatchHttp {
  var status;
  Map lastData;
  var responseF;
  int _index;

  _chechMatch() async {
    print("x");
    String url = Ips.Match + "/checkMatch";
    var body = {
      "documentNumber": SingletonWorker().IdNumber.toString(),
      "offerID": SingletonActiveOffers().activeOfferts[_index].id
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

  _showCurrentStatus(context) {
    var ActiveOffers = SingletonActiveOffers();
    var singletonOffer = SingletonOffert();
    singletonOffer.setAllToNull();
    singletonOffer.documents = ActiveOffers.activeOfferts[_index].Documents;
    singletonOffer.setDate(ActiveOffers.activeOfferts[_index].date);
    singletonOffer.setCity(ActiveOffers.activeOfferts[_index].city);
    singletonOffer.setSpecialty(ActiveOffers.activeOfferts[_index].specialty);
    singletonOffer
        .setsubSpecialty(ActiveOffers.activeOfferts[_index].subSpecialty);
    singletonOffer.setHour(ActiveOffers.activeOfferts[_index].hour);
    singletonOffer.setAdress(ActiveOffers.activeOfferts[_index].adress);
    singletonOffer
        .setWorkersNedeed(ActiveOffers.activeOfferts[_index].workersNedeed);
    singletonOffer.setLocalidad(ActiveOffers.activeOfferts[_index].localidad);
    singletonOffer.index = _index;
    singletonOffer.id = ActiveOffers.activeOfferts[_index].id;
    singletonOffer.companyName = ActiveOffers.activeOfferts[_index].Comany;
    singletonOffer.employeeName =
        ActiveOffers.activeOfferts[_index].EmployeeName;
      showAcceptedPopUp(context);
  }

  CheckMatch(BuildContext context, int _index) {
    this._index = _index;

    Future<dynamic> future = _chechMatch();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        lastData = json.decode(responseF);
        _showCurrentStatus(context);
      } else {
        print(responseF);
      }
    });
  }
}
