import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';


class localizationScreenDescription extends StatefulWidget {
  @override
  _localizationScreenDescriptionState createState() => _localizationScreenDescriptionState();
}


class _localizationScreenDescriptionState extends State<localizationScreenDescription> {
  String dropdownValue = 'BOGOTA';
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
    singletonWorkerInstance.IdType = dropdownValue;
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    " ELIJA LA CIUDAD Y LOCALIDAD\n            EN LA QUE VIVE",
                    style: TextStyle(
                        fontFamily: "Robotto",
                        fontSize: 20.0,
                        letterSpacing: .6,
                        color: Colors.black)),
                DropdownButton<String>(
                  value: dropdownValue,
                  underline: Container(color: Colors.amber, height: 1.0),
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  onChanged: (String newValue) {
                    setState(() {
                      singletonWorkerInstance.IdType = newValue;
                      dropdownValue = newValue;
                      //print(dropdownValue);
                    });
                  },
                  items: <String>['BOGOTA', 'TUNJA', 'CIUDAD2', 'CIUDAD3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value));
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}