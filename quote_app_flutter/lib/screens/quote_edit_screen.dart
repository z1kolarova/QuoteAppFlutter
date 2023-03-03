import 'package:flutter/material.dart';
import 'package:quote_app_flutter/styles/styles.dart';

import '../db/quote_record.dart';
import '../db/quotes_repository.dart';

class QuoteEditScreen extends StatefulWidget {
  final QuoteRecord? qr;
  const QuoteEditScreen(this.qr, {super.key});

  @override
  State<StatefulWidget> createState() => QuoteEditScreenState();
}

class QuoteEditScreenState extends State<QuoteEditScreen> {
  late TextEditingController quoteController;
  late TextEditingController authorController;

  @override
  void initState() {
    super.initState();
    quoteController = TextEditingController();
    quoteController.text = widget.qr?.text ?? '';
    authorController = TextEditingController();
    authorController.text = widget.qr?.author ?? '';
  }

  @override
  void dispose() {
    authorController.dispose();
    quoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        alignment: Alignment.centerLeft,
                        child: const Text('Quote:', textScaleFactor: 2)
                    ),
                    TextFormField(
                      controller: quoteController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the text of the quote';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Quote',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3))),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        alignment: Alignment.centerLeft,
                        child: const Text('Author:', textScaleFactor: 2)
                    ),
                    TextFormField(
                      controller: authorController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the author of the quote';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Author',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 3))),
                    ),
                  ],
                )),
          ),
          buildMenuButton('Save', saveQuoteToDB),
        ],
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

  void saveQuoteToDB() async {
    QuoteRecord newQuote = QuoteRecord(id: widget.qr?.id ?? 0, text: quoteController.text, author: authorController.text);
    if(widget.qr != null) {
      await QuotesRepository.updateQuote(newQuote);
    }
    else {
      int newId = await QuotesRepository.insertQuote(newQuote);
      newQuote.id = newId;
    }
    Navigator.pop(context, newQuote);
  }
}
