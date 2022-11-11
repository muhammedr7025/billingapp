import 'package:billingapp/screens/salespage/saleslist/saleslist.dart';
import 'package:flutter/material.dart';

class SalesHomePage extends StatelessWidget {
  const SalesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 45, 45, 45),
          title: const Text('Sales'),
        ),
        body: const SalesList());
  }
}
