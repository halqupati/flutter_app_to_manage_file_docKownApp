import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/common/widgets/custom_otn_button.dart';
import 'package:getx_app/views/note_views/add_note_page.dart';

import '../../controller/note_controller.dart';
import '../../models/note_model.dart';

class RecentNotesContest extends StatefulWidget {
  const RecentNotesContest({Key? key}) : super(key: key);

  @override
  State<RecentNotesContest> createState() => _RecentNotesContestState();
}

class _RecentNotesContestState extends State<RecentNotesContest> {

  final notesController =Get.find<NotesController>();

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppConst.kOuterSpace,
            title: Text("قائمة الملاحظات" + ' ( ' + notesController.noteList.length.toString()  + ' )'),
            actions:<Widget>[
              Directionality(
                textDirection:TextDirection.rtl,
                child: IconButton(
                    onPressed: (){
                      Get.toNamed("/addnote");
                    },
                    icon:Icon(Icons.add_box),color: AppConst.kGreen,),
              ),
              Directionality(
                textDirection:TextDirection.rtl,
                child: IconButton(
                    onPressed: (){
                    },
                    icon:Icon(Icons.search)),
              ),

            ],
          ),
        body:Container(
          color: AppConst.kDimGray,
          padding: const EdgeInsets.only(left: 10,top:10,right: 10),
          child: Column(
            children: [
              Expanded(
                    child:Obx(()=>
                    notesController.loading.value
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        :
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: notesController.noteList.length,
                            itemBuilder: (_,i){
                              final data = notesController.noteList[i];
                              return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.toNamed("/noteDetail",arguments: {
                                        'title':data.title.toString(),
                                        'description':data.description.toString(),
                                        'photo':data.photo.toString(),
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(right:10,left: 10, top: 10),
                                      width: AppConst.kWidth,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color:AppConst.kMidnightGreen
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:[
                                                Container(
                                                  width: AppConst.kWidth*0.99,
                                                  height: 200,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(25),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                data.photo.toString() ),
                                                            fit: BoxFit.fill
                                                        )
                                                    ),
                                                  ),
                                                )
                                              ]
                                          ),
                                          const SizedBox(height: 10),
                                          const Divider(thickness: 2.0,),
                                          Container(
                                              child:Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      data.title.toString(),
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color:Colors.white
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            child: Text(
                                              data.description.toString(),
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  color:Colors.white
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5,),
                                          const SizedBox(height: 10,),
                                          Container(
                                            padding: EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(Icons.watch_later,
                                                        color:Color(0xFF69c5df)),
                                                    const SizedBox(width: 5,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text( "التاريخ",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              color:AppConst.kGoldenGate,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(Icons.monetization_on,
                                                        color:Color(0xFFfb8483)),
                                                    const SizedBox(width: 5,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text( "تقيم",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              color:AppConst.kOrangeLight,
                                                              fontWeight: FontWeight.w700
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],),
                                                GestureDetector(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(Icons.edit,
                                                          color:Color(0xFFfbc33e)),
                                                      const SizedBox(width: 5,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children:const [
                                                           Text("تعديل",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color:AppConst.kGoldenGate,
                                                                fontWeight: FontWeight.w700
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],),
                                                  onTap: (){
                                                    Get.toNamed("/editNotePage",arguments: {
                                                      'title':data.title.toString(),
                                                      'description':data.description.toString(),
                                                      'photo':data.photo.toString(),
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              );
                            })
                    ),
                  )
            ],
          ),
        )
      ),
    );
  }
}
