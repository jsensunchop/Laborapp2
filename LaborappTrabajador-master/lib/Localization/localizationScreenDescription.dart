import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';


class localizationScreenDescription extends StatefulWidget {
  @override
  _localizationScreenDescriptionState createState() => _localizationScreenDescriptionState();
}


class _localizationScreenDescriptionState extends State<localizationScreenDescription> {
  String _dropdownValue = 'BOGOTA';
  var singletonWorkerInstance = SingletonWorker();

  bool validateData() {
    if (singletonWorkerInstance.IdType == null ||
        singletonWorkerInstance.IdType == " " ||
        singletonWorkerInstance.IdNumber == 0 ||
        singletonWorkerInstance.IdNumber == null ||
        singletonWorkerInstance.name == " " ||
        singletonWorkerInstance.name == null ||
        singletonWorkerInstance.CelNumber == " " ||
        singletonWorkerInstance.CelNumber == null) {
      print("Algun dato esta mal");
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    " ELIJA LA CIUDAD Y LOCALIDAD\n            EN LA QUE VIVE",
                    style: TextStyle(
                        fontFamily: "Robotto",
                        fontSize: 20.0,
                        letterSpacing: .6,
                        color: Colors.black)),
                Theme(
                  data: Theme.of(context)
                      .copyWith(canvasColor: Colors.white),
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.amber,
                      size: 25,
                    ),
                    value: _dropdownValue,
                    underline: Container(
                        color: Color(ColorPalette.yellowApp), height: 2.0),
                    style: TextStyle(
                      color: Color(ColorPalette.strongGeryApp),
                      fontSize: 18.0,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _dropdownValue = newValue;
                        print(_dropdownValue);
                      });
                    },
                    items: <String>[
                      'BOGOTA',
                      'TUNJA',
                      'CIUDAD1',
                      'CIUDAD2'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: SizedBox(
                            height: getHeightWithoutSafeArea(context) * 0.02,
                            width: getFullScreenWidth(context) * 0.5,
                            child: AutoSizeText(
                              value,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                          ));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}