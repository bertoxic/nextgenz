import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:untitled2/Screens/createSlot/calenderScreen.dart';
import 'package:untitled2/Screens/writepresciption/findings.dart';
import 'package:untitled2/model/events.dart';
import 'package:untitled2/controller/TaskController.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';

import 'calenderX.dart';

class SingleMultiple extends StatefulWidget {
  SingleMultiple({Key? key}) : super(key: key);

  @override
  State<SingleMultiple> createState() => _SingleMultipleState();
}
TimeOfDay _time= TimeOfDay(hour: 10, minute: 30);
class _SingleMultipleState extends State<SingleMultiple> {
  String? from="From";
  String? to="To";
  TimeOfDay? fromx;
  TimeOfDay? tox;
  @override
  Widget build(BuildContext context) {
    var listk=Get.find<TaskController>().taskList.keys.toList();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
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
                                  child: CalenderX(selectionMode: DateRangePickerSelectionMode.multiple,)),
                              actions: [
                                // SizedBox(
                                //   width: Dimensions.height10,
                                // ),
                                // TextButton(
                                //   onPressed: () {
                                //     Navigator.pop(context);
                                //   },
                                //   child: Text('Cancel'),
                                // )
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
                      child: GestureDetector( onTap: () async{
                        var frompicked= await showTimePicker(context: context, initialTime: _time);
                        setState(() {
                          fromx=frompicked;
                          from =frompicked?.format(context);
                        });
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
                              Text(from??'From'),
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
                      child: GestureDetector( onTap: ()async{
                       var Topicked= await showTimePicker(context: context, initialTime: _time);
                        setState(() {
                          tox=Topicked;
                          to =Topicked?.format(context);
                          var bin = DateFormat(to);
                        });
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
                              Text(to??'To'),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.height30*2,),
                Row(
                  children: [
                    Expanded(child: KeyButton('Save',txtSize:18,onTap: (){
                     setState(() {
                       Get.find<TaskController>().getTimeSlots(fromx!, tox!, const Duration(minutes: 30));
                       print(fromx.toString());
                       Get.find<TaskController>().getMultiEvents();
                     });
                    },width: Dimensions.width20*10,)),
                  ],
                )
              ],
            ),
            Container(
              height: Dimensions.height400,
              child: SingleChildScrollView(
                child: ListView.builder( padding: EdgeInsets.only(bottom: 50),
                    shrinkWrap: true,
                    itemCount:
                      listk.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext, index) {

                      return Container( width: double.infinity,
                        margin: EdgeInsets.all(Dimensions.width10/5).copyWith(top: Dimensions.height10),
                        padding: EdgeInsets.all(Dimensions.width15),
                        decoration: (BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: Offset(0, 4),
                                  blurRadius: 5)
                            ])),
                        child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(  crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GridView.builder( physics:const NeverScrollableScrollPhysics(), shrinkWrap: true,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 10,
                                          mainAxisExtent: 28
                                     ),
                                      itemCount:  Get.find<TaskController>().taskList.values.toList()[index].length,
                                      itemBuilder: (context ,count)
                                      {
                                        return Container(
                                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: kVeryDarkGreen,width: 1)
                                        ),
                                        child: Center(
                                          child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(Get.find<TaskController>().taskList.values.toList()[index][count].format(context),
                                              style: TextStyle(fontSize: Dimensions.height10*1.4),
                                              ),
                                              GestureDetector(onTap: (){
                                               setState(() {
                                                 print(listk[index]);
                                                 Get.find<TaskController>().taskList[listk[index]]!.removeAt(count);
                                                // Get.find<TaskController>().taskList.values.toList()[index].removeAt(index);
                                                // Get.find<TaskController>().taskList.remove( listk[index]);
                                               });
                                                },
                                                child: const Icon(
                                                  Icons.clear,
                                                  color: kDarkGreen,//Colors.pink,
                                                  size: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),);

                                      }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.width10,
                            ),


                            GestureDetector(onTap: (){
                            setState(() {
                              Get.find<TaskController>().taskList.remove( listk[index]);
                            });
                            },
                              child: const Icon(
                                Icons.close,
                                color: Colors.pink,
                                size: 20,
                              ),
                            ),
                            Text(
                              "${DateFormat.yMMMMEEEEd().format(listk[index])}",style: TextStyle(fontSize: 12,color:Colors.grey),),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
