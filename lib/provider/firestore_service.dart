import 'package:billingapp/model/customer.dart';
import 'package:billingapp/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future saveProduct(Product product) {
    return _db
        .collection('products')
        .doc(product.uniqueId)
        .set(product.toMap());
  }

  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Product.fromMap(document.data()))
        .toList());
  }

  Future removeProduct(String productId) {
    return _db.collection('products').doc(productId).delete();
  }

  Future saveCustomer(Customer customer) {
    return _db
        .collection('customers')
        .doc(customer.uniqueId)
        .set(customer.toMap());
  }

  Stream<List<Customer>> getCustomers() {
    return _db.collection('customers').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Customer.fromMap(document.data()))
        .toList());
  }

  Future removeCustomer(String productId) {
    return _db.collection('products').doc(productId).delete();
  }

  Future editProducts(Product product) {
    return _db
        .collection('products')
        .doc(product.uniqueId)
        .update(product.toMap());
  }
}
