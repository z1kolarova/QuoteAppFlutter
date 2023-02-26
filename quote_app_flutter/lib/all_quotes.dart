import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllQuotesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllQuotesWidgetState();
}

class AllQuotesWidgetState extends State<AllQuotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All saved quotes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(String text, void Function()? onPressed) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(backgroundColor: const Color(0xFFC0F0F7),
                foregroundColor: const Color(0xFF10609D)),
            child: Text(text, textScaleFactor: 2)));
  }
}
