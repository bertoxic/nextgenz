

import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled2/Screens/createSlot/calenderScreen.dart';
import 'package:untitled2/model/events.dart';
import 'package:untitled2/controller/TaskController.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';

class Monthly extends StatefulWidget {
  Monthly({Key? key}) : super(key: key);

  @override
  State<Monthly> createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: Container( margin: EdgeInsets.only(top: Dimensions.height30),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height10),
                    decoration: BoxDecoration(border: Border.all(color: kPrimary),borderRadius: BorderRadius.circular(5)),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('From'),
                        Icon(Icons.keyboard_arrow_down,color: kPrimary,)
                      ],
                    ),),
                ),
                SizedBox(width: Dimensions.width20,),
                Expanded(
                  child: Container( margin: EdgeInsets.only(top: Dimensions.height30),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height10),
                    decoration: BoxDecoration(border: Border.all(color: kPrimary),borderRadius: BorderRadius.circular(5)),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('To'),
                        Icon(Icons.keyboard_arrow_down,color: kPrimary,)
                      ],
                    ),),
                ),
              ],),
              Container( margin: EdgeInsets.only(top: Dimensions.height30),
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height10),
                decoration: BoxDecoration(border: Border.all(color: kPrimary),borderRadius: BorderRadius.circular(5)),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Date(single/mutiple)'),
                    Icon(Icons.keyboard_arrow_down,color: kPrimary,)
                  ],
                ),),
              Row(children: [
                Expanded(
                  child: Container( margin: EdgeInsets.only(top: Dimensions.height30),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height10),
                    decoration: BoxDecoration(border: Border.all(color: kPrimary),borderRadius: BorderRadius.circular(5)),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('From'),
                        Icon(Icons.keyboard_arrow_down,color: kPrimary,)
                      ],
                    ),),
                ),
                SizedBox(width: Dimensions.width20,),
                Expanded(
                  child: Container( margin: EdgeInsets.only(top: Dimensions.height30),
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height10),
                    decoration: BoxDecoration(border: Border.all(color: kPrimary),borderRadius: BorderRadius.circular(5)),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('To'),
                        Icon(Icons.keyboard_arrow_down,color: kPrimary,)
                      ],
                    ),),
                ),
              ],),

            ],
          ),),
          ListView.builder( shrinkWrap: true, itemCount:Get.find<TaskController>().liz.length,
              itemBuilder: (BuildContext ,index){
                return Container(child: Row(children: [
                  Text("${Get.find<TaskController>().liz[index].toString()} oh dear"),
                  Icon(Icons.favorite)
                ],),);
              })
        ],
      ),
    );
  }
}
