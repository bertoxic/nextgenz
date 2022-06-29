

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/Dimensions.dart';

class BottomIcon extends StatelessWidget {
  BottomIcon({this.backGroundColor=Colors.transparent,
    this.backGroundColor2=Colors.transparent,
    this.iconColor=Colors.blueAccent,
    required this.imageIcon,
    this.iconSize=20,
    this.txtColor= const Color(0xFF9E95C4),
    this.txt='',
    this.paddin=4,Key? key}) : super(key: key);
  Color? backGroundColor;
  Color? backGroundColor2;
  Color? iconColor;
  Color? txtColor;
  double? iconSize=20;
  String? imageIcon;
  double? paddin=2;
  String? txt;

  @override
  Widget build(BuildContext context) {
    return Container( margin:  EdgeInsets.all(paddin!),
      padding: EdgeInsets.all(paddin!),
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,
            colors: [ backGroundColor!,
              backGroundColor2!

            ]),
        color: backGroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        children: [
          SvgPicture.asset(imageIcon!,color:iconColor,width: iconSize,height: iconSize,),
          SizedBox(height: Dimensions.height10/10,),
          Text(txt!,style: TextStyle(color: txtColor),),
        ],
      ),
      //Image(image: imgIcon!,),
    );
  }
}
