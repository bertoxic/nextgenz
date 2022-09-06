import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/phone_login.dart';
import 'package:untitled2/onBording/newPhone.dart';
import 'package:untitled2/utils/appColor.dart';

import 'logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
            () => Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  PhoneNumber()//PhoneLogin()
            )));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimary,
      body: Center(child: Logo()
      ),
    );
  }
}
