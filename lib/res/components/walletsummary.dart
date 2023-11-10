import 'package:coinalysis/model/trans.dart';
import 'package:coinalysis/res/textstyles.dart';
import 'package:flutter/material.dart';

class walletSummary extends StatelessWidget {
  final address;
  final List<TransactionDetail> transactions;
  final int received;
  final int sent;
  final int finalbal;
  walletSummary(
      {super.key,
      required this.address,
      required this.transactions,
      required this.received,
      required this.sent,
      required this.finalbal});

  @override
  Widget build(BuildContext context) {
    print(transactions);
    return Column(children: [
      Container(
        child: Column(
          children: [
            Text(
              address,
              style: TxtStyl.heading,
            ),
            Text(
              "Number of Transactions: ${transactions.length}",
              style: TxtStyl.norm,
            ),
            Text(
              "Total Received: ${received / 100000000} BTC",
              style: TxtStyl.norm,
            ),
            Text(
              "Total Sent: ${sent / 100000000} BTC",
              style: TxtStyl.norm,
            ),
            Text(
              "Final Balance: ${finalbal / 100000000} BTC",
              style: TxtStyl.norm,
            ),
          ],
        ),
      )
    ]);
  }
}
