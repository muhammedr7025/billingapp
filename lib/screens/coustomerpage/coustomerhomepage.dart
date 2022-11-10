import 'package:billingapp/provider/customerProvider.dart';
import 'package:billingapp/screens/coustomerpage/customerlist/customerlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/customer.dart';

class CoustomerHomePage extends StatefulWidget {
  const CoustomerHomePage({super.key});

  @override
  State<CoustomerHomePage> createState() => _CoustomerHomePageState();
}

class _CoustomerHomePageState extends State<CoustomerHomePage> {
  final TextEditingController name = TextEditingController();

  final TextEditingController phoneNo = TextEditingController();

  final TextEditingController credit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 45, 45, 45),
          title: const Text('Coustomers'),
          actions: [
            IconButton(
                onPressed: () {
                  showAddNoteDialog(
                    context,
                  );
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: const CustomerList());
  }

  showAddNoteDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        final provider = Provider.of<CustomerProvider>(context);
        return AlertDialog(
          title: const Center(child: Text("Add Stock")),
          content: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: name,
                    keyboardType: TextInputType.text,
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
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Customer name',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: phoneNo,
                    keyboardType: TextInputType.phone,
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
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Phone number',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
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
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      hintText: 'Credit amount',
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  Customer cust = Customer(
                      custName: name.text,
                      credit: double.tryParse(credit.text),
                      mobno: int.tryParse(phoneNo.text));
                  provider.saveCustomer(cust);
                  name.clear();
                  phoneNo.clear();
                  credit.clear();

                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
