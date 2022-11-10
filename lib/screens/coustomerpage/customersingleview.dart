import 'package:flutter/material.dart';

class CustomerSingleView extends StatelessWidget {
  final String? name;
  final int? credit;
  final int? phnNo;
  const CustomerSingleView({super.key, this.name, this.credit, this.phnNo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Customer details'),
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 45, 45, 45),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  color: Colors.white,
                  Icons.person_sharp,
                  size: 50,
                ),
                const SizedBox(height: 10),
                Text(
                  name!,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(phnNo!.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  credit!.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(39.0),
                  topRight: Radius.circular(30.0)),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: const [
                Icon(Icons.person),
                Text('name'),
                Text('phone no'),
                Text('data')
              ],
            ),
          )
        ],
      ),
    );
  }
}