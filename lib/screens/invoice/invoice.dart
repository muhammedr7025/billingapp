import 'package:billingapp/model/sales.dart';
import 'package:billingapp/provider/customerprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';

class Invoice extends StatelessWidget {
  Sales bill;
  Invoice({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    var cust = Provider.of<CustomerProvider>(context).findCustomer(bill.custId);
    return Scaffold(
      appBar: AppBar(title: const Text('Invoice Preview')),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(bill.custName!),
          Text(cust.mobno.toString()),
          Text(bill.billNo.toString()),
          Text(DateFormat("dd-MM-yyyy").format(bill.dateOfSale!)),
          const Text('invoice for payment'),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Table(
              border: TableBorder.all(color: Colors.black),
              children: [
                // The remaining rows contain each item from the invoice, and uses the
                // map operator (the ...) to include these items in the list
                ...bill.cartItems!.map(
                  // Each new line item for the invoice should be rendered on a new TableRow
                  (e) => TableRow(
                    children: [
                      // We can use an Expanded widget, and use the flex parameter to specify
                      // how wide this particular widget should be. With a flex parameter of
                      // 2, the description widget will be 66% of the available width.
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          flex: 2,
                          child: Text(
                            e.item!.productName!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      // Again, with a flex parameter of 1, the cost widget will be 33% of the
                      // available width.
                      // Expanded(child: Text(e.itemCount.toString())),
                      Expanded(
                        flex: 1,
                        child: Text(
                          e.itemCount.toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '  ${e.totalPrice}',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                // After the itemized breakdown of costs, show the tax amount for this invoice
                // In this case, it's just 10% of the invoice amount
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
            child: Table(
              children: [
                TableRow(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Total price',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        bill.totalPrice.toString(),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                TableRow(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Discount price',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        bill.discount.toString(),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                TableRow(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Sale price',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        bill.salePrice.toString(),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                // Show the total
                TableRow(
                  children: [
                    const Text(
                      'By cash',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${bill.salePrice! - bill.credit!}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Credit',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        bill.credit.toString(),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
