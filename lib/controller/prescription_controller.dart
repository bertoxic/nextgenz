import 'package:get/get.dart';
import 'package:untitled2/Screens/writepresciption/labtest.dart';
import 'package:untitled2/model/labmodel.dart';
import '../Services/api.dart';
import '../model/prescriptionsModel.dart';

class PrescriptionController extends GetxController {
  List<PrescriptionModel> manualMedList = [];
  List<PrescriptionModel> medicineTabList = [];
  List<LabModel> labTestList = [];
  List<Map<String, dynamic>> findingsList = [];
  List newMap=[];

  addToLab(LabModel value2) {
    labTestList.add(value2);
    update();
  }

  removeToLab(int index) {
    labTestList.removeAt(index);
    update();
  }

  addToMed(PrescriptionModel modelX) {
    medicineTabList.add(modelX);
    update();
  }

  removeToMed(int index) {
    medicineTabList.removeAt(index);
    update();
  }

  addToManual(PrescriptionModel modelX) {
    manualMedList.add(modelX);
    List bv = List.empty(growable: true);
    for (var element in manualMedList) {
      bv.add(element.toJson());
    }
    print(bv);
    update();
  }

  removeToManual(int index) {
    manualMedList.removeAt(index);
    update();
  }

  addToFindings(String value1, String value2) {
    findingsList.add({'medicine': value1, "description": value2});
    update();
  }

  removeToFindings(int index) {
    findingsList.removeAt(index);
    update();
  }
  List<Map<String,dynamic>> toMedJsonList(){
    List<Map<String,dynamic>> bv = [];//List.empty(growable: true);
    for (var element in manualMedList) {
      bv.add(element.toJson());
    } return bv;
  }
  List<Map<String,dynamic>> toLabJsonList(){
    List<Map<String,dynamic>> bv = [];//List.empty(growable: true);
    for (var element in labTestList) {
      bv.add(element.toJson());
    } return bv;
  }
  createPrescription(String consultationID) async {
    List bv = [];//List.empty(growable: true);

    try {
      var response =
          await dio.post('${dio.options.baseUrl}/prescription', data: {
        'consultation': consultationID, //widget.consultation['_id'],
        'medicines': toMedJsonList(),
        'labTests': toLabJsonList(),
      }).then((value) => {
       // newMap.addAll(value.data),
            print('zzzzzzzzzzzzzz'),
            print("${value.data} vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv")
                // snackBar(context, 'Prescription Created Successfully'),
                // Navigator.pop(context, true)
              });
    } catch (e) { print(e);
     // snackBar(context, 'Something went wrong, Please try again.');
    }
  }
}
