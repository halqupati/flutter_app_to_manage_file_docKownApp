
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/common/widgets/appstyle.dart';
import 'package:getx_app/common/widgets/custom_otn_button.dart';
import 'package:getx_app/common/widgets/custom_text.dart';
import 'package:getx_app/common/widgets/hieght_spacer.dart';
import 'package:getx_app/common/widgets/showDialogue.dart';
import 'package:getx_app/controller/note_controller.dart';
import 'package:getx_app/models/note_model.dart';
import 'package:getx_app/views/note_views/recent_notes_contest.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../product_views/add_product_page.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:device_info_plus/device_info_plus.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {

  final notesController =Get.find<NotesController>();

  final TextEditingController title =TextEditingController(text: Get.arguments['title']);
  final TextEditingController desc =TextEditingController(text: Get.arguments['description']);

  late File _image ;

  Future<bool> _request_pre(Permission permission) async{
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if(build.version.sdkInt!>=30){
      var re = await Permission.manageExternalStorage.request();
      if(re.isGranted){
        return true;
      }else{
        return false;
      }
    }else{
      if (await permission.isGranted){
        return true;
      }else{
        var result = await permission.request();
        if(result.isGranted){
          return true;
        }else{
          return false;
        }
      }
    }
  }

  Future getImageFromGallery() async{


  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.kOuterSpace,
          title: Text("تعديل الملاحظة"),
          actions: <Widget>[
          ],
        ),
        body: Container(
          color: AppConst.kDimGray,
          child: Padding(padding: EdgeInsets.symmetric(horizontal:20.w),
            child: ListView(
              children: [
                const HieghtSpacer(hieght: 20),
                CustomTextField(
                  hintText: "Add title",
                  controller: title,
                  hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),),

                const HieghtSpacer(hieght: 20),
                CustomTextField(
                  hintText: "Add description",
                  controller: desc,
                  hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),),

                const HieghtSpacer(hieght: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                      width: AppConst.kWidth*0.5,
                      height: AppConst.kHeight*0.3,
                      child:Image(
                        image: NetworkImage(
                            Get.arguments['photo'].toString()
                        ),
                      ),
                      color:Colors.transparent
                  ),
                ),
                const HieghtSpacer(hieght: 20),
                Center(
                  child: Container(
                    child: TextButton(
                      onPressed: () async {
                        if (await _request_pre(Permission.storage)==true){
                          print("Permission is Granted");
                          getImageFromGallery();
                        }else{
                          print("Permission is not Granted");
                        }
                      },child: Text("Edit Image"),
                    ),
                  ),
                ),
                const HieghtSpacer(hieght: 20),
                CustomOtlButton(
                    onTap: (){
                      if(title.text.isNotEmpty&&
                          desc.text.isNotEmpty
                      ){
                        notesController.titleText.text=title.text;
                        notesController.descriptionText.text=desc.text;
                        notesController.editNote(File(_image!.path));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecentNotesContest()));
                      }else{
                        showAlertDialog(
                          context: context,
                          message: 'Failed to edit the Note',
                          btnText: 'close',
                          color: AppConst.kRed,
                        );
                      }
                    },
                    width: AppConst.kWidth,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kGreen,
                    text: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
