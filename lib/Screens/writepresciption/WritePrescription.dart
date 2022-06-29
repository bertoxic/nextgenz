

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/writepresciption/labtest.dart';
import 'package:untitled2/Screens/writepresciption/findings.dart';
import 'package:untitled2/Screens/writepresciption/manualtab.dart';
import 'package:untitled2/Screens/writepresciption/medicineTab.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/BigTxt.dart';

import '../navigationBar/navbar.dart';

class WritePrescription extends StatefulWidget {
  const WritePrescription({Key? key}) : super(key: key);

  @override
  State<WritePrescription> createState() => _WritePrescriptionState();
}
enum test {lab , medicine, manual,finding,none}
var picked =test.none;
class _WritePrescriptionState extends State<WritePrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade300,
      body: Container( margin: EdgeInsets.all(Dimensions.height20).copyWith(top: Dimensions.height100,left:Dimensions.height10,right: Dimensions.height10 ),
        padding: EdgeInsets.all(Dimensions.height20),
        color: Colors.white,
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          BigText('Write Presciption',color:kPrimary,size:  Dimensions.width10*1.8,fw: FontWeight.bold,),
          Padding(
            padding:  EdgeInsets.only(top: Dimensions.height10),
            child: Card( color: Colors.grey.shade200,
              child: Column( mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(  padding: EdgeInsets.all(Dimensions.height20),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Lab Test',style: TextStyle(color:kPrimary, fontSize: Dimensions.width10*1.6),),
                       picked==test.lab?Container(child: Row(children: [
                         GestureDetector( onTap:(){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>LabTest()));
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
                             picked=test.none;
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
                            picked=test.lab;
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
                        picked==test.medicine?Container(child: Row(children: [
                          Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: kPrimary,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: GestureDetector( onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicineTab()));
                              },
                                  child: Icon(Icons.pending_actions_rounded,color: Colors.white,))),
                          SizedBox(width: Dimensions.width20,),
                          Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: klighterGreen,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Icon(Icons.close,color: kPrimary,)),
                        ],),)
                            : GestureDetector( onTap: (){
                          setState(() {
                            picked=test.medicine;
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
                        picked==test.manual?Container(child: Row(children: [
                          GestureDetector( onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ManualTab()));
                          },
                            child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                  color: kPrimary,
                                  //border: Border.all(color: kLightGreen,width: 2)
                                ),
                                child: Icon(Icons.pending_actions_rounded,color: Colors.white,)),
                          ),
                          SizedBox(width: Dimensions.width20,),
                          Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: klighterGreen,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Icon(Icons.close,color: kPrimary,)),
                        ],),)
                            : GestureDetector( onTap: (){
                          setState(() {
                            picked=test.manual;
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
                        picked==test.finding?Container(child: Row(children: [
                          GestureDetector( onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Findings()));
                          },
                            child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                  color: kPrimary,
                                  //border: Border.all(color: kLightGreen,width: 2)
                                ),
                                child: Icon(Icons.pending_actions_rounded,color: Colors.white,)),
                          ),
                          SizedBox(width: Dimensions.width20,),
                          Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                                color: klighterGreen,
                                //border: Border.all(color: kLightGreen,width: 2)
                              ),
                              child: Icon(Icons.close,color: kPrimary,)),
                        ],),)
                            : GestureDetector( onTap: (){
                          setState(() {
                            picked=test.finding;
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
          )
        ],),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
