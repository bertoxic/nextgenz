

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/helper/textinput.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/BigTxt.dart';

import '../navigationBar/navbar.dart';

class Findings extends StatefulWidget {
  const Findings({Key? key}) : super(key: key);

  @override
  State<Findings> createState() => _FindingsState();
}
enum test {lab , medicine, manual,finding,none}
var picked =test.none;
TextEditingController findings =TextEditingController();
TextEditingController suggestions =TextEditingController();
class _FindingsState extends State<Findings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade300, resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Dimensions.height10).copyWith(top: Dimensions.height100/2,left:Dimensions.height10,right: Dimensions.height10 ),
          padding: EdgeInsets.all(Dimensions.height20),
          color: Colors.grey.shade100,
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText('Write Presciption',color:kPrimary,size: 18,fw: FontWeight.bold,),
              Padding(
                padding:  EdgeInsets.only(top: Dimensions.height20),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Dimensions.height30,),
                    Text('Findings'),
                    SizedBox(height: Dimensions.height10,),
                    Container(child: Column(children: [
                      // Container(width: Dimensions.width20*20,color: Colors.blue,child: Text('o'),),
                      TextBox(textEditingController: findings),
                    ],),),
                    SizedBox(height: Dimensions.height20,),
                    Text('Suggestions'),
                    SizedBox(height: Dimensions.height10,),
                    Container(child: Column(children: [
                      // Container(width: Dimensions.width20*20,color: Colors.blue,child: Text('o'),),
                      TextBox(textEditingController: findings),
                    ],),),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height45,),
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: KeyButton('Cancel')),
                  // KeyButton('Add'),
                  Expanded(child: KeyButton('Next',onTap:()=> _savePresciption(context),)),
                ],
              ),
            ],),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
_savePresciption(BuildContext context)  async {
  //EasyLoading.show(status: 'Loading', dismissOnTap: true);
  var data = {
    'id': '',
    'finddings': findings.text,
    'Suggestions': suggestions.text,

  };
  //   dynamic result = await _services.post(URL.user, data);
  //   if (result != null) {
  //     SharedPreference().save('user', result.toString());
  //     log(result.toString());
  //     Navigator.pushNamed(context, '/pageselector');
  //   }
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
      child: Container( width: width, margin: EdgeInsets.symmetric(horizontal: Dimensions.width10/2),
        padding: EdgeInsets.symmetric(vertical: Dimensions.height10,horizontal:  Dimensions.width10/2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
          color: kPrimary,
          //border: Border.all(color: kLightGreen,width: 2)
        ),
        child: Center(child: Text(txt,style: TextStyle(color:klighterGreen,fontSize: txtSize),)),),
    );
  }
}

// Container(child: Column(children: [
// // Container(width: Dimensions.width20*20,color: Colors.blue,child: Text('o'),),
// TextBox(textEditingController: textArea),
// ],),)