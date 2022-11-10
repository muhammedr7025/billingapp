import 'package:billingapp/screens/coustomerpage/customerlist/customerlist.dart';
import 'package:flutter/material.dart';

class CoustomerHomePage extends StatefulWidget {
  const CoustomerHomePage({super.key});

  @override
  State<CoustomerHomePage> createState() => _CoustomerHomePageState();
}

class _CoustomerHomePageState extends State<CoustomerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 45, 45, 45),
          title: const Text('Coustomers'),
        ),
        body: const CustomerList());
  }
}
