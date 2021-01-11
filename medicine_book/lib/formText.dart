import 'package:flutter/material.dart';
class form extends StatelessWidget {
  @override
  String hinttext,value;
  Function onchange;
  double width;
  form({this.hinttext,this.onchange,this.width});
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextField(decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.white),
      ),
        style: TextStyle(color: Colors.white,fontSize: 25),
        cursorColor: Colors.white,
      onChanged: onchange),
    );
  }
}
