import 'package:flutter/material.dart';

import '../model/customer.dart';

class CustomerProvider with ChangeNotifier {
  final List<Customer> _savedCustomer = [
    Customer(custName: 'Muhammed r', mobno: 7025662019, credit: 0)
  ];
  List<Customer> get savedCustomerList => _savedCustomer;

  void saveCustomer(Customer customer) {
    final newCustomer = Customer(
        custName: customer.custName,
        credit: customer.credit,
        mobno: customer.mobno);
    _savedCustomer.add(newCustomer);
    notifyListeners();
  }

  Future<void> editCredit({required Customer customer, double? credit}) async {
    final index = _savedCustomer.indexWhere((element) => customer == element);
    _savedCustomer[index].credit = credit;

    notifyListeners();
  }
}
