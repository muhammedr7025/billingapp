import 'package:billingapp/model/customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/customerProvider.dart';

class CustomerSingleView extends StatelessWidget {
  final Customer customer;

  const CustomerSingleView({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Customer details'),
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        actions: [
          IconButton(
              onPressed: (() {
                editCreditPage(context);
              }),
              icon: const Icon(Icons.price_check))
        ],
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
                  customer.custName!,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(customer.mobno.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  customer.credit.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(39.0),
                    topRight: Radius.circular(30.0)),
              ),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }

  editCreditPage(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        final provider = Provider.of<CustomerProvider>(context);

        final TextEditingController credit = TextEditingController();

        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 210, 207, 207),
          title: const Center(child: Text("Edit Credit")),
          content: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: credit,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Colors.redAccent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Credit amount for change',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text("Add credit"),
                  onPressed: () {
                    provider.editCredit(
                        customer: customer,
                        credit: num.tryParse(credit.text),
                        option: 'add');
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text("Reduce credit"),
                  onPressed: () {
                    provider.editCredit(
                        customer: customer,
                        credit: num.tryParse(credit.text),
                        option: 'remove');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
