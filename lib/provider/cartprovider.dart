import 'package:billingapp/model/product.dart';
import 'package:flutter/material.dart';

import '../model/cart.dart';

class Cartprovider with ChangeNotifier {
  double totalBillPrice = 0; // productinda price x item with full
  double _billAmount = 0; //bill after discount
  final List<Cart> _cart = [];
  List<Cart> get cartDetails => _cart;
  double get billAmount => _billAmount;
  double get totalAmoount => totalBillPrice;
  void addToCart(Product product, int itemCount) {
    final index = _cart.indexWhere((element) => product == element.item);

    if (index == -1) {
      _cart.add(Cart(item: product, itemCount: itemCount));
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

  void calcBillAmount(double discoount) {
    _billAmount = totalAmoount - discoount;
    notifyListeners();
  }

  List<Cart> cloneCart() {
    final List<Cart> cloneCart = _cart;
    return cloneCart;
  }

  void proceedToCart() {
    totalBillPrice = 0;
    for (int i = 0; i < _cart.length; i++) {
      totalBillPrice = totalBillPrice + _cart[i].totalPrice;
      _billAmount = totalBillPrice;
    }
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
