import 'package:flutter/material.dart';
import 'package:quote_app_flutter/db/quote_record.dart';

class AllQuotesListView extends StatelessWidget {
  final List<QuoteRecord> items;

  const AllQuotesListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
            height: 50,
            child: Center(
                child: Text('${items[index].text} - ${items[index].author}')));
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
