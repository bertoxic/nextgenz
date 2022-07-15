import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/home/emptyContainers.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';

import '../../Services/api.dart';
import '../../Services/url.dart';
import '../../model/consultation_model.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}
late final Services _services = Services();
List<ConsultationData> listProfile=[];
Doctor? _patientModel;
bool isLoaded=false;

//http://stgapi.nextgendoctors.in/user/613f68a56313f81969ea0dd2
class _HomeScreenState extends State<HomeScreen> {
  getConsultations()async{
    String id = '6244cf1e0d7a447c25f18c52';
    await _services.getRequest('${URL.doctorList}$id').then((value){
      var rem = value[0];
      _patientModel=Doctor.fromJson(rem);
      // List<ConsultationData>? data =_patientModel!.data;
      // listProfile.addAll( _patientModel!.data!);
      if(listProfile.isNotEmpty){setState(() {
        isLoaded=true;
      });};
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: Dimensions.heighthalf * 1.4,
            child: Container(
              color: kPrimary,
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width15,
              right: Dimensions.width15,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kimaya Hushira',
                    //  _patientModel!.mobileNumber.toString(),
                      style: TextStyle(
                          fontSize: Dimensions.width10 * 1.8,
                          fontWeight: FontWeight.bold,
                          color: klighterGreen),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_none_outlined,
                            size: Dimensions.width10 * 2.4,
                            color: klighterGreen,
                          ),
                          CircleAvatar()
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
              top: Dimensions.height100,
              left: 0,
              right: 0,
              child: Container(
                height: Dimensions.height100,
                child: EmptyContainer(),
              )),
          Positioned(
            top: Dimensions.height400, left: Dimensions.width15,
            right: Dimensions.width15, //bottom: Dimensions.heighthalf*0.8,
            child: Container(
              height: Dimensions.height300,
              color: kVeryLightGreen.withOpacity(0.4),
              child: Column(
                children: [
                  Flexible(
                      child: Center(
                          child: Text(
                    'Your Profile is under verification',
                    style: TextStyle(
                        fontSize: Dimensions.width10 * 2.4,
                        fontWeight: FontWeight.normal,
                        color: kPrimary),
                  ))),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
