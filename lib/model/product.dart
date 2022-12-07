import 'dart:convert';

import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String? productName;
  String? uniqueId;
  String? productCode;
  String? stockDate;
  int? stockCount;
  double? price;
  Product({
    this.productName,
    this.uniqueId,
    this.productCode,
    this.stockDate,
    this.stockCount,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'uniqueId': uniqueId,
      'productCode': productCode,
      'stockDate': stockDate,
      'stockCount': stockCount,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productName: map['productName'],
      uniqueId: map['uniqueId'],
      productCode: map['productCode'],
      stockDate: map['stockDate'],
      stockCount: map['stockCount']?.toInt(),
      price: map['price']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(productName: $productName, uniqueId: $uniqueId, productCode: $productCode, stockDate: $stockDate, stockCount: $stockCount, price: $price)';
  }
}
