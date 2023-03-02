import 'package:flutter/material.dart';

class QuoteEditingForm extends StatefulWidget {
  const QuoteEditingForm({super.key});

  @override
  State<StatefulWidget> createState() => QuoteEditingFormState();
}

class QuoteEditingFormState extends State<QuoteEditingForm> {
  late TextEditingController quoteController;
  late TextEditingController authorController;

  @override
  void initState() {
    super.initState();
    quoteController = TextEditingController();
    authorController = TextEditingController();
  }

  @override
  void dispose() {
    authorController.dispose();
    quoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 15),
              alignment: Alignment.centerLeft,
              child: Text('Quote:', textScaleFactor: 2)
            ),
            TextField(
              controller: quoteController,
              decoration: const InputDecoration(
                  hintText: 'Quote',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3))),
            ),
            Container(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                alignment: Alignment.centerLeft,
                child: Text('Author:', textScaleFactor: 2)
            ),
            TextField(
              controller: authorController,
              decoration: const InputDecoration(
                  hintText: 'Author',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3))),
            ),
          ],
        ));
  }
}
