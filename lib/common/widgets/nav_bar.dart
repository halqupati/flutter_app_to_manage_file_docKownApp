
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/views/note_views/recent_notes_contest.dart';
import 'package:getx_app/views/product_views/recent_products_contest.dart';
import 'package:getx_app/views/tamum_views/recent_tamum_contest.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: AppConst.kOuterSpace,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName:  Text("Hussien Arif"),
            accountEmail:  Text("hudurah737@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child:Image.asset("img/user1.JPG") ,
              ),
            ),
            decoration:const BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('img/background2.jpg'),fit: BoxFit.cover)
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('الصفحة الرئيسية',style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.toNamed('/contentPage',arguments: 'me');
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('قائمة المنتجات',style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.to(()=>const RecentProductsContest());
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_sharp),
            title: const Text('قائمة التقارير',style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.to(()=>const RecentProductsContest());
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_online),
            title: const Text('قائمة تعاميم',style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.to(()=>const RecentTaumumContest());
            },
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title: const Text('قائمة الملاحظات',style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.to(()=>const RecentNotesContest());
            },
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('الاعدادات',style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.to(()=>const RecentNotesContest());
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('الخروج',style: TextStyle(color: Colors.white)),
            onTap: () {
              Get.to(()=>const RecentNotesContest());
            },
          ),
        ],
      ),
    );
  }
}
