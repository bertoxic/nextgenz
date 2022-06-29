

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled2/Screens/otp_verificationScren.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';

import '../Services/api.dart';
import '../Services/url.dart';
import '../helper/formValidation.dart';

class PhoneLogin extends StatefulWidget {
   const PhoneLogin({Key? key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Services _services = Services();

  @override
  Widget build(BuildContext context) {
    final isKeyboard= MediaQuery.of(context).viewInsets.bottom!=0;

    return Scaffold(
      body: Stack(
        children: [
          Positioned( top: 0, left: 0,right: 0,
              child: Container(color:kPrimary,height: Dimensions.heighthalf*1.2,)),
          Positioned( top:Dimensions.heighthalf*1.2, left: 0,right: 0,bottom: 0,
              child: Container(color: Colors.grey.shade200,height: Dimensions.heighthalf*0.8,)),
          Positioned(  top: Dimensions.height300,left: 20,right: 20,bottom: 0,
              child: Center(
                child: Container( padding: EdgeInsets.symmetric(vertical: Dimensions.height30,horizontal: Dimensions.width20 ),
                  height: Dimensions.height300/1.2,decoration: BoxDecoration( color: Colors.grey.shade200,
                    boxShadow: [BoxShadow(offset:Offset(4,3),blurRadius: 8,color: Colors.black.withOpacity(0.4))],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Let\'s get started',style: TextStyle(
                          fontSize: 18,
                          color: kPrimary,
                          fontWeight: FontWeight.bold),),
                      Text('Enter Your mobile number', style: TextStyle(
                          fontSize: 14,
                          color: kPrimary,
                          fontWeight: FontWeight.normal),),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                            validator: (value) => phoneValidation(value!),
                            keyboardType: TextInputType.number,
                            controller: phoneNumber,
                            style: TextStyle(color: klighterGreen,fontSize: 18),
                            decoration: const InputDecoration(

                              contentPadding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                              filled: true,
                              fillColor: kPrimary,
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                child: Text(
                                  '+91',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: klighterGreen,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16.0,
                                color: klighterGreen,
                              ),
                            )),
                      ),
                      isKeyboard?GestureDetector( onTap: ()=>easyloading(),
                      // {
                      //  phone= phoneNumber.text;
                      //  phoneNumber.clear();
                      //  Navigator.push(context,  MaterialPageRoute(builder: (context) =>  OTPVerification(phoneNumber: phone)));
                      // },
                        child: Container(
                          height: Dimensions.height100/2,
                          width:double.infinity,
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: kPrimary,),
                          color: Colors.grey.shade100
                        ),
                          child: Center(
                            child: Text('continue', style: TextStyle(
                              fontSize: 18,
                              color: kPrimary,
                              fontWeight: FontWeight.normal),),
                          ),
                        ),
                      ):Container()
                    ],
                  ),),
              )),
        ],
      ),
    );

  }
  String? passwordVwalidation(String? phone) =>
      phone!.length < 6 ? 'Enter a valid password ' : null;

  easyloading() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OTPVerification(
                  phoneNumber: phoneNumber.text,
                )));
    // if (_formKey.currentState!.validate()) {
    //   EasyLoading.show(status: 'loading...');
    //   String phone = base64.encode(utf8.encode(phoneNumber.text));
    //   dynamic result = await _services.post(URL.phone, {'phone': phone});
    //   debugPrint(result.toString());
    //   if (result.toString() == 'OTP Sent Successfully') {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => OTPVerification(
    //                 phoneNumber: phoneNumber.text, convertedPhone: phone)));
    //   }
   // }
  }

}

