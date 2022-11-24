import 'package:billingapp/constant.dart';
import 'package:billingapp/provider/cartprovider.dart';
import 'package:billingapp/provider/customerprovider.dart';
import 'package:billingapp/provider/salesprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SalesPayment extends StatefulWidget {
  const SalesPayment({super.key});

  @override
  State<SalesPayment> createState() => _SalesPaymentState();
}

class _SalesPaymentState extends State<SalesPayment> {
  double creditGetting = 0;
  double billAmount = 0;
  double amount = 0;
  double cash = 0;
  double credit = 0;
  double discount = 0;
  late String custname;
  String uid = 'null';
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
                    onPressed: (() {
                      Provider.of<SalesProvider>(context, listen: false)
                          .createSale(
                              cartitem: provider.cartDetails,
                              totalPrice: billAmount,
                              discount: discount,
                              credit: credit,
                              finalPrice: amount,
                              customer: providerCust.findCustomer(uid));
                    }),
                    child: const Text('submit'))
              ],
            ),
          ),
        ));
  }
}
