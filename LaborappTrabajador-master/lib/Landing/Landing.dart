import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/SignUp/signUpScreen.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Web/SignUpHttp.dart';
import 'landingFields.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: LaborAppBar().build(context),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(children: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  landingFields(),
                  SizedBox(
                      height: getHeightWithoutSafeAreaAppBar(context) * 0.03),
                  LaboraapButtons().NormalButton(
                      inText: "REGISTRESE",
                      colorCode: ColorPalette.yellowApp,
                      buttonFunction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signUpScreen()));
                      },
                      context: context),
                  LaboraapButtons().NormalButton(
                    buttonFunction: (){

                    },
                    context: context,
                    inText: "test",
                    colorCode: ColorPalette.strongGeryApp
                  ),
                  /*SizedBox(
                    height: getHeightWithoutSafeArea(context) * 0.13,
                  ),*/

                  Row (
                      children: <Widget>[
                        SizedBox(
                          width: getFullScreenWidth(context) * 0.7,
                        ),
                        Row (
                          children: <Widget>[
                            SizedBox.fromSize(
                              size: Size(80, 80), // button width and height
                              child: ClipOval(
                                child: Material(
                                  color: Colors.amber, // button color
                                  child: InkWell(
                                    splashColor: Colors.green, // splash color
                                    onTap: () {}, // button pressed
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[ // icon
                                        Text("¿Necesita\n   ayuda?"), // text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),

    );
  }
}
