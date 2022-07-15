import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/widgets/midTxt.dart';

class MiniDocs extends StatelessWidget {
  String? date;
   MiniDocs({this.date,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(  onTap:(){showDialogueWidget(context);},
      child: Container( margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
        height: Dimensions.height10*18, width: Dimensions.height10*14, color: Colors.white.withOpacity(0),
        child: Stack( clipBehavior: Clip.hardEdge,
          children: [
            // Positioned( top: 0,left: 0,right: 0,
            //   child: Container(color: Colors.green,height:200,),
            // ),
            Positioned(top: Dimensions.height30,left: 0,right: 0,
              child: Container( height: Dimensions.height10*14,
      decoration: (BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white, )),
          child: Text(''),),
            ),
            Positioned(top: Dimensions.height30,left: 0,right: 0,
              child: Container( height: Dimensions.height10*14,
                decoration: (BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white, )),
                child: Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MidTxt('Date'),
                    Text(DateFormat.yMMMd().format(DateTime.parse(date??'2022-07-15T00:00:00.000Z'))),
                  ],
                ),),
            ),
            Positioned(top: 0,left: 0,right: 0,bottom: Dimensions.height100,
              child: Container(height:Dimensions.height100,
                decoration: (BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade400,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showDialogueWidget(BuildContext context){
  AlertDialog alert= AlertDialog(
    title: Text('hello there'),
    content: Container( height: Dimensions.height200*2.4, width: Dimensions.height200*2,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/girl.jpg'))),
      child: Text(''),
    ),
  );
  showDialog(context: context, builder: (BuildContext context){
    return alert;
  });
}