import 'package:billingapp/model/cart.dart';

class Sales {
  DateTime? date;
  String? custId;
  String? uniqueId;
  String? custName;
  String? billNo;
  List<Cart>? cartItems = [];
  String? dateOfPurchase;
  double? totalPrice;
  double? byCash;
  double? credit;
  double? salePrice;
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
