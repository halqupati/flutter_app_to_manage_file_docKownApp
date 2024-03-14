import 'report_model.dart';
import 'dart:convert';

class Product {
  int? id;
  String? name;
  String? tage_categories;
  String? brand;
  String? pro_origin;
  String? description;
  String? photo;
  List<Report>? reportdata;

  Product(
      {this.id,
        this.name,
        this.tage_categories,
        this.brand,
        this.pro_origin,
        this.description,
        this.photo,
        this.reportdata});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tage_categories = json['tage_categories'];
    brand = json['brand'];
    pro_origin = json['pro_origin'];
    description = json['description'];
    photo = json['photo'];
    reportdata=List<Report>.from(json['reportsByProduct']?.map((e)=>Report.fromJson(e)) ?? []);
  }

  factory Product.fromMap(Map<String, dynamic> json)  => Product(
    id: json['id'],
    name: json['name'],
    tage_categories: json['tage_categories'],
    brand: json['brand'],
    pro_origin: json['pro_origin'],
    description: json['description'],
    photo: json['photo'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['tage_categories'] = this.tage_categories;
    data['brand'] = this.brand;
    data['pro_origin'] = this.pro_origin;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['reportsByProduct'] = List<dynamic>.from(reportdata!.map((e) => e.toJson()));
    return data;
  }
}
