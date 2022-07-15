
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
  addTaskLis(List dateList,List<TimeOfDay> time){
    for(var date in dateList){
      taskList[date]?.addAll(time);
    }
  }

  List<TimeOfDay> getDateTimeBatween (TimeOfDay startTime,TimeOfDay endTime,int period){
    int hour=startTime.hour;
    int minute = startTime.minute;
    List<TimeOfDay> timetab=[];

    while(
    startTime.hour>endTime.hour
    ){
      hour+=hour+period;
     timetab.add(TimeOfDay(hour:(hour), minute: minute));
    }

return timetab;

  }

  // getMultipleTime(TimeOfDay startTime,TimeOfDay endTime,Duration period){
  //   //startTime
  //   do{
  //      TimeOfDay(hour: null, minute: null)
  //   }while();
  // }

 // List<TimeOfDay> getDateTimesBetween({
 //   required TimeOfDay start,
 //   required TimeOfDay end,
 //   required Duration period,
 // }) {
 //
 //   var dateTimes = <DateTime>[];
 //   var current = start.add(period);
 //   while (current.isBefore(end)) {
 //     dateTimes.add(current);
 //     current = current.add(period);
 //   }
 //   return dateTimes;
 // }

 // void main() {
 //   print(getDateTimesBetween(
 //     start: DateTime(2021, 07, 20, 10),
 //     end: DateTime(2021, 07, 20, 16),
 //     period: Duration(minutes: 30),
 //   ));
 // }


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
