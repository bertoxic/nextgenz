import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/createSlot/SingleMultiple.dart';
import 'package:untitled2/Screens/createSlot/calenderScreen.dart';
import 'package:untitled2/Screens/createSlot/monthly.dart';
import 'package:untitled2/Screens/logout.dart';
import 'package:untitled2/Screens/navigationBar/navbar.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/BigTxt.dart';

class CreateSlot extends StatefulWidget {
  const CreateSlot({Key? key}) : super(key: key);

  @override
  State<CreateSlot> createState() => _CreateSlotState();
}

class _CreateSlotState extends State<CreateSlot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey.shade300,
      body: Padding( padding: EdgeInsets.symmetric(horizontal: Dimensions.width10/10),
        child: DefaultTabController(length: 2,
            child: Container( padding: EdgeInsets.all(Dimensions.width10),
              color: Colors.grey.shade100, margin: EdgeInsets.symmetric(horizontal: Dimensions.width10).copyWith(top: Dimensions.height45),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: Dimensions.height10,),
                BigText('Create Slot',color: kPrimary,fw: FontWeight.bold,size: 28,),
                SizedBox(height: Dimensions.height10,),
                TabBar(tabs: [
                  Tab(child: Text('Single/multiple Day',style: TextStyle(color: kPrimary,fontSize: Dimensions.width10*1.4),),),
                  Tab(child: Text('Monthly',style: TextStyle(color: kPrimary,fontSize: Dimensions.width10*1.4),),)
                ]),
                Expanded(
                  child: TabBarView(children: [
                    // CalenderScreen(),
                    SingleMultiple(),
                    Monthly(),
                  ]),
                )
              ],),
            )),),
        bottomNavigationBar: NavBar(),
    );
  }
}
