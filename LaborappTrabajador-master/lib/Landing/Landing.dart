import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/SignUp/signUpScreen.dart';
import 'package:laborapp_trabajador/Profile/ProfileLanding.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'landingFields.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    //print("Login Screen");
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: LaborAppBar().build(context),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 30.0),
              child: Column(
                children: <Widget>[
                  landingFields(),
                  SizedBox(
                      height: getHeightWithoutSafeAreaAppBar(context) * 0.03),
                  LaboraapButtons().NormalButton(
                      inText: "REGISTRESE",
                      colorCode: ColorPalette.yellowApp,
                      buttonFunction: () {
                        print("XD");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => signUpScreen()));
                      },
                      context: context),
                  SizedBox(
                    height: getHeightWithoutSafeArea(context) * 0.1,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black54,
        label: Text("¿Necesita\n   ayuda?"),
      ),
    );
  }
}
