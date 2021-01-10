import 'package:flutter/material.dart';
class imgButton extends StatelessWidget {
  Function onpress;
  Image img;
  double height;
  imgButton({this.onpress,this.img,this.height});
  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: onpress, child: img,height: height,);
  }
}
