import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneCall extends StatelessWidget {
  const PhoneCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned( top: 20, bottom: 0,left: 0,right: 0,
              child: Container()),
          Positioned( top: 20, bottom: 0,left: 100,right: 0,
              child: Container())
        ],
      ),
      
    );
  }
}
