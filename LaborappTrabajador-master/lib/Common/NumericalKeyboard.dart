import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/NumericalKeyBoardElements/NumericalKeyboardEmelents.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class NumericalKeyboard {
  var keyboardElements = NumericalKeyboardElement();
  double _borderWith = 1.0;

  createButton(BuildContext context, int colorCode, String buttonText,
      Function buttonFunction(String k2)) {
    return keyboardElements.KeyboardButton(
        colorCode: colorCode,
        buttonFunction: () {
          buttonFunction(buttonText);
        },
        buttonText: buttonText);
  }

  createRow(
      BuildContext context, int colorCode, Function buttonFunction(String k)) {
    List<Widget> xd = List<Widget>();
    List<Border> borders = [
      keyboardElements.rightCotainerBorder(colorCode),
      keyboardElements.midCotainerBorder(colorCode),
      keyboardElements.leftCotainerBorder(colorCode)
    ];
    int currentBorder = 1;
    for (int i = 0; i < 10; i++) {
      var border = borders[currentBorder];
      xd.add(keyboardElements.NumericalContainer(
          context: context,
          colorCode: colorCode,
          containerButton: createButton(context, colorCode, i.toString(),
              (String k1) => buttonFunction(k1)),
          containerBorder: border));
      currentBorder++;
      if (currentBorder == 3 || i == 0) {
        currentBorder = 0;
      }
    }
    return xd;
  }

  Widget LaboraapNumericalKeyboard(
      {BuildContext context,
      int colorCode,
      Color backgroundcolor,
      Function buttonFunction(String k),
      Function deleteFunction,
      Function goOut}) {
    List<Widget> numbers =
        createRow(context, colorCode, (String k) => buttonFunction(k));
    if(backgroundcolor == null){
      backgroundcolor = Colors.transparent;
    }

    return Container(
        color: backgroundcolor,
        width: getFullScreenWidth(context) * 0.8,
        height: getHeightWithoutSafeArea(context) * 0.4,
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
                  width: getFullScreenWidth(context) * 0.2,
                  height: getHeightWithoutSafeArea(context) * 0.07,
                  decoration: new BoxDecoration(
                    //color: Colors.grey,
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: _borderWith,
                        ),
                        right: BorderSide(
                          color: Colors.grey,
                          width: _borderWith,
                        )),
                  ),
                  child: FlatButton(
                    color: Colors.transparent,
                    textColor: Color(colorCode),
                    onPressed: () => goOut(),
                    child: AutoSizeText("SALIR",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w800),
                        maxLines: 1),
                  ),
                ),
                numbers[0],
                Container(
                  width: getFullScreenWidth(context) * 0.2,
                  height: getHeightWithoutSafeArea(context) * 0.07,
                  decoration: new BoxDecoration(
                    //color: Colors.grey,
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: _borderWith,
                        ),
                        left: BorderSide(
                          color: Colors.grey,
                          width: _borderWith,
                        )),
                  ),
                  child: FlatButton(
                    color: Colors.transparent,
                    textColor: Color(colorCode),
                    onPressed: () => deleteFunction(),
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
