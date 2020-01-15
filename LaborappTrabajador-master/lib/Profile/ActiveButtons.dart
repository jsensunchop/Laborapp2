import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class ActiveButtons extends StatefulWidget {
  @override
  _ActiveButtonsState createState() => _ActiveButtonsState();
}

_getTouch(bool Option) {
  SingletonWorker().Active = Option;
}

class _ActiveButtonsState extends State<ActiveButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            width: getHeightWithoutSafeArea(context) * 0.17,
            height: getHeightWithoutSafeArea(context) * 0.17,
            child: new RawMaterialButton(
              fillColor: SingletonWorker().Active ? Colors.green : Colors.grey,
              shape: new CircleBorder(),
              elevation: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AutoSizeText(
                    "D",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 52,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  AutoSizeText(
                    "DISPONIBLE",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              onPressed: () {
                setState(() {
                  _getTouch(true);
                });
              },
              onLongPress: () => showOnPopUp(context),
            )),
        Container(
            width: getHeightWithoutSafeArea(context) * 0.17,
            height: getHeightWithoutSafeArea(context) * 0.17,
            child: new RawMaterialButton(
              fillColor: SingletonWorker().Active ? Colors.grey : Colors.red,
              shape: new CircleBorder(),
              elevation: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AutoSizeText(
                    "O",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 52,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  AutoSizeText(
                    "OCUPADO",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              onPressed: () {
                setState(() {
                  _getTouch(false);
                });
              },
              onLongPress: () => showOffPopUp(context),
            ))
      ],
    );
  }
}
