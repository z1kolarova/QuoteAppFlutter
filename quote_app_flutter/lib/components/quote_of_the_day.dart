import 'package:flutter/cupertino.dart';
import 'package:quote_app_flutter/model/quote.dart';
import 'package:quote_app_flutter/model/zen_quotes_api_client.dart';

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
        child: FutureBuilder<Quote>(
          future: quote,
          builder: (BuildContext context, AsyncSnapshot<Quote> snapshot) {
            String quoteText;
            String author;
            if (snapshot.hasData) {
              quoteText = snapshot.data!.text;
              author = snapshot.data!.author;
            } else if (snapshot.hasError) {
              quoteText =
                  'There was an error getting the quote of the day, sorry about that.';
              author = 'Quote App';
            } else {
              quoteText = 'I am fetching the quote of the day for you!';
              author = 'Quote App';
            }
            return columnWithQuoteTextAndAuthor(quoteText, author);
          },
        ));
  }

  Column columnWithQuoteTextAndAuthor(String quote, String author) {
    return Column(children: [
      Text(quote,
          textScaleFactor: 2, textAlign: TextAlign.center, style: quoteStyle()),
      Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(top: 15, right: 10),
          child: Text('- $author', textScaleFactor: 1.5, style: authorStyle()))
    ]);
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
