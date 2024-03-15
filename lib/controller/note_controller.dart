


import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/network/api_constants.dart';
import '../network//notes_api.dart';
import '../models/note_model.dart';
import 'package:http/http.dart' as http;


class NotesController extends GetxController{
  var noteList = <Note>[].obs;
  var loading = true.obs;
  var id;

  TextEditingController titleText = TextEditingController();
  TextEditingController descriptionText = TextEditingController();
  TextEditingController photoText = TextEditingController();

  @override
  void onInit(){
    getNotesData();
    super.onInit();
  }

  void getNotesData() async {
    var data = await NotesServices().fetchNotes();
    if ( data.length>0){
      print("data is not null");
      noteList.clear();
      loading(false);
      noteList.addAll(data);
    }
  }

  postNote(File? imageFile) async {
    var request = http.MultipartRequest('POST',Uri.parse(ApiConstants.baseUrl+ ApiConstants.notesEndpoint));

    request.fields.addAll({
      "title":titleText.text,
      "description":descriptionText.text,
    });

    Map<String,String> headers={
      "Authorization":" ",
      "Content-type": "multipart/form-data"
    };

    var picture = http.MultipartFile.fromBytes('photo',File(imageFile!.path).readAsBytesSync(),
        filename: "test.png");
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    print(result);


    /*final noteData = Note(
      title:titleText.text,
      description:descriptionText.text,
      photo:null,
    );*/
/*
    var response = await http.post(Uri.parse('http://192.168.43.1:8800/api/news'),
        body:jsonEncode(noteData.toJson()),headers: {"Content-Type":"application/json"});*/
    if (response.statusCode == 201){
      Get.snackbar("نجاح",
          "لقد قمت باضاقة ملاحظة جديدة",
          backgroundColor: AppConst.kGreen,
          colorText: AppConst.kLight,
          margin: EdgeInsets.only(top:10));
      getNotesData();
    }else{
      print(response.statusCode);
      throw Exception("Failed to load Notes data");
    }
  }

  editNote(File imageFile) async {
    var request = http.MultipartRequest('PUT',Uri.parse
      (ApiConstants.baseUrl+ ApiConstants.notesEndpoint+ '/${id}/'));

    request.fields.addAll({
      "title":titleText.text,
      "description":descriptionText.text,
    });

    Map<String,String> headers={
      "Authorization":" ",
      "Content-type": "multipart/form-data"
    };

    var picture = http.MultipartFile.fromBytes('photo',File(imageFile!.path).readAsBytesSync(),
        filename: "test.png");
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = String.fromCharCodes(responseData);
    /*final noteData = Note(
      title:titleText.text,
      description:descriptionText.text,
      photo:null,
    );*/
/*
    var response = await http.post(Uri.parse('http://192.168.43.1:8800/api/news'),
        body:jsonEncode(noteData.toJson()),headers: {"Content-Type":"application/json"});*/
    if (response.statusCode == 201 || response.statusCode == 200){
      Get.snackbar("نجاح",
          "لقد تم تعديل الملاحظة",
          backgroundColor: AppConst.kGreen,
          colorText: AppConst.kLight,
          margin: EdgeInsets.all(5));
      getNotesData();
    }else{
      print(response.statusCode);
      throw Exception("Failed to load Notes data");
    }
  }
}