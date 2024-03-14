
import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_app/models/tamum_model.dart';
import 'package:getx_app/network/tamum_api.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class TamumController extends GetxController{
  var tamumList = <Tamum>[].obs;
  var orignalTamumList = <Tamum>[].obs;
  var loading = true.obs;


  @override
  void onInit(){
    getTamumsData();
    super.onInit();
  }

  void getTamumsData() async {
    var data = await TamumApiServices().fetchTamums();
    if (data.length>0){
      print("data is not null");
      tamumList.clear();
      loading(false);
      tamumList.addAll(data);
      orignalTamumList.addAll(data);
    }
  }

  static Future<File> loadpdf(String url) async{
    final responce = await http.get(Uri.parse(url));
    final bytes = responce.bodyBytes;

    return _storeFile(url,bytes);
  }

  static Future<File> _storeFile(String url,List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes,flush: true);
    return file;
  }

  /*
  void filterProduct(String productName){
    if(productName.isEmpty){
      productList = orignalProductList;
      print('in product cont');
      print("i i her");
    }else{
      var filterdProductList = productList.where((element) => element.brand.toString().toLowerCase().contains(productName.toLowerCase())).toList();
      productList.value=filterdProductList;
    }
  }
   */
}