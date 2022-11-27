import 'package:billingapp/model/cart.dart';

class Sales {
  String? custId;
  String? uniqueId;
  String? custName;
  String? billNo;
  List<Cart>? cartItems = [];
  DateTime? dateOfSale;
  double? totalPrice;
  double? byCash;
  double? credit;
  double? salePrice;
  double? discount;
  Sales(
      {this.custName,
      this.custId,
      this.billNo,
      this.cartItems,
      this.byCash,
      this.credit,
      this.dateOfSale,
      this.totalPrice,
      this.uniqueId,
      this.salePrice,
      this.discount});
}
