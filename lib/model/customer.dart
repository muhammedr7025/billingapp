import 'package:billingapp/model/cart.dart';
import 'package:billingapp/model/sales.dart';
import 'package:flutter/material.dart';

class Customer with ChangeNotifier {
  int totalSale = 0;
  double totalPurchasePrice = 0;
  String? uniqueId;
  String? custName;
  int? mobno;
  double? credit;
  List<Sales>? bills = [];
  List<Cart>? cart = [];
  Customer({
    this.custName,
    this.mobno,
    this.credit,
    this.bills,
    this.uniqueId,
    this.cart,
  });
}
