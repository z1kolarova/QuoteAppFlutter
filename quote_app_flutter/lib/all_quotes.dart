import 'package:flutter/material.dart';
import 'package:quote_app_flutter/components/all_quotes_listview.dart';
import 'package:quote_app_flutter/quote.dart';

class AllQuotesScreen extends StatefulWidget {
  const AllQuotesScreen({super.key});

  @override
  State<StatefulWidget> createState() => AllQuotesScreenState();
}

class AllQuotesScreenState extends State<AllQuotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All saved quotes'),
      ),
      body:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child:
            AllQuotesListView(items: list)),
            buildMenuButton('Add new quote', () {})
          ],
        ),
    );
  }

  static List<Quote> list = <Quote>[
    Quote('Text 1','Author 1'),
    Quote('Text 2','Author 2'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author'),
    Quote('Text','Author')
  ];

  Widget buildMenuButton(String text, void Function()? onPressed) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: TextButton(
            onPressed: onPressed,
            style: myButtonStyle(),
            child: Text(text, textScaleFactor: 2)));
  }

  ButtonStyle? myButtonStyle() {
    return TextButton.styleFrom(
        backgroundColor: const Color(0xFF10609D),
        foregroundColor: const Color(0xFFC0F0F7));
  }
}
