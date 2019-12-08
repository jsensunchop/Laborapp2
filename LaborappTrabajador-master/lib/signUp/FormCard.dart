import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laborapp_trabajador/SingletonInstances/SingletonWorker.dart';

class FormCard extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var singletonWorkerInstance = SingletonWorker();
    return new
    Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(360),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text("Documento de identidad",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              onChanged: (text){
                singletonWorkerInstance.IdNumber = int.parse(text);
              },
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(
                    ),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey,fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Contraseña",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            TextField(
              onChanged: (text){
                singletonWorkerInstance.pss = text;
              },
              obscureText: true,
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(
                    ),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey,fontSize: 12.0)),
            ),
            
          ],
        ),
      ),
    );
  }
}