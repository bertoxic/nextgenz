
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/consultationScreens/completed.dart';
import 'package:untitled2/Screens/consultationScreens/ongoing.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/Screens/profiles/Documents.dart';
import 'package:untitled2/Screens/profiles/bankdetails.dart';
import 'package:untitled2/Screens/profiles/profileForm.dart';
import 'package:untitled2/Screens/home/homescreen.dart';

import '../../utils/Dimensions.dart';
import '../../utils/appColor.dart';
import 'upcoming.dart';

class ConsultationsScreen extends StatefulWidget {
  final String? id;
  final String? phoneNumber;
  const ConsultationsScreen({Key? key, this.id, this.phoneNumber}) : super(key: key);

  @override
  _ConsultationsScreenState createState() => _ConsultationsScreenState();
}

class _ConsultationsScreenState extends State<ConsultationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Dimensions.width10),
          child: DefaultTabController(
            length: 3,
            animationDuration: Duration(milliseconds: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                SizedBox(height: 50),
                Text(
                  'Consultations',
                  style: TextStyle(
                      color: kVeryDarkGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        'Upcoming',
                        style: TextStyle(color: kDarkGreen),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Ongoing',
                        style: TextStyle(color: kDarkGreen),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Completed',
                        style: TextStyle(color: kDarkGreen),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: TabBarView(
                      children: [
                        Upcoming(),
                        Ongoing(),
                        CompletedConsults(),
                        // const UploadPicture()
                      ],
                    ))
              ],
            ),
          ),
        ),
            bottomNavigationBar: NavBar(),
    );
  }
}
