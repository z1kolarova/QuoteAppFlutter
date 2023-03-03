import 'package:flutter/material.dart';
import 'package:quote_app_flutter/db/quote_record.dart';

import '../../db/quotes_repository.dart';
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
          Row(
            children: [
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

  void deleteTheQuote(int index) {
    QuotesRepository.deleteQuote(items[index].id);
  }
}
