import 'package:billingapp/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future saveProduct(Product product) {
    return _db
        .collection('products')
        .doc(product.uniqueId)
        .set(product.toMap());
  }

  Stream getProducts() {
    return _db.collection('products').snapshots().map((snapshot) =>
        snapshot.docs.map((document) => Product.fromMap(document.data())));
  }

  Future removeProduct(String productId) {
    return _db.collection('products').doc(productId).delete();
  }
}
