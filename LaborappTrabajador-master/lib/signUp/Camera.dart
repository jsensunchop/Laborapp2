import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:laborapp_trabajador/Common/ColorPalette.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'home1.dart';
import 'dart:async';
import 'dart:io';

class ImageCapture extends StatefulWidget {
  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture>
    with SingleTickerProviderStateMixin {
  void continueWorkerRute(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => home1()));
  }

  File _imageFile;

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        // ratioX: 1.0,
        // ratioY: 1.0,
        // maxWidth: 512,
        // maxHeight: 512,
        toolbarColor: Colors.purple,
        toolbarWidgetColor: Colors.white,
        toolbarTitle: 'Crop It');

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  Future<bool> _onBackPressed() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => home1()));
  }

  //quitar imagen
  void _clear() {
    setState(() => _imageFile = null);
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
          bottomNavigationBar: BottomAppBar(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.photo_camera),
                  onPressed: () => _pickImage(ImageSource.camera)),
              IconButton(
                  icon: Icon(Icons.photo_library),
                  onPressed: () => _pickImage(ImageSource.gallery)),
            ],
          )),
          body: ListView(
            children: <Widget>[
              if (_imageFile != null) ...[
                Image.file(_imageFile),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Icon(Icons.crop),
                      onPressed: _cropImage,
                    ),
                    FlatButton(
                      child: Icon(Icons.refresh),
                      onPressed: _clear,
                    ),
                  ],
                ),
                Uploader(file: _imageFile)
              ]
            ],
          ),
        ));
  }
}

class Uploader extends StatefulWidget {
  final File file;

  Uploader({Key key, this.file}) : super(key: key);

  createState() => _UploaderState();
}

class _UploaderState extends State<Uploader> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://amazing-tiger-260023.appspot.com/');

  StorageUploadTask _uploadTask;

  _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      _uploadTask = _storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;

            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_uploadTask.isComplete)
                    Text('🎉🎉🎉',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            height: 2,
                            fontSize: 30)),
                  if (_uploadTask.isPaused)
                    FlatButton(
                      child: Icon(Icons.play_arrow, size: 50),
                      onPressed: _uploadTask.resume,
                    ),
                  if (_uploadTask.isInProgress)
                    FlatButton(
                      child: Icon(Icons.pause, size: 50),
                      onPressed: _uploadTask.pause,
                    ),
                  LinearProgressIndicator(value: progressPercent),
                  Text(
                    '${(progressPercent * 100).toStringAsFixed(2)} % ',
                    style: TextStyle(fontSize: 50),
                  ),
                ]);
          });
    } else {
      return FlatButton.icon(
          color: Colors.blue,
          label: Text('Upload to Firebase'),
          icon: Icon(Icons.cloud_upload),
          onPressed: _startUpload);
    }
  }
}
