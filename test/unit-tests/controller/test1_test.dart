import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';


void main() {
  test('', () {
    // List vas= stringToTimeOfDay('8:30 AM-7:20 PM');
    // print(DateTime.parse("2022-04-06T00:00:00.000Z"));


    getDateTimeBatween(TimeOfDay(hour: 1, minute: 30), TimeOfDay(hour: 7, minute: 20), 30);



  });
}


List<TimeOfDay> getDateTimeBatween (TimeOfDay startTime,TimeOfDay endTime,int period){
  int hour=startTime.hour;
  int minute = startTime.minute;
  List<TimeOfDay> timetab=[];

  while(
  startTime.hour<endTime.hour
  ){ if(minute==60) minute-=60;hour++;
    hour+=hour+period;
    timetab.add(TimeOfDay(hour:(hour), minute: minute));
  }
print(timetab);
  return timetab;

}











// List stringToTimeOfDay(String tod) {
//   List odd=tod.split("-");
//   List vaz =[];
//    odd.forEach((element) { final format = DateFormat.jm();
//     //"6:00 AM"
//    TimeOfDay.fromDateTime(format.parse(element));
//   vaz.add(element);
//   });
//
//  // print(odd);
// return vaz;
//
// }