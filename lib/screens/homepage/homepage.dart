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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  width: 30,
                ),
                OptionButton(
                  name: 'Stocks',
                  icon: Icons.shopping_cart_checkout_rounded,
                  navPage: StockHome(),
                ),
                SizedBox(
                  width: 30,
                ),
                OptionButton(
                  name: 'Sales',
                  icon: Icons.shopping_bag,
                  navPage: SalesHomePage(),
                ),
                SizedBox(
                  width: 30,
                ),
                OptionButton(
                  name: 'Coustomer',
                  icon: Icons.person_outline,
                  navPage: CoustomerHomePage(),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
