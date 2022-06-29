

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay timeOfDay = TimeOfDay(hour: 10, minute: 20);
  String ti='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
