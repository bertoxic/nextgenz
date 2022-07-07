import 'package:flutter/material.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';

import 'formValidation.dart';

class TextForm extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;

  const TextForm(
      {Key? key, @required this.textEditingController, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
    );
  }
}

class DateTextForm extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  const DateTextForm({Key? key, @required this.textEditingController,this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: validator,
    );
  }
}


class EmailTextForm extends StatelessWidget {
  final TextEditingController? textEditingController;
  const EmailTextForm({Key? key, @required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
    );
  }
}


class TextArea extends StatelessWidget {
  final TextEditingController? textEditingController;
  const TextArea({Key? key, @required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( height: Dimensions.height300, 
      decoration: BoxDecoration(border: Border.all(color: kVeryDarkGreen),borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        maxLines: null,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: OutlineInputBorder(borderSide: BorderSide(color: kLightGreen)),
          contentPadding: EdgeInsets.all(Dimensions.width10)
        ),

      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final TextEditingController? textEditingController;
  const TextBox({Key? key, @required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ Container( width: double.infinity, padding: EdgeInsets.all(Dimensions.height10/2).copyWith(left: Dimensions.height10,right: Dimensions.height10),
        decoration: BoxDecoration( border: Border.all(color: kVeryDarkGreen),
          borderRadius:BorderRadius.circular(10).copyWith(bottomLeft: Radius.circular(0),bottomRight:  Radius.circular(0),) ),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Icon(Icons.format_bold_sharp,color: kVeryDarkGreen,),
          Icon(Icons.format_italic),
          Icon(Icons.format_list_bulleted_outlined),
          Icon(Icons.format_list_bulleted_sharp),
          Icon(Icons.format_line_spacing_sharp),
          Icon(Icons.rotate_left),
          Icon(Icons.rotate_right),

        ],),
      ),
        Container( height: Dimensions.height400/1.8,
          decoration: BoxDecoration(border: Border.all(color: kVeryDarkGreen),borderRadius: BorderRadius.circular(10).copyWith(topLeft: Radius.circular(0),topRight:  Radius.circular(0),)),
          child: TextFormField( controller: textEditingController,
            maxLines: null,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration( hintText: "Note Any Typical Instruction for this",
                hintStyle: TextStyle(),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: OutlineInputBorder(borderSide: BorderSide(color: kLightGreen)),
                contentPadding: EdgeInsets.all(Dimensions.width10)
            ),

          ),
        ),
      ],
    );
  }
}

class TextHolder extends StatelessWidget {
  TextHolder({
    Key? key,
    required TextEditingController TextController,
    required String name,
  }) : Txtcontroller = TextController, _name=name ,super(key: key);

  final TextEditingController Txtcontroller;
  String _name='';

  @override
  Widget build(BuildContext context) {
    return Container( margin: EdgeInsets.only(bottom: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$_name',
            style: TextStyle(fontSize: 18),
          ),
          TextForm(
            textEditingController: Txtcontroller,
            validator: stringValidation,
          ),
        ],),
    );
  }
}