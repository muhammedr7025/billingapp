import 'package:flutter/material.dart';

import '../../constant.dart';
import 'customerlist/customerlist.dart';

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
          backgroundColor: appBarColor,
          title: const Text('Coustomers'),
        ),
        body: const CustomerList());
  }
}
