import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../controller/TaskController.dart';

class CalenderX extends StatefulWidget {
  CalenderX({required this.selectionMode, Key? key}) : super(key: key);
  DateRangePickerSelectionMode? selectionMode;

  @override
  State<CalenderX> createState() => _CalenderXState();
}

class _CalenderXState extends State<CalenderX> {
  DateRangePickerController calController = DateRangePickerController();
  DateRangePickerController controller = DateRangePickerController();

  List<DateTime> selectedDays = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (controlX) {
        return Container(
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            enablePastDates: false,
            selectionMode: widget.selectionMode!,
            showTodayButton: true,
            showActionButtons: true,
            controller: calController,
            initialSelectedDate: DateTime.now(),
            initialSelectedRange: PickerDateRange(
              DateTime.now().subtract(Duration(days: 5)),
              DateTime.now().add(Duration(days: 2)),
            ),
            onSelectionChanged: (args ){
              SchedulerBinding.instance.addPostFrameCallback((Duration) {
                setState(() {
                //  String date = DateFormat('dd, MMMM yyy').format(args.value).toString();
                  // PickerDateRange DATZ=args.value;
                  // final dat=args.value;
                  // print(DATZ);
                });
              }) ;
            },
            onSubmit: (Object? val) {
             if(widget.selectionMode==DateRangePickerSelectionMode.multiple){
               if(val==null) {

                 Navigator.pop(context);
                 return;
               }
               controlX.addSelectedDays(val);
               // print(controlX.selectedDays);
               Navigator.pop(context);
             }else if(widget.selectionMode==DateRangePickerSelectionMode.range){
                      Object?   der= val!;
               print(der);
             }
            },
            onCancel: () {
              calController.selectedRanges = null;
              Navigator.pop(context);
            },
            // initialSelectedDate: DateTime.now(),

          ),
        );
      },
    );
  }
}
