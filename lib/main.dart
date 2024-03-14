import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_app/features/auth/pages/login_page.dart';
import 'package:getx_app/views/content_page.dart';
import 'package:getx_app/views/note_views/add_note_page.dart';
import 'package:getx_app/views/note_views/edit_note_page.dart';
import 'package:getx_app/views/note_views/note_detail_page.dart';
import 'package:getx_app/views/note_views/recent_notes_contest.dart';
import 'package:getx_app/views/product_views/product_detail_page.dart';
import 'package:getx_app/views/product_views/recent_products_contest.dart';
import 'package:getx_app/views/tamum_views/recent_tamum_contest.dart';
import 'package:getx_app/views/tamum_views/tumum_detail_page.dart';
import 'views/my_home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: '/contentPage',
          getPages: [
            GetPage(name: '/', page: ()=>MyHomePage()),

            GetPage(name: '/login', page: ()=>LoginPage()),

            GetPage(name: '/contentPage', page: ()=>ContentPage()),

            GetPage(name: '/recentNote', page: ()=>RecentNotesContest()),
            GetPage(name: '/listPoducts', page: ()=>RecentProductsContest()),
            GetPage(name: '/listTamums', page: ()=>RecentTaumumContest()),

            GetPage(name: '/productdetail', page: ()=>ProductDetailPage()),
            GetPage(name: '/tamumdetail', page: ()=>TamumDetailPage()),
            GetPage(name: '/noteDetail', page: ()=>NoteDetailPage()),

            GetPage(name: '/addnote', page: ()=>AddNotePage()),

            GetPage(name: '/editNotePage', page: ()=>EditNotePage()),

      ],
    );
  });
  }
}
