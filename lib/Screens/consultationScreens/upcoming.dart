

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/consultationScreens/patientdetails.dart';
import 'package:untitled2/model/patientModel.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/midTxt.dart';
import 'package:untitled2/widgets/nextgenbutton.dart';

import '../../Services/api.dart';
import '../../Services/url.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  late final Services _services = Services();
  List<PatientModel> listProfile=[];
  PatientModel? _patientModel;
  getConsultations(){
    String id = '613f68a56313f81969ea0dd2';
    _services.getRequest('${URL.consultation}$id,upcoming').then((value){
      _patientModel=PatientModel.fromJson(value);
      List<PatientData>? data =_patientModel!.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(  //width: 400,
      child: SingleChildScrollView(
      child: ListView.builder( physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
          itemCount:10,itemBuilder: (BuildContext,index){
        return Container(height: Dimensions.height300/1.8, margin: EdgeInsets.symmetric(vertical: Dimensions.height10/2,horizontal: Dimensions.width10/10),
          padding: EdgeInsets.symmetric(vertical: Dimensions.height10/1.2,horizontal: Dimensions.width10),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4),spreadRadius: 2, blurRadius: 4,offset: const Offset(1,4))]
          ),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Expanded(
            child: Row(
              children: [
            Text('Monday 02 May 2022',style:TextStyle(fontSize: Dimensions.width10*1.4)),
            SizedBox(width: Dimensions.width15,),
            Text('02:30',style:TextStyle(fontSize: Dimensions.width10*1.4)),
          ],),
          ),
          SizedBox(child: Divider(color: Colors.grey,thickness: 1,),),
          Container(child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            CircleAvatar(backgroundImage: AssetImage('assets/images/girl.jpg'),radius: Dimensions.width10*4.8,),
            SizedBox(width: Dimensions.width15,),
            Flexible(
              child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                children: [
                MidTxt('Anya kumana',size: Dimensions.width10*1.4,),
                  SizedBox(height: Dimensions.height10/2,),
                Text('Gender: Female',style:TextStyle(fontSize: Dimensions.width10*1.4) ),
                  SizedBox(height: Dimensions.height10/2,),
                Text('DOB: 23rd May 1992',style:TextStyle(fontSize: Dimensions.width10*1.4)),
                  SizedBox(height: Dimensions.height10/2,),
                  GestureDetector( onTap: ()
                  {Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientProfile()));},
                    child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10/2.4,horizontal:  Dimensions.width10/2),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: kLightGreen,width: 2)
                      ),
                      child: Text('Patient Details',style: TextStyle(color:kLightGreen,fontSize: Dimensions.width10*1.4),),),
                  )
              ],),
            ),
           SizedBox(width: Dimensions.width20,),
           //NextGenButton(text: "view")
              Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10/1.2,horizontal:  Dimensions.width10/1.2),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                    color: kPrimary,
                    //border: Border.all(color: kLightGreen,width: 2)
                ),
                child: Text('View Document',style: TextStyle(color:klighterGreen,fontSize: Dimensions.width10*1.2),),),
          ],),)

        ],),);
      }) ,
    ),);
  }
}
