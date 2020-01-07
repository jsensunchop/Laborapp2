import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'Ocupacion.dart';
import 'home1.dart';
import 'package:fluttertoast/fluttertoast.dart';

class subespecialidad_estructura extends StatefulWidget {
  _subespecialidad_estructuraState createState() =>
      _subespecialidad_estructuraState();
}

class _subespecialidad_estructuraState extends State<subespecialidad_estructura>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 1, initialIndex: 0);
  }

  Future<bool> _onBackPressed() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => Ocupacion()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          appBar: AppBar(
            backgroundColor: Color(ColorPalette.strongGeryApp),
            title: Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/common/LogoHeader.png'),
            ),
          ),
          body: TabBarView(
            controller: controller,
            children: <Widget>[
              HomePage(),
            ],
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
  void _showToast(BuildContext context){
    Fluttertoast.showToast(msg: "Dependiendo de tu localidad te\n"
        "apareceran trabajos en orden de\n"
        "cercania a tu ubicación",

      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.black38,
      textColor: Colors.white,
    );
  }

   */
  void continueWorkerRute(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => home1()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: ScreenUtil.getInstance().setHeight(260),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                /*
                Row(
                  children: <Widget>[
                    Image.asset("images/logo1.png"),
                    SizedBox(
                      width: ScreenUtil.getInstance().setWidth(200),
                    ),
                    FloatingActionButton(

                      onPressed: () => _showToast(context),
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black54,
                      child: Icon(Icons.info_outline),
                    ),
                  ],
                ),

                 */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("ELIJA LA SUBESPECIALIDAD",
                        style: TextStyle(
                            fontFamily: "Robotto",
                            fontSize: ScreenUtil.getInstance().setSp(38),
                            letterSpacing: .6,
                            color: Colors.black))
                  ],
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: Text("Oficial"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Media Cuchara"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Ayudante"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            continueWorkerRute(context);
          },
        ),
        ListTile(
          title: Text("Latero"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            continueWorkerRute(context);
          },
        ),
      ],
    );
  }
}
