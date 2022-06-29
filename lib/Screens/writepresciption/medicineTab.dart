

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/createSlot/calenderScreen.dart';
import 'package:untitled2/Screens/createSlot/createSlot.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/helper/textinput.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/BigTxt.dart';

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
TextEditingController textArea =TextEditingController();
TextEditingController nameOfMedicine =TextEditingController();
class _MedicineTabState extends State<MedicineTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade300, resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Dimensions.height20).copyWith(top: Dimensions.height100,left:Dimensions.height10,right: Dimensions.height10 ),
          padding: EdgeInsets.all(Dimensions.height20),
          color: Colors.grey.shade100,
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText('Write Presciption',color:kPrimary,size: 18,fw: FontWeight.bold,),
              Padding(
                padding:  EdgeInsets.only(top: Dimensions.height45),
                child: Column(
                  children: [
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
                              controller: textArea,
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
                          child: Container( width:100, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(8)), clipBehavior: Clip.hardEdge,
                            child: CupertinoPicker( //backgroundColor: Colors.grey.shade100,
                                itemExtent: 30, onSelectedItemChanged: (int index){}, // magnification: 5, diameterRatio: 32,
                                children: [Text('data',style: TextStyle(fontSize: 14),),Text('data',style: TextStyle(fontSize: 14),),Text('data',style: TextStyle(fontSize: 14),),
                                  Text('data',style: TextStyle(fontSize: 14),),Text('data',style: TextStyle(fontSize: 14),),]),
                          ),
                        ),
                        SizedBox(width: Dimensions.width10,),
                        Expanded(
                          child: Container( width:100, height: 50, decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 2),borderRadius: BorderRadius.circular(8)), clipBehavior: Clip.hardEdge,
                            child: CupertinoPicker( //backgroundColor: Colors.grey.shade100,
                                itemExtent: 30, onSelectedItemChanged: (int index){}, // magnification: 5, diameterRatio: 32,
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
                  Expanded(child: KeyButton('Add')),
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


_savePresciption()  async{
    //EasyLoading.show(status: 'Loading', dismissOnTap: true);
    var data = {
      'id': '',
      'NameOfMedicine': nameOfMedicine.text,
      'dose': _dose,
      'perDAY': perDay,
      'instruction': textArea.text,
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
