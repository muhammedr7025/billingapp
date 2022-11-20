import 'package:billingapp/model/product.dart';
import 'package:flutter/material.dart';

import '../model/cart.dart';

class Cartprovider with ChangeNotifier {
  final List<Cart> _cart = [];
  List<Cart> get cartDetails => _cart;
  void addToCart(Product product, int itemCount) {
    final index = _cart.indexWhere(
        (Cart element) => product.productCode == element.item!.productCode);
    print(index);
    if (index == -1) {
      print('addnew');
    } else {
      print('addagain');
      print(index);
    }
    print(product.productName);
    print(itemCount);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
  }
}
