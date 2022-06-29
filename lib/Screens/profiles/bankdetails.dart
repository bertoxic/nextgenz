import 'dart:developer';

//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:nextgen/screens/helpers/sharedpreference.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
//import 'package:nextgen/services/api.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/nextgenbutton.dart';
import '../../Services/url.dart';
import '../../constants/states.dart';
import '../../helper/formValidation.dart';
import '../../helper/sharedprefrence.dart';
import '../../helper/textinput.dart';

class BankDetails extends StatefulWidget {
  final String? id;
  final String? phoneNumber;
  final VoidCallback onNext;
  const BankDetails({Key? key, this.id, this.phoneNumber,required this.onNext}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  String _gender = 'Male';
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _accountName = TextEditingController();
  final TextEditingController _accountNum = TextEditingController();
  final TextEditingController _bankName = TextEditingController();
  final TextEditingController _bankBranch = TextEditingController();
  final TextEditingController _ifscCode = TextEditingController();
  final TextEditingController _regAmt = TextEditingController();
  final TextEditingController _hospital = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String state = 'Andhra Pradesh';
  String city = 'Andhra Pradesh';
  var _selectedDate = DateTime.now();
  // late final Services _services = Services();

  Widget dropDown(List list, String value) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
          enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      value: value,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: states.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Text(items, style: const TextStyle(fontSize: 18)),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          value = newValue!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            TextHolder(TextController: _accountName, name: 'Account Holder Name',),

            const Text(
              'Account Number',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 0),
            DateTextForm(
              textEditingController: _accountNum,
              validator: stringValidation,

            ),
            SizedBox(height: 30),

            const Text(
              'Account type',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            dropDown(states, state),

            SizedBox(height: Dimensions.height30),
            TextHolder(name: 'Bank Name', TextController: _bankName,),
            TextHolder(TextController: _bankBranch, name: 'Bank Branch'),
            SizedBox(height: Dimensions.height20),
           TextHolder(TextController: _ifscCode, name: "IFSC Code"),
            SizedBox(height: Dimensions.height10),
            // Container(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Hospital Address',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     SizedBox(height: 0),
            //     TextForm(
            //       textEditingController: _phoneNumber,
            //       validator: stringValidation,
            //       //validator: stringValidation,
            //     ),
            //
            //   ],
            // ),),
            SizedBox(height: Dimensions.height45),
           NextGenButton(text: 'Next',
             function:()=>_saveForm()
           //   {//_saveForm();
           //     print('button clicked');
           //   widget.onNext;
           // }
             ),
            SizedBox(height: Dimensions.height20),

          ],
        ),
      ),
    );
  }

  _saveForm()  async{
    print('donnnnnzzzzzzzzzzzeeeee');
    if (_formkey.currentState!.validate()) {
      //EasyLoading.show(status: 'Loading', dismissOnTap: true);
      print('donnnnnnnnnnnnnneeeeeeeeeeee');
      var data = {
        'id': widget.id,
        'accountName': _accountName.text,
        'accountNunmber': _accountNum.text,
        'bankName': _bankName.text,
        'bankBranch': _bankBranch.text,
        'IFSC': _ifscCode,
        'gender': _gender,
        'mobileNumber': widget.phoneNumber,
      };  widget.onNext;

    //   dynamic result = await _services.post(URL.user, data);
    //   if (result != null) {
    //     SharedPreference().save('user', result.toString());
    //     log(result.toString());
    //     Navigator.pushNamed(context, '/pageselector');
    //   }
    }
  }

  void date() async {
    var datePicked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime(1994),
      firstDate: DateTime(1960),
      lastDate: DateTime(2015),
      dateFormat: "dd-MMMM-yyyy",
      locale: DateTimePickerLocale.en_us,
      looping: true,
    );

    setState(() {
      _selectedDate = datePicked!;
    });

  }
}


