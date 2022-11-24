import 'package:billingapp/model/cart.dart';
import 'package:billingapp/model/product.dart';

class Sales {
  String? custId;
  String? uniqueId;
  String? custName;
  int? billNo;
  List<Cart>? cartItems = [];
  String? dateOfPurchase;
  double? totalPrice;
  double? byCash;
  double? credit;
  Sales(
      {this.custName,
      this.custId,
      this.billNo,
      this.cartItems,
      this.byCash,
      this.credit,
      this.dateOfPurchase,
      this.totalPrice,
      this.uniqueId});
}
