
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Screens/home/homescreen.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/nextgenbutton.dart';

import '../../Services/api.dart';
import '../consultationScreens/ConsultationScreen.dart';

class DocumentsUpload extends StatefulWidget {
   DocumentsUpload({Key? key}) : super(key: key);

  @override
  State<DocumentsUpload> createState() => _DocumentsUploadState();
}
enum uploads {profile, regCert,basic,none}
  var load= uploads.none;
  var load1= uploads.none;
  var load2= uploads.none;
class _DocumentsUploadState extends State<DocumentsUpload> {
  final Services _services = Services();
  FilePickerResult? result;
  FilePickerResult? regCert;
  FilePickerResult? basicCert;
  void uploadPicture(result) {
    log(result.files.first.name.toString());
    _services.uploadPicture(result).then((value) {});
  }

  void picker(uploads) async {
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result!.files.single.path!);
      setState(() {
        load=uploads;
      });
    } else {
      log('cancled upload');
    }
  }
  void picker1(uploads) async {
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result!.files.single.path!);
      setState(() {
        load1=uploads;
      });
    } else {
      log('cancled upload');
    }
  }
  void picker2(uploads) async {
    result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result!.files.single.path!);
      setState(() {
        load2=uploads;
      });
    } else {
      log('cancled upload');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector( onTap: (){
                picker(uploads.profile);
              },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.height20,horizontal: Dimensions.width15),
                    height: Dimensions.height100, margin: EdgeInsets.only(bottom: Dimensions.height30),
                    decoration: BoxDecoration(color: kVeryDarkGreen,
                        borderRadius:BorderRadius.circular(8) ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Profile Picture',style: TextStyle(fontSize: Dimensions.width10*1.4,fontWeight:FontWeight.bold,color: klighterGreen),),

                        Container( padding: EdgeInsets.all(Dimensions.height10/2), width: Dimensions.width10*10,
                          decoration: BoxDecoration(border:Border.all(color: klighterGreen,width: 1),
                        borderRadius: BorderRadius.circular(30)
                        ),

                          child: Icon(load==uploads.profile?Icons.thumb_up_alt_rounded:Icons.upload_outlined,color: klighterGreen,),
                        )
                    ],),
                        Text('No picture to show',style: TextStyle(color: klighterGreen,fontSize: Dimensions.width10*1.2),),
                  ],),
                  ),
              ),
              GestureDetector( onTap: (){
                picker1(uploads.regCert);
              },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.height20,horizontal: Dimensions.width15),
                  height: Dimensions.height100, margin: EdgeInsets.only(bottom: Dimensions.height30),
                  decoration: BoxDecoration(color: kVeryDarkGreen,
                      borderRadius:BorderRadius.circular(8) ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Registration Certificate',style: TextStyle(fontSize: Dimensions.width10*1.4,fontWeight:FontWeight.bold,color: klighterGreen),),

                          Container( padding: EdgeInsets.all(Dimensions.height10/2), width: Dimensions.width10*10,
                            decoration: BoxDecoration(border:Border.all(color: klighterGreen,width: 1),
                                borderRadius: BorderRadius.circular(30)
                            ),

                            child: Icon(load1==uploads.regCert?Icons.panorama_rounded:Icons.upload_outlined,color: klighterGreen,),
                          )
                        ],),
                      Text('No picture to show',style: TextStyle(color: klighterGreen,fontSize:Dimensions.width10*1.2)),
                    ],),
                ),
              ),
              GestureDetector( onTap: (){
                picker2(uploads.basic);
              },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.height20,horizontal: Dimensions.width15),
                  height: Dimensions.height100, margin: EdgeInsets.only(bottom: Dimensions.height30),
                  decoration: BoxDecoration(color: kVeryDarkGreen,
                      borderRadius:BorderRadius.circular(8) ),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Basic degree Certificates',style: TextStyle(fontSize: Dimensions.width10*1.4,fontWeight:FontWeight.bold,color: klighterGreen),),

                          Container( padding: EdgeInsets.all(Dimensions.height10/2), width: Dimensions.width10*10,
                            decoration: BoxDecoration(border:Border.all(color: klighterGreen,width: 1),
                                borderRadius: BorderRadius.circular(30)
                            ),

                            child: Icon(load2==uploads.basic?Icons.panorama_rounded:Icons.upload_outlined,color: klighterGreen,),
                          )
                        ],),
                      Text('No picture to show',style: TextStyle(color: klighterGreen,fontSize:Dimensions.width10*1.2),),
                    ],),
                ),
              ),
             NextGenButton(text: 'save',function:(){

              //uploadPicture(regCert);
              // uploadPicture(basicCert);
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
              // uploadPicture(result);
             }
             )
            ],
          ),
        ));
  }
}
