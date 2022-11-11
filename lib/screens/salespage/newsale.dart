import 'package:billingapp/screens/coustomerpage/customerlist/customerlist.dart';
import 'package:billingapp/screens/stockpages/stockhome.dart';
import 'package:billingapp/screens/stockpages/stocklist/stocklist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';

class NewSale extends StatefulWidget {
  const NewSale({super.key});

  @override
  State<NewSale> createState() => _NewSaleState();
}

class _NewSaleState extends State<NewSale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Products'),
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      ),
      body: StockList(),
    );
  }
}
