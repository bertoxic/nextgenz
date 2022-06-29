

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/Dimensions.dart';
class NavBarIcon extends StatelessWidget {
  NavBarIcon({this.backGroundColor=Colors.transparent,
    this.backGroundColor2=Colors.transparent,
    this.iconColor=Colors.blueAccent,
   // required this.imageIcon,
    this.iconSize=24,
    this.icon,
    this.txtColor= const Color(0xFFCEF8EF),
    this.txt='',
    this.txtSize=14,
    this.paddin=4,Key? key}) : super(key: key);
  Color? backGroundColor;
  Color? backGroundColor2;
  Color? iconColor;
  Color? txtColor;
  double? iconSize=24;
 // String? imageIcon;
  double? paddin=2;
  double? txtSize=12;
  String? txt;
  IconData? icon;

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
          Icon(icon,size: iconSize,color: iconColor,),
          //SvgPicture.asset(imageIcon!,color:iconColor,width: iconSize,height: iconSize,),
          SizedBox(height: Dimensions.height10/5,),
          Text(txt!,style: TextStyle(color: txtColor,fontSize: txtSize),),
        ],
      ),
      //Image(image: imgIcon!,),
    );
  }
}
