import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SmallTxt extends StatelessWidget {
  SmallTxt(this.txt,{this.size=16,this.color=Colors.green,this.h=1,
    Key? key}) : super(key: key);
  double? size;
  Color color;
  String txt;
  double? h;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Text(txt,
          style: TextStyle(
            fontSize: size,
            color: color,
            height: h,

          )
      ),
    );
  }
}
