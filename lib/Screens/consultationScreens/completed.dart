



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/consultationScreens/patientdetails.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/nextgenbutton.dart';

import '../../Services/api.dart';
import '../../Services/url.dart';
import '../../model/consultation_model.dart';

class CompletedConsults extends StatefulWidget {
  const CompletedConsults({Key? key}) : super(key: key);

  @override
  State<CompletedConsults> createState() => _CompletedConsultsState();
}
late final Services _services=Services();
int? dataLength;
List<ConsultationData>? data;
ConsultationModel _consultationModel=ConsultationModel();
class _CompletedConsultsState extends State<CompletedConsults> {
  getConsultation() async{
    String id = '613f68a56313f81969ea0dd2';
    // _pagingController.addPageRequestListener((pageKey) {
    await _services.getRequest('${URL.consultation}$id,completed').then((value) {
      setState(() {
        _consultationModel = ConsultationModel.fromJson(value);
        dataLength = _consultationModel.data!.length;
        data = _consultationModel.data;
      });
    });
    //}
  }
  @override
  void initState() {
    //getConsultation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(  //width: 400,
      child: SingleChildScrollView(
        child: ListView.builder( physics: NeverScrollableScrollPhysics(), shrinkWrap: true,
            itemCount:10,itemBuilder: (BuildContext,index){
              return Container(height: Dimensions.height300/1.8, margin: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal: Dimensions.width10*0),
                padding: EdgeInsets.symmetric(vertical: Dimensions.height10/1.2,horizontal: Dimensions.width10),
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.4),spreadRadius: 2, blurRadius: 4,offset: const Offset(1,4))]
                ),
                child: Column( mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container( margin: EdgeInsets.symmetric(vertical: Dimensions.height10/10),
                      child: Row(
                        children: [
                          Text('Monday 02 May 2022',style: TextStyle(fontSize:  Dimensions.width10*1.3),),
                          SizedBox(width: Dimensions.width15,),
                          Text('02:30',style: TextStyle(fontSize:  Dimensions.width10*1.3),),
                        ],),),
                    SizedBox(child: Divider(color: Colors.grey,thickness: 1,),),
                    Container(child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(backgroundImage: AssetImage('assets/images/girl.jpg'),radius: Dimensions.width10*4.8,),
                        SizedBox(width: Dimensions.width10,),
                        Flexible(
                          child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Anya kumana',style: TextStyle(fontSize:  Dimensions.width10*1.4,fontWeight: FontWeight.bold),),
                              SizedBox(height: Dimensions.height10/2,),
                              Text('Gender: Female',style: TextStyle(fontSize:  Dimensions.width10*1.4,)),
                              SizedBox(height: Dimensions.height10/2,),
                              Text('DOB: 23rd May 1992',style: TextStyle(fontSize:  Dimensions.width10*1.3,)),
                              SizedBox(height: Dimensions.height10/2,),
                              GestureDetector( onTap: ()
                              {Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientProfile()));},
                                child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10/2.4,horizontal:  Dimensions.width10/2),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: Text('Patient\'s Details',style: TextStyle(color:kLightGreen,fontSize:  Dimensions.width10*1.4),),),
                              )
                            ],),
                        ),
                        Column(
                          children: [
                            Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10/2.4,horizontal:Dimensions.width10/1.6),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: kPrimary,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.download_outlined,color: kVeryLightGreen,size: Dimensions.width20*1.2,),
                                  Text('Download picture',style: TextStyle(color:klighterGreen,fontSize:  Dimensions.width10*1.2),),
                                ],
                              ),),
                            SizedBox(height: Dimensions.height10,),
                            Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10/2.4,horizontal:  Dimensions.width10/1.6),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: kPrimary,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.upload_outlined,color: kVeryLightGreen,size: Dimensions.width20*1.2,),
                                  Text('  Upload picture  ',style: TextStyle(color:klighterGreen,fontSize:  Dimensions.width10*1.2),),
                                ],
                              ),),
                          ],
                        ),
                        //NextGenButton(text: "view")

                      ],),),

                  ],),);
            }) ,
      ),);
  }
}
