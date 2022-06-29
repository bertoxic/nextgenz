
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled2/Screens/myProfile.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:pinput/pinput.dart';

import '../Services/api.dart';
import '../helper/sharedprefrence.dart';

class OTPVerification extends StatelessWidget {
  final String? phoneNumber;
  final String? convertedPhone;
  OTPVerification({Key? key, @required this.phoneNumber, this.convertedPhone})
      : super(key: key);
  String otp = '';
  final Services _services = Services();

   static final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 2,color: Colors.grey)),
      //borderRadius: BorderRadius.circular(20),
    ),
  );
  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border(bottom: BorderSide(width: 2,color: kPrimary)),
    //borderRadius: BorderRadius.circular(8),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.only(top: Dimensions.height100,left: Dimensions.width20,right: Dimensions.width20),
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('OTP Verification',style: TextStyle(color:kVeryDarkGreen,fontSize: 24,fontWeight: FontWeight.bold),),
          Text('Enter the 6 digit number sent to +91${phoneNumber}',style: TextStyle(color:kDarkGreen,fontSize: 16,fontWeight: FontWeight.normal),),
          Container( margin: EdgeInsets.symmetric(vertical:Dimensions.height100,horizontal: Dimensions.width10),
            child: Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              length: 6,
              //submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '222222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
          ),
            Center(child: Text('Did\'nt receive Otp? Resend',style:
            TextStyle(color:kDarkGreen,fontSize: 16,fontWeight: FontWeight.normal),)),
            SizedBox(height: Dimensions.height100,),
            GestureDetector( onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
            },
              child: Container(
                height: Dimensions.height100/2,
                width:double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: kPrimary,),
                    color: kPrimary
                ),
                child: Center(
                  child: Text('Done', style: TextStyle(
                      fontSize: 18,
                      color: klighterGreen,
                      fontWeight: FontWeight.normal),),
                ),
              ),
            ),

          ],),
      ),
    );

  }
   verifyOTP(context) async {
     // Navigator.pushReplacementNamed(context, '/editprofile');
     // Navigator.push(
     //     context,
     //     MaterialPageRoute(
     //         builder: (context) => EditProfile(
     //               id: '6296192c95024d001391f727',
     //               phoneNumber: phoneNumber,
     //             )));
     if (otp.isEmpty || otp.length < 4) {
       EasyLoading.showError('Enter Valid code');
     } else {
       EasyLoading.show(status: 'loading...');
       var code = utf8.decode(base64.decode(convertedPhone!)) + otp;
       var hash = base64.encode(utf8.encode(code));
       dynamic result = await _services.getRequest('auth/otp/$hash');
       if (result.toString() != 'Invalid OTP') {
         String id = result.data['user']['_id'].toString();
         SharedPreference().save('token', result.data['token'].toString());
         SharedPreference().save('id', id);
         log(result.data['user'].length.toString());
         if (result.data['user'].length == 2) {
           Navigator.pushReplacementNamed(context, '/page_selector');
         } else {
           Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => EditProfile(
                     id: '6296192c95024d001391f727',
                     phoneNumber: phoneNumber,
                   )));
         }
       }
     }
   }
}
