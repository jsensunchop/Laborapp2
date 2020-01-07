import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import '../pinPut/pin_put_state.dart';

class FormCard extends StatefulWidget {
  FormCard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FormCardState createState() => new _FormCardState();
}

class _FormCardState extends State<FormCard> {
  List<TextEditingController> controllers = <TextEditingController>[
    new TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    var singletonWorkerInstance = SingletonWorker();
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
              onChanged: (text) {
                singletonWorkerInstance.IdNumber = int.parse(text);
              },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pinBoxs(50.0, controllers, Colors.white, Colors.amber,
                  context, false),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Center(
                child: new Text("Contraseña",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26)))),
          ],
        ),
      ),
    );
  }
}
