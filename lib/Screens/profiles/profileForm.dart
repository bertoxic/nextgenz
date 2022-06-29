import 'dart:developer';

//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:nextgen/screens/helpers/sharedpreference.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:untitled2/Screens/consultationScreens/ongoing.dart';
//import 'package:nextgen/services/api.dart';
import 'package:untitled2/utils/Dimensions.dart';
import 'package:untitled2/utils/appColor.dart';
import 'package:untitled2/widgets/nextgenbutton.dart';
import '../../Services/api.dart';
import '../../constants/states.dart';
import '../../helper/formValidation.dart';
import '../../helper/textinput.dart';

class Forms extends StatefulWidget {
  final String? id;
  final String? phoneNumber;
  final Function() onNext;
   Forms({Key? key, this.id, this.phoneNumber,required this.onNext}) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final TextEditingController _name = TextEditingController();
  String _gender = 'Male';
 // final _tabController=TabController(length: 3, vsync: this);
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _hospitalAddress = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _specialty = TextEditingController();
  final TextEditingController _amt = TextEditingController();
  final TextEditingController _regCouncil = TextEditingController();
  final TextEditingController _hospital = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String state = 'Andhra Pradesh';
  String city = 'Andhra Pradesh';
  var _selectedDate = DateTime.now();
  late final Services _services = Services();

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
            const Text(
              'Full Name',
              style: TextStyle(fontSize: 18),
            ),
            TextForm(
              textEditingController: _name,
              validator: stringValidation,
            ),
            SizedBox(height: 30),
            const Text(
              'Gender',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Radio(
                  value: 'Male',
                  activeColor: kLightGreen,
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text(
                  'Male',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: Dimensions.width20*5,),
                Radio(
                  activeColor: kLightGreen,
                  value: 'Female',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    setState(() {
                      _gender = value!;
                    });
                  },
                ),
                const Text(
                  'Female',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 30),
            const Text(
              'Date of Birth',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => date(),
              child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                      border:
                      Border(bottom: BorderSide(width: 1, color: Colors.grey))),
                  child: Text(
                    '${_selectedDate.year}/${_selectedDate.month} /${_selectedDate.day}',
                    style: TextStyle(fontSize: 17),
                  )),
            ),
            SizedBox(height: 30),
            const Text(
              'State',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            dropDown(states, state),
            SizedBox(height: 30),
            const Text(
              'City',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 0),
            TextForm(
              textEditingController: _city,
              validator: stringValidation,
            ),
            SizedBox(height: 30),
            Container(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email Address',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 0),
                EmailTextForm(
                  textEditingController: _email,
                  //validator: stringValidation,
                ),
              ],
            ),),
            SizedBox(height: Dimensions.height30),
            Container(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: Dimensions.height10),
                SizedBox(height: 0),
                TextArea(
                  textEditingController: _area,
                  //validator: stringValidation,
                ),
              ],
            ),),

            SizedBox(height: Dimensions.height30),
            Container(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Specialty',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 0),
                TextForm(
                  textEditingController: _specialty,
                  validator: stringValidation,
                  //validator: stringValidation,
                ),
              ],
            ),),
            SizedBox(height: Dimensions.height20),
            Container(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Consultation Fee',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 0),
                TextForm(
                  textEditingController: _amt,
                  validator: stringValidation,
                  //validator: stringValidation,
                ),

              ],
            ),),
            SizedBox(height: Dimensions.height20),
            Container(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Registration Council',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 0),
                TextForm(
                  textEditingController: _regCouncil,
                  validator: stringValidation,
                  //validator: stringValidation,
                ),
              ],
            ),),
            SizedBox(height: Dimensions.height20),

            Container(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hospital Name',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 0),
                TextForm(
                  textEditingController: _hospital,
                  validator: stringValidation,
                  //validator: stringValidation,
                ),

              ],
            ),),
            SizedBox(height: Dimensions.height10),
            Container(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hospital Address',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 0),
                TextForm(
                  textEditingController: _hospitalAddress,
                  validator: stringValidation,
                  //validator: stringValidation,
                ),
                SizedBox(height: 30),
                const Text(
                  'Hospital State',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                dropDown(states, state),
                SizedBox(height: 30),

              ],
            ),),
            SizedBox(height: Dimensions.height20),
           GestureDetector( onTap: widget.onNext,
             child: NextGenButton(text: 'Next',
               function: ()=>_saveForm()
             //  widget.onNext
             ,),
           ),
            SizedBox(height: Dimensions.height20),
          ],
        ),
      ),
    );
  }

  _saveForm() async{
    print('donnnnnnnnnnnnnneeeeeeeeeeee');
    if (_formkey.currentState!.validate()) {
      //widget.onNext;
      print(_selectedDate.toString());
      //EasyLoading.show(status: 'Loading',dismissOnTap: true);
      var data = {

        'id': widget.id,
        'name': _name.text,
        'gender': _gender,
        // 'emailId': _emailIdController.text,
        'mobileNumber': widget.phoneNumber,
        'dateOfBirth': _selectedDate.toString(),
        'address': {'address': state, 'city': _city.text},
        'email':_email.text,
        'Specialty':_specialty.text,
        'consultationFee':_amt.text,
        'registrationCouncil':_regCouncil.text,
        'hospitalName':_hospital.text,
        'hospitalAddress':_hospitalAddress.text
      } ;
       print('donnnxxxxxxxxxvvvvee');
    //   widget.onNext;
    //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>Ongoing()));
    //
    //
    //   // dynamic result = await _services.post(URL.user, data);
    //   // if (result != null) {
    //   //   SharedPreference().save('user', result.toString());
    //   //   log(result.toString());
    //   //  Navigator.pushNamed(context, '/pageselector');
    //   // }
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
