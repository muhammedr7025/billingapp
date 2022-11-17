import 'package:billingapp/screens/coustomerpage/customersingleview.dart';
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
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => CustomerSingleView(
                  customer: customer,
                )))),
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
                      Text(customer.custName!)
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Phone no: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(customer.mobno!.toString())
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Credit: ₹',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(customer.credit?.toString() ?? "0")
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
