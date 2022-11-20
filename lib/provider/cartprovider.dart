import 'package:billingapp/model/product.dart';
import 'package:flutter/material.dart';

import '../model/cart.dart';

class Cartprovider with ChangeNotifier {
  final List<Cart> _cart = [];
  List<Cart> get cartDetails => _cart;
  void addToCart(Product product, int itemCount) {
    print(product);
    print(itemCount);
    notifyListeners();
  }
}
