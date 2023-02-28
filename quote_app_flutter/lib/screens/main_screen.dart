import 'package:flutter/material.dart';
import 'package:quote_app_flutter/db/quote_record.dart';
import 'package:quote_app_flutter/screens/all_quotes_screen.dart';
import 'package:quote_app_flutter/screens/components/quote_of_the_day.dart';
import 'package:quote_app_flutter/styles/styles.dart';

import '../db/quotes_repository.dart';

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

  saveQuoteOfTheDayToDB() {
    QuotesRepository.insertQuote(QuoteRecord(id: 0, text: 'This is a fake quote of the day.', author: 'me'));
  }

  switchToAllQuotesListView() {
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => const AllQuotesScreen())
    );
  }
}
