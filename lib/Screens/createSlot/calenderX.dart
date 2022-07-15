

import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalenderX extends StatelessWidget {
   CalenderX({Key? key}) : super(key: key);
DateRangePickerController calController = DateRangePickerController();
List<dynamic> selectedDays=[];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        enablePastDates: false,
       selectionMode: DateRangePickerSelectionMode.multiple,
       showTodayButton: true,
       showActionButtons: true,
       controller: calController,
       onSubmit: (Object? val){
          selectedDays.add(val);
          print(selectedDays);
          print(val);
          Navigator.pop(context);

       },
       onCancel: (){
          calController.selectedRanges=null;
          Navigator.pop(context);
       },
       // initialSelectedDate: DateTime.now(),

      ),
    );
  }
}
