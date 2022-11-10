import 'package:billingapp/model/product.dart';

List<Product> savedProduct = [];
void productSave(product) async {
  savedProduct.add(product);
}
