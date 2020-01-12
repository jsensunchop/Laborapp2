import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Boxes/pin_put_state.dart';

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
      width: getFullScreenWidth(context),
      height: getHeightWithoutSafeArea(context)*0.45,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0),
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
                        fontSize: 39))),
            SizedBox(
                height: getHeightWithoutSafeAreaAppBar(context) * 0.07),
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
                height: getHeightWithoutSafeAreaAppBar(context) * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pinBoxs(
                  width: getHeightWithoutSafeArea(context) * 0.07,
                  height: getHeightWithoutSafeArea(context) * 0.07,
                  cons: controllers,
                  boxColor: Colors.white,
                  textColor:  Colors.amber,
                  context: context,
                  show: false ),
            ),
            SizedBox(
                height: getHeightWithoutSafeAreaAppBar(context) * 0.02),
            Center(
                child: new Text("Contraseña",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Poppins-Medium",
                        fontSize: 22))),
          ],
        ),
      ),
    );
  }
}
