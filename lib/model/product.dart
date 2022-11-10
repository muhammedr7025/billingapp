import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String? productName;
  String? productCode;
  String? stockDate;
  int? stockCount;
  double? price;
  Product(
      {this.productName,
      this.productCode,
      this.stockCount,
      this.stockDate,
      this.price});
}
