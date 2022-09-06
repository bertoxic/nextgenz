

import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
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

class Monthly extends StatefulWidget {
  Monthly({Key? key}) : super(key: key);

  @override
  State<Monthly> createState() => _MonthlyState();
}


class _MonthlyState extends State<Monthly> {
  TimeOfDay _time= TimeOfDay(hour: 10, minute: 30);
  String? from="From";
  String? to="To";
  DateTime? fromD;
  DateTime? toD;
  List<bool> _selected=[false,false,false,false,false,false,false];
  final List<String> _daysOfWeek=['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
  List<String> _daysSelected=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: GestureDetector(onTap: ()async{
                    var date= await DatePicker.showSimpleDatePicker(context,
                      textColor: Colors.grey.shade200,
                      backgroundColor: kDarkGreen,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2052),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: false,

                    );setState(() {
                      fromD=date;
                      print('$fromD mmmmmm');
                    });
                  },
                    child: Container( margin: EdgeInsets.only(top: Dimensions.height30),
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height10),
                      decoration: BoxDecoration(border: Border.all(color: kPrimary),borderRadius: BorderRadius.circular(5)),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          fromD == null?Text("From"):
                          Text(DateFormat.yMMMd().format(fromD!)),
                          Icon(Icons.keyboard_arrow_down,color: kPrimary,)
                        ],
                      ),),
                  ),
                ),
                SizedBox(width: Dimensions.width20,),
                Expanded(
                  child: GestureDetector(onTap: ()async{
                    var date= await DatePicker.showSimpleDatePicker(context,
                      textColor: Colors.grey.shade200,
                      backgroundColor: kDarkGreen,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2052),
                      dateFormat: "dd-MMMM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      looping: false,

                    );setState(() {
                      toD=date;
                      print('$toD mmmmmm');
                    });
                  },
                    child: Container( margin: EdgeInsets.only(top: Dimensions.height30),
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height10),
                      decoration: BoxDecoration(border: Border.all(color: kPrimary),borderRadius: BorderRadius.circular(5)),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          toD == null?Text("To"):
                          Text("${DateFormat.yMMMd().format(toD!)}"),
                          Icon(Icons.keyboard_arrow_down,color: kPrimary,)
                        ],
                      ),),
                  ),
                ),
              ],),
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
                            child: CalenderX(selectionMode: DateRangePickerSelectionMode.range,)),
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
              Row(children: [
                Expanded(
                  child: GestureDetector( onTap: () async{
                    var frompicked= await showTimePicker(context: context, initialTime: _time);
                    setState(() {
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
              ],),

            ],
          ),),
          GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 50),
              shrinkWrap: true, itemCount:_selected.length, physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context,index){
                 return CheckboxListTile( title: Text(_daysOfWeek[index]), activeColor: kVeryDarkGreen,
                     controlAffinity: ListTileControlAffinity.leading,
                     value: _selected[index], onChanged: (onChanged){
                   setState(() {
                     if(onChanged==true){
                       _daysSelected.add(_daysOfWeek[index]);
                     }else{
                       _daysSelected.remove(_daysOfWeek[index]);
                     }
                     _selected[index]=onChanged!;
                    // print(_daysSelected);
                   });

                 }) ;
               }),
          SizedBox(height: Dimensions.height45,),
          Row(
            children: [
              Expanded(
                child: KeyButton('Save',txtSize:Dimensions.height20,onTap: (){
                  setState(() {
                    Get.find<TaskController>().getDaysBtw(fromD!, toD!);
                    Get.find<TaskController>().daysnym(_daysSelected);
                    Get.find<TaskController>().getDays();
                  });
                },),
              ),
            ],
          )
        ],
      ),
    );
  }
}
