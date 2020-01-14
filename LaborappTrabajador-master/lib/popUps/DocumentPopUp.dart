import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaborappButtons.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class DocumentPopUp extends StatefulWidget {
  @override
  _DocumentPopUpState createState() => _DocumentPopUpState();
}

class _DocumentPopUpState extends State<DocumentPopUp> {
  double commonRadius = 20.0;
  String _dropdownValue = 'CEDULA';
  String _expeditionDate = '';

  _sendExpeditionDate() {
    print("Aqui peticion http");
    print(_expeditionDate);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var space = SizedBox(
      height: getFullScreenHeight(context) * 0.04,
    );
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadius)),
      child: Container(
        height: getHeightWithoutSafeArea(context) * 0.7,
        width: getFullScreenWidth(context),
        padding: EdgeInsets.all(commonRadius),
        decoration: BoxDecoration(
            color: Color(ColorPalette.yellowApp),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(commonRadius),
                topRight: Radius.circular(commonRadius)),
            boxShadow: [
              BoxShadow(
                  color: Color(ColorPalette.mediumGrayApp),
                  offset: const Offset(20.0, 15.0),
                  blurRadius: 5.0)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: Colors.white),
              child: DropdownButton<String>(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 42,
                ),
                value: _dropdownValue,
                underline: Container(
                    color: Color(ColorPalette.strongGeryApp), height: 2.0),
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
                  'CEDULA',
                  'CEDULA EXTRANJERIA',
                  'PASAPORTE',
                  'NIT'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: SizedBox(
                        height: getHeightWithoutSafeArea(context) * 0.05,
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
            space,
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  left: BorderSide(
                    color: Color(ColorPalette.softGrayApp),
                    width: 2.0,
                  ),
                  top: BorderSide(
                    color: Color(ColorPalette.softGrayApp),
                    width: 2.0,
                  ),
                ),
              ),
              width: getFullScreenWidth(context) * 0.6,
              child: TextField(
                textAlign: TextAlign.center,
                autocorrect: false,
                style: TextStyle(color: Color(ColorPalette.softGrayApp)),
                decoration: InputDecoration(
                    hintText: "fecha de expedición",
                    hintStyle: TextStyle(
                        color: Color(ColorPalette.softGrayApp), fontSize: 18.0),
                    border: InputBorder.none),
                onChanged: (String text) {
                  _expeditionDate = text;
                },
              ),
            ),
            space,
            LaboraapButtons().NormalButton(
                inText: "SUBIR",
                context: context,
                buttonFunction: () => _sendExpeditionDate(),
                colorCode: ColorPalette.strongGeryApp)
          ],
        ),
      ),
    );
  }
}
