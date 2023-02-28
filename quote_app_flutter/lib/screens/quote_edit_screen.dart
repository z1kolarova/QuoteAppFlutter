import 'package:flutter/material.dart';
import 'package:quote_app_flutter/screens/components/quote_editing_form.dart';
import 'package:quote_app_flutter/styles/styles.dart';

class QuoteEditScreen extends StatefulWidget {
  const QuoteEditScreen({super.key});

  @override
  State<StatefulWidget> createState() => QuoteEditScreenState();
}

class QuoteEditScreenState extends State<QuoteEditScreen> {
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
            child: QuoteEditingForm(),
          ),
          buildMenuButton('Save', () {}),
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
}
