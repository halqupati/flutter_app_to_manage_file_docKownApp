import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContest extends StatefulWidget {
  const RecentContest({Key? key}) : super(key: key);

  @override
  State<RecentContest> createState() => _RecentContestState();
}

class _RecentContestState extends State<RecentContest> {

  List info=[];
  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/detail.json").then((s) => {
      setState((){
        info = json.decode(s);
      })
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFcbe6f6),
      body:Container(
        margin: const EdgeInsets.only(left: 20,top:100,right: 10),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for(int i=0;i<info.length;i++)
                      Container(
                        height: 220,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                                onTap: (){
                                  Get.toNamed("/detail",arguments: {
                                    'title':info[i]['title'].toString(),
                                    'text':info[i]['text'].toString(),
                                    'name':info[i]['name'].toString(),
                                    'img':info[i]['img'].toString(),
                                    'time':info[i]['time'].toString(),
                                    'price':info[i]['prize'].toString()
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20, top: 20),
                                  height: 220,
                                  width: MediaQuery.of(context).size.width-20,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color:i.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                          child:Row(
                                            children: [
                                              Text(
                                                info[i]['title'],
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w500,
                                                    color:Colors.white
                                                ),
                                              ),
                                              Expanded(child: Container())
                                            ],
                                          )
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        child: Text(
                                          info[i]['text'],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color:Color(0xFFb8eefc)
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      const Divider(thickness: 1.0,),
                                      Row(
                                          children:[
                                            Container(

                                              width: 50,
                                              height: 50,
                                              child: Container(

                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(25),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            info[i]['img']
                                                        ),
                                                        fit: BoxFit.cover
                                                    )
                                                ),
                                              ),
                                            )
                                          ]
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ),
                    ],
                  ),
                ))
          ],
        ),
      )
    );
  }
}
