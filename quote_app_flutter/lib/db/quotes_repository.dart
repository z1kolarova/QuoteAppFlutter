import 'package:quote_app_flutter/db/quote_record.dart';
import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class QuotesRepository {
  static Future<void> insertQuote(QuoteRecord quoteRecord) async {
    final db = await DBHelper.instance.database;
    await db.insert(
      'quotes',
      quoteRecord.toMapWithoutID(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  static Future<List<QuoteRecord>> getAllQuotes() async {
    final db = await DBHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('quotes');
    return List.generate(maps.length, (i) {
      return QuoteRecord(
        id: maps[i]['id'],
        text: maps[i]['text'],
        author: maps[i]['author'],
      );
    });
  }

  static Future<void> updateQuote(QuoteRecord quoteRecord) async {
    final db = await DBHelper.instance.database;
    await db.update('quotes', quoteRecord.toMapWithID(),
        where: 'id = ?', whereArgs: [quoteRecord.id]);
  }

  static Future<void> deleteQuote(int id) async {
    final db = await DBHelper.instance.database;
    await db.delete('quotes', where: 'id = ?', whereArgs: [id]);
  }
}
