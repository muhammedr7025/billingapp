import 'package:billingapp/model/product.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Product? item;
  int? itemCount;
  Cart({this.item, this.itemCount});
}
