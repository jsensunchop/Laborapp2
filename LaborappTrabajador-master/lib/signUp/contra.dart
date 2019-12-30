import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pinPut/pin_put_state.dart';

class contra extends StatelessWidget{
  List<TextEditingController> controllers = <TextEditingController>[new TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];

  @override
  Widget build(BuildContext context){
    return new
    Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(400),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: new Text("CAMBIE SU CONTRASEÑA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins.Bold",
                        fontSize: ScreenUtil.getInstance().setSp(46),
                        letterSpacing: .6,
                        fontWeight: FontWeight.bold))),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pinBoxs(50.0, controllers, Colors.white, Colors.amber, context, false),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(60),
            ),
            Center(
                child: new Text("REPÍTALA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins.Bold",
                        fontSize: ScreenUtil.getInstance().setSp(46),
                        letterSpacing: .6,
                        fontWeight: FontWeight.bold))),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pinBoxs(50.0, controllers, Colors.white, Colors.amber, context, false),
            ),

          ],
        ),
      ),
    );
  }
}