

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/createSlot/calenderScreen.dart';
import 'package:untitled2/Screens/createSlot/createSlot.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/helper/textinput.dart';
import 'package:untitled2/model/prescriptions.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/BigTxt.dart';

import '../../constants/states.dart';

class MedicineTab extends StatefulWidget {
  const MedicineTab({Key? key}) : super(key: key);

  @override
  State<MedicineTab> createState() => _MedicineTabState();
}
// enum test {lab , medicine, manual,finding,none}
// var picked =test.none;
String _food = 'After food';
double _dose =0.5;
double perDay =6;
double week=1;
late String _dosingfrequency;


//late Map<String,Prescriptions> prescriptionRow ={};
List<Map<String,dynamic>> prescriptionList=[];
TextEditingController textArea =TextEditingController();
TextEditingController textAreaz =TextEditingController();
TextEditingController nameOfMedicine =TextEditingController();


class _MedicineTabState extends State<MedicineTab> {


  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade300, resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Dimensions.height20).copyWith(top: Dimensions.height45,left:Dimensions.height10,right: Dimensions.height10 ),
          padding: EdgeInsets.all(Dimensions.height20),
          color: Colors.grey.shade100,
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText('Write Prescription',color:kPrimary,size: 18,fw: FontWeight.bold,),
              Padding(
                padding:  EdgeInsets.only(top: Dimensions.height20),
                child: Column(
                  children: [
                    Container( //height:300,
                      child: ListView.builder( itemCount:  prescriptionList.length,shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return Container( width: double.infinity,
                              child: Column(
                                children: [
                                  prescriptionList==[]?Container()://Container(),
                                  Container( width:double.infinity,
                                    margin:EdgeInsets.symmetric(vertical: Dimensions.height10/5,horizontal:Dimensions.width10, ),
                                    padding:EdgeInsets.symmetric(vertical: Dimensions.height10/2,horizontal:Dimensions.width10, ),
                                    decoration: (BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.height10/2,),
                                    color: Colors.grey.shade100
                                  )),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(child: Container(child: Text("${prescriptionList[index]['description']}"))),
                                        Container(child: Row(children: [
                                          GestureDetector(onTap:(){
                                           setState(() {
                                             nameOfMedicine.text=prescriptionList[index]['medicine'];
                                             textAreaz.text=prescriptionList[index]['description'];
                                             print('clicked $index');
                                             prescriptionList.removeAt(index);

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
                                              child: Icon(Icons.clear,color: kPrimary,size: Dimensions.width30/1.5,)),

                                        ],),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),),
                    SizedBox(height: Dimensions.height20,),
                    Row( crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container( width:80, height: Dimensions.height45, decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)), clipBehavior: Clip.hardEdge,
                          child: CupertinoPicker( //backgroundColor: Colors.grey.shade100,
                              itemExtent: 30, onSelectedItemChanged: (int index){
                                //perDay=index.i;
                          },
                              children:[]// Utils.modelBuilder<String>
                          ),
                        ),
                        SizedBox(width: Dimensions.width15,),
                        Expanded(
                          child: Container(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [ Text('Name Of Medicine'),
                                SizedBox(height: Dimensions.height10,),
                                SizedBox( width: Dimensions.width20*15,
                                  child: TextFormField( maxLines: null,
                                    controller: nameOfMedicine,
                                    decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: Dimensions.width10),
                                        label: Text('med'),
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height45,),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container( width: Dimensions.height100,
                            child: TextFormField( maxLines: null,
                             // controller: //textArea,
                              decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: Dimensions.width10),
                                  hintText: '    Dose',

                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color:kVeryLightGreen,width: 2)
                                  ),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color:Colors.grey,width: 2))
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10,),
                        Expanded(
                          child: Container( width:Dimensions.width10*10, height: Dimensions.height10*5, decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(8)), clipBehavior: Clip.hardEdge,
                            child: CupertinoPicker( //backgroundColor: Colors.grey.shade100,
                              looping: true,
                                itemExtent: 28, onSelectedItemChanged: (int index){
                                    setState(() {
                                      _dosingfrequency=dosingFrequency[index];
                                    });
                            }, // magnification: 5, diameterRatio: 32,
                                children: List<Text>.generate(dosingFrequency.length, (index) => Text('${dosingFrequency[index]}',style: TextStyle(fontSize: 14),))),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10,),
                        Expanded(
                          child: Container( width:Dimensions.width10*10, height: Dimensions.height10*5, decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(8)), clipBehavior: Clip.hardEdge,
                            child: CupertinoPicker( //backgroundColor: Colors.grey.shade100,
                                itemExtent: 28, onSelectedItemChanged: (int index){}, // magnification: 5, diameterRatio: 32,
                                children: [Text('data',style: TextStyle(fontSize: 14),),Text('data',style: TextStyle(fontSize: 14),),Text('data',style: TextStyle(fontSize: 14),),
                                  Text('data',style: TextStyle(fontSize: 14),),Text('data',style: TextStyle(fontSize: 14),),]),
                          ),
                        ),
                      ],),
                    SizedBox(height: Dimensions.height45,),
                    Row(
                      children: [
                        Expanded(
                          child: Radio(
                            value: 'After meal',
                            activeColor: kLightGreen,
                            groupValue: _food,
                            onChanged: (String? value) {
                              setState(() {
                                _food = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: const Text(
                            'After food',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(width: Dimensions.width20*3,),
                        Expanded(
                          child: Radio(
                            activeColor: kLightGreen,
                            value: 'Before meal',
                            groupValue: _food,
                            onChanged: (String? value) {
                              setState(() {
                                _food = value!;
                              });
                            },
                          ),
                        ),
                          Expanded(
                            child: const Text(
                            'Before food',
                            style: TextStyle(fontSize: 16),
                        ),
                          ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height30,),
                    Container(child: Column(children: [
                      TextBox(textEditingController: textAreaz),
                    ],),),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height45,),
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: KeyButton('Cancel',onTap: (){print(prescriptionList.length);},)),
                  Expanded(child: KeyButton('Add',onTap: (){
                   setState(() {
                    // Prescriptions['medicine'] =Prescriptions(medicine: nameOfMedicine.text,med_Discription: textArea.text);
                    // prescriptionRow={'medicine':Prescriptions(medicine: nameOfMedicine.text,med_Discription: textArea.text)};
                     prescriptionList.add({'medicine':nameOfMedicine.text,'description':textAreaz.text,'food':_food,});
                     textAreaz.clear();
                     nameOfMedicine.clear();

                   });
                 //  print('clicked ${prescriptionList[0].values}');
                   // prescriptionRow["MedicineDescription"] =textArea.text;

                  },)),
                  Expanded(child: KeyButton('Next',onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>CalenderScreen()));},)),
                ],
              ),
            ],),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class KeyButton extends StatelessWidget {
  KeyButton(this.txt,{this.width=80,this.onTap,this.txtSize=14,
    Key? key,
  }) : super(key: key);
  String txt='';
  Function()? onTap;
  double? width;
  double? txtSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: onTap,
      child: Container( width: width, margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
        padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10/2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
          color: kPrimary,
          //border: Border.all(color: kLightGreen,width: 2)
        ),
        child: Center(child: Text(txt,style: TextStyle(color:klighterGreen,fontSize: txtSize),)),),
    );
  }
}

_addPrescription(){
 // prescriotionList.add();

}


_savePresciption()  async{
    //EasyLoading.show(status: 'Loading', dismissOnTap: true);
    var data = {
      'id': '',
      'NameOfMedicine': nameOfMedicine.text,
      'dose': _dose,
      'perDAY': perDay,
      'instruction': textAreaz.text,
      'befor/AfterFood': _food,
      //'mobileNumber': widget.phoneNumber,
    };


    //   dynamic result = await _services.post(URL.user, data);
    //   if (result != null) {
    //     SharedPreference().save('user', result.toString());
    //     log(result.toString());
    //     Navigator.pushNamed(context, '/pageselector');
    //   }
}
