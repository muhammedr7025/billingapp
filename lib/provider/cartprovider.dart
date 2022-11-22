import 'dart:io';

import 'package:billingapp/model/product.dart';
import 'package:flutter/material.dart';

import '../model/cart.dart';

class Cartprovider with ChangeNotifier {
  double totalBillPrice = 0;

  final List<Cart> _cart = [];
  List<Cart> get cartDetails => _cart;
  double get totalAmoount => totalBillPrice;
  void addToCart(Product product, int itemCount) {
    final index = _cart.indexWhere((element) => product == element.item);

    if (index == -1) {
      _cart.add(Cart(item: product, itemCount: itemCount));
      final index2 = _cart.indexWhere((element) => product == element.item);
      notifyListeners();
    } else {
      _cart[index].itemCount = itemCount;
      _cart[index].totalPrice = (_cart[index].item!.price!) * itemCount;
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    final index = _cart.indexWhere((element) => product == element.item);
    _cart.removeAt(index);
    notifyListeners();
  }

  void proceedToCart() {
    // for (int i = 0; i < _cart.length; i++) {
    //   if (_cart[i].itemCount == 0) {
    //     _cart.removeAt(i);

    //     i--;
    //   }
    //   notifyListeners();
    // }
    totalBillPrice = 0;
    for (int i = 0; i < _cart.length; i++) {
      totalBillPrice = totalBillPrice + _cart[i].totalPrice;
    }
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
  }
}
