import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:billingapp/model/product.dart';

class Cart with ChangeNotifier {
  Product? item;
  int? itemCount;
  double totalPrice;
  Cart({
    this.item,
    this.itemCount,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      'item': item?.toMap(),
      'itemCount': itemCount,
      'totalPrice': totalPrice,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      item: map['item'] != null ? Product.fromMap(map['item']) : null,
      itemCount: map['itemCount']?.toInt(),
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() =>
      'Cart(item: $item, itemCount: $itemCount, totalPrice: $totalPrice)';
}
