import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled2/Screens/home/homescreen.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/controller/prescription_controller.dart';
import 'package:untitled2/helper/textinput.dart';
import 'package:untitled2/model/labmodel.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/BigTxt.dart';

import '../../widgets/keyButton.dart';

class LabTest extends StatefulWidget {
  const LabTest({Key? key}) : super(key: key);

  @override
  State<LabTest> createState() => _LabTestState();
}
enum test {lab , medicine, manual,finding,none}
var picked =test.none;
List<Map<String,dynamic>> _testList=[];
TextEditingController textArea =TextEditingController();
TextEditingController nameOfTest =TextEditingController();
class _LabTestState extends State<LabTest> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrescriptionController>(
  builder: (logic) {
    return Scaffold( backgroundColor: Colors.grey.shade300, resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Dimensions.height20).copyWith(top: Dimensions.height100,left:Dimensions.height10,right: Dimensions.height10 ),
          padding: EdgeInsets.all(Dimensions.height20),
          color: Colors.grey.shade100,
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText('Lab Test',color:kPrimary,size: 18,fw: FontWeight.bold,),
              Padding(
                padding:  EdgeInsets.only(top: Dimensions.height30),
                child: Column(
                  children: [
                    Container( //height:300,
                      child: ListView.builder( itemCount:  logic.labTestList.length,shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Container( width: double.infinity,
                              child: Column(
                                children: [
                                  logic.labTestList==[]?Container()://Container(),
                                  Container( width:double.infinity,
                                    margin:EdgeInsets.symmetric(vertical: Dimensions.height10/5,horizontal:Dimensions.width10, ),
                                    padding:EdgeInsets.symmetric(vertical: Dimensions.height10/2,horizontal:Dimensions.width10, ),
                                    decoration: (BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.height10/2,),
                                        color: Colors.grey.shade100
                                    )),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(child: Container(child: Text("${logic.labTestList[index].name}"))),
                                        Container(child: Row(children: [
                                          GestureDetector(onTap:(){
                                            setState(() {
                                              nameOfTest.text=logic.labTestList[index].name!;
                                              textArea.text=logic.labTestList[index].description??"";
                                              logic.labTestList.removeAt(index);

                                            });
                                          },
                                            child: Container( padding:EdgeInsets.symmetric(vertical:Dimensions.width10/4,horizontal:Dimensions.width10, ),
                                                decoration:BoxDecoration(
                                                    color: kPrimary,borderRadius: BorderRadius.circular(Dimensions.height10/2)


                                                ),
                                                child: Icon(Icons.edit,color: Colors.grey.shade200, size: Dimensions.width30/1.5,)),
                                          ),
                                          SizedBox(width: Dimensions.width10,),
                                          Container( padding:EdgeInsets.symmetric(vertical:Dimensions.width10/4,horizontal:Dimensions.width10, ),
                                              decoration:BoxDecoration(
                                                  color: Colors.grey.shade200,borderRadius: BorderRadius.circular(Dimensions.height10/2)


                                              ),
                                              child: GestureDetector(onTap:(){
                                                  logic.removeToLab(index);
                                              },
                                                  child: Icon(Icons.clear,color: kPrimary,size: Dimensions.width30/1.5,))),

                                        ],),)
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height10,)
                                ],
                              ),
                            );
                          }),),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ Text('Name of Test'),
                        SizedBox(height: Dimensions.height10,),
                        SizedBox( width: double.infinity,
                          child: TextFormField( maxLines: null, controller: nameOfTest,
                            decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: Dimensions.width10),
                                focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:kVeryLightGreen,width: 2)
                            ),
                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(color:kVeryDarkGreen,width: 2))
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height30,),
                    Container(child: Column(children: [
                     // Container(width: Dimensions.width20*20,color: Colors.blue,child: Text('o'),),
                      TextBox(textEditingController: textArea),
                    ],),),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height45,),
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: KeyButton('Cancel')),
                  Expanded(child: KeyButton('Save',onTap: (){
                    setState(() {
                      logic.addToLab(LabModel(name: nameOfTest.text,description: textArea.text));
                     // logic.labTestList.add({'medicine':nameOfTest.text,'description':textArea.text,});
                      textArea.clear();
                      nameOfTest.clear();

                    });
                    //  print('clicked ${prescriptionList[0].values}');
                    // prescriptionRow["MedicineDescription"] =textArea.text;

                  },)),
                  Expanded(child: KeyButton('Add more',onTap: ()=>_savePrescription(context),)),
                ],
              ),
            ],),
        ),
      ),
      bottomNavigationBar: const NavBar(),
    );
  },
);
  }
}
_savePrescription(BuildContext context)  async {
  //EasyLoading.show(status: 'Loading', dismissOnTap: true);
  var data = {
    'id': '',
    'nameOfTest': nameOfTest.text,
    'Instructions': textArea.text,

  };
  //   dynamic result = await _services.post(URL.user, data);
  //   if (result != null) {
  //     SharedPreference().save('user', result.toString());
  //     log(result.toString());
  //     Navigator.pushNamed(context, '/pageselector');
  //   }
  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
}


