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

class SingleMultiple extends StatefulWidget {
  SingleMultiple({Key? key}) : super(key: key);

  @override
  State<SingleMultiple> createState() => _SingleMultipleState();
}
TimeOfDay time= TimeOfDay(hour: 10, minute: 30);
class _SingleMultipleState extends State<SingleMultiple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Flexible(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Add new task'),
                              contentPadding: EdgeInsets.all(0),
                              buttonPadding: EdgeInsets.symmetric(vertical: 0),
                              content: Container(
                                  width: Dimensions.height400,
                                  height: Dimensions.height400 / 1.1,
                                  child: CalenderScreen()),
                              actions: [
                                SizedBox(
                                  width: Dimensions.height10,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel'),
                                )
                              ],
                            ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: Dimensions.height45),
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width20,
                        vertical: Dimensions.height10),
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimary),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Select Date(single/mutiple)'),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: kPrimary,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: Dimensions.height30),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height10),
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimary),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Duration'),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: kPrimary,
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector( onTap: (){
                        showTimePicker(context: context, initialTime: time);
                      },
                        child: Container(
                          margin: EdgeInsets.only(top: Dimensions.height30),
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20,
                              vertical: Dimensions.height10),
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimary),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('From'),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width20,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: Dimensions.height30),
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width20,
                            vertical: Dimensions.height10),
                        decoration: BoxDecoration(
                            border: Border.all(color: kPrimary),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('To'),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: kPrimary,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.height400,
            child: SingleChildScrollView(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Get.find<TaskController>()
                      .taskList
                      .keys
                      .toList()
                      .length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext, index) {
                    return Container( width: 400,
                     // height: Dimensions.height45,
                      margin: EdgeInsets.all(Dimensions.width10),
                      padding: EdgeInsets.all(Dimensions.width10),
                      decoration: (BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                offset: Offset(0, 4),
                                blurRadius: 5)
                          ])),
                      child: Column(
                        children: [
                          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    for(var item in Get.find<TaskController>().taskList.values.toList()[index])
                                      Container(margin: EdgeInsets.symmetric(vertical: Dimensions.width10/5,),
                                          color:Colors.grey.shade100,
                                          child: Text("${item.hour.toInt()}:${item.minute.toInt()}",style: TextStyle(color: kDarkGreen),)),
                                  ],),),
                              SizedBox(
                                width: Dimensions.width15,
                              ),

                              Text(
                                "${Get.find<TaskController>().taskList.keys.toList()[index]} ",style: TextStyle(fontSize: 12,color:Colors.grey),),
                              Icon(
                                Icons.notifications,
                                color: Colors.pink,
                                size: 20,
                              ),
                            ],
                          ),

                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
