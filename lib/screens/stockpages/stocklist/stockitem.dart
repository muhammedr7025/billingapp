import 'package:billingapp/model/product.dart';
import 'package:flutter/material.dart';

class StockItem extends StatelessWidget {
  final Product product;
  const StockItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 80,
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
                      'Product name: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(product.productName!)
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
                    Text(product.productCode.toString())
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'No of stocks: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(product.stockCount.toString())
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
                    Text(product.price.toString())
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Date: ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(product.stockDate.toString())
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
