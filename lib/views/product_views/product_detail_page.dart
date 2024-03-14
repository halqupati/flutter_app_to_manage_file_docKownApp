import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/models/report_model.dart';

import '../../models/product_model.dart';
import 'content_page.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  @override
  Widget build(BuildContext context) {

    //Get product data from recent page as arguments
    Product productData = Get.arguments;


    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    int _currentIndex  = 0;

    return
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Container(
              color: AppConst.kBkDark,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: Column(
                      children: [
                        //appBarView
                        Row(
                          children:[
                            IconButton(
                              onPressed: ()=>Get.back(), icon: const Icon(Icons.arrow_back_ios),color: AppConst.kGoldenGate,
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
                                    radius:40,
                                    backgroundImage: NetworkImage(
                                      productData.photo.toString()
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                         productData.name.toString(),
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
                                                "الماركة" + " : " +
                                                productData.brand.toString(),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  Container(
                                      child:Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "المنشاء" + " : " +
                                                  productData.pro_origin.toString(),
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
                                              "الملاحظات" + " : " +
                                                  productData.description.toString(),
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
                                              Text(productData.reportdata!.length.toString(),
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
                                              Text(productData.reportdata!.length.toString(),
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
                                              const Text( "تقيم ",
                                                style:  TextStyle(
                                                    fontSize: 16,
                                                    color:Color(0xFF303030),
                                                    fontWeight: FontWeight.w700
                                                ),
                                              ),


                                            Text(productData.reportdata!
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

                        //reportView
                        Padding(padding: EdgeInsets.only(top: 5)),
                        ListView.builder(
                            itemCount: productData.reportdata!.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              if (productData.reportdata!.length != null){
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
                                            ),
                                            //trailing: Icon(Icons.keyboard_arrow_right),
                                            title: Container(
                                              padding: EdgeInsets.all(1),
                                              margin: EdgeInsets.all(1),
                                            ),
                                            subtitle: Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          productData
                                                              .reportdata![
                                                          index]
                                                              .reportNum
                                                              .toString(),
                                                          style:
                                                          const TextStyle(
                                                            fontFamily: 'Cairo',
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          )),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              right: 10)),
                                                      Text(
                                                          productData
                                                              .reportdata![
                                                          index]
                                                              .reportDate
                                                              .toString(),
                                                          style:
                                                          const TextStyle(
                                                            fontFamily: 'Cairo',
                                                            fontSize: 14,
                                                          )),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              right: 10)),
                                                      Text(productData
                                                          .reportdata![
                                                      index]
                                                          .reportResult
                                                          .toString() ==
                                                          'CF'
                                                          ? 'مطابق'
                                                          : 'غير مطابق'),
                                                      Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              right: 10)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: Text(productData
                                                            .reportdata![index]
                                                            .description
                                                            .toString()),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )),
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
                        //imageView
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Container(
                                width: 390,
                                child:Image(
                                  image: NetworkImage(
                                      productData.photo.toString()
                                  ),
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
