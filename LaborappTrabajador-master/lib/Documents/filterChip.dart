import 'package:flutter/material.dart';


class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(color: Colors.black26,fontSize: 16.0,fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape: StadiumBorder(side: BorderSide(color: Colors.black12),),
      backgroundColor: Colors.white,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      onDeleted: (){

      },
      selectedColor: Color(0xffeadffd),);
  }
}