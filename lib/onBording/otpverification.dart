import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nextgen/screens/constants/color.dart';
import 'package:nextgen/screens/constants/images.dart';
import 'package:nextgen/screens/helpers/formvalidation.dart';
import 'package:nextgen/screens/onboarding/otpverification.dart';
import 'package:nextgen/screens/widgets/nextgenbutton.dart';
import 'package:untitled2/services/url.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:convert';

import '../../services/api.dart';
import '../constants/spacer.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Services _services = Services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.lady),
                fit: BoxFit.cover,
              ),
            ),
            child: SlidingUpPanel(
              color: kWhite.withOpacity(.7),
              minHeight: 340.0,
              padding: const EdgeInsets.all(30),
              panel: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Let\'s get started',
                        style: TextStyle(
                            fontSize: 25,
                            color: kVeryDarkGreen,
                            fontWeight: FontWeight.bold),
                      ),
                      heightSpace(15),
                      const Text(
                        'Enter your mobile number',
                        style: TextStyle(
                            fontSize: 16,
                            color: kVeryDarkGreen,
                            fontWeight: FontWeight.bold),
                      ),
                      heightSpace(25),
                      phoneNumberInput(),
                      heightSpace(10),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'By continuing, you agree to our',
                            style: TextStyle(fontSize: 14),
                          ),
                          const Text(
                            ' Terms & Conditions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      heightSpace(20),
                      NextGenButton(
                          text: 'Continue', function: () => easyloading())
                    ]),
              ),
            )));
  }

  easyloading() async {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => OTPVerification(
    //               phoneNumber: phoneNumber.text,
    //             )));
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'loading...');
      String phone = base64.encode(utf8.encode(phoneNumber.text));
      dynamic result = await _services.post(URL.phone, {'phone': phone});
      debugPrint(result.toString());
      if (result.toString() == 'OTP Sent Successfully') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OTPVerification(
                    phoneNumber: phoneNumber.text, convertedPhone: phone)));
      }
    }
  }

  phoneNumberInput() => Container(
    height: 70,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
        validator: (value) => phoneValidation(value!),
        keyboardType: TextInputType.number,
        controller: phoneNumber,
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          filled: true,
          fillColor: kWhite,
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              '+91',
              style: TextStyle(
                  fontSize: 18,
                  color: kDarkGreen,
                  fontWeight: FontWeight.bold),
            ),
          ),
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: kBlack,
          ),
        )),
  );
}
