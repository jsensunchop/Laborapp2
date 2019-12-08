import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.only(
                      top:30,
                    ),
                    decoration: BoxDecoration(


                    ),
                  )

                ],
              ),
            ),
          ),
          Text("Contratos activos",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Text("Ofertas Postuladas",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Text("Matchs",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Text("Ofertas Guardadas",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          Text("Que es LABOR APP",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          SizedBox(height: 10),
          SizedBox(height: 10),
          Text("Terminos y Condiciones",
              style: TextStyle(color: Colors.white, fontSize: 22)),


          InkWell(

            onTap: () {
            },
            child: Text("Contratos activos", style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
          SizedBox(height: 10),
          InkWell(

            onTap: () {
            },
            child: Text("Ofertas Postuladas", style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
          SizedBox(height: 10),
          InkWell(

            onTap: () {
            },
            child: Text("Matchs", style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
          SizedBox(height: 10),
          InkWell(

            onTap: () {
            },
            child: Text("Ofertas Guardadas", style: TextStyle(color: Colors.white, fontSize: 22)),
          ),

          SizedBox(height: 10),
          InkWell(

            onTap: () {
            },
            child: Text("Que es LABOR APP", style: TextStyle(color: Colors.white, fontSize: 22)),
          ),

          SizedBox(height: 10),
          SizedBox(height: 10),
          InkWell(

            onTap: () {
            },
            child: Text("Terminos y Condiciones", style: TextStyle(color: Colors.white, fontSize: 22)),
          ),
        ],
      )
    );
  }
}










/*
            child: Column(
              children: <Widget>[
                DrawerHeader(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,),
                    child: Column(
                        children: <Widget>[
                          Container(
                            width: 100,
                            margin: EdgeInsets.only(
                              top:30,
                            ),
                          child: Center(
                            child: Image.asset('assets/common/LogoHeader.png',
                                //width: double.infinity,
                                //height: double.infinity,
                                height: 50.0 * _animation.value,
                                width: 80.0 * _animation.value),
                          ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              SizedBox(height: 40),
                              inicials2,
                              bigSpace,
                              builderData2
                            ],
                          ),
                      ],

                  ),
                ),


              ],
            )
                */