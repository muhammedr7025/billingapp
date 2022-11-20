import 'package:billingapp/model/product.dart';
import 'package:flutter/material.dart';

import '../model/cart.dart';

class Cartprovider with ChangeNotifier {
  final List<Cart> _cart = [];
  List<Cart> get cartDetails => _cart;
  void addToCart(Product product, int itemCount) {
    final index = _cart.indexWhere((element) => product == element.item);

    if (index == -1) {
      _cart.add(Cart(item: product, itemCount: itemCount));
    } else {
      _cart[index].itemCount = itemCount;
    }
    notifyListeners();
  }

  void procedCart() {}
  void clearCart() {
    _cart.clear();
  }
}