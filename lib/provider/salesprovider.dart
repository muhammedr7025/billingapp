import 'package:billingapp/model/bill_number.dart';
import 'package:billingapp/model/customer.dart';
import 'package:billingapp/model/product.dart';
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

  int get getlastBillNumber {
    return db.getLastBillNumber();
  }

  void createSale(
      {required List<Cart> cartitem,
      required double totalPrice,
      required double discount,
      required double credit,
      required double finalPrice,
      required Customer customer,
      required double byCash,
      required int custNum,
      required int billNumber}) {
    Sales newSale = Sales(
        billNo: billNumber.toString(),
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
    for (int i = 0; i < cartitem.length; i++) {
      Product product = cartitem[i].item!;
      product.stockCount = product.stockCount! - cartitem[i].itemCount!;
      db.updateProductCount(product);
    }
    db.saveSale(newSale);
  }
}
