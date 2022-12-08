import 'dart:developer';

import 'package:billingapp/provider/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  final db = FirestoreService();
  List<Product> _savedProduct = [];
  Future<List<Product>> get savedProductList async {
    db.getProducts().listen((event) {
      _savedProduct = event;
      log(event.toString());
    });
    return _savedProduct;
  }

  Future<void> saveProduct(Product product) async {
    final newProduct = Product(
        productName: product.productName,
        productCode: product.productCode,
        price: product.price,
        stockCount: product.stockCount,
        stockDate: product.stockDate,
        uniqueId: const Uuid().v4());
    _savedProduct.add(newProduct);
    db.saveProduct(newProduct);
    notifyListeners();
  }

  Future<void> editProduct(Product productOld, Product productNew) async {
    final index = _savedProduct.indexWhere((element) => productOld == element);
    _savedProduct[index] = Product(
      productName: productNew.productName,
      productCode: productNew.productCode,
      price: productNew.price,
      stockCount: productNew.stockCount,
      stockDate: productNew.stockDate,
    );
    notifyListeners();
  }

  Future<List> filterProduct(String keyWord) async {
    List<Product> filteredList = _savedProduct
        .where(
            (element) => element.productName!.toLowerCase().contains(keyWord))
        .toList();
    return filteredList;
  }

  void updateProductCount() {}
}
