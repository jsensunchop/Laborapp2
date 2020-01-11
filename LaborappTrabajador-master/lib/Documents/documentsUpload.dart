import 'package:flutter/material.dart';
import 'package:laborapp_trabajador/Common/ProfileHeader.dart';
import 'package:laborapp_trabajador/Documents/documentsUploadDescription.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';
import 'package:laborapp_trabajador/Common/LaboraAppBar.dart';


class documentsUpload extends StatefulWidget {
  _documentsUploadState createState() => _documentsUploadState();
}

class _documentsUploadState extends State<documentsUpload> {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
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
                  ListTile(title: Text("1 Cedula"),
                    trailing: Icon(Icons.remove_red_eye),
                    enabled: true,
                  ),
                  ListTile(title: Text("2 Curso de Altura"),
                    trailing: Icon(Icons.remove_red_eye),
                    enabled: false,
                  ),
                  ListTile(title: Text("3 Examen Médico"),
                    subtitle: Text("Sample Subtitle"),
                    trailing: Icon(Icons.remove_red_eye),
                    enabled: false,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
