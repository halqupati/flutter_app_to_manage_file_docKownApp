import 'dart:convert';

import 'package:getx_app/models/product_model.dart';
import 'package:getx_app/network/api_constants.dart';
import 'package:http/http.dart' as http;

class ProductServices{

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.productsEndpoint));
    if (response.statusCode == 200){
      final parsed = jsonDecode(utf8.decode(response.bodyBytes)).cast<Map<String,dynamic>>();
      return parsed.map<Product>((json) => Product.fromJson(json)).toList();
    }else{
      print(response.statusCode);
      print("error to fetch Product Api");
      throw Exception("Failed to load Notes data");
    }
  }
}