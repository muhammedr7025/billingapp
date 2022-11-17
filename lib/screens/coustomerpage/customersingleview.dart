import 'package:billingapp/model/customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/customerprovider.dart';

class CustomerSingleView extends StatefulWidget {
  final Customer customer;

  const CustomerSingleView({super.key, required this.customer});

  @override
  State<CustomerSingleView> createState() => _CustomerSingleViewState();
}

class _CustomerSingleViewState extends State<CustomerSingleView> {
  late double credit;
  @override
  void initState() {
    credit = widget.customer.credit ?? 0;
    super.initState();
  }

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
                editCreditPage(
                  context,
                  onCreditChanged: (value) {
                    setState(() {
                      credit = value;
                    });
                  },
                );
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
                  widget.customer.custName!,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(widget.customer.mobno.toString(),
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  credit.toString(),
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
    BuildContext context, {
    required ValueChanged<double> onCreditChanged,
  }) {
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
                    double newCredit = (widget.customer.credit ?? 0) +
                        (double.tryParse(credit.text) ?? 0);
                    onCreditChanged(newCredit);
                    provider.editCredit(
                      customer: widget.customer,
                      credit: newCredit,
                    );
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text("Reduce credit"),
                  onPressed: () {
                    double newCredit = (widget.customer.credit ?? 0) -
                        (double.tryParse(credit.text) ?? 0);
                    onCreditChanged(newCredit);
                    provider.editCredit(
                        customer: widget.customer, credit: newCredit);
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
