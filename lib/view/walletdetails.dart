import 'package:coinalysis/model/trans.dart';
import 'package:coinalysis/res/colours.dart';
import 'package:coinalysis/res/components/walletsummary.dart';
import 'package:coinalysis/view_model/addr_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletDetails extends StatefulWidget {
  final String address;
  WalletDetails({super.key, required this.address});

  @override
  State<WalletDetails> createState() => _WalletDetailsState();
}

class _WalletDetailsState extends State<WalletDetails> {
  @override
  Widget build(BuildContext context) {
    final addrVM = Provider.of<AddrVM>(context);
    return Scaffold(
      backgroundColor: Colours.primBg,
      body: FutureBuilder<BitcoinTransaction>(
        future: addrVM.addrApi(widget.address),
        builder: (context, AsyncSnapshot<BitcoinTransaction> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                BitcoinTransaction data = snapshot.data!;
                return walletSummary(
                  address: data.address,
                  transactions: data.transactions,
                  received: data.totalReceived,
                  sent: data.totalSent,
                  finalbal: data.finalBalance,
                );
              } else {
                return const Text('No data available.');
              }
          }
        },
      ),
    );
  }
}
