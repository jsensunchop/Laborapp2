import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappToast.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/const/TextConstants.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';
import '../EndSignUp/bienvenidoTolken.dart';
import '../signUp/FormCard.dart';
import '../EndSignUp/main3.dart';
import 'package:http/http.dart' as http;

class main1 extends StatefulWidget {
  @override
  _main1State createState() => _main1State();
}

class _main1State extends State<main1> {
  var singletonWorkerInstance = SingletonWorker();
  var responseF;
  var status;

  bool validateData() {
    if (singletonWorkerInstance.pss == " " ||
        singletonWorkerInstance.pss == null ||
        singletonWorkerInstance.IdNumber == " " ||
        singletonWorkerInstance.IdNumber == null) {
      LaborappToasts().getFieldErrorToast(context);
      print("Algo mal");
      return false;
    }
    return true;
  }

  _SignIn() async {
    var singletonWorkerInstance = SingletonWorker();
    String url = Ips.Sign + "/singInWorker";
    var body = {
      "documentNumber": singletonWorkerInstance.IdNumber.toString(),
      "password": singletonWorkerInstance.pss,
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

  void continueWorkerRute(BuildContext context) {
    if (!validateData()) return;

    print("Maing request");
    Future<dynamic> future = _SignIn();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        Map lastData = json.decode(responseF);
        singletonWorkerInstance.name = lastData['User']['name'];
        singletonWorkerInstance.IdType = lastData['User']['documentType'];
        singletonWorkerInstance.IdNumber = lastData['User']['documentNumber'];
        singletonWorkerInstance.CelNumber =
            lastData['User']['cellphone'].toString();
        singletonWorkerInstance.Specialty = lastData['User']['specialty'];
        singletonWorkerInstance.SubSpecialty = lastData['User']['subSpecialty'];
        singletonWorkerInstance.Calification = lastData['User']['calification'];
        singletonWorkerInstance.appCode = lastData['User']['appCode'];
        singletonWorkerInstance.pss = null;
        if (singletonWorkerInstance.Specialty == TextConstants.UNDEFINED) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => main2()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home1()));
        }
      } else {
        print("XDXDDXD");
        print("ALGO");
        LaborappToasts().getCredentialErrorToast(context);
        print(responseF);
      }
    });
    //Navigator.push(context, MaterialPageRoute(builder: (context) => main2()));
  }

  void goToWelcome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  void goToSignUp(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpOne()));
  }

  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
      width: 16.0,
      height: 16.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black)),
      child: isSelected
          ? Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black))
          : Container());

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    //print("Login Screen");
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1200, allowFontScaling: true);

    var signUpButton = InkWell(
      child: Container(
        width: getFullScreenWidth(context) * 0.4,
        height: getHeightWithoutSafeAreaAppBar(context) * 0.08,
        decoration: BoxDecoration(
            color: Color(ColorPalette.strongGeryApp),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              goToSignUp(context);
            },
            child: Center(
              child: Text("REGÍSTRESE",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      letterSpacing: 1.0)),
            ),
          ),
        ),
      ),
    );

    var logInButton = InkWell(
      child: Container(
        width: getFullScreenWidth(context) * 0.4,
        height: getHeightWithoutSafeAreaAppBar(context) * 0.08,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              continueWorkerRute(context);
            },
            child: Center(
              child: Text("ENTRAR",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins-Bold",
                      fontSize: 18,
                      letterSpacing: 1.0)),
            ),
          ),
        ),
      ),
    );

    return WillPopScope(
        onWillPop: null,
        child: new Scaffold(
          appBar: LaborAppBar().build(context),
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: false,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                  child: Image.asset(
                'images/1.png',
                //width: double.infinity,
                //height: double.infinity,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              )),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height:
                              getHeightWithoutSafeAreaAppBar(context) * 0.01),
                      FormCard(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              showPopup(context, _popupBody(), 'Popup Demo');
                            },
                            child: Text(
                              "Olvidó su clave?",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: "Poppins-Bold"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                          height:
                              getHeightWithoutSafeAreaAppBar(context) * 0.01),
                      /*
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: _radio,
                                child: radioButton(_isSelected),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text("Recordar mis Datos",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Poppins-Medium"))
                            ],
                          ),
                        ],
                      ),

                       */
                      SizedBox(
                        height: getHeightWithoutSafeAreaAppBar(context) * 0.03,
                      ),
                      logInButton,
                      SizedBox(
                          height:
                              getHeightWithoutSafeAreaAppBar(context) * 0.04),
                      SizedBox(
                          height:
                              getHeightWithoutSafeAreaAppBar(context) * 0.02),
                      signUpButton,
                    ],
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black54,
            label: Text("¿Necesita\n   ayuda?"),
          ),
        ));
  }

  //SHOW POPUP
  showPopup(BuildContext context, Widget widget, String title,
      {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 20,
        left: 20,
        right: 20,
        bottom: 30,
        child: PopupContent(
          content: Scaffold(
            body: widget,
          ),
        ),
      ),
    );
  }

  Widget _popupBody() {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(200),
                  ),
                  Text(
                      "SE ENVIÓ UN MENSAJE\nDE TEXTO CON UN CÓDIGO\nPARA RESTAURAR\nLA CONTRASEÑA",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Robotto",
                          fontSize: ScreenUtil.getInstance().setSp(46),
                          letterSpacing: .6,
                          color: Colors.black)),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(100),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          //borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                        hintText: "Codigo de verificación",
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 1.0,
                            fontFamily: "Robotto")),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(100),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: ScreenUtil.getInstance().setWidth(330),
                      height: ScreenUtil.getInstance().setHeight(100),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => main3()));
                          },
                          child: Center(
                            child: Text("INGRESAR",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
