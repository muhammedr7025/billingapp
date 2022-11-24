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
        productName: 'poco x3',
        productCode: 'pcx3',
        price: 27000,
        stockDate: '22/5/2002',
        stockCount: 8),
    Product(
        productName: 'macbook pro',
        productCode: 'mc2',
        price: 229000,
        stockDate: '22/5/2002',
        stockCount: 4),
    Product(
        productName: 'iphone 14',
        productCode: '1p14',
        price: 144000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iwatch 8',
        productCode: 'iw8',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iwatch 9',
        productCode: 'iw9',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iwatch 10',
        productCode: 'iw10',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 8',
        productCode: 'ip8',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 4',
        productCode: 'ip4',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 5',
        productCode: 'ip5',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 6',
        productCode: 'ip6',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 7',
        productCode: 'ip7',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 9',
        productCode: 'ip9',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 10',
        productCode: 'ip10',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 11',
        productCode: 'ip11',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 12',
        productCode: 'ip12',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7),
    Product(
        productName: 'iphone 13',
        productCode: 'ip13',
        price: 50000,
        stockDate: '22/5/2002',
        stockCount: 7)
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
}
