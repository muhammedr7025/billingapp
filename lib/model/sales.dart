import 'package:billingapp/model/product.dart';

class Sales {
  String? custName;
  int? billNo;
  List<Product>? cartItems = [];
  String? dateOfPurchase;
  double? totalPrice;
  double? byCash;
  double? credit;
  Sales(
      {this.custName,
      this.billNo,
      this.cartItems,
      this.byCash,
      this.credit,
      this.dateOfPurchase,
      this.totalPrice});
}
