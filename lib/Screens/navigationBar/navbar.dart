

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/consultationScreens/ConsultationScreen.dart';
import 'package:untitled2/Screens/createSlot/createSlot.dart';
import 'package:untitled2/Screens/home/homescreen.dart';
import 'package:untitled2/Screens/logout.dart';
import 'package:untitled2/Screens/navigationBar/navIcon.dart';
import 'package:untitled2/utils/appColor.dart';

import '../../utils/Dimensions.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color:kPrimary,height: Dimensions.height20*3.2,
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        GestureDetector( onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        },
            child: NavBarIcon(icon: Icons.home,iconColor:klighterGreen,txt: 'home',txtSize: Dimensions.height10*1.4,iconSize: Dimensions.width10*2.4,)),
        GestureDetector( onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ConsultationsScreen()));
        },
            child: NavBarIcon(icon: Icons.add,iconColor:klighterGreen,txt: 'Consultations',txtSize: Dimensions.height10*1.4,iconSize: Dimensions.width10*2.4,)),
        GestureDetector( onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateSlot()));
        },
            child: NavBarIcon(icon: Icons.calendar_today_outlined,iconColor:klighterGreen,txtSize: Dimensions.height10*1.4,txt: 'My Slot',iconSize: Dimensions.width10*2.4,)),
        GestureDetector( onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOut()));
        },
            child: NavBarIcon(icon: Icons.list,iconColor:klighterGreen,txt: 'Menu',txtSize: Dimensions.height10*1.4,iconSize: Dimensions.width10*2.4,)),
      ],),
    );
  }
}
