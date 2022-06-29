import 'dart:ui';
import 'package:flutter/material.dart';

class MidTxt extends StatelessWidget {
  MidTxt(this.txt,{
    this.size=14,this.color=const Color(0xFF252424),this.fw= FontWeight.bold,
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
