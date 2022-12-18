import 'package:billingapp/provider/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  final db = FirestoreService();
  List<Product> _savedProduct = [];
  Stream<List<Product>> get savedProductList {
    // var list;
    return db.getProducts();

    // return list;
  }

  Future<void> saveProduct(Product product) async {
    final newProduct = Product(
        productName: product.productName,
        productCode: product.productCode,
        price: product.price,
        stockCount: product.stockCount,
        stockDate: product.stockDate,
        uniqueId: const Uuid().v4());

    db.saveProduct(newProduct);
    notifyListeners();
  }

  Future<void> editProduct(Product productOld, Product productNew) async {
    db.editProducts(productNew, productOld.uniqueId!);
    notifyListeners();
  }

  Future<List> filterProduct(String keyWord) async {
    List<Product> filteredList = _savedProduct
        .where(
            (element) => element.productName!.toLowerCase().contains(keyWord))
        .toList();
    //
    // db.filterProduct(keyWord, savedProductList);
    return filteredList;
  }

  Future<void> productQuantityUpdate(Product product, int quantity) async {
    product.stockCount = product.stockCount ?? 0 - quantity;
  }

  void updateProductCount() {}
}
