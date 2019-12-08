import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/OffersDisplay/LookUpActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonActiveOffers.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Util/Offert.dart';
import 'package:laborapp_trabajador/Web/Ips.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonBuilder.dart';
import '../Util/UtilMethods.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'Camera.dart';
import 'Drawer.dart';

final Color backgroundColor = Color(0xFFF);

class home1 extends StatelessWidget {
  // This widget is the root of your application.

  Future<bool> _onBackPressed() {
    return new Future(() => false);
    //return Navigator.push(
    //    context, MaterialPageRoute(builder: (context) => SignUpTwo()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child:  home1Page(),

    );
  }
}

class home1Page extends StatefulWidget {
  home1Page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _home1PageState createState() => _home1PageState();
}

void goToCamera(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ImageCapture()));
}

class _home1PageState extends State<home1Page> with TickerProviderStateMixin {
  var singletonBuilderInstance = SingletonBuilder();

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  var singletonWorkerInstance = SingletonWorker();
  var singletonActiveOffers = SingletonActiveOffers();
  var status, responseF;

  final Duration duration = const Duration(milliseconds: 300);

  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  Animation<double> _animation;
  AnimationController _animationController;

  /////////////////////
  _getActiveOffers() async {
    String url = Ips.Match + "/getAllOffers";
    var body = {
      "documentNumber": singletonWorkerInstance.IdNumber.toString(),
    };
    try {

      Uri uri = Uri.parse(url);
      uri.replace(queryParameters: body);

      http.Response response = await http.get(url);
      status = response.statusCode;
      responseF = response.body;
      return status;
    } catch (e) {
      print(e);
      return 500;
    }
  }

  File imageFile;


  Widget _decideImageView(){
    if(imageFile==null){
      return Text("No Image Selected!");
    } else {
      Image.file(imageFile, width: 400, height: 400);
    }
  }

