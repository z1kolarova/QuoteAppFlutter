import 'package:flutter/material.dart';
import 'package:quote_app_flutter/db/quote_record.dart';
import 'package:quote_app_flutter/screens/all_quotes_screen.dart';
import 'package:quote_app_flutter/screens/components/quote_of_the_day.dart';
import 'package:quote_app_flutter/styles/styles.dart';

import '../db/quotes_repository.dart';
import '../model/quote.dart';
import '../model/zen_quotes_api_client.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

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
            const QuoteOfTheDay(),
            buildMenuButton('Save quote of the day', saveQuoteOfTheDayToDB ),
            buildMenuButton('View all quotes', switchToAllQuotesListView ),
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
            style: MyStyles.defaultButtonStyle(),
            child: Text(text, textScaleFactor: 2)));
  }

  saveQuoteOfTheDayToDB() async {
    Quote quote = await ZenQuotesAPIClient.fetchQuoteOfTheDay();
    QuotesRepository.insertQuote(QuoteRecord(id: 0, text: quote.text, author: quote.author));
  }

  switchToAllQuotesListView() {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const AllQuotesScreen())
    );
  }
}
