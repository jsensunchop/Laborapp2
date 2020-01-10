import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'landingFields.dart';

class main1 extends StatefulWidget {
  @override
  _main1State createState() => _main1State();
}

class _main1State extends State<main1> {
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
        ScreenUtil(width: 750, height: 1750, allowFontScaling: true);

    return Scaffold(
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
                  padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 30.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height:
                          getHeightWithoutSafeAreaAppBar(context) * 0.01),
                      landingFields(),

                      SizedBox( height: getHeightWithoutSafeAreaAppBar(context) * 0.01),
                      LaboraapButtons().NormalButton(
                          inText: "REGISTRESE",
                          colorCode: ColorPalette.yellowApp,
                          buttonFunction: () {
                          },
                          context: context),
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
        );
  }
}
