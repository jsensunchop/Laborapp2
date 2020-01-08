import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';

class NumericalTest extends StatefulWidget {
  @override
  _NumericalTestState createState() => _NumericalTestState();
}

class _NumericalTestState extends State<NumericalTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 500,
          height: getHeightWithoutSafeArea(context) * 0.4,
        ),
        Container(
            color: Colors.white,
            width: 500,
            height: getHeightWithoutSafeArea(context) * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
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
                        child: Text("1",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    ),
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
                        ),
                      ),
                      child: FlatButton(
                        color: Colors.transparent,
                        textColor: Colors.grey,
                        onPressed: () => print(""),
                        child: Text("2",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    ),
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
                        child: Text("3",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    )
                  ],
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
                        child: Text("4",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    ),
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
                        ),
                      ),
                      child: FlatButton(
                        color: Colors.transparent,
                        textColor: Colors.grey,
                        onPressed: () => print(""),
                        child: Text("5",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    ),
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
                        child: Text("6",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    )
                  ],
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
                        child: Text("7",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    ),
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
                        ),
                      ),
                      child: FlatButton(
                        color: Colors.transparent,
                        textColor: Colors.grey,
                        onPressed: () => print(""),
                        child: Text("8",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    ),
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
                        child: Text("9",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    )
                  ],
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
                        ),
                      ),
                      child: FlatButton(
                        color: Colors.transparent,
                        textColor: Colors.grey,
                        onPressed: () => print(""),
                        child: Text("0",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800)),
                      ),
                    ),
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
                        child: Icon(Icons.backspace,size: 42.0,),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                )
              ],
            ))
      ],
    );
  }
}
