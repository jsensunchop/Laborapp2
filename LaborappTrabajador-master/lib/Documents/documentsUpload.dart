import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/Documents/documentsUploadDescription.dart';
import 'package:laborapp_trabajador/Profile/ProfileLanding.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';
import 'package:laborapp_trabajador/Util/UtilMethods.dart';
import 'package:laborapp_trabajador/Landing/Landing.dart';
import 'package:laborapp_trabajador/popUps/popUpMethods.dart';

class documentsUpload extends StatefulWidget {
  _documentsUploadState createState() => _documentsUploadState();
}

class _documentsUploadState extends State<documentsUpload> {
 _goToLanding(BuildContext context){
   Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileLanding()));
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
          ProfileHeader(),
          documentsUploadDescription(),
          new Expanded(
            child: new ListView(
              children: <Widget>[
                ListTile(
                  title: Text("1. Documento"),
                  onTap: ()=>showDocumentPopUp(context),
                  trailing: Icon(Icons.remove_red_eye),
                  enabled: true,
                ),
                ListTile(
                  title: Text("2. Curso de Altura"),
                  trailing: Icon(Icons.remove_red_eye),
                  enabled: false,
                ),
                ListTile(
                  title: Text("3. Examen Médico"),
                  trailing: Icon(Icons.remove_red_eye),
                  enabled: false,
                )
              ],
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
