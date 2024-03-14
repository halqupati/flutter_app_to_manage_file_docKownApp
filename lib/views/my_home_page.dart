import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_app/views/content_page.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0x8a8f91),
        body:Text("Test"),
      ),
    );
  }
}
