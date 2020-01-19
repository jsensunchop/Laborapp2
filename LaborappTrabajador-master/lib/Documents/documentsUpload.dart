import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/Documents/cameraCA.dart';
import 'package:laborapp_trabajador/Documents/cameraCC.dart';
import 'package:laborapp_trabajador/Documents/cameraEM.dart';
import 'package:laborapp_trabajador/Documents/documentsUploadDescription.dart';
import 'package:laborapp_trabajador/Profile/ProfileLanding.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Landing/Landing.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';

class documentsUpload extends StatefulWidget {
  _documentsUploadState createState() => _documentsUploadState();
}

class _documentsUploadState extends State<documentsUpload> {
 _goToLanding(BuildContext context){
   Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileLanding()));
 }

 _goToCC(String localidad, BuildContext context) {
   Navigator.push(
       context, MaterialPageRoute(builder: (context) => cameraCC()));
 }
 _goToCA(String localidad, BuildContext context) {
   Navigator.push(
       context, MaterialPageRoute(builder: (context) => cameraCA()));
 }
 _goToEM(String localidad, BuildContext context) {
   Navigator.push(
       context, MaterialPageRoute(builder: (context) => cameraEM()));
 }

 List<String> listing = [
   '1. Documento',
   '2. Curso de Altura',
   '3. Examen Médico',
 ];

 int _selectedIndex = 0;

 _onSelected(int index) {
   setState(() => _selectedIndex = index);

 }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: LaborAppBar().build(context),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: new Column(
        children: <Widget>[
          //header of the screen
          //EDIT HERE
          SizedBox(height: getHeightWithoutSafeAreaAppBar(context) * 0.02),
          ProfileHeader(),
          documentsUploadDescription(),
          Expanded(
          child: ListView.builder(
          shrinkWrap: true,
            itemCount: listing.length,
            itemBuilder: (BuildContext context, int index) {
              final docs = listing[index].toString();
              final bool alreadySaved = _selectedIndex != null && _selectedIndex == index;
              return Card(
                child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    title: new Text(
                      docs,
                      style: TextStyle(
                          fontSize: 18.0,),
                    ),
                    trailing:
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                      Icon(Icons.remove_red_eye),
                          SizedBox(
                            width: getFullScreenWidth(context) * 0.02,
                          ),
                      Icon(   // Add the lines from here...
                      alreadySaved ? Icons.check : Icons.check_circle_outline,
                      color: alreadySaved ? Colors.black : Colors.transparent,),]
                    ),
                    //enabled: alreadySaved,
                    onTap: () {
                      _onSelected(index);
                      showDocumentPopUp(context);
                    }
                  ),
                );
              },
            ),
          ),
          Container(
            width: getFullScreenWidth(context),
            height: getFullScreenHeight(context) * 0.05,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: FloatingActionButton(
                    heroTag: "btnClear",
                    child: Icon(Icons.clear),
                    backgroundColor: Colors.redAccent,
                    elevation: 0,
                    onPressed: () => {},
                  ),
                ),
                Center(
                  child: FloatingActionButton(
                    heroTag: "btnTrue",
                    child: Icon(Icons.done),
                    backgroundColor: Colors.green,
                    elevation: 0,
                    onPressed: ()=> _goToLanding(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
