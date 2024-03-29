import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled2/Screens/phone_login.dart';
import 'package:untitled2/controller/TaskController.dart';
import 'package:untitled2/controller/prescription_controller.dart';
import 'package:untitled2/dependencies/dependencies.dart';
import 'package:untitled2/onBording/splashScreen.dart';
import 'package:untitled2/dependencies/dependencies.dart' as dep;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());

  // Get.put(TaskController());
  // Get.find<TaskController>();
  // Get.put(PrescriptionController());
  // Get.find<PrescriptionController>();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      builder: EasyLoading.init(),

    );
  }
}

