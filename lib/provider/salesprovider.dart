import 'package:billingapp/model/sales.dart';
import 'package:flutter/material.dart';

class SalesProvider with ChangeNotifier {
  final List<Sales> _savedBills = [];
  List<Sales> get savedBillList {
    return [..._savedBills];
  }
}
