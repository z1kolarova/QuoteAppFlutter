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
            buildQuoteOfTheDayTexts(
                'Today is the first day of your future.', 'Unknown'),
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

  Widget buildQuoteOfTheDayTexts(String quote, String author) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(15),
        color: Color(0xFFC0F0F7),
        child: Column(children: [
          Text(quote,
              textScaleFactor: 3,
              textAlign: TextAlign.center,
              style: quoteStyle()),
          Container(
              alignment: Alignment.centerRight,
              child: Text('- ' + author,
                  textScaleFactor: 2.5,
                  textAlign: TextAlign.right,
                  style: authorStyle()))
        ]));
  }

  ButtonStyle? myButtonStyle() {
    return TextButton.styleFrom(
        backgroundColor: const Color(0xFF10609D),
        foregroundColor: const Color(0xFFC0F0F7));
  }

  TextStyle? quoteStyle() {
    return const TextStyle(color: const Color(0xFF10609D), fontFamily: "Sans");
  }

  TextStyle? authorStyle() {
    return const TextStyle(
        color: const Color(0xFF10609D),
        fontFamily: "Sans",
        fontStyle: FontStyle.italic);
  }
}
