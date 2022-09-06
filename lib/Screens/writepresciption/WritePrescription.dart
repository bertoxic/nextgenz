

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled2/Screens/writepresciption/labtest.dart';
import 'package:untitled2/Screens/writepresciption/findings.dart';
import 'package:untitled2/Screens/writepresciption/manualtab.dart';
import 'package:untitled2/Screens/writepresciption/medicineTab.dart';
import 'package:untitled2/controller/prescription_controller.dart';
import 'package:untitled2/download/pdf/pdf_Generator.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/BigTxt.dart';
import 'package:untitled2/widgets/keyButton.dart'as k;

import '../navigationBar/navbar.dart';

class WritePrescription extends StatefulWidget {
  const WritePrescription({Key? key}) : super(key: key);

  @override
  State<WritePrescription> createState() => _WritePrescriptionState();
}
enum test {lab , medicine, manual,finding,none}
var picked =test.none;
pdfGenerator pdfGen =pdfGenerator();
class _WritePrescriptionState extends State<WritePrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade300,
      body: Container( margin: EdgeInsets.all(Dimensions.height20).copyWith(top: Dimensions.height45,left:Dimensions.height10,right: Dimensions.height10 ),
        padding: EdgeInsets.all(Dimensions.height20),
        color: Colors.white,
        child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [BigText('Write Prescription',color:kPrimary,size:  Dimensions.width10*1.8,fw: FontWeight.bold,),
            Padding(
              padding:  EdgeInsets.only(top: Dimensions.height10),
              child: Card( color: Colors.grey.shade200,
                child: Column( mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(  padding: EdgeInsets.all(Dimensions.height20),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Lab Test',style: TextStyle(color:kPrimary, fontSize: Dimensions.width10*1.6),),
                          Get.find<PrescriptionController>().labTestList.isNotEmpty?Container(child: Row(children: [
                            GestureDetector( onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LabTest())).then((value) => setState(() {

                              }));
                            },
                              child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                    color: kPrimary,
                                    //border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: Icon(Icons.pending_actions_rounded,color: Colors.white,)),
                            ),
                            SizedBox(width: Dimensions.width20,),
                            GestureDetector( onTap: (){
                              setState(() {
                                Get.find<PrescriptionController>().labTestList.clear();
                              });
                            },
                              child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                    color: klighterGreen,
                                    //border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: const Icon(Icons.close,color: kPrimary,)),
                            ),
                          ],),)
                              : GestureDetector( onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LabTest())).then((value) => setState(() {

                              }));
                            });
                          },
                            child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width20),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: kPrimary,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Text('Click to Write',style: TextStyle(color:klighterGreen,fontSize: Dimensions.width10*1.4),),),
                          )
                        ],),
                    ),
                    Container(  padding: EdgeInsets.all(Dimensions.height20),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Medicine',style: TextStyle(color:kPrimary, fontSize: Dimensions.width10*1.6),),
                          Get.find<PrescriptionController>().medicineTabList.isNotEmpty?Container(child: Row(children: [
                            GestureDetector( onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineTab())).then((value) => setState(() {

                              }));
                            },
                              child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                    color: kPrimary,
                                    //border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: const Icon(Icons.pending_actions_rounded,color: Colors.white,)),
                            ),
                            SizedBox(width: Dimensions.width20,),
                            GestureDetector(onTap:(){
                              setState(() {
                                Get.find<PrescriptionController>().medicineTabList.clear();
                              });
                            },
                              child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                    color: klighterGreen,
                                    //border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: Icon(Icons.close,color: kPrimary,)),
                            ),
                          ],),)
                              : GestureDetector( onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineTab())).then((value) => setState(() {

                              }));
                            });
                          },
                            child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width20),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: kPrimary,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Text('Click to Write',style: TextStyle(color:klighterGreen,fontSize: Dimensions.width10*1.4),),),
                          )
                        ],),
                    ),
                    Container(  padding: EdgeInsets.all(Dimensions.height20),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text('Medicine(manual)',style: TextStyle(color:kPrimary,fontSize: Dimensions.width10*1.6),)),
                          Get.find<PrescriptionController>().manualMedList.isNotEmpty?Container(child: Row(children: [
                            GestureDetector( onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ManualTab())).then((value) => setState(() {

                              }));
                            },
                              child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                    color: kPrimary,
                                    //border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: Icon(Icons.pending_actions_rounded,color: Colors.white,)),
                            ),
                            SizedBox(width: Dimensions.width20,),
                            GestureDetector( onTap: (){
                              setState(() {
                                Get.find<PrescriptionController>().manualMedList.clear();
                              });
                            },
                              child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                    color: klighterGreen,
                                    //border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: Icon(Icons.close,color: kPrimary,)),
                            ),
                          ],),)
                              : GestureDetector( onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ManualTab())).then((value) => setState(() {

                              }));
                            });
                          },
                            child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width20),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: kPrimary,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Text('Click to Write',style: TextStyle(color:klighterGreen,fontSize: Dimensions.width10*1.4),),),
                          )
                        ],),
                    ),
                    Container(  padding: EdgeInsets.all(Dimensions.height20),
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(child: Text('Findings & suggestion',style: TextStyle(color:kPrimary,fontSize: Dimensions.width10*1.6),)),
                          Get.find<PrescriptionController>().findingsList.isNotEmpty?Container(child: Row(children: [
                            GestureDetector( onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Findings())).then((value) => setState(() {

                              }));
                            },
                              child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                    color: kPrimary,
                                    //border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: Icon(Icons.pending_actions_rounded,color: Colors.white,)),
                            ),
                            SizedBox(width: Dimensions.width20,),
                            GestureDetector( onTap: (){
                              setState(() {
                                Get.find<PrescriptionController>().findingsList.clear();
                              });
                            },
                              child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                    color: klighterGreen,
                                    //border: Border.all(color: kLightGreen,width: 2)
                                  ),
                                  child: Icon(Icons.close,color: kPrimary,)),
                            ),
                          ],),)
                              : GestureDetector( onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Findings())).then((value) => setState(() {

                              }));
                            });
                          },
                            child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width20),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: kPrimary,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Text('Click to Write',style: TextStyle(color:klighterGreen,fontSize: Dimensions.width10*1.4),),),
                          )
                        ],),
                    ),


                  ],
                ),),
            ),],),),

          KeyButton('Generate prescription',txtSize:Dimensions.height10*1.8,width: double.infinity,
          onTap: ()async{
            Get.find<PrescriptionController>().createPrescription("613f68a56313f81969ea0dd2");
           // Uint8List dat=await pdfGen.createPdf();
            //pdfGen.savePdf('mypdf', dat);
          },
          ),
        ],),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
