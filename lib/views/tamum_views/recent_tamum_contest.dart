import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/controller/tamum_controller.dart';
import 'package:getx_app/models/tamum_model.dart';


class RecentTaumumContest extends StatefulWidget {
  const RecentTaumumContest({Key? key}) : super(key: key);

  @override
  State<RecentTaumumContest> createState() => _RecentTaumumContestState();
}

class _RecentTaumumContestState extends State<RecentTaumumContest> {

  final tamumController =Get.find<TamumController>();

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConst.kOuterSpace,
          title: Text("قائمة تعاميم" + ' ( ' + tamumController.tamumList.length.toString()  + ' )'),
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
                    showSearch(
                      context: context,
                      delegate: CustomSearchTamumDelegate(),);
                  },
                  icon:Icon(Icons.search)),
            )
          ],
        ),
        body:Container(
          padding: EdgeInsets.only(top: 10),
          color: AppConst.kDimGray,
          child: Column(
            children: [
              Flexible (
                fit: FlexFit.loose,
                child:  Container(
                  margin: const EdgeInsets.only(left: 10,right: 10),
                      child:ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: tamumController.tamumList.length,
                          itemBuilder: (_,index){
                            Tamum data = tamumController.tamumList[index];
                            return Container(
                            height: 200,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                              onTap: (){
                                Get.toNamed("/tamumdetail",arguments:data);
                              },
                              child: Container(
                                padding: const EdgeInsets.only(right:10,left: 10, top: 10),
                                height: 200,
                                width: MediaQuery.of(context).size.width-20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color:AppConst.kMidnightGreen
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        child:Row(
                                          children: [
                                            Container(
                                              child: CircleAvatar(
                                                child: Text('${index + 1}'),
                                                backgroundColor: AppConst.kGoldenGate,
                                              ),
                                            ),
                                            const SizedBox(width: 5,),
                                            Expanded(
                                              child: Text(
                                                data.tamumNum.toString() + "  " + data.tamumDate.toString() + "  " + data.tamumType.toString() + " " +data.tamumField.toString(),
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
                                      child: ListView.builder(
                                          itemCount: data.tamumMerchants!.length,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int i) {
                                            if (data.tamumMerchants!.length != null){
                                              return  Container(
                                                color: Colors.white54,
                                                child: ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundColor:AppConst.kOuterSpace,
                                                    child: Text('${i + 1}'),
                                                  ),
                                                  //trailing: Icon(Icons.keyboard_arrow_right),
                                                  title: Text(
                                                      data.tamumMerchants![i].name.toString(),
                                                      style: const TextStyle(
                                                        fontFamily: 'Cairo',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                      )),
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
                                    ),



                                    const SizedBox(height:5),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 10),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "عداد التقارير" + ' : ' + data.tamumMerchants!.length.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:AppConst.kGoldenGate
                                            ),
                                          ),
                                          const SizedBox(width:10),
                                          Text(
                                            "عداد تعاميم" + ' : ' + data.tamumMerchants!.length.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:AppConst.kGoldenGate
                                            ),
                                          ),
                                          const SizedBox(width:10),
                                          Text(
                                            "نتيجة تقرير" + ' : ' + data.tamumMerchants!.length.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:AppConst.kGoldenGate
                                            ),
                                          ),
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


class CustomSearchTamumDelegate extends SearchDelegate {

  List<Tamum> searchTamumList =Get.find<TamumController>().tamumList;
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
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Tamum> matchQuery = [];
    for(var tamum in searchTamumList){
      if(tamum.tamumMerchants!.any((sub) => sub.name.toLowerCase().contains(query.toLowerCase())) ||
          tamum.tamumNum!.toString().contains(query.toLowerCase()) ||
          tamum.tamumProducts!.any((sub) =>
          sub.toString().toLowerCase().contains(query.toLowerCase()))
          ) {
        matchQuery.add(tamum);
      }
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: matchQuery.length,
                  itemBuilder: (context,index){
                    var result = matchQuery[index];
                    return Container(
                      color: Colors.teal,
                      child: ListTile(
                        title: SizedBox(
                          height: 40,
                          child: TextButton(
                            onPressed: (){
                              Get.toNamed("/",arguments:result);
                            },
                            child:Text(result.tamumNum.toString() +
                                " _ " + result.tamumDate.toString() +
                                " _ " + result.tamumType.toString() +
                                " _ " + result.tamumField.toString()+
                                " _ " + result.tamumProducts.toString(),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),),
                        ),
                        subtitle: SizedBox(
                          height: 50,
                          child: ListView.builder(
                              itemCount: matchQuery[index].tamumMerchants!.length,
                              itemBuilder: (context,index2){
                                var result2 = matchQuery[index].tamumMerchants![index2];
                                return ListTile(
                                  title: Text(result2.name.toString()),
                                );
                              }),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Tamum> matchQuery = [];
    for(var tamum in searchTamumList){
      if(tamum.tamumMerchants!.any((sub) => sub.name.toLowerCase().contains(query.toLowerCase())) ||
          tamum.tamumNum!.toString().contains(query.toLowerCase()) ||
          tamum.tamumProducts!.any((sub) =>
              sub.toString().toLowerCase().contains(query.toLowerCase()))
      ) {
          matchQuery.add(tamum);
      }
    }

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 600,
                child: ListView.builder(
                    itemCount: matchQuery.length,
                    itemBuilder: (context,index){
                      var result = matchQuery[index];
                      return Container(
                        color: Colors.grey,
                        margin: EdgeInsets.only(bottom: 5),
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed("/tamumdetail",arguments:result);
                          },
                          child: ListTile(
                            title: SizedBox(
                              height: 40,
                              child: Text(result.tamumNum.toString() +
                                    " _ " + result.tamumDate.toString() +
                                    " _ " + result.tamumType.toString() +
                                    " _ " + result.tamumField.toString()+
                                    " _ " + result.tamumProducts.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                ),
                              ),
                            subtitle: SizedBox(
                              height: 50,
                              child: ListView.builder(
                                  itemCount: matchQuery[index].tamumMerchants!.length,
                                  itemBuilder: (context,index2){
                                    var result2 = matchQuery[index].tamumMerchants![index2];
                                    return ListTile(
                                        title: Text(result2.name.toString()),
                                      );
                                    }),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      );
  }

}


