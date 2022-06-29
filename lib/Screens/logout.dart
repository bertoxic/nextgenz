import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/utils/Dimensions.dart';

import '../utils/appColor.dart';

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 80),
            const Text(
              'Menu',
              style: TextStyle(
                  color: kVeryDarkGreen,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: Dimensions.height20),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 30,
                  color: kVeryDarkGreen,
                ),
                SizedBox(width: Dimensions.width20),
                const Text(
                  'My Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: Dimensions.height20),
            Row(
              children: [
                const Icon(
                  Icons.logout,
                  size: 30,
                  color: kVeryDarkGreen,
                ),
                SizedBox(width: Dimensions.width20),
                const Text(
                  'Logout',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            )
          ]),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
