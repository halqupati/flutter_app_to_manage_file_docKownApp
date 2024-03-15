
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
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {

  final notesController =Get.find<NotesController>();

  final TextEditingController title =TextEditingController();
  final TextEditingController desc =TextEditingController();

  late File _image;

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

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    _image = File('${(await getTemporaryDirectory()).path}/$path');
    await _image.create(recursive: true);
    await _image.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return _image;
  }

  Future getImageFromGallery() async{
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
        _image = File(pickedFile.path);
        print(_image!.path);
  }

  @override
  void initState() {
    getImageFileFromAssets('img/default-product.png');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.kOuterSpace,
          title: Text(" أضافة ملاحظه جديدة"),
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
                       },child: Text("Upload Image"),
                    ),
                  ),
                ),
                const HieghtSpacer(hieght: 20),
                CustomOtlButton(
                    onTap: () async {
                      if(title.text.isNotEmpty&&
                          desc.text.isNotEmpty){
                        notesController.titleText.text=title.text;
                        notesController.descriptionText.text=desc.text;
                        notesController.postNote(File(_image!.path));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecentNotesContest()));
                      }else{
                        showAlertDialog(
                          context: context,
                          message: 'Failed to add Note',
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

/*

uploadImage(String title,File file) async{
  var request = http.MultipartRequest('POST',Uri.parse('http://192.168.43.1:8800/api/news'));

  request.fields.addAll({
    "title":"test",
    "description":"test22@gmail.com",
  });
  Map<String,String> headers={
    "Authorization":" ",
    "Content-type": "multipart/form-data"
  };

  var picture = http.MultipartFile.fromBytes('photo', ( await rootBundle.load('img/pic-1.png')).buffer.asUint8List(),
filename: "test.png");
  request.files.add(picture);

  var responce = await request.send();
  var responseData = await responce.stream.toBytes();
  var result = String.fromCharCodes(responseData);
  print(result);
}*/
