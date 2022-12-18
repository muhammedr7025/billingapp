import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import 'package:billingapp/constant.dart';
import 'package:billingapp/model/customer.dart';
import 'package:billingapp/provider/cartprovider.dart';
import 'package:billingapp/provider/customerprovider.dart';
import 'package:billingapp/provider/salesprovider.dart';
import 'package:billingapp/screens/homepage/homepage.dart';

class SalesPayment extends StatefulWidget {
  const SalesPayment({
    Key? key,
  }) : super(key: key);

  @override
  State<SalesPayment> createState() => _SalesPaymentState();
}

class _SalesPaymentState extends State<SalesPayment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();
  late String _selectedCity;
  double creditGetting = 0;
  double billAmount = 0;
  double amount = 0;
  double cash = 0;
  double credit = 0;
  double discount = 0;
  late String custname;
  late String uid;
  List<Customer> customerList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    amount = Provider.of<Cartprovider>(context).totalAmoount;
    billAmount = amount;
    cash = amount;
    credit = amount;
  }

  @override
  Widget build(BuildContext context) {
    Cartprovider provider = Provider.of<Cartprovider>(context);
    CustomerProvider providerCust = Provider.of<CustomerProvider>(context);
    providerCust.getCustomerList().listen((event) {
      customerList = event;
    });
    return Scaffold(
        appBar: AppBar(
            backgroundColor: appBarColor, title: const Text('confirm order')),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount   $billAmount',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: <Widget>[
                        const Text('select customer?'),
                        TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                              controller: _typeAheadController,
                              decoration:
                                  const InputDecoration(labelText: 'Customer')),
                          suggestionsCallback: (pattern) {
                            final callbackList = customerList
                                .where((element) => element.custName!
                                    .toLowerCase()
                                    .contains(pattern))
                                .toList();
                            return customerList;
                          },
                          itemBuilder: (context, Customer suggestion) {
                            return ListTile(
                              title: Text(suggestion.custName!),
                            );
                          },
                          transitionBuilder:
                              (context, suggestionsBox, controller) {
                            return suggestionsBox;
                          },
                          onSuggestionSelected: (suggestion) {
                            _typeAheadController.text = suggestion.custName!;
                            uid = suggestion.uniqueId!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select a customer';
                            }
                          },
                          onSaved: (value) => _selectedCity = value!,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Discount ',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                        width: 120,
                        height: 20,
                        child: TextField(
                          style: const TextStyle(fontSize: 25),
                          onChanged: (value) {
                            setState(() {
                              discount = double.tryParse(value) ?? 0;
                              amount = billAmount - discount;
                              credit = amount - creditGetting;
                            });
                          },
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Bill Amount $amount',
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'By cash ',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                        width: 120,
                        height: 20,
                        child: TextFormField(
                          style: const TextStyle(fontSize: 25),
                          initialValue: 0.toString(),
                          onChanged: (value) {
                            setState(() {
                              creditGetting = double.tryParse(value) ?? 0;
                              credit = amount - creditGetting;
                            });
                          },
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Credit amount  $credit',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: (() async {
                      print(uid);
                      var cust = await providerCust.findCustomer(uid);

                      Provider.of<SalesProvider>(context, listen: false)
                          .createSale(
                              billNumber: lastbillnumber,
                              cartitem: provider.cartDetails,
                              totalPrice: billAmount,
                              discount: discount,
                              credit: credit,
                              finalPrice: amount,
                              customer: cust,
                              byCash: amount - credit,
                              custNum: cust.mobno!);
                      providerCust.newSaleAdded(
                          customer: await providerCust.findCustomer(
                            uid,
                          ),
                          newCredit: credit,
                          price: amount);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const HomePage())));
                    }),
                    child: const Text('submit'))
              ],
            ),
          ),
        ));
  }
}
