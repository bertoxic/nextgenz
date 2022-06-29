import 'package:flutter/material.dart';
import 'package:untitled2/Screens/home/homescreen.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/helper/textinput.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/BigTxt.dart';

class ManualTab extends StatefulWidget {
  const ManualTab({Key? key}) : super(key: key);

  @override
  State<ManualTab> createState() => _ManualTabState();
}
enum test {lab , medicine, manual,finding,none}
var picked =test.none;
TextEditingController textArea =TextEditingController();
TextEditingController nameOfTest =TextEditingController();
class _ManualTabState extends State<ManualTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade300, resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(Dimensions.height20).copyWith(top: Dimensions.height100,left:Dimensions.height10,right: Dimensions.height10 ),
        padding: EdgeInsets.all(Dimensions.height20),
        color: Colors.grey.shade100,
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText('Write Presciption',color:kPrimary,size: 18,fw: FontWeight.bold,),
            Padding(
              padding:  EdgeInsets.only(top: Dimensions.height30),
              child: Column(
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Text('Name of Medicine'),
                      SizedBox(height: Dimensions.height10,),
                      SizedBox( width: double.infinity,
                        child: TextFormField( maxLines: null,
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
                Expanded(child: KeyButton('Cancel',txtSize: Dimensions.height10*1.6,)),
                Expanded(child: KeyButton('Add',txtSize: Dimensions.height10*1.6,)),
                Expanded(child: KeyButton('Next',onTap: ()=>_savePresciption(context),)),
              ],
            ),
          ],),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
_savePresciption(BuildContext context)  async {
  //EasyLoading.show(status: 'Loading', dismissOnTap: true);
  var data = {
    'id': '',
    'nameOfMedicine': nameOfTest.text,
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
