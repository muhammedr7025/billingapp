import 'dart:io';

import 'package:billingapp/model/sales.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

class Invoice extends StatelessWidget {
  Sales bill;
  var cust;
  Invoice({super.key, required this.bill, this.cust});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Invoice Preview')),
        body: PdfPreview(build: ((format) => makePdf(format, bill))));
  }

  Future<Uint8List> makePdf(PdfPageFormat format, Sales bill) async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Column(children: [
        pw.Text(bill.custName!),
        pw.Text(cust.toString()),
        pw.Text(bill.billNo.toString()),
        pw.Text(DateFormat("dd-MM-yyyy").format(bill.dateOfSale!)),
        pw.Table(border: pw.TableBorder.all(color: PdfColors.black), children: [
          pw.TableRow(children: [
            pw.Expanded(
                child: pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text('Product name'),
              ),
            )),
            pw.Expanded(
                child: pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text('Qty'),
              ),
            )),
            pw.Expanded(
                child: pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text('Price'),
              ),
            )),
          ]),
          ...bill.cartItems!.map(
            // Each new line item for the invoice should be rendered on a new TableRow
            (e) => pw.TableRow(
              children: [
                // We can use an Expanded widget, and use the flex parameter to specify
                // how wide this particular widget should be. With a flex parameter of
                // 2, the description widget will be 66% of the available width.
                pw.Expanded(
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                        alignment: pw.Alignment.center,
                        child: pw.Text(e.item!.productName!)),
                  ),
                  flex: 2,
                ),
                pw.Expanded(
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(e.itemCount.toString()),
                    ),
                  ),
                  flex: 1,
                ),
                pw.Expanded(
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.all(4),
                    child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text(e.item!.price.toString()),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ]),
        pw.Padding(
          padding: const pw.EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
          child: pw.Table(
            children: [
              pw.TableRow(
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Text(
                      'Total price',
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Text(
                      bill.totalPrice.toString(),
                      textAlign: pw.TextAlign.center,
                    ),
                  )
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Text(
                      'Discount price',
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Text(
                      bill.discount.toString(),
                      textAlign: pw.TextAlign.center,
                    ),
                  )
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Text(
                      'Sale price',
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Text(
                      bill.salePrice.toString(),
                      textAlign: pw.TextAlign.center,
                    ),
                  )
                ],
              ),
              // Show the total
              pw.TableRow(
                children: [
                  pw.Text(
                    'By cash',
                    textAlign: pw.TextAlign.center,
                  ),
                  pw.Text(
                    '${bill.salePrice! - bill.credit!}',
                    textAlign: pw.TextAlign.center,
                  ),
                ],
              ),
              pw.TableRow(
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Text(
                      'Credit',
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Text(
                      bill.credit.toString(),
                      textAlign: pw.TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ]);
    }));
    final file = File('example.pdf');

    // await file.writeAsBytes(await pdf.save());
    return pdf.save();
  }
}
