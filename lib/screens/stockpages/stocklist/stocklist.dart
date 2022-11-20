import 'package:billingapp/provider/cartprovider.dart';
import 'package:billingapp/screens/salespage/salespayment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../../../model/product.dart';
import '../../../provider/productprovider.dart';
import '../../../widget/emptyview.dart';
import '../../salespage/newsaleitem.dart';
import 'stockitem.dart';

class StockList extends StatefulWidget {
  final String? option;
  const StockList({super.key, this.option});

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final datas = provider.savedProductList;
    final String? option = widget.option;
    return Container(
      color: Colors.grey,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SearchableList<Product>(
                style: const TextStyle(fontSize: 15),
                onPaginate: () async {
                  await Future.delayed(const Duration(milliseconds: 100));
                  setState(() {
                    provider.savedProductList;
                  });
                },
                builder: (Product product) => option == 'product'
                    ? StockItem(product: product)
                    : NewSaleItem(product: product),
                loadingWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Loading customers...')
                  ],
                ),
                errorWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Error while fetching customers')
                  ],
                ),
                asyncListCallback: () async {
                  await Future.delayed(
                    const Duration(
                      milliseconds: 100,
                    ),
                  );
                  return datas;
                },
                asyncListFilter: (q, list) {
                  return list
                      .where((element) =>
                          element.productName!.toLowerCase().contains(q))
                      .toList();
                },
                emptyWidget: const EmptyView(
                  name: 'Product',
                ),
                onRefresh: () async {},
                onItemSelected: (datas) {},
                inputDecoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Colors.blueGrey,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Search Product",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blueGrey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                onPressed: option == 'product'
                    ? (() {
                        productAdd(
                          context,
                        );
                      })
                    : () {
                        Provider.of<Cartprovider>(context, listen: false)
                            .proceedToCart();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const SalesPayment())));
                      },
                child: option == 'product'
                    ? const Text(
                        'Add Product',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    : const Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  productAdd(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          final provider = Provider.of<ProductProvider>(context);
          final TextEditingController name = TextEditingController();
          final TextEditingController code = TextEditingController();
          final TextEditingController date = TextEditingController();
          final TextEditingController stock = TextEditingController();

          final TextEditingController price = TextEditingController();
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 210, 207, 207),
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
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Product name',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: code,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Product code',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: date,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Date',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: stock,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'No of stocks',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Price',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text("Submit"),
                  onPressed: () {
                    Product toSave = Product(
                        productName: name.text,
                        productCode: code.text,
                        stockDate: date.text,
                        stockCount: int.parse(stock.text),
                        price: double.parse(price.text));
                    provider.saveProduct(toSave);
                    name.clear();
                    code.clear();
                    date.clear();
                    stock.clear();
                    price.clear();
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                ),
              ),
            ],
          );
        },
      );
}
