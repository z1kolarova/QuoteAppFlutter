import 'dart:convert';

import 'package:quote_app_flutter/quote.dart';
import 'package:http/http.dart' as http;

class ZenQuotesAPIClient {
  static const String url = 'https://zenquotes.io?api=today';

  static Future<Quote> fetchQuoteOfTheDay() async {
    final response = await http.get(Uri.parse(url));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
    return Quote.fromMap(decodedResponse[0]);
  }
}