import 'package:billingapp/model/sales.dart';
import 'package:billingapp/provider/cartprovider.dart';
import 'package:billingapp/provider/salesprovider.dart';
import 'package:billingapp/screens/salespage/newsale.dart';
import 'package:billingapp/screens/salespage/saleslist/salessitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_listview/searchable_listview.dart';
import '../../../widget/emptyview.dart';

class SalesList extends StatefulWidget {
  const SalesList({
    super.key,
  });

  @override
  State<SalesList> createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  List<Sales> datas = [];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SalesProvider>(context);
    provider.savedBillList.listen((event) {
      datas = event;
    });
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SearchableList<Sales>(
                style: const TextStyle(fontSize: 15),
                onPaginate: () async {
                  await Future.delayed(const Duration(milliseconds: 100));
                  setState(() {});
                },
                builder: (Sales bills) => SalesItem(
                  bills: bills,
                ),
                loadingWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Loading sales...')
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
                    Text('Error while fetching sales')
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
                emptyWidget: const EmptyView(
                  name: 'sales',
                ),
                onRefresh: () async {},
                onItemSelected: (datas) {},
                inputDecoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Colors.blueGrey,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Search customer name or bill no",
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
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: (() {
                  Provider.of<Cartprovider>(context, listen: false).clearCart();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => NewSale(
                            option: 'new',
                          ))));
                }),
                child: const Text(
                  '+',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
