import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';

class localizationScreenDescription extends StatefulWidget {
  @override
  _localizationScreenDescriptionState createState() =>
      _localizationScreenDescriptionState();
}

class _localizationScreenDescriptionState
    extends State<localizationScreenDescription> {
  String _dropdownValue = 'Bogot\u00e1';
  var singletonWorkerInstance = SingletonWorker();

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
                Text(" ELIJA LA CIUDAD Y LOCALIDAD\n            EN LA QUE VIVE",
                    style: TextStyle(
                        fontFamily: "Robotto",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: .6,
                        color: Colors.black)),
                SizedBox(
                    height: getHeightWithoutSafeAreaAppBar(context) * 0.02),
                Theme(
                  data: Theme.of(context).copyWith(canvasColor: Colors.white),
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.amber,
                      size: 15,
                    ),
                    value: _dropdownValue,
                    underline: Container(
                        color: Color(ColorPalette.yellowApp), height: 1.0),
                    style: TextStyle(
                        color: Color(ColorPalette.strongGeryApp),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    onChanged: (String newValue) {
                      setState(() {
                        singletonWorkerInstance.City = newValue;
                        _dropdownValue = newValue;
                        print(_dropdownValue);
                      });
                    },
                    items: <String>[
                      'Bogot\u00e1',
                      'Amazonas',
                      'Antioquia',
                      'Arauca',
                      'Atl\u00e1ntico',
                      'Bol\u00edvar',
                      'Boyac\u00e1',
                      'Caldas',
                      'Caquet\u00e1',
                      'Casanare',
                      'Cauca',
                      'Cesar',
                      'Choc\u00f3',
                      'Cundinamarca',
                      'C\u00f3rdoba',
                      'Guain\u00eda',
                      'Guaviare',
                      'Huila',
                      'La Guajira',
                      'Magdalena',
                      'Meta',
                      "Nari\u00f1o",
                      'Norte de Santander',
                      'Putumayo',
                      'Quind\u00edo',
                      'Risaralda',
                      'San Andr\u00e9s y Providencia',
                      'Santander',
                      'Sucre',
                      'Tolima',
                      'Valle del Cauca',
                      'Vaup\u00e9s',
                      'Vichada'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: SizedBox(
                            height: getHeightWithoutSafeArea(context) * 0.04,
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
