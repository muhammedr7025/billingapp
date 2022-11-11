import 'package:flutter/material.dart';

import '../model/customer.dart';

class CustomerProvider with ChangeNotifier {
  final List<Customer> _savedCustomer = [
    Customer(custName: 'Muhammed r', mobno: 7025662019, credit: 0)
  ];
  List<Customer> get savedCustomerList {
    return [..._savedCustomer];
  }

  Future<void> saveCustomer(Customer customer) async {
    final newCustomer = Customer(
        custName: customer.custName,
        credit: customer.credit,
        mobno: customer.mobno);
    _savedCustomer.add(newCustomer);
    notifyListeners();
  }
}
