import 'package:billingapp/model/sales.dart';

class Customer {
  String? custName;
  int? mobno;
  double? credit;
  List<Sales>? bills = [];
  Customer({this.custName, this.mobno, this.credit, this.bills});
}
