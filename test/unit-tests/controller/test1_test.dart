import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';


void main() {
  test('', () {
    // List vas= stringToTimeOfDay('8:30 AM-7:20 PM');
    // print(DateTime.parse("2022-04-06T00:00:00.000Z"));


//     getDateTimeBatween(const TimeOfDay(hour: 20, minute: 17), const TimeOfDay(hour: 21, minute: 22), 30);
//
//
//
//   });
// }

// List<TimeOfDay> getDateTimeBatween (TimeOfDay startTime,TimeOfDay endTime,int period) {
//   int hour = startTime.hour;
//   int minute = startTime.minute;
//   List<TimeOfDay> timetab = [];
//   DayPeriod ko = startTime.period;
//   do {
//
//
//   } while (hour < endTime.hour ||
//       (hour == endTime.hour && minute <= endTime.minute));
// }

    List<TimeOfDay>? getTimeSlots(TimeOfDay startTime, TimeOfDay endTime,
        Duration interval)  {
      var hour = startTime.hour;
      var minute = startTime.minute;
      List<TimeOfDay> data =[];
      do {
         data.add(TimeOfDay(hour: hour, minute: minute));
        minute += interval.inMinutes;
        while (minute >= 60) {
          minute -= 60;
          hour++;
        }
      } while (hour < endTime.hour ||
          (hour == endTime.hour && minute <= endTime.minute));
      return data;

    };

    final startTime = TimeOfDay(hour: 11, minute: 14);
    final endTime = TimeOfDay(hour: 22, minute: 40);
    final interval = Duration(minutes: 30);

    final times = getTimeSlots(startTime, endTime, interval)
        ?.toList();
    print(times);
  });

  List<DateTime>datetime=[DateTime(1994, 5 ,1),DateTime(1994, 5 ,2),DateTime(1994, 5 ,3),DateTime(1994, 5 ,4),DateTime(1994, 5 ,5),DateTime(1994, 5 ,6),DateTime(1994, 5 ,7)];
  List<String> daysName =['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];

  Getdays(){
    List newList=[];
    for(var item in datetime){
      if(daysName.contains(DateFormat('EEE').format(item))){
        newList.add(item);
      }
    } print(newList);
  }

Getdays();



  List<DateTime>? getDaysBtw(DateTime startDate, DateTime endDate){
    List<DateTime> newList=[];
    for(int i =0; i <=endDate.difference(startDate).inDays; i++){
      newList.add(DateTime(startDate.year,startDate.month,startDate.day+i));
    }
    print(newList); return newList;
  }
getDaysBtw(DateTime(1994, 5 ,1), DateTime(1994, 7 ,1));
}
