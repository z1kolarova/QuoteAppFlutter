import 'package:flutter/material.dart';
import 'package:quote_app_flutter/quote_of_the_day.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFC0F0F7)
      ),
      home: QuoteOfTheDayWidget(),
    );
  }
}
