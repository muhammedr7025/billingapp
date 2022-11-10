import 'package:billingapp/model/customer.dart';
import 'package:flutter/material.dart';

class CustomerProvider with ChangeNotifier {
  List<Customer> _savedCustomer = [];
}
