import 'package:billingapp/model/customer.dart';
import 'package:billingapp/screens/coustomerpage/customerlist/emptyview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/searchable_listview.dart';
import '../../../provider/customerProvider.dart';
import 'customeritem.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerProvider>(context);
    final datas = provider.savedCustomerList;

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SearchableList<Customer>(
                style: const TextStyle(fontSize: 15),
                onPaginate: () async {
                  await Future.delayed(const Duration(milliseconds: 100));
                  setState(() {});
                },
                builder: (Customer customer) =>
                    CustomerItem(customer: customer),
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
                          element.custName!.toLowerCase().contains(q))
                      .toList();
                },
                emptyWidget: const EmptyView(),
                onRefresh: () async {},
                onItemSelected: (datas) {},
                inputDecoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Colors.blueGrey,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Search Customer",
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
                style: ButtonStyle(),
                onPressed: (() {
                  showAddNoteDialog(
                    context,
                  );
                }),
                child: const Text(
                  'Add Customer',
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

  showAddNoteDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        final provider = Provider.of<CustomerProvider>(context);
        final TextEditingController name = TextEditingController();

        final TextEditingController phoneNo = TextEditingController();

        final TextEditingController credit = TextEditingController();

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
                  provider.saveCustomer(cust);
                  name.clear();
                  phoneNo.clear();
                  credit.clear();

                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
