import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _savedProduct = [];
  List<Product> get savedProductList {
    return [..._savedProduct];
  }

  Future<void> saveProduct(Product product) async {
    _savedProduct.add(Product(
        productName: product.productName,
        productCode: product.productCode,
        price: product.price,
        stockCount: product.stockCount,
        stockDate: product.stockDate));
    notifyListeners();
  }
}
