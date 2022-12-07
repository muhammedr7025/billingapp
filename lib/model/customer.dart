import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:billingapp/model/cart.dart';
import 'package:billingapp/model/sales.dart';

class Customer with ChangeNotifier {
  int totalSale = 0;
  double? totalPurchasePrice = 0;
  String? uniqueId;
  String? custName;
  int? mobno;
  double? credit;
  List<Sales>? bills = [];
  List<Cart>? cart = [];
  Customer({
    this.totalSale = 0,
    this.totalPurchasePrice,
    this.uniqueId,
    this.custName,
    this.mobno,
    this.credit,
    this.bills,
    this.cart,
  });
  Map<String, dynamic> toMap() {
    return {
      'totalSale': totalSale,
      'totalPurchasePrice': totalPurchasePrice,
      'uniqueId': uniqueId,
      'custName': custName,
      'mobno': mobno,
      'credit': credit,
      'bills': bills?.map((x) => x.toMap()).toList(),
      'cart': cart?.map((x) => x.toMap()).toList(),
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      totalSale: map['totalSale']?.toInt() ?? 0,
      totalPurchasePrice: map['totalPurchasePrice']?.toDouble() ?? 0.0,
      uniqueId: map['uniqueId'],
      custName: map['custName'],
      mobno: map['mobno']?.toInt(),
      credit: map['credit']?.toDouble(),
      bills: map['bills'] != null
          ? List<Sales>.from(map['bills']?.map((x) => Sales.fromMap(x)))
          : null,
      cart: map['cart'] != null
          ? List<Cart>.from(map['cart']?.map((x) => Cart.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(totalSale: $totalSale, totalPurchasePrice: $totalPurchasePrice, uniqueId: $uniqueId, custName: $custName, mobno: $mobno, credit: $credit, bills: $bills, cart: $cart)';
  }
}
