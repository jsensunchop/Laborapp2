import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';

class landingFields extends StatefulWidget {
  landingFields({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _landingFieldsState createState() => new _landingFieldsState();
}

class _landingFieldsState extends State<landingFields> {
  List<TextEditingController> controllers = <TextEditingController>[
    new TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(450),
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
                child: new Text("BIENVENIDO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil.getInstance().setSp(80)))),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(90),
            ),
            /*
            Text("Documento de identidad",
                style: TextStyle(

                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            */
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Número de documento",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide(),
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 25.0),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Center(
                child: new Text("Contraseña",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26)))),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Contraseña",
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide: new BorderSide(),
                ),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 25.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
