import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/PinBox.dart';
import 'package:laborapp_trabajador/Password/PasswordScreen.dart';
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
  var _singletonWorker = SingletonWorker();
  Duration _animationDuration = Duration(milliseconds: 500);

  List<Widget> _getBoxes() {
    List<Widget> boxes = new List<Widget>();
    for (int i = 0; i < 4; i++) {
      print(i);
      boxes.add(PinBox().getPinBox(
          context: context,
          animationDuration: _animationDuration,
          borderColor: ColorPalette.mediumGrayApp,
          textColor: Colors.transparent,backGroundColor: Color(ColorPalette.white)));
    }
    return boxes;
  }


  _goToPassword() {
    if (_singletonWorker.IdNumber != null) {
      print(_singletonWorker.IdNumber);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen()));
  }

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
      height: getHeightWithoutSafeArea(context) * 0.6,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
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
            SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.07),
            Center (
            child: new Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  top: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              width: getFullScreenWidth(context) * 0.82,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Número de documento",
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 25.0),
                ),
                onChanged: (text) {
                  _singletonWorker.IdNumber = int.parse(text);
                },
              ),
            ),
            ),
            SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.05),
            Center(
              child: GestureDetector(
                  onTap: () {
                    _goToPassword();
                  },
                  child: Container(
                    width: getFullScreenWidth(context) * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _getBoxes().sublist(0,4),
                    ),
                  )),
            ),
            SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.02),
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
