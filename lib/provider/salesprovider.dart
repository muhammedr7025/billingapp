import 'package:billingapp/model/customer.dart';
import 'package:billingapp/model/sales.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:billingapp/provider/firestore_service.dart';

import '../model/cart.dart';

class SalesProvider with ChangeNotifier {
  final db = FirestoreService();

  final List<Sales> _savedBills = [];
  Stream<List<Sales>> get savedBillList {
    return db.getSales();
  }

  void createSale(
      {required List<Cart> cartitem,
      required double totalPrice,
      required double discount,
      required double credit,
      required double finalPrice,
      required Customer customer,
      required double byCash}) {
    Sales newSale = Sales(
        billNo: _savedBills.length.toString(),
        custName: customer.custName,
        cartItems: cartitem,
        credit: credit,
        totalPrice: totalPrice,
        uniqueId: const Uuid().v4(),
        byCash: byCash,
        salePrice: totalPrice,
        dateOfSale: DateTime.now(),
        custId: customer.uniqueId,
        discount: discount);
    _savedBills.add(newSale);
    db.saveSale(newSale);
  }
}
