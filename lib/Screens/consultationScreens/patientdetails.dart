import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/Screens/phoncall/phonecall.dart';
import 'package:untitled2/Screens/writepresciption/WritePrescription.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/widgets/BigTxt.dart';
import 'package:untitled2/widgets/midTxt.dart';
import 'package:untitled2/widgets/uploadedDocMin.dart';

import '../../utils/appColor.dart';

class PatientProfile extends StatefulWidget {
  String? patientName;
  String? patientAge;
  String? patientGender;
  String? patientComplaint;
  String? patientCity;
  String? patientDate;
   PatientProfile({this.patientName,this.patientDate,this.patientComplaint,this.patientCity,this.patientGender,Key? key}) : super(key: key);

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea( top: true,
      child: Scaffold( backgroundColor: Colors.grey.shade300,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                      Container( height: Dimensions.height100*2.1,
                        margin: EdgeInsets.only(top: Dimensions.height45,bottom:Dimensions.height10/5),
                       padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal: Dimensions.width15).copyWith(bottom: Dimensions.height10*0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.grey.shade100,),
                        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          BigText('Patient Details',color: kPrimary,size:  Dimensions.width20,fw: FontWeight.bold,),
                          SizedBox(height: Dimensions.height20,),
                          Expanded(
                            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              CircleAvatar(radius: Dimensions.height200/4.167,backgroundImage: AssetImage('assets/images/girl2.jpg'),),
                              SizedBox(width: Dimensions.height30,),
                              Column( crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('Name ',style: TextStyle(fontSize:Dimensions.height10*1.6,),),
                                MidTxt( widget.patientName??'nil',size: Dimensions.height10*1.6,),
                                SizedBox(width: Dimensions.height300/1.5,child: Divider(color: Colors.grey,thickness: 1,),),
                                Flexible(
                                  child: Row(
                                    children: [
                                      Container( margin:EdgeInsets.symmetric(horizontal:Dimensions.width10/2),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Age ',style: TextStyle(fontSize:Dimensions.height10*1.6,),),
                                            SizedBox(height: Dimensions.height10,),
                                            MidTxt(widget.patientAge??'null',size: Dimensions.height10*1.6,),
                                          ],
                                        ),
                                      ),
                                      Container( margin:EdgeInsets.symmetric(horizontal:Dimensions.width10/2),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Gender ',style: TextStyle(fontSize:Dimensions.height10*1.6,),),
                                            SizedBox(height: Dimensions.height10,),
                                            MidTxt( widget.patientGender??'null',size: Dimensions.height10*1.4,),
                                          ],
                                        ),
                                      ),
                                      Container( margin:EdgeInsets.symmetric(horizontal:Dimensions.width10/2),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('State ',style: TextStyle(fontSize:Dimensions.height10*1.6,),),
                                            SizedBox(height: Dimensions.height10,),
                                            Text(widget.patientCity??'null'),
                                          ],
                                        ),
                                      ),
                                      Container( margin:EdgeInsets.symmetric(horizontal:Dimensions.width10/2),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('City ',style: TextStyle(fontSize:Dimensions.height10*1.6,),),
                                            SizedBox(height: Dimensions.height10,),
                                            Text(' '),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                  SizedBox(height: Dimensions.height10*0,),
                                  Flexible(
                                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(width: Dimensions.height100,),
                                        GestureDetector( onTap: ()
                                        {Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneCall()));},
                                          child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10/1.2,horizontal:  Dimensions.width10),
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                              color: kPrimary,
                                              //border: Border.all(color: kLightGreen,width: 2)
                                            ),
                                            child: Row(
                                              children: [ Icon(Icons.phone,color: Colors.grey.shade100,size: Dimensions.height10*1.8,),
                                                SizedBox(width: Dimensions.width10/2,),
                                                Text('make a call',style: TextStyle(color:klighterGreen,fontSize: Dimensions.height10*1.6),),
                                              ],
                                            ),),
                                        ),
                                      ],
                                    ),
                                  )
                              ],),
                            ],),
                          )
                        ],),
                      ),
            Container(  width: double.infinity,
              margin: EdgeInsets.only(top: Dimensions.height10/10,bottom:Dimensions.height10/5),
              padding: EdgeInsets.symmetric(vertical: Dimensions.height20,horizontal: Dimensions.width15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.grey.shade100,),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MidTxt('Patient\'s Complaint',size: Dimensions.width10*1.6,),
                  SizedBox(height: Dimensions.height10,),
                  Container( padding: EdgeInsets.all(8), height: Dimensions.height100, width: double.infinity,
                    decoration: BoxDecoration( borderRadius:BorderRadius.circular(8),
                        border: Border.all(width: Dimensions.width10/5,color: Colors.grey.shade300)),
                    child: SingleChildScrollView(child: Container(child:  Text('${widget.patientComplaint} '))),)

                ],),
            ),
            Container( padding: EdgeInsets.all(8), height: Dimensions.height100, width: double.infinity,
              decoration: BoxDecoration( borderRadius:BorderRadius.circular(8),color: Colors.grey.shade100,
                  border: Border.all(width: 2,color: Colors.grey.shade300)),
              child: Text('Note'),),
            SizedBox(height: Dimensions.height10/2,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Uploaded Documents',style: TextStyle(fontSize: Dimensions.width10*1.6),),
            ),
              SizedBox(height: Dimensions.height10/2,),
              Container( height: Dimensions.height100*1.9,
                  child: SingleChildScrollView( scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      MiniDocs(date: widget.patientDate,),
                      MiniDocs(date: widget.patientDate),
                      MiniDocs(date: widget.patientDate),
                    ],),
                  )
              ),
              Align( alignment:Alignment.centerRight,
                child: GestureDetector( onTap: ()
                {Navigator.push(context, MaterialPageRoute(builder: (context)=>WritePrescription()));},
                  child: Container( margin: EdgeInsets.symmetric(vertical: Dimensions.height10/2,horizontal:  Dimensions.width10/1.2) ,
                    padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10/1.2),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                      color: kPrimary,
                      //border: Border.all(color: kLightGreen,width: 2)
                    ),
                    child: Text('Write prescription',style: TextStyle(color:klighterGreen,fontSize:  Dimensions.height10*1.4,),),),
                ),
              ),
          ],
          ),
        ),
        bottomNavigationBar:NavBar(),
      ),
    );
  }
}
