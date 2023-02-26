import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_app_flutter/quote_of_the_day.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
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
            QuoteOfTheDay(),
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
            style: myButtonStyle(),
            child: Text(text, textScaleFactor: 2)));
  }

  ButtonStyle? myButtonStyle() {
    return TextButton.styleFrom(
        backgroundColor: const Color(0xFF10609D),
        foregroundColor: const Color(0xFFC0F0F7));
  }
}
