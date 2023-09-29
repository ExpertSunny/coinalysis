import 'package:coinalysis/consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class API {
  final dio = new Dio();
  late Response resp;
  Future Transact({required String str}) async {
    resp = await dio.get("https://blockchain.info/rawaddr/$str");
    // print(resp);
    // print(resp.data['address']);
    return resp;
  }

  Widget Transactions(Response resp) {
    return Column(
      children: [
        Column(
          children: [
            Text(
              "SUMMARY:",
              style: heading,
            ),
            Text(
              "Hash: " + resp.data['hash160'],
              style: norm,
            ),
            Text(
              "Address: " + resp.data['address'],
              style: norm,
            ),
            Text(
              "Number of Transactions: " + resp.data['n_tx'].toString(),
              style: norm,
            ),
            Text(
              "Total Received: " +
                  (resp.data['total_received'] / 100000000).toString() +
                  " BTC",
              style: norm,
            ),
            Text(
              "Total Sent: " +
                  (resp.data['total_sent'] / 100000000).toString() +
                  " BTC",
              style: norm,
            ),
            Text(
              "Final Balance: " +
                  (resp.data['final_balance'] / 100000000).toString() +
                  " BTC",
              style: norm,
            ),
          ],
        ),
        Row(
          children: [
            Container(),
            Container(),
          ],
        ),
      ],
    );
  }
}
