import 'dart:ui';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText(this.txt,{
    this.size=24,this.color=const Color(0xFFD1D4D7),this.fw,
    Key? key}) : super(key: key);
  double? size;
  Color color= Colors.grey.shade200;
  String txt;
  FontWeight? fw;


  @override
  Widget build(BuildContext context) {
    return Text(txt,
      style: TextStyle(
          height:1,
          color: color,
          fontSize: size,
          fontWeight: fw

      ),
    );
  }
}
