import 'package:flutter/material.dart';
import 'package:quote_app_flutter/db/quotes_repository.dart';
import 'package:quote_app_flutter/screens/quote_edit_screen.dart';
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
          Expanded(
              child: FutureBuilder<List<QuoteRecord>>(
            future: quotes,
            builder: (BuildContext context,
                AsyncSnapshot<List<QuoteRecord>> snapshot) {
              if (snapshot.hasData) {
                return buildAllQuotesListView(snapshot.data!);
              }
              return buildAllQuotesListView(<QuoteRecord>[]);
            },
          )), // AllQuotesListView(items: await quotes)),
          buildMenuButton('Add new quote', switchToQuoteEditingScreen)
        ],
      ),
    );
  }

  Widget buildAllQuotesListView(List<QuoteRecord> items) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: Text(items[index].text,
                textScaleFactor: 1.5,
                textAlign: TextAlign.left,
                style: MyStyles.quoteStyle()),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 10),
                child: TextButton(
                    onPressed: () => switchToQuoteEditingScreenWithQuote(index, items[index]),
                    style: MyStyles.defaultButtonStyle(),
                    child: const Text('Edit', textScaleFactor: 1.3)),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextButton(
                    onPressed: () => deleteTheQuote(index),
                    style: MyStyles.defaultButtonStyle(),
                    child: const Text('Delete', textScaleFactor: 1.3)),
              ),
              Flexible(
                  child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('- ${items[index].author}',
                          textScaleFactor: 1.3, style: MyStyles.authorStyle())))
            ],
          )
        ]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  void deleteTheQuote(int index) async {
    quotes.then((actualQuotes) async {
      await QuotesRepository.deleteQuote(actualQuotes[index].id);
      setState(() {
        actualQuotes.removeAt(index);
      });
    });
  }

  Widget buildMenuButton(String text, void Function()? onPressed) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: TextButton(
            onPressed: onPressed,
            style: MyStyles.defaultButtonStyle(),
            child: Text(text, textScaleFactor: 2)));
  }

  switchToQuoteEditingScreen() {
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => const QuoteEditScreen(null)))
        .then((newQuote) {
      quotes.then((actualQuotes) {
        setState(() {
          actualQuotes.add(newQuote);
        });
      });
    });
  }

  switchToQuoteEditingScreenWithQuote(int index, QuoteRecord quote) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuoteEditScreen(quote)))
        .then((newQuote) {
      quotes.then((actualQuotes) {
        setState(() {
          actualQuotes.replaceRange(index, index + 1, <QuoteRecord> [newQuote]);
        });
      });
    });
  }
}
