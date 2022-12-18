import 'package:billingapp/model/bill_number.dart';
import 'package:billingapp/model/customer.dart';
import 'package:billingapp/model/product.dart';
import 'package:billingapp/model/sales.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future saveProduct(Product product) {
    return _db
        .collection('products')
        .doc(product.uniqueId)
        .set(product.toMap());
  }

  Future saveSale(Sales sale) {
    return _db.collection('sales').doc(sale.uniqueId).set(sale.toMap());
  }

  Stream<List<Sales>> getSales() {
    return _db.collection('sales').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Sales.fromMap(document.data()))
        .toList());
  }

  int getLastBillNumber() {
    int billnumber = 0;
    final getLastBillNumber =
        _db.collection('bill').doc('bill').get().then((value) {
      billnumber = value.data()!['billno'];
    });
    return billnumber;
  }

  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Product.fromMap(document.data()))
        .toList());
  }

  List<Product> filterProduct(String keyword, List<Product> product) {
    List<Product> filteredList = product
        .where(
            (element) => element.productName!.toLowerCase().contains(keyword))
        .toList();
    return filteredList;
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

  Future<Customer> findCustomer(String uid) async {
    var response = await _db.collection('customers').doc(uid).get();

    return Customer.fromMap(response.data() as Map<String, dynamic>);
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

  Future editProducts(Product product, String uid) {
    return _db.collection('products').doc(uid).update(product.toMap());
  }

  Future saleCustomerUpdation({required Customer customer}) async {
    return _db
        .collection('customers')
        .doc(customer.uniqueId)
        .set(customer.toMap());
  }

  Future updateProductCount(Product product) async {
    return _db
        .collection('products')
        .doc(product.uniqueId)
        .update(product.toMap());
  }
}
