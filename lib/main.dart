import 'package:billingapp/firebase_options.dart';
import 'package:billingapp/provider/cartprovider.dart';
import 'package:billingapp/provider/customerprovider.dart';
import 'package:billingapp/provider/productprovider.dart';
import 'package:billingapp/provider/salesprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
