import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/LaborappToast.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonOffert.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonBuilder.dart';
import 'package:http/http.dart' as http;

class ShowActiveOffer extends StatefulWidget {
  @override
  _ShowActiveOfferState createState() => _ShowActiveOfferState();
}

class _ShowActiveOfferState extends State<ShowActiveOffer> {
  //var singletonBuilderInstance = SingletonBuilder();
  var singeltonActiveOffersInstance = SingletonActiveOffers();
  var singletonOffersInstance = SingletonOffert();
  var singletonWorkerInstance = SingletonWorker();
  var status;
  var responseF;
  var index;

  _postutalte() async {
    String url = Ips.Match + "/setAnApply";
    var body = {
      "documentNumber": singletonWorkerInstance.IdNumber.toString(),
      "offerID": singletonOffersInstance.id
    };
    try {
      http.Response response = await http.post(url, body: body);
      status = response.statusCode;
      responseF = response.body;
      return status;
    } catch (e) {
      print(e);
      return 500;
    }
  }

  postulateToOffert(context) {
    /*Http request*/
    Future<dynamic> future = _postutalte();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        LaborappToasts().getDoneApplyToast(context);
        Navigator.pop(context);
      } else {
        print(responseF);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    this.index = singletonOffersInstance.index;
    var space = Padding(
      padding: EdgeInsets.all(7),
    );

    String needs = "solicita " +
        singletonOffersInstance.workersNedeed.toString() +
        " trabajadores en:";
    String specialty = singletonOffersInstance.subSpecialty.toLowerCase() +
        ", " +
        singletonOffersInstance.specialty.toLowerCase();

    var myDecoration = BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
        top: BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
      ),
    );
    var builderData = new Container(
      width: MediaQuery.of(context).size.height * 0.4,
      height: MediaQuery.of(context).size.height * 0.07,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            singletonOffersInstance.city,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          Text(
            singletonOffersInstance.employeeName,
            style: TextStyle(fontSize: 12, color: Colors.black),
          )
        ],
      ),
    );

    var appBar = PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
      child: AppBar(
        backgroundColor: Color(ColorPalette.strongGeryApp),
        title: Align(
          alignment: Alignment.center,
          child: Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Image.asset(
                'assets/common/LogoHeader.png',
              )),
        ),
      ),
    );
    var inicials = new Container(
      width: MediaQuery.of(context).size.height * 0.2,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: new BoxDecoration(
        color: Color(ColorPalette.mediumGrayApp),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          getInicials(singletonOffersInstance.companyName),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 72, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );

    var theCompany = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("La empresa ",
            style: TextStyle(fontSize: 16, color: Colors.black)),
        Text(singletonOffersInstance.companyName,
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w900))
      ],
    );

    var need = Text(needs, style: TextStyle(fontSize: 16, color: Colors.black));

    var special = Text(specialty,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontStyle: FontStyle.italic));

    var documentation = Container(
      decoration: myDecoration,
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Documentacion basica completa",
            style: TextStyle(fontSize: 18),
          ),
          Padding(padding: EdgeInsets.all(6)),
          Text("CERTIFICADO CURSO DE ALTURA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Padding(padding: EdgeInsets.all(2)),
          Text("FOTOCOPIA DE LA CEDULA",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
        ],
      ),
    );

    var where = Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              singletonOffersInstance.city +
                  ", " +
                  singletonOffersInstance.localidad,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text("En la fecha", style: TextStyle(fontSize: 16)),
            Text(
                singletonOffersInstance.date +
                    " " +
                    singletonOffersInstance.hour,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
          ],
        ));
    var editButton = Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.05,
      child: FlatButton(
        child: Text("POSTULARME"),
        color: Color(ColorPalette.strongGeryApp),
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () {
          print("POSTULADO");
          postulateToOffert(context);
        },
      ),
    );
    var sendOffer = Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.05,
      child: FlatButton(
        child: Text("SEGUIR VIENDO OFERTAS"),
        color: Color(ColorPalette.yellowApp),
        textColor: Color(ColorPalette.strongGeryApp),
        shape: StadiumBorder(),
        onPressed: () {
          //goToPostulates(context);
          print("Viendo ofertas");
        },
      ),
    );
    var startScreen = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
            child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                  child: Image.asset(
                'images/LogoFondopantallgris.png',
                //width: double.infinity,
                //height: double.infinity,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  space,
                  inicials,
                  space,
                  builderData,
                  theCompany,
                  need,
                  special,
                  space,
                  documentation,
                  where,
                  editButton,
                  Padding(padding: EdgeInsets.all(3)),
                  sendOffer
                ],
              )
            ],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (0.835),
        )),
      ),
    );

    return startScreen;
  }
}
