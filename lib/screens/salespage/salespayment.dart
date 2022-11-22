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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Bill Amount   ${provider.totalBillPrice}'),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      TypeAheadFormField(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: txt,
                            decoration:
                                InputDecoration(labelText: 'Select customer')),
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
                      Row(
                        children: [
                          Text('discount '),
                          SizedBox(
                              width: 120,
                              height: 20,
                              child: TextField(
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
                      Consumer<Cartprovider>(
                          builder: (context, value, child) =>
                              Text('Bill Amount ${value.billAmount}')),
                      Row(
                        children: [
                          Text('By cash '),
                          SizedBox(
                              width: 120,
                              height: 20,
                              child: TextFormField(
                                initialValue: provider.totalAmoount.toString(),
                              ))
                        ],
                      ),
                      Text('Credit amount')
                    ],
                  ),
                ),
              ),
              ElevatedButton(onPressed: (() {}), child: Text('submit'))
            ],
          ),
        ));
  }
}
