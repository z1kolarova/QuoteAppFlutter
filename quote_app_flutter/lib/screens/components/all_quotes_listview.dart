import 'package:flutter/material.dart';
import 'package:quote_app_flutter/db/quote_record.dart';

import '../../styles/styles.dart';

class AllQuotesListView extends StatelessWidget {
  final List<QuoteRecord> items;

  const AllQuotesListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
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
          Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 15, right: 10),
              child: Text('- ${items[index].author}',
                  textScaleFactor: 1.3, style: MyStyles.authorStyle()))
        ]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
