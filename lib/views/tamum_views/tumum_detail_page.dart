import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/common/widgets/pdf_viewer_page.dart';
import 'package:getx_app/common/widgets/showDialogue.dart';
import 'package:getx_app/controller/tamum_controller.dart';
import '../../models/tamum_model.dart';


class TamumDetailPage extends StatefulWidget {
  const TamumDetailPage({Key? key}) : super(key: key);

  @override
  _TamumDetailPageState createState() => _TamumDetailPageState();
}

class _TamumDetailPageState extends State<TamumDetailPage> {

  @override
  Widget build(BuildContext context) {

    //Get product data from recent page as arguments
    Tamum tamumData = Get.arguments;



    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    int _currentIndex  = 0;

    return
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Container(
              color: AppConst.kOuterSpace,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Column(
                      children: [
                        //appBarView
                        Row(
                          children:[
                            IconButton(
                              onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios,color: AppConst.kGoldenGate,),
                            ),
                          ]
                        ),

                        //productHeaderView
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
                                    radius:30,
                                    child: Text(tamumData.tamumNum.toString()),
                                    backgroundColor: AppConst.kMidnightGreen,
                                  ),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        tamumData.tamumDate.toString() + "  " + tamumData.tamumField.toString(),
                                          style: const TextStyle(
                                              color:Color(0xFF3b3f42),
                                              fontSize: 14,
                                              decoration: TextDecoration.none
                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text(
                                            tamumData.tamumType.toString(),
                                          style: const TextStyle(
                                              color:Colors.red,
                                              fontSize: 13,
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

                        ListView.builder(
                            itemCount: tamumData.tamumProducts!.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              if (tamumData.tamumProducts!.isNotEmpty ){
                                return Container(
                                  margin: const EdgeInsets.only(bottom:5,left: 25, right: 25),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white54,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 20,
                                            spreadRadius: 1,
                                            offset: const Offset(10, 10),
                                            color: Colors.grey.withOpacity(0.2)
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white54,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 20,
                                                  spreadRadius: 1,
                                                  offset: const Offset(10, 10),
                                                  color: Colors.grey.withOpacity(0.2)
                                              )
                                            ]
                                        ),
                                        child: ListTile(
                                            leading: CircleAvatar(
                                              child: Text('${index + 1}'),
                                              backgroundColor: AppConst.kOuterSpace,
                                            ),
                                            //trailing: Icon(Icons.keyboard_arrow_right),
                                            title:  Text(
                                                tamumData.tamumProducts![index].toString(),
                                                style:const TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontSize: 14,
                                                  fontWeight:FontWeight.bold,
                                                )),
                                      ),),
                                    ],
                                  ),
                                );
                              }
                              else{
                                return Container(
                                  child: Column(
                                    children: [
                                      Card(
                                        child:Text('لا يوجد اي تقرير للمنتج'),
                                        color: AppConst.kOuterSpace,
                                      ),
                                    ],
                                  ),
                                );
                              }

                            }),
                        ListView.builder(
                            itemCount: tamumData.tamumMerchants!.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              if (tamumData.tamumMerchants!.length != null){
                                return Container(
                                  margin: const EdgeInsets.only(bottom:5,left: 25, right: 25),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white54,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 20,
                                            spreadRadius: 1,
                                            offset: const Offset(10, 10),
                                            color: Colors.grey.withOpacity(0.2)
                                        )
                                      ]
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.white54,
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 20,
                                                  spreadRadius: 1,
                                                  offset: const Offset(10, 10),
                                                  color: Colors.grey.withOpacity(0.2)
                                              )
                                            ]
                                        ),
                                        child: ListTile(
                                            leading: CircleAvatar(
                                              child: Text('${index + 1}'),
                                              backgroundColor: AppConst.kOuterSpace,
                                            ),
                                            //trailing: Icon(Icons.keyboard_arrow_right),
                                            title:Text(
                                                tamumData.tamumMerchants![index].name.toString(),
                                                style:
                                                const TextStyle(
                                                  fontFamily: 'Cairo',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                           ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              else{
                                return Container(
                                  child: Column(
                                    children: [
                                      Card(
                                        child:Text('لا يوجد اي تقرير للمنتج'),
                                        color: Colors.white54,
                                      ),
                                    ],
                                  ),
                                );
                              }

                            }),
                        //productdetailView
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
                                                " جهةالاصدار " + " : " + tamumData.issuer.toString(),
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
                                  Container(
                                      child:Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "نص الري الفني" + " : " + tamumData.violation.toString(),
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
                                  Container(
                                      child:Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "الملاحظات" + " : " + tamumData.description.toString(),
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
                                            children: [
                                              const Text( "عداد التقارير",
                                                style:  TextStyle(
                                                    fontSize: 16,
                                                    color:Color(0xFF303030),
                                                    fontWeight: FontWeight.w700
                                                ),
                                              ),
                                              Text(tamumData.tamumMerchants!.length.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color:Color(0xFFacacac)
                                                ),
                                              )
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
                                              const Text( "عداد تعاميم",
                                                style:  TextStyle(
                                                    fontSize: 16,
                                                    color:Color(0xFF303030),
                                                    fontWeight: FontWeight.w700
                                                ),
                                              ),
                                              Text(tamumData.tamumMerchants!.length.toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color:Color(0xFFacacac)
                                                ),
                                              )
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
                                            children: [
                                              const Text( "تقيم",
                                                style:  TextStyle(
                                                    fontSize: 16,
                                                    color:Color(0xFF303030),
                                                    fontWeight: FontWeight.w700
                                                ),
                                              ),


                                            Text(tamumData.tamumMerchants!
                                                .length.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xFFacacac)
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

                        //productdetailView
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
                                            "  الاجراء المطلوب" + " : " + tamumData.issuer.toString(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),

                        //imageView
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                              width: 390,
                              height: 300,
                              child:TextButton(
                                  onPressed: () async {
                                    print(tamumData.docFile.toString());
                                    if(tamumData.docFile != null ){
                                      print("i am not null");
                                      final url = tamumData.docFile.toString();
                                      final file = await TamumController.loadpdf(url);
                                      openPDF(context,file);
                                    }else{
                                      print("i amnull");
                                      return
                                        showAlertDialog(
                                          context: context,
                                          message: 'لا يوجد ملف مرفق',
                                          btnText: 'close',
                                          color: AppConst.kGoldenGate,
                                        );
                                    }

                                  }, child:Text("Show PDF File"),
                                  ),
                              color:Colors.transparent
                          ),
                        ),
                      ],
                  ),
                ),
              ),
            ),
        ),
      );
  }
}

void openPDF(BuildContext context,File file) => Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => PDFViewerPage(file:file)),
);