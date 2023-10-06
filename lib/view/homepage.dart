import 'package:coinalysis/res/colours.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title, required this.child})
      : super(key: key);

  final String title;
  final Widget child;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colours.primWidg,
        actions: [
          OutlinedButton(
            onPressed: () {
              context.go('/explorer');
            },
            child: Text(
              'Explorer',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colours.primBg,
        child: widget.child,
      ),
    );
  }
}
