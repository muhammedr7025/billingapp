import 'package:billingapp/provider/cartprovider.dart';
import 'package:billingapp/provider/customerprovider.dart';
import 'package:billingapp/provider/productprovider.dart';
import 'package:billingapp/provider/salesprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider<CustomerProvider>(
            create: (_) => CustomerProvider()),
        ChangeNotifierProvider<SalesProvider>(
          create: (_) => SalesProvider(),
        ),
        ChangeNotifierProvider<Cartprovider>(
          create: (_) => Cartprovider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Matrix Billing',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}
