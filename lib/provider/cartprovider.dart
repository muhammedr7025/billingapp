import 'package:flutter/material.dart';

import '../model/cart.dart';

class Cartprovider with ChangeNotifier {
  final List<Cart> _cart = [];
  List<Cart> get cartDetails => _cart;
}
