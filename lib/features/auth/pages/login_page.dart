
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/common/widgets/custom_otn_button.dart';
import 'package:getx_app/common/widgets/hieght_spacer.dart';
import 'package:getx_app/common/widgets/showDialogue.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;


  final TextEditingController phone = TextEditingController();

  Country country = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc:0,
    geographic: true,
    level: 1,
    name: "USA",
    example: "USA",
    displayName: "United States",
    displayNameNoCountryCode: "US",
    e164Key: "",
  );
  sendCodeToUser(){
    if(phone.text.isEmpty){
      return showAlertDialog(context: context, message: "Please enter your phone number");
    }else if(phone.text.length <8 ){
      return showAlertDialog(context: context, message: "Your phone nmuber is short");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [

              HieghtSpacer(hieght: 20),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: Text("Enter fields"),
              ),

              HieghtSpacer(hieght: 20),
              Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    email =value;
                  },
                ),
              ),

              HieghtSpacer(hieght: 20),
              Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    password =value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text('login'),
                  onPressed: () async {
                    try{
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email,
                          password: password);
                      Get.toNamed("/contentPage");
                    }catch(e){
                      print(e);
                    }
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}