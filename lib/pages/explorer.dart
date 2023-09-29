import 'package:coinalysis/consts.dart';
import 'package:coinalysis/widgets/transactions.dart';
import 'package:flutter/material.dart';

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
        color: primBg,
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
                    decoration: InputDecoration(
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
                  ),
                ),
                Container(
                  // height: 100,
                  // width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Your code here
                      setState(() {
                        isHidden = false;
                      });
                    },
                    child: Text(
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
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                if (!isHidden)
                  FutureBuilder(
                    future: API().Transact(str: str),
                    // initialData: InitialData,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          else
                            return new API().Transactions(snapshot.data);
                        // break;

                        default:
                          // debugPrint("Snapshot " + snapshot.toString());
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircularProgressIndicator(),
                          ); // also check your listWidget(snapshot) as it may return null.
                      }
                      // return Center(child: new Text('${snapshot.data}'));
                    },
                  ),
              ],
            ),
          ),
        ));
  }
}
