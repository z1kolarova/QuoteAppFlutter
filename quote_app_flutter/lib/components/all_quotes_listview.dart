import 'package:flutter/material.dart';
import 'package:quote_app_flutter/quote.dart';

class AllQuotesListView extends StatelessWidget {
  final List<Quote> items;

  const AllQuotesListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].text),
          );
        });
  }
}
