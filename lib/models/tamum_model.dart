
import 'dart:convert';
import 'package:getx_app/models/product_model.dart';

import 'merchant_model.dart';

class Tamum {
  int? id;
  int? tamumNum;
  String? tamumDate;
  String? tamumField;
  String? tamumType;
  String? description;
  String? violation;
  String? action;
  String? issuer;
  String? photo;
  String? docFile;
  List<Merchant>? tamumMerchants;
  List<dynamic>? tamumProducts;

  Tamum(
      {this.id,
        this.tamumNum,
        this.tamumDate,
        this.tamumField,
        this.tamumType,
        this.description,
        this.violation,
        this.action,
        this.issuer,
        this.photo,
        this.docFile,
        this.tamumMerchants,
        this.tamumProducts});

  Tamum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tamumNum = json['tamum_num'];
    tamumDate = json['tamum_date'];
    tamumField = json['tamum_field'];
    tamumType = json['tamum_type'];
    description = json['description'];
    violation = json['violation'];
    action = json['Tamum_action'];
    issuer = json['issuer_link'];
    photo = json['photo'];
    docFile = json['docfile'];
    tamumMerchants=List<Merchant>.from(json['marchants']?.map((e)=>Merchant.fromJson(e)) ?? []);
    tamumProducts=json['products'];

  }

  factory Tamum.fromMap(Map<String, dynamic> json)  => Tamum(
    id: json['id'],
    tamumNum: json['tamum_num'],
    tamumDate: json['tamum_date'],
    tamumField: json['tamum_field'],
    tamumType: json['tamum_type'],
    description: json['description'],
    violation: json['violation'],
    action: json['Tamum_action'],
    issuer: json['issuer_link'],

  );


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tamum_num'] = this.tamumNum;
    data['tamum_date'] = this.tamumDate;
    data['tamum_field'] = this.tamumField;
    data['tamum_type'] = this.tamumType;
    data['description'] = this.description;
    data['violation'] = this.violation;
    data['Tamum_action'] = this.action;
    data['issuer_link'] = this.issuer;
    data['photo'] = this.photo;
    return data;
  }
}