import 'dart:developer';

import 'package:billingapp/provider/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../model/customer.dart';

class CustomerProvider with ChangeNotifier {
  List<Customer> _savedCustomer = [];
  final db = FirestoreService();
  Stream<List<Customer>> getCustomerList() {
    return db.getCustomers();
  }

  Future<void> saveCustomer(Customer customer) async {
    customer.credit ??= 0;
    final newCustomer = Customer(
        custName: customer.custName,
        credit: customer.credit,
        mobno: customer.mobno,
        totalPurchasePrice: 0,
        uniqueId: const Uuid().v4());
    _savedCustomer.add(newCustomer);
    db.saveCustomer(newCustomer);

    notifyListeners();
  }

  Future<void> editCredit({required Customer customer, double? credit}) async {
    final index = _savedCustomer.indexWhere((element) => customer == element);
    _savedCustomer[index].credit = credit;

    notifyListeners();
  }

  Future<List> filterCustomer(String keyWord) async {
    List<Customer> filteredList = _savedCustomer
        .where((element) =>
            element.custName!.toLowerCase().contains(keyWord) ||
            element.mobno!.toString().toLowerCase().contains(keyWord))
        .toList();
    return filteredList;
  }

  Future<Customer> findCustomer(uid) async {
    return await db.findCustomer(uid);
  }

  Future<void> newSaleAdded(
      {required Customer customer,
      required double newCredit,
      required double price}) async {
    log('new credit => $newCredit');
    double credit = (customer.credit ?? 0.0) + newCredit;
    log('credit value => $credit');
    double totalPurchasePrice = (customer.totalPurchasePrice ?? 0) + price;
    int totalSale = customer.totalSale + 1;
    final updatedCustomer = customer.copyWith(
        credit: credit,
        totalPurchasePrice: totalPurchasePrice,
        totalSale: totalSale);
    print('customer credit value =>${updatedCustomer.credit}');
    print('customer credit value =>${updatedCustomer.totalPurchasePrice}');
    db.saleCustomerUpdation(customer: updatedCustomer);
    notifyListeners();
  }

  void customerCart(Customer customer) {}
}
