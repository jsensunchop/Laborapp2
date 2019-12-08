import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../signUp/contra.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import '../SignIn/main1.dart';


class main3 extends StatelessWidget {

  void continueWorkerRute(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => main1()));
  }

  Widget horizontalLine()=> Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance=ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance=ScreenUtil(width: 750, height: 1434, allowFontScaling: true);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(ColorPalette.strongGeryApp),
        title: Align(
          alignment: Alignment.centerRight,
          child: Image.asset('assets/common/LogoHeader.png'),
        ),
      ),

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
              padding: EdgeInsets.only(left: 28.0,right: 28.0,top: 30.0),

              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("CAMBIE SU CONTRASEÑA",
                          style: TextStyle(
                              fontFamily: "Poppins.Bold",
                              fontSize: ScreenUtil.getInstance().setSp(46),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))

                    ],

                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(130),
                  ),
                  contra(),

                  
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(60),
                  ),
                  InkWell(

                    child: Container(

                      width: ScreenUtil.getInstance().setWidth(330),
                      height: ScreenUtil.getInstance().setHeight(100),
                      decoration: BoxDecoration(
                          color: Colors.amber,

                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0
                            )
                          ]
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => main1()));
                          },
                          child: Center(
                            child: Text("INGRESAR", style: TextStyle(color: Colors.black,
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
          )
        ],
      ),
    );
  }
}