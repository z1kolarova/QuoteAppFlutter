import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuoteOfTheDayWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QuoteOfTheDayWidgetState();
}

class QuoteOfTheDayWidgetState extends State<QuoteOfTheDayWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote of the day'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Quote of the day',
            ),
            const Text(
              '- Author',
            ),
            buildMenuButton('Save quote of the day', () {}),
            buildMenuButton('View all quotes', () {}),
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
