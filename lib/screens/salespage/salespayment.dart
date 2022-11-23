import 'package:billingapp/constant.dart';
import 'package:billingapp/model/customer.dart';
import 'package:billingapp/provider/cartprovider.dart';
import 'package:billingapp/provider/customerprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class SalesPayment extends StatefulWidget {
  const SalesPayment({super.key});

  @override
  State<SalesPayment> createState() => _SalesPaymentState();
}

class _SalesPaymentState extends State<SalesPayment> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    String custname;
    TextEditingController txt = TextEditingController();
    TextEditingController byCashController = TextEditingController();
    double credit;
    Cartprovider provider = Provider.of<Cartprovider>(context);
    CustomerProvider providerCust = Provider.of<CustomerProvider>(context);
    double totalBillAmount = provider.totalAmoount;

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
                      'Bill Amount   ${provider.totalBillPrice}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: txt,
                            decoration: const InputDecoration(
                              labelText: 'Select customer',
                              labelStyle: TextStyle(fontSize: 25),
                            )),
                        suggestionsCallback: (pattern) {
                          return providerCust.filterCustomer(pattern);
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.custName),
                          );
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (suggestion) {
                          txt.text = suggestion.custName;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select a customer';
                          }
                        },
                        onSaved: (newValue) => custname = newValue!,
                      ),
                    ],
                  ),
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
                          style: TextStyle(fontSize: 25),
                          onChanged: (value) {
                            // provider
                            //     .calcBillAmount(double.tryParse(value)!);
                            setState(() {
                              double billAmount = provider.totalAmoount -
                                  double.tryParse(value)!;
                            });
                            print(value);
                          },
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Consumer<Cartprovider>(
                        builder: (context, value, child) => Text(
                              'Bill Amount ${value.billAmount}',
                              style: const TextStyle(fontSize: 25),
                            )),
                  ],
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
                          initialValue: provider.totalAmoount.toString(),
                        ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Credit amount',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                ElevatedButton(onPressed: (() {}), child: Text('submit'))
              ],
            ),
          ),
        ));
  }
}
