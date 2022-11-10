import 'package:billingapp/model/customer.dart';
import 'package:flutter/material.dart';

class CustomerProvider with ChangeNotifier {
  List<Customer> _savedCustomer = [
    Customer(custName: 'Muhammed r', mobno: 7025662019, credit: 0)
  ];
  List<Customer> get savedCustomerList {
    return [..._savedCustomer];
  }

  int get customerLength {
    return _savedCustomer.length;
  }

  Future<void> saveCustomer(Customer customer) async {
    _savedCustomer.add(Customer(
        custName: customer.custName,
        credit: customer.credit,
        mobno: customer.mobno));
  }
}
