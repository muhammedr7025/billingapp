import 'package:billingapp/constant.dart';
import 'package:flutter/material.dart';

class SalesPayment extends StatelessWidget {
  const SalesPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: appBarColor, title: const Text('confirm order')),
      body: SingleChildScrollView(
          child: Column(
        children: const [],
      )),
    );
  }
}
