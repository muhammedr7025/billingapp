import 'package:billingapp/screens/stockpages/stocklist/stocklist.dart';
import 'package:flutter/material.dart';

class StockHome extends StatefulWidget {
  const StockHome({super.key});

  @override
  State<StockHome> createState() => _StockHomeState();
}

class _StockHomeState extends State<StockHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 45, 45, 45),
          title: const Text('Stocks'),
        ),
        body: const StockList(
          option: 'product',
        ));
  }
}
