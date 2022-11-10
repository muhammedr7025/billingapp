import 'package:flutter/material.dart';

import '../../../model/customer.dart';

class CustomerItem extends StatelessWidget {
  final Customer customer;

  const CustomerItem({
    Key? key,
    required this.customer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Customer name: ${customer.custName}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Phone no: +91 ${customer.mobno}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Credit: ${customer.credit}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
