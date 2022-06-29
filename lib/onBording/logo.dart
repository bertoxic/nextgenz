import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/appColor.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'NEXT',
              style: TextStyle(
                color: kWhite,
                fontSize: 25,
              ),
            ),
            Text('GEN',
                style: TextStyle(
                    color: kWhite, fontSize: 25, fontWeight: FontWeight.bold))
          ],
        ),
        const Text('DOCTORS',
            style: TextStyle(color: kWhite, fontSize: 25, letterSpacing: 20.0))
      ],
    );
  }
}
