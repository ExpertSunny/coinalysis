import 'package:coinalysis/res/colours.dart';
import 'package:coinalysis/res/textstyles.dart';
import 'package:flutter/material.dart';

class transCard extends StatelessWidget {
  final String address;
  final double amount;
  final bool spent;
  const transCard(
      {super.key,
      required this.spent,
      required this.address,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        height: 60,
        width: 700,
        child: Card(
          color: Colours.primWidg,
          child: ListTile(
            leading: spent
                ? Icon(
                    Icons.arrow_upward,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.arrow_downward,
                    color: Colors.green,
                  ),
            title: Text(
              address,
              style: TxtStyl.norm,
            ),
            subtitle: Text(
              "$amount",
              style: TxtStyl.norm,
            ),
            trailing: Column(children: [
              Text(
                'Test',
                style: TxtStyl.norm,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
