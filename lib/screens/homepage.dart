import 'package:billingapp/coustomerpage/coustomerhomepage.dart';
import 'package:billingapp/salespage/saleshomepage.dart';
import 'package:billingapp/stockpages/stockhome.dart';

import 'package:billingapp/widgets/optionbutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            OptionButton(
              name: 'Stocks',
              icon: Icons.shopping_cart_checkout_rounded,
              navPage: StockHome(),
            ),
            OptionButton(
              name: 'Sales',
              icon: Icons.shopping_bag,
              navPage: SalesHomePage(),
            ),
            OptionButton(
              name: 'Coustomer',
              icon: Icons.person_outline,
              navPage: CoustomerHomePage(),
            )
          ],
        ),
      ),
    );
  }
}
