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

  void saveCustomer(Customer customer) {
    final newCustomer = Customer(
        custName: customer.custName,
        credit: customer.credit,
        mobno: customer.mobno,
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

  Customer findCustomer(uid) {
    final index =
        _savedCustomer.indexWhere((element) => uid == element.uniqueId);
    return _savedCustomer[index];
  }

  Future<void> newSaleAdded(
      {required Customer customer,
      required double? newCredit,
      required double price}) async {
    final index = _savedCustomer.indexWhere((element) => customer == element);
    _savedCustomer[index].credit = (_savedCustomer[index].credit)! + newCredit!;
    _savedCustomer[index].totalPurchasePrice =
        (_savedCustomer[index].totalPurchasePrice!) + price;
    _savedCustomer[index].totalSale++;
    notifyListeners();
  }

  void customerCart(Customer customer) {}
}