  //ShowActiveOffers
  void goToShowActiveOffers(BuildContext context) {
    /*Http request*/
    Future<dynamic> future = _getActiveOffers();
    future.then((status) {
      print(status);
      if (status >= 200 && status < 300) {
        print("Acabe");
        Map lastData = json.decode(responseF);
        List<dynamic> currentActiveOffers = lastData['offers'];
        print(currentActiveOffers);
        singletonActiveOffers.activeOfferts.clear();
        for (int i = 0; i < currentActiveOffers.length; i++) {
          var currentOffert = Offert(
            currentActiveOffers[i]['currentWorkers'],
            currentActiveOffers[i]['city'],
            currentActiveOffers[i]['cityDep'],
            currentActiveOffers[i]['direction'],
            currentActiveOffers[i]['offerDate'],
            currentActiveOffers[i]['offerHour'],
            currentActiveOffers[i]['workersNeeded'],
            currentActiveOffers[i]['specialty'],
            currentActiveOffers[i]['subSpecialty'],
            i,
            currentActiveOffers[i]['offerID'],
            currentActiveOffers[i]['companyName'],
            currentActiveOffers[i]['employeeName'],
          );

          if (currentOffert == null) {
            print("null" + i.toString());
          } else {
            singletonActiveOffers.activeOfferts.add(currentOffert);
          }
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LookUpActiveOffers()));
      } else {
        print(responseF);
      }
    });
  }

  /////////////////////

  bool pressAttention = false;
  String statusString = "No Disponible";
  int _currentIndex = 0;
  List<Widget> containers = [];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);

    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);

    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
            2)); //specify the duration for the animation & include `this` for the vsyc
    _animation = Tween<double>(begin: 1.0, end: 3.5).animate(
        _animationController); //use Tween animation here, to animate between the values of 1.0 & 2.5.

    _animation.addListener(() {
      //here, a listener that rebuilds our widget tree when animation.value chnages
      setState(() {});
    });

    _animation.addStatusListener((status) {
      //AnimationStatus gives the current status of our animation, we want to go back to its previous state after completing its animation
      if (status == AnimationStatus.completed) {
        _animationController
            .reverse(); //reverse the animation back here if its completed
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    double height = util.getHeightWithoutSafeArea(context);

    var inicials = new Container(
      width: MediaQuery.of(context).size.height * 0.2,
      height: height * 0.2,
      decoration: new BoxDecoration(
        color: Color(ColorPalette.mediumGrayApp),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          util.getInicials(singletonWorkerInstance.name),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 72, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );

    var inicials1 = new Container(
      width: MediaQuery.of(context).size.height * 0.1,
      height: height * 0.1,
      decoration: new BoxDecoration(
        color: Color(ColorPalette.mediumGrayApp),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          util.getInicials(singletonWorkerInstance.name),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );

    var inicials2 = new Container(
      width: MediaQuery.of(context).size.height * 0.1,
      height: height * 0.1,
      decoration: new BoxDecoration(
        color: Color(ColorPalette.mediumGrayApp),
        shape: BoxShape.circle,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          util.getInicials(singletonWorkerInstance.name),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
    );

    var space = Padding(
      padding: EdgeInsets.all(2),
    );
    var bigSpace = Padding(
      padding: EdgeInsets.all(7),
    );

    var checkOffers = Container(
      height: util.getHeightWithoutSafeArea(context) * 0.07,
      width: util.getFullScreenWidth(context) * 0.8,
      child: FlatButton.icon(
        color: Colors.black,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)),
        label: Text("VER OFERTAS",
            style: TextStyle(
                color: Color(ColorPalette.yellowApp),
                fontWeight: FontWeight.w900,
                fontSize: 18)),
        onPressed: () {
          goToShowActiveOffers(context);
        },
        icon: Icon(Icons.alarm_on),
      ),
    );

    var profileFiels = Container(
      height: util.getHeightWithoutSafeArea(context) * 0.07,
      width: util.getFullScreenWidth(context) * 0.8,
      child: FlatButton.icon(
        color: Colors.black,
        shape: Border.all(width: 0.5, color: Color(ColorPalette.softGrayApp)),
        label: Text("VER OFERTAS",
            style: TextStyle(
                color: Color(ColorPalette.yellowApp),
                fontWeight: FontWeight.w900,
                fontSize: 18)),
        onPressed: () {
          // goToShowActiveOffers(context);
        },
        icon: Icon(Icons.alarm_on),
      ),
    );
//watch
    var rating = RatingBar(
      initialRating: 5,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      itemSize: height * 0.04,
    );

    var editProfile1 = GestureDetector(
      onTap: () {
        print("Editing");
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Editar perfil",
            style:
            TextStyle(fontSize: 12, color: Color(ColorPalette.softGrayApp)),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Icon(Icons.edit, color: Colors.white, size: 15),
          )
        ],
      ),
    );

    var statusButton = Container(
      width: util.getFullScreenWidth(context) * 0.5,
      height: util.getHeightWithoutSafeArea(context) * 0.1,
      child: RaisedButton(
        child: new Text(statusString),
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: pressAttention ? Colors.red : Colors.lightGreen,
        onPressed: () {
          setState(() {
            if (pressAttention) {
              statusString = "Disponible";
            } else {
              statusString = "No Disponible";
            }

            pressAttention = !pressAttention;
          });
        },
      ),
    );

    var builderData = new Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            singletonWorkerInstance.name,
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          space,
          Row(
            children: <Widget>[
              Text(
                "Ciudad: Bogota",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color(ColorPalette.mediumGrayApp)),
              ),
            ],
          ),
          space,
          rating,
          space,
        ],
      ),
    );
    var builderData2 = new Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            singletonWorkerInstance.name,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Ciudad: ",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(ColorPalette.softGrayApp)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Text(
                "Editar perfil",
                style:
                TextStyle(fontSize: 12, color: Color(ColorPalette.softGrayApp)),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Icon(Icons.edit, color: Colors.white, size: 15),
              )
              ],
              ),
            ],
          ),

        ],
      ),
    );


    var fields = new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(700),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Localidad",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(10),
            ),
            Text("Cedula",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(10),
            ),
            Text("Número de Celular",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(10),
            ),
            Text("Especialidad",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),

            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),

            Text("Sube tus documentos",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            RaisedButton(onPressed: (){
              //_showChoiceDialog(context);
              goToCamera(context);

            },child: Text("Selecciona una imagen!"),),
            _decideImageView(),
          ],
        ),
      ),
    );

    var builderData1 = new Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: height * 0.13,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          space,
          Text(
            singletonWorkerInstance.name,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          /*
          space,

          Text(
            singletonBuilderInstance.getEmployeeName(),
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          */
          space,
          rating,
          space,
        ],
      ),
    );
