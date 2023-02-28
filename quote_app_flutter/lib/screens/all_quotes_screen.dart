import 'package:flutter/material.dart';
import 'package:quote_app_flutter/db/quotes_repository.dart';
import 'package:quote_app_flutter/model/quote.dart';
import 'package:quote_app_flutter/screens/components/all_quotes_listview.dart';
import 'package:quote_app_flutter/styles/styles.dart';

import '../db/quote_record.dart';

class AllQuotesScreen extends StatefulWidget {
  const AllQuotesScreen({super.key});

  @override
  State<StatefulWidget> createState() => AllQuotesScreenState();
}

class AllQuotesScreenState extends State<AllQuotesScreen> {

  final Future<List<QuoteRecord>> quotes = QuotesRepository.getAllQuotes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All saved quotes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: FutureBuilder<List<QuoteRecord>>(
              future: quotes,
              builder: (BuildContext context, AsyncSnapshot<List<QuoteRecord>> snapshot) {
                if (snapshot.hasData) {
                  return AllQuotesListView(items: snapshot.data!);
                }
                return const AllQuotesListView(items: <QuoteRecord>[]);
              },
          )),// AllQuotesListView(items: await quotes)),
          buildMenuButton('Add new quote', () {})
        ],
      ),
    );
  }


  static List<Quote> list = <Quote>[
    Quote('Text 1', 'Author 1'),
    Quote('Text 2', 'Author 2'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author'),
    Quote('Text', 'Author')
  ];

  Widget buildMenuButton(String text, void Function()? onPressed) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: TextButton(
            onPressed: onPressed,
            style: MyStyles.defaultButtonStyle(),
            child: Text(text, textScaleFactor: 2)));
  }
}
