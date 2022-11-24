import 'package:billingapp/model/sales.dart';
import 'package:flutter/material.dart';

class Customer with ChangeNotifier {
  String? uniqueId;
  String? custName;
  int? mobno;
  double? credit;
  List<Sales>? bills = [];
  Customer({this.custName, this.mobno, this.credit, this.bills, this.uniqueId});
}
