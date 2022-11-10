import 'package:billingapp/provider/customerProvider.dart';
import 'package:billingapp/provider/productprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider<CustomerProvider>(
            create: (_) => CustomerProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Matrix Billing',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
    //const CustomerList());
  }
}
