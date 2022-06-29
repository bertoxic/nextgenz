
import 'package:get/get.dart';
import 'package:untitled2/Screens/createSlot/calenderScreen.dart';
import 'package:untitled2/model/events.dart';

class TaskController extends GetxController {
  //CalenderScreen calenderInst = CalenderScreen();
 late  Map<DateTime,List<Events>> taskList = {};
  List<Map<DateTime,List>> lizt = [];
  List<dynamic> liz = [];
 Map selectedEvents={};


  void getEventsfromDay(DateTime date,String task) {
    taskList[date]!.add(Events(title:task));
    lizt.add(taskList);
   // lizt.map((e) => null)
    update();
    print(" the task ${taskList[date]} added ");
    //return taskList[date] ?? [];
  }

  void makeEvent(DateTime date,String task){
    taskList[date] = [Events(title: task)];
    lizt.add(taskList);
  }

  getTask(date) {
    return taskList[date]??[];
    //calenderInst.getEventsfromDay;
  }
}