/*
    Widget menu(context) {
      return SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      bigSpace,
                      bigSpace,
                      inicials2,
                      bigSpace,
                      builderData2
                    ],
                  ),
                  //////////////// NO SE ////////////

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

////FIN DEL NO SE
                ],
              ),
            ),
          ),
        ),
      );
    }

 */

    Widget dashboard(context) {
      return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        left: isCollapsed ? 0 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.2 * screenWidth,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            animationDuration: duration,
            elevation: 8,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          child: Icon(Icons.menu, color: Colors.black),
                          onTap: () {
                            setState(() {
                              if (isCollapsed)
                                _controller.forward();
                              else
                                _controller.reverse();

                              isCollapsed = !isCollapsed;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return WillPopScope(
      onWillPop:null,
      child: new Scaffold(
        backgroundColor: Colors.black87,
        appBar: LaborAppBar().build(context),
        drawer: Drawer(
            child: Column(

              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black87
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 250,
                          height: 100,
                      child: Center(
                        child: Image.asset('assets/common/LogoHeader.png',
                            //width: double.infinity,
                            //height: double.infinity,
                            height: 50.0 * _animation.value,
                            width: 80.0 * _animation.value),
                      ),
                        ),
                        Row(
                          children: <Widget>[
                            inicials2,
                            bigSpace,
                            builderData2,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  //alignment: Alignment(-0.5, 0.0),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.blueGrey))
                  ),
                  child: InkWell(

                    onTap: () {
                    },
                    child: Text("    Mis Ofertas                     ", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800)),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(

                  onTap: () {
                  },
                  child: Text("Contratos activos           ", style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                SizedBox(height: 10),
                InkWell(

                  onTap: () {
                  },
                  child: Text("Ofertas Postuladas         ", style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                SizedBox(height: 10),
                InkWell(

                  onTap: () {
                  },
                  child: Text("Matchs                              ", style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
                SizedBox(height: 10),
                InkWell(

                  onTap: () {
                  },
                  child: Text("Ofertas Guardadas          ", style: TextStyle(color: Colors.black, fontSize: 18)),
                ),

                SizedBox(height: 50),

                Container(

                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.blueGrey))
                  ),
                  child: InkWell(

                    onTap: () {
                    },
                    child: Text("    Ayuda y TYC                    ", style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800)),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(

                  onTap: () {
                  },
                  child: Text("Que es LABOR-APP?       ", style: TextStyle(color: Colors.black, fontSize: 18)),
                ),

                SizedBox(height: 10),
                SizedBox(height: 10),
                InkWell(

                  onTap: () {
                  },
                  child: Text("Terminos y Condiciones", style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ],
            )
        ),

        body: TabBarView(
          //backgroundColor: Colors.black,

          controller: _tabController,
          children: containers = [
            //Container de Inicio
            /////////////////////
            /////////////////////
            Stack(
              children: <Widget>[

                Container(
                  color: Colors.white,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          child: Image.asset(
                            'assets/registo_obrero/workerSignIn/logoScreen.png',
                            //width: double.infinity,
                            //height: double.infinity,
                            width: MediaQuery.of(context).size.width,
                            height: height,
                            fit: BoxFit.cover,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 100),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              space,
                              inicials,
                              bigSpace,
                              builderData
                            ],
                          ),
                          bigSpace,
                          bigSpace,
                          Container(
                            child: Column(
                              children: <Widget>[
                                space,
                                checkOffers,
                                SizedBox(
                                  height: util.getHeightWithoutSafeArea(
                                      context) *
                                      0.02,
                                ),
                                Container(
                                  height: 1,

                                ),
                                bigSpace,
                                Text("ACTIVATE PARA TOMAR OFERTAS",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Poppins-Medium",
                                        fontWeight: FontWeight.bold)),
                                bigSpace,
                                statusButton,
                                bigSpace,
                                Container(
                                  height: 1,

                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: height * (1 - 0.2),
                ),
                //drawer: MainDrawer(),
                //menu(context),
                //dashboard(context),
              ],
            ),

            //Container de Perfil
            //////////////////////////
            //////////////////////////////
            Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                      child: Image.asset(
                        'images/1.png',
                        //width: double.infinity,
                        //height: double.infinity,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      )),
                  SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(20)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[inicials1, bigSpace, builderData1],
                          ),
                          bigSpace,
                          fields,

                        ],
                      )),
                ],
              ),
            ),
            //width: MediaQuery.of(context).size.width,
            //height: height * (1 - 0.2),

            //Container de ofertas
            //////////////////////
            Stack(
              children: <Widget>[


              ],
            ),
          ],
        ),
        bottomNavigationBar: new Container(
          //selectedItemColor: Colors.amber,

          child: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.amber,
            currentIndex: _currentIndex,
            onTap: (currentIndex) {
              setState(() {
                _currentIndex = currentIndex;
                switch (_currentIndex) {
                  case 2:
                    goToShowActiveOffers(context);
                    break;
                }
              });

              _tabController.animateTo(_currentIndex);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  title: Text("Inicio"),
                  icon: Icon(Icons.home),
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  title: Text("Perfil"),
                  icon: Icon(Icons.account_circle),
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  title: Text("Ofertas"),
                  icon: Icon(Icons.mail),
                  backgroundColor: Colors.black),


            ],

          ),
        ),
      ),
    );
  }
}
