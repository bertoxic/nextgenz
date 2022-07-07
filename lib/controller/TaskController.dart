
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Screens/createSlot/calenderScreen.dart';
import 'package:untitled2/model/events.dart';

class TaskController extends GetxController {
  //CalenderScreen calenderInst = CalenderScreen();
 late  Map<DateTime,List<TimeOfDay>> taskList = {};

  List<Map<DateTime,List>> lizt = [];
  List<dynamic> liz = [];
 Map selectedEvents={};


  void AddMoreEvents(DateTime date,TimeOfDay time) {
    taskList[date]!.add(time);
    update();
    lizt.add(taskList);
   // lizt.map((e) => null)
    update();
    print(" the task ${taskList[date]} added ");
    //return taskList[date] ?? [];
  }

  void makeEvent(DateTime date,TimeOfDay time){
    taskList[date] = [time];
    lizt.add(taskList);
    update();
  }

  getTask(date) async{
    return await taskList[date]??[];
    //calenderInst.getEventsfromDay;
  }
}
