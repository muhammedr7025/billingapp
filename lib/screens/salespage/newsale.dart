import 'package:flutter/material.dart';

import '../stockpages/stocklist/stocklist.dart';

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
      body: const StockList(),
    );
  }
}
