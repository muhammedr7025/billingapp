import 'package:flutter/material.dart';

import '../coustomerpage/coustomerhomepage.dart';
import '../salespage/saleshomepage.dart';
import '../stockpages/stockhome.dart';
import 'widgets/optionbutton.dart';

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
