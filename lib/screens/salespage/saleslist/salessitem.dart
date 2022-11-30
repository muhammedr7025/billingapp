import 'package:billingapp/model/sales.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../invoice/invoice.dart';

class SalesItem extends StatelessWidget {
  final Sales bills;
  const SalesItem({super.key, required this.bills});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => Invoice(bill: bills))));
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.person,
                color: Colors.blueGrey,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Customer name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(bills.custName!),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Bill no: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(bills.billNo.toString())
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Total Amount: ₹',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(bills.totalPrice.toString())
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
