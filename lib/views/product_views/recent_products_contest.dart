import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/controller/product_controller.dart';
import 'package:getx_app/models/product_model.dart';

import '../../controller/note_controller.dart';
import '../../models/note_model.dart';

class RecentProductsContest extends StatefulWidget {
  const RecentProductsContest({Key? key}) : super(key: key);

  @override
  State<RecentProductsContest> createState() => _RecentProductsContestState();
}

class _RecentProductsContestState extends State<RecentProductsContest> {


  final productController =Get.find<ProductController>();
  

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.kOuterSpace,
          title: Text("قائمة المنتجات" + ' ( ' + productController.productList.length.toString()  + ' )'),
          actions:<Widget>[
            Directionality(
            textDirection:TextDirection.rtl,
            child: IconButton(
              onPressed: (){
                Get.toNamed("/addnote");
              },
              icon:const Icon(Icons.add_box),color: AppConst.kGreen,),
          ),
            Directionality(
              textDirection:TextDirection.rtl,
              child: IconButton(
                  onPressed: (){
                    showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),);
                  },
                  icon:const Icon(Icons.search)),
            )
          ],
        ),
        body:Container(
          color: AppConst.kDimGray,
          padding: const EdgeInsets.only(top:10),
          child: Column(
            children: [
              Flexible (
                fit: FlexFit.loose,
                child:  Container(
                  margin: const EdgeInsets.only(left: 10,right: 10),
                      child:ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: productController.productList.length,
                          itemBuilder: (_,i){
                            Product data = productController.productList[i];
                            return Container(
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: (){
                                Get.toNamed("/productdetail",arguments:data);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(right:10,left: 10, top: 10),
                                height: 200,
                                width: MediaQuery.of(context).size.width-20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color:Colors.blueGrey
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        child:Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(25),
                                                    border: Border.all(color:AppConst.kGoldenGate),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            data.photo.toString() ),
                                                        fit: BoxFit.fill
                                                    )
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 5,),
                                            Expanded(
                                              child: Text(
                                                data.name.toString() ,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color:Colors.white
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                    const SizedBox(height:5),
                                    Expanded(
                                      child: Text(
                                        " الماركة : " + data.brand.toString()  +"  " + " المنشاء : "   + data.pro_origin.toString() ,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color:Colors.white
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height:5),

                                    //description field
                                    /*
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        data.description.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:Color(0xFFb8eefa)
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                     */

                                    const SizedBox(height:5),
                                    Container(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "عداد التقارير" + ' : ' + data.reportdata!.length.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:AppConst.kGoldenGate,
                                            ),
                                          ),
                                          const SizedBox(width:10),
                                          Text(
                                            "عداد تعاميم" + ' : ' + data.reportdata!.length.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:AppConst.kGoldenGate,
                                            ),
                                          ),
                                          const SizedBox(width:10),
                                          Row(
                                            children: [
                                              const Text("نتيجة تقرير" + ' : ',
                                                style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:AppConst.kGoldenGate,
                                                ),
                                              ) ,
                                              Text( data.reportdata!.length != 0 ? data.reportdata![0].reportResult.toString()== 'CF'
                                                  ? 'مطابق' : 'غير مطابق'
                                                  : data.reportdata!.length.toString(),
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color:AppConst.kMidnightGreen,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        );
                      })
                          ,
                    ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {

  List<Product> searchProductList =Get.find<ProductController>().productList;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query='';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed:(){
          close(context,null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];
    for(var product in searchProductList){
      if(product.brand!.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(product);
      }
    }
   return
    Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
       itemCount: matchQuery.length,
         itemBuilder: (context,index){
         var result = matchQuery[index];
         return ListTile(
           title: Text(result.name.toString()),
         );
   }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchQuery = [];
    for(var product in searchProductList){
      if(product.brand!.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(product);
      }
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context,index){
            var result = matchQuery[index];
            return ListTile(
              title: TextButton(
                onPressed: (){
                  Get.toNamed("/productdetail",arguments:result);
                },
                  child:Text(result.name.toString() + " _ " + result.brand.toString() + " _ " + result.pro_origin.toString()),
              )
            );
          }),
    );
  }

}
