import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class contra extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new
    Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(370),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            TextField(
              decoration: InputDecoration(
                  hintText: "nueva clave",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(
                    ),
                  ),
                  hintStyle: TextStyle(

                      color: Colors.grey,fontSize: 12.0)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(60),
            ),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "confirmar clave",
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