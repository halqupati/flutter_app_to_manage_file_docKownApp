
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_app/common/utils/constants.dart';


class NoteDetailPage extends StatefulWidget {
  const NoteDetailPage({Key? key}) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {



  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return

      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Container(
              height:AppConst.kHeight,
              color: AppConst.kBkDark,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Column(
                      children: [
                        Row(
                          children:[
                            IconButton(
                              onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios,color: AppConst.kOrangeLight),
                            ),
                          ]
                        ),

                        Container(
                            width: width,
                            height: 100,
                            margin: const EdgeInsets.only(left: 25, right: 25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:const Color(0xFFebf8fd),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius:40,
                                    backgroundImage: NetworkImage(
                                       Get.arguments['photo'].toString()
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Get.arguments['title'].toString(),
                                          style: const TextStyle(
                                              color:Color(0xFF3b3f42),
                                              fontSize: 16,
                                              decoration: TextDecoration.none
                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        const Text(
                                          "Top Level",
                                          style: TextStyle(
                                              color:Colors.red,
                                              fontSize: 12,
                                              decoration: TextDecoration.none
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),


                        Container(
                            margin: const EdgeInsets.only(top: 10,left: 25, right: 25),
                            width:width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFfcfffe),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 10),
                                  color: Colors.grey.withOpacity(0.2)
                                )
                              ]
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(left: 20,top: 20, bottom: 20, right: 20),
                              child: Column(
                                children: [
                                  Container(
                                        child:Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                Get.arguments['description'].toString(),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  const SizedBox(height: 10,),
                                  const Divider(thickness: 1.0,),
                                  const SizedBox(height: 10,),
                                  Row(
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
                                            children: const [
                                              Text( "التاريخ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:Color(0xFF303030),
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
                                            children: const [
                                              Text( "Text",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:Color(0xFF303030),
                                                    fontWeight: FontWeight.w700
                                                ),
                                              ),
                                            ],
                                          )
                                        ],),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.star,
                                              color:Color(0xFFfbc33e)),
                                          const SizedBox(width: 5,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text("التقيم",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color:Color(0xFF303030),
                                                    fontWeight: FontWeight.w700
                                                ),
                                              ),
                                            ],
                                          )
                                        ],)
                                    ],
                                  )
                                ],
                              ),

                            ),
                          ),

                        //image

                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                                width: AppConst.kWidth,
                                height: AppConst.kHeight*0.6,
                                color:Colors.transparent,
                                child:Image(
                                  image: NetworkImage(
                                      Get.arguments['photo'].toString()
                                  ),
                                )
                                ),
                        ),
                          ],
                        )
                ),
              ),
            ),

        ),
      );


  }
}
