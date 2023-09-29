import 'package:coinalysis/consts.dart';
import 'package:flutter/material.dart';

class Explorer extends StatefulWidget {
  const Explorer({super.key});

  @override
  State<Explorer> createState() => _ExplorerState();
}

class _ExplorerState extends State<Explorer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primBg,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 700,
              child: TextField(
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
              padding: EdgeInsets.all(8),
              // height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Your button's action here
                },
                child: Text('Search'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        0), // Set to 0 for a rectangle shape
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
