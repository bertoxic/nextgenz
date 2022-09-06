


import 'package:get/get.dart';
import 'package:untitled2/controller/TaskController.dart';
import '../controller/prescription_controller.dart';

Future <void> init () async {

  Get.lazyPut(()=>TaskController());


  Get.lazyPut(() => PrescriptionController());

}
