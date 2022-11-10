import 'package:billingapp/model/product.dart';
import 'package:billingapp/model/productsavingfun.dart';
import 'package:flutter/material.dart';

class StockHome extends StatefulWidget {
  const StockHome({super.key});

  @override
  State<StockHome> createState() => _StockHomeState();
}

class _StockHomeState extends State<StockHome> {
  final TextEditingController name = TextEditingController();

  final TextEditingController code = TextEditingController();

  final TextEditingController date = TextEditingController();

  final TextEditingController stock = TextEditingController();

  final TextEditingController price = TextEditingController();
  int totalCount = savedProduct.length;
  @override
  void initState() {
    super.initState();
    totalCount = savedProduct.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        title: const Text('Stocks'),
        actions: [
          IconButton(
              onPressed: () => showAddNoteDialog(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
        itemCount: totalCount,
        itemBuilder: (BuildContext context, int index) {
          int lead = index + 1;
          return ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            leading: Text(lead.toString()),
            tileColor: Colors.white,
            title: Text(savedProduct[index].productName.toString()),
            trailing: Text(savedProduct[index].price.toString()),
          );
        },
      ),
    );
  }

  showAddNoteDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
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
                              const BorderSide(width: 1, color: Colors.grey),
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
                              const BorderSide(width: 1, color: Colors.grey),
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
                              const BorderSide(width: 1, color: Colors.grey),
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
                              const BorderSide(width: 1, color: Colors.grey),
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
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        hintText: 'Price',
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
                    Product toSave = Product(
                        productName: name.text,
                        productCode: code.text,
                        stockDate: date.text,
                        stockCount: int.parse(stock.text),
                        price: double.parse(price.text));
                    productSave(toSave);
                    name.clear();
                    code.clear();
                    date.clear();
                    stock.clear();
                    price.clear();
                    Navigator.of(context).pop();
                    setState(() {
                      totalCount = savedProduct.length;
                    });
                  },
                ),
              ),
            ],
          );
        },
      );
}
