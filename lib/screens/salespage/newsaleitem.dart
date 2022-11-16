import 'package:billingapp/model/product.dart';
import 'package:flutter/material.dart';

import 'package:cart_stepper/cart_stepper.dart';

class NewSaleItem extends StatefulWidget {
  final Product product;
  const NewSaleItem({super.key, required this.product});

  @override
  State<NewSaleItem> createState() => _NewSaleItemState();
}

class _NewSaleItemState extends State<NewSaleItem> {
  @override
  Widget build(BuildContext context) {
    int count = 0;

    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.shopping_cart_checkout,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Text(
                      'Product name: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.product.productName!),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Product code: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.product.productCode.toString())
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Price: ₹',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.product.price.toString())
                  ],
                ),
              ],
            ),
            CartStepperInt(
              value: count,
              size: 30,
              didChangeCount: (count1) {
                print(count1);
                count = count1;
                setState(() {
                  count = count1;
                  print(count);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
