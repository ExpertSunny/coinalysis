import 'package:coinalysis/model/trans.dart';
import 'package:coinalysis/res/colours.dart';
import 'package:coinalysis/view_model/addr_vm.dart';
import 'package:coinalysis/res/components/walletsummary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Explorer extends StatefulWidget {
  const Explorer({super.key});

  @override
  State<Explorer> createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  bool isHidden = true;
  String str = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colours.primBg,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 700,
                  child: TextField(
                      onChanged: (text) {
                        str = text;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Enter Transaction ID / Wallet Address',
                        border: OutlineInputBorder(),
                      ).copyWith(
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white),
                ),
                Container(
                  // height: 100,
                  // width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Your code here
                      context.go('/walletdetails', extra: str);
                    },
                    child: const Text(
                      "Search",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
