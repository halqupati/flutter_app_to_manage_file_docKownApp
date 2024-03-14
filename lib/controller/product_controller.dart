import 'package:get/get.dart';
import 'package:getx_app/models/product_model.dart';
import '../network//products_api.dart';
import '../models/note_model.dart';

class ProductController extends GetxController{
  var productList = <Product>[].obs;
  var orignalProductList = <Product>[].obs;
  var loading = true.obs;


  @override
  void onInit(){
    getProductsData();
    super.onInit();
  }

  void getProductsData() async {
    var data = await ProductServices().fetchProducts();
    if ( data.length>0){
      print("data is not null");
      productList.clear();
      loading(false);
      productList.addAll(data);
      orignalProductList.addAll(data);
    }
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