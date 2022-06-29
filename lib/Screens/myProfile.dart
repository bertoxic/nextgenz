import 'package:flutter/material.dart';
import 'package:untitled2/Screens/profiles/Documents.dart';
import 'package:untitled2/Screens/profiles/bankdetails.dart';
import 'package:untitled2/Screens/profiles/profileForm.dart';
import 'package:untitled2/utils/readonlytabbar.dart';

import '../utils/Dimensions.dart';
import '../utils/appColor.dart';

class EditProfile extends StatefulWidget {
  final String? id;
  final String? phoneNumber;
  const EditProfile({Key? key, this.id, this.phoneNumber}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with SingleTickerProviderStateMixin{
  //late final _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultTabController(
            length: 3,
            animationDuration: Duration(milliseconds: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                const Text(
                  'My Profile',
                  style: TextStyle(
                      color: kVeryDarkGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 80),
                 TabBar(
                  //controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'Basic',
                        style: TextStyle(color: kDarkGreen,fontSize: Dimensions.width10*1.4),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Bank Details',
                        style: TextStyle(color: kDarkGreen,fontSize: Dimensions.width10*1.4),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Document',
                        style: TextStyle(color: kDarkGreen,fontSize: Dimensions.width10*1.4),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      //controller: _tabController,
                      children: [
                        Forms(
                          id: widget.id,
                          phoneNumber: widget.phoneNumber,
                          onNext: () { //_tabController.index=1;
                            },

                        ),
                        BankDetails(
                          id: widget.id,
                          phoneNumber: widget.phoneNumber,
                          onNext: () {
                            //_tabController.index=2;

                          },
                        ),
                         DocumentsUpload(),
                       // const UploadPicture()
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

}

