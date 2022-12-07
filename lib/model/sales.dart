import 'dart:convert';
import 'package:billingapp/model/cart.dart';

class Sales {
  String? custId;
  String? uniqueId;
  String? custName;
  String? billNo;
  List<Cart>? cartItems = [];
  DateTime? dateOfSale;
  double? totalPrice;
  double? byCash;
  double? credit;
  double? salePrice;
  double? discount;
  Sales({
    this.custId,
    this.uniqueId,
    this.custName,
    this.billNo,
    this.cartItems,
    this.dateOfSale,
    this.totalPrice,
    this.byCash,
    this.credit,
    this.salePrice,
    this.discount,
  });

  Map<String, dynamic> toMap() {
    return {
      'custId': custId,
      'uniqueId': uniqueId,
      'custName': custName,
      'billNo': billNo,
      'cartItems': cartItems?.map((x) => x.toMap()).toList(),
      'dateOfSale': dateOfSale?.millisecondsSinceEpoch,
      'totalPrice': totalPrice,
      'byCash': byCash,
      'credit': credit,
      'salePrice': salePrice,
      'discount': discount,
    };
  }

  factory Sales.fromMap(Map<String, dynamic> map) {
    return Sales(
      custId: map['custId'],
      uniqueId: map['uniqueId'],
      custName: map['custName'],
      billNo: map['billNo'],
      cartItems: map['cartItems'] != null
          ? List<Cart>.from(map['cartItems']?.map((x) => Cart.fromMap(x)))
          : null,
      dateOfSale: map['dateOfSale'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateOfSale'])
          : null,
      totalPrice: map['totalPrice']?.toDouble(),
      byCash: map['byCash']?.toDouble(),
      credit: map['credit']?.toDouble(),
      salePrice: map['salePrice']?.toDouble(),
      discount: map['discount']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sales.fromJson(String source) => Sales.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sales(custId: $custId, uniqueId: $uniqueId, custName: $custName, billNo: $billNo, cartItems: $cartItems, dateOfSale: $dateOfSale, totalPrice: $totalPrice, byCash: $byCash, credit: $credit, salePrice: $salePrice, discount: $discount)';
  }
}
