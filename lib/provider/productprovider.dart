import 'package:billingapp/provider/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _savedProduct = [
    Product(
        productName: 'poco x2',
        productCode: 'pcx2',
        price: 22000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'macbook pro',
        productCode: 'mc2',
        price: 229000,
        stockDate: '22/5/2002',
        stockCount: 4),
  ];
  List<Product> get savedProductList {
    return _savedProduct;
  }

  Future<void> saveProduct(Product product) async {
    _savedProduct.add(Product(
        productName: product.productName,
        productCode: product.productCode,
        price: product.price,
        stockCount: product.stockCount,
        stockDate: product.stockDate,
        uniqueId: const Uuid().v4()));
    final FirestoreService db = FirestoreService();
    await db.saveProduct(product);
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
