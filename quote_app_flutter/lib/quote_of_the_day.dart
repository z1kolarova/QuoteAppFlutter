import 'package:flutter/cupertino.dart';
import 'package:quote_app_flutter/quote.dart';
import 'package:quote_app_flutter/zen_quotes_api_client.dart';

class QuoteOfTheDay extends StatefulWidget {
  const QuoteOfTheDay({super.key});

  @override
  State<StatefulWidget> createState() => QuoteOfTheDayState();
}

class QuoteOfTheDayState extends State<QuoteOfTheDay> {
  final Future<Quote> quote = ZenQuotesAPIClient.fetchQuoteOfTheDay();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        color: const Color(0xFFC0F0F7),
        child: Column(children: [
          Text('Today is the first day of your future.',
              textScaleFactor: 2.5,
              textAlign: TextAlign.center,
              style: quoteStyle()),
          Container(
              alignment: Alignment.centerRight,
              child: Text('- Unknown',
                  textScaleFactor: 2,
                  style: authorStyle()))
        ]));
  }

  TextStyle? quoteStyle() {
    return const TextStyle(color: Color(0xFF10609D), fontFamily: "Sans");
  }

  TextStyle? authorStyle() {
    return const TextStyle(
        color: Color(0xFF10609D),
        fontFamily: "Sans",
        fontStyle: FontStyle.italic);
  }
}
