import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/NumericalKeyBoardElements/NumericalKeyboardEmelents.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/signUp/contra.dart';

class NumericalKeyboard {
  var keyboardElements = NumericalKeyboardElement();

  createButton(BuildContext context, int colorCode, String buttonText) {
    return keyboardElements.KeyboardButton(
        colorCode: colorCode,
        buttonFunction: () {
          print("hola");
        },
        buttonText: buttonText);
  }

  createRow(BuildContext context, int colorCode) {
    List<Widget> xd = List<Widget>();
    List<Border> borders = [
      keyboardElements.rightCotainerBorder(),
      keyboardElements.midCotainerBorder(),
      keyboardElements.leftCotainerBorder()
    ];
    int currentBorder = 1;
    for (int i = 0; i < 10; i++) {
      var border = borders[currentBorder];
      xd.add(keyboardElements.NumericalContainer(
          context: context,
          colorCode: colorCode,
          containerButton: createButton(context, colorCode, i.toString()),
          containerBorder: border));
      currentBorder++;
      if (currentBorder == 3 || i == 0) {
        currentBorder = 0;
      }
    }
    return xd;
  }

  Widget LaboraapNumericalKeyboard({BuildContext context, int colorCode}) {
    List<Widget> numbers = createRow(context, colorCode);

    return Container(
        color: Colors.white,
        width: getFullScreenWidth(context),
        height: getHeightWithoutSafeArea(context) * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: numbers.sublist(1, 4),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Row(
              children: numbers.sublist(4, 7),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Row(
              children: numbers.sublist(7, 10),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: getFullScreenWidth(context) * 0.3,
                  height: getHeightWithoutSafeArea(context) * 0.1,
                  decoration: new BoxDecoration(
                    //color: Colors.grey,
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 3.0,
                        ),
                        right: BorderSide(
                          color: Colors.grey,
                          width: 3.0,
                        )),
                  ),
                  child: FlatButton(
                    color: Colors.transparent,
                    textColor: Colors.grey,
                    onPressed: () => print(""),
                    child: Text("SALIR",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w800)),
                  ),
                ),
                numbers[0],
                Container(
                  width: getFullScreenWidth(context) * 0.3,
                  height: getHeightWithoutSafeArea(context) * 0.1,
                  decoration: new BoxDecoration(
                    //color: Colors.grey,
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 3.0,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                          width: 3.0,
                        )),
                  ),
                  child: FlatButton(
                    color: Colors.transparent,
                    textColor: Colors.grey,
                    onPressed: () => print(""),
                    child: Icon(
                      Icons.backspace,
                      size: 42.0,
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
          ],
        ));
  }
}
