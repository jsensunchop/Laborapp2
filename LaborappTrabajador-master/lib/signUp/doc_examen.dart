import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../SignIn/main1.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonBuilder.dart';
import '../Util/UtilMethods.dart' as util;


class doc_examen extends StatefulWidget {
  @override
  _doc_examenState createState() => _doc_examenState();
}

class _doc_examenState extends State<doc_examen> {
  //var singletonBuilderInstance = SingletonBuilder();

  void continueWorkerRute(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute());
  }

  Widget horizontalLine()=> Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(120),
      height: 1.0,
      color: Colors.black26.withOpacity(.2),
    ),
  );


  Future<bool> _onBackPressed(){
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => main1()));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance=ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance=ScreenUtil(width: 750, height: 1434, allowFontScaling: true);
    double height = util.getHeightWithoutSafeArea(context);





    return WillPopScope(
      onWillPop: _onBackPressed,


      child: new Scaffold(
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
                padding: EdgeInsets.only(left: 18.0,right: 18.0,top: 60.0),

                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Image.asset(
                              'images/documentos icon.png',
                              //width: double.infinity,
                              //height: double.infinity,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover,
                            )),
                      ],

                    ),

                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(50),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 12.0,
                            ),

                            SizedBox(
                              width: 8.0,
                            ),
                            Text("    SUBE TU\N"
                                "EXAMEN MÉDICO",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Poppins-Medium"))
                          ],
                        ),

                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(40),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 12.0,
                            ),

                            SizedBox(
                              width: 8.0,
                            ),
                            Text("ULTIMO EXAMEN MÉDICO",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Poppins-Medium"))
                          ],
                        ),

                      ],
                    ),

                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(40),
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
                              //Navigator.push(context, new MaterialPageRoute(
                              //  builder: (context) =>
                              // new main4())
                              //);
                            },
                            child: Center(
                              child: Text("SUBIR FOTO", style: TextStyle(color: Colors.black,
                                  fontFamily: "Poppins-Bold",
                                  fontSize: 18,
                                  letterSpacing: 1.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(80),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
