import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_time_formatter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled2/Screens/createSlot/SingleMultiple.dart';
import 'package:untitled2/Screens/createSlot/createSlot.dart';
import 'package:untitled2/model/events.dart';
import 'package:untitled2/Screens/writepresciption/findings.dart';
import 'package:untitled2/controller/TaskController.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  late Map<DateTime,List<TimeOfDay>> selectedEvents;
  CalendarFormat _format=CalendarFormat.month;
  DateTime selectedDay=DateTime.now();
  DateTime focusedDay= DateTime.now();
  TimeOfDay? newtime;
  TextEditingController _eventController =TextEditingController();
  TimeOfDay time= TimeOfDay(hour: 10, minute: 30);
  @override
  void initState() {
//selectedEvents=={}?Get.find<TaskController>().taskList :
selectedEvents={};
super.initState();
  }
  @override
  void dispose() {
_eventController.dispose();
super.dispose();
  }
  List<TimeOfDay> getEventsfromDay(DateTime date){
    return Get.find<TaskController>().taskList[date]??[];
  }
  @override
  Widget build(BuildContext context) {
    final taskme=Get.find<TaskController>().taskList;
    return Scaffold(
      body: Container( color:Colors.grey.shade100, height: Dimensions.height400, width: Dimensions.height400,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width15, vertical: Dimensions.height10/10),
        child: Column(
          children: [
                Expanded(
                  child: TableCalendar( rowHeight: Dimensions.height10*3.2,
                      shouldFillViewport: true,
                      focusedDay: focusedDay,
                      firstDay: DateTime(1990),
                      lastDay: DateTime(2070),
                  calendarFormat: _format,
                    onFormatChanged: (format){
                        setState(() {
                          _format=format;
                        });},
                    onDaySelected:(DateTime selectDay, DateTime focusDay){
                       setState(() {
                         selectedDay=selectDay;
                         focusedDay=focusDay;
                         print("$selectDay" +"   $focusedDay");
                       });
                    },
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(color: Colors.lightGreen),
                      todayDecoration: BoxDecoration(color:kPrimary)
                    ),
                    selectedDayPredicate: (DateTime date){
                        return isSameDay(selectedDay, date);
                    },
                    eventLoader:getEventsfromDay,
                  ),
                ),
           // ..._getEventsfromDay(selectedDay).map((Events events) => ListView(children: [Text("${events.title}")],shrinkWrap: true,)),
            SizedBox(height: Dimensions.height15,),
            KeyButton('Pick Time',width:Dimensions.width20*10,onTap: () async{
               newtime= await showTimePicker(context: context,
                initialTime: time,
                initialEntryMode:TimePickerEntryMode.dial,
              );
               if(newtime==null){ return;} else
                if(taskme[selectedDay] !=null){
                  print('hello000 ${taskme[selectedDay]!.length} ${newtime.toString()}');
                  Get.find<TaskController>().AddMoreEvents(selectedDay, newtime!);
                  print("${Get.find<TaskController>().lizt.length}");
                }else{
                  print('jonee ${selectedEvents.values}');
                   Get.find<TaskController>().makeEvent(selectedDay, newtime!);
                  print("${Get.find<TaskController>().lizt.length}");
                }

              // showDialog(context: context, builder: (context)=>AlertDialog(
              //   contentPadding: EdgeInsets.fromLTRB(Dimensions.width10*2.4, Dimensions.width10*2, Dimensions.width10*2.4, Dimensions.width10*2.4),
              //   title: const Text('Add  consultation',), titleTextStyle: const TextStyle(color: Colors.grey),
              //   content: Container( height: Dimensions.height100, width: Dimensions.height200, //color: Colors.lightGreen,
              //     child: Column(children: [
              //       TextFormField(controller: _eventController,
              //       decoration: InputDecoration(
              //         border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: Dimensions.width10*0.8)),
              //         hintText: "Add your new task",
              //       ),)
              //     ],),
              //   ),
              //   actions: [
              //     TextButton(onPressed: (){
              //       if(_eventController.text.isEmpty){
              //         print('${DateTime.now()}, ${Get.find<TaskController>().lizt.length}'); Get.find<TaskController>().lizt.length;
              //
              //         return;}
              //       else {
              //         if (taskme[selectedDay] != null) {
              //           print('hello000');
              //          // selectedEvents[selectedDay]!.add(Events(title: _eventController.text));
              //           Get.find<TaskController>().getEventsfromDay(selectedDay, _eventController.text);
              //           //taskme[selectedDay]!.add(Events(title: _eventController.text));
              //         } else {
              //           selectedEvents[selectedDay] = [Events(title: _eventController.text)];
              //           //taskme[selectedDay]= [Events(title: _eventController.text)];
              //           Get.find<TaskController>().makeEvent(selectedDay, _eventController.text);
              //          // Get.find<TaskController>().getEventsfromDay(selectedDay, _eventController.text);
              //         }
              //         Navigator.pop(context);
              //
              //         setState(() {});
              //         _eventController.clear();
              //       };},
              //       child: Text('Add time'),),
              //     SizedBox(width: Dimensions.height10,),
              //     TextButton(onPressed: (){Navigator.pop(context);
              //       _eventController.clear();}, child: Text('Cancel'),)
              //   ],
              // ));
              Navigator.pop(context);
               Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>CreateSlot()));
            },)
          ],
        ),
      ),
    );
  }
}
