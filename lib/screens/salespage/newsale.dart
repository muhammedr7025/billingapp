import 'package:billingapp/model/product.dart';
import 'package:billingapp/provider/cartprovider.dart';
import 'package:billingapp/provider/productprovider.dart';
import 'package:billingapp/screens/salespage/salespayment.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import '../../model/customer.dart';
import '../../model/sales.dart';
import '../../provider/salesprovider.dart';

class NewSale extends StatefulWidget {
  String? option;
  Customer? cust;
  NewSale({super.key, this.option, this.cust});

  @override
  State<NewSale> createState() => _NewSaleState();
}

class _NewSaleState extends State<NewSale> {
  List<Sales> datas = [];
  List<Product> productList = [];
  @override
  Widget build(BuildContext context) {
    Cartprovider provider = Provider.of<Cartprovider>(context);
    final provider2 = Provider.of<SalesProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    provider2.savedBillList.listen((event) {
      datas = event;
    });
    productProvider.savedProductList.listen((event) {
      productList = event;
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Products'),
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: TypeAheadField(
                textFieldConfiguration: const TextFieldConfiguration(
                    autofocus: true,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        label: Text('search product'),
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.search))),
                suggestionsCallback: (pattern) async {
                  final callbackList = productList
                      .where((element) =>
                          element.productName!.toLowerCase().contains(pattern))
                      .toList();
                  return callbackList;
                },
                itemBuilder: (context, dynamic s) {
                  return ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: Text(s.productName),
                    subtitle: Text(s.price.toString()),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  provider.addToCart(suggestion, 1);
                },
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: provider.cartDetails.length,
            itemBuilder: (context, index) {
              int counter = provider.cartDetails[index].itemCount!;
              return Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: ListTile(
                  tileColor: const Color.fromARGB(255, 228, 226, 226),
                  leading: Text((index + 1).toString()),
                  title: Text(
                      provider.cartDetails[index].item!.productName.toString()),
                  subtitle: Text('\$${provider.cartDetails[index].totalPrice}'),
                  trailing: CartStepper(
                    value: counter,
                    //value: provider.cartDetails[index].itemCount,
                    didChangeCount: (value) {
                      if (value <=
                          provider.cartDetails[index].item!.stockCount!) {
                        if (value > 0) {
                          provider.addToCart(
                              provider.cartDetails[index].item!, value);
                        } else {
                          provider
                              .removeItem(provider.cartDetails[index].item!);
                        }
                      }
                      counter = value;
                    },
                  ),
                ),
              );
            },
          )),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      provider.proceedToCart();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const SalesPayment())));
                    },
                    child: const Text('submit'),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
