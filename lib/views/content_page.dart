import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/common/widgets/nav_bar.dart';
import 'package:getx_app/controller/tamum_controller.dart';
import 'package:getx_app/models/tamum_model.dart';
import 'package:getx_app/views/note_views/recent_notes_contest.dart';
import 'package:getx_app/views/product_views/recent_products_contest.dart';
import 'package:getx_app/views/recent_contest.dart';
import 'package:getx_app/views/tamum_views/recent_tamum_contest.dart';

import '../controller/note_controller.dart';
import '../controller/product_controller.dart';
import 'my_detail_page.dart';


class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {

  final _auth = FirebaseAuth.instance;
  late User signedInUser;
  @override
  void initState(){
    super.initState();
    notesController;
    getCurrentUser();
}
  void getCurrentUser(){
    try{
      final user = _auth.currentUser;
      if(user != Null){
        signedInUser = user!;
        print(signedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }

  List items = [];
  final NotesController notesController = Get.put(NotesController());
  final ProductController productController = Get.put(ProductController());
  final TamumController tamumController = Get.put(TamumController());



  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    int _currentIndex  = 0;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor:AppConst.kOuterSpace,
          actions:<Widget>[
            Directionality(
              textDirection:TextDirection.rtl,
              child: IconButton(
                  onPressed: (){
                  },
                  icon:Icon(Icons.search)),
            )
          ],
        ),
          body: Container(
            padding: const EdgeInsets.only( top:20),
            color: AppConst.kDimGray,
            child: Column(
              children: [
                //james smith
                Container(
                  width: width,
                  height: 100,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:const Color(0xFF048989),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius:40,
                          backgroundImage: AssetImage(
                              "img/background.jpg"
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "James Smith",
                              style: TextStyle(
                                  color:Color(0xFF3b3f42),
                                  fontSize: 18,
                                  decoration: TextDecoration.none
                              ),
                            ),
                            const SizedBox(height: 5,),
                            const Text(
                              "Top Level",
                              style: TextStyle(
                                  color:Color(0xFFfdebb2),
                                  fontSize: 12,
                                  decoration: TextDecoration.none
                              ),
                            ),

                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:const Color(0xFFf3fafc)
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.notifications,
                              color:AppConst.kGoldenGate,
                              size: 30,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                //popular contest
                Container(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      const Text(
                        "جديد الملاحظات",
                        style: TextStyle(
                            color:Color(0xFF1f2326),
                            fontSize: 20,
                            decoration: TextDecoration.none
                        ),
                      ),
                      Expanded(child: Container()),
                      const Text(
                        "Show all",
                        style: TextStyle(
                            color:AppConst.kOrangeLight,
                            fontSize: 15,
                            decoration: TextDecoration.none
                        ),
                      ),

                      const SizedBox(width: 5,),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:AppConst.kGoldenGate
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(() =>const RecentNotesContest());
                          },
                          child: const Icon(Icons.arrow_forward_ios,color: Colors.white),

                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                //list
                Obx(
                  () => notesController.loading.value
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  :
                  Container(
                  height: 220,
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.88),
                      itemCount: notesController.noteList.length,
                      itemBuilder: (_, i){
                        final data = notesController.noteList[i];
                        return GestureDetector(
                          onTap: (){
                            Get.toNamed("/noteDetail",arguments: {
                              'title':data.title.toString(),
                              'description':data.description.toString(),
                              'photo':data.photo.toString(),
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(right:10,left: 20, top: 10),
                            height: 220,
                            width: 300,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:i.isEven?AppConst.kEerieBlack:AppConst.kBkDark
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:100,
                                    child:Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                           data.title.toString(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color:Colors.white
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                const SizedBox(width: 10),

                                Container(
                                  width: 200,
                                  height: 200,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                data.photo.toString()
                                            ),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        );
                      }),
                ),
            ),
                const SizedBox(height: 10,),
                //recent contests
                Container(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      const Text(
                        "تعاميم الجديدة",
                        style: TextStyle(
                            color:Color(0xFF1f2326),
                            fontSize: 20,
                            decoration: TextDecoration.none
                        ),
                      ),
                      Expanded(child: Container()),
                      const Text(
                        "Show all",
                        style: TextStyle(
                            color:AppConst.kOrangeLight,
                            fontSize: 15,
                            decoration: TextDecoration.none
                        ),
                      ),

                      const SizedBox(width: 5,),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppConst.kGoldenGate,
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(()=>const RecentTaumumContest());
                          },
                          child: const Icon(Icons.arrow_forward_ios,color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                 child: MediaQuery.removePadding(context: context,
                        removeTop: true,
                        child:Obx( () => tamumController.loading.value
                            ? Center(
                          child: CircularProgressIndicator(),
                        )
                            : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (_, index){
                              Tamum data = tamumController.tamumList[index];
                              return Container(
                                width: width,
                                height: 100,
                                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:AppConst.kMidnightGreen,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius:30,
                                        child: Text(data.tamumNum.toString()),
                                        backgroundColor: AppConst.kGoldenGate,
                                        ),
                                      const SizedBox(width: 10,),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                             data.tamumDate.toString() + " " +  data.tamumField.toString(),
                                              style: const TextStyle(
                                                  color:Color(0xFFfdebb2),
                                                  fontSize: 14,
                                                  decoration: TextDecoration.none
                                              ),
                                            ),


                                          ],
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: Text(
                                        data.tamumType.toString(),
                                          style: const TextStyle(
                                              fontSize: 10,
                                              decoration: TextDecoration.none,
                                              color:Color(0xFFb2b8bb)
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            })

                    ),
                 ),
                ),
              ],
            ),
          ),
        ),
    );


  }
}


