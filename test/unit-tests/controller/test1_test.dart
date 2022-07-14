import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';


void main() {
  test('', () {
    List vas= stringToTimeOfDay('8:30 AM-7:20 PM');
    print(DateTime.parse("2022-04-06T00:00:00.000Z"));
  });
}

List stringToTimeOfDay(String tod) {
  List odd=tod.split("-");
  List vaz =[];
   odd.forEach((element) { final format = DateFormat.jm();
    //"6:00 AM"
   TimeOfDay.fromDateTime(format.parse(element));
  vaz.add(element);
  });

 // print(odd);
return vaz;

}