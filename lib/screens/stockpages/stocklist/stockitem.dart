import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/product.dart';
import '../../../provider/productprovider.dart';

class StockItem extends StatelessWidget {
  final Product product;
  const StockItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              final provider = Provider.of<ProductProvider>(context);
              final TextEditingController name = TextEditingController();
              final TextEditingController code = TextEditingController();
              final TextEditingController date = TextEditingController();
              final TextEditingController stock = TextEditingController();

              final TextEditingController price = TextEditingController();
              name.text = product.productName!;
              code.text = product.productCode!;
              date.text = product.stockDate!;
              stock.text = product.stockCount!.toString();
              price.text = product.price!.toString();
              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 210, 207, 207),
                title: const Center(child: Text("Edit Stock")),
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
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
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
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
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
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
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
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
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
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
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

                        provider.editProduct(product, toSave);

                        name.clear();
                        code.clear();
                        date.clear();
                        stock.clear();
                        price.clear();
                        provider.savedProductList;
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.person,
                color: Colors.blueGrey,
                size: 30,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Product name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(product.productName!)
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Product code: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(product.productCode.toString())
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'No of stocks: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(product.stockCount.toString())
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Price: ₹',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(product.price.toString())
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Date: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(product.stockDate.toString())
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
