import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/Screens/createSlot/calenderScreen.dart';
import 'package:untitled2/model/events.dart';

class TaskController extends GetxController {
  late Map<DateTime, List<TimeOfDay>> taskList = {};
  List<DateTime> selectedDays = [];
  List<DateTime> daysBetween = [];
  List<String> daysName = [];
  List<Map<DateTime, List>> lizt = [];
  List<TimeOfDay> timetab = [];
  //Map selectedEvents = {};

  void AddMoreEvents(DateTime date, TimeOfDay time) {
    taskList[date]!.add(time);
    update();
    lizt.add(taskList);
    // lizt.map((e) => null)
    update();
    print(" the task ${taskList[date]} added ");
    //return taskList[date] ?? [];
  }

  addTaskLis(List dateList, List<TimeOfDay> time) {
    for (var date in dateList) {
      taskList[date]?.addAll(time);
    }
  }

  List<DateTime> addSelectedDays(Object val) {
    if (val as List<DateTime> != []) {
      selectedDays = val as List<DateTime>;
      update();
      print(selectedDays);
    }
    print('object in taskcontroller');
    return selectedDays;
  }

  List<TimeOfDay>? getTimeSlots(
      TimeOfDay startTime, TimeOfDay endTime, Duration interval) {
    var hour = startTime.hour;
    var minute = startTime.minute;
    List<TimeOfDay> data = [];
    do {
      data.add(TimeOfDay(hour: hour, minute: minute));
      minute += interval.inMinutes;
      while (minute >= 60) {
        minute -= 60;
        hour++;
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute <= endTime.minute));
    timetab = data;
    return data;
  }

  getMultiEvents() {
    for (var item in selectedDays) {
      taskList[item] = timetab;
      update();
    }
    timetab = [];
    selectedDays = [];
    print("${selectedDays.toString()} selected days");
    print("${timetab.toString()} selected time");
    print("${taskList.keys.toString()} tasklist");
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
  List<DateTime>? getDaysBtw(DateTime startDate, DateTime endDate){
    List<DateTime> newList=[];
    for(int i =0; i <=endDate.difference(startDate).inDays; i++){
      newList.add(DateTime(startDate.year,startDate.month,startDate.day+i));
    }
    daysBetween=newList;
    update();
    print(" nnnnnnnnnnnnnnnnnnnnnnn"); return daysBetween;
  }
  daysnym(List<String> vent){
    daysName=vent;
    update();
    print('daysssnymmm done');

  }
  getDays(){
    List<DateTime> newList=[];
    for(var item in daysBetween){
      if(daysName.contains(DateFormat('EEEE').format(item))){
        newList.add(item);
        update();

      }
    } selectedDays=newList;
    update();
    for(var item in selectedDays)
    print("${DateFormat.yMMMMEEEEd().format(item)}");
  }
  void makeEvent(DateTime date, TimeOfDay time) {
    taskList[date] = [time];
    lizt.add(taskList);
    update();
  }

  getTask(date) async {
    return await taskList[date] ?? [];
    //calenderInst.getEventsfromDay;
  }
}
