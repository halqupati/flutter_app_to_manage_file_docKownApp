import 'dart:convert';
import 'product_model.dart';

class Report {
  int? id;
  String? productName;
  int? reportNum;
  String? reportDate;
  String? reportResult;
  String? reportResultType;
  String? description;
  List<Product>? reportProduct;

  Report(
      {this.id,
        this.productName,
        this.reportNum,
        this.reportDate,
        this.reportResult,
        this.reportResultType,
        this.description,
        this.reportProduct});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product'];
    reportNum = json['report_number'];
    reportDate = json['report_date'];
    reportResult = json['result'];
    reportResultType = json['result_type'];
    description = json['description'];
    reportProduct=List<Product>.from(json['reportsByProduct']?.map((e)=>Product.fromJson(e)) ?? []);
  }

  factory Report.fromMap(Map<String, dynamic> json)  => Report(
    id: json['id'],
    productName: json['product'],
    reportNum: json['report_number'],
    reportDate: json['report_date'],
    reportResult: json['result'],
    reportResultType: json['result_type'],
    description: json['description'],

  );


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.productName;
    data['report_num'] = this.reportNum;
    data['report_date'] = this.reportDate;
    data['result'] = this.reportResult;
    data['result_type'] = this.reportResultType;
    data['description'] = this.description;
    return data;
  }
}
