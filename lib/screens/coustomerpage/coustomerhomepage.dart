import 'package:flutter/material.dart';

import '../../model/customer.dart';
import '../../model/customersavingfun.dart';
import 'customersingleview.dart';

class CoustomerHomePage extends StatefulWidget {
  const CoustomerHomePage({super.key});

  @override
  State<CoustomerHomePage> createState() => _CoustomerHomePageState();
}

class _CoustomerHomePageState extends State<CoustomerHomePage> {
  late int totalCount;
  final TextEditingController name = TextEditingController();

  final TextEditingController phoneNo = TextEditingController();

  final TextEditingController credit = TextEditingController();
  @override
  void initState() {
    super.initState();
    totalCount = savedCustomer.length;
  }

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
                showAddNoteDialog(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: totalCount,
        itemBuilder: (BuildContext context, int index) {
          int lead = index + 1;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => CustomerSingleView(
                        name: savedCustomer[index].custName.toString(),
                        phnNo:
                            int.tryParse(savedCustomer[index].mobno.toString()),
                        credit: int.tryParse(
                            savedCustomer[index].credit.toString())))));
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              leading: Text(lead.toString()),
              tileColor: Colors.white,
              title: Text(savedCustomer[index].custName.toString()),
              trailing: Text(savedCustomer[index].credit.toString()),
            ),
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
                    saveCustomer(cust);
                    name.clear();
                    phoneNo.clear();
                    credit.clear();

                    Navigator.of(context).pop();
                    setState(() {
                      totalCount = savedCustomer.length;
                    });
                  },
                ),
              ),
            ],
          );
        },
      );
}
