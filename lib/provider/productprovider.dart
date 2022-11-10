import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _savedProduct = [];
  List<Product> get savedProductList {
    return [..._savedProduct];
  }

  int get productLength {
    return _savedProduct.length;
  }

  Future<void> saveProduct(product) async {
    _savedProduct.add(product);
  }
}
