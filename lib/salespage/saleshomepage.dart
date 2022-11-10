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
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: Container(
          color: Colors.green,
          child: Column(children: const [
            ListTile(
              title: Text('Product Name'),
            )
          ]),
        ));
  }
}
